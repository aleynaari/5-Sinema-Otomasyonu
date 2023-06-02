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
    public partial class SubeForm : Form
    {
        public SubeForm()
        {
            InitializeComponent();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            AnaMenu menu = new AnaMenu();
            menu.Show();
            this.Hide();
        }
        ASinemaEntities6 db = new ASinemaEntities6();
        private void button1_Click(object sender, EventArgs e)
        {
            Sube ekle = new Sube();
            ekle.Ad = textBox1.Text;
            ekle.SalonSayisi = Convert.ToInt32(textBox2.Text);
            ekle.CalisanSayisi = Convert.ToInt32(textBox3.Text);
            db.SubeEkle(ekle.Ad, ekle.SalonSayisi, ekle.CalisanSayisi);
            dataGridView1.DataSource = db.SubeListele().ToList();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Sube guncelle = new Sube();
            guncelle.SubeNo = Convert.ToInt32(textBox1.Tag);
            guncelle.Ad = textBox1.Text;
            guncelle.SalonSayisi = Convert.ToInt32(textBox2.Text);
            guncelle.CalisanSayisi = Convert.ToInt32(textBox3.Text);
            db.SubeYenile(guncelle.SubeNo, guncelle.Ad, guncelle.SalonSayisi, guncelle.CalisanSayisi);
            dataGridView1.DataSource = db.SubeListele().ToList();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            Sube sil = new Sube();
            sil.SubeNo = Convert.ToInt32(textBox1.Tag);
            db.SubeSil(sil.SubeNo);
            dataGridView1.DataSource = db.SubeListele().ToList();

        }

        private void button4_Click(object sender, EventArgs e)
        {
            Sube ara = new Sube();
            ara.Ad = textBox1.Text;
            dataGridView1.DataSource = db.SubeAra
                (ara.Ad).ToList();

        }

        private void button5_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = db.SubeListele().ToList();

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = dataGridView1.CurrentRow;
            textBox1.Tag = row.Cells["SubeNo"].Value.ToString();
            textBox1.Text = row.Cells["Ad"].Value.ToString();
            textBox2.Text = row.Cells["SalonSayisi"].Value.ToString();
            textBox3.Text = row.Cells["CalisanSayisi"].Value.ToString();

        }
    }
}
