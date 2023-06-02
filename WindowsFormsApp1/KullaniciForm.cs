using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace WindowsFormsApp1
{
    public partial class KullaniciForm : Form
    {
        public KullaniciForm()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            AnaMenu menu = new AnaMenu();
            menu.Show();    
            this.Hide();
        }
        ASinemaEntities6 db = new ASinemaEntities6();

        private void button6_Click(object sender, EventArgs e)
        {
            Kullanici ekle = new Kullanici();
            ekle.KullaniciAd = textBox1.Text;
            ekle.Sifre = textBox2.Text;
            ekle.AdSoyad = textBox3.Text;
            ekle.Gorev = textBox4.Text;
            ekle.SubeNo = Convert.ToInt32(textBox5.Text);
            db.KEkle(ekle.KullaniciAd, ekle.Sifre, ekle.AdSoyad, ekle.Gorev, ekle.SubeNo);
            dataGridView1.DataSource = db.KListele().ToList();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Kullanici guncelle = new Kullanici();
            guncelle.KullaniciNo = Convert.ToInt32(textBox1.Tag);
            guncelle.KullaniciAd = textBox1.Text;
            guncelle.Sifre = textBox2.Text;
            guncelle.AdSoyad = textBox3.Text;
            guncelle.Gorev = textBox4.Text;
            guncelle.SubeNo = Convert.ToInt32(textBox5.Text);
            db.KYenile(guncelle.KullaniciNo, guncelle.KullaniciAd, guncelle.Sifre, guncelle.AdSoyad, guncelle.Gorev, guncelle.SubeNo);
            dataGridView1.DataSource = db.KListele().ToList();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            Kullanici sil = new Kullanici();
            sil.KullaniciNo = Convert.ToInt32(textBox1.Tag);
            db.KSil(sil.KullaniciNo);
            dataGridView1.DataSource = db.KListele().ToList();

        }

        private void button4_Click(object sender, EventArgs e)
        {
            Kullanici ara = new Kullanici();
            ara.KullaniciAd = textBox1.Text;
            dataGridView1.DataSource = db.KAra
                (ara.KullaniciAd).ToList();

        }

        private void button5_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = db.KListele().ToList();

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = dataGridView1.CurrentRow;
            textBox1.Tag = row.Cells["KullaniciNo"].Value.ToString();
            textBox1.Text = row.Cells["KullaniciAd"].Value.ToString();
            textBox2.Text = row.Cells["Sifre"].Value.ToString();
            textBox3.Text = row.Cells["AdSoyad"].Value.ToString();
            textBox4.Text = row.Cells["Gorev"].Value.ToString();
            textBox5.Text = row.Cells["SubeNo"].Value.ToString();
        }
    }
}
