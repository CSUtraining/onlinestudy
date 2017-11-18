package com.leon.onlinestudy.portal.controller;

import com.leon.onlinestudy.portal.business.IPortalBusiness;
import com.leon.onlinestudy.portal.vo.ConstsClassifyVO;
import com.leon.onlinestudy.common.page.TailPage;
import com.leon.onlinestudy.service.core.consts.CourseEnum;
import com.leon.onlinestudy.service.core.consts.domain.ConstsClassify;
import com.leon.onlinestudy.service.core.consts.service.IConstsClassifyService;
import com.leon.onlinestudy.service.core.course.domain.Course;
import com.leon.onlinestudy.service.core.course.service.ICourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 课程分类页
 */

@Controller
@RequestMapping("/course")
public class CourseListController {
	
	@Autowired
	private IConstsClassifyService constsClassifyService;
	
	@Autowired
	private IPortalBusiness portalBusiness;
	
	@Autowired
	private ICourseService courseService;
	
	/**
	 * 课程分类页
	 * @param c 分类码
	 * @param sort 排序
	 * @param page 分页
	 */
	@RequestMapping("/list")
	public ModelAndView list(String c, String sort, TailPage<Course> page){
		ModelAndView mv = new ModelAndView("list");
		String curCode = "-1";//设置一级分类码默认-1为全部
		String curSubCode = "-2";//设置二级分类码默认-2为全部
		
		//加载所有课程分类
		Map<String,ConstsClassifyVO> classifyMap = portalBusiness.queryAllClassifyMap();
		//所有一级分类
		List<ConstsClassifyVO> classifysList = new ArrayList<ConstsClassifyVO>();
		for(ConstsClassifyVO vo : classifyMap.values()){
			classifysList.add(vo);
		}
		mv.addObject("classifys", classifysList);
				
		//当前分类
		ConstsClassify curClassify = constsClassifyService.getByCode(c);
		
		if(null == curClassify){//没有此分类，加载所有分类包括所有一级分类和二级分类
			List<ConstsClassify> subClassifys = new ArrayList<ConstsClassify>();
			for(ConstsClassifyVO vo : classifyMap.values()){
				subClassifys.addAll(vo.getSubClassifyList());
			}
			mv.addObject("subClassifys", subClassifys);
		}else{
			if(!"0".equals(curClassify.getParentCode())){// ParentCode 不等于0 当前是二级分类
				curSubCode = curClassify.getCode();
				curCode = curClassify.getParentCode();
				mv.addObject("subClassifys", classifyMap.get(curClassify.getParentCode()).getSubClassifyList());//此分类平级的二级分类
			}else{// ParentCode 等于0 当前是一级分类
				curCode = curClassify.getCode();
				mv.addObject("subClassifys", classifyMap.get(curClassify.getCode()).getSubClassifyList());//此分类下的二级分类
			}
		}
		mv.addObject("curCode", curCode);
		mv.addObject("curSubCode", curSubCode);
		
		//分页排序数据
		//分页的分类参数
		Course queryEntity = new Course();
		if(!"-1".equals(curCode)){
			queryEntity.setClassify(curCode);
		}
		if(!"-2".equals(curSubCode)){
			queryEntity.setSubClassify(curSubCode);
		}
		
		//排序参数
		if("pop".equals(sort)){//最热
			page.descSortField("studyCount");
		}else{
			sort = "last";
			page.descSortField("id");
		}
		mv.addObject("sort", sort);
		
		//分页参数
		queryEntity.setOnsale(CourseEnum.ONSALE.value());
		page = this.courseService.queryPage(queryEntity, page);
		mv.addObject("page", page);
		return mv;
	}
}
