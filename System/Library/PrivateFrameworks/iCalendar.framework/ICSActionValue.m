@implementation ICSActionValue

+ (id)actionValueFromICSString:(id)a3
{
  uint64_t v3;

  v3 = +[ICSAlarm actionFromICSString:](ICSAlarm, "actionFromICSString:", a3);
  if ((_DWORD)v3 == 5)
    return 0;
  +[ICSActionValue actionParameterFromCode:](ICSActionValue, "actionParameterFromCode:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)actionParameterFromCode:(int)a3
{
  return -[ICSPredefinedValue initWithLong:]([ICSActionValue alloc], "initWithLong:", a3);
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
  +[ICSAlarm ICSStringFromAction:](ICSAlarm, "ICSStringFromAction:", -[ICSPredefinedValue longValue](self, "longValue"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  iCalendarAppendStringToStringWithOptions(v7, v6, v4);

}

@end
