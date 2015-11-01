(function ($) {

    $.fn.errorToggle = function (action, message) {

        var error = this;

        if (action == 'show') {
            error.parent().addClass('has-error');
            error.text(message);
            error.slideDown('fast');
        } else if (action == 'hide') {
            error.slideUp('fast', function () {
                error.parent().removeClass('has-error');
                error.text('');

                $('body').trigger('after-validation');
            });
        }

        return this;
    };

}(jQuery));
