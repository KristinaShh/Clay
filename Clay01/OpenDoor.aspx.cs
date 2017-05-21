using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clay01
{
    public partial class OpenDoor : System.Web.UI.Page
    {
        #region FillDoorList
        public void FillDoorList()
        {
            using (ClayEntities context = new ClayEntities())
            {
                var door = (from d in context.Doors
                                select new {d.DoorID, d.Description }).ToList();
                GridView1.DataSource = door;
                GridView1.DataBind();
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            //GridView with all Doors
            FillDoorList();
            //Welcome Label
            lblUser.Text = "Welcome " + Session["FullName"];
        }
        #region Open Door
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "OpenDoor")
                {
                    // Retrieve the row index stored in the CommandArgument property.
                    int rowIndex = Convert.ToInt32(e.CommandArgument);

                    //Reference the GridView Row.
                    GridViewRow row = GridView1.Rows[rowIndex];

                    //Fetch value of Door ID
                    int doorId = Convert.ToInt32((row.FindControl("txtID") as TextBox).Text);

                    // Code to access the door
                    ClayEntities db = new ClayEntities();
                    var door = (from doorslist in db.Doors
                                where doorslist.DoorID == doorId
                                select new
                                {
                                    doorslist.PropertyID
                                }).ToList();

                    if (door.FirstOrDefault().PropertyID == Convert.ToInt32(Session["PropertyID"]))
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "error", "alert('You have access to this door');", true);

                        //Code to save the log
                        var context = new ClayEntities();
                        var log = new HistoryLog()
                        {
                            UserID = Convert.ToInt32(Session["UserID"]),
                            DoorID = doorId,
                            Time = DateTime.Now
                        };
                        context.HistoryLogs.Add(log);
                        context.SaveChanges();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "error", "alert('ACCESS DENIED');", true);
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        #endregion
        #region Sign OUT
        protected void btn_signout_Click(object sender, EventArgs e)
        {
            //Clear All Sessions
            Session["UserName"] = "";
            Session["FullName"] = "";
            Session["UserID"] = "";
            Session["PropertyID"] = "";
            Response.Redirect("Default.aspx");
        }
        #endregion
    }
}