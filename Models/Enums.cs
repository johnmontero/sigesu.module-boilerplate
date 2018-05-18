using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Reflection;
using app.Models;

namespace app.Models
{
    public class Enums
    {
        public enum StatePaymentOrder
        {
            
            [Display(Name="Pendiente Verificar")]
            [Description("Pendiente Verificar")]
            PendingVerify = 1,

            [Display(Name="Verificado")]
            [Description("Verificado")]
            Verified = 2,


            [Display(Name="Aprobado")]
            [Description("Aprobado")]
            Approve = 3,

            [Display(Name="Pendiente Pagar")]
            [Description("Pendiente Pagar")]
            PendingPaid = 4,

            [Display(Name="Pagado Parcialmente")]
            [Description("Pagado Parcialmente")]
            PaidPartial = 5,

            [Display(Name="Pagado")]
            [Description("Pagado")]
            Paid = 6
        }
    }
}    