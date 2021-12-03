namespace Service.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Доставка
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID_доставки { get; set; }

        public int ID_сотрудника { get; set; }

        public int ID_договора { get; set; }

        [Required]
        [StringLength(50)]
        public string ФИО_клиента { get; set; }

        [Required]
        [StringLength(50)]
        public string Контактный_телефон { get; set; }

        [Required]
        [StringLength(50)]
        public string Адрес_клиента { get; set; }

        [Required]
        [StringLength(50)]
        public string Способо_доставки { get; set; }

        public virtual Договор Договор { get; set; }

        public virtual Сотрудник Сотрудник { get; set; }
    }
}
