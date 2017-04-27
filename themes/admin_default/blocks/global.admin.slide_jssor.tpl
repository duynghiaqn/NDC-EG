<!-- BEGIN: main -->
<tr class="type_slide">
    <td>{LANG.type_slide}</td>
    <td>
        <select class="form-control w300" name="type_slide">
            <!-- BEGIN: type_slide -->
            <option value="{k}" {selected}>{type_slide}</option>
            <!-- END: type_slide -->
        </select>
    </td>
</tr>
<tr class="playOrientation" style="display:none">
    <td>{LANG.playOrientation}</td>
    <td>
        <select class="form-control w300" name="playOrientation">
            <!-- BEGIN: playOrientation -->
            <option value="{k}" {selected}>{playOrientation}</option>
            <!-- END: playOrientation -->
        </select>
    </td>
</tr>
<tr>
    <td>{LANG.width}</td>
    <td><input class="form-control w300" name="width" type="text" value="{width}"/> </td>
</tr>
<tr>
    <td>{LANG.height}</td>
    <td><input class="form-control w300" name="height" type="text" value="{height}"/> </td>
</tr>
<tr>
    <td>{LANG.w_img}</td>
    <td><input class="form-control w300" name="w_img" type="text" value="{w_img}"/> </td>
</tr>
<tr>
    <td>{LANG.h_img}</td>
    <td><input class="form-control w300" name="h_img" type="text" value="{h_img}"/> </td>
</tr>
<tr>
    <td colspan="2"><strong>{LANG.images}</strong></td>
</tr>
<!-- BEGIN: imgfile -->
<tr>
    <td colspan="2" class="form-inline">
        <div style="margin-bottom:3px">
            <input type="button" value="Browse server" name="selectimg_{tt}" class="btn btn-info selectimg" />&nbsp;
            <input class="form-control" style="width:380px" type="text" name="imgfile_{tt}" id="imgfile_{tt}" value="{imgfile}"/> 
        </div>
        <div>
            <p class="btn btn-info" style="width:109px">Link: </p>&nbsp;
            <input class="form-control" style="width:380px" type="text" name="link_{tt}" id="link_{tt}" value="{link}"/>
        </div>
    </td>
</tr>
<!-- END: imgfile -->
<tr class="addimg">
    <td colspan="2">
        <input type="text" value="{ttimgfile}" name="tt" style="display:none" />
        <input type="button" value="{LANG.addimg}" name="addimg" class="btn btn-info" />
    </td>
</tr>
<script type="text/javascript">
    var tt={ttimgfile};
    $("#block_config").on('click','input.selectimg',function() {
        var area='imgfile_'+$(this).attr('name').substr(10);
        nv_open_browse("{NV_BASE_ADMINURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&{NV_NAME_VARIABLE}=upload&popup=1&area="+area+"&path={UPLOADS_DIR}&currentpath={IMG_DIR}&type=image", "NVImg", 850, 420, "resizable=no,scrollbars=no,toolbar=no,location=no,status=no");
        return false;
    });
    $("input[name=addimg]").click(function() {
        tt++;
        $("#block_config .addimg").before('<tr><td colspan="2" class="form-inline"><div style="margin-bottom:3px"><input type="button" value="Browse server" name="selectimg_'+tt+'" class="btn btn-info selectimg" />&nbsp;<input class="form-control" style="width:380px" type="text" name="imgfile_'+tt+'" id="imgfile_'+tt+'"/> </div><div><p class="btn btn-info" style="width:109px">Link: </p>&nbsp;<input class="form-control" style="width:380px" type="text" name="link_'+tt+'" id="link_'+tt+'"/></div></td></tr>');
        $("input[name=tt]").val(tt);
    });
    $("select[name=type_slide]").change(function() {
        if($(this).val()==7){
            $(".playOrientation").show();
        }else{
            $(".playOrientation").hide();
        }
    });
    
</script>
<!-- END: main -->