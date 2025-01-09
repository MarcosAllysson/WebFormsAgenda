using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace WebFormsAgenda
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private const string loginCookie = "login";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void buttonLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            // Access database to check if user exists.
            // Get string connection
            System.Configuration.ConnectionStringSettings connectionString;

            System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/MyWebSiteRoot");
            connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["ConnectionString"];

            // Create a connection object
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = connectionString.ToString();

            SqlCommand command = new SqlCommand();
            command.Connection = connection;

            // Using brakets because User is a keyword reserved by SQL Server.
            command.CommandText = "SELECT * FROM [User] WHERE Email = @Email and Password = @Password;";
            command.Parameters.AddWithValue("Email", email);
            command.Parameters.AddWithValue("Password", password);

            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            if (!reader.HasRows)
            {
                labelResponse.Text = "Email or password are wrong!";
            }
            else
            {
                // adding cookie to make it more secure and check if user if logged or not.
                HttpCookie cookieEmail = new HttpCookie(loginCookie, email);
                Response.Cookies.Add(cookieEmail);

                //HttpCookie cookiePassword = new HttpCookie("password", password);
                //Response.Cookies.Add(cookiePassword);

                // direct to main page
                Response.Redirect("~/Index.aspx");
            }
        }
    }
}