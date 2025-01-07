using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsAgenda
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSourceUsers_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null) 
            {
                //LMessage.Text = e.Exception.Message;
                LMessage.Text = "Cannot insert duplicated register or missing informations.";
                e.ExceptionHandled = true;
            }
        }

        protected void SqlDataSourceUsers_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                //LMessage.Text = e.Exception.Message;
                LMessage.Text = "Updating a register without informing all information.";
                e.ExceptionHandled = true;
            }
        }
    }
}