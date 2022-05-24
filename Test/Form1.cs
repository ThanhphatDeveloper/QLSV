using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Test
{
    public partial class frmTest : Form
    {
        string connectstring = @"Data Source=NGUYEN-THANH-PH\SQLEXPRESS;Initial Catalog=QLSinhVien;Integrated Security=True";
        public frmTest()
        {
            InitializeComponent();

            cboLop.DataSource = LayDSLop();
            cboLop.DisplayMember = "TenLop";
            cboLop.ValueMember = "MaLop";

            dgvDSSV.DataSource = LayDSSV();
        }

        private bool isExit(string mssv)
        {
            SqlConnection con = new SqlConnection(connectstring);

            con.Open();

            string sql = string.Format("SELECT COUNT(*) FROM SINHVIEN WHERE MSSV = '{0}'", mssv);

            SqlCommand cmd = new SqlCommand(sql, con);

            object obj = cmd.ExecuteScalar();

            int demm = Convert.ToInt32(obj);

            con.Close();



            return demm == 1;
        }
        private List<Lop> LayDSLop()
        {
            SqlConnection connect = new SqlConnection(connectstring);
            List<Lop> lstlop = new List<Lop>();
            connect.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Lop", connect);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Lop lop = new Lop
                    {
                        MaLop = reader.GetString(0),
                        TenLop = reader.GetString(1)
                    };
                    lstlop.Add(lop);
                }
            }
           
            connect.Close();

            return lstlop;
        }

        private List<SinhVien> LayDSSV()
        {
            SqlConnection connect = new SqlConnection(connectstring);
            List<SinhVien> lstSV = new List<SinhVien>();
            connect.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM SinhVien WHERE TrangThai = 1", connect);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    SinhVien SV = new SinhVien
                    {
                            MSSV = reader.GetString(1),
                            Ho = reader.GetString(2),
                            Ten = reader.GetString(3),
                            MaLop = reader.GetString(4),
                            NgaySinh = reader.GetDateTime(5),
                            DiaChi = reader.GetString(6)
                            
                    };
                    lstSV.Add(SV);
                }
            }

            connect.Close();

            return lstSV;
        }


        private void btnThem_Click(object sender, EventArgs e)
        {
            if (isExit(txtMSSV.Text))
            {
                MessageBox.Show("Mssv tồn tại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            SqlConnection conn = new SqlConnection(connectstring);

            conn.Open();

            string sql = string.Format("INSERT INTO SINHVIEN (MSSV, Ho, Ten, Malop, Ngaysinh, Diachi, Trangthai) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}')",
                txtMSSV.Text, txtHo.Text, txtTen.Text, cboLop.SelectedValue, dtpNgaySinh.Value.ToString("yyyy-MM-dd"), txtDiaChi.Text, 1);

            SqlCommand cmd = new SqlCommand(sql, conn);

            int rowCount = cmd.ExecuteNonQuery();

            MessageBox.Show(rowCount == 1 ? "Thêm thành công !" : "Thêm thất bại");

            conn.Close();

            dgvDSSV.DataSource = null;
            dgvDSSV.DataSource = LayDSSV();
        }

        private void dgvDSSV_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if(dgvDSSV.SelectedRows.Count == 0)
            {
                return;
            }

            txtMSSV.Text = dgvDSSV.SelectedRows[0].Cells[0].Value.ToString();
            txtHo.Text = dgvDSSV.SelectedRows[0].Cells[1].Value.ToString();
            txtTen.Text = dgvDSSV.SelectedRows[0].Cells[2].Value.ToString();
            cboLop.SelectedValue = dgvDSSV.SelectedRows[0].Cells[3].Value.ToString();

            dtpNgaySinh.Text = dgvDSSV.SelectedRows[0].Cells[4].Value.ToString();

            txtDiaChi.Text = dgvDSSV.SelectedRows[0].Cells[5].Value.ToString();

        }
    }
}
