using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace FitnessAppApi.Controllers
{
    public class UserController : ApiController
    {
        UserFac uf = new UserFac();
       
        [Route("api/User/GetUser/{id}")]
        [HttpGet]
        public string GetUser(int id)
        {
            return uf.Get(id).Name;
        }

        [HttpGet]
        [Route("api/User/Login/{username}/{password}")]
        public User Login(string username, string password)
        {
            return uf.Login(username, password);
        }
    }
}