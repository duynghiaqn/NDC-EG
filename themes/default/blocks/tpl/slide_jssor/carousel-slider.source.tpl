<!-- BEGIN: main -->
<script>
    jQuery(document).ready(function ($) {
        var options = {
            $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
            $AutoPlaySteps: 1,                                  //[Optional] Steps to go for each navigation request (this options applys only when slideshow disabled), the default value is 1
            $AutoPlayInterval: 4000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
            $PauseOnHover: 1,                               //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

            $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
            $SlideDuration: 160,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
            $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
            $SlideWidth: {w_img},                                   //[Optional] Width of every slide in pixels, default value is width of 'slides' container
            $SlideHeight: {h_img},                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
            $SlideSpacing: 3, 					                //[Optional] Space between each slide in pixels, default value is 0
            $DisplayPieces: {DisplayPieces},                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
            $ParkingPosition: 0,                              //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
            $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
            $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
            $DragOrientation: 1,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)

            $BulletNavigatorOptions: {                                //[Optional] Options to specify and enable navigator or not
                $Class: $JssorBulletNavigator$,                       //[Required] Class to create navigator instance
                $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                $AutoCenter: 0,                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                $Steps: 1,                                      //[Optional] Steps to go for each navigation request, default value is 1
                $Lanes: 1,                                      //[Optional] Specify lanes to arrange items, default value is 1
                $SpacingX: 0,                                   //[Optional] Horizontal space between each item in pixel, default value is 0
                $SpacingY: 0,                                   //[Optional] Vertical space between each item in pixel, default value is 0
                $Orientation: 1                                 //[Optional] The orientation of the navigator, 1 horizontal, 2 vertical, default value is 1
            },

            $ArrowNavigatorOptions: {
                $Class: $JssorArrowNavigator$,              //[Requried] Class to create arrow navigator instance
                $ChanceToShow: 1,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                $AutoCenter: 2,                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                $Steps: 4                                       //[Optional] Steps to go for each navigation request, default value is 1
            }
        };

        window['carousel-slider.source_{bid}'] = new $JssorSlider$("carousel-slider.source_{bid}", options);
        function ScaleSlider() {
            var bodyWidth = document.body.clientWidth;
            if (bodyWidth)
                window['carousel-slider.source_{bid}'].$ScaleWidth(Math.min(bodyWidth, {width}));
            else
                window.setTimeout(ScaleSlider, 30);
        }
        ScaleSlider();
        $(window).bind("load", ScaleSlider);
        $(window).bind("resize", ScaleSlider);
        $(window).bind("orientationchange", ScaleSlider);
    });
</script>
<div style="text-align: center;">
<div id="carousel-slider.source_{bid}" style="display: inline-block;position: relative; top: 0px; left: 0px; width: {width}px; height: {height}px; overflow: hidden;">
    <div u="loading" style="position: absolute; top: 0px; left: 0px;">
        <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;
            background-color: #000; top: 0px; left: 0px;width: 100%;height:100%;">
        </div>
        <div style="position: absolute; display: block; background: url({NV_BASE_SITEURL}themes/{BLOCK_THEME}/images/jssor/loading.gif) no-repeat center center;
            top: 0px; left: 0px;width: 100%;height:100%;">
        </div>
    </div>
    <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: {width}px; height: {height}px; overflow: hidden;">
        <!-- BEGIN: loop -->
        <div>
            <a u=image href="{link}" target="_blank"><img alt="slide " src="{src}" /></a>
        </div>
        <!-- END: loop -->
    </div>
    <style>
        .jssorb03 {
            position: absolute;
        }
        .jssorb03 div, .jssorb03 div:hover, .jssorb03 .av {
            position: absolute;
            width: 21px;
            height: 21px;
            text-align: center;
            line-height: 21px;
            color: white;
            font-size: 12px;
            background: url({NV_BASE_SITEURL}themes/{BLOCK_THEME}/images/jssor/b03.png) no-repeat;
            overflow: hidden;
            cursor: pointer;
        }
        .jssorb03 div { background-position: -5px -4px; }
        .jssorb03 div:hover, .jssorb03 .av:hover { background-position: -35px -4px; }
        .jssorb03 .av { background-position: -65px -4px; }
        .jssorb03 .dn, .jssorb03 .dn:hover { background-position: -95px -4px; }
    </style>
    <div u="navigator" class="jssorb03" style="bottom: 4px; right: 6px;">
        <div u="prototype"><div u="numbertemplate"></div></div>
    </div>
    <style>
        .jssora03l, .jssora03r {
            display: block;
            position: absolute;
            width: 55px;
            height: 55px;
            cursor: pointer;
            background: url({NV_BASE_SITEURL}themes/{BLOCK_THEME}/images/jssor/a03.png) no-repeat;
            overflow: hidden;
        }
        .jssora03l { background-position: -3px -33px; }
        .jssora03r { background-position: -63px -33px; }
        .jssora03l:hover { background-position: -123px -33px; }
        .jssora03r:hover { background-position: -183px -33px; }
        .jssora03l.jssora03ldn { background-position: -243px -33px; }
        .jssora03r.jssora03rdn { background-position: -303px -33px; }
    </style>
    <span u="arrowleft" class="jssora03l" style="top: {h_divide2}px; left: 8px;">
    </span>
    <span u="arrowright" class="jssora03r" style="top: {h_divide2}px; right: 8px;">
    </span>
</div>
</div>
<!-- END: main -->