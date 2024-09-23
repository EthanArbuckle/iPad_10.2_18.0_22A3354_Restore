@implementation NRDNSProxyClient

- (void)start
{
  id v3;
  uint64_t v4;
  int dnsProtocol;
  NRDNSProxyClient *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  NSUUID *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NWAddressEndpoint *serverEndpoint;
  _DWORD *v17;
  void *v18;
  int IsLevelEnabled;
  NSUUID *v20;
  uint64_t v21;
  void *v22;
  int v23;
  char *v24;
  NSData *v25;
  uint64_t v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  NSUUID *v34;
  uint64_t v35;
  void *v36;
  char v37;
  NSUUID *v38;
  uint64_t v39;
  void *v40;
  id v41;
  int v42;
  id v43;
  id v44;
  int v45;
  id v46;
  objc_super v47;
  void **v48;
  uint64_t v49;
  void (*v50)(uint64_t, int, int);
  void *v51;
  id v52;
  id v53;
  id location;

  if (!self)
  {
    v47.receiver = 0;
    v47.super_class = (Class)NRDNSProxyClient;
    -[NRDNSProxy start](&v47, "start");
    return;
  }
  if (!self->super._started)
  {
    v47.receiver = self;
    v47.super_class = (Class)NRDNSProxyClient;
    v3 = -[NRDNSProxy start](&v47, "start");
    dnsProtocol = self->super._dnsProtocol;
    if (dnsProtocol != 1)
    {
      if (!dnsProtocol)
      {
        v6 = self;
        v7 = 2;
LABEL_16:
        sub_10001C4D4(v6, v7);
        return;
      }
      goto LABEL_13;
    }
    if (!self->super._isDiscoveryProxy)
    {
LABEL_13:
      v18 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v4);
      IsLevelEnabled = _NRLogIsLevelEnabled(v18, 17);

      if (IsLevelEnabled)
      {
        v20 = self->super._nrUUID;
        v22 = (void *)_NRCopyLogObjectForNRUUID(v20, v21);
        v23 = self->super._dnsProtocol;

        _NRLogWithArgs(v22, 17, "unsupported dns protocol %u", v23);
      }
LABEL_15:
      v6 = self;
      v7 = 4;
      goto LABEL_16;
    }
    if (!self->super._serverCertificateData)
    {
      if (qword_1001E4560 != -1)
        dispatch_once(&qword_1001E4560, &stru_1001B6390);
      if (_NRLogIsLevelEnabled(qword_1001E4558, 17))
      {
        if (qword_1001E4560 != -1)
          dispatch_once(&qword_1001E4560, &stru_1001B6390);
        _NRLogWithArgs(qword_1001E4558, 17, "no server certificate failed");
      }
      goto LABEL_15;
    }
    v9 = (void *)mrc_discovery_proxy_parameters_create(v3);
    if (v9)
    {
      v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
      v11 = _NRLogIsLevelEnabled(v10, 0);

      if (v11)
      {
        v12 = self->super._nrUUID;
        v14 = (void *)_NRCopyLogObjectForNRUUID(v12, v13);
        _NRLogWithArgs(v14, 0, "%s%.30s:%-4d setting discovery proxy address %@", ", "-[NRDNSProxyClient startDiscoveryProxyClient]", 197, self->super._serverEndpoint);

      }
      v15 = -[NWAddressEndpoint addressFamily](self->super._serverEndpoint, "addressFamily");
      serverEndpoint = self->super._serverEndpoint;
      if (v15 == (id)2)
      {
        v17 = -[NWAddressEndpoint address](serverEndpoint, "address");
        mrc_discovery_proxy_parameters_add_server_ipv4_address(v9, bswap32(v17[1]), bswap32(*((unsigned __int16 *)v17 + 1)) >> 16);
      }
      else if (-[NWAddressEndpoint addressFamily](serverEndpoint, "addressFamily") == (id)30)
      {
        v24 = (char *)-[NWAddressEndpoint address](self->super._serverEndpoint, "address");
        mrc_discovery_proxy_parameters_add_server_ipv6_address(v9, v24 + 8, bswap32(*((unsigned __int16 *)v24 + 1)) >> 16, *((unsigned int *)v24 + 6));
      }
      mrc_discovery_proxy_parameters_add_match_domain(v9, "local");
      v25 = self->super._serverCertificateData;
      mrc_discovery_proxy_parameters_add_server_certificate(v9, -[NSData bytes](v25, "bytes"), -[NSData length](v25, "length"));
      mrc_discovery_proxy_parameters_set_interface(v9, self->_discoveryProxyInterfaceIndex);
      v27 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v26);
      v28 = _NRLogIsLevelEnabled(v27, 0);

      if (v28)
      {
        v30 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v29);
        _NRLogWithArgs(v30, 0, "%s%.30s:%-4d setting interface index %u", ", "-[NRDNSProxyClient startDiscoveryProxyClient]", 211, self->_discoveryProxyInterfaceIndex);

      }
      v31 = mrc_discovery_proxy_create(v9);
      v32 = (void *)v31;
      if (v31)
      {
        mrc_discovery_proxy_set_queue(v31, self->super._queue);
        objc_initWeak(&location, self);
        v48 = _NSConcreteStackBlock;
        v49 = 3221225472;
        v50 = sub_10001C5A4;
        v51 = &unk_1001B62F8;
        objc_copyWeak(&v53, &location);
        v33 = v32;
        v52 = v33;
        mrc_discovery_proxy_set_event_handler();
        mrc_discovery_proxy_activate(v33);
        v34 = self->super._nrUUID;
        v36 = (void *)_NRCopyLogObjectForNRUUID(v34, v35);
        v37 = _NRLogIsLevelEnabled(v36, 0);

        if ((v37 & 1) != 0)
        {
          v38 = self->super._nrUUID;
          v40 = (void *)_NRCopyLogObjectForNRUUID(v38, v39);
          _NRLogWithArgs(v40, 0, "%s%.30s:%-4d discovery proxy client activated", ", "-[NRDNSProxyClient startDiscoveryProxyClient]", 255);

        }
        objc_storeStrong((id *)&self->_discoveryProxyClient, v32);
        sub_10001C4D4(self, 1);

        objc_destroyWeak(&v53);
        objc_destroyWeak(&location);
      }
      else
      {
        v44 = sub_10001BDA4();
        v45 = _NRLogIsLevelEnabled(v44, 17);

        if (v45)
        {
          v46 = sub_10001BDA4();
          _NRLogWithArgs(v46, 17, "mrc_discovery_proxy_create failed");

        }
        sub_10001C4D4(self, 4);
      }

    }
    else
    {
      v41 = sub_10001BDA4();
      v42 = _NRLogIsLevelEnabled(v41, 17);

      if (v42)
      {
        v43 = sub_10001BDA4();
        _NRLogWithArgs(v43, 17, "mrc_discovery_proxy_parameters_create failed");

      }
      sub_10001C4D4(self, 4);

    }
  }
}

- (id)description
{
  const char *v3;
  id v4;
  unint64_t identifier;
  uint64_t state;
  __CFString *v7;
  id v8;

  if (self)
  {
    if (self->super._isDiscoveryProxy)
      v3 = "NRDiscoveryProxyClient";
    else
      v3 = "NRDNSProxyClient";
    v4 = objc_alloc((Class)NSString);
    identifier = self->super._identifier;
    state = self->super._state;
    v7 = CFSTR("Invalid");
    switch((int)state)
    {
      case 0:
        break;
      case 1:
        v7 = CFSTR("Preparing");
        break;
      case 2:
        v7 = CFSTR("Ready");
        break;
      case 3:
        v7 = CFSTR("Restarting");
        break;
      case 4:
        v7 = CFSTR("Failed");
        break;
      default:
        v7 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unknown(%u)"), state);
        break;
    }
  }
  else
  {
    v4 = objc_alloc((Class)NSString);
    identifier = 0;
    v7 = CFSTR("Invalid");
    v3 = "NRDNSProxyClient";
  }
  v8 = objc_msgSend(v4, "initWithFormat:", CFSTR("%s[%llu, %@]"), v3, identifier, v7);

  return v8;
}

- (void)cancel
{
  OS_mrc_discovery_proxy *discoveryProxyClient;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NRDNSProxyClient;
  -[NRDNSProxy cancel](&v4, "cancel");
  if (self)
  {
    if (self->_discoveryProxyClient)
    {
      mrc_discovery_proxy_invalidate();
      discoveryProxyClient = self->_discoveryProxyClient;
      self->_discoveryProxyClient = 0;

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryProxyClient, 0);
}

@end
