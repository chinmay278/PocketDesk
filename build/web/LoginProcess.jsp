<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%
    response.setContentType("text/html");

//PrintWriter out = response.getWriter();
%> 
<%    try {
        String userid = 
(String) session.getAttribute("user_id");

        System.out.println(userid);
        Class.forName("com.mysql.jdbc.Driver");
//String s=request.getParameter("username");
        String sql = "select * from users_master where user_id = ?";
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pocketdesk", "root", "root");

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, userid);
        ResultSet rs = ps.executeQuery();
        
            while (rs.next()) {
       
    Path p = 
Paths.get(rs.getString("url_img"));
    String filepath = p.getFileName().toString();
    session.setAttribute("url_img", filepath);

    String user_id = rs.getString(2);
    session.setAttribute("user_name", user_id);

    String mble = rs.getString(5);
    session.setAttribute("mble", mble);

    }
    con.close();
%>
</table>
<jsp:forward page="1_HomePage.jsp"/>
<%
    } catch (Exception e) {
        System.out.println(e);
    }
%>

 