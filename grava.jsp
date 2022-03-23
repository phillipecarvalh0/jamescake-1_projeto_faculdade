<%@page language = "java" import="java.sql.*" %>

<%
// criar as variaveis 
String anome = request.getParameter("txtnome") ;
String aemail = request.getParameter ("txtemail");
String asenha = request.getParameter ("txtsenha");
String aendereco = request.getParameter("txtendereco");
String atelefone =request.getParameter("txttelefone");

//criar as varias para acessar o banco de dados
String banco = "aulacadrastro" ;
String url ="jdbc:mysql://localhost:3306/" + banco;
String usuario = "root" ;
String senha = "" ;

String driver = "com.mysql.jdbc.Driver" ;

//carregar driver na memoria
Class.forName(driver);

//criar variavel para conectar com o banco 
Connection conexao ;

conexao = DriverManager.getConnection(url, usuario, senha);


Statement stm = conexao.createStatement() ;

String sql = "insert into cadastro_cliente(nome,email,senha,endereco,telefone) values('"+anome+"','"+aemail+"','"+asenha+"','"+aendereco+"','"+atelefone+"')";

stm.executeUpdate(sql);

conexao.close();
stm.close();

out.print("Dados cadastrados com sucesso!");
out.print("<br><br>");
out.print("<a href='site_james_cake.html'> Voltar </a>");
%>


