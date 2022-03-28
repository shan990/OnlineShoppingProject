<%@page import="java.sql.*" %>
<%@page import="project.ConnectionProvider" %>

<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");
String active = request.getParameter("active");

try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("update product set name='"+name+"' ,category='"+category+"' ,price='"+price+"' , active='"+active+"' where id='"+id+"'");
	
	if(active=="No"){ //if the product stock is not available/over all the relevant things need to be removed from cart table (if the order is not alreadyplaced/confirmed in that case address will be there)
		st.executeUpdate("delete from cart where product_id='"+id+"' and address is null");		
	}	
	response.sendRedirect("allProductEditProduct.jsp?msg=done");
	
}catch(Exception e){
	System.out.println(e);	
	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");

}
%>>