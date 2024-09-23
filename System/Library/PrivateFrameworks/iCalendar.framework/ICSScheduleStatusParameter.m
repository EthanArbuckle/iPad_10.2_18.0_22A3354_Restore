@implementation ICSScheduleStatusParameter

+ (id)scheduleStatusParameterFromICSString:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = +[ICSUserAddress scheduleStatusFromICSString:](ICSUserAddress, "scheduleStatusFromICSString:", a3);
  if ((_DWORD)v3)
  {
    +[ICSScheduleStatusParameter scheduleStatusParameterFromCode:](ICSScheduleStatusParameter, "scheduleStatusParameterFromCode:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)scheduleStatusParameterFromCode:(int)a3
{
  return -[ICSPredefinedValue initWithLong:]([ICSScheduleStatusParameter alloc], "initWithLong:", a3);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  char v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  +[ICSUserAddress ICSStringFromScheduleStatus:](ICSUserAddress, "ICSStringFromScheduleStatus:", -[ICSPredefinedValue longValue](self, "longValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v7, "appendString:", CFSTR("\"));
    iCalendarAppendStringToStringWithOptions(v6, v7, v4);
    objc_msgSend(v7, "appendString:", CFSTR("\"));
  }

}

@end
