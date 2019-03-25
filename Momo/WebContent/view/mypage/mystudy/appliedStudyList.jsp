<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/view/layout/header.jsp" />

<div class="wrapper">
	<div class="container">

		<div class="row row-offcanvas row-offcanvas-right">

			<jsp:include page="/view/layout/mypage.jsp" />


			<div class="col-xs-12 col-sm-9">
				<p class="pull-right visible-xs">
					<button type="button" class="btn btn-primary btn-xs"
						data-toggle="offcanvas">Toggle nav</button>
				</p>

				<div class="jumbotron"
					style="padding: 5px; background-color: #eee0; border-bottom: 1px solid #f67280; border-radius: 0;">
					<h2>신청한 스터디</h2>
					<p style="font-size: 16px">팀원으로 참여 신청한 스터디 목록입니다</p>
				</div>

				<ul class="nav nav-tabs" role="tablist" style="margin-bottom: 30px;">
					<li role="presentation"><a href="/mypage/mystudy/studyiapplied"
						style="color: #555;">내가 만든	스터디</a></li>
					<li role="presentation" class="active"><a
						href="/mypage/mystudy/studyimade" style="color: #F67280;">신청한 스터디</a></li>
				</ul>

				<div class="row" style="margin: 0px;">
					<c:if test="신청한 스터디가 있을 때">

					<%--    			<c:forEach> --%> <!-- 신청한 스터디 띄워주기 -->

					<div class="thumbnail col-sm-12">
						<div class="col-sm-3" style="width: 200px; height: 200px;">
							<img src="/cos/upload/${list.file_storedname }" alt="study image" width="200" height="200" /><br>
						</div>
						<div class="caption col-sm-9">
							<span class="label label-default"
								style="float: right; font-size: 110%;">신청상태</span>
							<h3>스터디제목</h3>
							<p>스터디 설명</p>
							<button class="btn btn-danger btn_sm" id="cancelApply" style="float:right;">신청취소</button>
						</div>
					</div>

					<%--    			</c:forEach> --%>
					</c:if>
					<c:if test="신청한 스터디가 없을 때">
					<div>
					<img src="/image/search.png" width="100" height="100" style="margin-left: 45%; margin-top:20px; margin-bottom: 30px;"/><br>
					<div style="text-align:center;"><h4>신청하신 스터디가 없습니다</h4></div>
					<div style="text-align:center;"><h4>본인에게 맞는 스터디를 찾아 신청해보세요!</h4></div>
					</div>
					</c:if>

				</div>

<%-- 				<c:if test="${List.size()>0 }"> --%>
<%-- 					<jsp:include page="./pagingAppliedStudy.jsp" /> --%>
<%-- 				</c:if> --%>

			</div>
			<!--/.col-xs-12.col-sm-9-->


		</div>
	</div>

</div>



