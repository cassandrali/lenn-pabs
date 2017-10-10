<!DOCTYPE html>
<html lang="en">

<head>
    <title>About</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--asset:fonts src="5yearsoldfont.medium.ttf" /-->
    <asset:stylesheet src="main.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
        $('.container.text-center').fadeIn(1000);
    });
    $(document).ready(function() {
        $(".dropdown-toggle").dropdown();
    });
    </script>
</head>

<body>
    <nav class="navbar navbar-inverse" style="background-color: #003333;">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/home/index">
                    <g:img height="18px" dir="images" file="rectangularblock1.png" align="left" style="margin-left:20px;" />
                </a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a class="white" href="/about/index">About</a></li>
                    <li><a class="white" href="/projects/index">Projects</a></li>
                    <li><a class="white" href="/blog/index">Blog</a></li>
                    <li><a class="white" href="/contact/index">Contact</a></li>
                    <li class="dropdown">
                        <a class="white" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">??? <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/buy/index">>:)</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
        <!--/.container-fluid -->
    </nav>
    <div class="container text-center">
        <h1 style="font-size:55px">Meet the Team</h1>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-sm-6" align="center">
                <g:img dir="images" file="chiffany.jpg" align="center" style="height:250px;" />
                <h3>Chiffany Tang</h3>
                <h4>Chief UI/UX Designer</h4>
                <!--p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...</p-->
            </div>
            <div class="col-sm-6" align="center">
                <g:img dir="images" file="dosh.jpg" align="center" style="height:250px;" />
                <h3>Dosh Joman</h3>
                <h4>~CEO~</h4>
                <!--p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...</p-->
            </div>
        </div>
    </div>
</body>

</html>