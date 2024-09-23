@implementation ICSClassificationValue

+ (id)classificationValueFromICSString:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUBLIC")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRIVATE")) & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("CONFIDENTIAL")))
    {
      v5 = 0;
      goto LABEL_8;
    }
    v4 = 3;
  }
  +[ICSClassificationValue classificationFromCode:](ICSClassificationValue, "classificationFromCode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v5;
}

+ (id)classificationFromCode:(int)a3
{
  return -[ICSPredefinedValue initWithLong:]([ICSClassificationValue alloc], "initWithLong:", a3);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  char v4;
  int v6;
  const __CFString *v7;
  __CFString *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  v6 = -[ICSPredefinedValue longValue](self, "longValue");
  v7 = CFSTR("PUBLIC");
  if (v6 == 2)
    v7 = CFSTR("PRIVATE");
  if (v6 == 3)
    v8 = CFSTR("CONFIDENTIAL");
  else
    v8 = (__CFString *)v7;
  iCalendarAppendStringToStringWithOptions(v8, v9, v4);

}

@end
