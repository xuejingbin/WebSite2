<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Query.aspx.cs" Inherits="Query" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="UI/css/bootstrap-table.min.css" />
    <link rel="stylesheet" href="UI/css/bootstrap.min.css" />
    <script src="UI/js/jquery.min.js"></script>
    <script type="text/javascript" src="UI/js/bootstrap.min.js"></script>
    
    <script type="text/javascript" src="UI/js/bootstrap-table.js"></script>
    <script type="text/javascript" src="UI/js/bootstrap-table-zh-CN.min.js"></script>
    <title>Ajax实例1</title>
    <script type="text/javascript">
        $(function () {
            init();
            $("#btn1").click(function () {
                var txtparam1 = $("#txtParam1").val();
                var txtparam2 = $("#txtParam2").val();

                $.ajax({
                    url: "Query.aspx/AjaxMethod",//发送到本页面后台AjaxMethod方法
                    type: "POST",
                    dataType: "json",
                    async: true,//async翻译为异步的，false表示同步，会等待执行完成，true为异步
                    contentType: "application/json; charset=utf-8",//不可少
                    data: "{param1:'" + txtparam1 + "',param2:'" + txtparam2 + "'}",
                    success: function (data) {
                        $("#result").html(data.d);
                    },
                    error: function () {
                        alert("请求出错处理");
                    }
                });

            });
        });

       
        function init() {

            $('#QueryTab').bootstrapTable({
                columns: [{
                    field: 'whichperiod',
                    title: '第几期'
                }, {
                    field: 'overdueamounts',
                    title: '逾期金额(元)'
                }, {
                    field: 'overduedate',
                    title: '逾期开始日期',
                }, {
                    field: 'overduelong',
                    title: '逾期时长'
                }, {
                    field: 'reason',
                    title: '逾期原因'
                }, {
                    field: 'disposalstatus',
                    title: '处置状态'
                }]
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input id="txtParam1" type="text" />
            <input id="txtParam2" type="text" />
            <button type="button" id="btn1" class="btn btn-sm btn-primary">查询</button>
        </div>
        <div id="result"></div>
    </form>
    <div class="row">
        <div class="col-md-6">
            <table id="QueryTab" >
            </table>
        </div>
    </div>
</body>


</html>
