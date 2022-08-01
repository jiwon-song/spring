<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="ko">



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
					<h1 class="mt-4">홈화면</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">제목</li>
					</ol>

					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> DataTable Example
						</div>
						<div class="card-body">
							<table id="datatablesSimple"> <!--  이거때문에 자동 페이징처리? -->
								<thead>
									<tr>
										<th>Name</th>
										<th>Position</th>
										<th>Office</th>
										<th>Age</th>
										<th>Start date</th>
										<th>Salary</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Name</th>
										<th>Position</th>
										<th>Office</th>
										<th>Age</th>
										<th>Start date</th>
										<th>Salary</th>
									</tr>
								</tfoot>
								<tbody>
									<tr>
										<td>Tiger Nixon</td>
										<td>System Architect</td>
										<td>Edinburgh</td>
										<td>61</td>
										<td>2011/04/25</td>
										<td>$320,800</td>
									</tr>
									<tr>
										<td>Garrett Winters</td>
										<td>Accountant</td>
										<td>Tokyo</td>
										<td>63</td>
										<td>2011/07/25</td>
										<td>$170,750</td>
									</tr>
									<tr>
										<td>Ashton Cox</td>
										<td>Junior Technical Author</td>
										<td>San Francisco</td>
										<td>66</td>
										<td>2009/01/12</td>
										<td>$86,000</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main> <!--  여기까지가 콘텐츠 -->
			
			
	<%@include file="../include/footer.jsp" %>
		
	</div>
	

</body>
</html>