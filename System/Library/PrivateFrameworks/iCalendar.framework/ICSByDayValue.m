@implementation ICSByDayValue

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  id v9;

  v9 = a4;
  -[ICSByDayValue number](self, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICSByDayValue number](self, "number");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR("%d"), objc_msgSend(v6, "integerValue"));

  }
  v7 = -[ICSByDayValue weekday](self, "weekday") - 1;
  if (v7 > 6)
    v8 = CFSTR("ERROR");
  else
    v8 = off_1E953B070[v7];
  objc_msgSend(v9, "appendString:", v8);

}

- (int64_t)compare:(id)a3
{
  ICSByDayValue *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  unint64_t v11;
  __CFString *v12;
  uint64_t v13;
  unint64_t v14;
  const __CFString *v15;

  v4 = (ICSByDayValue *)a3;
  -[ICSByDayValue number](self, "number");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ICSByDayValue number](v4, "number"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    -[ICSByDayValue number](self, "number");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSByDayValue number](v4, "number");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "compare:", v9);

  }
  else if (-[ICSByDayValue weekday](self, "weekday") && -[ICSByDayValue weekday](v4, "weekday"))
  {
    v11 = -[ICSByDayValue weekday](self, "weekday") - 1;
    if (v11 > 6)
      v12 = CFSTR("ERROR");
    else
      v12 = off_1E953B070[v11];
    v14 = -[ICSByDayValue weekday](v4, "weekday") - 1;
    if (v14 > 6)
      v15 = CFSTR("ERROR");
    else
      v15 = off_1E953B070[v14];
    v10 = -[__CFString compare:](v12, "compare:", v15);
  }
  else
  {
    v13 = -1;
    if (self >= v4)
      v13 = 1;
    if (self == v4)
      v10 = 0;
    else
      v10 = v13;
  }

  return v10;
}

+ (int64_t)weekdayFromICSString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SU")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MO")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TU")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TH")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FR")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SA")))
  {
    v4 = 7;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

+ (id)byDayValueFromICSString:(id)a3
{
  id v3;
  ICSByDayValue *v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") >= 2)
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length") - 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[ICSByDayValue weekdayFromICSString:](ICSByDayValue, "weekdayFromICSString:", v5);
    v8 = objc_msgSend(v6, "intValue");
    if (v7 == -1 || (int)v8 >= 54)
    {
      NSLog(CFSTR("ICSByDayValue invalid %@"), v3);
      v4 = 0;
    }
    else
    {
      if ((_DWORD)v8)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
      v4 = -[ICSByDayValue initWithWeekday:number:]([ICSByDayValue alloc], "initWithWeekday:number:", v7, v9);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (ICSByDayValue)initWithWeekday:(int64_t)a3
{
  return -[ICSByDayValue initWithWeekday:number:](self, "initWithWeekday:number:", a3, 0);
}

- (ICSByDayValue)initWithWeekday:(int64_t)a3 number:(id)a4
{
  id v6;
  ICSByDayValue *v7;
  ICSByDayValue *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ICSByDayValue;
  v7 = -[ICSByDayValue init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[ICSByDayValue setWeekday:](v7, "setWeekday:", a3);
    -[ICSByDayValue setNumber:](v8, "setNumber:", v6);
  }

  return v8;
}

- (NSNumber)number
{
  return self->_number;
}

- (void)setNumber:(id)a3
{
  NSNumber *v4;
  NSNumber **p_number;
  NSNumber *number;
  NSNumber *v7;
  NSNumber *v8;

  v7 = (NSNumber *)a3;
  if (-[NSNumber integerValue](v7, "integerValue"))
  {
    v4 = v7;
  }
  else
  {

    v4 = 0;
  }
  number = self->_number;
  p_number = &self->_number;
  if (number != v4)
  {
    v8 = v4;
    objc_storeStrong((id *)p_number, v4);
    v4 = v8;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *number;
  id v5;

  number = self->_number;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", number, CFSTR("Number"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_weekday, CFSTR("Weekday"));

}

- (ICSByDayValue)initWithCoder:(id)a3
{
  id v4;
  ICSByDayValue *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICSByDayValue;
  v5 = -[ICSByDayValue init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Number"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSByDayValue setNumber:](v5, "setNumber:", v6);

    -[ICSByDayValue setWeekday:](v5, "setWeekday:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Weekday")));
  }

  return v5;
}

- (int64_t)weekday
{
  return self->_weekday;
}

- (void)setWeekday:(int64_t)a3
{
  self->_weekday = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_number, 0);
}

@end
