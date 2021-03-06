<!DOCTYPE html>
<html lang="en">

<head>
    <title>Contact</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <asset:stylesheet src="main.css" />
    <asset:stylesheet src="contact.css" />
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
        <h1 style="font-size:55px">Instantly reach us by filling form below</h1>
    </div>
    <form class="form-inline">
        <div class="form-group">
            <label for="inputName">Hi there, my name is</label>
            <!--input type="text" id="inputName" class="form-control mx-sm-3" aria-describedby="passwordHelpInline" placeholder="how people call you"-->
            <g:textField name="name" class="form-control mx-sm-3" aria-describedby="passwordHelpInline" placeholder="how people call you"></g:textField>
        </div>
        <div class="form-group">
            <label for="inputSpeak">I want to speak about</label>
            <!--input type="text" id="inputSpeak" class="form-control mx-sm-3" aria-describedby="passwordHelpInline" placeholder="what's the problem-->
            <g:textField name="speak" class="form-control mx-sm-3" aria-describedby="passwordHelpInline" placeholder="what's the problem"></g:textField>
        </div>
    </form>
    <form id="form-inline-2" class="form-inline">
        <div class="form-group">
            <label for="inputEmail">You can reach me via email at</label>
            <!--input type="text" id="inputEmail" class="form-control mx-sm-3" aria-describedby="passwordHelpInline" placeholder="the real one"-->
            <g:textField name="email" class="form-control mx-sm-3" aria-describedby="passwordHelpInline" placeholder="the real one"></g:textField>
        </div>
        <div class="form-group">
            <label for="inputContact">or</label>
            <!--input type="text" id="inputContact" class="form-control mx-sm-3" aria-describedby="passwordHelpInline" placeholder="skype, phone, codename"-->
            <g:textField name="contact" class="form-control mx-sm-3" aria-describedby="passwordHelpInline" placeholder="skype, phone, codename"></g:textField>
        </div>
    </form>
    <form id="form-inline-3" class="form-inline">
        <div class="form-group">
            <label class="normal" for="inputEmail">My ballpark for this project is</label>
            <!--input type="text" id="inputEmail" class="form-control mx-sm-3" aria-describedby="passwordHelpInline" placeholder="$$$$$"> US dollars.-->
            <g:textField name="money" class="form-control mx-sm-3" aria-describedby="passwordHelpInline" placeholder="\$\$\$\$\$"></g:textField> US dollars.
        </div>
    </form>
    <div class="form-actions">
        <g:link controller="contact" action="submit">
            <button id="button" type="button" class="btn btn-primary btn-md">Submit</button>
        </g:link>
    </div>
</body>

</html>