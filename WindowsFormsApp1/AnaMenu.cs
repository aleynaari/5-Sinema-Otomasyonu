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
    public partial class AnaMenu : Form
    {
        public AnaMenu()
        {
            InitializeComponent();
        }
        ASinemaEntities6 db = new ASinemaEntities6();

        private void button1_Click(object sender, EventArgs e)
        {
            FilmForm film = new FilmForm();
            film.Show();
            this.Hide();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            SalonForm salon = new SalonForm();
            salon.Show();
            this.Hide();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Rapor rapor = new Rapor();
            rapor.Show();
            this.Hide();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            KullaniciForm user = new KullaniciForm();
            user.Show();
            this.Hide();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            SubeForm sube = new SubeForm();
            sube.Show();
            this.Hide();
        }
    }
}
