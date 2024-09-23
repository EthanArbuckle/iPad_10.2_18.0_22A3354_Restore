@implementation WiFiUsageNetworkIPv6Details

- (WiFiUsageNetworkIPv6Details)initWithDictionary:(id)a3
{
  id v4;
  WiFiUsageNetworkIPv6Details *v5;
  void *v6;
  uint64_t v7;
  WiFiUsageNetworkIPv6Details *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WiFiUsageNetworkIPv6Details;
  v5 = -[WiFiUsageNetworkIPv6Details init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CE8D28]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count"))
    {
      -[WiFiUsageNetworkIPv6Details setIpv6Addresses:](v5, "setIpv6Addresses:", v6);
      v7 = 1;
    }
    else
    {
      v7 = 0;
    }
    -[WiFiUsageNetworkIPv6Details setIsValid:](v5, "setIsValid:", v7);
    v8 = v5;

  }
  return v5;
}

- (id)description
{
  __CFString *v2;

  if (self->_isValid)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("addresses:%@"), self->_ipv6Addresses);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = CFSTR("N/A");
  }
  return v2;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (NSArray)ipv6Addresses
{
  return self->_ipv6Addresses;
}

- (void)setIpv6Addresses:(id)a3
{
  objc_storeStrong((id *)&self->_ipv6Addresses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipv6Addresses, 0);
}

@end
