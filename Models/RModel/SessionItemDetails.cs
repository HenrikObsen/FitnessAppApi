using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FitnessAppApi
{
    public class SessionItemDetails
    {

        public int ID { get; set; }

        public int SessionID { get; set; }

        public int ExerciseID { get; set; }

        public int Sets { get; set; }

        public int Reps { get; set; }

        public int Pause { get; set; }

        public string Notes { get; set; }

        public int MuscleGroupID { get; set; }

        public string Name { get; set; }

        public string Image { get; set; }

        public string Video { get; set; }

        public DateTime LastRun { get; set; }
    }
}