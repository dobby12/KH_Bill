<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/head.jsp" />
<c:import url="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<!-- 개별 스타일 및 스크립트 영역 -->

<!-- 개별 영역 끝 -->

<script type="text/javascript">
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			$(location).attr("href", "/trade/write");
		})

		//검색 버튼 클릭
		$("#btnSearch").click(function() {
			location.href = "/trade/list?search=" + $("#search").val();
		});
	})
</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
}
</style>

<!-- 개별 영역 끝 -->

<div class="wrap">
	<div class="container">

		<h1>거래</h1>
		<hr>

		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th style="width: 10%;">글번호</th>
					<th style="width: 45%;">제목</th>
					<th style="width: 20%;">작성자</th>
					<th style="width: 10%;">조회수</th>
					<th style="width: 15%;">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${tradeList }" var="board">
					<tr>
						<td>${board.TRADE_NO }</td>
						<td><a href="/ask/detail?askNo=${board.TRADE_NO }">${board.TRADE_TITLE }</a></td>
						<td>${board.USER_NICK }</td>
						<td>${board.tradeHit }</td>
						<td><fmt:formatDate value="${board.tradeDate }" pattern="yy-MM-dd HH:mm:ss" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${login }">
			<button id="btnWrite" class="btn btn-primary pull-left">글쓰기</button>
		</c:if>
		<span class="pull-right">total : ${paging.totalCount }</span>
		<div class="clearfix"></div>

		<div class="form-inline text-center">
			<input class="form-control" type="text" id="search"
				value="${param.search }" />
			<button id="btnSearch" class="btn">검색</button>
		</div>

	</div>
	<!-- .container end -->
</div>
<!-- .wrap end -->

<!-- footer start -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

