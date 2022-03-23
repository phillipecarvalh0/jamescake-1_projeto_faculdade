<%@page language="java" import="java.sql.*"%>

<%
String alogin = request.getParameter("txtlogin");
String asenha = request.getParameter("txtsenha");

String banco = "aulacadrastro" ;
String url ="jdbc:mysql://localhost:3306/" + banco;
String usuario = "root" ;
String senha = "" ;

String driver = "com.mysql.jdbc.Driver" ;

Class.forName(driver);

Connection conexao ;

conexao = DriverManager.getConnection(url, usuario, senha);

Statement stm = conexao.createStatement() ;

String sql = "select * from cadastro_cliente where email = '"+alogin+"' and senha ='"+asenha+"'";

ResultSet dados;

dados = stm.executeQuery(sql);

if (dados.next()) {
session.setAttribute("usuario",dados.getString("email") );
response.sendRedirect("consulta.jsp");
}
	else{
	out.print("Login E senha incorreto");
	out.print("<br><br>");
	out.print("<a href='pagina_login.html'> Tenter Fazer login novamente </a>");

}

conexao.close();
stm.close();

%>

