@implementation WPNetworkAddressRange

- (WPNetworkAddressRange)init
{
  *(_QWORD *)&self->_address.sin6_len = 0;
  *(_QWORD *)self->_address.sin6_addr.__u6_addr8 = 0;
  self->_address.sin6_scope_id = 0;
  *(_QWORD *)&self->_address.sin6_addr.__u6_addr32[2] = 0;
  return self;
}

- (WPNetworkAddressRange)initWithAddress:(const sockaddr_in6 *)a3 netMaskLength:(unint64_t)a4 owner:(id)a5 host:(id)a6
{
  id v11;
  id v12;
  char *v13;
  WPNetworkAddressRange *v14;
  __int128 v15;
  WPNetworkAddressRange *v16;
  objc_super v18;

  v11 = a5;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)WPNetworkAddressRange;
  v13 = -[WPNetworkAddressRange init](&v18, sel_init);
  v14 = (WPNetworkAddressRange *)v13;
  if (v13)
  {
    v15 = *(_OWORD *)&a3->sin6_len;
    *(in6_addr *)(v13 + 20) = *(in6_addr *)((char *)&a3->sin6_addr + 4);
    *(_OWORD *)(v13 + 8) = v15;
    *((_QWORD *)v13 + 5) = a4;
    objc_storeStrong((id *)v13 + 6, a5);
    objc_storeStrong((id *)&v14->_host, a6);
    v16 = v14;
  }

  return v14;
}

- (int64_t)version
{
  int sin6_family;

  sin6_family = self->_address.sin6_family;
  if (sin6_family == 2)
    return 4;
  if (sin6_family != 30)
    -[WPNetworkAddressRange version].cold.1();
  return 6;
}

- (const)address
{
  return (const sockaddr *)&self->_address;
}

- (unint64_t)netMaskLength
{
  return self->_netMaskLength;
}

- (NSString)owner
{
  return self->_owner;
}

- (NSString)host
{
  return self->_host;
}

- (id)description
{
  int v3;
  char v5[46];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (self->_address.sin6_family == 2)
    v3 = 2;
  else
    v3 = 30;
  inet_ntop(v3, &self->_address.sin6_addr, v5, 0x2Eu);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s/%zu %@ %@"), v5, self->_netMaskLength, self->_owner, self->_host);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)_addressLength
{
  unint64_t result;

  result = -[WPNetworkAddressRange version](self, "version");
  if (result != 4)
    return 16;
  return result;
}

- (void)_addressPointer
{
  return &self->_address.sin6_addr;
}

- (int64_t)compare:(id)a3
{
  id v4;
  int64_t v5;
  int v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;

  v4 = a3;
  v5 = -[WPNetworkAddressRange version](self, "version");
  if (v5 == objc_msgSend(v4, "version"))
  {
    v6 = memcmp(-[WPNetworkAddressRange _addressPointer](self, "_addressPointer"), (const void *)objc_msgSend(v4, "_addressPointer"), -[WPNetworkAddressRange _addressLength](self, "_addressLength"));
    if ((v6 & 0x80000000) == 0)
    {
      if (v6)
      {
        v7 = 1;
        goto LABEL_11;
      }
      v8 = -[WPNetworkAddressRange netMaskLength](self, "netMaskLength");
      if (v8 >= objc_msgSend(v4, "netMaskLength"))
      {
        v9 = -[WPNetworkAddressRange netMaskLength](self, "netMaskLength");
        v7 = v9 > objc_msgSend(v4, "netMaskLength");
        goto LABEL_11;
      }
    }
    v7 = -1;
  }
  else if (v5 == 4)
  {
    v7 = -1;
  }
  else
  {
    v7 = 1;
  }
LABEL_11:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t v5;
  unint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = 0;
    v7 = 0;
    v9 = v4;
LABEL_8:

    goto LABEL_10;
  }
  if (!v4)
  {
    v8 = 0;
    v7 = 0;
    goto LABEL_10;
  }
  v5 = -[WPNetworkAddressRange version](self, "version");
  if (v5 == objc_msgSend(v4, "version"))
  {
    v6 = -[WPNetworkAddressRange netMaskLength](self, "netMaskLength");
    if (v6 == objc_msgSend(v4, "netMaskLength")
      && !memcmp(-[WPNetworkAddressRange _addressPointer](self, "_addressPointer"), (const void *)objc_msgSend(v4, "_addressPointer"), -[WPNetworkAddressRange _addressLength](self, "_addressLength")))
    {
      -[WPNetworkAddressRange owner](self, "owner");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "owner");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v11))
      {
        -[WPNetworkAddressRange host](self, "host");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "host");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v12, "isEqualToString:", v13);

      }
      else
      {
        v7 = 0;
      }

      v8 = v4;
      goto LABEL_8;
    }
  }
  v7 = 0;
  v8 = v4;
LABEL_10:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_owner, 0);
}

- (void)version
{
  __assert_rtn("-[WPNetworkAddressRange version]", "WPNetworkAddressRange.mm", 50, "false");
}

@end
