using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;


namespace app.Models
{
    [Table("Producto")]
    public class Product
    {
        [Display(Name = "Id")]
        public int Id { get; set; }

        [Required]
        [StringLength(120)]
        [Display(Name = "Nombre")]
        public string Name { get; set; }
    }
}
