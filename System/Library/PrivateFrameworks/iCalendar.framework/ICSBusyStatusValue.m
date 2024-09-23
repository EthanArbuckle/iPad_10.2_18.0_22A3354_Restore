@implementation ICSBusyStatusValue

+ (id)busyStatusValueFromICSString:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUSY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FREE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TENTATIVE")) & 1) != 0)
  {
    v4 = 3;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("OOF")))
    {
      v5 = 0;
      goto LABEL_10;
    }
    v4 = 4;
  }
  +[ICSBusyStatusValue busyStatusTypeFromCode:](ICSBusyStatusValue, "busyStatusTypeFromCode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v5;
}

+ (id)busyStatusTypeFromCode:(int)a3
{
  return -[ICSPredefinedValue initWithLong:]([ICSBusyStatusValue alloc], "initWithLong:", a3);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  char v4;
  unsigned int v6;
  __CFString *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  v6 = -[ICSPredefinedValue longValue](self, "longValue") - 2;
  if (v6 > 2)
    v7 = CFSTR("BUSY");
  else
    v7 = off_1E953AFF8[v6];
  iCalendarAppendStringToStringWithOptions(v7, v8, v4);

}

@end
