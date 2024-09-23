@implementation TVLNetworkInterface

- (TVLNetworkInterface)initWithInterfaceType:(unint64_t)a3 interfaceName:(id)a4
{
  id v6;
  TVLNetworkInterface *v7;
  TVLNetworkInterface *v8;
  uint64_t v9;
  NSString *interfaceName;
  void *v11;
  uint64_t v12;
  NSString *ipv4;
  void *v14;
  uint64_t v15;
  NSString *ipv6;
  objc_super v18;

  v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TVLNetworkInterface;
  v7 = -[TVLNetworkInterface init](&v18, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_interfaceType = a3;
    v9 = objc_msgSend(v6, "copy");
    interfaceName = v8->_interfaceName;
    v8->_interfaceName = (NSString *)v9;

    _IPAddress(2, v8->_interfaceName);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    ipv4 = v8->_ipv4;
    v8->_ipv4 = (NSString *)v12;

    _IPAddress(30, v8->_interfaceName);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    ipv6 = v8->_ipv6;
    v8->_ipv6 = (NSString *)v15;

  }
  return v8;
}

- (unint64_t)interfaceType
{
  return self->_interfaceType;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (NSString)ipv4
{
  return self->_ipv4;
}

- (NSString)ipv6
{
  return self->_ipv6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipv6, 0);
  objc_storeStrong((id *)&self->_ipv4, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
}

@end
