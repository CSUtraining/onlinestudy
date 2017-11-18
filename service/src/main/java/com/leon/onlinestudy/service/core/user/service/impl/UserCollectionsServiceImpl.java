package com.leon.onlinestudy.service.core.user.service.impl;

import java.util.List;

import com.leon.onlinestudy.service.core.user.dao.UserCollectionsDao;
import com.leon.onlinestudy.service.core.user.domain.UserCollections;
import com.leon.onlinestudy.service.core.user.service.IUserCollectionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.leon.onlinestudy.common.page.TailPage;


@Service
public class UserCollectionsServiceImpl implements IUserCollectionsService {

	@Autowired
	private UserCollectionsDao entityDao;

	public UserCollections getById(Long id){
		return entityDao.getById(id);
	}

	public List<UserCollections> queryAll(UserCollections queryEntity){
		return entityDao.queryAll(queryEntity);
	}

	public TailPage<UserCollections> queryPage(UserCollections queryEntity ,TailPage<UserCollections> page){
		Integer itemsTotalCount = entityDao.getTotalItemsCount(queryEntity);
		List<UserCollections> items = entityDao.queryPage(queryEntity,page);
		page.setItemsTotalCount(itemsTotalCount);
		page.setItems(items);
		return page;
	}

	public void createSelectivity(UserCollections entity){
		entityDao.createSelectivity(entity);
	}

	public void update(UserCollections entity){
		entityDao.update(entity);
	}

	public void updateSelectivity(UserCollections entity){
		entityDao.updateSelectivity(entity);
	}

	public void delete(UserCollections entity){
		entityDao.delete(entity);
	}

	public void deleteLogic(UserCollections entity){
		entityDao.deleteLogic(entity);
	}



}

