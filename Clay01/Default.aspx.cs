using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clay01
{
    public partial class Default : System.Web.UI.Page
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

        #region Add New Property
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                var context = new ClayEntities();
                var property = new Property()
                {
                    PropertyName = name.Text,
                    NumberOfDoors=Convert.ToInt32(numberOfDoors.Text)
                };
                context.Properties.Add(property);
                context.SaveChanges();
                ScriptManager.RegisterStartupScript(this, GetType(), "error", "alert('New Prpoerty is added!');", true);

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        #endregion

        #region Add Doors to Property
        protected void btnAddDoor_Click(object sender, EventArgs e)
        {
            try
            {
                var context = new ClayEntities();
                var door = new Door()
                {
                    Description = doorDescription.Text,
                    PropertyID = Convert.ToInt32(propertyList.SelectedValue)
                };
                context.Doors.Add(door);
                context.SaveChanges();
                ScriptManager.RegisterStartupScript(this, GetType(), "error", "alert('Door is added to a property!');", true);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        #endregion
    }
}