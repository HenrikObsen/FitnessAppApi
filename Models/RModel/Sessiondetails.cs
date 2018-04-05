using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FitnessAppApi
{
    public class Sessiondetails
    {
        public Session session { get; set; }
        public List<SessionItemDetails> sessionItems { get; set; }
    }
}