using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsAgenda
{
    public partial class Contacts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void buttonCreate_Click(object sender, EventArgs e)
        {
            // Get string connection
            System.Configuration.ConnectionStringSettings connectionString;

            System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/MyWebSiteRoot");
            connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["ConnectionString"];

            // Create a connection object
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = connectionString.ToString();

            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = "INSERT INTO Contact (Name,Email,Phone) VALUES (@Name,@Email,@Phone)";
            command.Parameters.AddWithValue("Name", txtName.Text);
            command.Parameters.AddWithValue("Email", txtEmail.Text);
            command.Parameters.AddWithValue("Phone", txtPhone.Text);

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();

            // Reload Page
            ReloadPageAfterInsertingNewContact();
        }

        protected void ReloadPageAfterInsertingNewContact()
        {
            GridView1.DataBind();
        }
    }
}