@implementation TSBonjourInterface

- (TSBonjourInterface)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[TSBonjourInterface init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Do not call %@"), v5);

  return 0;
}

- (TSBonjourInterface)initWithServiceName:(id)a3 type:(id)a4 andDomain:(id)a5 onInterfaceIndex:(unsigned int)a6 andName:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  TSBonjourInterface *v16;
  uint64_t v17;
  NSString *name;
  uint64_t v19;
  NSString *type;
  uint64_t v21;
  NSString *domain;
  uint64_t v23;
  NSString *interfaceName;
  dispatch_queue_t v25;
  OS_dispatch_queue *queue;
  objc_super v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v28.receiver = self;
  v28.super_class = (Class)TSBonjourInterface;
  v16 = -[TSBonjourInterface init](&v28, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    name = v16->_name;
    v16->_name = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    type = v16->_type;
    v16->_type = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    domain = v16->_domain;
    v16->_domain = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    interfaceName = v16->_interfaceName;
    v16->_interfaceName = (NSString *)v23;

    v16->_interfaceIndex = a6;
    v25 = dispatch_queue_create("com.apple.timesync.address.resolve", 0);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v25;

  }
  return v16;
}

- (void)resolvedWithHostTarget:(const char *)a3 port:(unsigned __int16)a4
{
  int v4;
  const char *v7;
  const char *v8;
  const char *v9;
  id v10;
  NSString *v11;
  NSString *hostTarget;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[NSString UTF8String](self->_name, "UTF8String");
    v8 = -[NSString UTF8String](self->_type, "UTF8String");
    v9 = -[NSString UTF8String](self->_domain, "UTF8String");
    -[TSBonjourInterface interfaceName](self, "interfaceName");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = 136316418;
    v14 = v7;
    v15 = 2080;
    v16 = v8;
    v17 = 2080;
    v18 = v9;
    v19 = 2080;
    v20 = objc_msgSend(v10, "UTF8String");
    v21 = 2080;
    v22 = a3;
    v23 = 1024;
    v24 = v4;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Resolved service with name %s type %s domain %s on interface %s to host %s port %hu\n", (uint8_t *)&v13, 0x3Au);

  }
  v11 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a3);
  hostTarget = self->_hostTarget;
  self->_hostTarget = v11;

  self->_port = v4;
  -[TSBonjourInterface startAddressLookupWithError:](self, "startAddressLookupWithError:", 0);
}

- (BOOL)startResolveWithError:(id *)a3
{
  BOOL result;
  DNSServiceErrorType v6;
  id v7;

  if (self->_resolveRef)
    return 1;
  v6 = DNSServiceResolve(&self->_resolveRef, 0x100000u, self->_interfaceIndex, -[NSString UTF8String](self->_name, "UTF8String"), -[NSString UTF8String](self->_type, "UTF8String"), -[NSString UTF8String](self->_domain, "UTF8String"), (DNSServiceResolveReply)TSBIResolvedServiceReply, self);
  if (a3 && v6)
  {
    TSBonjourErrorFromErrorCode(v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a3 = v7;
  }
  else
  {
    if (!v6)
    {
      DNSServiceSetDispatchQueue(self->_resolveRef, (dispatch_queue_t)self->_queue);
      return 1;
    }
    return 0;
  }
  return result;
}

- (BOOL)stopResolve
{
  _DNSServiceRef_t *resolveRef;

  resolveRef = self->_resolveRef;
  if (resolveRef)
  {
    DNSServiceRefDeallocate(self->_resolveRef);
    self->_resolveRef = 0;
  }
  return resolveRef != 0;
}

- (BOOL)startAddressLookupWithError:(id *)a3
{
  _DNSServiceRef_t **p_addressRef;
  BOOL result;
  DNSServiceErrorType AddrInfo;
  id v8;

  p_addressRef = &self->_addressRef;
  if (self->_addressRef)
    return 1;
  -[TSBonjourInterface setIpv4Addresses:](self, "setIpv4Addresses:", 0);
  -[TSBonjourInterface setIpv6Addresses:](self, "setIpv6Addresses:", 0);
  AddrInfo = DNSServiceGetAddrInfo(p_addressRef, 0x100000u, self->_interfaceIndex, 0, -[NSString UTF8String](self->_hostTarget, "UTF8String"), (DNSServiceGetAddrInfoReply)TSBIGetAddrReply, self);
  if (a3 && AddrInfo)
  {
    TSBonjourErrorFromErrorCode(AddrInfo);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a3 = v8;
  }
  else
  {
    if (!AddrInfo)
    {
      DNSServiceSetDispatchQueue(self->_addressRef, (dispatch_queue_t)self->_queue);
      return 1;
    }
    return 0;
  }
  return result;
}

- (BOOL)stopAddressLookup
{
  _DNSServiceRef_t *addressRef;

  addressRef = self->_addressRef;
  if (addressRef)
  {
    DNSServiceRefDeallocate(addressRef);
    self->_addressRef = 0;
  }
  return 0;
}

- (void)pokeIPv6Destination
{
  id v3;

  -[TSBonjourInterface ipv6Address](self, "ipv6Address");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pokeDestinationAtPort:onInterfaceIndex:", self->_port, self->_interfaceIndex);

}

- (void)dealloc
{
  _DNSServiceRef_t *resolveRef;
  _DNSServiceRef_t *addressRef;
  objc_super v5;

  resolveRef = self->_resolveRef;
  if (resolveRef)
    DNSServiceRefDeallocate(resolveRef);
  addressRef = self->_addressRef;
  if (addressRef)
    DNSServiceRefDeallocate(addressRef);
  v5.receiver = self;
  v5.super_class = (Class)TSBonjourInterface;
  -[TSBonjourInterface dealloc](&v5, sel_dealloc);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (TSBonjourIPv4Address)ipv4Address
{
  return self->_ipv4Address;
}

- (void)setIpv4Address:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)ipv4Addresses
{
  return self->_ipv4Addresses;
}

- (void)setIpv4Addresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (TSBonjourIPv6Address)ipv6Address
{
  return self->_ipv6Address;
}

- (void)setIpv6Address:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)ipv6Addresses
{
  return self->_ipv6Addresses;
}

- (void)setIpv6Addresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (TSBonjourInterfaceDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSBonjourInterfaceDelegate *)a3;
}

- (TSBonjourNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
  self->_node = (TSBonjourNode *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipv6Addresses, 0);
  objc_storeStrong((id *)&self->_ipv6Address, 0);
  objc_storeStrong((id *)&self->_ipv4Addresses, 0);
  objc_storeStrong((id *)&self->_ipv4Address, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_hostTarget, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
