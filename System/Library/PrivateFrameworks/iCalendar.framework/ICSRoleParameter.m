@implementation ICSRoleParameter

+ (id)roleParameterFromICSString:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = +[ICSUserAddress roleFromICSString:](ICSUserAddress, "roleFromICSString:", a3);
  if ((_DWORD)v3)
  {
    +[ICSRoleParameter roleParameterFromCode:](ICSRoleParameter, "roleParameterFromCode:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)roleParameterFromCode:(int)a3
{
  return -[ICSPredefinedValue initWithLong:]([ICSRoleParameter alloc], "initWithLong:", a3);
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
  +[ICSUserAddress ICSStringFromRole:](ICSUserAddress, "ICSStringFromRole:", -[ICSPredefinedValue longValue](self, "longValue"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  iCalendarAppendStringToStringWithOptions(v7, v6, v4);

}

@end
