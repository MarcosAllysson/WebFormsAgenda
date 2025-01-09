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
            string name = txtEmail.Text;
            string email = txtEmail.Text;
            string phone = txtPhone.Text;

            try
            {
                if(
                    !string.IsNullOrEmpty(name) && 
                    !string.IsNullOrEmpty(email) && 
                    !string.IsNullOrEmpty(phone)
                    )
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
                    command.Parameters.AddWithValue("Name", name);
                    command.Parameters.AddWithValue("Email", email);
                    command.Parameters.AddWithValue("Phone", phone);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                    // Reload Page
                    ReloadPageAfterInsertingNewContact();
                }
                else
                {
                    throw new Exception("Fill out all fields!");
                }
            }
            catch (Exception ex)
            {
                // Using JavaScript to show a message on page.
                Response.Write("<script> alert('" + ex.Message + "'); </script>");
            }
        }

        protected void ReloadPageAfterInsertingNewContact()
        {
            GridView1.DataBind();
        }
    }
}