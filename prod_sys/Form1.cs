using System;
using System.Data;
using System.IO;
using System.Linq;
using System.Windows.Forms;
using System.Collections.Generic;
using CLIPSNET;
using System.Globalization;

namespace prod_sys
{
    public partial class Form1 : Form
    {
        private CLIPSNET.Environment clips = new CLIPSNET.Environment();

        List<Fact> facts;
        bool targetReached = false;

        HashSet<Fact> leftCheckedFacts;
        HashSet<Fact> rightCheckedFacts;

        public void InitFacts()
        {
            facts = new List<Fact>();

            using (var reader = new StreamReader("../../Knowledge_base.txt"))
            {
                string line;

                while ((line = reader.ReadLine()) != null)
                {
                    if (line == "" || line.StartsWith("//"))
                        continue;

                    string[] rows = line.Split(';');
                    facts.Add(new Fact(line));
                }
            }

            AddTimeFacts();
        }

        private void AddTimeFacts()
        {
            Fact[] timeFacts = { new Fact("время_1;Прошлое"), new Fact("время_2;Настоящее"), new Fact("время_3;Будущее") };
            facts.AddRange(timeFacts);
        }

        public void LoadCheckBox()
        {
            foreach (var f in facts)
            {
                var num = f.Index;
                if (num <= 66 && num % 3 == 1)
                {
                    checkedListBox1.Items.Add(num + " " + f.Name);
                }
                else if (num >= 176 && num <= 195)
                    checkedListBox2.Items.Add(num + " " + f.Name);
                else if (num > 195)
                    checkedListBox1.Items.Add(num + " " + f.Name);
            }
        }

        public void InitClips()
        {
            string clp = System.IO.File.ReadAllText("../../generated_rules.clp");
            clips.LoadFromString(clp);
        }

        public Form1()
        {
            InitializeComponent();
            InitFacts();
            LoadCheckBox();
            InitClips();

            button2.Enabled = false;
            leftCheckedFacts = new HashSet<Fact>();
            rightCheckedFacts = new HashSet<Fact>();
        }

        private bool NewRecognPhrases(List<FactInstance> phrases)
        {
            String CropName(FactInstance f)
            {
                var val = f.GetSlotValues()[0];
                return val.ToString().Trim(new char[] { '(', ')', '"' });
            }
            String CropConf(FactInstance f)
            {
                var val = f.GetSlotValues()[1];
                var str = val.ToString().Trim(new char[] { '(', ')', '"' });
                var d = double.Parse(str, CultureInfo.InvariantCulture);
                return d.ToString("0.00");
            }

            var phrase = CropName(phrases[0]).Split(':');
            var fs = clips.GetFactList();
            var fact_conf = fs.Where(f => f.RelationName == "item").ToList().Where(f => CropName(f).Equals(phrase[0])).First();
            richTextBox1.Text += $"Выведен факт  {phrase[0]}  ({CropConf(fact_conf)})\n";
            clips.Eval("(assert (clearmessage))");
            return rightCheckedFacts.Where(f => f.Name.Equals(phrase[0])).Count() == 1;
        }

        private void HandleResponse()
        {
            //clips.Eval("(assert (item (property \"Мудрость\") (conf 0.7)))");
            //clips.Eval("(assert (item (property \"Пробуждение\") (conf 1.0)))");
            //clips.Eval("(assert (item (property \"Понимание\") (conf 1.0)))");

            clips.Run();
            var fs = clips.GetFactList();
            var readyFacts = fs.Where(f => f.RelationName == "sendmessagehalt").ToList();
            bool goal= false;

            if (readyFacts.Count > 0)
                goal = NewRecognPhrases(readyFacts);
            else button2.Enabled = false;
            
            clips.Eval("(assert (clear-message))");

            if (goal)
            {
                targetReached = true;
                richTextBox1.Text += "\nЦелевой факт выведен\n\n";
            }

            if (readyFacts.Count > 0)
                HandleResponse();
            else if (!targetReached)
                richTextBox1.Text += "\nЦелевой факт не выведен\n\n";
        }

        private void Forward()
        {
            clips.Clear();
            InitClips();

            string lastFactName = "";
            foreach (var f in leftCheckedFacts)
            {
                string factVal = $"item (name \"{f.Property}\") (conf {GetParsedConfidence(f)})";
                clips.Eval($"(assert ({factVal}) )");
                if (f.Name != lastFactName)
                {
                    richTextBox1.Text += "Добавлен факт " + f.Name + "\n";
                    lastFactName = f.Name;
                }
            }

            button2.Enabled = true;
        }

        private static string GetParsedConfidence(Fact f)
        {
            string res = f.Confidence.ToString(CultureInfo.InvariantCulture);
            if (((int)f.Confidence) == f.Confidence)
                return res + ".0";
            else
                return res;
        }

        private void checkedListBox1_ItemCheck(object sender, ItemCheckEventArgs e)
        {
            if (e.Index >= 22)
            {
                int ind = e.Index + 173;

                if (e.NewValue == CheckState.Checked && !leftCheckedFacts.Contains(facts[ind]))
                    leftCheckedFacts.Add(facts[ind]);

                else if (e.NewValue == CheckState.Unchecked)
                    leftCheckedFacts.Remove(facts[ind]);
            }
            else
            {
                int firstIndOfSameFact = e.Index * 3;

                if (e.NewValue == CheckState.Checked && !leftCheckedFacts.Contains(facts[firstIndOfSameFact]))
                    for (int i = firstIndOfSameFact; i < firstIndOfSameFact + 3; i++)
                        leftCheckedFacts.Add(facts[i]);

                else if (e.NewValue == CheckState.Unchecked)
                    for (int i = firstIndOfSameFact; i < firstIndOfSameFact + 3; i++)
                        leftCheckedFacts.Remove(facts[i]);
            }
        }


        private void checkedListBox2_ItemCheck(object sender, ItemCheckEventArgs e)
        {
            int indOfRule = e.Index + 175;

            if (e.NewValue == CheckState.Checked && !rightCheckedFacts.Contains(facts[indOfRule]))
                rightCheckedFacts.Add(facts[indOfRule]);
            else if (e.NewValue == CheckState.Unchecked)
                rightCheckedFacts.Remove(facts[indOfRule]);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            richTextBox1.Clear();
            targetReached = false;
            if (leftCheckedFacts.Count > 0 && rightCheckedFacts.Count == 1)
                Forward();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            HandleResponse();
            button2.Enabled = false;
        }

        private void checkedListBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
            HashSet<string> items = new HashSet<string>{ };
            if (e.KeyChar == (char)Keys.Enter)
                for (int i = 0; i < checkedListBox1.Items.Count; i++)
                    if (items.Any(Index => checkedListBox1.GetItemText(checkedListBox1.Items[i]).Contains(Index)))
                        checkedListBox1.SetItemChecked(i, true);
        }
    }
}
