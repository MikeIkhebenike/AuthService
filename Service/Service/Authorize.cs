using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Service.EF;

namespace Service
{
    public partial class Authorize : Form
    {
        public static Authorize Auth { get; set; }
        public static Сотрудник Employee { get; set; }
        Model1 db = new Model1();

        public Authorize()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "" || textBox2.Text == "")
            {
                MessageBox.Show("Нужно задать логин и пароль!");
                return;
            }
            Сотрудник emp = db.Сотрудник.Find.(textBox1.Text);
            if ((emp.Логин == textBox1.Text) && (emp.Пароль == textBox2.Text))
            {
                Employee = emp;
                Auth = this;
                if (emp.ID_роли == 1)
                {
                    Admin frm = new Admin();
                    frm.Show();
                    this.Hide();
                }
                else if (emp.ID_роли == 2)
                {
                    //Form4 frm = new Form4();
                    //frm.Show();
                    //this.Hide();
                }
                else if (emp.ID_роли == 3)
                {
                    //Form5 frm = new Form5();
                    //frm.Show();
                    //this.Hide();
                }
                else
                {
                    MessageBox.Show($"Роли {emp.ID_роли} в системе нет!");
                    return;
                }
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
