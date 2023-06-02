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
    public partial class Rapor : Form
    {
        public Rapor()
        {
            InitializeComponent();
        }
        ASinemaEntities6 db = new ASinemaEntities6();

        private void button1_Click(object sender, EventArgs e)
        {
            AnaMenu ana = new AnaMenu();
            ana.Show();
            this.Hide();
        }
        //var sonuc = db.Films.Where(m => m.Tur == "Komedi").ToList();
        //dataGridView1.DataSource = sonuc.ToList();
        private void button2_Click(object sender, EventArgs e)
        {
            var sonuc = from film in db.Films
                        where film.Tur == "Komedi"
                        orderby film.Ad descending
                        select film;
            dataGridView1.DataSource = sonuc.ToList();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            var sonuc = from f in db.Films
                        join s1 in db.Salons

            on f.SNo equals s1.SalonNo
                        orderby f.SNo
                        select new
                        { 
                            f.Ad,
                            f.Tur,
                            f.Sure,
                            f.Puan,
                            f.VizyonTarihi,
                            s1.SalonAd,
                            s1.KoltukSayisi
                        };
            dataGridView1.DataSource = sonuc.ToList();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            var sonuc = from f in db.Films
                        orderby f.Sure ascending
                        select f;
            dataGridView1.DataSource = sonuc.ToList();
        }
    }
}
