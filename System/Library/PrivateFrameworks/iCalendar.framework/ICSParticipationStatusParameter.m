@implementation ICSParticipationStatusParameter

+ (id)participationStatusParameterFromICSString:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = +[ICSUserAddress participationStatusFromICSString:](ICSUserAddress, "participationStatusFromICSString:", a3);
  if ((_DWORD)v3)
  {
    +[ICSParticipationStatusParameter participationStatusParameterFromCode:](ICSParticipationStatusParameter, "participationStatusParameterFromCode:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)participationStatusParameterFromCode:(int)a3
{
  return -[ICSPredefinedValue initWithLong:]([ICSParticipationStatusParameter alloc], "initWithLong:", a3);
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
  +[ICSUserAddress ICSStringFromParticipationStatus:](ICSUserAddress, "ICSStringFromParticipationStatus:", -[ICSPredefinedValue longValue](self, "longValue"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  iCalendarAppendStringToStringWithOptions(v7, v6, v4);

}

@end
