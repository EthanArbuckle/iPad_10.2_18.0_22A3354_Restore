@implementation WiFiUsageNetworkIPv4Details

- (WiFiUsageNetworkIPv4Details)initWithDictionary:(id)a3
{
  id v4;
  WiFiUsageNetworkIPv4Details *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  WiFiUsageNetworkIPv4Details *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WiFiUsageNetworkIPv4Details;
  v5 = -[WiFiUsageNetworkIPv4Details init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CE8CC8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "objectAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageNetworkIPv4Details setIpv4Address:](v5, "setIpv4Address:", v7);

      v8 = 1;
    }
    else
    {
      v8 = 0;
    }
    -[WiFiUsageNetworkIPv4Details setIsValid:](v5, "setIsValid:", v8);
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CE8D18]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageNetworkIPv4Details setIpv4Subnet:](v5, "setIpv4Subnet:", v10);

    }
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CE8CB8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[WiFiUsageNetworkIPv4Details setIpv4RouterAddress:](v5, "setIpv4RouterAddress:", v11);
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CE8D10]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[WiFiUsageNetworkIPv4Details setIpv4DefGwAddress:](v5, "setIpv4DefGwAddress:", v12);
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CE8CB0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[WiFiUsageNetworkIPv4Details setIpv4RouterMacAddress:](v5, "setIpv4RouterMacAddress:", v13);
    v14 = v5;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  v5 = -[WiFiUsageNetworkIPv4Details isValid](self, "isValid");
  if (v5 != objc_msgSend(v4, "isValid"))
    goto LABEL_8;
  -[WiFiUsageNetworkIPv4Details ipv4Address](self, "ipv4Address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ipv4Address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (!v8)
    goto LABEL_8;
  -[WiFiUsageNetworkIPv4Details ipv4RouterAddress](self, "ipv4RouterAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ipv4RouterAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (!v11)
    goto LABEL_8;
  -[WiFiUsageNetworkIPv4Details ipv4RouterMacAddress](self, "ipv4RouterMacAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ipv4RouterMacAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if (!v14)
    goto LABEL_8;
  -[WiFiUsageNetworkIPv4Details ipv4DefGwAddress](self, "ipv4DefGwAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ipv4DefGwAddress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

  if (v17)
  {
    -[WiFiUsageNetworkIPv4Details ipv4Subnet](self, "ipv4Subnet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ipv4Subnet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqualToString:", v19);

  }
  else
  {
LABEL_8:
    v20 = 0;
  }

  return v20;
}

- (id)description
{
  __CFString *v2;

  if (self->_isValid)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("address:%@, router:%@(%@) defaultGW:%@, subnet:%@"), self->_ipv4Address, self->_ipv4RouterAddress, self->_ipv4RouterMacAddress, self->_ipv4DefGwAddress, self->_ipv4Subnet);
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

- (NSString)ipv4Address
{
  return self->_ipv4Address;
}

- (void)setIpv4Address:(id)a3
{
  objc_storeStrong((id *)&self->_ipv4Address, a3);
}

- (NSString)ipv4RouterAddress
{
  return self->_ipv4RouterAddress;
}

- (void)setIpv4RouterAddress:(id)a3
{
  objc_storeStrong((id *)&self->_ipv4RouterAddress, a3);
}

- (NSString)ipv4RouterMacAddress
{
  return self->_ipv4RouterMacAddress;
}

- (void)setIpv4RouterMacAddress:(id)a3
{
  objc_storeStrong((id *)&self->_ipv4RouterMacAddress, a3);
}

- (NSString)ipv4DefGwAddress
{
  return self->_ipv4DefGwAddress;
}

- (void)setIpv4DefGwAddress:(id)a3
{
  objc_storeStrong((id *)&self->_ipv4DefGwAddress, a3);
}

- (NSString)ipv4Subnet
{
  return self->_ipv4Subnet;
}

- (void)setIpv4Subnet:(id)a3
{
  objc_storeStrong((id *)&self->_ipv4Subnet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipv4Subnet, 0);
  objc_storeStrong((id *)&self->_ipv4DefGwAddress, 0);
  objc_storeStrong((id *)&self->_ipv4RouterMacAddress, 0);
  objc_storeStrong((id *)&self->_ipv4RouterAddress, 0);
  objc_storeStrong((id *)&self->_ipv4Address, 0);
}

@end
