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
            ExerciseFac ef = new ExerciseFac();
            var t = "";
            foreach (var item in ef.GetAll())
            {
                t += item.ID + " " + item.Name + "<br/> ";
            }
            //AutoGen ag = new AutoGen("FitnessAppApi", Request.PhysicalApplicationPath + "App_Data/");
            ViewBag.Name = t;
            return View();
        }
    }
}