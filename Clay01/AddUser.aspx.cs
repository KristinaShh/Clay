using Clay01.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clay01
{
    public partial class AddUser : System.Web.UI.Page
    {
        #region Fill DropdownList with Property Names
        public void FillPropertyList()
        {
            using (ClayEntities context = new ClayEntities())
            {
                var property = (from c in context.Properties
                                select new { c.PropertyID, c.PropertyName }).ToList();

                propertyList.DataValueField = "PropertyID";
                propertyList.DataTextField = "PropertyName";
                propertyList.DataSource = property;
                propertyList.DataBind();
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { 
                FillPropertyList();
            }
        }

        #region Add New User
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                if(password.Text == confirmPassword.Text)
                {
                    Helper helper = new Helper();
                    var context = new ClayEntities();
                    var user = new User()
                    {
                        FullName = name.Text,
                        Username = username.Text,
                        Password = helper.Encrypt(password.Text.Trim()),
                        PropertyID = propertyList.SelectedIndex
                    };
                    context.Users.Add(user);
                    context.SaveChanges();
                    ScriptManager.RegisterStartupScript(this, GetType(), "error", "alert('New user is added!');", true);

                }
                else
                {
                   ScriptManager.RegisterStartupScript(this, GetType(), "error", "alert('Passwords do not match!');", true);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        protected void btn_signin_Click(object sender, EventArgs e)
        {
            try
            {
                Helper helper = new Helper();
                ClayEntities db = new ClayEntities();
                var user = (from userlist in db.Users
                            where userlist.Username == sign_username.Text //&& helper.Decrypt(userlist.Password) == sign_password.Text
                            select new
                            {
                                userlist.UserID,
                                userlist.Username,
                                userlist.Password,
                                userlist.FullName,
                                userlist.PropertyID
                            }).ToList();
                
                if (user.FirstOrDefault() != null && helper.Decrypt(user.FirstOrDefault().Password) == sign_password.Text)
                {
                    //if login is successful
                    Session["UserName"] = user.FirstOrDefault().Username;
                    Session["FullName"] = user.FirstOrDefault().FullName;
                    Session["UserID"] = user.FirstOrDefault().UserID;
                    Session["PropertyID"] = user.FirstOrDefault().PropertyID;
                    Response.Redirect("OpenDoor.aspx");
                }
                else
                {
                    //Invalid login credentials
                    ScriptManager.RegisterStartupScript(this, GetType(), "error", "alert('Invalid login credentials!');", true);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}