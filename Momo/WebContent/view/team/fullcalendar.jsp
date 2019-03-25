<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    	
<jsp:include page="/view/layout/header.jsp"/>
<title>일정관리</title>

<style type="text/css">
::selection{background-color: #E13300; color:white;}
::moz-selection{background-color: #E13300; color:white;}
::webkit-selection{background-color: #E13300; color:white;}

body{
background-color: #fff;
margin:40px;
font: 13px/20px normal Helvetica, Arial, sans-serif;
color: #4F5155;
}

#body{
margin:0 15px 0 15px;

}

#script-warning{
display : none;
background : #eee;
border-bottom : 1px solid #ddd;
padding : 0 10px;
line-height : 40px;
text-align : center; 
font-weight:bold;
font-size: 12px;
color:red;
}

#loading{
display : none;
position:absolute;
top: 10px;
right: 10px;

}

/* 지도 */
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
.wrap * {padding: 0;margin: 0;}
.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
.info .close:hover {cursor: pointer;}
.info .body {position: relative;overflow: hidden;}
.info .desc {position: relative;margin: 5px 0 0 15px;height: 75px;}
.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.info .link {color: #5085BB;}
</style>

<link href='./css/fullcalendar.min.css' rel='stylesheet' />
<link href='./css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<link href='./css/fullcalendar.css' rel='stylesheet' type="text/css" />
<!-- <link href='./css/fullcalendar.print.css' rel='stylesheet' type="text/css" /> -->
<link href='./css/main.css' rel='stylesheet' type="text/css" />

<script src='./js/moment.min.js'></script>
<script src='./js/fullcalendar.min.js'></script>
<!-- <script src='./js/jquery-ui.min.js'></script> -->
<script src="./js/jquery.bpopup.min.js" type="text/javascript"></script>
<script src='./js/ko.js'></script>



<script>
      $(document).ready(function(){
    	 
    	  $('#calendar').fullCalendar({
    		  editable : true,
    		  navLinks : true,
    		  eventLimit : true,
    		  locale : "ko",
    		  
    		  events :  [
    			        {
    			          title: 'Business Lunch',
    			          start: '2018-03-03T13:00:00',
    			          constraint: 'businessHours'
    			        },
    			        {
    			          title: 'Meeting',
    			          start: '2018-03-13T11:00:00',
    			          constraint: 'availableForMeeting', // defined below
    			          color: '#257e4a'
    			        },
    			        {
    			          title: 'Conference',
    			          start: '2018-03-18',
    			          end: '2018-03-20'
    			        },
    			        {
    			          title: 'Party',
    			          start: '2018-03-29T20:00:00'
    			        },

    			        // areas where "Meeting" must be dropped
    			        {
    			          id: 'availableForMeeting',
    			          start: '2018-03-11T10:00:00',
    			          end: '2018-03-11T16:00:00',
    			          rendering: 'background'
    			        },
    			        {
    			          id: 'availableForMeeting',
    			          start: '2018-03-13T10:00:00',
    			          end: '2018-03-13T16:00:00',
    			          rendering: 'background'
    			        },

    			        // red areas where no events can be dropped
    			        {
    			          start: '2018-03-24',
    			          end: '2018-03-28',
    			          overlap: false,
    			          rendering: 'background',
    			          color: '#ff9f89'
    			        },
    			        {
    			          start: '2018-03-06',
    			          end: '2018-03-08',
    			          overlap: false,
    			          rendering: 'background',
    			          color: '#ff9f89'
    			        }
    			      ]
    			  
    		  
    	  });
    	  
      });
      
      

      function addSchedule()
      {
    	  var htmlsContents = ""; 
    	  htmlsContents+="<div style='width:100%; height:30px;'><div style='width:30%;float:left; padding-left:30px;'>일정명칭</div> <div style='width:60%;float:right;'><input type='text' id='calendar_title' value=''></div></div>";
    	  htmlsContents+="<div style='width:100%; height:30px;'><div style='width:30%;float:left; padding-left:30px;'>시작날짜</div> <div style='width:60%;float:right;'><input type='text' id='calendar_start_date' value='' style='width:80px'></div></div>";
    	  htmlsContents+="<div style='width:100%; height:30px;'><div style='width:30%;float:left; padding-left:30px;'>마침날짜</div> <div style='width:60%;float:right;'><input type='text' id='calendar_end_date' value='' style='width:80px'></div></div>";

    	  htmlsContents+="<input type='hidden' id='pTitle'>";
    	  htmlsContents+="<input type='hidden' id='pAddress'>";
    	  htmlsContents+="<input type='hidden' id='pLat'>";
    	  htmlsContents+="<input type='hidden' id='pLng'>";

    	
    	  htmlsContents+="<div style='width:100%; text_align:center;height:30px; margin-left:40%; margin-bottom:15px; margin-top:10px'><button id='save' onclick=\'javascript:saveSchedule();\'>저장하기</button></div>";

    	  
    	  openPopup("일정등록",htmlsContents, 900);
    	  map.relayout();
    	                   
      }
      
      function openPopup(subject,contents, widths)
      {
    	  $("#alert_subject").html(subject);
    	  $("#alert_contents").html(contents);
    	  openMessage("winAlert",widths);
      }
      
      function saveSchedule()
      {
        var calendar_title = $("#calendar_title").val();
        var calendar_start_date = $("#calendar_start_date").val();
        var calendar_end_date = $("#calendar_end_date").val();
        
//         var url = "/ajax/schedule";
        
      
        if(!calendar_title)
        	{
        	alert("일정 명칭을 입력해 주세요");
            return false; 
        	}
        if(!calendar_start_date)  {
        	alert("시작날짜를 입력해 주세요");
            return false; 
        	}
        if(!calendar_end_date)  {
        	alert("마침날짜를 입력해 주세요");
            return false; 
        	}
       
        $.ajax({
        	type:"post",
//         	cache:false,
//         	async:false,
        	data: {
        		calendar_title : $("#calendar_title").val(), 
        		calendar_start_date : $("#calendar_start_date").val(), 
        		calendar_end_date: $("#calendar_end_date").val(),
        		placeTitle: $("#placeTitle").val(),
        		placeAddress : $("#placeAddress").val(),
        		placeLat : $("#placeLat").val(),
        		placeLng : $("#placeLng").val()
        		} ,
        	url: "/ajax/schedule",
        
        	   success : function(data){
        		alert("정상 저장되었습니다"); 
        	  
        		closeMessage('winAlert');
      		  
        	  	console.log(data);
        		
        	  	$("#alert_contents").html(data); 
      		$('#calendar').fullCalendar("refetchEvents");
        	}
        	, error: function(e) {
    		  alert("실패");
    		  console.log(e);
        	}

        });
//         .done(function(result){
//         	if(result == true)
//         {
//         		closeMessage('winAlert');
//         		alert("정상 저장되었습니다"); 
//         		$('#calendar').fullCalendar("refetchEvents");
//         }
//         });
      
      }
      
       function openMessage(IDS,widths){
    	  $('#'+IDS).css("width",widths+"px");
    	  $('#'+IDS).bPopup();
    	  
      }
      
      function closeMessage(IDS){
    	 
    	  $('#'+IDS).bPopup().close();
    	  
      } 
   

    </script>
    
</head>
<body>
<div id='script-warning'>
실행오류!
</div>


	<div style="max-width: 900px; margin: 0 auto; height: 30px;">
		<div style="float: right;">
			<button onclick="javascript:addSchedule();">일정등록</button>
		</div>
	</div>

	<div id='calendar' style="max-width: 900px; margin: 0 auto;">
	</div>
	
	<div class="box box-success" style="width:900px; display:none; background-color:white;" id="winAlert">
	 <div class="box-header with-border" style="bakcground-color:white; padding-left:15px">
	  <h3 class="box-title" id="alert_subject"  style="background-color:white"></h3>
	   </div><!-- box-header -->
	   <div class="box-body" id="alert_contents" style="font-size:15px;background-color:white;">
	   </div>
	   <div style="margin-left: 1%;">
	   	<h4>장소 검색</h4>
		<jsp:include page="/view/team/location.jsp"/>
	   </div>
	</div>
	
