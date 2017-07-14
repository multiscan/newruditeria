var mousetimeout;
var screensaver_active = false;
var idletime = 20;

function show_screensaver(){
    $('#screensaver').fadeIn();
    screensaver_active = true;
}

function stop_screensaver(){
    $('#screensaver').fadeOut();
    screensaver_active = false;
}

$(document).mousemove(function(){
    clearTimeout(mousetimeout);

    if (screensaver_active) {
        stop_screensaver();
    }

    mousetimeout = setTimeout(function(){
        show_screensaver();
    }, 1000 * idletime); // 5 secs
});
