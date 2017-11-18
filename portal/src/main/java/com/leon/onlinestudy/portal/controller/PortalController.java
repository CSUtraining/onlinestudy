package com.leon.onlinestudy.portal.controller;

import com.leon.onlinestudy.portal.vo.ConstsClassifyVO;
import com.leon.onlinestudy.portal.business.IPortalBusiness;
import com.leon.onlinestudy.service.core.auth.domain.AuthUser;
import com.leon.onlinestudy.service.core.auth.service.IAuthUserService;
import com.leon.onlinestudy.service.core.consts.CourseEnum;
import com.leon.onlinestudy.service.core.consts.domain.ConstsSiteCarousel;
import com.leon.onlinestudy.service.core.consts.service.IConstsSiteCarouselService;
import com.leon.onlinestudy.service.core.course.domain.Course;
import com.leon.onlinestudy.service.core.course.domain.CourseQueryDto;
import com.leon.onlinestudy.service.core.course.service.ICourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * 网站主页
 */
@Controller
@RequestMapping()
public class PortalController {
	
	@Autowired
	private IPortalBusiness portalBusiness;
	
	@Autowired
	private IConstsSiteCarouselService siteCarouselService;
	
	@Autowired
	private ICourseService courseService;
	
	@Autowired
	private IAuthUserService authUserService;
	
	
	/**
	 * 首页
	 */
	@RequestMapping("/index")
	public ModelAndView index(){

		ModelAndView mv = new ModelAndView("index");
		
		//加载轮播
		List<ConstsSiteCarousel> carouselList = siteCarouselService.queryCarousels(4);
		mv.addObject("carouselList", carouselList);
		
		//课程分类(一级分类）
		List<ConstsClassifyVO> classifys = portalBusiness.queryAllClassify();
		
		//课程推荐（根据weight）
		portalBusiness.prepareRecomdCourses(classifys);
		mv.addObject("classifys", classifys);
		
		
		//获取5门实战课推荐，在收费课程中根据权重（weight）进行排序
		CourseQueryDto queryEntity = new CourseQueryDto();
		queryEntity.setCount(5);//5门
		queryEntity.setFree(CourseEnum.FREE_NOT.value());//非免费的：实战课
		queryEntity.descSortField("weight");//按照weight降序排列

		List<Course> actionCourseList = this.courseService.queryList(queryEntity);
		mv.addObject("actionCourseList", actionCourseList);
		
		//获取5门免费课推荐，在免费课程中根据权重（weight）进行排序
		queryEntity.setFree(CourseEnum.FREE.value());//非免费的：实战课
		List<Course> freeCourseList = this.courseService.queryList(queryEntity);
		mv.addObject("freeCourseList", freeCourseList);
		
		//获取7门java课程，根据权重（学习数量studyCount）进行排序
		queryEntity.setCount(7);
		queryEntity.setFree(null);//不分实战和免费类别
		queryEntity.setSubClassify("java");//java分类
		queryEntity.descSortField("studyCount");//按照studyCount降序排列
		List<Course> javaCourseList = this.courseService.queryList(queryEntity);
		mv.addObject("javaCourseList", javaCourseList);
		
		//加载讲师
		List<AuthUser> recomdTeacherList = authUserService.queryRecomd();
		mv.addObject("recomdTeacherList", recomdTeacherList);
		
		return mv;
	}
}

