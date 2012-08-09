<html>
    <head>
        <title>Welcome to LSC Test Development</title>
        <meta name="layout" content="main" />
        <style type="text/css" media="screen">

        #nav {
            margin-top:20px;
            margin-left:30px;
            width:228px;
            float:left;

        }
        .homePagePanel * {
            margin:0px;
        }
        .homePagePanel .panelBody ul {
            list-style-type:none;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody h1 {
            text-transform:uppercase;
            font-size:1.1em;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody {
            background: url(images/leftnav_midstretch.png) repeat-y top;
            margin:0px;
            padding:15px;
        }
        .homePagePanel .panelBtm {
            background: url(images/leftnav_btm.png) no-repeat top;
            height:20px;
            margin:0px;
        }

        .homePagePanel .panelTop {
            background: url(images/leftnav_top.png) no-repeat top;
            height:11px;
            margin:0px;
        }
        h2 {
            margin-top:15px;
            margin-bottom:15px;
            font-size:1.2em;
        }
        #pageBody {
            margin-left:55px;
            margin-right:20px;
        }
         #dev {
            margin-left:155px;
            margin-right:20px;
        }
        </style>
    </head>
    <body>
      <div ><a href="http://itbats.unm.edu"><img src="${resource(dir:'images',file:'BATS.gif')}" alt="Grails" border="0" /></a></div>
        <div id="pageBody">
            <h3>Welcome to LSC Test Development</h3>
            <br>
            <p>This is the University of New Mexico Test Development site we are developing in the following new technologies: </p>
            <br>
            <div id="dev">
            <li>Jquery</li>
            <li>JSON</li>
            <li>backbone</li> 
            <li>multiple tabs</li>
            <li>navigation plugin</li>
            </div>

           <div id="pageBody">
                <h1>Please select development resource:</h1>
           </div>
                 <div id="dev" >
                <li class="controller">
              
                <a href="new/tabs">Multiple Tabs Development</a>
                </li>
                <li>
                  <a href="customer/list">JSON with UI/Lightness Theme.</a>
                </li>
                <li>
                  <a href="tab/list">New JSON editor.</a>
                </li>
                </div>
           
        </div>
    </body>
</html>
