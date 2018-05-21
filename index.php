<!DOCTYPE html>
<html lang="fr-GP">
    <head>
        <meta charset="UTF-8">
        <meta name="author" content="freshloic">
        <link href="img/favicon.ico" rel="icon">
        <title>FreshLoïc | HELIUM TECHNOLOGIES</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="js/jquery3.min.js"></script>
        <script src="js/main.js"></script>
    </head>
    <body>
        <main>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="#">
                    <span class="text-muted"><i class="fa fa-circle text-success" aria-hidden="true"></i> HELIUM</span>
                    <span class="badge badge-secondary">TECHNOLOGIES</span>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <div class="nav">
                            <a class="nav-item nav-link active" href="#"><i class="fa fa-home"></i> Accueil <span class="sr-only">(current)</span></a>
                            <a class="nav-item nav-link" href="#">A propos</a>
                            <a class="nav-item nav-link" href="#">Contact</a>
                        </div>
                    </div>
                </div>
            </nav>
            <div class="container">
                <div class="jumbotron text-center font-weight-bold font-italic mx-0 banner d-block">
                    <h1 class="text-light">
                        <i class="fa fa-paint-brush" aria-hidden="true"></i> Projet Adobe After Effect
                    </h1>
                    <span class="text-light font-weight-light">
                        JEAN-CHARLES Loïc M1 INFORMATIQUE
                    </span>
                </div>

                <div class="row container mx-0">
                        <div class="col-lg-6">
                            <div class="jumbotron min-height-20 text-center z-depth-2">
                                <div class="input-group mb-2 mr-sm-2 marginTopMoins50">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fa fa-pencil" aria-hidden="true"></i></div>
                                    </div>
                                    <input type="text"
                                           class="form-control"
                                           id="monTexte"
                                           name="monTexte"
                                           placeholder="Entrer votre texte">
                                </div>

                                <button type="submit" id="boutonValider" class="btn btn-dark mb-2">Valider</button>
                            </div>
                            <div class="jumbotron text-center min-height-20 z-depth-2">
                                <span class="text-info">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                    Texte à afficher :
                                </span>
                                <span class="text-success" id="displayMyText">Aucun</span>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="jumbotron text-center min-height-290 z-depth-2">
                                <span class="center-text-trick text-info">
                                    <video id="v1" controls="controls"
                                           width="450"
                                           height="280"
                                           style="margin-top: -60px;">
                                        <source src="projet/video.mp4" type="video/mp4" />
                                        La vidéo sera générée ici.
                                    </video>
                                </span>
                            </div>
                        </div>
                </div>
            </div>

        </main>

        <br>
        <footer>
            <div class="text-center container">
                <span class="badge badge-secondary p-2">
                     © <?= date('Y'); ?> Freshloic.esy.es
                </span>
            </div>
        </footer>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>