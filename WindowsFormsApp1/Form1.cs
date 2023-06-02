using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        ASinemaEntities6 db = new ASinemaEntities6();
        private void button3_Click(object sender, EventArgs e)
        {
            Kullanici ekle = new Kullanici();
            ekle.KullaniciAd = textBox4.Text;
            ekle.Sifre = textBox3.Text;
            ekle.AdSoyad = textBox5.Text;
            ekle.Gorev = textBox6.Text;
            ekle.SubeNo = Convert.ToInt32(textBox7.Text);
            db.KEkle(ekle.KullaniciAd, ekle.Sifre, ekle.AdSoyad, ekle.Gorev, ekle.SubeNo);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Kullanici gir = new Kullanici();
            gir.KullaniciAd = textBox1.Text;
            gir.Sifre = textBox2.Text;
            db.Giris(gir.KullaniciAd, gir.Sifre);

            MessageBox.Show("giriş yaptınız");
            AnaMenu ana = new AnaMenu();
            ana.Show();
            this.Hide();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            groupBox2.Visible = false;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            groupBox2.Visible = true;

        }
    }
}
