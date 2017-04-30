	<noscript>
		<div class="alert alert-danger">{LANG.nojs}</div>
	</noscript>
	<div class="wraper">
		<header>
			<div class="container">
				<div id="header">
				    <div class="banner col-xs-24 col-sm-24 col-md-24">
                        <!-- BEGIN: image -->
                       <a title="{SITE_NAME}" href="{THEME_SITE_HREF}"><img class="img-responsive" src="{BANNER_SRC}" width="auto" height="auto" alt="{SITE_NAME}" /></a>
                        <!-- END: image -->
			<!-- BEGIN: swf -->
                        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="{BANNER_WIDTH}" height="{BANNER_HEIGHT}" >
                   	        <param name="wmode" value="transparent" />
                           	<param name="movie" value="{BANNER_SRC}" />
                           	<param name="quality" value="high" />
                           	<param name="menu" value="false" />
                           	<param name="seamlesstabbing" value="false" />
                           	<param name="allowscriptaccess" value="samedomain" />
                           	<param name="loop" value="true" />
                           	<!--[if !IE]> <-->
                           	<object type="application/x-shockwave-flash" width="{BANNER_WIDTH}" height="{BANNER_HEIGHT}" data="{BANNER_SRC}" >
                                <param name="wmode" value="transparent" />
                                <param name="pluginurl" value="http://www.adobe.com/go/getflashplayer" />
                                <param name="loop" value="true" />
                                <param name="quality" value="high" />
                                <param name="menu" value="false" />
                                <param name="seamlesstabbing" value="false" />
                                <param name="allowscriptaccess" value="samedomain" />
                       	    </object>
                            <!--> <![endif]-->
                        </object>
                        <!-- END: swf -->
				</div>
				    </div>
			</div>
		</header>
		<nav class="second-nav" id="menusite">
			<div class="container">
		[MENU_SITE]           		
			</div>
		</nav>
		<section>
			<div class="container" id="body">             
                [THEME_ERROR_INFO]
