package com.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.bean.Users;
import com.app.bean.UsersExample;
import com.app.bean.UsersExample.Criteria;
import com.app.core.ReturnVoCommon;
import com.app.mapper.UsersMapper;
import com.app.util.Consts;
import com.app.util.StringUtilsEx;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 用户controller
 *
 */
@Controller
@RequestMapping("/users")
public class UsersController {
	@Autowired
	private UsersMapper usersMapper;

	/**
	 * 登录
	 */
	@RequestMapping("/login")
	@ResponseBody
	public ReturnVoCommon login(Users users,HttpServletRequest request) {
		
		ReturnVoCommon vo = new ReturnVoCommon();
		
		/**
		 * Mybatis中Mapper内置方法
		 * 相当于sql语句
		 */
		UsersExample example = new UsersExample();
		Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(users.getName());
		criteria.andPasswordEqualTo(users.getPassword());
		criteria.andAuthEqualTo(users.getAuth());
		//根据条件查询,返回的是一个list
		List<Users> list = usersMapper.selectByExample(example);
		if(list==null||list.size()==0) {
			vo.setCode(-1);
			vo.setErrMsg("用户名或密码错误！");
			return vo;
		}
		
		if(users.getAuth().equals("注册用户")) {
			vo.setCode(1);
			/**
			 *  request.getSession().setAttribute(Consts.CURRENT_USER, list.get(0))
			 *  把list.get(0)返回值保存到session当前会话中，名称为Consts.CURRENT_USER="currentUser"，
			 *  只要当前会话不过期， 任何地方都可以访问到

			 */
			request.getSession().setAttribute(Consts.CURRENT_USER, list.get(0));
		}else {				//管理员员
			vo.setCode(2);
			request.getSession().setAttribute(Consts.ADMIN_USER, list.get(0));
		}
		
		return vo;
	}
	
	
	/**
	 * 注册
	 */
	@RequestMapping("/reg")
	@ResponseBody
	public ReturnVoCommon reg(Users users,HttpServletRequest request) {
		ReturnVoCommon vo = new ReturnVoCommon();
		UsersExample example = new UsersExample();
		Criteria criteria = example.createCriteria();
		
		//查询是否已存在用户名
		criteria.andNameEqualTo(users.getName());
		List<Users> list = usersMapper.selectByExample(example);
		if(list!=null&&list.size()>0) {
			vo.setCode(-1);
			vo.setErrMsg("用户名已存在！");
			return vo;
		}
		users.setAuth("注册用户");
		usersMapper.insert(users);
		return vo;
	}
	
	/**
	 * 管理员退出
	 */
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		request.getSession().removeAttribute(Consts.ADMIN_USER);
		//定位到登录界面
		mav.setViewName("front/login.jsp");
		return mav;
	}
		
	/**
	 * 注册用户列表，带翻页功能
	 * page:当前第几页
	 * rows：每页大小
	 */
	@RequestMapping("/list")
	@ResponseBody
	public Map<String,Object> list(Integer page,Integer rows){
		Map<String,Object> map = new HashMap<>();
		if(StringUtilsEx.isEmpty(page)) {
			page = 1;
		}
		if(StringUtilsEx.isEmpty(rows)) {
			rows = 5;
		}
		/*
		 * pagehelper是mybatis 提供的分页插件
		 */
		PageHelper.startPage(page, rows);
		List<Users> list = usersMapper.selectByExample(new UsersExample());
		map.put("rows", list);
		PageInfo<Users> pageInfo = new PageInfo<Users>(list);
		//总记录数
		map.put("total",pageInfo.getTotal());
		return map;
	}
	
	/**
	 * 删除一个用户
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public ReturnVoCommon delete(String id) {
		ReturnVoCommon vo = new ReturnVoCommon();
		vo.setCode(0);
		try {
			usersMapper.deleteByPrimaryKey(Integer.parseInt(id));
		}catch(Exception e) {
			vo.setCode(-1);
			vo.setErrMsg("删除失败!");
		}		
		return vo;
	}
	
}




















