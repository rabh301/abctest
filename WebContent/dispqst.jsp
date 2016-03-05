<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" session="true" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
		<meta content="stuff, to, help, search, engines, not" name="keywords">
		<meta content="What this page is about." name="description">
		<meta content="Display Webcam Stream" name="title">
        <title>JSP Page</title>
        <jsp:include page="webcam.html"/>
        
    </head>
    <body>
    	
        <%
        Connection con;
        Statement st;
        ResultSet rs;
        String sql;
        //int qno=1;
        int qno = Integer.parseInt(request.getParameter("qno"));
        String studentid = session.getAttribute("s1").toString();
        String qstn = "", ch1 = "", ch2 = "", ch3 = "", ch4 = "", ans = "";
        try {
            //sql = "select * from TEMP_DATA where StudID='" + studentid + "' and QuestionNo=" + qno;
            sql = "select * from TEMP_DATA";
            //sql = "select * from TEMP_DATA where QstNo=" + qno;
            sql="select *from Question where QuestionNo="+qno;
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            con = DriverManager.getConnection("jdbc:db2://dashdb-entry-yp-dal09-09.services.dal.bluemix.net:50000/BLUDB","dash6329", "eFvSr90p1gVU");
            st = con.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                qstn = rs.getString(4);
                ch1 = rs.getString(5);
                ch2 = rs.getString(6);
                ch3 = rs.getString(7);
                ch4 = rs.getString(8);
                ans = rs.getString(9);
        %>



        <form action="calcmark.jsp" method="post">

            <table width="829" height="244" border="1" bgcolor="#78AFA0">
                <tr>
                    <td width="148"><strong>Question <%=qno%>
                      of 10
                      </strong>
                      <input type="hidden" name="qno" value="<%=qno%>">                  </td>
                    <td><strong><%=qstn%></strong></td>
                </tr>
                <tr>
                    <td><div align="center"><strong>1</strong></div></td>
                    <td width="460">
                      <strong>
                      <input name="ch" type="radio" value="<%=ch1%>">
                      <%=ch1%></strong></td>
                </tr>
                <tr>
                    <td><div align="center"><strong>2</strong></div></td>
                    <td>
                      <strong>
                      <input name="ch" type="radio" value="<%=ch2%>">
                      <%=ch2%></strong></td>
                </tr>
                <tr>
                    <td><div align="center"><strong>3</strong></div></td>
                    <td>
                      <strong>
                      <input name="ch" type="radio" value="<%=ch3%>">
                      <%=ch3%></strong></td>
                </tr>
                <tr>
                    <td><div align="center"><strong>4</strong></div></td>
                    <td>
                      <strong>
                      <input name="ch" type="radio" value="<%=ch4%>">
                      <%=ch4%></strong></td>
                </tr>
                <tr>
                    <td><input type="hidden" name="ans" value="<%=ans%>"></td>
                    <%
                if (qno <= 9) {
                    %>
                    <td><input type="submit" name="next" value="Next Question"></td>
                    <%} else {
                    %>
                    <td width="199"><input type="submit" name="Finish" value="Finish"></td>
                    <%                }
                    %>
                </tr>
            </table>
        </form>
        <%            }
        } catch (Exception ex) {
            out.println(ex.toString());
        }
    //out.println(session.getAttribute("mark"));
%>
        <h1>&nbsp;</h1>
        
        
    </body>
</html>
