<!-- BEGIN: main -->
{FILE "header_only.tpl"}
{FILE "header_extended.tpl"}

 <nav class="third-nav">
    				<div class="row">
                        <div class="bg">
                        <div class="clearfix">
                            <div class="col-xs-24 col-sm-18 col-md-18">
                                <!-- BEGIN: breadcrumbs -->
                                <div class="breadcrumbs-wrap">
                                	<div class="display">
                                		<a class="show-subs-breadcrumbs hidden" href="#" onclick="showSubBreadcrumbs(this, event);"><em class="fa fa-lg fa-angle-right"></em></a>
		                                <ul class="breadcrumbs list-none"></ul>
									</div>
									<ul class="subs-breadcrumbs"></ul>
	                                <ul class="temp-breadcrumbs hidden">
	                                    <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="{THEME_SITE_HREF}" itemprop="url" title="{LANG.Home}"><span itemprop="title">{LANG.Home}</span></a></li>
	                                    <!-- BEGIN: loop --><li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="{BREADCRUMBS.link}" itemprop="url" title="{BREADCRUMBS.title}"><span class="txt" itemprop="title">{BREADCRUMBS.title}</span></a></li><!-- END: loop -->
	                                </ul>
								</div>
                                <!-- END: breadcrumbs -->
                                <!-- BEGIN: currenttime --><span class="current-time">{NV_CURRENTTIME}</span><!-- END: currenttime -->
                            </div>
                            <div class="headerSearch col-xs-24 col-sm-6 col-md-6">
                                <div class="input-group">
                                    <input type="text" class="form-control" maxlength="{NV_MAX_SEARCH_LENGTH}" placeholder="{LANG.search}..."><span class="input-group-btn"><button type="button" class="btn btn-info" data-url="{THEME_SEARCH_URL}" data-minlength="{NV_MIN_SEARCH_LENGTH}" data-click="y"><em class="fa fa-search fa-lg"></em></button></span>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </nav>


<div class="row">
	<div class="col-md-24">
		[HEADER]
	</div>
</div>
<div class="row">
	<div class="col-sm-16 col-md-17">
		[TOP]
		{MODULE_CONTENT}
		[BOTTOM]
	</div>
	<div class="col-sm-8 col-md-7">
		[RIGHT]
	</div>
</div>
<div class="row">
		[FOOTER]
</div>
{FILE "footer_extended.tpl"}
{FILE "footer_only.tpl"}
<!-- END: main -->