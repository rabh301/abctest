<%@ page contentType="text/html; charset=utf-8" language="java"  import="java.sql.*" errorPage="" %>
<%@page import="java.io.*,java.sql.*;" session="true" %>



<%

        String examID = request.getParameter("examid");
        String jobID = session.getAttribute("jobid").toString();

        String studentid=session.getAttribute("s1").toString();
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = null;
        int[] ar = new int[10];
        int i = 0;
        if (request.getParameter("examid") != "") {
            while (i < 10) {
                double x = Math.random();
                String t = String.valueOf(x * 20);
                t = t.substring(0, t.indexOf("."));
                int b = Integer.parseInt(t);
                //out.println(b + "<br>");
                boolean flag = false;
                for (int n = 0; n < ar.length; n++) {

                    if (b <= 0 || ar[n] == b) {
                        flag = true;
                    }

                }
                if (flag == false) {
                    ar[i] = b;
                    i++;
                }
            }//while
            try {

                for (int n = 0; n < ar.length; n++) {
                    Class.forName("com.ibm.db2.jcc.DB2Driver");
                    con = DriverManager.getConnection("jdbc:db2://dashdb-entry-yp-dal09-09.services.dal.bluemix.net:50000/BLUDB","dash6329", "eFvSr90p1gVU");
                    out.println("connection created....");
                    st = con.createStatement();
                    rs = st.executeQuery("SELECT * FROM QUESTION Where JOBID='" + jobID + "' and EXAMID='" +examID + "' and QUESTIONNO=" + ar[n]);
                    
                    if (rs.next()) {
        
                        sql="insert into TEMP_DATA values('" + studentid + "'," + ((Integer)(n +1)).toString() + ",'" + rs.getString(3) +
                                "','" + rs.getString(4) +"','" +rs.getString(5) +"','" + rs.getString(6) + "','" +
                                rs.getString(7) + "','" + rs.getString(8) + "')";
                        //out.println(sql + "<br>");

                        st.executeUpdate(sql);
                    }
                }
                session.setAttribute("mark","0");
                session.setAttribute("examid", examID);
                response.sendRedirect("dispqst.jsp?qno=1");
            } catch (Exception ex) {
                out.println("Error: Cannot go forward<br>" + ex );
            }

        }
%>



