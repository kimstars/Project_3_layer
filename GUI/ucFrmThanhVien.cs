using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QuanLyThuVien.DAO;
using QuanLyThuVien.DTO;
using QuanLyThuVien.BUS;
namespace QuanLyThuVien
{
    public partial class ucFrmThanhVien : UserControl
    {
        DataProvider _dt = new DataProvider();
        private string tdn;
        ThanhVien_BUS tvBUS = new ThanhVien_BUS();
        public ucFrmThanhVien(string _tdn)
        {
            InitializeComponent();
            tdn = _tdn;
            lb_ThanhCong.Visible = false;
        }

        private void ucFrmThanhVien_Load(object sender, EventArgs e)
        {
            string sqlString = string.Format("select * from ACCOUNT, DOCGIA where ACCOUNT.MaDocGia = DOCGIA.MaDocGia and ACCOUNT.TenDangNhap = '" + tdn + "'");
            DataTable dt = _dt.GetData(sqlString);
            txt_HoTen.DataBindings.Add("Text", dt, "HoTen", true);
            txt_MTV.DataBindings.Add("Text", dt, "MaDocGia", true);
            txt_TenDangNhap.DataBindings.Add("Text", dt, "TenDangNhap", true);
            //string gt = dt.Rows[0]["GioiTinh"].ToString();
            txt_GioiTinh.DataBindings.Add("Text", dt, "GioiTinh", true);
            if (txt_GioiTinh.Text == "Nữ   ")
                rdoBtnNu.Checked = true;
            else if (txt_GioiTinh.Text == "Nam  ")
                rdoBtnNam.Checked = true;
            dateNamSinh.DataBindings.Add("Text", dt, "NamSinh", true);
            txt_DiaChi.DataBindings.Add("Text", dt, "DiaChi", true);
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            DocGia _dg = new DocGia();
            _dg.HoTen = txt_HoTen.Text;
            _dg.MaDocGia = txt_MTV.Text;
            
            if (rdoBtnNam.Checked == true)
                _dg.GioiTinh = "Nam  ";
            else if (rdoBtnNu.Checked == true)
                _dg.GioiTinh = "Nữ   ";

            if (dateNamSinh.Text == "")
                _dg.NamSinh = DateTime.Now;
            else
                _dg.NamSinh = dateNamSinh.DateTime;

            _dg.DiaChi = txt_DiaChi.Text;
            tvBUS.sua(_dg);
            lb_ThanhCong.Visible = true;
        }

        private void btn_Huy_Click(object sender, EventArgs e)
        {

        }
    }
}
