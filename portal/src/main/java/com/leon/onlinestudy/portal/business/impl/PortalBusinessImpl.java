package com.leon.onlinestudy.portal.business.impl;

import com.leon.onlinestudy.portal.business.IPortalBusiness;
import com.leon.onlinestudy.portal.vo.ConstsClassifyVO;
import com.leon.onlinestudy.service.core.consts.domain.ConstsClassify;
import com.leon.onlinestudy.service.core.consts.service.IConstsClassifyService;
import com.leon.onlinestudy.service.core.course.domain.Course;
import com.leon.onlinestudy.service.core.course.domain.CourseQueryDto;
import com.leon.onlinestudy.service.core.course.service.ICourseService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * 首页业务层
 */
@Service
public class PortalBusinessImpl implements IPortalBusiness {
	
	@Autowired
	private IConstsClassifyService constsClassifyService;
	
	@Autowired
	private ICourseService courseService;

	/**
	 * 获取所有，包括一级分类&二级分类
	 */
	public List<ConstsClassifyVO> queryAllClassify(){
		List<ConstsClassifyVO> resultList = new ArrayList<ConstsClassifyVO>();
		for(ConstsClassifyVO vo : this.queryAllClassifyMap().values()){
			resultList.add(vo);
		}
		return resultList;
	}
	
	/**
	 * 获取所有分类
	 */
	public Map<String,ConstsClassifyVO> queryAllClassifyMap(){
		Map<String,ConstsClassifyVO> resultMap = new LinkedHashMap<String,ConstsClassifyVO>();
		Iterator<ConstsClassify> it = constsClassifyService.queryAll().iterator();
		while(it.hasNext()){
			ConstsClassify c = it.next();
			if("0".equals(c.getParentCode())){//一级分类
				ConstsClassifyVO vo = new ConstsClassifyVO();
				//将domain c放到vo里
				BeanUtils.copyProperties(c, vo);
				resultMap.put(vo.getCode(), vo);
			}else{//二级分类
				if(null != resultMap.get(c.getParentCode())){
				    //遍历进来的都是父id不为0的二级分类，将这些二级分类添加到父ID的resultmap中的SubClassifyList中
					resultMap.get(c.getParentCode()).getSubClassifyList().add(c);
				}
			}
		}
		return resultMap;
	}
	
	/**
	 * 为分类设置课程推荐
	 */
	public void prepareRecomdCourses(List<ConstsClassifyVO> classifyVoList){
		if(CollectionUtils.isNotEmpty(classifyVoList)){
			for(ConstsClassifyVO item : classifyVoList){
				CourseQueryDto queryEntity = new CourseQueryDto();
				queryEntity.setCount(5);
				queryEntity.descSortField("weight");
				queryEntity.setClassify(item.getCode());//分类code
				
				List<Course> tmpList = this.courseService.queryList(queryEntity);
				if(CollectionUtils.isNotEmpty(tmpList)){
					item.setRecomdCourseList(tmpList);
				}
			}
		}
	}
	
}
