<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bean Action</title>
</head>
<body>
<h2>Enter Your Data</h2>
<form name="signupform" action="beanAction.jsp" method="post">
Enter first name:<input type="text" name="fname"><br/>
Enter email:<input type="text" name="email"><br/>
Enter mobile:<input type="text" name="mobile"><br/>
Click to send data:<input type="submit" name="send">
<input type="reset" value="clean"><br/>

</form>
<h3>Check...</h3>


    <jsp:useBean id="userBean" class="ai.jobiak.model.User" scope="request"></jsp:useBean>
    <jsp:setProperty property="fname" name="userBean" param="fname"/>
    <jsp:setProperty property="email" name="userBean" param="email"/>
    <jsp:setProperty property="mobile" name="userBean" param="mobile"/>
  <hr>
  <jsp:forward page="showBeanData.jsp"></jsp:forward>
  </hr>
</body>
</html>