using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sqlConn = ConfigurationManager.AppSettings["sqlConnectionString"].ToString();
        string sql = "select * from M_User";

        SQLHelper.QueryDataTable(sqlConn, sql,null, CommandType.Text);
    }
}