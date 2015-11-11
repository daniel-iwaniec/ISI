$(function () {
    var body = $('body');
    var form = $('#signin');

    var nameInput = form.find('#name');
    var surnameInput = form.find('#surname');
    var ageInput = form.find('#age');
    var emailInput = form.find('#email');

    var formSuccess = $('#signin-success');
    var nameError = form.find('#name-error');
    var surnameError = form.find('#surname-error');
    var ageError = form.find('#age-error');
    var emailError = form.find('#email-error');

    form.on('submit', function (event) {
        event.preventDefault();

        var name = nameInput.val();
        var surname = surnameInput.val();
        var age = ageInput.val();
        var email = emailInput.val();

        if (name.length == 0) {
            nameError.errorToggle('show', 'Podaj imię!');
        } else if (name.length < 3) {
            nameError.errorToggle('show', 'Imię musi zawierać conajmniej 3 znaki!');
        } else if (name.length > 50) {
            nameError.errorToggle('show', 'Imię może zawierać tylko 50 znaków!');
        } else {
            nameError.errorToggle('hide');
        }

        if (surname.length == 0) {
            surnameError.errorToggle('show', 'Podaj nazwisko!');
        } else if (surname.length < 3) {
            surnameError.errorToggle('show', 'Nazwisko musi zawierać conajmniej 3 znaki!');
        } else if (surname.length > 50) {
            surnameError.errorToggle('show', 'Nazwisko może zawierać tylko 50 znaków!');
        } else {
            surnameError.errorToggle('hide');
        }

        if (age.length == 0) {
            ageError.errorToggle('show', 'Podaj wiek!');
        } else if (!/^[1-9][0-9]{0,2}$/.test(age) || parseInt(age) < 1 || parseInt(age) > 150) {
            ageError.errorToggle('show', 'Wiek nie jest prawidłowy!');
        } else {
            ageError.errorToggle('hide');
        }

        if (email.length == 0) {
            emailError.errorToggle('show', 'Podaj email!');
        } else if (!/^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9]{2,4}$/.test(email)) {
            emailError.errorToggle('show', 'Adres email nie jest prawidłowy!');
        } else {
            emailError.errorToggle('hide');
        }

        body.trigger('after-validation');
    });

    body.on('after-validation', function () {
        if (!nameError.is(':visible') && !surnameError.is(':visible') && !ageError.is(':visible') && !emailError.is(':visible')) {
            form.hide('fast');
            formSuccess.show('fast', function() {
                $('h2').css('color', '#3c763d');
            });
            formSuccess.text('Pomyślnie zarejestrowano');
        }
    });
});
