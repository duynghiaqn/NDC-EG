<!-- BEGIN: main -->
<script>
        jQuery(document).ready(function ($) {
            var _SlideshowTransitions = [
                //Fade Twins
                { $Duration: 700, $Opacity: 2, $Brother: { $Duration: 1000, $Opacity: 2 } },
                //Rotate Overlap
                { $Duration: 1200, $Zoom: 11, $Rotate: -1, $Easing: { $Zoom: $JssorEasing$.$EaseInQuad, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInQuad }, $Opacity: 2, $Round: { $Rotate: 0.5 }, $Brother: { $Duration: 1200, $Zoom: 1, $Rotate: 1, $Easing: $JssorEasing$.$EaseSwing, $Opacity: 2, $Round: { $Rotate: 0.5 }, $Shift: 90 } },
                //Switch
                { $Duration: 1400, x: 0.25, $Zoom: 1.5, $Easing: { $Left: $JssorEasing$.$EaseInWave, $Zoom: $JssorEasing$.$EaseInSine }, $Opacity: 2, $ZIndex: -10, $Brother: { $Duration: 1400, x: -0.25, $Zoom: 1.5, $Easing: { $Left: $JssorEasing$.$EaseInWave, $Zoom: $JssorEasing$.$EaseInSine }, $Opacity: 2, $ZIndex: -10 } },
                //Rotate Relay
                { $Duration: 1200, $Zoom: 11, $Rotate: 1, $Easing: { $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInQuad }, $Opacity: 2, $Round: { $Rotate: 1 }, $ZIndex: -10, $Brother: { $Duration: 1200, $Zoom: 11, $Rotate: -1, $Easing: { $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInQuad }, $Opacity: 2, $Round: { $Rotate: 1 }, $ZIndex: -10, $Shift: 600 } },
                //Doors
                { $Duration: 1500, x: 0.5, $Cols: 2, $ChessMode: { $Column: 3 }, $Easing: { $Left: $JssorEasing$.$EaseInOutCubic }, $Opacity: 2, $Brother: { $Duration: 1500, $Opacity: 2 } },
                //Rotate in+ out-
                { $Duration: 1500, x: -0.3, y: 0.5, $Zoom: 1, $Rotate: 0.1, $During: { $Left: [0.6, 0.4], $Top: [0.6, 0.4], $Rotate: [0.6, 0.4], $Zoom: [0.6, 0.4] }, $Easing: { $Left: $JssorEasing$.$EaseInQuad, $Top: $JssorEasing$.$EaseInQuad, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInQuad }, $Opacity: 2, $Brother: { $Duration: 1000, $Zoom: 11, $Rotate: -0.5, $Easing: { $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInQuad }, $Opacity: 2, $Shift: 200 } },
                //Fly Twins
                { $Duration: 1500, x: 0.3, $During: { $Left: [0.6, 0.4] }, $Easing: { $Left: $JssorEasing$.$EaseInQuad, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2, $Outside: true, $Brother: { $Duration: 1000, x: -0.3, $Easing: { $Left: $JssorEasing$.$EaseInQuad, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 } },
                //Rotate in- out+
                { $Duration: 1500, $Zoom: 11, $Rotate: 0.5, $During: { $Left: [0.4, 0.6], $Top: [0.4, 0.6], $Rotate: [0.4, 0.6], $Zoom: [0.4, 0.6] }, $Easing: { $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInQuad }, $Opacity: 2, $Brother: { $Duration: 1000, $Zoom: 1, $Rotate: -0.5, $Easing: { $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInQuad }, $Opacity: 2, $Shift: 200 } },
                //Rotate Axis up overlap
                { $Duration: 1200, x: 0.25, y: 0.5, $Rotate: -0.1, $Easing: { $Left: $JssorEasing$.$EaseInQuad, $Top: $JssorEasing$.$EaseInQuad, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInQuad }, $Opacity: 2, $Brother: { $Duration: 1200, x: -0.1, y: -0.7, $Rotate: 0.1, $Easing: { $Left: $JssorEasing$.$EaseInQuad, $Top: $JssorEasing$.$EaseInQuad, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInQuad }, $Opacity: 2 } },
                //Chess Replace TB
                { $Duration: 1600, x: 1, $Rows: 2, $ChessMode: { $Row: 3 }, $Easing: { $Left: $JssorEasing$.$EaseInOutQuart, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2, $Brother: { $Duration: 1600, x: -1, $Rows: 2, $ChessMode: { $Row: 3 }, $Easing: { $Left: $JssorEasing$.$EaseInOutQuart, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 } },
                //Chess Replace LR
                { $Duration: 1600, y: -1, $Cols: 2, $ChessMode: { $Column: 12 }, $Easing: { $Top: $JssorEasing$.$EaseInOutQuart, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2, $Brother: { $Duration: 1600, y: 1, $Cols: 2, $ChessMode: { $Column: 12 }, $Easing: { $Top: $JssorEasing$.$EaseInOutQuart, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 } },
                //Shift TB
                { $Duration: 1200, y: 1, $Easing: { $Top: $JssorEasing$.$EaseInOutQuart, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2, $Brother: { $Duration: 1200, y: -1, $Easing: { $Top: $JssorEasing$.$EaseInOutQuart, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 } },
                //Shift LR
                { $Duration: 1200, x: 1, $Easing: { $Left: $JssorEasing$.$EaseInOutQuart, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2, $Brother: { $Duration: 1200, x: -1, $Easing: { $Left: $JssorEasing$.$EaseInOutQuart, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 } },
                //Return TB
                { $Duration: 1200, y: -1, $Easing: { $Top: $JssorEasing$.$EaseInOutQuart, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2, $ZIndex: -10, $Brother: { $Duration: 1200, y: -1, $Easing: { $Top: $JssorEasing$.$EaseInOutQuart, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2, $ZIndex: -10, $Shift: -100 } },
                //Return LR
                { $Duration: 1200, x: 1, $Delay: 40, $Cols: 6, $Formation: $JssorSlideshowFormations$.$FormationStraight, $Easing: { $Left: $JssorEasing$.$EaseInOutQuart, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2, $ZIndex: -10, $Brother: { $Duration: 1200, x: 1, $Delay: 40, $Cols: 6, $Formation: $JssorSlideshowFormations$.$FormationStraight, $Easing: { $Top: $JssorEasing$.$EaseInOutQuart, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2, $ZIndex: -10, $Shift: -100 } },
                //Rotate Axis down
                { $Duration: 1500, x: -0.1, y: -0.7, $Rotate: 0.1, $During: { $Left: [0.6, 0.4], $Top: [0.6, 0.4], $Rotate: [0.6, 0.4] }, $Easing: { $Left: $JssorEasing$.$EaseInQuad, $Top: $JssorEasing$.$EaseInQuad, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInQuad }, $Opacity: 2, $Brother: { $Duration: 1000, x: 0.2, y: 0.5, $Rotate: -0.1, $Easing: { $Left: $JssorEasing$.$EaseInQuad, $Top: $JssorEasing$.$EaseInQuad, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInQuad }, $Opacity: 2 } },
                //Extrude Replace
                { $Duration: 1600, x: -0.2, $Delay: 40, $Cols: 12, $During: { $Left: [0.4, 0.6] }, $SlideOut: true, $Formation: $JssorSlideshowFormations$.$FormationStraight, $Assembly: 260, $Easing: { $Left: $JssorEasing$.$EaseInOutExpo, $Opacity: $JssorEasing$.$EaseInOutQuad }, $Opacity: 2, $Outside: true, $Round: { $Top: 0.5 }, $Brother: { $Duration: 1000, x: 0.2, $Delay: 40, $Cols: 12, $Formation: $JssorSlideshowFormations$.$FormationStraight, $Assembly: 1028, $Easing: { $Left: $JssorEasing$.$EaseInOutExpo, $Opacity: $JssorEasing$.$EaseInOutQuad }, $Opacity: 2, $Round: { $Top: 0.5 } } }
            ];
            var options = {
                $FillMode: 1,                                       //[Optional] The way to fill image in slide, 0 stretch, 1 contain (keep aspect ratio and put all inside slide), 2 cover (keep aspect ratio and cover whole slide), 4 actual size, 5 contain for large image, actual size for small image, default value is 0
                $DragOrientation: 3,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)
                $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                $AutoPlayInterval: 2500,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                $SlideshowOptions: {                                //[Optional] Options to specify and enable slideshow or not
                    $Class: $JssorSlideshowRunner$,                 //[Required] Class to create instance of slideshow
                    $Transitions: _SlideshowTransitions,            //[Required] An array of slideshow transitions to play slideshow
                    $TransitionsOrder: 1,                           //[Optional] The way to choose transition to play slide, 1 Sequence, 0 Random
                    $ShowLink: true                                    //[Optional] Whether to bring slide link on top of the slider when slideshow is running, default value is false
                },

                $BulletNavigatorOptions: {                                //[Optional] Options to specify and enable navigator or not
                    $Class: $JssorBulletNavigator$,                       //[Required] Class to create navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 1,                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                    $Steps: 1,                                      //[Optional] Steps to go for each navigation request, default value is 1
                    $Lanes: 1,                                      //[Optional] Specify lanes to arrange items, default value is 1
                    $SpacingX: 10,                                  //[Optional] Horizontal space between each item in pixel, default value is 0
                    $SpacingY: 10,                                  //[Optional] Vertical space between each item in pixel, default value is 0
                    $Orientation: 1                                 //[Optional] The orientation of the navigator, 1 horizontal, 2 vertical, default value is 1
                },
                $ArrowNavigatorOptions: {
                    $Class: $JssorArrowNavigator$,              //[Requried] Class to create arrow navigator instance
                    $ChanceToShow: 2                                //[Required] 0 Never, 1 Mouse Over, 2 Always
                }
            };

            window['different-size-photo-slider.source_{bid}'] = new $JssorSlider$("different-size-photo-slider.source_{bid}", options);
            function ScaleSlider() {
                var parentWidth = window['different-size-photo-slider.source_{bid}'].$Elmt.parentNode.clientWidth;
                if (parentWidth)
                    window['different-size-photo-slider.source_{bid}'].$ScaleWidth(Math.min(parentWidth, {width}));
                else
                    window.setTimeout(ScaleSlider, 30);
            }
            ScaleSlider();
            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
            //responsive code end
        });
    </script>
    <div style="text-align: center;">
    <div id="different-size-photo-slider.source_{bid}" style="display: inline-block;position: relative; width: {width}px; height: {height}px; background-color: #fff; overflow: hidden; ">
        <div u="loading" style="position: absolute; top: 0px; left: 0px;">
            <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;
                background-color: #fff; top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
            <div style="position: absolute; display: block; background: url({NV_BASE_SITEURL}themes/{BLOCK_THEME}/images/jssor/loading.gif) no-repeat center center;
                top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
        </div>
        <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: {width}px; height: {height}px; overflow: hidden;">
            <!-- BEGIN: loop -->
            <div>
                <a u=image href="{link}" target="_blank"><img src="{src}" /></a>
            </div>
            <!-- END: loop -->
        </div>
        <style>
            .jssorb13 {
                position: absolute;
            }
            .jssorb13 div, .jssorb13 div:hover, .jssorb13 .av {
                position: absolute;
                width: 15px;
                height: 15px;
                background: url({NV_BASE_SITEURL}themes/{BLOCK_THEME}/images/jssor/b13.png) no-repeat;
                overflow: hidden;
                cursor: pointer;
            }
            .jssorb13 div { background-position: -5px -5px; }
            .jssorb13 div:hover, .jssorb13 .av:hover { background-position: -35px -5px; }
            .jssorb13 .av { background-position: -65px -5px; }
            .jssorb13 .dn, .jssorb13 .dn:hover { background-position: -95px -5px; }
        </style>
        <div u="navigator" class="jssorb13" style="bottom: 16px; right: 6px;">
            <div u="prototype"></div>
        </div>
        <style>
            .jssora05l, .jssora05r {
                display: block;
                position: absolute;
                width: 20px;
                height: 20px;
                cursor: pointer;
                background: url({NV_BASE_SITEURL}themes/{BLOCK_THEME}/images/jssor/a17.png) no-repeat;
                overflow: hidden;
            }
            .jssora05l { background-position: -10px -40px; }
            .jssora05r { background-position: -70px -40px; }
            .jssora05l:hover { background-position: -130px -40px; }
            .jssora05r:hover { background-position: -190px -40px; }
            .jssora05l.jssora05ldn { background-position: -250px -40px; }
            .jssora05r.jssora05rdn { background-position: -310px -40px; }
        </style>
        <span u="arrowleft" class="jssora05l" style="top:{h_divide2}px; left: 8px;">
        </span>
        <span u="arrowright" class="jssora05r" style="top: {h_divide2}px; right: 8px;">
        </span>
    </div>
    </div>
<!-- END: main -->