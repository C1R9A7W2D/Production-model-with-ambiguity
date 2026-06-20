using System;
using System.Globalization;
using System.Linq;

namespace prod_sys
{
    public class Fact
    {
        public int Index { get; set; }
        public string Name { get; set; }
        public string Property { get; set; }
        public string Comment { get; set; }
        public double Confidence { get; set; }

        private const int SIMPLE_FACTS_COUNT = 66;
        private const int FIRST_TIME_FACT_INDEX = 196;

        public Fact(string line)
        {
            var parts = line.Split(';');

            string[] splitFirstPart = parts[0].Split('_');

            string productionType = splitFirstPart[0];

            if (productionType.Equals("факт"))
                InitSimpleFact(parts, splitFirstPart[1]);
            else if (productionType.Equals("правило"))
            {
                InitGeneratedFact(parts, splitFirstPart[1]);
            }
            else
            {
                InitTimeFact(parts, splitFirstPart[1]);
            }
        }

        private void InitSimpleFact(string[] parts, string ind)
        {
            Index = int.Parse(ind);
            Name = parts[1];
            Property = parts[2];
            Comment = parts[3];
            Confidence = parts.Length > 4 ? double.Parse(parts[4]) : 1.0; // 1.0 по умолчанию, если не указан
        }

        private void InitGeneratedFact(string[] parts, string ind)
        {
            Index = int.Parse(ind) + SIMPLE_FACTS_COUNT;
            Name = parts[3];
            Property = parts[3];
            Comment = parts[4];
            Confidence = parts.Length > 5 ? double.Parse(parts[5]) : 1.0; // 1.0 по умолчанию, если не указан
        }

        private void InitTimeFact(string[] parts, string ind)
        {
            Index = int.Parse(ind) - 1 + FIRST_TIME_FACT_INDEX;
            Name = parts[1];
            Property = parts[1];
            Comment = parts[1];
            Confidence = 1.0;
        }

        public override string ToString()
        {
            return $"{Name} => {Property}";
        }

        public bool Equals(Fact b)
        {
            return Index.Equals(b.Index);
        }

        public override bool Equals(object obj)
        {
            return obj is Fact && Equals((Fact)obj);
        }

        public override int GetHashCode()
        {
            return Index;
        }
    }
}
