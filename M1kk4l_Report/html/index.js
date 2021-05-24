$(function () {
    function display(bool) {
        if(bool){
            $(".container").show()
        } else {
            $(".container").hide()
        }
    }
    display(false)
    window.addEventListener("message", function(event) {
        var item = event.data;
        if(item.type === "ui"){
            if(item.status){
                display(true)
            } else {
                display(false)
            }
        }
    })
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://M1kk4l_report/luk', JSON.stringify({}));
        }
    };
    $("#luk").click(function() {
        $.post('http://M1kk4l_report/luk', JSON.stringify({})); 
    })
    $("button").click(function () {
        let navn = $("#navn").val()
        let tekst = $("#tekst").val()

        if(tekst.length >= 100) {
            $.post('http://M1kk4l_report/Fejl', JSON.stringify({
                Besked: "Du må ikke skrive over 100 tegn!",
            }));
        } else {
            $.post('http://M1kk4l_report/Tekst', JSON.stringify({
                Navn: navn,
                Grund: tekst,
            }));
        }
    })
})
