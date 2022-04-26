using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QuanLyThuVien.DTO;
namespace QuanLyThuVien.DAO
{
    class ThanhVien_DAO: DataProvider
    {
        public bool login(string us, string pw)
        {
            if (GetData("select* from ACCOUNT where TenDangNhap = '" + us + "' and MatKhau = '" + pw + "'").Rows.Count > 0)
                return true;
            return false;
        }
        public bool signup(ThanhVien tv)
        {
            if (GetData("select* from ACCOUNT where TenDangNhap = '" + tv.TenDangNhap + "'").Rows.Count > 0)
                return false;
            Random rdm = new Random();
            tv.MaDocGia = rdm.Next(0, 1000).ToString();
            while(GetData("select* from ACCOUNT where MaDocGia = '" + tv.TenDangNhap + "'").Rows.Count > 0)
            {
                tv.MaDocGia = rdm.Next(0, 1000).ToString();
            }
            string sql = string.Format("Insert Into ACCOUNT values('{0}','{1}','{2}','{3}')",
                 tv.MaDocGia, tv.TenDangNhap, tv.MatKhau, 1);
            Excute(sql);
            sql = string.Format("Insert Into DOCGIA(MaDocGia, TenDangNhap) values('{0}', '{1}')", tv.MaDocGia, tv.TenDangNhap);
            Excute(sql);
            return true;
        }
        public void Update(DocGia dg)
        {
            string sql = string.Format("update DOCGIA set HoTen = N'{0}', GioiTinh = N'{1}', NamSinh = '{2}', DiaChi = N'{3}' where MaDocGia = '{4}'",
                dg.HoTen, dg.GioiTinh, dg.NamSinh, dg.DiaChi, dg.MaDocGia);
            Excute(sql);
        }
    }
}
