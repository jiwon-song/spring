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
					<c:if test = '${class_id==0}' >
						<h1 class="mt-4"> 전체 테스트 관리</h1>
					</c:if>
					<c:if test = '${class_id !=0}' >
						<h1 class="mt-4"> ${class_name} 테스트 관리</h1>
					</c:if>
				
					
					<form action="test_detail_insert.ho" method="post">
				 		<input type="hidden" name='class_id' value='${class_id}' />
						<table class="table table-borderless w-25">
							<tr>
								<td>
									<div class="input-group input-group-default">
										<span class="input-group-text" id="inputGroup-sizing-default">테스트명</span>
										<select class="form-select" id="inputGroupSelect01" onchange="window.open(value,'_self');">
											<c:forEach items="${test_list}" var="list">
												<option	 <c:if test = "${list.test_id eq test_id}">selected </c:if>  value="test_id.ho?test_id=${list.test_id}">${list.test_name}</option>
											</c:forEach>
										</select>
									</div>
								</td>

							</tr>

						</table>
					</form>




					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 테스트명 : ${test_name }
						</div>
						<div class="card-body">
							<form action="test_detail_update.ho" method="post">
								<table id="datatablesSimple" class="hong_vam">
									<!--  이거때문에 자동 페이징처리? -->
									<thead>
										<tr>
											<th>학생이름</th>
											<th>반이름</th>
											<th>테스트명</th>
											<th>점수</th>
											<th>응시여부</th>
											<th class='col-2'>확인 / 취소</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${test_detail_list}" var="t">
											<tr class="hong_vam">
												<td>${t.student_name}</td>
												<td class="col-2">${t.class_name}</td>
												<td>${t.test_name}</td>
												<td class="col-1">
													<c:if test="${t.student_id eq student_id }">
													<input class="form-control" type="text" name="test_score" value="${t.test_score}" />
													</c:if>	
													<c:if test="${t.student_id ne student_id }">
														${t.test_score}
													</c:if>
												</td>
												<td><c:if test='${t.test_score != 0}'>제출</c:if> 
													<c:if test='${t.test_score == 0}'>미제출</c:if></td>
												<td>
													<c:if test="${t.student_id eq student_id }">
														<input type="hidden" name="student_id" value="${t.student_id}" />
														<input type="hidden" name="test_id" value="${test_id}" />
														<button type="submit" class="btn hong_btn_blue col-5">확인</button>
														<div class="col-1 d-inline-block"></div>
														<a class="btn hong_btn_red col-5" onclick="history.go(-1)">취소</a>
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</main> <!--  여기까지가 콘텐츠 -->
			
			
	<%@include file="../include/footer.jsp" %>
		
	</div>
	

 <script>
/*  
 $('.btn-m').click(function(){
// 	 name='class_id' value='${class_id}' />
// 			<input type="hidden" name='test_id' value='${test.test_id}' />
// 			<input type="hidden" name='test_name' value='${test.test_name}' />
// 			<input type="hidden" name='class_name' value='${class_name}' />
	var testname = $(this).closest('tr').child('td:eq(0)').text();
	var testdate = $(this).closest('tr').child('td:eq(3)').text();
	var eName = '<input type="text" value="${test.test_name }" id="test_name"/>';
	var eDate = '<input type="text" value="${test.test_name }" id="test_name"/>';
 });
 */
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