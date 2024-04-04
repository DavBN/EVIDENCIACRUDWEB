<%@page contentType="text/html" pageEncoding="UTF-8"
import="java.util.*,java.time.format.*,org.david.apiservlet.webapp.headers.models.*"%>
<%
List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
Producto producto = (Producto) request.getAttribute("producto");
String fecha = producto.getFechaRegistro() != null?
producto.getFechaRegistro().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")): "";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formulario productos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
<h1>Formulario productos</h1>
<form action="<%=request.getContextPath()%>/productos/form" method="post">
    <div class="row mb-2">
        <label for="nombre" class="col-form-label col-sm-2">Nombre</label>
        <div class="col-sm-4">
            <input type="text" name="nombre" id="nombre" value="<%=producto.getNombre() != null? producto.getNombre(): ""%>" class="form-control">
        </div>
        <% if(errores != null && errores.containsKey("nombre")){%>
             <div style="color:red;"><%=errores.get("nombre")%></div>
        <% } %>
    </div>

    <div class="row  mb-2">
        <label for="precio" class="col-form-label col-sm-2">Precio</label>
        <div class="col-sm-4">
            <input type="number" name="precio" id="precio" value="<%=producto.getPrecio()!=0? producto.getPrecio():""%>" class="form-control">
        </div>
        <% if(errores != null && errores.containsKey("precio")){%>
                     <div style="color:red;"><%=errores.get("precio")%></div>
                <% } %>
    </div>

    <div class="row  mb-2">
        <label for="sku" class="col-form-label col-sm-2">Sku</label>
        <div class="col-sm-4">
            <input type="text" name="sku" id="sku" value="<%=producto.getSku()!=null? producto.getSku():""%>" class="form-control">
        </div>
        <% if(errores != null && errores.containsKey("sku")){%>
                     <div style="color:red;"><%=errores.get("sku")%></div>
                <% } %>
    </div>

    <div class="row  mb-2">
        <label for="fecha_registro" class="col-form-label col-sm-2">Fecha Registro</label>
        <div class="col-sm-4">
            <input class="form-control" type="date" name="fecha_registro" id="fecha_registro" value="<%=fecha%>" class="form-control">
        </div>
        <% if(errores != null && errores.containsKey("fecha_registro")){%>
                     <div style="color:red;"><%=errores.get("fecha_registro")%></div>
                <% } %>
    </div>

    <div class="row mb-2">
        <label for="categoria" class="col-form-label col-sm-2">Categoria</label>
        <div class="col-sm-4">
            <select name="categoria" id="categoria" class="form-select">
                <option value="">--- seleccionar ---</option>
                <% for(Categoria c: categorias){%>
                <option value="<%=c.getId()%>" <%=c.getId().equals(producto.getCategoria().getId())? "selected": ""%>><%=c.getNombre()%></option>
                <%}%>
            </select>
        </div>
        <% if(errores != null && errores.containsKey("categoria")){%>
                     <div style="color:red;"><%=errores.get("categoria")%></div>
                <% } %>
    </div>

    <div class="row  mb-2">
    <div>
         <input class="btn btn-primary"type="submit" value="<%=(producto.getId()!=null && producto.getId()>0)? "Editar": "Crear"%>">
    </div>
    </div>
    <input type="hidden" name="id" value="<%=producto.getId()%>">
</form>
</div>
</body>
</html>