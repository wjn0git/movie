package com.app.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.bean.Movies;
import com.app.bean.MoviesExample;
import com.app.bean.Orders;
import com.app.bean.OrdersExample;
import com.app.bean.MoviesExample.Criteria;

import com.app.bean.Ticket;
import com.app.bean.TicketExample;
import com.app.mapper.MoviesMapper;
import com.app.mapper.OrdersMapper;
import com.app.mapper.TicketMapper;
import com.app.util.StringUtilsEx;
import com.github.pagehelper.PageHelper;

/**
 * 电影service
 *
 */
@Service
public class MoviesService {
	@Autowired
	private MoviesMapper mapper;
	
	@Autowired
	private TicketMapper ticketMapper;
	
	@Autowired
	private OrdersMapper ordersMapper;
	
	/**
	 * 根据电影名称模糊查询电影列表
	 */
	public List<Movies> list(String movieName){
		MoviesExample ex = new MoviesExample();
		ex.setOrderByClause("id desc");
		Criteria cr = ex.createCriteria();
		if(StringUtilsEx.isNotEmpty(movieName)) {
			cr.andMovienameLike("%"+movieName+"%");
		}
		return mapper.selectByExample(ex);
	}
	
	/**
	 * 根据电影名称模糊查询正在热映的电影列表
	 */
	public List<Movies> zzrqList(String movieName){
		MoviesExample ex = new MoviesExample();
		
		////指定排序规则，参数1是数据库中的列名，参数二是排序规格，ASC升序，DESC降序，多个条件用逗号分隔
		ex.setOrderByClause("id desc");
		Criteria cr = ex.createCriteria();
		if(StringUtilsEx.isNotEmpty(movieName)) {
			cr.andMovienameLike("%"+movieName+"%");
		}
		cr.andIszsqdIsNull();
		return mapper.selectByExample(ex);
	}
	
	/**
	 * 根据电影名称模糊查询电影列表
	 */
	public List<Movies> queryListByMoviename(String movieName){
		MoviesExample ex = new MoviesExample();
		ex.setOrderByClause("id desc");
		Criteria cr = ex.createCriteria();
		if(StringUtilsEx.isNotEmpty(movieName)) {
			cr.andMovienameLike("%"+movieName+"%");
		}
		return mapper.selectByExample(ex);
	}
	
	/**
	 * 根据电影名称模糊查询订单列表
	 */
	public List<Orders> queryOrdersByMoviesname(String moviename )
	{ 
		
		OrdersExample example = new OrdersExample();
		example.setOrderByClause("createdate desc");
		com.app.bean.OrdersExample.Criteria cr = example.createCriteria();
		if(StringUtilsEx.isNotEmpty(moviename)) {
			cr.andMovienameLike("%"+moviename+"%");
		}
		return ordersMapper.selectByExample(example);
	}
	
	/**
	 * 根据类型查询电影列表
	 */
	public List<Movies> listByType(String type){
		PageHelper.startPage(1, 10);
		MoviesExample ex = new MoviesExample();
		ex.setOrderByClause("id desc");
		Criteria cr = ex.createCriteria();
		if(type.contentEquals("zsqd")) {
			cr.andIszsqdEqualTo("1");
		}else if(type.contentEquals("hprc")) {
			PageHelper.startPage(1, 3);
			cr.andIshprcEqualTo("1");
		}else if(type.contentEquals("jrpf")) {
			cr.andIsjrpfEqualTo("1");
		}
		return mapper.selectByExample(ex);
	}
	
	/**
	 * 根据主键id查询一个电影对象
	 */
	public Movies getById(String id) {
		return mapper.selectByPrimaryKey(Integer.parseInt(id));
	}
	
	/**
	 * 新增一个电影
	 */
	public int add(Movies movie) {
		int i = 0;
		try {
			i = mapper.insert(movie);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	/**
	 * 修改一个电影
	 */
	public int update(Movies movie) {
		return mapper.updateByPrimaryKey(movie);
	}
	
	/**
	 * 删除一个电影
	 */
	public int delete(String id) {
		return mapper.deleteByPrimaryKey(Integer.parseInt(id));
	}
	
	/**
	 * 设置一个电影为最受期待、好评如潮或今日票房
	 */
	public void update(String id,String column) {
		Movies movies = getById(id);
		if(column.equals("zsqd")) {//最受期待
			movies.setIszsqd("1");
		}else if(column.equals("hprc")) {//好评如潮
			movies.setIshprc("1");
		}else if(column.equals("jrpf")) {//今日票房
			movies.setIsjrpf("1");
		}
		movies.setUpdatedate(new Date());
		mapper.updateByPrimaryKey(movies);
	}
	
	/**
	 * 查询某个电影的所有票
	 */
	public List<Ticket> getTicketsByMovieid(String movieid){
		TicketExample ex = new TicketExample();
		com.app.bean.TicketExample.Criteria cr = ex.createCriteria();
		cr.andMovieidEqualTo(Integer.parseInt(movieid));
		List<Ticket> list = ticketMapper.selectByExample(ex);
		return list;
	}
	
	/**
	 * 创建某个电影的所有电影票
	 */
	public void createTickets(String movieid) {
		Movies m = mapper.selectByPrimaryKey(Integer.parseInt(movieid));
		for(int i = 0;i<36;i++) {
			Ticket ticket = new Ticket();
			ticket.setMovieid(Integer.parseInt(movieid));
			ticket.setMoviename(m.getMoviename());
			ticket.setOccupy("空余座位");
			ticket.setSeat((i+1)+"座");
			ticket.setStatus("待出票");
			ticketMapper.insert(ticket);
		}
	}
	
	/**
	 * 创建一个订单
	 * id:电影票的id--ticketId
	 */
	public void addOrder(String id) {
		//1、先改变那张电影票的状态
		Ticket ticket = ticketMapper.selectByPrimaryKey(Integer.parseInt(id));
		ticket.setOccupy("售出座位");
		ticketMapper.updateByPrimaryKey(ticket);
		//2、再生成新的订单
		Orders orders = new Orders();
		orders.setCreatedate(new Date());
		orders.setMovieid(ticket.getMovieid());
		orders.setMoviename(ticket.getMoviename());
		orders.setSeat(ticket.getSeat());
		orders.setStatus("0");				//尚未付钱
		ordersMapper.insert(orders);		
	}
	
	/**
	 * 订单列表--按创建时间倒序排序
	 */
	public List<Orders> listOrders() {
		OrdersExample example = new OrdersExample();
		example.setOrderByClause("createdate desc");
		return ordersMapper.selectByExample(example);
	}
}














