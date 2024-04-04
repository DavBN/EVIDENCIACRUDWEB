<%@page contentType="text/html" pageEncoding="UTF-8" import="org.david.apiservlet.webapp.headers.models.*"%>
<%
Carro carro = (Carro) session.getAttribute("carro");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Carro de Compras</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
<h1>Carro de Compras</h1>
<% if(carro == null || carro.getItems().isEmpty()){%>
<div class="alert alert-warning">Lo sentimos no hay productos en el carro de compras!</p>
<%} else { %>
<form name="formcarro" action="<%=request.getContextPath()%>/carro/actualizar" method="post">
<table class="table table-hover table-striped">
    <tr>
        <th>id</th>
        <th>nombre</th>
        <th>precio</th>
        <th>cantidad</th>
        <th>total</th>
        <th>borrar</th>
    </tr>
    <%for(ItemCarro item: carro.getItems()){%>
    <tr>
        <td><%=item.getProducto().getId()%></td>
        <td><%=item.getProducto().getNombre()%></td>
        <td><%=item.getProducto().getPrecio()%></td>
        <td><input type="text" size="4" name="cant_<%=item.getProducto().getId()%>" value="<%=item.getCantidad()%>" /></td>
        <td><%=item.getImporte()%></td>
        <td><input type="checkbox" value="<%=item.getProducto().getId()%>" name="deleteProductos" /></td>
    </tr>
    <%}%>
    <tr>
        <td colspan="5" style="text-align: right">Total:</td>
        <td><%=carro.getTotal()%></td>
    </tr>
</table>
<a class="btn btn-sm btn-primary" href="javascript:document.formcarro.submit();">Actualizar</a>
</form>
<%}%>
<div class="my-2">
   <p><a class="btn btn-sm btn-secondary" href="<%=request.getContextPath()%>/index.html">volver</a>
   <p><a class="btn btn-sm btn-success" href="<%=request.getContextPath()%>/productos">seguir comprando</a>
</div>
</div>
</body>
</html>