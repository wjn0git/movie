package com.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.app.bean.Movies;
import com.app.bean.News;
import com.app.bean.Ticket;
import com.app.service.MoviesService;
import com.app.service.NewsService;
import com.app.util.Consts;
import com.github.pagehelper.PageHelper;

/**
 * 前端页面
 */
@Controller
@RequestMapping("/front")
public class IndexController {
	
	@Autowired
	private MoviesService moviesService;
	
	@Autowired
	private NewsService newsService;
	
	/**
	 * 首页
	 */
	@RequestMapping("/index")
	public ModelAndView index(String movieName) {
		ModelAndView mav = new ModelAndView();
		PageHelper.startPage(1, 10);
		//正在热映
		List<Movies> list = moviesService.zzrqList(movieName);
		mav.addObject("movieList", list);
		aside(mav);
		
		mav.setViewName("front/index.jsp");
		return mav;
	}
	
	/**
	 * 搜索结果
	 */
	@RequestMapping("/result")
	public ModelAndView result(HttpServletRequest request) {
		String moviename = request.getParameter("moviename");
		ModelAndView mav = new ModelAndView();
		PageHelper.startPage(1, 10);
		//正在热映
		List<Movies> list = moviesService.queryListByMoviename(moviename);
		mav.addObject("movieList", list);
		aside(mav);	
		mav.setViewName("front/result.jsp");
		return mav;
	}


	/**
	 * 注册用户退出
	 */
	@RequestMapping("/userLogout")
	public ModelAndView userLogout(HttpServletRequest request) {
		request.getSession().removeAttribute(Consts.CURRENT_USER);
		return index("");
	}
	
	/**
	 * 电影详情
	 */
	@RequestMapping("/detail")
	public ModelAndView detail(String id) {
		ModelAndView mav = new ModelAndView();
		Movies movies = moviesService.getById(id);
		mav.addObject("movies", movies);
		List<Ticket> tickets = moviesService.getTicketsByMovieid(id);
		mav.addObject("tickets", tickets);
		
		
		
		mav.setViewName("front/detail.jsp");
		return mav;
	}

	
	private void aside(ModelAndView mav) {
		//最受期待
		mav.addObject("zsqd", moviesService.listByType("zsqd"));
		//好评如潮
		mav.addObject("hprc", moviesService.listByType("hprc"));
		//今日票房
		mav.addObject("jrpf", moviesService.listByType("jrpf"));
		//最新的三条新闻
		List<News> newsList = newsService.latest3News();
		mav.addObject("newsList", newsList);
	}
	
	/**
	 * 新闻详情
	 * id:新闻id
	 */
	@RequestMapping("/detailNews")
	public ModelAndView detailNews(String id) {
		ModelAndView mav = new ModelAndView();
		News news = newsService.getById(id);
		mav.addObject("news", news);		
		aside(mav);		
		mav.setViewName("front/detailNews.jsp");
		return mav;
	}

}
