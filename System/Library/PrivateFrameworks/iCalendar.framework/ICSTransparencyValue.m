@implementation ICSTransparencyValue

+ (id)transparencyValueFromICSString:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSPARENT")) & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("OPAQUE")))
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = 1;
  }
  +[ICSTransparencyValue transparencyTypeFromCode:](ICSTransparencyValue, "transparencyTypeFromCode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v5;
}

+ (id)transparencyTypeFromCode:(int)a3
{
  return -[ICSPredefinedValue initWithLong:]([ICSTransparencyValue alloc], "initWithLong:", a3);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  char v4;
  __CFString *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  if (-[ICSPredefinedValue longValue](self, "longValue") == 2)
    v6 = CFSTR("TRANSPARENT");
  else
    v6 = CFSTR("OPAQUE");
  iCalendarAppendStringToStringWithOptions(v6, v7, v4);

}

@end
