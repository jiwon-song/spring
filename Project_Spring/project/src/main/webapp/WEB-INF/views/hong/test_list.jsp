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
						<h1 class="mt-4"> ${class_name } 테스트 관리</h1>
					</c:if>
				
					
					<form action="test_insert.ho" method="post">
				 		<input type="hidden" name='class_id' value='${class_id}' />
						<table class="table table-borderless w-75">
							<tr>
								<td>
									<div class="input-group input-group-default">
										<span class="input-group-text" id="inputGroup-sizing-default">테스트명</span>
										<input <c:if test = '${class_id==0}' >disabled </c:if> type="text" name="test_name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
									</div>
								</td>
								<td>
									<div class="input-group input-group-default">
										<span class="input-group-text" id="inputGroup-sizing-default">제출날짜</span>
										<input type="text" name="test_date"  id="datepicker" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
									</div>
								</td>
								<td class="col-4">
									<button type="submit" <c:if test = '${class_id==0}' >disabled </c:if> class="btn col-10 hong_btn_blue">테스트 추가</button>
								</td>
							</tr>


						</table>
					</form>




					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 테스트 목록
						</div>
						<div class="card-body">
							<table id="datatablesSimple" class="hong_vam"> <!--  이거때문에 자동 페이징처리? -->
								<thead>
									<tr>
										<th>테스트명</th>
										<th>반이름</th>
										<th>응시인원</th>
										<th>응시날짜</th>
										<th>최고점</th>
										<th>평균</th>
										<th class='col-2'>수정 / 삭제</th>
									</tr>
								</thead>
								
								<tbody>
									<c:forEach items="${test_list}" var="test">
									<tr  class="hong_vam">
<%--								<tr data-test='${test.test_id}'>  <!-- form 이 아니라 자바 스크립트로 데이터 보내줄 때 이렇게 데이터 넣어줌 --> --%>
										<td><a href="test_detail.ho?test_id=${test.test_id}&test_name=${test.test_name}&class_name=${class_name}&class_id=${class_id}" class="text-decoration-none text-reset">${test.test_name}</a></td>
										<td>${test.class_name}</td>
										<td>${test.count} / ${test.total}</td> 
										<td>${test.test_date}</td>
										<td>${test.max}</td>
										<td>${test.avg }</td>
										<td>
											<form class="col-6 d-inline-block" action="test_modify.ho" method="post">
												<input type="hidden" name='class_id' value='${class_id}' />
												<input type="hidden" name='test_id' value='${test.test_id}' />
<%-- 												<input type="hidden" name='test_name' value='${test.test_name}' /> --%>
												<input type="hidden" name='class_name' value='${class_name}' />
												<button type="submit" class="btn btn-primary col-10">수정</button>
											</form>
											<form class="col-5 d-inline-block" action="test_delete.ho" method="post">
												<input type="hidden" name='class_id' value='${class_id}' />
												<input type="hidden" name='test_id' value='${test.test_id}' />
												<button class="btn btn-danger col-12" onclick="if(confirm('${test.test_name}를 삭제하시겠습니까?')){type='submit'}else{type='button'} ">삭제</button>
											</form>
										
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