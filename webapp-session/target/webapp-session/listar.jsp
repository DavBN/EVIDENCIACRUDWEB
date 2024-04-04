<%@page contentType="UTF-8" import="java.util.*, org.david.apiservlet.webapp.headers.models.*"%>
<%
List<Producto> productos = (List<Producto>) request.getAttribute("productos");
Optional<String> username = (Optional<String>) request.getAttribute("username");
String mensajeRequest = (String) request.getAttribute("mensaje");
String mensajeApp = (String) getServletContext().getAttribute("mensaje");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Listado de productos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
<h1>Listado de productos</h1>
<% if(username.isPresent()){%>
<div class="alert alert-info">Hola <%=username.get()%>, bienvenido!</div>
<p><a class="btn btn btn-primary my-2" href="<%=request.getContextPath()%>/productos/form">crear [+]</a></p>
<%}%>
<table class="table table-hover table-striped">
    <tr>
        <th>id</th>
        <th>nombre</th>
        <th>tipo</th>
        <% if(username.isPresent()){%>
        <th>precio</th>
        <th>agregar</th>
        <th>editar</th>
        <th>eliminar</th>
        <% } %>
    </tr>
    <% for(Producto p: productos){%>
    <tr>
        <td><%=p.getId()%></td>
        <td><%=p.getNombre()%></td>
        <td><%=p.getCategoria().getNombre()%></td>
        <% if(username.isPresent()){%>
        <td><%=p.getPrecio()%></td>
        <td><a class="btn btn-sm btn-primary" href="<%=request.getContextPath()%>/carro/agregar?id=<%=p.getId()%>">agregar al carro</a></td>
        <td><a class="btn btn-sm btn-success" href="<%=request.getContextPath()%>/productos/form?id=<%=p.getId()%>">editar</a></td>
        <td><a class="btn btn-sm btn-danger" onclick="return confirm('esta seguro que desea eliminar?');"
        href="<%=request.getContextPath()%>/productos/eliminar?id=<%=p.getId()%>">eliminar</a></td>
        <% } %>
    </tr>
    <%}%>
</table>
<p><%=mensajeApp%></p>
<p><%=mensajeRequest%></p>
</div>
</body>
</html>