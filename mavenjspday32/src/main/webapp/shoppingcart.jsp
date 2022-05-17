<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.sql.*,ai.jobiak.model.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping Cart</title>
</head>
<body>
<%! 


private ArrayList<Product> getProducts() {
    	
    String url="jdbc:mysql://localhost:3306/world";
    String userName="root";
    String password="admin";
   // String productIds[]=new String[10];
    ArrayList<Product> productList=new ArrayList<>();
    Connection con =null;
    try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con =DriverManager.getConnection(url,userName,password);
    Statement st=con.createStatement();
    String sql="select * from products";
    ResultSet rs=st.executeQuery(sql);
    while(rs.next()) {
    Product p =new Product(rs.getString(1),rs.getString(2),rs.getDouble(3));
    productList.add(p);  
      }
    }catch(Exception e) {
    	e.printStackTrace();
    }finally {
    	if(con!=null)
    	{
    		try {
    			con.close();
    		}catch(SQLException e) {
    			e.printStackTrace();
    		}
    	}
    }  
    return productList;
   }
  %> 
  <hr/>
	     <%
  
	        ArrayList<Product>itemsList=null;
	        itemsList=getProducts();//private method for db connection and fetch
	        
	        for(int i=0;i<itemsList.size();i++) {
	        	out.println("<a href='shoppingcart.jsp?item="+itemsList.get(i).getProductId()+"'>Add Item "+itemsList.get(i).getProductId()+"</a><br/>");	
	        }
	    
  HttpSession shoppingCart =request.getSession();
  ArrayList<Product>selectedItemsList=null;
  
  if(shoppingCart.isNew()) {
  	selectedItemsList=new ArrayList<>();
  	shoppingCart.setAttribute("items",selectedItemsList);
  }else if(request.getQueryString()!=null){
      String queryStr=request.getQueryString();
       // System.out.println(queryStr);//item=10
         String[] splitArray=queryStr.split("=");
        String productId=splitArray[1];
        for(int i=0;i<itemsList.size();i++) {
        	
        
        	if(itemsList.get(i).getProductId().equals(productId)) {
        		
        	    selectedItemsList=(ArrayList<Product>)shoppingCart.getAttribute("items");
        		selectedItemsList.add(itemsList.get(i));
        		shoppingCart.setAttribute("items",selectedItemsList);
        	    break;
        	}
        }
  }  
  float TotalCost=0;
  if(selectedItemsList!=null)	        
	        for(Product p:selectedItemsList) {	        	
	        	out.println(p.getProductId()+"::"+p.getDescription()+"::"+p.getPrice()+"<br/>");
	        	TotalCost+=p.getPrice();
	        }
	        
	    %>
	    <hr/>
	    <%
	    out.println("<h3>Items in the cart #"+selectedItemsList.size()+"</h3>");
        out.println("<h3>Total Price:"+TotalCost+"</h3>");
	    %>	        
</body>
</html>