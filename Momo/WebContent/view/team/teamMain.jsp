<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<jsp:include page="/view/layout/header.jsp"/>


<div class="wrapper">
<div class="container">

      <div class="row row-offcanvas row-offcanvas-right">

		<jsp:include page="/view/layout/studyroom.jsp"/>

        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>
          <div class="thumbnail col-sm-12" style="margin-top: 20px; box-shadow: none;padding: 15px;">
						<div class="col-sm-3" style="width: 200px; height: 200px;">
							<img src="/cos/upload/${list.file_storedname }" alt="study image" width="200" height="200" /><br>
						</div>
						<div class="caption col-sm-9">
							<span class="label label-default"
								style="float: right; font-size: 110%;">D-<span id="d-day"></span></span>
							<h3>${study.study_name }</h3>
							<p>${study.st_code }</p>
							<p>지역: ${study.study_region }</p>
							<p>인원: ${teammate.size() }명</p>
							<p>기간: ~ ${study.study_period }</p>
							<p>팀장: ${study.u_name }</p>
							<p>팀원 : <c:forEach var=i begin=0 end=${teammate.size()-1 } >${teammate.get(i).u_name } </c:forEach></p>
						</div>
					</div>
          
          
          <div class="thumbnail col-sm-12" style="margin-top: 20px; box-shadow: none;padding: 15px;">
          <p><strong>다음 스터디 일정</strong></p>
          <div id="map" class="col-sm-4" style="width:350px;height:250px;"></div>
          <div class="col-sm-4">
          	<div id="study_date">날짜: ${schedule.s_date }</div>
          	<div id="study_time">시간: ${schedule.s_date }</div>
          	<div id="study_location">장소: ${schedule.s_location }</div>
          	<div id="study_attend">참석자: <c:forEach var=i begin=0 end=${attend.size()-1 }>${attend.get(i).u_name } </c:forEach></div>
          </div>
          </div>
   			
   			
   			
   			
   			
          </div><!--/row-->
        </div><!--/.col-xs-12.col-sm-9-->

      </div><!--/row-->

    </div>

			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=428fd2371ce6f8de680001938f339497&libraries=services,clusterer,drawing"></script>
			<script>
				var container = document.getElementById('map');
				var options = {
					center: new daum.maps.LatLng(33.450701, 126.570667),
					level: 3
				};
				var map = new daum.maps.Map(container, options);
				
				
				var mapTypeControl = new daum.maps.MapTypeControl();
				// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
				// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
				map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

				// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
				var zoomControl = new daum.maps.ZoomControl();
				map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		
				// 마커가 표시될 위치입니다 
				var markerPosition  = new daum.maps.LatLng(33.450701, 126.570667); 

				// 마커를 생성합니다
				var marker = new daum.maps.Marker({
				    position: markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				
				
				
				
				
			</script>
   			



