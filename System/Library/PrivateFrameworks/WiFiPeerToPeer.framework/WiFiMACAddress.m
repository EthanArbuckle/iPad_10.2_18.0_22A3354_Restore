@implementation WiFiMACAddress

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)zeroAddress
{
  if (_MergedGlobals != -1)
    dispatch_once(&_MergedGlobals, &__block_literal_global_2);
  return (id)qword_1ED2303A0;
}

void __29__WiFiMACAddress_zeroAddress__block_invoke()
{
  WiFiMACAddress *v0;
  void *v1;

  v0 = -[WiFiMACAddress initWithAddress:]([WiFiMACAddress alloc], "initWithAddress:", 0);
  v1 = (void *)qword_1ED2303A0;
  qword_1ED2303A0 = (uint64_t)v0;

}

- (WiFiMACAddress)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int *v9;
  _QWORD *v10;
  WiFiMACAddress *v11;
  WiFiMACAddress *v12;
  unsigned int *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiMACAddress.data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length") == 6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiMACAddress.ipv6"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && objc_msgSend(v7, "length") == 16)
    {
      v9 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v6), "bytes");
      v10 = (_QWORD *)objc_msgSend(objc_retainAutorelease(v8), "bytes");
      v11 = -[WiFiMACAddress initWithAddress:ipv6Address:](self, "initWithAddress:ipv6Address:", *v9 | ((unint64_t)*((unsigned __int16 *)v9 + 2) << 32), *v10, v10[1]);
    }
    else
    {
      v13 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v6), "bytes");
      v11 = -[WiFiMACAddress initWithAddress:](self, "initWithAddress:", *v13 | ((unint64_t)*((unsigned __int16 *)v13 + 2) << 32));
    }
    self = v11;

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[WiFiMACAddress data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("WiFiMACAddress.data"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_ipv6LinkLocalAddress, CFSTR("WiFiMACAddress.ipv6"));
}

- (WiFiMACAddress)initWithAddress:(ether_addr)a3 ipv6Address:(in6_addr)a4
{
  WiFiMACAddress *v4;
  uint64_t v5;
  NSData *data;
  uint64_t v7;
  NSData *ipv6LinkLocalAddress;
  objc_super v10;
  in6_addr v11;
  ether_addr v12;

  v12 = a3;
  v11 = a4;
  v10.receiver = self;
  v10.super_class = (Class)WiFiMACAddress;
  v4 = -[WiFiMACAddress init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v12, 6);
    v5 = objc_claimAutoreleasedReturnValue();
    data = v4->_data;
    v4->_data = (NSData *)v5;

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v11, 16);
    v7 = objc_claimAutoreleasedReturnValue();
    ipv6LinkLocalAddress = v4->_ipv6LinkLocalAddress;
    v4->_ipv6LinkLocalAddress = (NSData *)v7;

  }
  return v4;
}

- (WiFiMACAddress)initWithAddress:(ether_addr)a3
{
  return -[WiFiMACAddress initWithAddress:ipv6Address:](self, "initWithAddress:ipv6Address:", *(_QWORD *)a3.octet & 0xFFFFFFFFFFFFLL, 33022, (*(_QWORD *)a3.octet & 0xFFFFFFLL | ((unint64_t)(*(_QWORD *)a3.octet >> 24) << 40)) ^ 0xFEFF000002);
}

- (WiFiMACAddress)initWithLinkLocalIPv6Address:(in6_addr)a3
{
  WiFiMACAddress *v3;

  if ((a3.__u6_addr16[0] & 0xC0FF) == 0x80FELL)
  {
    self = -[WiFiMACAddress initWithAddress:ipv6Address:](self, "initWithAddress:ipv6Address:", (*(_QWORD *)&a3.__u6_addr32[2] & 0xFFFFFFLL | (*(_QWORD *)&a3.__u6_addr32[2] >> 40 << 24)) ^ 2, *(_QWORD *)a3.__u6_addr8);
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (WiFiMACAddress)initWithMulticastIPv6Address:(in6_addr)a3
{
  WiFiMACAddress *v3;

  if (a3.__u6_addr8[0] == 0xFF)
  {
    self = -[WiFiMACAddress initWithAddress:ipv6Address:](self, "initWithAddress:ipv6Address:", ((unint64_t)a3.__u6_addr32[3] << 16) | 0x3333);
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  WiFiMACAddress *v4;
  WiFiMACAddress *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;

  v4 = (WiFiMACAddress *)a3;
  if (self == v4)
  {
    v5 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = 0;
      v5 = 0;
      goto LABEL_11;
    }
    v5 = v4;
    -[WiFiMACAddress data](self, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiMACAddress data](v5, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToData:", v7) & 1) == 0)
    {

LABEL_10:
      v11 = 0;
      goto LABEL_11;
    }
    -[WiFiMACAddress ipv6LinkLocalAddress](self, "ipv6LinkLocalAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiMACAddress ipv6LinkLocalAddress](v5, "ipv6LinkLocalAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToData:", v9);

    if (!v10)
      goto LABEL_10;
  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WiFiMACAddress data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  id v2;
  unsigned __int8 *v3;

  -[WiFiMACAddress data](self, "data");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (unsigned __int8 *)objc_msgSend(v2, "bytes");

  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02x:%02x:%02x:%02x:%02x:%02x"), *v3, v3[1], v3[2], v3[3], v3[4], v3[5]);
}

- (id)copyWithZone:(_NSZone *)a3
{
  WiFiMACAddress *v4;
  id v5;
  unsigned int *v6;
  id v7;
  _QWORD *v8;
  WiFiMACAddress *v9;

  v4 = [WiFiMACAddress alloc];
  -[WiFiMACAddress data](self, "data");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (unsigned int *)objc_msgSend(v5, "bytes");
  -[WiFiMACAddress ipv6LinkLocalAddress](self, "ipv6LinkLocalAddress");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (_QWORD *)objc_msgSend(v7, "bytes");
  v9 = -[WiFiMACAddress initWithAddress:ipv6Address:](v4, "initWithAddress:ipv6Address:", *v6 | ((unint64_t)*((unsigned __int16 *)v6 + 2) << 32), *v8, v8[1]);

  return v9;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)ipv6LinkLocalAddress
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipv6LinkLocalAddress, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
