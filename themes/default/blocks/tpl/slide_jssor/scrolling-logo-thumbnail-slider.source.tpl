<!-- BEGIN: main -->
<script>
        jQuery(document).ready(function ($) {
            var options = {
                $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                $AutoPlaySteps: 1,                                  //[Optional] Steps to go for each navigation request (this options applys only when slideshow disabled), the default value is 1
                $AutoPlayInterval: 0,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                $PauseOnHover: 4,                               //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

                $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
                $SlideEasing: $JssorEasing$.$EaseLinear,          //[Optional] Specifies easing for right to left animation, default value is $JssorEasing$.$EaseOutQuad
                $SlideDuration: 1600,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
                $SlideWidth: {w_img},                                   //[Optional] Width of every slide in pixels, default value is width of 'slides' container
                $SlideHeight: {h_img},                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
                $SlideSpacing: 5, 					                //[Optional] Space between each slide in pixels, default value is 0
                $DisplayPieces: {DisplayPieces},                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
                $ParkingPosition: 0,                              //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
                $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
                $PlayOrientation: {playOrientation},                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
                $DragOrientation: {dragOrientation}                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)
            };
            window['scrolling-logo-thumbnail-slider.source_{bid}']=new $JssorSlider$("scrolling-logo-thumbnail-slider.source_{bid}", options);
            function ScaleSlider() {
                var parentWidth = window['scrolling-logo-thumbnail-slider.source_{bid}'].$Elmt.parentNode.clientWidth;
                if (parentWidth) {
                    var sliderWidth = parentWidth;
                    sliderWidth = Math.min(sliderWidth, {width});
                    window['scrolling-logo-thumbnail-slider.source_{bid}'].$ScaleWidth(sliderWidth);
                }
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
        <div id="scrolling-logo-thumbnail-slider.source_{bid}" style="display: inline-block;position: relative; top: 0px; left: 0px; width: {width}px; height: {height}px; overflow: hidden; ">
            <div u="loading" style="position: absolute; top: 0px; left: 0px;">
                <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;
                    background-color: #000; top: 0px; left: 0px;width: 100%;height:100%;">
                </div>
                <div style="position: absolute; display: block; background: url({NV_BASE_SITEURL}themes/{BLOCK_THEME}/images/jssor/loading.gif) no-repeat center center;
                    top: 0px; left: 0px;width: 100%;height:100%;">
                </div>
            </div>
            <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width:{width}px; height: {height}px; overflow: hidden;">
                <!-- BEGIN: loop -->
                <div>
                    <a u=image href="{link}" target="_blank"><img src="{src}" /></a>
                </div>
                <!-- END: loop -->
            </div>
        </div>
    </div>
<!-- END: main -->