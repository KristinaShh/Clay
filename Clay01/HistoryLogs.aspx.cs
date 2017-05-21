using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clay01
{
    public partial class HistoryLogs : System.Web.UI.Page
    {
        #region Fill GridView with Logs
        public void FillLogs()
        {
            using (var context = new ClayEntities())
            {
                var logs = context.CP_GetHistoryLogs();
                gvHistoryLogs.DataSource = logs;
                gvHistoryLogs.DataBind();
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            FillLogs();
        }
    }
}