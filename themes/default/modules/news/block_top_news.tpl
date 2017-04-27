<!-- BEGIN: main -->
<!-- BEGIN: marquee_css -->
<script src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/jquery.marquee.min.js" type="text/javascript"></script>
	<style>
		.marquee {
			width: 99%;
			overflow: hidden;
		}
		.item-display{
			height:120px;
			text-align:justify;
		}
		.marquee ul li{
			display:inline-block;
			margin-right: 10px;
		}
	</style>
<!-- END: marquee_css -->
	<script>
	$('#marquee-{BLOCKID}').marquee({
		duration: {duration},
		gap: 50,
		delayBeforeStart: 0,
		direction: '{direction}',
		duplicated: true,
		pauseOnHover: {pauseOnHover}
	});
	</script>

	<div class="pull-left"></div>
	<div id="marquee-{BLOCKID}" class="center-block marquee">
		<ul class="item-display">
		<!-- BEGIN: newloop -->
		<li class="thumbnail-display">
		<i class="fa fa-bullhorn" aria-hidden="true" style="color:#0090ff"></i>
		<a href="{blocknews.link}" title="{blocknews.title}" target="_blank">{blocknews.title}</a><br/>
		</li>
		<br/>
		<!-- END: newloop -->
		</ul>
		<br/><br/>
	</div>
<!-- END: main -->