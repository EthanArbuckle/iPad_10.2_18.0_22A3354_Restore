@implementation ICSDateValue

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "appendFormat:", CFSTR("%.4d%.2d%.2d"), -[ICSDateValue year](self, "year"), -[ICSDateValue month](self, "month"), -[ICSDateValue day](self, "day"));

}

+ (id)dateFromICSString:(id)a3
{
  return (id)objc_msgSend(a1, "dateFromICSUTF8String:", objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
}

- (ICSDateValue)initWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5
{
  ICSDateValue *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICSDateValue;
  result = -[ICSDateValue init](&v9, sel_init);
  if (result)
  {
    result->_year = a3;
    result->_month = a4;
    result->_day = a5;
  }
  return result;
}

- (id)components
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v3, "setYear:", self->_year);
  objc_msgSend(v3, "setMonth:", self->_month);
  objc_msgSend(v3, "setDay:", self->_day);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[ICSDateValue compare:](self, "compare:", v4) == 0;

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v5 = -[ICSDateValue year](self, "year");
  v6 = -[ICSDateValue month](self, "month");
  v7 = -[ICSDateValue day](self, "day");
  v8 = objc_msgSend(v4, "year");
  v9 = objc_msgSend(v4, "month");
  v10 = objc_msgSend(v4, "day");
  if (v5 < v8)
    goto LABEL_2;
  if (v5 != v8)
    goto LABEL_23;
  if (v6 < v9 || v6 == v9 && v7 < v10)
    goto LABEL_2;
  v11 = 1;
  if (v6 == v9 && v7 == v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[ICSDateValue hour](self, "hour");
      v13 = -[ICSDateValue minute](self, "minute");
      v14 = -[ICSDateValue second](self, "second");
    }
    else
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_msgSend(v4, "hour");
      v16 = objc_msgSend(v4, "minute");
      v17 = objc_msgSend(v4, "second");
    }
    else
    {
      v15 = 0;
      v16 = 0;
      v17 = 0;
    }
    if (v12 < v15)
      goto LABEL_2;
    if (v12 == v15)
    {
      if (v13 >= v16 && (v13 != v16 || v14 >= v17))
      {
        if (v13 == v16 && v14 == v17)
        {
          v11 = 0;
          goto LABEL_24;
        }
        goto LABEL_23;
      }
LABEL_2:
      v11 = -1;
      goto LABEL_24;
    }
LABEL_23:
    v11 = 1;
  }
LABEL_24:

  return v11;
}

- (id)icsString
{
  return -[NSObject _ICSStringWithOptions:](self, "_ICSStringWithOptions:", 0);
}

- (id)description
{
  return -[NSObject _ICSStringWithOptions:](self, "_ICSStringWithOptions:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t year;
  id v5;

  year = self->_year;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", year, CFSTR("Year"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_month, CFSTR("Month"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_day, CFSTR("Day"));

}

- (ICSDateValue)initWithCoder:(id)a3
{
  id v4;
  ICSDateValue *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICSDateValue;
  v5 = -[ICSDateValue init](&v7, sel_init);
  if (v5)
  {
    v5->_year = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Year"));
    v5->_month = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Month"));
    v5->_day = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Day"));
  }

  return v5;
}

- (int64_t)year
{
  return self->_year;
}

- (int64_t)month
{
  return self->_month;
}

- (int64_t)day
{
  return self->_day;
}

+ (id)dateFromICSUTF8String:(const char *)a3
{
  size_t v4;
  void *v5;
  int v6;
  int v7;
  __objc2_class *v8;
  ICSDateValue *v9;
  id result;
  int v11;
  __objc2_class *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (!a3)
    return 0;
  v4 = strlen(a3);
  v5 = 0;
  v6 = 0;
  v7 = 0;
  switch(v4)
  {
    case 6uLL:
      goto LABEL_5;
    case 7uLL:
      if (a3[6] != 90)
        return 0;
      v7 = 1;
LABEL_5:
      v22 = 0;
      v23 = 0;
      v21 = 0;
      if (sscanf(a3, "%02d%02d%02d", &v22, (char *)&v21 + 4, &v21) != 3)
        return 0;
      if (v7)
        v8 = ICSDateTimeUTCValue;
      else
        v8 = ICSDateTimeValue;
      v13 = [v8 alloc];
      v15 = SHIDWORD(v21);
      v14 = (int)v22;
      v16 = (int)v21;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      goto LABEL_21;
    case 8uLL:
      v22 = 0;
      v23 = 0;
      v21 = 0;
      if (sscanf(a3, "%04d%02d%02d", (char *)&v23 + 4, &v23, (char *)&v22 + 4) != 3)
        return 0;
      v9 = [ICSDateValue alloc];
      return -[ICSDateValue initWithYear:month:day:](v9, "initWithYear:month:day:", SHIDWORD(v23), (int)v23, SHIDWORD(v22));
    case 0xFuLL:
      goto LABEL_12;
    case 0x10uLL:
      if (a3[15] != 90)
        return 0;
      v6 = 1;
LABEL_12:
      v22 = 0;
      v23 = 0;
      v21 = 0;
      v20 = 0;
      v11 = sscanf(a3, "%04d%02d%02d%c%02d%02d%02d", (char *)&v23 + 4, &v23, (char *)&v22 + 4, &v20, &v22, (char *)&v21 + 4, &v21);
      v5 = 0;
      if (v11 != 7 || v20 != 84)
        goto LABEL_22;
      if (v6)
        v12 = ICSDateTimeUTCValue;
      else
        v12 = ICSDateTimeValue;
      v13 = [v12 alloc];
      v18 = (int)v23;
      v17 = SHIDWORD(v23);
      v14 = (int)v22;
      v19 = SHIDWORD(v22);
      v16 = (int)v21;
      v15 = SHIDWORD(v21);
LABEL_21:
      v5 = (void *)objc_msgSend(v13, "initWithYear:month:day:hour:minute:second:", v17, v18, v19, v14, v15, v16);
LABEL_22:
      result = v5;
      break;
    default:
      goto LABEL_22;
  }
  return result;
}

- (int)dateType
{
  return 5006;
}

@end
