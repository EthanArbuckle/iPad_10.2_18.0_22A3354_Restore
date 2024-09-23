@implementation ACMTicketVerificationResponseImpl

- (NSNumber)personDSID
{
  NSNumber *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v2 = (NSNumber *)objc_msgSend(-[ACMMessage rawResponseData](self, "rawResponseData"), "objectForKey:", CFSTR("pid"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    v5 = -[NSNumber unsignedLongLongValue](v2, "unsignedLongLongValue");
    v6 = v4;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return v2;
    v7 = -[NSNumber longLongValue](v2, "longLongValue");
    if (v7 < 0)
      return v2;
    v5 = v7;
    v6 = (void *)MEMORY[0x24BDD16E0];
  }
  return (NSNumber *)objc_msgSend(v6, "numberWithUnsignedLongLong:", v5);
}

@end
