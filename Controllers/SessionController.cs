using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace FitnessAppApi.Controllers
{
    public class SessionController : ApiController
    {
        SessionItemFac sif = new SessionItemFac();
        SessionWeightFac swf = new SessionWeightFac();

        [HttpGet]
        [Route("api/Session/GetItem/{id}")]
        public SessionItemDetails GetItem(int id)
        {
            return sif.GetSessionItem(id);
        }

        [HttpGet]
        [Route("api/Session/GetWeights/{id}")]
        public IEnumerable<SessionWeight> GetWeights(int id)
        {
            return swf.GetBy(3,"SessionItemID",id,"Time","DESC");
        }

        [HttpGet]
        [Route("api/Session/SetWeight/{id}/{weight}")]
        public IEnumerable<SessionWeight> SetWeights(int id, int weight)
        {
            SessionWeight sw = new SessionWeight();
            sw.SessionItemID = id;
            sw.Time = DateTime.Now;
            sw.Weight = weight;
            
            swf.Insert(sw);

            return swf.GetBy(3, "SessionItemID", id, "Time", "DESC");
        }

        [HttpGet]
        [Route("api/Session/SetLastRun/{id}/{lastrun}")]
        public bool SetLastRun(int id, string lastrun)
        {
            DateTime d = DateTime.Parse(lastrun);
            return sif.SetLastRun(id, d);
        }
    }
}