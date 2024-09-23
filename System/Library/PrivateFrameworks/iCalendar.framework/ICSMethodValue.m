@implementation ICSMethodValue

+ (id)methodValueFromICSString:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = +[ICSCalendar methodFromICSString:](ICSCalendar, "methodFromICSString:", a3);
  if ((_DWORD)v3)
  {
    +[ICSMethodValue methodParameterFromCode:](ICSMethodValue, "methodParameterFromCode:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)methodParameterFromCode:(int)a3
{
  return -[ICSPredefinedValue initWithLong:]([ICSMethodValue alloc], "initWithLong:", a3);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  char v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  +[ICSCalendar ICSStringFromMethod:](ICSCalendar, "ICSStringFromMethod:", -[ICSPredefinedValue longValue](self, "longValue"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  iCalendarAppendStringToStringWithOptions(v7, v6, v4);

}

@end
