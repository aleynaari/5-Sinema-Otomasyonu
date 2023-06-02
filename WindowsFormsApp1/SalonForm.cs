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
    public partial class SalonForm : Form
    {
        public SalonForm()
        {
            InitializeComponent();
        }
        ASinemaEntities6 db = new ASinemaEntities6();
        private void button1_Click(object sender, EventArgs e)
        {
            Salon ekle = new Salon();
            ekle.SalonAd = textBox1.Text;
            ekle.KoltukSayisi = Convert.ToInt32(textBox2.Text);
            db.SEkle(ekle.SalonAd, ekle.KoltukSayisi);
            dataGridView1.DataSource = db.SListele().ToList();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Salon guncelle = new Salon();
            guncelle.SalonNo = Convert.ToInt32(textBox1.Tag);
            guncelle.SalonAd = textBox1.Text;
            guncelle.KoltukSayisi = Convert.ToInt32(textBox2.Text);
            db.SYenile(guncelle.SalonNo, guncelle.SalonAd, guncelle.KoltukSayisi);
            dataGridView1.DataSource = db.SListele().ToList();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Salon sil = new Salon();
            sil.SalonNo = Convert.ToInt32(textBox1.Tag);
            db.SSil(sil.SalonNo);
            dataGridView1.DataSource = db.SListele().ToList();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Salon ara = new Salon();
            ara.SalonAd = textBox1.Text;
            dataGridView1.DataSource = db.SAra
                (ara.SalonAd).ToList();

        }

        private void button5_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = db.SListele().ToList();

        }

        private void button6_Click(object sender, EventArgs e)
        {
            AnaMenu ana = new AnaMenu();
            ana.Show();
            this.Hide();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = dataGridView1.CurrentRow;
            textBox1.Tag = row.Cells["SalonNo"].Value.ToString();
            textBox1.Text = row.Cells["SalonAd"].Value.ToString();
            textBox2.Text = row.Cells["KoltukSayisi"].Value.ToString();
          
        }
    }
}
