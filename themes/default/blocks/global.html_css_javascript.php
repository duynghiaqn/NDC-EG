<?php
/**
 * @Project NUKEVIET
 * @Author Thaotrinh member forum nukeviet (trinhthao@bendoi.vn)
 */

if ( ! defined( 'NV_MAINFILE' ) ) die( 'Stop!!!' );
if ( ! nv_function_exists( 'html_css_javascript' ) )
{

    function nv_html_css_javascript_config ( $module, $data_block, $lang_block )
    {
        $html = '';
		$html .= '<tr><td colspan="2" style="text-align:center;font-weight:bold;background: #B6C8FF; text-shadow: 1px 2px 3px #FFF;"> HTML CSS JAVASCRIPT
<style>.table>tbody>tr>td,table>tr td{vertical-align: baseline;}.form_control{display: inline-block;border-radius: 0px;padding:5px;} .w5{width:5%} .w10{width:10%} .w15{width:15%} .w20{width:20%} .w30{width:30%} .w40{width:40%} .w45{width:45%} .w50x{width:50px} .w80x{width:80px} .w150x{width:150px}
	</style>
	</td></tr>';
		
        $html .= '<tr><td> javascript url</td><td><input type="text" name="config_jsurl" value="' . $data_block['jsurl'] . '" placeholder="http://...js" class="form_control form-control"/></td></tr>';
        $html .= '<tr><td> javascript Content </td><td><textarea name="config_jscon" rows="5" placeholder="/* javascript content */" class="form_control form-control">' . $data_block['jscon'] . '</textarea></td></td></tr>';
        $html .= '<tr><td> css url</td><td><input type="text" name="config_cssurl" value="' . $data_block['cssurl'] . '" placeholder="http://...css" class="form_control form-control"/></td></tr>';
        $html .= '<tr><td> css Content </td><td><textarea name="config_csscon" placeholder="/* css content */" rows="5" class="form_control form-control">' . $data_block['csscon'] . '</textarea></td></td></tr>';
        $html .= '<tr><td> HTML</td><td><textarea name="config_htmlc" rows="5" placeholder="&lt!-- HTML content --&gt" class="form_control form-control">' . $data_block['htmlc'] . '</textarea></td></td></tr></td></tr>';
		
        return $html;
    }

    function nv_html_css_javascript_submit ( $module, $lang_block )
    {
        global $nv_Request;
        $return = array();
        $return['error'] = array();
        $return['config'] = array();
        $return['config']['jsurl'] = $nv_Request->get_string( 'config_jsurl', 'post', "" );
        $return['config']['jscon'] = $nv_Request->get_string( 'config_jscon', 'post', "" );
        $return['config']['cssurl'] = $nv_Request->get_string( 'config_cssurl', 'post', "" );
        $return['config']['csscon'] = $nv_Request->get_string( 'config_csscon', 'post', "" );
        $return['config']['htmlc'] = $nv_Request->get_string( 'config_htmlc', 'post', "" );
        return $return;
    }

    function html_css_javascript ( $block_config )
    {
		$jsurl='';
		$jscon='';
		$cssurl='';
		$csscon='';
		$htmlc='';
		if( ! empty( $block_config['jsurl'] ) ) {$jsurl='<script type="text/javascript" src="'.$block_config['jsurl'].'"></script>';}
		if( ! empty( $block_config['jscon'] ) ) {$jscon='<script type="text/javascript">'.$block_config['jscon'].'</script>';}
		if( ! empty( $block_config['cssurl'] ) ) {$cssurl='<link rel="stylesheet" type="text/css" href="'.$block_config['cssurl'].'" />';}
		if( ! empty( $block_config['csscon'] ) ) {$csscon='<style>'.$block_config['csscon'].'</style>';}
		if( ! empty( $block_config['htmlc'] ) ) {$htmlc=''.$block_config['htmlc'].'';}
		
		$content = ''.$jsurl.''.$jscon.''.$cssurl.''.$csscon.''.$htmlc.'';
		return $content;
    }
}

if ( defined( 'NV_SYSTEM' ) )
{
    $content = html_css_javascript( $block_config );
}
?>