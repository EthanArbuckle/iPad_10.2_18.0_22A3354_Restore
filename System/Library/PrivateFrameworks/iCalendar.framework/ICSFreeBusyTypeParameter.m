@implementation ICSFreeBusyTypeParameter

+ (id)freeBusyTypeParameterFromICSString:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FREE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUSY-UNAVAILABLE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUSY-TENTATIVE")) & 1) != 0)
  {
    v4 = 3;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("BUSY")))
    {
      v5 = 0;
      goto LABEL_10;
    }
    v4 = 1;
  }
  +[ICSFreeBusyTypeParameter freeBusyTypeParameterFromCode:](ICSFreeBusyTypeParameter, "freeBusyTypeParameterFromCode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v5;
}

+ (id)freeBusyTypeParameterFromCode:(unint64_t)a3
{
  return -[ICSPredefinedValue initWithLong:]([ICSFreeBusyTypeParameter alloc], "initWithLong:", a3);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

@end
