$(document).ready(function () {
    $('.header__burger').click(function(event) {
        $('.header__burger,.header__menu').toggleClass('active');
        $('body').toggleClass('_lock_');
    });
});


$(document).ready(function() {
    $('.faq__title').click(function (event) {
        $(this).toggleClass('active').next().slideToggle(300);
    });
});