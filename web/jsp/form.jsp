<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<% Boolean success = (Boolean) request.getAttribute("success"); %>
<% Map<String, String> errors = (Map<String, String>) request.getAttribute("errors"); %>

<!doctype html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Daniel Iwaniec, Artur Kałuża">

    <title>ISI Formularz</title>

    <link href="assets/app.min.css" rel="stylesheet">
    <script src="assets/app.min.js"></script>
</head>

<body>
<main class="container">

    <h2 class="form-signin-heading">Rejestracja</h2>

    <% if (success != null && success) { %>
    <div id="signin-success" class="alert alert-success" role="alert">Pomyślnie zarejestrowano</div>
    <% } %>

    <form id="signin" class="form-signin" action="/" method="post">
        <div id="name-wrapper">
            <label for="name" class="sr-only">Imię</label>
            <input type="text"
                   id="name"
                   name="name"
                   class="form-control form-register-control"
                   placeholder="Imię"
                   autofocus
                   value="${param.name}">

            <% if (errors != null && errors.get("name") != null && errors.get("name").length() > 0) { %>
            <div id="name-error" class="alert alert-danger" role="alert"><%= errors.get("name") %></div>
            <% } %>
        </div>

        <div id="surname-wrapper">
            <label for="surname" class="sr-only">Nazwisko</label>
            <input type="text"
                   id="surname"
                   name="surname"
                   class="form-control form-register-control"
                   placeholder="Nazwisko"
                   value="${param.surname}">

            <% if (errors != null && errors.get("surname") != null && errors.get("surname").length() > 0) { %>
            <div id="surname-error" class="alert alert-danger" role="alert"><%= errors.get("surname") %></div>
            <% } %>
        </div>

        <div id="age-wrapper">
            <label for="age" class="sr-only">Wiek</label>
            <input type="text"
                   id="age"
                   name="age"
                   class="form-control form-register-control"
                   placeholder="Wiek"
                   value="${param.age}">

            <% if (errors != null && errors.get("age") != null && errors.get("age").length() > 0) { %>
            <div id="age-error" class="alert alert-danger" role="alert"><%= errors.get("age") %></div>
            <% } %>
        </div>

        <div id="email-wrapper">
            <label for="email" class="sr-only">Adres email</label>
            <input type="text"
                   id="email"
                   name="email"
                   class="form-control form-register-control"
                   placeholder="Adres email"
                   value="${param.email}">

            <% if (errors != null && errors.get("email") != null && errors.get("email").length() > 0) { %>
            <div id="email-error" class="alert alert-danger" role="alert"><%= errors.get("email") %></div>
            <% } %>
        </div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Wyślij</button>
    </form>

</main>
</body>
</html>
