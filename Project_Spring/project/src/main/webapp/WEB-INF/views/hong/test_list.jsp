<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/head.jsp" %>
<body>

	<!-- 여기가 헤더부분 -->
	<%@ include file="../include/header.jsp" %>
	<div id="layoutSidenav">
	
		<!--  사이드 메뉴부분 include 함 -->
 		<%@ include file="../include/sidemenu.jsp"  %>
 		
 		<!--  여기에 콘텐츠 넣으면 됨 -->
 		
 			<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4"> 테스트 관리</h1>
				
					
					<form >
						<table class="table table-borderless w-75">
							<tr>
								<td>
									<div class="input-group input-group-default">
										<span class="input-group-text" id="inputGroup-sizing-default">테스트명</span>
										<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
									</div>
								</td>
								<td>
									<div class="input-group input-group-default">
										<span class="input-group-text" id="inputGroup-sizing-default">제출날짜</span>
										<input type="text" id="datepicker" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
									</div>
								</td>
								<td class="col-4">
									<button type="button" class="btn btn-primary col-10">테스트 추가</button>
								</td>
							</tr>


						</table>
					</form>




					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 테스트 목록
						</div>
						<div class="card-body">
							<table id="datatablesSimple"> <!--  이거때문에 자동 페이징처리? -->
								<thead>
									<tr>
										<th>테스트명</th>
										<th>반이름</th>
										<th>응시인원</th>
										<th>응시날짜</th>
										<th>최고점</th>
										<th>평균</th>
										<th>수정 / 삭제</th>
									</tr>
								</thead>
								
								<tbody>
									<c:forEach items="${test_list}" var="test">
									<tr>
										<td>${test.test_name }</td>
										<td>${test.class_name}</td>
										<td>${test.count} / ${test.total}</td>
										<td>${test.test_date}</td>
										<td>${test.max}</td>
										<td>${test.avg }</td>
										<td><button type="button" class="btn btn-primary">수정</button>
											<button type="button" class="btn btn-danger">삭제</button>
										</td>
									</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main> <!--  여기까지가 콘텐츠 -->
			
			
	<%@include file="../include/footer.jsp" %>
		
	</div>
	

 <script>
  $( function() {
	  $( "#datepicker" ).datepicker({
		showAnim:"slideDown",
		showMonthAfterYear : true,	//년도 월 순서로
		dateFormat : 'yy-mm-dd',	//선택된 날짜데이터 년월일 순서로
		changeMonth : true,			// 월 변경 가능하게
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', 
					'7월', '8월', '9월', '10월', '11월', '12월'],		// 월을 한글로
		dayNamesMin: [ '일', '월', '화', '수', '목', '금', '토' ], //요일을 한글로
	  } );
	  //초기값을 오늘 날짜로 설정해줘야 합니다.
      $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)	  
  } );
  </script>



</body>
</html>