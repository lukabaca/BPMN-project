<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="/css/main.css" rel="stylesheet">
    <title>All offers</title>
    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <script src="/js/main.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12 header">
                <h2>All offers</h2>
                <a href="/offer">Add offer</a>
            </div>
            <div class="col-md-12">
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Prize</th>
                            <th>Approved</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${offers}" var="offer">
                            <tr row-id="${offer.id}">
                                <td>${offer.id}</td>
                                <td>${offer.title}</td>
                                <td>${offer.description}</td>
                                <td>${offer.prize}</td>
                                <c:if test = "${offer.verified}">
                                    <td>
                                        <c:if test = "${offer.approved}">
                                            <span class="offer-approved">Offer is approved</span>
                                        </c:if>
                                        <c:if test = "${!offer.approved}">
                                            <span class="offer-rejected">Offer is rejected</span>
                                        </c:if>
                                    </td>
                                </c:if>
                                <c:if test = "${!offer.verified}">
                                    <td>
                                        <button class="btn btn-primary accept-btn">Accept</button>
                                        <button class="btn btn-secondary refuse-btn">Refuse</button>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
