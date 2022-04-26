using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace QuanLyThuVien.DAO
{
    class SachDangMuon_DAO : DataProvider
    {
        public DataTable loadSach(string us)
        {
            string sqlString = string.Format("select * from PHIEUMUON, SACH, ACCOUNT where PHIEUMUON.MaDocGia = ACCOUNT.MaDocGia and SACH.MaSach = PHIEUMUON.MaSach and ACCOUNT.TenDangNhap = '{0}'and PHIEUMUON.TinhTrang = 0", us);
            return GetData(sqlString);
        }
        public DataTable Search(string tensach, string us)
        {
            string sqlString = string.Format("select * from PHIEUMUON, SACH, ACCOUNT where PHIEUMUON.MaDocGia = ACCOUNT.MaDocGia and SACH.MaSach = PHIEUMUON.MaSach and ACCOUNT.TenDangNhap = '{0}' and SACH.TenSach like N'%{1}%'and PHIEUMUON.TinhTrang = 0", us, tensach);
            return GetData(sqlString);
        }
    }
}
