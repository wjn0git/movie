<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="aside">
	<div class="panel">
		
		
		<div class="panel-header">
			<span class="panel-title">
				<span class="textcolor_red">新闻公告</span>
			</span>
		</div>
		<div class="panel-content">
			<ul class="ranking-wrapper ranking-box">
				<c:forEach items="${newsList}" var="item">
					<li class="ranking-index-1">
						<a href="/front/detailNews.do?id=${item.id}" target="_blank">							
							<div class="ranking-top-right">
								<div class="ranking-top-right-main">
									<span class="ranking-top-movie-name">
										${item.title}
									</span>									
								</div>
							</div>
						</a>	
					</li>
				</c:forEach>
			</ul>
		</div>
		
		
		
		
	</div>
</div>








