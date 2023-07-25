<%--
  Created by IntelliJ IDEA.
  User: TTT
  Date: 25.07.2023
  Time: 09:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
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
<c:set target="${address}" property="zipCode" value='<%=Integer.parseInt(request.getParameter("zipCode"))%>'></c:set>
</c:if>
<c:set target="${personeTO}" property="phone" value='<%=request.getParameter("phone")%>'></c:set>
<c:set target="${personeTO}" property="updatePhone" var='<%=request.getParameter("myPhones")%>'></c:set>
<form method="post">
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
    <c:forTokens items="${personeTO.phones}" delims="[,null ]" var="phones">
        <input type="text" name="myPhones" value="${phones}"></br>
        <input type="hidden" name="originalPhone" value="${phones}">
    </c:forTokens>
    <input type="text" name="phone" value="${phone}">
    <input type="submit" formaction="${pageContext.request.contextPath}/addPerson.jsp" value="save"></br>
    <input type="submit" value="save person" formaction="FrontController?command=addPerson">
</form>

</body>
</html>
