using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace FitnessAppApi.Controllers
{
    public class ProgramController : ApiController
    {
        ProgramFac pf = new ProgramFac();

        [HttpGet]
        [Route("api/Program/GetAll/{userid}")]
        public IEnumerable<Program> GetAll(int userid)
        {
            return pf.GetBy("UserID",userid,"Created");
        }

        [HttpGet]
        [Route("api/Program/Get/{id}")]
        public Program Get(int id )
        {
            return pf.Get(id);
        }


        [HttpGet]
        [Route("api/Program/GetFullProgram/{id}")]
        public FullProgram GetFullProgram(int id)
        {
            return pf.GetFullProgram(id);
        }



    }
}