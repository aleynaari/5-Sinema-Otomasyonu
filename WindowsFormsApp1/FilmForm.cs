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
    public partial class FilmForm: Form
    {
        public FilmForm()
        {
            InitializeComponent();
        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        ASinemaEntities6 db = new ASinemaEntities6();

        private void button1_Click(object sender, EventArgs e)
        {
            Film ekle = new Film();
            ekle.Ad = textBox1.Text;
            ekle.Tur = textBox2.Text;
            ekle.Sure = Convert.ToInt32(textBox3.Text);
            ekle.Ucret = Convert.ToDecimal(textBox4.Text);
            ekle.Puan = Convert.ToInt32(textBox5.Text); 
            ekle.VizyonTarihi = Convert.ToDateTime(dateTimePicker1.Text);
            db.FEkle(ekle.Ad, ekle.Tur, ekle.Sure, ekle.Ucret, ekle.Puan, ekle.VizyonTarihi);
            dataGridView1.DataSource = db.FListele().ToList();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Film guncelle = new Film();
            guncelle.FilmNo = Convert.ToInt32(textBox1.Tag);
            guncelle.Ad = textBox1.Text;
            guncelle.Tur = textBox2.Text;
            guncelle.Sure = Convert.ToInt32(textBox3.Text);
            guncelle.Ucret = Convert.ToDecimal(textBox4.Text);
            guncelle.Puan = Convert.ToInt32(textBox5.Text);
            guncelle.VizyonTarihi = Convert.ToDateTime(dateTimePicker1.Text);
            db.FYenile(guncelle.FilmNo, guncelle.Ad, guncelle.Tur, guncelle.Sure, guncelle.Ucret, guncelle.Puan, guncelle.VizyonTarihi);
            dataGridView1.DataSource = db.FListele().ToList();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Film sil = new Film();
            sil.FilmNo = Convert.ToInt32(textBox1.Tag);
            db.FSil(sil.FilmNo);
            dataGridView1.DataSource = db.FListele().ToList();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Film ara = new Film();
            ara.Ad = textBox1.Text;
            dataGridView1.DataSource = db.FAra
                (ara.Ad).ToList();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = db.FListele().ToList();
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
            textBox1.Tag = row.Cells["FilmNo"].Value.ToString();
            textBox1.Text = row.Cells["Ad"].Value.ToString();
            textBox2.Text = row.Cells["Tur"].Value.ToString();
            textBox3.Text = row.Cells["Sure"].Value.ToString();
            textBox4.Text = row.Cells["Ucret"].Value.ToString();
            textBox5.Text = row.Cells["Puan"].Value.ToString();
            dateTimePicker1.Text = row.Cells["VizyonTarihi"].Value.ToString();

        }
    }
}
