using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using QuanLyThuVien.DTO;

namespace QuanLyThuVien.DAO
{
    class PhieuMuon_DAO : DataProvider
    {
        public DataTable loadPhieuMuon()
        {
            string sqlString = @"select PM.MaPhieu, PM.MaDocGia, DG.HoTen, PM.MaSach, S.TenSach, PM.NgayMuon, PM.NgayPhaiTra from DOCGIA DG, PHIEUMUON PM, SACH S where PM.MaDocGia = DG.MaDocGia and PM.MaSach = S.MaSach";
            return GetData(sqlString);
        }
        public bool CheckExist(string _table, string _str)
        {
            if (_table == "DOCGIA")
                if (GetData("select* from DOCGIA where MaDocGia = '" + _str + "'").Rows.Count > 0)
                    return true;
            if (_table == "SACH")
                if (GetData("select* from SACH where MaSach = '" + _str + "'").Rows.Count > 0)
                    return true;
            return false;
        }

        public bool Insert(PhieuMuon _pm)
        {
            if (GetData("select* from PHIEUMUON where MaPhieu = '" + _pm.MaPhieu + "'").Rows.Count > 0)
                return false;
            string gt = GetData("select* from SACH where MaSach = '" + _pm.MaSach + "'").Rows[0]["SoLuong"].ToString();
            int soluong = int.Parse(gt);
            if (soluong <= 0)
                return false;
            string sql = string.Format("Insert Into PHIEUMUON values('{0}','{1}','{2}','{3}', '{4}', '0')",
                _pm.MaPhieu, _pm.MaDocGia, _pm.MaSach, _pm.NgayMuon.ToString("yyyy-MM-dd"), _pm.NgayPhaiTra.ToString("yyyy-MM-dd"));

            Excute(sql);
            sql = string.Format("update SACH set SoLuong -= '{0}' where MaSach = '{1}'",
                 1, _pm.MaSach);
            Excute(sql);


            sql = string.Format("update SACH set TinhTrang = N'{0}' where SoLuong > '{1}'", "Còn", 0);
            GetData(sql);
            sql = string.Format("update SACH set TinhTrang = N'{0}' where SoLuong <= '{1}'", "Hết", 0);
            GetData(sql);
            return true;
        }
        public void Delete(string _pm)
        {
            Excute("delete from PHIEUMUON where MaPhieu = '" + _pm + "'");
        }

        public void Update(PhieuMuon _pm)
        {
            string sql = string.Format("update PHIEUMUON set MaDocGia = N'{0}', MaSach = N'{1}', NgayMuon = '{2}', NgayPhaiTra = '{3}'  where MaPhieu = '{4}'",
                 _pm.MaDocGia, _pm.MaSach, _pm.NgayMuon.ToString("yyyy-MM-dd"), _pm.NgayPhaiTra.ToString("yyyy-MM-dd"), _pm.MaPhieu);
            Excute(sql);
        }
        public DataTable Search(string _timkiem, string _loaitk)
        {
            string sqlString = string.Format("select PM.MaPhieu, PM.MaDocGia, DG.HoTen, PM.MaSach, S.TenSach, PM.NgayMuon, PM.NgayPhaiTra from DOCGIA DG, PHIEUMUON PM, SACH S where PM.MaDocGia = DG.MaDocGia and PM.MaSach = S.MaSach and PM.{0} like N'%{1}%'", _loaitk, _timkiem);
            return GetData(sqlString);
        }

    }
}
