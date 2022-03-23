<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8">
		<title> Consulta </title>

	</head>
	<body>


<%@page language="java" import="java.sql.*"%>

<%
if( session.getAttribute("usuario") == null ) {
	out.print("conteudo de acesso restrito");
	out.print("<br>");
	out.print("<a href='pagina_login.html'> Faça o login  </a>");
}
else{

String banco = "aulacadrastro" ;
String url ="jdbc:mysql://localhost:3306/" + banco;
String usuario = "root" ;
String senha = "" ;

String driver = "com.mysql.jdbc.Driver" ;

Class.forName(driver);

Connection conexao ;

conexao = DriverManager.getConnection(url, usuario, senha);

Statement stm = conexao.createStatement() ;

String sql = "select * from  cadastro_cliente" ;

ResultSet dados ;

dados=stm.executeQuery(sql);

out.print("<table border=1>");

out.print("<tr> <th>Código</th> <th>nome</th> <th>endeco</th>  <th>telefone</th> <th>email</th> </tr> ");


while( dados.next()){
out.print("<tr>");

out.print("<td>");
out.print(dados.getString("codigo"));
out.print("<td>");
out.print(dados.getString("nome"));
out.print("<td>");
out.print(dados.getString("endereco"));
out.print("<td>");
out.print(dados.getString("telefone"));
out.print("<td>");
out.print(dados.getString("email"));
out.print("<td>");

out.print("<tr>");
}

out.print("</table>");

out.print("<a href='site_james_cake.html'> Voltar </a>");
conexao.close();
stm.close();
}
%>

</body>
</html>