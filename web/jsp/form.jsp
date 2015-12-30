<%@ page contentType="text/html; charset=UTF-8" %>

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

    <div id="signin-success" class="alert alert-success" role="alert"></div>

    <form id="signin" class="form-signin" action="/" method="post">
        <div id="name-wrapper">
            <label for="name" class="sr-only">Imię</label>
            <input type="text" id="name" class="form-control form-register-control" placeholder="Imię" autofocus>

            <div id="name-error" class="alert alert-danger" role="alert"></div>
        </div>

        <div id="surname-wrapper">
            <label for="surname" class="sr-only">Nazwisko</label>
            <input type="text" id="surname" class="form-control form-register-control" placeholder="Nazwisko">

            <div id="surname-error" class="alert alert-danger" role="alert"></div>
        </div>

        <div id="age-wrapper">
            <label for="age" class="sr-only">Wiek</label>
            <input type="text" id="age" class="form-control form-register-control" placeholder="Wiek">

            <div id="age-error" class="alert alert-danger" role="alert"></div>
        </div>

        <div id="email-wrapper">
            <label for="email" class="sr-only">Adres email</label>
            <input type="text" id="email" class="form-control form-register-control" placeholder="Adres email">

            <div id="email-error" class="alert alert-danger" role="alert"></div>
        </div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Wyślij</button>
    </form>

</main>
</body>
</html>