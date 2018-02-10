<!-- BEGIN: main -->
<form class="form-inline m-bottom">
	<select class="form-control" id="action-top">
		<!-- BEGIN: action_top -->
		<option value="{ACTION.key}">{ACTION.value}</option>
		<!-- END: action_top -->
	</select>
	<button class="btn btn-primary" onclick="nv_list_action( $('#action-top').val(), '{BASE_URL}', '{LANG.error_empty_data}' ); return false;">{LANG.perform}</button>
	<a class="btn btn-primary" href="{SEND_NEW_MESS}">{LANG.add_notification}</a>
</form>
<form>
	<div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th class="text-center w50"><input name="check_all[]" type="checkbox" value="yes" onclick="nv_checkAll(this.form, 'idcheck[]', 'check_all[]',this.checked);"></th>
					<th>{LANG.notification_message}</th>
					<th>{LANG.notification_url}</th>
					<th>{LANG.notification_author}</th>
					<th>{LANG.notification_allowed_view}</th>
					<th>{LANG.notification_status}</th>
					<th style="width: 100px; text-align: center">{LANG.feature}</th>
				</tr>
			</thead>
			<tbody>
				<!-- BEGIN: row -->
				<tr>
					<td class="text-center"><input type="checkbox" onclick="nv_UncheckAll(this.form, 'idcheck[]', 'check_all[]', this.checked);" value="{ROW.id}" name="idcheck[]" class="post"></td>
					<td>{ROW.message}</td>
					<td>{ROW.url}</td>
					<td>{ROW.author}</td>
					<td>{ROW.notification_showview}</td>
					<td style="text-align: center"><input name="status" id="change_status{ROW.id}" value="1" type="checkbox" {ROW.status} onclick="nv_chang_link_status({ROW.id})" /></td>
					<td class="text-center form-tooltip"><a href="{EDIT_URL}" class="btn btn-default btn-xs" data-toggle="tooltip" data-original-title="{GLANG.edit}"><i class="fa fa-edit"></i></a> <a href="{VIEW.link_delete}" onclick="nv_link_del({ROW.id});" class="btn btn-default btn-xs" data-toggle="tooltip" data-original-title="{GLANG.delete}"><em class="fa fa-trash-o"></em></a></td>
				</tr>
				<!-- END: row -->
			</tbody>
			<tr class="footer">
				<td colspan="8">
					<!-- BEGIN: generate_page --> {GENERATE_PAGE} <!-- END: generate_page -->
				</td>
			</tr>
		</table>
	</div>
</form>
<form class="form-inline m-bottom">
	<select class="form-control" id="action-bottom">
		<!-- BEGIN: action_bottom -->
		<option value="{ACTION.key}">{ACTION.value}</option>
		<!-- END: action_bottom -->
	</select>
	<button class="btn btn-primary" onclick="nv_list_action( $('#action-bottom').val(), '{BASE_URL}', '{LANG.error_empty_data}' ); return false;">{LANG.perform}</button>
</form>
<script type="text/javascript">
function nv_chang_link_status(a) {
	nv_settimeout_disable("change_status" + a, 5E3);
	$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&num=' + new Date().getTime(), 'changestatus=1&id=' + a, function(res) {
		if (res != "OK"){
		  alert(nv_is_change_act_confirm[2])
		}
		window.location.href = window.location.href
	});
}

function nv_link_del(a) {
    if( confirm(nv_is_del_confirm[0]) ){
        $.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&num=' + new Date().getTime(), 'del=1&id=' + a, function(res) {
    		if (res == "OK"){
    		  window.location.href = window.location.href
    		}
    		else{
    		  alert(nv_is_del_confirm[2])
    		}
    	});
    }
}
</script>
<!-- END: main -->
