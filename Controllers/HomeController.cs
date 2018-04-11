using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FitnessAppApi.Controllers
{
    public class HomeController : Controller
    {
        UserFac uf = new UserFac();

        public ActionResult Index()
        {            
            //AutoGen ag = new AutoGen("FitnessAppApi", Request.PhysicalApplicationPath + "App_Data/");
            ViewBag.Name = uf.Get(1).Name;
            return View();
        }
    }
}