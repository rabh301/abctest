<%@ page  import="java.sql.*" %>
<%
            String uname = request.getParameter("id");
            try {
            	Class.forName("com.ibm.db2.jcc.DB2Driver");
                Connection con = DriverManager.getConnection("jdbc:db2://dashdb-entry-yp-dal09-09.services.dal.bluemix.net:50000/BLUDB","dash6329", "eFvSr90p1gVU");
                Statement st = con.createStatement();
                String sql="delete from Com where CUsername='" + uname + "'";
                int x=st.executeUpdate(sql);
                if(x>0){
                    response.sendRedirect("AdminCompanyDetails.jsp");
                }else{
                    out.println("Error: cannot delete record"); 
                    
                }
                con.close();
            } catch (Exception ex) {
                out.println(ex.getMessage());
            }
%>