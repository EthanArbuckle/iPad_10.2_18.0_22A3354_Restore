@implementation NRDiscoveryProxyServer

- (id)description
{
  id v3;
  unint64_t identifier;
  uint64_t state;
  __CFString *v6;
  id v7;

  v3 = objc_alloc((Class)NSString);
  if (self)
  {
    identifier = self->super._identifier;
    state = self->super._state;
    v6 = CFSTR("Invalid");
    switch((int)state)
    {
      case 0:
        break;
      case 1:
        v6 = CFSTR("Preparing");
        break;
      case 2:
        v6 = CFSTR("Ready");
        break;
      case 3:
        v6 = CFSTR("Restarting");
        break;
      case 4:
        v6 = CFSTR("Failed");
        break;
      default:
        v6 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unknown(%u)"), state);
        break;
    }
  }
  else
  {
    identifier = 0;
    v6 = CFSTR("Invalid");
  }
  v7 = objc_msgSend(v3, "initWithFormat:", CFSTR("NRDiscoveryProxyServer[%llu, %@]"), identifier, v6);

  return v7;
}

- (void)start
{
  objc_super v3;

  if (self)
  {
    if (!self->super._started)
    {
      v3.receiver = self;
      v3.super_class = (Class)NRDiscoveryProxyServer;
      -[NRDNSProxy start](&v3, "start");
      if (self->super._state - 1 >= 2)
      {
        self->_certificateUpdateNotifyToken = -1;
        sub_10001D3B8((uint64_t)self);
      }
    }
  }
  else
  {
    v3.receiver = 0;
    v3.super_class = (Class)NRDiscoveryProxyServer;
    -[NRDNSProxy start](&v3, "start");
  }
}

- (void)cancel
{
  int certificateUpdateNotifyToken;
  void *v4;
  void *v5;
  NSObject *certificateFetcherSource;
  OS_dispatch_source *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NRDiscoveryProxyServer;
  -[NRDNSProxy cancel](&v8, "cancel");
  if (self)
  {
    certificateUpdateNotifyToken = self->_certificateUpdateNotifyToken;
    if (certificateUpdateNotifyToken != -1)
    {
      notify_cancel(certificateUpdateNotifyToken);
      self->_certificateUpdateNotifyToken = -1;
    }
    if (self->_discoveryProxyRef)
    {
      advertising_proxy_ref_dealloc();
      v4 = (void *)qword_1001E4550;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", self->_discoveryProxyRef));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v5);

      self->_discoveryProxyRef = 0;
    }
    certificateFetcherSource = self->_certificateFetcherSource;
    if (certificateFetcherSource)
    {
      dispatch_source_cancel(certificateFetcherSource);
      v7 = self->_certificateFetcherSource;
      self->_certificateFetcherSource = 0;

    }
  }
  else
  {
    notify_cancel(0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ifNamesSet, 0);
  objc_storeStrong((id *)&self->_certificateFetcherSource, 0);
}

@end
