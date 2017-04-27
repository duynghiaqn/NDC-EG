<?php

/**
 * @Project NUKEVIET 4.x
 * @Author hqc210185
 * @Copyright (C) 2014 VINADES ., JSC. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate Jan 17, 2011 11:34:27 AM
 */

if (! defined('NV_MAINFILE')) {
    die('Stop!!!');
}
$type_slides=array(
    1=>'banner-rotator-2.source',
    2=>'carousel-slider.source',
    3=>'different-size-photo-slider.source',
    4=>'image-gallery.source',
    5=>'image-gallery-with-vertical-thumbnail',
    6=>'image-slider-2.source',
    7=>'scrolling-logo-thumbnail-slider.source',
    8=>'thumbnail-navigator-with-arrows.source',
    9=>'simple-fade-slideshow.source');
if (! nv_function_exists('nv_slide_jssor')) {
    function nv_slide_jssor_config($module, $data_block, $lang_block)
    {
        global $global_config,$xtpl,$type_slides;
        $xtpl = new XTemplate('global.admin.slide_jssor.tpl', NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/blocks');
        $xtpl->assign('LANG', $lang_block);
        $xtpl->assign('width', $data_block['width']);
        $xtpl->assign('height', $data_block['height']);
        $xtpl->assign('w_img', $data_block['w_img']);
        $xtpl->assign('h_img', $data_block['h_img']);
        foreach ($type_slides as $k=>$type_slide) {
            $xtpl->assign('k', $k);
            $xtpl->assign('type_slide', $type_slide);
            $xtpl->assign('selected', ($data_block['type_slide']==$k)?'selected':'');
            $xtpl->parse('main.type_slide');
        }
        foreach(array(1=>'horizental',2=>'vertical',5=>'horizental reverse',6=>'vertical reverse') as $k=>$playOrientation){
            $xtpl->assign('k', $k);
            $xtpl->assign('selected', ($data_block['playOrientation']==$k)?'selected':'');
            $xtpl->assign('playOrientation', $playOrientation);
            $xtpl->parse('main.playOrientation');
        }
        $i=0;
        if(!empty($data_block['imgfiles'])){
            foreach($data_block['imgfiles'] as $imgfile){
                $xtpl->assign('imgfile', $imgfile['imgfile']);
                $xtpl->assign('link', $imgfile['link']);
                $xtpl->assign('tt', ++$i);
                $xtpl->parse('main.imgfile');
            }
        }
        $xtpl->assign('ttimgfile', $i);
        $xtpl->parse('main');
        return $xtpl->text('main');
    }

    function nv_slide_jssor_submit($module, $lang_block)
    {
        global $nv_Request;
        $return = array();
        $return['error'] = array();
        $return['config']['width'] = $nv_Request->get_int('width', 'post', 0);
        $return['config']['height'] = $nv_Request->get_int('height', 'post', 0);
        $return['config']['w_img'] = $nv_Request->get_int('w_img', 'post', 0);
        $return['config']['h_img'] = $nv_Request->get_int('h_img', 'post', 0);
        $return['config']['type_slide'] = $nv_Request->get_int('type_slide', 'post', 0);
        $return['config']['playOrientation'] = $nv_Request->get_int('playOrientation', 'post', 1);
        $return['config']['imgfiles']=array();
        $tt= $nv_Request->get_int('tt', 'post', 0);
        for($i=1;$i<=$tt;$i++){
            $imgfile=$nv_Request->get_string('imgfile_'.$i, 'post', '');
            if(!empty($imgfile)){
                $link=$nv_Request->get_string('link_'.$i, 'post', '');
                $return['config']['imgfiles'][]=array('imgfile'=>$imgfile,'link'=>$link);
            }
        }
        return $return;
    }

    /**
     * nv_slide_jssor()
     *
     * @param mixed $block_config
     * @return
     *
     */
    function nv_slide_jssor($block_config,$type_slides)
    {
        global $global_config, $lang_global, $module_name;
        if (!defined('JSSORSCROLLING'))
        {
            global $my_head;
            $my_head .= "<script type=\"text/javascript\" src=\"" . NV_BASE_SITEURL . NV_ASSETS_DIR."/js/jssor.js\"></script>\n";
            $my_head .= "<script type=\"text/javascript\" src=\"" . NV_BASE_SITEURL . NV_ASSETS_DIR."/js/jssor.slider.js\"></script>\n";
            define('JSSORSCROLLING', true);
        }
        $filetpl=$type_slides[$block_config['type_slide']].'.tpl';
        if (file_exists(NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/blocks/tpl/slide_jssor/'.$filetpl)) {
            $block_theme = $global_config['module_theme'];
        } elseif (file_exists(NV_ROOTDIR . '/themes/' . $global_config['site_theme'] . '/blocks/tpl/slide_jssor/'.$filetpl)) {
            $block_theme = $global_config['site_theme'];
        } else {
            $block_theme = 'default';
        }
        $xtpl = new XTemplate($filetpl, NV_ROOTDIR . '/themes/' . $block_theme . '/blocks/tpl/slide_jssor');
        $xtpl->assign('LANG', $lang_global);
        $xtpl->assign('NV_BASE_SITEURL', NV_BASE_SITEURL);
        $xtpl->assign('BLOCK_THEME', $block_theme);
        $xtpl->assign('title', $block_config['title']);
        $xtpl->assign('width', $block_config['width']);
        $xtpl->assign('height',$block_config['height']);
        $xtpl->assign('h_img', $block_config['h_img']);
        $xtpl->assign('w_img', $block_config['w_img']);
        $xtpl->assign('h_divide2', $block_config['height']/2);
        $xtpl->assign('bid', $block_config['bid']);
        $xtpl->assign('DisplayPieces', count($block_config['imgfiles'])-1);
        $xtpl->assign('playOrientation', $block_config['playOrientation']);
        $xtpl->assign('dragOrientation',1);
        if($block_config['type_slide']==8){
            $xtpl->assign('displayPieces', floor(($block_config['width']-3)/102));
        }
        elseif($block_config['type_slide']==7){
            $xtpl->assign('width', ($block_config['playOrientation']==1 || $block_config['playOrientation']==5)?$block_config['width']:$block_config['w_img']);
            $xtpl->assign('height', ($block_config['playOrientation']==1 || $block_config['playOrientation']==5)?$block_config['h_img']:$block_config['height']);
            $xtpl->assign('dragOrientation', ($block_config['playOrientation']==1 || $block_config['playOrientation']==5)?1:2);
        }
        elseif($block_config['type_slide']==5){
            $w_minus=intval($block_config['width'])-intval($block_config['w_img']);
            $xtpl->assign('w_minus', $w_minus);
            $xtpl->assign('h_thumb',($block_config['height']-84)/6);
            $xtpl->assign('w_thumb',($w_minus-42)/2);
            $xtpl->assign('w_thumbminus4',($w_minus-42)/2-4);
            $xtpl->assign('w_thumbminus2',($w_minus-42)/2-2);
            $xtpl->assign('h_thumbminus4',($block_config['height']-84)/6-4);
            $xtpl->assign('h_thumbminus2',($block_config['height']-84)/6-2);
            $xtpl->assign('parkingPosition',(($block_config['height']-84)/6+12)*2);
            $xtpl->assign('arrowleft',$w_minus+8);
        }
        elseif($block_config['type_slide']==4){
            $w_minus=intval($block_config['height'])-intval($block_config['h_img']);
            $xtpl->assign('w_minus', $w_minus);
            $xtpl->assign('w_thumb',($block_config['width']-88)/10);
            $xtpl->assign('w_thumbminus4',($block_config['width']-88)/10-4);
            $xtpl->assign('w_thumbminus2',($block_config['width']-88)/10-2);
            $xtpl->assign('h_thumb',$w_minus-24);
            $xtpl->assign('h_thumbminus4',$w_minus-28);
            $xtpl->assign('h_thumbminus2',$w_minus-26);
            $xtpl->assign('h_divide2',$block_config['h_img']/2);
            $xtpl->assign('parkingPosition',(($block_config['width']-88)/10+8)*2);
        }
        foreach ($block_config['imgfiles'] as $row) {
            $xtpl->assign('src', $row['imgfile']);
            $xtpl->assign('link', $row['link']);
            $xtpl->assign('thumbSrc', NV_BASE_SITEURL.NV_FILES_DIR.str_replace( NV_BASE_SITEURL.NV_UPLOADS_DIR, '', $row['imgfile']));
            $xtpl->parse('main.loop');
        }
        $xtpl->parse('main');
        return $xtpl->text('main');
    }
}

if (defined('NV_SYSTEM')) {
    $content = nv_slide_jssor($block_config,$type_slides);
}
