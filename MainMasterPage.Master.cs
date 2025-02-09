﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsAgenda
{
    public partial class MainMasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // checking if there's a cookie for the logged user.
            if (Request.Cookies["login"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}