<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Testing Session with JSP</title>
</head>
<body>
    
    <%!
    
    int counter=0;
    
    %>
    <%
    
    if(session.isNew()){
    	session.setAttribute("visits",counter+"");
    	
    }else{
    	String counterStr=(String)(session.getAttribute("visits"));
    	if(counterStr!=null){
    	counter=Integer.parseInt(counterStr);
    	}
    	counter++;
    	session.setAttribute("visits",counter+"");
    	
       
    }
    
    %>
<h2>You visited# <%=counter %></h2>

</body>
</html>