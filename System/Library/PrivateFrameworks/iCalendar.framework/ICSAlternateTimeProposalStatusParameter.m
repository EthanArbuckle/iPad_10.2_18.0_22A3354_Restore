@implementation ICSAlternateTimeProposalStatusParameter

+ (id)statusParameterFromICSString:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = +[ICSAlternateTimeProposal statusFromICSString:](ICSAlternateTimeProposal, "statusFromICSString:", a3);
  if ((_DWORD)v3)
  {
    +[ICSAlternateTimeProposalStatusParameter statusParameterFromCode:](ICSAlternateTimeProposalStatusParameter, "statusParameterFromCode:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)statusParameterFromCode:(int)a3
{
  return -[ICSPredefinedValue initWithLong:]([ICSAlternateTimeProposalStatusParameter alloc], "initWithLong:", a3);
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
  +[ICSAlternateTimeProposal ICSStringFromAlternateTimeProposalStatus:](ICSAlternateTimeProposal, "ICSStringFromAlternateTimeProposalStatus:", -[ICSPredefinedValue longValue](self, "longValue"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  iCalendarAppendStringToStringWithOptions(v7, v6, v4);

}

@end
