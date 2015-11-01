$(function () {
    var form = $('#signin');

    var formSuccess = $('#signin-success');
    var nameError = form.find('#name-error');
    var surnameError = form.find('#surname-error');
    var ageError = form.find('#age-error');
    var emailError = form.find('#email-error');

    formSuccess.hide();
    nameError.hide();
    surnameError.hide();
    ageError.hide();
    emailError.hide();

    var showError = function (errorBox, errorMsg) {
        errorBox.parent().addClass('has-error');
        errorBox.text(errorMsg);
        errorBox.slideDown('slow');
    };

    var hideError = function (errorBox) {
        errorBox.slideUp(500, function () {
            errorBox.parent().removeClass('has-error');
            errorBox.text('');
        });
    };

    form.on('submit', function (event) {
        event.preventDefault();

        var name = form.find('input#name').val();
        var surname = form.find('input#surname').val();
        var age = form.find('input#age').val();
        var email = form.find('input#email').val();

        if (name.length == 0) {
            showError(nameError, 'Podaj imię!');
        } else if (name.length < 3) {
            showError(nameError, 'Imię musi zawierać conajmniej 3 znaki!');
        } else if (name.length > 50) {
            showError(nameError, 'Imię może zawierać tylko 50 znaków!');
        } else {
            hideError(nameError);
        }

        if (surname.length == 0) {
            showError(surnameError, 'Podaj nazwisko!');
        } else if (surname.length < 3) {
            showError(surnameError, 'Nazwisko musi zawierać conajmniej 3 znaki!');
        } else if (surname.length > 50) {
            showError(surnameError, 'Nazwisko może zawierać tylko 50 znaków!');
        } else {
            hideError(surnameError);
        }

        if (age.length == 0) {
            showError(ageError, 'Podaj wiek!');
        } else if (!/^[1-9][0-9]{0,2}$/.test(age) || parseInt(age) < 1 || parseInt(age) > 150) {
            showError(ageError, 'Wiek nie jest prawidłowy!');
        } else {
            hideError(ageError);
        }

        if (email.length == 0) {
            showError(emailError, 'Podaj email!');
        } else if (!/^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9]{2,4}$/.test(email)) {
            showError(emailError, 'Adres email nie jest prawidłowy!');
        } else {
            hideError(emailError);
        }

        if (!nameError.is(':visible') && !surnameError.is(':visible') && !ageError.is(':visible') && !emailError.is(':visible')) {
            form.hide(500);
            formSuccess.show(500);
            formSuccess.text('Pomyślnie zarejestrowano.');
        }
    });
});
