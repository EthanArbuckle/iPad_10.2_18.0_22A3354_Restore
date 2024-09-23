@implementation ICSStatusValue

+ (id)statusValueFromICSString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    +[ICSStatusValue statusTypeFromCode:statusString:](ICSStatusValue, "statusTypeFromCode:statusString:", +[ICSComponent statusFromString:](ICSComponent, "statusFromString:", v3), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)statusTypeFromCode:(int)a3
{
  return (id)objc_msgSend(a1, "statusTypeFromCode:statusString:", *(_QWORD *)&a3, 0);
}

+ (id)statusTypeFromCode:(int)a3 statusString:(id)a4
{
  id v5;
  ICSStatusValue *v6;

  v5 = a4;
  v6 = -[ICSPredefinedValue initWithLong:]([ICSStatusValue alloc], "initWithLong:", a3);
  -[ICSStatusValue setStatusString:](v6, "setStatusString:", v5);

  return v6;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (NSString)statusString
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStatusString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusString, 0);
}

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  char v4;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  -[ICSStatusValue statusString](self, "statusString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[ICSStatusValue statusString](self, "statusString");
  else
    +[ICSComponent stringFromStatus:](ICSComponent, "stringFromStatus:", -[ICSPredefinedValue longValue](self, "longValue"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v8 = CFSTR("TENTATIVE");
  if (v7)
    v8 = v7;
  v9 = v8;

  iCalendarAppendStringToStringWithOptions(v9, v10, v4);
}

@end
