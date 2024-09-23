@implementation NRDNSProxyServer

- (id)description
{
  id v3;
  unint64_t identifier;
  uint64_t state;
  __CFString *v6;
  NSSet *localIfIndices;
  id v8;

  v3 = objc_alloc((Class)NSString);
  if (self)
  {
    identifier = self->super._identifier;
    state = self->super._state;
    if (state >= 5)
      v6 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unknown(%u)"), state);
    else
      v6 = *(&off_1001B63B0 + self->super._state);
    localIfIndices = self->_localIfIndices;
  }
  else
  {
    identifier = 0;
    localIfIndices = 0;
    v6 = CFSTR("Invalid");
  }
  v8 = objc_msgSend(v3, "initWithFormat:", CFSTR("NRDNSProxyServer[%llu, %@, idx:%@]"), identifier, v6, localIfIndices);

  return v8;
}

- (void)start
{
  uint64_t v3;
  void *v4;
  int IsLevelEnabled;
  NSUUID *v6;
  uint64_t v7;
  void *v8;
  int dnsProtocol;
  objc_super v10;

  if (self)
  {
    if (!self->super._started)
    {
      v10.receiver = self;
      v10.super_class = (Class)NRDNSProxyServer;
      -[NRDNSProxy start](&v10, "start");
      if (self->super._state - 1 >= 2)
      {
        if (self->super._dnsProtocol)
        {
          v4 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v3);
          IsLevelEnabled = _NRLogIsLevelEnabled(v4, 17);

          if (IsLevelEnabled)
          {
            v6 = self->super._nrUUID;
            v8 = (void *)_NRCopyLogObjectForNRUUID(v6, v7);
            dnsProtocol = self->super._dnsProtocol;

            _NRLogWithArgs(v8, 17, "unsupported dns protocol %u", dnsProtocol);
          }
          sub_10001C4D4(self, 4);
        }
        else
        {
          sub_10001CAB4((uint64_t)self);
        }
      }
    }
  }
  else
  {
    v10.receiver = 0;
    v10.super_class = (Class)NRDNSProxyServer;
    -[NRDNSProxy start](&v10, "start");
  }
}

- (void)cancel
{
  OS_mrc_dns_proxy *do53Proxy;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NRDNSProxyServer;
  -[NRDNSProxy cancel](&v4, "cancel");
  if (self)
  {
    if (self->_do53Proxy)
    {
      mrc_dns_proxy_invalidate();
      do53Proxy = self->_do53Proxy;
      self->_do53Proxy = 0;

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_do53Proxy, 0);
  objc_storeStrong((id *)&self->_localIfIndices, 0);
}

@end
