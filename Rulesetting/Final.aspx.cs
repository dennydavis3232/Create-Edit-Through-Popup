using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Rulesetting
{
    public partial class Final : System.Web.UI.Page
    {
        Clonnection obj = new Clonnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    Bindgridview();
                    
                }
            }
            catch(Exception cx)
            {
                Logging("Error on pageload : " + cx.Message, "E_");

            }

        }
        protected void Bindgridview()
        {
            try
            {
                string query = "SELECT * FROM File_details";
                GridView1.DataSource = obj.ExecuteGetDataTable(query);
                GridView1.DataBind();

            }
            catch(Exception cx)
            {
                Logging("Error on binddatalist : " + cx.Message, "E_");
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    Button btnShowDetails = (Button)e.Row.FindControl("btnShowDetails");

                    btnShowDetails.Attributes.Add("onclick", "ShowDetails('" + GridView1.DataKeys[e.Row.RowIndex].Value + "');");
                    string email = DataBinder.Eval(e.Row.DataItem, "emailid").ToString();
                    email = email.Replace(",", ",<br />");
                    e.Row.Cells[1].Text = email;
                }
            }
            catch(Exception cx)
            {
                Logging("Error on gridviewrowdatabound : " + cx.Message, "E_");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string currentId = hdnCurrentId.Value;
                string ins = "UPDATE File_details SET rulename = '" + txtRuleName.Text + "', emailid = '" + txtEmail.Text + "', subject = '" + txtSubject.Text + "', body='" + txtbody.Text + "',file_type = '" + txtFileType.Text + "' WHERE id = " + currentId;
                int i = obj.fn_nonquery(ins);
                Bindgridview();
                ClientScript.RegisterStartupScript(this.GetType(), "showSuccessPopup", "showSuccessPopup();", true);
            }
            catch(Exception cx)
            {
                Logging("Error on editupdate button : " + cx.Message, "E_");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowPopup", "showPopup1();", true);

            }
            catch(Exception cx)
            {
                Logging("Error on create button : " + cx.Message, "E_");
            }

        }
        protected void btnSave1_Click(object sender, EventArgs e)
        {
            try
            {
                string ins = "insert into File_details values ('" + Textbox1.Text + "', '" + Textbox2.Text + "','" + Textbox3.Text + "','" + Textbox4.Text + "','" + Textbox5.Text + "','" + Textbox6.Text + "','Active') ";
                int i = obj.fn_nonquery(ins);
                Bindgridview();
                ClientScript.RegisterStartupScript(this.GetType(), "showSuccessPopup", "showSuccessPopup();", true);
            }
            catch(Exception cx)
            {
                Logging("Error on createbutton submit : " + cx.Message, "E_");
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                GridView1.PageIndex = e.NewPageIndex;
                Bindgridview();
            }
            catch(Exception cx)
            {
                Logging("Error on pageindexchanging : " + cx.Message, "E_");
            }
        }
         protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string searchText = txtSearch.Text.Trim();
                string s2 = "select * from File_details where rulename='" + searchText + "'";
                DataTable d4 = obj.ExecuteGetDataTable(s2);
                GridView1.DataSource = d4;
                GridView1.DataBind();
                btnCancel.Visible = true;
            }
            catch
            {
                Logging("Error on search button : " , "E_");

            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            try
            {
                Bindgridview();
                btnCancel.Visible = false;
                btnSearch.Visible = true;
            }
            catch
            {
                Logging("Error on cancelbutton : ", "E_");
            }
        }

        public void Logging(string str, string sType)
        {
            while (true)
            {
                try
                {
                    string file = AppDomain.CurrentDomain.BaseDirectory + "/LOGS/" + sType + DateTime.Now.ToString("ddMMyy") + ".LOG";
                    File.AppendAllText(file, DateTime.Now.ToLongTimeString() + "***" + str + Environment.NewLine);
                    break;
                }
                catch 
                {

                }
            }
        }
    }
}
