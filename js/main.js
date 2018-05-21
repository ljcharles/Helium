function viewData() {
    $.ajax({
        type: "GET",
        url: "viewDataHandler.php",
        success: function (data) {
            $("#displayMyText").html(data);
            $('#boutonValider').show();
            var video = $("#v1");
            video.src = "../projet/video.mp4";
            video[0].load();
            if(video[0].play()) return true;
        }
    });
}


$(function () {

    var boutonValider = document.getElementById('boutonValider');

    boutonValider.addEventListener("click", function (e) {
        e.preventDefault();
        var monTexte = $("#monTexte").val();

        if( monTexte !== ""){
            var data = "monTexte=" + monTexte;

            $('#boutonValider').hide();
            $("#displayMyText").html('En attente...');

            $.ajax({
                type: "POST",
                url: "./collectDataHandler.php",
                data: data,
                success: function () {
                    viewData();
                }
            });
        }
    });
});