<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="/css/main.css" rel="stylesheet">
    <title>Add offer</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12 header">
                <h2>Send your offer !</h2>
                <a href="/offers">View all offers</a>
            </div>
            <div class="col-md-12">
                <form:form method="POST" action="/addOffer" modelAttribute="offer">
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input type="text" class="form-control" id="title" name="title" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <input type="text" class="form-control" id="description" name="description" required>
                    </div>
                    <div class="form-group">
                        <label for="prize">prize</label>
                        <input type="text" class="form-control" id="prize" name="prize" required>
                    </div>
                    <button class="btn btn-primary submit-btn" type="submit">Send</button>
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>
