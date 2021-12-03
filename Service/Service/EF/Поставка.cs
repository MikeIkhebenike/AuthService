namespace Service.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Поставка
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID_поставки { get; set; }

        [Required]
        [StringLength(50)]
        public string Дата_поставки { get; set; }

        public int ID_поставщика { get; set; }

        public int ID_сотрудника { get; set; }

        [Required]
        [StringLength(50)]
        public string Стоимость_поставки { get; set; }

        public int ID_заявНаПост { get; set; }

        public virtual ЗаявкаНаПоставку ЗаявкаНаПоставку { get; set; }

        public virtual Поставщик Поставщик { get; set; }

        public virtual Сотрудник Сотрудник { get; set; }
    }
}
