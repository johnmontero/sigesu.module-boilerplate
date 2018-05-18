using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using app.Models;
using app.Data;

namespace app.Controllers
{
    public class ProductController : Controller
    {
        private readonly ApplicationDbContext db;
        public ProductController(ApplicationDbContext _db)
        {
            db = _db;
        }

        public IActionResult Index(string searchString)
        {
            var model = from q in db.Products
                        select q;

            if (!String.IsNullOrEmpty(searchString))
            {
                model = model.Where(q => q.Name.Contains(searchString));
            }

            return View(model.ToList());
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Product data)
        {
            if (ModelState.IsValid)
            {
                db.Products.Add(data);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(data);
        }

        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id == null){
                return BadRequest();
            }
            Product data = db.Products.Find(id);
            if (data == null) {
                return NotFound();
            }
            return View(data);
        }

        [HttpPost]
        public IActionResult Edit(Product data)
        {
            if (ModelState.IsValid){
                db.Entry(data).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(data);
        }


        [HttpGet]
        public IActionResult Delete(int? id)
        {
            if (id == null)
            {
                return BadRequest();
            }
            Product data = db.Products.Find(id);
            if (data == null)
            {
                return NotFound();
            }
            return View(data);
        }

        [HttpPost, ActionName("Delete")]
        public IActionResult DeleteConfirmed(int id)
        {
            Product data = db.Products.Find(id);
            db.Products.Remove(data);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
