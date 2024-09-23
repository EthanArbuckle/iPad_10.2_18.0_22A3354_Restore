@implementation SPCommandKeysCriteria

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sequence: %d, index: %d, hint: %d, indices: %@"), objc_msgSend(-[SPCommandKeysCriteria sequence](self, "sequence"), "intValue"), objc_msgSend(-[SPCommandKeysCriteria index](self, "index"), "intValue"), objc_msgSend(-[SPCommandKeysCriteria hint](self, "hint"), "intValue"), -[SPCommandKeysCriteria indices](self, "indices"));
}

- (BOOL)_cl_isEqual:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  unsigned int v8;

  if (a3 == self)
    return 1;
  v5 = objc_opt_class(SPCommandKeysCriteria, a2);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
  {
    v6 = objc_msgSend(a3, "dateInterval");
    v7 = -[SPCommandKeysCriteria dateInterval](self, "dateInterval");
    if (v6)
      v8 = objc_msgSend(v7, "isEqualToDateInterval:", objc_msgSend(a3, "dateInterval"));
    else
      v8 = v7 == 0;
    if (objc_msgSend(a3, "sequence"))
    {
      if (v8)
        v8 = objc_msgSend(-[SPCommandKeysCriteria sequence](self, "sequence"), "isEqualToNumber:", objc_msgSend(a3, "sequence"));
    }
    else if (v8)
    {
      v8 = -[SPCommandKeysCriteria sequence](self, "sequence") == 0;
    }
    if (objc_msgSend(a3, "index"))
    {
      if (v8)
        v8 = objc_msgSend(-[SPCommandKeysCriteria index](self, "index"), "isEqualToNumber:", objc_msgSend(a3, "index"));
    }
    else if (v8)
    {
      v8 = -[SPCommandKeysCriteria index](self, "index") == 0;
    }
    if (objc_msgSend(a3, "indices"))
    {
      if (v8)
        v8 = objc_msgSend(-[SPCommandKeysCriteria indices](self, "indices"), "isEqualToArray:", objc_msgSend(a3, "indices"));
    }
    else if (v8)
    {
      v8 = -[SPCommandKeysCriteria indices](self, "indices") == 0;
    }
    if (objc_msgSend(a3, "hint"))
    {
      if (v8)
        return objc_msgSend(-[SPCommandKeysCriteria hint](self, "hint"), "isEqualToNumber:", objc_msgSend(a3, "hint"));
    }
    else if (v8)
    {
      return -[SPCommandKeysCriteria hint](self, "hint") == 0;
    }
  }
  return 0;
}

@end
