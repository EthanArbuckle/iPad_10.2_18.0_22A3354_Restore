@implementation W5NetworkStatus

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)W5NetworkStatus;
  -[W5NetworkStatus dealloc](&v3, sel_dealloc);
}

- (void)setPrimaryDNSAddresses:(id)a3
{
  NSArray *primaryDNSAddresses;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  primaryDNSAddresses = self->_primaryDNSAddresses;
  if (primaryDNSAddresses != a3)
  {

    self->_primaryDNSAddresses = 0;
    if (a3)
    {
      v6 = objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
      if (v6)
      {
        v7 = v6;
        v8 = (void *)MEMORY[0x24BDD1620];
        v9 = (void *)MEMORY[0x24BDBCF20];
        v10 = objc_opt_class();
        self->_primaryDNSAddresses = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (void)setPrimaryIPv4Addresses:(id)a3
{
  NSArray *primaryIPv4Addresses;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  primaryIPv4Addresses = self->_primaryIPv4Addresses;
  if (primaryIPv4Addresses != a3)
  {

    self->_primaryIPv4Addresses = 0;
    if (a3)
    {
      v6 = objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
      if (v6)
      {
        v7 = v6;
        v8 = (void *)MEMORY[0x24BDD1620];
        v9 = (void *)MEMORY[0x24BDBCF20];
        v10 = objc_opt_class();
        self->_primaryIPv4Addresses = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (void)setPrimaryIPv6Addresses:(id)a3
{
  NSArray *primaryIPv6Addresses;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  primaryIPv6Addresses = self->_primaryIPv6Addresses;
  if (primaryIPv6Addresses != a3)
  {

    self->_primaryIPv6Addresses = 0;
    if (a3)
    {
      v6 = objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
      if (v6)
      {
        v7 = v6;
        v8 = (void *)MEMORY[0x24BDD1620];
        v9 = (void *)MEMORY[0x24BDBCF20];
        v10 = objc_opt_class();
        self->_primaryIPv6Addresses = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (id)description
{
  void *v3;
  NSArray *primaryIPv4Addresses;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSArray *primaryIPv6Addresses;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSArray *primaryDNSAddresses;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  objc_msgSend(v3, "appendFormat:", CFSTR("Primary IPv4: %@ (%@)\n"), self->_primaryIPv4InterfaceName, self->_primaryIPv4ServiceName);
  objc_msgSend(v3, "appendFormat:", CFSTR("Primary IPv6: %@ (%@)\n"), self->_primaryIPv6InterfaceName, self->_primaryIPv6ServiceName);
  objc_msgSend(v3, "appendFormat:", CFSTR("IPv4 Addresses: %lu\n"), -[NSArray count](self->_primaryIPv4Addresses, "count"));
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  primaryIPv4Addresses = self->_primaryIPv4Addresses;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](primaryIPv4Addresses, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(primaryIPv4Addresses);
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](primaryIPv4Addresses, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v6);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("IPv4 Router: %@\n"), self->_primaryIPv4Router);
  objc_msgSend(v3, "appendFormat:", CFSTR("IPv6 Addresses: %lu\n"), -[NSArray count](self->_primaryIPv6Addresses, "count"));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  primaryIPv6Addresses = self->_primaryIPv6Addresses;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](primaryIPv6Addresses, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(primaryIPv6Addresses);
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](primaryIPv6Addresses, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v11);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("IPv6 Router: %@\n"), self->_primaryIPv6Router);
  objc_msgSend(v3, "appendFormat:", CFSTR("DNS Addresses: %lu\n"), -[NSArray count](self->_primaryDNSAddresses, "count"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  primaryDNSAddresses = self->_primaryDNSAddresses;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](primaryDNSAddresses, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(primaryDNSAddresses);
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * k));
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](primaryDNSAddresses, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v16);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("Apple Reachable: 0x%X\n%@\n"), self->_isAppleReachable, W5DescriptionForReachabilityFlags(self->_isAppleReachable, (uint64_t)CFSTR("\t")));
  return (id)objc_msgSend(v3, "copy");
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5NetworkStatus;
  if (-[W5NetworkStatus conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || (objc_msgSend(a3, "isEqual:", &unk_2545B0870) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isEqual:", &unk_2545B06D8);
  }
}

- (BOOL)isEqualToNetworkStatus:(id)a3
{
  NSString *primaryIPv4InterfaceName;
  int v6;
  NSString *primaryIPv4ServiceName;
  NSString *primaryIPv6InterfaceName;
  NSString *primaryIPv6ServiceName;
  NSString *primaryIPv4ServiceID;
  NSString *primaryIPv6ServiceID;
  NSArray *primaryIPv4Addresses;
  NSArray *primaryIPv6Addresses;
  NSString *primaryIPv4Router;
  NSString *primaryIPv6Router;
  NSArray *primaryDNSAddresses;
  unsigned int isAppleReachable;

  primaryIPv4InterfaceName = self->_primaryIPv4InterfaceName;
  if (!primaryIPv4InterfaceName)
  {
    if (!objc_msgSend(a3, "primaryIPv4InterfaceName"))
      goto LABEL_5;
    primaryIPv4InterfaceName = self->_primaryIPv4InterfaceName;
  }
  v6 = -[NSString isEqual:](primaryIPv4InterfaceName, "isEqual:", objc_msgSend(a3, "primaryIPv4InterfaceName"));
  if (!v6)
    return v6;
LABEL_5:
  primaryIPv4ServiceName = self->_primaryIPv4ServiceName;
  if (!primaryIPv4ServiceName)
  {
    if (!objc_msgSend(a3, "primaryIPv4ServiceName"))
      goto LABEL_9;
    primaryIPv4ServiceName = self->_primaryIPv4ServiceName;
  }
  v6 = -[NSString isEqual:](primaryIPv4ServiceName, "isEqual:", objc_msgSend(a3, "primaryIPv4ServiceName"));
  if (!v6)
    return v6;
LABEL_9:
  primaryIPv6InterfaceName = self->_primaryIPv6InterfaceName;
  if (!primaryIPv6InterfaceName)
  {
    if (!objc_msgSend(a3, "primaryIPv6InterfaceName"))
      goto LABEL_13;
    primaryIPv6InterfaceName = self->_primaryIPv6InterfaceName;
  }
  v6 = -[NSString isEqual:](primaryIPv6InterfaceName, "isEqual:", objc_msgSend(a3, "primaryIPv6InterfaceName"));
  if (!v6)
    return v6;
LABEL_13:
  primaryIPv6ServiceName = self->_primaryIPv6ServiceName;
  if (!primaryIPv6ServiceName)
  {
    if (!objc_msgSend(a3, "primaryIPv6ServiceName"))
      goto LABEL_17;
    primaryIPv6ServiceName = self->_primaryIPv6ServiceName;
  }
  v6 = -[NSString isEqual:](primaryIPv6ServiceName, "isEqual:", objc_msgSend(a3, "primaryIPv6ServiceName"));
  if (!v6)
    return v6;
LABEL_17:
  primaryIPv4ServiceID = self->_primaryIPv4ServiceID;
  if (!primaryIPv4ServiceID)
  {
    if (!objc_msgSend(a3, "primaryIPv4ServiceID"))
      goto LABEL_21;
    primaryIPv4ServiceID = self->_primaryIPv4ServiceID;
  }
  v6 = -[NSString isEqual:](primaryIPv4ServiceID, "isEqual:", objc_msgSend(a3, "primaryIPv4ServiceID"));
  if (!v6)
    return v6;
LABEL_21:
  primaryIPv6ServiceID = self->_primaryIPv6ServiceID;
  if (!primaryIPv6ServiceID)
  {
    if (!objc_msgSend(a3, "primaryIPv6ServiceID"))
      goto LABEL_25;
    primaryIPv6ServiceID = self->_primaryIPv6ServiceID;
  }
  v6 = -[NSString isEqual:](primaryIPv6ServiceID, "isEqual:", objc_msgSend(a3, "primaryIPv6ServiceID"));
  if (!v6)
    return v6;
LABEL_25:
  primaryIPv4Addresses = self->_primaryIPv4Addresses;
  if (!primaryIPv4Addresses)
  {
    if (!objc_msgSend(a3, "primaryIPv4Addresses"))
      goto LABEL_29;
    primaryIPv4Addresses = self->_primaryIPv4Addresses;
  }
  v6 = -[NSArray isEqual:](primaryIPv4Addresses, "isEqual:", objc_msgSend(a3, "primaryIPv4Addresses"));
  if (!v6)
    return v6;
LABEL_29:
  primaryIPv6Addresses = self->_primaryIPv6Addresses;
  if (!primaryIPv6Addresses)
  {
    if (!objc_msgSend(a3, "primaryIPv6Addresses"))
      goto LABEL_33;
    primaryIPv6Addresses = self->_primaryIPv6Addresses;
  }
  v6 = -[NSArray isEqual:](primaryIPv6Addresses, "isEqual:", objc_msgSend(a3, "primaryIPv6Addresses"));
  if (!v6)
    return v6;
LABEL_33:
  primaryIPv4Router = self->_primaryIPv4Router;
  if (!primaryIPv4Router)
  {
    if (!objc_msgSend(a3, "primaryIPv4Router"))
      goto LABEL_37;
    primaryIPv4Router = self->_primaryIPv4Router;
  }
  v6 = -[NSString isEqual:](primaryIPv4Router, "isEqual:", objc_msgSend(a3, "primaryIPv4Router"));
  if (!v6)
    return v6;
LABEL_37:
  primaryIPv6Router = self->_primaryIPv6Router;
  if (primaryIPv6Router)
    goto LABEL_40;
  if (objc_msgSend(a3, "primaryIPv6Router"))
  {
    primaryIPv6Router = self->_primaryIPv6Router;
LABEL_40:
    v6 = -[NSString isEqual:](primaryIPv6Router, "isEqual:", objc_msgSend(a3, "primaryIPv6Router"));
    if (!v6)
      return v6;
  }
  primaryDNSAddresses = self->_primaryDNSAddresses;
  if (!primaryDNSAddresses)
  {
    if (!objc_msgSend(a3, "primaryDNSAddresses"))
    {
LABEL_45:
      isAppleReachable = self->_isAppleReachable;
      LOBYTE(v6) = isAppleReachable == objc_msgSend(a3, "isAppleReachable");
      return v6;
    }
    primaryDNSAddresses = self->_primaryDNSAddresses;
  }
  v6 = -[NSArray isEqual:](primaryDNSAddresses, "isEqual:", objc_msgSend(a3, "primaryDNSAddresses"));
  if (v6)
    goto LABEL_45;
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -[W5NetworkStatus isEqualToNetworkStatus:](self, "isEqualToNetworkStatus:", a3);
  }
  return 0;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;

  v3 = -[NSString hash](self->_primaryIPv4InterfaceName, "hash");
  v4 = -[NSString hash](self->_primaryIPv4ServiceName, "hash") ^ v3;
  v5 = -[NSString hash](self->_primaryIPv6InterfaceName, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_primaryIPv6ServiceName, "hash");
  v7 = -[NSString hash](self->_primaryIPv4ServiceID, "hash");
  v8 = v7 ^ -[NSString hash](self->_primaryIPv6ServiceID, "hash");
  v9 = v6 ^ v8 ^ -[NSArray hash](self->_primaryIPv4Addresses, "hash");
  v10 = -[NSArray hash](self->_primaryIPv6Addresses, "hash");
  v11 = v10 ^ -[NSString hash](self->_primaryIPv4Router, "hash");
  v12 = v11 ^ -[NSString hash](self->_primaryIPv6Router, "hash");
  return v9 ^ v12 ^ -[NSArray hash](self->_primaryDNSAddresses, "hash") ^ self->_isAppleReachable;
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5NetworkStatus *v4;

  v4 = -[W5NetworkStatus init](+[W5NetworkStatus allocWithZone:](W5NetworkStatus, "allocWithZone:", a3), "init");
  -[W5NetworkStatus setPrimaryIPv4InterfaceName:](v4, "setPrimaryIPv4InterfaceName:", self->_primaryIPv4InterfaceName);
  -[W5NetworkStatus setPrimaryIPv4ServiceName:](v4, "setPrimaryIPv4ServiceName:", self->_primaryIPv4ServiceName);
  -[W5NetworkStatus setPrimaryIPv6InterfaceName:](v4, "setPrimaryIPv6InterfaceName:", self->_primaryIPv6InterfaceName);
  -[W5NetworkStatus setPrimaryIPv6ServiceName:](v4, "setPrimaryIPv6ServiceName:", self->_primaryIPv6ServiceName);
  -[W5NetworkStatus setPrimaryIPv4ServiceID:](v4, "setPrimaryIPv4ServiceID:", self->_primaryIPv4ServiceID);
  -[W5NetworkStatus setPrimaryIPv6ServiceID:](v4, "setPrimaryIPv6ServiceID:", self->_primaryIPv6ServiceID);
  -[W5NetworkStatus setPrimaryIPv4Addresses:](v4, "setPrimaryIPv4Addresses:", self->_primaryIPv4Addresses);
  -[W5NetworkStatus setPrimaryIPv6Addresses:](v4, "setPrimaryIPv6Addresses:", self->_primaryIPv6Addresses);
  -[W5NetworkStatus setPrimaryIPv4Router:](v4, "setPrimaryIPv4Router:", self->_primaryIPv4Router);
  -[W5NetworkStatus setPrimaryIPv6Router:](v4, "setPrimaryIPv6Router:", self->_primaryIPv6Router);
  -[W5NetworkStatus setPrimaryDNSAddresses:](v4, "setPrimaryDNSAddresses:", self->_primaryDNSAddresses);
  -[W5NetworkStatus setIsAppleReachable:](v4, "setIsAppleReachable:", self->_isAppleReachable);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_primaryIPv4InterfaceName, CFSTR("_primaryIPv4InterfaceName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_primaryIPv4ServiceName, CFSTR("_primaryIPv4ServiceName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_primaryIPv6InterfaceName, CFSTR("_primaryIPv6InterfaceName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_primaryIPv6ServiceName, CFSTR("_primaryIPv6ServiceName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_primaryIPv4ServiceID, CFSTR("_primaryIPv4ServiceID"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_primaryIPv6ServiceID, CFSTR("_primaryIPv6ServiceID"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_primaryIPv4Addresses, CFSTR("_primaryIPv4Addresses"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_primaryIPv6Addresses, CFSTR("_primaryIPv6Addresses"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_primaryIPv4Router, CFSTR("_primaryIPv4Router"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_primaryIPv6Router, CFSTR("_primaryIPv6Router"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_primaryDNSAddresses, CFSTR("_primaryDNSAddresses"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_isAppleReachable, CFSTR("_isAppleReachable"));
}

- (W5NetworkStatus)initWithCoder:(id)a3
{
  W5NetworkStatus *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)W5NetworkStatus;
  v4 = -[W5NetworkStatus init](&v12, sel_init);
  if (v4)
  {
    v4->_primaryIPv4InterfaceName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_primaryIPv4InterfaceName")), "copy");
    v4->_primaryIPv4ServiceName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_primaryIPv4ServiceName")), "copy");
    v4->_primaryIPv6InterfaceName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_primaryIPv6InterfaceName")), "copy");
    v4->_primaryIPv6ServiceName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_primaryIPv6ServiceName")), "copy");
    v4->_primaryIPv4ServiceID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_primaryIPv4ServiceID")), "copy");
    v4->_primaryIPv6ServiceID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_primaryIPv6ServiceID")), "copy");
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    v4->_primaryIPv4Addresses = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("_primaryIPv4Addresses")), "copy");
    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    v4->_primaryIPv6Addresses = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0), CFSTR("_primaryIPv6Addresses")), "copy");
    v4->_primaryIPv4Router = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_primaryIPv4Router")), "copy");
    v4->_primaryIPv6Router = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_primaryIPv6Router")), "copy");
    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    v4->_primaryDNSAddresses = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), CFSTR("_primaryDNSAddresses")), "copy");
    v4->_isAppleReachable = objc_msgSend(a3, "decodeIntForKey:", CFSTR("_isAppleReachable"));
  }
  return v4;
}

- (NSString)primaryIPv4InterfaceName
{
  return self->_primaryIPv4InterfaceName;
}

- (void)setPrimaryIPv4InterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)primaryIPv4ServiceName
{
  return self->_primaryIPv4ServiceName;
}

- (void)setPrimaryIPv4ServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)primaryIPv6InterfaceName
{
  return self->_primaryIPv6InterfaceName;
}

- (void)setPrimaryIPv6InterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)primaryIPv6ServiceName
{
  return self->_primaryIPv6ServiceName;
}

- (void)setPrimaryIPv6ServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)primaryIPv4ServiceID
{
  return self->_primaryIPv4ServiceID;
}

- (void)setPrimaryIPv4ServiceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)primaryIPv6ServiceID
{
  return self->_primaryIPv6ServiceID;
}

- (void)setPrimaryIPv6ServiceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)primaryIPv4Addresses
{
  return self->_primaryIPv4Addresses;
}

- (NSArray)primaryIPv6Addresses
{
  return self->_primaryIPv6Addresses;
}

- (NSString)primaryIPv4Router
{
  return self->_primaryIPv4Router;
}

- (void)setPrimaryIPv4Router:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)primaryIPv6Router
{
  return self->_primaryIPv6Router;
}

- (void)setPrimaryIPv6Router:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)primaryDNSAddresses
{
  return self->_primaryDNSAddresses;
}

- (unsigned)isAppleReachable
{
  return self->_isAppleReachable;
}

- (void)setIsAppleReachable:(unsigned int)a3
{
  self->_isAppleReachable = a3;
}

@end
