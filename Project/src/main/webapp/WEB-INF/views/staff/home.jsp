<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/staff/home.jsp</title>
<style>
	h2 {text-align: center; padding-top: 1em; padding-bottom: 1em;}
	
	#center{
	text-align: center;
	}
</style>
</head>
<body>
<script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js'></script>
<jsp:include page="../../../resources/include/resource.jsp"></jsp:include>    
<header class="sticky-top ">
<jsp:include page="../../../resources/include/navbar.jsp">
	<jsp:param value="userlist" name="thisPage"/>
</jsp:include>
</header>

<div class="container-fluid">
	<div class="row">
	  	
		<jsp:include page="../../../resources/include/sidebar.jsp"></jsp:include>
	
	
	    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	    	<canvas id='chart'></canvas>
		    
	    	<h2>이번주 판매 현황</h2>
	    		<div class="table-responsive">
	        	<table class="table table-striped table-sm">
	        		<thead>
	            		<tr>
	            			<th scope="col">주문 번호</th>
	              			<th scope="col">수령인</th>
	             		 	<th scope="col">주소</th>
	              			<th scope="col">총 금액</th>
	              			<th scope="col">주문 날짜</th>
	            		</tr>
	          		</thead>
	          		<tbody>
						<c:forEach items="${list}" var="tmp">
							<tr name='graph'>
								<td><a href="adminOrderDetail.do?orderId=${tmp.orderId}">${tmp.orderId}</a></td>
								<td>${tmp.receiver}</td>
								<td>(${tmp.userPostal}) ${tmp.userAddr} ${tmp.userAddrDetail}</td>
								<td><fmt:formatNumber pattern="###,###,###" value="${tmp.totalPrice}" /> 원</td>
								<td>${tmp.orderDate }</td>
							</tr>
									  	
						</c:forEach>
	          		</tbody>
	        		</table>
	      	</div>
	      	 
		</main>
	</div>
</div>
<jsp:include page="../../../resources/include/footer.jsp">
	<jsp:param value="home" name="thisPage"/>
</jsp:include>

<script>
// graph 변수
function getDate(date){ //날짜문자열 형식은 자유로운 편

    let week = ['Sun','Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    let dayOfWeek = week[new Date(date).getDay()];

    return dayOfWeek;

}

let graph = document.getElementsByName("graph");

let mon=0, tue=0, wed=0, thu=0, fri=0, sat=0, sun=0;

for (var i = 0; i < graph.length; i++) {
	if (getDate(graph[i].cells[4].innerHTML) == 'Mon') {
		mon += Number((graph[i].cells[3].innerHTML).slice(0,-2).replace(",",""));

	}else if (getDate(graph[i].cells[4].innerHTML) == 'Tue') {
		tue += Number((graph[i].cells[3].innerHTML).slice(0,-2).replace(",",""));
		
	}else if (getDate(graph[i].cells[4].innerHTML) == 'Wed') {
		wed += Number((graph[i].cells[3].innerHTML).slice(0,-2).replace(",",""));
		
	}else if (getDate(graph[i].cells[4].innerHTML) == 'Thu') {
		thu += Number((graph[i].cells[3].innerHTML).slice(0,-2).replace(",",""));
		
	}else if (getDate(graph[i].cells[4].innerHTML) == 'Fri') {
		fri += Number((graph[i].cells[3].innerHTML).slice(0,-2).replace(",",""));
		
	}else if (getDate(graph[i].cells[4].innerHTML) == 'Sat') {
		sat += Number((graph[i].cells[3].innerHTML).slice(0,-2).replace(",",""));
		
	}else if (getDate(graph[i].cells[4].innerHTML) == 'Sun') {
		sun += Number((graph[i].cells[3].innerHTML).slice(0,-2).replace(",",""));
		
	}
}

let data = [];
data.push(mon);
data.push(tue);
data.push(wed);
data.push(thu);
data.push(fri);
data.push(sat);
data.push(sun);
console.log(data);

let ctx = document.getElementById('chart');

let config = {
	type: 'line',
	data: {
		labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
		
		datasets: [{
			label: '이번 주 판매액',
			backgroundColor: '#FFCB9C',
			borderWidth : 2,
			borderColor: 'black',
			data: data,
		}]
	}
};

//차트 그리기
let myChart = new Chart(ctx, config);

</script>
</body>
</html>