package com.leon.onlinestudy.service.core.user.service;

import java.util.List;
import com.leon.onlinestudy.common.page.TailPage;
import com.leon.onlinestudy.service.core.user.domain.UserCollections;


public interface IUserCollectionsService {

	/**
	*根据id获取
	**/
	public UserCollections getById(Long id);

	/**
	*获取所有
	**/
	public List<UserCollections> queryAll(UserCollections queryEntity);

	/**
	*分页获取
	**/
	public TailPage<UserCollections> queryPage(UserCollections queryEntity ,TailPage<UserCollections> page);

	/**
	*创建
	**/
	public void createSelectivity(UserCollections entity);

	/**
	*根据id更新
	**/
	public void update(UserCollections entity);

	/**
	*根据id 进行可选性更新
	**/
	public void updateSelectivity(UserCollections entity);

	/**
	*物理删除
	**/
	public void delete(UserCollections entity);

	/**
	*逻辑删除
	**/
	public void deleteLogic(UserCollections entity);



}

