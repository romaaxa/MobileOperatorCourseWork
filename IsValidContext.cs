using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PhoneStation
{
    public class IsValidContext
    {
        public bool IsNotEmptyStrings(string val1, string val2, string val3, string val4, string val5)
        {
            if (val1 != "" && val2 != "" && val3 != "" && val4 != "" && val5 != "") return true;
            else return false;
        }
        public bool IsInt(string val1, string val2)
        {
            try
            {
                Convert.ToInt16(val1);
                Convert.ToInt16(val2);
                return true;
            }
            catch { return false; }
        }
    }
}