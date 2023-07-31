<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: TTT
  Date: 2023/07/30
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<jsp:useBean id="personeTO" class="com.example.objectexample.transfareObject.PersoneTO" scope="session"></jsp:useBean>
<jsp:useBean id="address" class="com.example.objectexample.transfareObject.Address" scope="session"></jsp:useBean>
<c:set target="${personeTO}" property="address" value="${address}"></c:set>
<%--Установка значения адресса и персонаТО после выполнения перехода на эту же самю страницу--%>
<c:set target="${personeTO}" property="name" value='<%=request.getParameter("name")%>'></c:set>
<c:if test='<%=request.getParameter("age") != null%>'>
    <c:set target="${personeTO}" property="age" value='<%=Integer.parseInt(request.getParameter("age"))%>'></c:set>
</c:if>
<c:set target="${address}" property="city" value='<%=request.getParameter("city")%>'></c:set>
<c:set target="${address}" property="country" value='<%=request.getParameter("country")%>'></c:set>
<c:if test='<%=request.getParameter("zipCode") != null%>'>
    <c:set target="${address}" property="zipCode"
           value='<%=Integer.parseInt(request.getParameter("zipCode"))%>'></c:set>
</c:if>
<%--<c:set target="${personeTO}" property="delete" value='<%=request.getParameter("oldPhone")%>'></c:set>--%>
<c:set target="${personeTO}" property="phone" value='<%=request.getParameter("phone")%>'></c:set>
<%--<c:set target="${personeTO}" property="update" value="${paramValues.newPhone[param.index]}"></c:set>--%>

<form method="post">
    <div class="header">
        <h3>Header</h3>
        Старый телефоный номер <%=request.getParameter("oldPhone")%></br>
        <%--<c:if test='<%=request.getParameter("phone") != null%>'>--%>
        <%--Новый телефоный номер <%=request.getParameterValues("newPhone")[Integer.parseInt(request.getParameter("index"))]%></br>--%>
        <%--</c:if>--%>
        <c:if test="${not empty personeTO.phones}">
            <c:if test="${not empty param.newPhone and not empty param.index}">
                Новый телефонный номер ${paramValues.newPhone[param.index]}
            </c:if>
            <%--    Новый телефоный номер <%=request.getParameterValues("newPhone")[Integer.parseInt(request.getParameter("index"))]%></br>--%>
        </c:if>
    </div>

    <div class="left">
        <h4>left</h4>
    </div>
    <div class="content">
        <div class="left-content">

            Name
            <input type="text" required name="name" value="${personeTO.name}"></br>
            Age
            <input type="text" required name="age" value="${personeTO.age}"></br>
            City
            <input type="text" required name="city" value="${address.city}"></br>
            Country
            <input type="text" required name="country" value="${address.country}"></br>
            Zip code
            <input type="text" required name="zipCode" value="${address.zipCode}"></br>
            Phones</br>
            <h3>left-content</h3>
        </div>
        <div class="midl-content">
            <c:if test='<%="update".equals(request.getParameter("command"))%>'>
                <c:set target="${personeTO}" property="update"
                       value='<%=Arrays.toString(request.getParameterValues("newPhone"))%>'></c:set>
                Zashel!!!!!!!!!!
                <%--                <c:forTokens items='<%=Arrays.toString(request.getParameterValues("newPhone"))%>' delims="[, ]"--%>
                <%--                             var="phone">--%>
                <%--                    <c:set target="${personeTO}" property="delete" value='<%=request.getParameter("oldPhone")[]%>'></c:set>--%>
                <%--&lt;%&ndash;                    <c:set target="${personeTO}" property="delete" value="${request.getParameterValues('oldPhone')}" />&ndash;%&gt;--%>
                <%--                    <c:set target="${personeTO}" property="update" value="${phone}"></c:set>--%>
                <%--                </c:forTokens>--%>

            </c:if>

            <c:if test='<%="delete".equals(request.getParameter("command"))%>'>
                <c:set target="${personeTO}" property="deletes" value='<%=Arrays.toString(request.getParameterValues("selected"))%>'></c:set>

            </c:if>

            <c:forTokens items="${personeTO.phones}" delims="[, ]" var="phone" varStatus="status">
                ${status.index} <input type="text" name="newPhone" value="${phone}">
                <input type="checkbox" value="${status.index}" name="selected"></br>
            </c:forTokens>

            <input type="submit"
                   formaction="${pageContext.request.contextPath}/createPersone.jsp?command=update"
                   value="update phone"></br>
            <input type="submit"
                   formaction="${pageContext.request.contextPath}/createPersone.jsp?command=delete"
                   value="delete phone">
            <h3>midl-content</h3>
        </div>
        <div class="right-content">
            <input type="text" name="phone" value="${phone}"></br>
            <input type="submit" formaction="${pageContext.request.contextPath}/createPersone.jsp" value="save"></br>
            <input type="submit" value="save person" formaction="FrontController?command=addPerson">
            <h3>right-content</h3>
        </div>

    </div>
    <div class="right">
        <h3>right</h3></div>
    <div class="footer">
        <h3>Footer</h3>
    </div>
</form>
</body>
</html>
