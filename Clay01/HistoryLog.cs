//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Clay01
{
    using System;
    using System.Collections.Generic;
    
    public partial class HistoryLog
    {
        public int IdHistoryLogs { get; set; }
        public int UserID { get; set; }
        public int DoorID { get; set; }
        public System.DateTime Time { get; set; }
    
        public virtual Door Door { get; set; }
        public virtual User User { get; set; }
    }
}