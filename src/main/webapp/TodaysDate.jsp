<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		
		<%
			java.util.Date today = new java.util.Date();
			String mensage = "Today's date is " + today.toString();
			
		%>
	
		<%=
			mensage
			//new java.util.Date()
		%>
		
	</body>
</html>