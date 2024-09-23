@implementation NSPPrivacyProxyDNSAgent

- (NSPPrivacyProxyDNSAgent)initWithDelegate:(id)a3
{
  id v4;
  NSPPrivacyProxyDNSAgent *v5;
  NSPPrivacyProxyDNSAgent *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NSPPrivacyProxyDNSAgent;
  v5 = -[NSPPrivacyProxyDNSAgent init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[NSPPrivacyProxyDNSAgent setActive:](v5, "setActive:", 1);
    -[NSPPrivacyProxyDNSAgent setKernelActivated:](v6, "setKernelActivated:", 0);
    -[NSPPrivacyProxyDNSAgent setUserActivated:](v6, "setUserActivated:", 0);
    -[NSPPrivacyProxyDNSAgent setVoluntary:](v6, "setVoluntary:", 1);
    objc_storeWeak((id *)&v6->_delegate, v4);
    -[NSPPrivacyProxyDNSAgent setAgentDescription:](v6, "setAgentDescription:", CFSTR("iCloud Private Relay"));
    v7 = objc_msgSend((id)objc_opt_class(v6), "dnsAgentUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[NSPPrivacyProxyDNSAgent setAgentUUID:](v6, "setAgentUUID:", v8);

  }
  return v6;
}

+ (id)dnsAgentUUID
{
  return objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &ne_privacy_dns_netagent_id);
}

+ (id)agentDomain
{
  return CFSTR("SystemConfig");
}

+ (id)agentType
{
  return CFSTR("DNSAgent");
}

- (NSString)agentDescription
{
  return self->agentDescription;
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

- (id)copyAgentData
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint8_t v22[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyDNSAgent resolver](self, "resolver"));
  if (v5)
  {
    v6 = (void *)nw_resolver_config_create();
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "obliviousDoHConfig"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyDNSAgent proxyAgentUUID](self, "proxyAgentUUID"));

    if (v8)
      v9 = 4;
    else
      v9 = 3;
    if (v8)
      v10 = 3;
    else
      v10 = 2;
    nw_resolver_config_set_class(v6, v9);
    nw_resolver_config_set_protocol(v6, v10);
    nw_resolver_config_set_allow_failover(v6, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dohURL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v11));

    v13 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "percentEncodedHost"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "percentEncodedPath"));
    nw_resolver_config_set_provider_name(v6, objc_msgSend(v14, "UTF8String"));
    nw_resolver_config_set_provider_path(v6, objc_msgSend(v15, "UTF8String"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyDNSAgent proxyAgentUUID](self, "proxyAgentUUID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));

    if (v17)
      nw_resolver_config_set_proxy_agent(v6, objc_msgSend(v17, "UTF8String"));
    if (v7 && objc_msgSend(v7, "length"))
      nw_resolver_config_set_odoh_config(v6, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
    v18 = (void *)nw_resolver_config_copy_plist_data(v6);

  }
  else
  {
    v19 = nplog_obj(0, v3, v4);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v22 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "No resolver info set", v22, 2u);
    }

    v18 = 0;
  }

  return v18;
}

- (BOOL)reportError:(int)a3 withOptions:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyDNSAgent delegate](self, "delegate"));
  objc_msgSend(v7, "reportErrorForDNSAgent:error:withOptions:", self, v4, v6);

  return 1;
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setAgentDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isActive
{
  return self->active;
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (BOOL)isKernelActivated
{
  return self->kernelActivated;
}

- (void)setKernelActivated:(BOOL)a3
{
  self->kernelActivated = a3;
}

- (BOOL)isUserActivated
{
  return self->userActivated;
}

- (void)setUserActivated:(BOOL)a3
{
  self->userActivated = a3;
}

- (BOOL)isVoluntary
{
  return self->voluntary;
}

- (void)setVoluntary:(BOOL)a3
{
  self->voluntary = a3;
}

- (NSPPrivacyProxyResolverInfo)resolver
{
  return (NSPPrivacyProxyResolverInfo *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResolver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSUUID)proxyAgentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setProxyAgentUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSPPrivacyProxyDNSAgentDelegate)delegate
{
  return (NSPPrivacyProxyDNSAgentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_proxyAgentUUID, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->agentDescription, 0);
  objc_storeStrong((id *)&self->agentUUID, 0);
}

@end
