namespace Service.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ЗаявкаНаПоставку
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ЗаявкаНаПоставку()
        {
            Поставка = new HashSet<Поставка>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID_заявНаПост { get; set; }

        [Required]
        [StringLength(50)]
        public string Дата_создания { get; set; }

        [Required]
        [StringLength(50)]
        public string Дата_закрытия { get; set; }

        public int ID_поставщика { get; set; }

        public int ID_сотрудника { get; set; }

        public virtual Поставщик Поставщик { get; set; }

        public virtual Сотрудник Сотрудник { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Поставка> Поставка { get; set; }
    }
}
