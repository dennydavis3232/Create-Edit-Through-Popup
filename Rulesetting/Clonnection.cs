using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Rulesetting
{
    public class Clonnection
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CON"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        public DataTable ExecuteGetDataTable(string strCMDtext)
        {
            DataTable Dt = null; SqlDataAdapter Da = null;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CON"].ConnectionString))
            {
                conn.Open();

                cmd = new SqlCommand(strCMDtext, conn);
                cmd.CommandType = CommandType.Text;
                Dt = new DataTable();
                Da = new SqlDataAdapter(cmd);
                Da.Fill(Dt);
                Da.Dispose();

            }
            return Dt;
        }
        public int fn_nonquery(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            cmd = new SqlCommand(sqlquery, con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;

        }

    }
}
