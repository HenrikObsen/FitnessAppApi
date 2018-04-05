using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FitnessAppApi
{
    public class FullProgram
    {
        public Program program { get; set; }
        public List<Sessiondetails> sessionsDetails { get; set; }
    }
}