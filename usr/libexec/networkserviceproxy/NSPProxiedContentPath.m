@implementation NSPProxiedContentPath

- (NSPProxiedContentPath)initWithDelegate:(id)a3 initialMap:(id)a4 ingressProxy:(id)a5 egressProxy:(id)a6 resolver:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSPProxiedContentPath *v17;
  uint64_t v18;
  uint64_t v19;
  NSPProxiedContentPath *v20;
  NSMutableArray *v21;
  NSMutableArray *associatedMaps;
  NSPProxiedContentPath *v23;
  uint64_t v25;
  NSObject *v26;
  uint8_t v27[16];
  objc_super v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)NSPProxiedContentPath;
  v17 = -[NSPProxiedContentPath init](&v28, "init");
  v20 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_delegate, v12);
    v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    associatedMaps = v20->_associatedMaps;
    v20->_associatedMaps = v21;

    -[NSMutableArray addObject:](v20->_associatedMaps, "addObject:", v13);
    objc_storeStrong((id *)&v20->_ingressProxy, a5);
    objc_storeStrong((id *)&v20->_egressProxy, a6);
    objc_storeStrong((id *)&v20->_resolver, a7);
    v23 = v20;
  }
  else
  {
    v25 = nplog_obj(0, v18, v19);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "[super init] failed", v27, 2u);
    }

  }
  return v20;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithCapacity:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
  sub_1000418A4(v7, v8, CFSTR("Ingress proxy"), a3, a4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
  sub_1000418A4(v7, v9, CFSTR("Egress proxy"), a3, a4);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicAgentUUID](self, "quicAgentUUID"));
  sub_1000418A4(v7, v10, CFSTR("QUIC Agent UUID"), a3, a4);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackAgentUUID](self, "fallbackAgentUUID"));
  sub_1000418A4(v7, v11, CFSTR("Fallback Agent UUID"), a3, a4);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
  sub_1000418A4(v7, v12, CFSTR("Resolver Agent UUID"), a3, a4);

  return v7;
}

- (NSString)description
{
  return (NSString *)-[NSPProxiedContentPath descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPProxiedContentPath)initWithCoder:(id)a3
{
  id v4;
  NSPProxiedContentPath *v5;
  id v6;
  uint64_t v7;
  NSPProxyTokenInfo *ingressProxy;
  id v9;
  uint64_t v10;
  NSPProxyTokenInfo *egressProxy;
  id v12;
  uint64_t v13;
  NSPPrivacyProxyResolverInfo *resolver;
  id v15;
  uint64_t v16;
  NSUUID *quicAgentUUID;
  id v18;
  uint64_t v19;
  NSUUID *fallbackAgentUUID;
  id v21;
  uint64_t v22;
  NSUUID *resolverAgentUUID;
  uint64_t v24;
  NSSet *v25;
  void *v26;
  uint64_t v27;
  NSArray *resolvedAddresses;
  uint64_t v29;
  NSSet *v30;
  void *v31;
  void *v32;
  NSMutableArray *v33;
  NSMutableArray *associatedMaps;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)NSPProxiedContentPath;
  v5 = -[NSPProxiedContentPath init](&v36, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSPProxyTokenInfo), CFSTR("proxyPathIngressProxy"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    ingressProxy = v5->_ingressProxy;
    v5->_ingressProxy = (NSPProxyTokenInfo *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSPProxyTokenInfo), CFSTR("proxyPathEgressProxy"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    egressProxy = v5->_egressProxy;
    v5->_egressProxy = (NSPProxyTokenInfo *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSPPrivacyProxyResolverInfo), CFSTR("proxyPathResolver"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    resolver = v5->_resolver;
    v5->_resolver = (NSPPrivacyProxyResolverInfo *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("proxyPathQUICAgentUUID"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    quicAgentUUID = v5->_quicAgentUUID;
    v5->_quicAgentUUID = (NSUUID *)v16;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("proxyPathFallbackAgentUUID"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    fallbackAgentUUID = v5->_fallbackAgentUUID;
    v5->_fallbackAgentUUID = (NSUUID *)v19;

    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("proxyPathResolverAgentUUID"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    resolverAgentUUID = v5->_resolverAgentUUID;
    v5->_resolverAgentUUID = (NSUUID *)v22;

    v24 = objc_opt_class(NSArray);
    v25 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v24, objc_opt_class(NSString), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("proxyPathResolvedAddresses")));
    resolvedAddresses = v5->_resolvedAddresses;
    v5->_resolvedAddresses = (NSArray *)v27;

    v29 = objc_opt_class(NSArray);
    v30 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v29, objc_opt_class(NSPPrivacyProxyProxiedContentMap), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("proxyPathAssociatedMaps")));

    if (v32)
    {
      v33 = (NSMutableArray *)objc_msgSend(v32, "mutableCopy");
      associatedMaps = v5->_associatedMaps;
      v5->_associatedMaps = v33;

    }
    if (v5->_resolver && v5->_resolverAgentUUID)
      -[NSPProxiedContentPath resetResolverAgentForceUpdateDelegate:](v5, "resetResolverAgentForceUpdateDelegate:", 0);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("proxyPathIngressProxy"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("proxyPathEgressProxy"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolver](self, "resolver"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("proxyPathResolver"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicAgentUUID](self, "quicAgentUUID"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("proxyPathQUICAgentUUID"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackAgentUUID](self, "fallbackAgentUUID"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("proxyPathFallbackAgentUUID"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("proxyPathResolverAgentUUID"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolvedAddresses](self, "resolvedAddresses"));
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("proxyPathResolvedAddresses"));

  v12 = (id)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath associatedMaps](self, "associatedMaps"));
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("proxyPathAssociatedMaps"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NSPProxiedContentPath *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = -[NSPProxiedContentPath init](+[NSPProxiedContentPath allocWithZone:](NSPProxiedContentPath, "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath associatedMaps](self, "associatedMaps"));
  -[NSPProxiedContentPath setAssociatedMaps:](v4, "setAssociatedMaps:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
  -[NSPProxiedContentPath setIngressProxy:](v4, "setIngressProxy:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
  -[NSPProxiedContentPath setEgressProxy:](v4, "setEgressProxy:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolver](self, "resolver"));
  -[NSPProxiedContentPath setResolver:](v4, "setResolver:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicAgentUUID](self, "quicAgentUUID"));
  -[NSPProxiedContentPath setQuicAgentUUID:](v4, "setQuicAgentUUID:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackAgentUUID](self, "fallbackAgentUUID"));
  -[NSPProxiedContentPath setFallbackAgentUUID:](v4, "setFallbackAgentUUID:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
  -[NSPProxiedContentPath setResolverAgentUUID:](v4, "setResolverAgentUUID:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicRegistration](self, "quicRegistration"));
  -[NSPProxiedContentPath setQuicRegistration:](v4, "setQuicRegistration:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackRegistration](self, "fallbackRegistration"));
  -[NSPProxiedContentPath setFallbackRegistration:](v4, "setFallbackRegistration:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
  -[NSPProxiedContentPath setResolverRegistration:](v4, "setResolverRegistration:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolvedAddresses](self, "resolvedAddresses"));
  -[NSPProxiedContentPath setResolvedAddresses:](v4, "setResolvedAddresses:", v15);

  -[NSPProxiedContentPath setProxiedContentAgentRegistered:](v4, "setProxiedContentAgentRegistered:", -[NSPProxiedContentPath proxiedContentAgentRegistered](self, "proxiedContentAgentRegistered"));
  return v4;
}

- (id)shortName
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolver](self, "resolver"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolver](self, "resolver"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dohURL"));
  }
  else
  {
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
    v4 = v6;
    if (v6)
      v6 = (_QWORD *)v6[3];
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vendor"));
  }
  v7 = (void *)v5;

  return v7;
}

- (BOOL)matchesMap:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath associatedMaps](self, "associatedMaps", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v4, "proxiesCount");
        if (v10 == objc_msgSend(v9, "proxiesCount"))
        {
          v11 = objc_msgSend(v4, "hasResolver");
          if (v11 == objc_msgSend(v9, "hasResolver"))
          {
            v12 = objc_msgSend(v4, "isPrivacyProxy");
            if (v12 == objc_msgSend(v9, "isPrivacyProxy"))
            {
              v13 = objc_msgSend(v4, "resolver");
              if (v13 == objc_msgSend(v9, "resolver"))
              {
                if (objc_msgSend(v4, "proxiesCount"))
                {
                  v14 = 0;
                  do
                  {
                    LODWORD(v6) = *((_DWORD *)objc_msgSend(v4, "proxies") + v14);
                    LOBYTE(v6) = (_DWORD)v6 == *((_DWORD *)objc_msgSend(v9, "proxies") + v14);
                    if (!(_BYTE)v6)
                      break;
                    ++v14;
                  }
                  while (v14 < (unint64_t)objc_msgSend(v4, "proxiesCount"));
                }
                else
                {
                  LOBYTE(v6) = 1;
                }
                goto LABEL_20;
              }
            }
          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_20:

  return (char)v6;
}

- (void)addMap:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath associatedMaps](self, "associatedMaps"));
  objc_msgSend(v5, "addObject:", v4);

}

- (BOOL)matchIngress:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  NSObject *v16;
  int v17;
  const char *v18;

  v6 = (id *)a3;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));

    if (v7)
    {
      v8 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
      v9 = (void *)v8;
      if (v8)
        v10 = *(void **)(v8 + 24);
      else
        v10 = 0;
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "proxyURL"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[3], "proxyURL"));
      LOBYTE(v7) = objc_msgSend(v12, "isEqualToString:", v13);

    }
  }
  else
  {
    v15 = nplog_obj(0, v4, v5);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      v17 = 136315138;
      v18 = "-[NSPProxiedContentPath matchIngress:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "%s called with null proxyTokenInfo", (uint8_t *)&v17, 0xCu);
    }

    LOBYTE(v7) = 0;
  }

  return (char)v7;
}

- (BOOL)matchEgress:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  NSObject *v16;
  int v17;
  const char *v18;

  v6 = (id *)a3;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));

    if (v7)
    {
      v8 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
      v9 = (void *)v8;
      if (v8)
        v10 = *(void **)(v8 + 24);
      else
        v10 = 0;
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "proxyURL"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[3], "proxyURL"));
      LOBYTE(v7) = objc_msgSend(v12, "isEqualToString:", v13);

    }
  }
  else
  {
    v15 = nplog_obj(0, v4, v5);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      v17 = 136315138;
      v18 = "-[NSPProxiedContentPath matchEgress:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "%s called with null proxyTokenInfo", (uint8_t *)&v17, 0xCu);
    }

    LOBYTE(v7) = 0;
  }

  return (char)v7;
}

- (void)reportErrorForNetworkRegistration:(id)a3 error:(int)a4 withOptions:(id)a5
{
  uint64_t v6;
  id *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  id *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  int v37;
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int128 buffer;
  _OWORD v46[3];

  v6 = *(_QWORD *)&a4;
  v8 = (id *)a3;
  buffer = 0u;
  memset(v46, 0, sizeof(v46));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKeyedSubscript:", NWNetworkAgentStartOptionClientUUID));
  v12 = v9;
  if (!v9)
  {
    v13 = 0;
    goto LABEL_7;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NWPath pathForClientID:](NWPath, "pathForClientID:", v9));
  v13 = v9;
  if (!v9)
  {
LABEL_7:
    v21 = 0;
    v14 = 0;
    goto LABEL_13;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "interface"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parameters"));
  v16 = objc_msgSend(v15, "pid");
  if (!v16)
  {
LABEL_11:
    v21 = 0;
    goto LABEL_12;
  }
  v17 = v16;
  v18 = proc_pidinfo(v16, 13, 1uLL, &buffer, 64);
  if ((_DWORD)v18 != 64)
  {
    v22 = nplog_obj(v18, v19, v20);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v37 = 67109120;
      v38 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to convert from PID (%d) to process name", (uint8_t *)&v37, 8u);
    }

    goto LABEL_11;
  }
  v21 = (const char *)v46;
LABEL_12:

LABEL_13:
  v24 = nplog_obj(v9, v10, v11);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    if (v21)
      v26 = v21;
    else
      v26 = "none";
    v27 = sub_100042794(v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "interfaceName"));
    v37 = 67109890;
    v38 = v6;
    v39 = 2080;
    v40 = v26;
    v41 = 2112;
    v42 = v28;
    v43 = 2112;
    v44 = v29;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Received error (%d) from %s for content-specific %@ agent on interface %@", (uint8_t *)&v37, 0x26u);

  }
  if ((_DWORD)v6)
  {
    if ((_DWORD)v6 == 1303)
    {
      v33 = nplog_obj(v30, v31, v32);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        LOWORD(v37) = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Flushing resolved addresses", (uint8_t *)&v37, 2u);
      }

      -[NSPProxiedContentPath setResolvedAddresses:](self, "setResolvedAddresses:", 0);
      -[NSPProxiedContentPath resetQUICProxyAgentForceUpdateDelegate:](self, "resetQUICProxyAgentForceUpdateDelegate:", 0);
      -[NSPProxiedContentPath resetResolverAgentForceUpdateDelegate:](self, "resetResolverAgentForceUpdateDelegate:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath delegate](self, "delegate"));
      objc_msgSend(v35, "updateUserEventAgentData");

    }
    else if ((_DWORD)v6 == 35)
    {
      -[NSPProxiedContentPath resetResumableSessionTickets](self, "resetResumableSessionTickets");
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath delegate](self, "delegate"));
    objc_msgSend(v36, "reportProxiedContentPathError:interface:proxiedContentPath:registration:", v6, v14, self, v8);

  }
}

- (void)reportErrorForDNSAgent:(id)a3 error:(int)a4 withOptions:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int128 buffer;
  _OWORD v38[3];

  v7 = a3;
  buffer = 0u;
  memset(v38, 0, sizeof(v38));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKeyedSubscript:", NWNetworkAgentStartOptionClientUUID));
  v11 = v8;
  if (!v8)
  {
    v12 = 0;
    goto LABEL_7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NWPath pathForClientID:](NWPath, "pathForClientID:", v8));
  v12 = v8;
  if (!v8)
  {
LABEL_7:
    v20 = 0;
    v13 = 0;
    goto LABEL_13;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interface"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "parameters"));
  v15 = objc_msgSend(v14, "pid");
  if (!v15)
  {
LABEL_11:
    v20 = 0;
    goto LABEL_12;
  }
  v16 = v15;
  v17 = proc_pidinfo(v15, 13, 1uLL, &buffer, 64);
  if ((_DWORD)v17 != 64)
  {
    v21 = nplog_obj(v17, v18, v19);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v29 = 67109120;
      v30 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to convert from PID (%d) to process name", (uint8_t *)&v29, 8u);
    }

    goto LABEL_11;
  }
  v20 = (const char *)v38;
LABEL_12:

LABEL_13:
  v23 = nplog_obj(v8, v9, v10);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    if (v20)
      v25 = v20;
    else
      v25 = "none";
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resolver"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "dohURL"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "interfaceName"));
    v29 = 67109890;
    v30 = a4;
    v31 = 2080;
    v32 = v25;
    v33 = 2112;
    v34 = v27;
    v35 = 2112;
    v36 = v28;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Received error (%d) from %s for content-specific %@ resolver agent on interface %@", (uint8_t *)&v29, 0x26u);

  }
}

- (BOOL)pathReady
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  void *v30;
  int v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
  if (sub_10000B9B4((uint64_t)v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
    v5 = sub_10000D9B0((uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
    v7 = sub_10000E610((uint64_t)v6);

    if (v5 <= v7)
    {
      v11 = nplog_obj(v8, v9, v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
        v14 = sub_10000D9B0((uint64_t)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath shortName](self, "shortName"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
        v32 = 134218498;
        v33 = v14;
        v34 = 2112;
        v35 = v15;
        v36 = 2048;
        v37 = sub_10000E610((uint64_t)v16);
        v17 = "proxied content path is not ready due to insufficient ingress proxy tokens (cache+agent: %lu) for [%@], (i"
              "ngress proxy low-water mark: %lu)";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v32, 0x20u);

        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
  else
  {

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
  if (sub_10000B9B4((uint64_t)v18))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
    v20 = sub_10000D9B0((uint64_t)v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
    v22 = sub_10000E610((uint64_t)v21);

    if (v20 <= v22)
    {
      v26 = nplog_obj(v23, v24, v25);
      v12 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
        v27 = sub_10000D9B0((uint64_t)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath shortName](self, "shortName"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
        v32 = 134218498;
        v33 = v27;
        v34 = 2112;
        v35 = v15;
        v36 = 2048;
        v37 = sub_10000E610((uint64_t)v16);
        v17 = "proxied content path is not ready due to insufficient egress proxy tokens (cache+agent: %lu) for [%@], (eg"
              "ress proxy low-water mark: %lu)";
        goto LABEL_10;
      }
LABEL_11:
      v28 = 0;
      goto LABEL_15;
    }
  }
  else
  {

  }
  v29 = nplog_obj(v23, v24, v25);
  v12 = objc_claimAutoreleasedReturnValue(v29);
  v28 = 1;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath shortName](self, "shortName"));
    v32 = 138412290;
    v33 = (uint64_t)v30;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "proxied content path [%@] is ready", (uint8_t *)&v32, 0xCu);

  }
LABEL_15:

  return v28;
}

- (BOOL)allowFallback
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  unsigned __int8 v10;

  v3 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
  v4 = (void *)v3;
  if (v3)
    v5 = *(void **)(v3 + 24);
  else
    v5 = 0;
  v6 = v5;
  if (objc_msgSend(v6, "supportsFallback"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
    if (v7)
    {
      v8 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
      v9 = v8;
      if (v8)
        v8 = (_QWORD *)v8[3];
      v10 = objc_msgSend(v8, "supportsFallback");

    }
    else
    {
      v10 = 1;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)resetResumableSessionTickets
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;

  v3 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicRegistration](self, "quicRegistration"));
  v6 = (id *)v3;
  if (v3)
  {
    v7 = nplog_obj(v3, v4, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath shortName](self, "shortName"));
      v10 = 138412290;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Flushing session tickets for proxied content path [%@]", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(v6[3], "flushTokens");
    -[NSPProxiedContentPath fetchResumableSessionTickets](self, "fetchResumableSessionTickets");
  }

}

- (id)createDoHQueryForName:(const char *)a3 type:(unsigned __int16)a4
{
  uint64_t v4;
  int v5;
  dispatch_data_t v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  size_t size;
  _OWORD buffer[17];
  _BYTE v13[264];

  if (!a3)
  {
    v8 = nplog_obj(self, a2, 0, a4);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buffer[0]) = 136315138;
      *(_QWORD *)((char *)buffer + 4) = "-[NSPProxiedContentPath createDoHQueryForName:type:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%s called with null name", (uint8_t *)buffer, 0xCu);
    }

    goto LABEL_9;
  }
  v4 = a4;
  memset(v13, 0, 256);
  v5 = DomainNameFromString(v13, a3, 0);
  v6 = 0;
  if (!v5)
  {
    memset(buffer, 0, sizeof(buffer));
    size = 0;
    v7 = DNSMessageWriteQuery(0, 256, v13, v4, 1, buffer, &size);
    v6 = 0;
    if (!v7)
    {
      if (size)
      {
        v6 = dispatch_data_create(buffer, size, 0, 0);
        return v6;
      }
LABEL_9:
      v6 = 0;
    }
  }
  return v6;
}

- (id)createDoHMessageForQuery:(id)a3 name:(const char *)a4
{
  NSObject *v5;
  NSObject *v6;
  NSObject *metadata;
  void *v8;
  nw_endpoint_t url;
  size_t size;
  char __str[8];
  uint64_t v13;

  v5 = a3;
  v6 = nw_content_context_create("DoH Message");
  metadata = nw_http_create_metadata();
  nw_http_metadata_set_method(metadata, 3);
  nw_http_metadata_set_path(metadata, "/dns-query");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("https://%s/dns-query"), a4));
  url = nw_endpoint_create_url((const char *)objc_msgSend(v8, "UTF8String"));
  nw_http_metadata_set_endpoint(metadata, url);

  nw_http_metadata_add_header(metadata, "accept", "application/dns-message");
  nw_http_metadata_add_header(metadata, "content-type", "application/dns-message");
  size = dispatch_data_get_size(v5);

  *(_QWORD *)__str = 0;
  v13 = 0;
  snprintf(__str, 0x10uLL, "%zu", size);
  nw_http_metadata_add_header(metadata, "content-length", __str);
  nw_content_context_set_metadata_for_protocol(v6, metadata);
  nw_content_context_set_is_final(v6, 1);

  return v6;
}

- (id)copyAddressesFromDoHAnswer:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  const char *hostname;
  void *v12;
  __int16 v14;
  int v15;
  uint64_t v16;
  sockaddr *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  int AnswerSection;
  sockaddr address[2];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  if (v3)
  {
    AnswerSection = 0;
    v20 = 0;
    v5 = DNSMessageCollapse(objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), &v20, &AnswerSection);
    v6 = (void *)v5;
    if (!AnswerSection && v5 && v20 > 0xB)
    {
      v7 = __rev16(*(unsigned __int16 *)(v5 + 6));
      if (v7)
      {
        v19 = 0;
        AnswerSection = DNSMessageGetAnswerSection(v5);
        if (!AnswerSection)
        {
          v8 = 0;
          v18 = v19;
          while (1)
          {
            v16 = 0;
            v17 = 0;
            v15 = 0;
            v14 = 0;
            AnswerSection = DNSMessageExtractRecord(v6, v20, v18, 0, &v14, 0, &v15, &v17, &v16, &v18);
            if (AnswerSection)
              goto LABEL_24;
            if (v14 == 28)
            {
              address[0] = (sockaddr)xmmword_1000C0184;
              *(_OWORD *)&address[0].sa_data[10] = *(__int128 *)((char *)&xmmword_1000C0184 + 12);
              if (v17 && v16 == 16)
              {
                *(sockaddr *)&address[0].sa_data[6] = *v17;
LABEL_17:
                v9 = nw_endpoint_create_address(address);
                v10 = v9;
                if (v9)
                {
                  hostname = nw_endpoint_get_hostname(v9);
                  if (hostname)
                  {
                    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", hostname));
                    objc_msgSend(v4, "addObject:", v12);

                  }
                }

              }
            }
            else if (v14 == 1)
            {
              address[0] = (sockaddr)xmmword_1000C0200;
              if (v17)
              {
                if (v16 == 4)
                {
                  *(_DWORD *)&address[0].sa_data[2] = *(_DWORD *)&v17->sa_len;
                  goto LABEL_17;
                }
              }
            }
            if (++v8 >= v7)
              goto LABEL_24;
          }
        }
      }
      goto LABEL_24;
    }
    if (v5)
LABEL_24:
      free(v6);
  }

  return v4;
}

- (void)startConnectionForSessionTicketsWithEndpoint:(id)a3 parameters:(id)a4 dohQueryType:(unsigned __int16)a5 completionHandler:(id)a6
{
  uint64_t v7;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  const char *hostname;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  _QWORD completion[4];
  id v23;
  uint64_t *v24;
  id v25;
  id location;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  nw_connection_t v33;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1000030EC;
  v32 = sub_10000C20C;
  v33 = nw_connection_create(v10, v11);
  v13 = v29[5];
  v14 = NPGetInternalQueue(v33);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  nw_connection_set_queue(v13, v15);

  v16 = v29[5];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000152C8;
  v27[3] = &unk_1000F58D8;
  v27[4] = &v28;
  nw_connection_set_event_handler(v16, v27);
  hostname = nw_endpoint_get_hostname(v10);
  v18 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath createDoHQueryForName:type:](self, "createDoHQueryForName:type:", hostname, v7));
  v19 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath createDoHMessageForQuery:name:](self, "createDoHMessageForQuery:name:", v18, hostname));
  nw_connection_send((nw_connection_t)v29[5], v18, v19, 1, _nw_connection_send_idempotent_content);
  nw_connection_start((nw_connection_t)v29[5]);
  objc_initWeak(&location, self);
  v20 = v29[5];
  completion[0] = _NSConcreteStackBlock;
  completion[1] = 3221225472;
  completion[2] = sub_1000153DC;
  completion[3] = &unk_1000F5900;
  objc_copyWeak(&v25, &location);
  v21 = v12;
  v23 = v21;
  v24 = &v28;
  nw_connection_receive_message(v20, completion);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v28, 8);
}

- (id)bootstrapAddresses
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
  if (v3)
    v4 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
  else
    v4 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
  v5 = (_QWORD *)v4;

  if (v5)
    v6 = (void *)v5[3];
  else
    v6 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bootstrapAddresses"));
  if (objc_msgSend(v7, "count"))
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingComparator:", &stru_1000F5940));
  else
    v8 = 0;

  return v8;
}

- (void)fetchResumableSessionTickets
{
  void *v3;
  const char *v4;
  id v5;
  nw_protocol_definition_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t port;
  void *direct;
  NSObject *v20;
  id v21;
  char v22;
  uint64_t v23;
  void *i;
  NSObject *host_with_numeric_port;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  nw_endpoint_t url;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  os_log_t oslog;
  NSObject *stack;
  id v44;
  NSObject *endpoint;
  id selfa;
  _QWORD block[7];
  id v48;
  _QWORD v49[4];
  NSObject *v50;
  _QWORD *v51;
  _QWORD v52[4];
  NSObject *v53;
  _QWORD *v54;
  _QWORD v55[5];
  id v56;
  _QWORD v57[5];
  id v58;
  _QWORD iterate_block[4];
  id v60;
  id location;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  int v66;
  __int128 buf;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _BYTE v72[128];

  if (!-[NSPProxiedContentPath fetchingSessionTickets](self, "fetchingSessionTickets"))
  {
    -[NSPProxiedContentPath setResolvedAddresses:](self, "setResolvedAddresses:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicRegistration](self, "quicRegistration"));
    selfa = v3;
    if (v3)
    {
      v5 = objc_getProperty(v3, v4, 48, 1);
      if (v5)
      {
        v66 = 4;
        v6 = nw_protocol_copy_tcp_definition();
        v44 = v5;
        v41 = (void *)nw_proxy_config_copy_protocol_stack(v5, v6, &v66);

        if (v41)
        {
          endpoint = nw_proxy_config_copy_endpoint(v5);
          if (endpoint)
          {
            v12 = nw_proxy_config_copy_parameters_to_proxy(v5);
            v15 = v12;
            if (v12)
            {
              stack = nw_parameters_copy_default_protocol_stack(v12);
              if (stack)
              {
                oslog = (os_log_t)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath bootstrapAddresses](self, "bootstrapAddresses"));
                if (-[NSObject count](oslog, "count")
                  && (nw_endpoint_get_type(endpoint) == nw_endpoint_type_host
                   || nw_endpoint_get_type(endpoint) == nw_endpoint_type_url))
                {
                  port = nw_endpoint_get_port(endpoint);
                  direct = (void *)nw_proxy_config_create_direct();
                  nw_proxy_config_set_prohibit_direct(direct, 1);
                  v64 = 0u;
                  v65 = 0u;
                  v62 = 0u;
                  v63 = 0u;
                  v20 = oslog;
                  v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
                  if (v21)
                  {
                    v22 = 0;
                    v23 = *(_QWORD *)v63;
                    do
                    {
                      for (i = 0; i != v21; i = (char *)i + 1)
                      {
                        if (*(_QWORD *)v63 != v23)
                          objc_enumerationMutation(v20);
                        host_with_numeric_port = nw_endpoint_create_host_with_numeric_port(objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i), "UTF8String", v41), port);
                        v26 = host_with_numeric_port;
                        if (host_with_numeric_port
                          && nw_endpoint_get_type(host_with_numeric_port) == nw_endpoint_type_address)
                        {
                          nw_proxy_config_add_resolved_endpoint(direct, v26);
                          v22 = 1;
                        }

                      }
                      v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
                    }
                    while (v21);

                    if ((v22 & 1) != 0)
                      nw_parameters_add_custom_proxy_config(v15, direct);
                  }
                  else
                  {

                  }
                }
                nw_parameters_set_fast_open_enabled(v15, 1);
                v27 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
                v28 = (void *)v27;
                if (v27)
                  v29 = *(void **)(v27 + 24);
                else
                  v29 = 0;
                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "proxyURL", v41));

                url = nw_endpoint_create_url((const char *)objc_msgSend(v30, "UTF8String"));
                nw_parameters_set_url_endpoint(v15, url);

                objc_initWeak(&location, self);
                iterate_block[0] = _NSConcreteStackBlock;
                iterate_block[1] = 3221225472;
                iterate_block[2] = sub_100015C78;
                iterate_block[3] = &unk_1000F5990;
                objc_copyWeak(&v60, &location);
                nw_protocol_stack_iterate_application_protocols(stack, iterate_block);
                -[NSPProxiedContentPath setFetchingSessionTickets:](self, "setFetchingSessionTickets:", 1);
                *(_QWORD *)&buf = 0;
                *((_QWORD *)&buf + 1) = &buf;
                v68 = 0x3032000000;
                v69 = sub_1000030EC;
                v70 = sub_10000C20C;
                v71 = (id)os_transaction_create("com.apple.networkserviceproxy.fetchResumableSessionTickets");
                v32 = dispatch_group_create();
                dispatch_group_enter(v32);
                v57[0] = 0;
                v57[1] = v57;
                v57[2] = 0x3032000000;
                v57[3] = sub_1000030EC;
                v57[4] = sub_10000C20C;
                v58 = &__NSArray0__struct;
                v55[0] = 0;
                v55[1] = v55;
                v55[2] = 0x3032000000;
                v55[3] = sub_1000030EC;
                v55[4] = sub_10000C20C;
                v56 = &__NSArray0__struct;
                v52[0] = _NSConcreteStackBlock;
                v52[1] = 3221225472;
                v52[2] = sub_100015E98;
                v52[3] = &unk_1000F59B8;
                v54 = v57;
                v33 = v32;
                v53 = v33;
                -[NSPProxiedContentPath startConnectionForSessionTicketsWithEndpoint:parameters:dohQueryType:completionHandler:](self, "startConnectionForSessionTicketsWithEndpoint:parameters:dohQueryType:completionHandler:", endpoint, v15, 1, v52);
                dispatch_group_enter(v33);
                v49[0] = _NSConcreteStackBlock;
                v49[1] = 3221225472;
                v49[2] = sub_100015EF0;
                v49[3] = &unk_1000F59B8;
                v51 = v55;
                v34 = v33;
                v50 = v34;
                v35 = NPGetInternalQueue(-[NSPProxiedContentPath startConnectionForSessionTicketsWithEndpoint:parameters:dohQueryType:completionHandler:](self, "startConnectionForSessionTicketsWithEndpoint:parameters:dohQueryType:completionHandler:", endpoint, v15, 28, v49));
                v36 = objc_claimAutoreleasedReturnValue(v35);
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472;
                block[2] = sub_100015F48;
                block[3] = &unk_1000F59E0;
                block[4] = &buf;
                objc_copyWeak(&v48, &location);
                block[5] = v55;
                block[6] = v57;
                dispatch_group_notify(v34, v36, block);

                objc_destroyWeak(&v48);
                _Block_object_dispose(v55, 8);

                _Block_object_dispose(v57, 8);
                _Block_object_dispose(&buf, 8);

                objc_destroyWeak(&v60);
                objc_destroyWeak(&location);

              }
              else
              {
                v40 = nplog_obj(0, v16, v17);
                oslog = (os_log_t)objc_claimAutoreleasedReturnValue(v40);
                if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
                {
                  LODWORD(buf) = 136315138;
                  *(_QWORD *)((char *)&buf + 4) = "-[NSPProxiedContentPath fetchResumableSessionTickets]";
                  _os_log_fault_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_FAULT, "%s called with null proxyStack", (uint8_t *)&buf, 0xCu);
                }
              }

            }
            else
            {
              v39 = nplog_obj(0, v13, v14);
              stack = objc_claimAutoreleasedReturnValue(v39);
              if (os_log_type_enabled(stack, OS_LOG_TYPE_FAULT))
              {
                LODWORD(buf) = 136315138;
                *(_QWORD *)((char *)&buf + 4) = "-[NSPProxiedContentPath fetchResumableSessionTickets]";
                _os_log_fault_impl((void *)&_mh_execute_header, stack, OS_LOG_TYPE_FAULT, "%s called with null proxyParameters", (uint8_t *)&buf, 0xCu);
              }
            }

          }
          else
          {
            v38 = nplog_obj(0, v10, v11);
            v15 = objc_claimAutoreleasedReturnValue(v38);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            {
              LODWORD(buf) = 136315138;
              *(_QWORD *)((char *)&buf + 4) = "-[NSPProxiedContentPath fetchResumableSessionTickets]";
              _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "%s called with null proxyEndpoint", (uint8_t *)&buf, 0xCu);
            }
          }

        }
        else
        {
          v37 = nplog_obj(v7, v8, v9);
          endpoint = objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(endpoint, OS_LOG_TYPE_FAULT))
          {
            LODWORD(buf) = 136315138;
            *(_QWORD *)((char *)&buf + 4) = "-[NSPProxiedContentPath fetchResumableSessionTickets]";
            _os_log_fault_impl((void *)&_mh_execute_header, endpoint, OS_LOG_TYPE_FAULT, "%s called with null stack", (uint8_t *)&buf, 0xCu);
          }
        }

        v5 = v44;
      }

      v3 = selfa;
    }

  }
}

- (void)resetQUICProxyAgentForceUpdateDelegate:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSPPrivacyProxyProxiedContentNetworkRegistration *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  id v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD *v30;
  id *v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  id *v53;
  void *v54;
  char v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  uint64_t v63;
  void *v64;
  unsigned __int8 v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  NSObject *v72;
  NSObject *v73;
  char *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  unsigned __int8 v78;
  char *v79;
  uint64_t v80;
  char v81;
  id v82;
  _BOOL4 v83;
  char v84;
  int v85;
  _BOOL4 v86;
  id v87;
  id v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSPProxiedContentPath *v96;
  _QWORD *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  NSObject *v106;
  uint8_t buf[4];
  const char *v108;
  __int16 v109;
  int v110;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicAgentUUID](self, "quicAgentUUID"));

    if (!v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      -[NSPProxiedContentPath setQuicAgentUUID:](self, "setQuicAgentUUID:", v6);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicRegistration](self, "quicRegistration"));

    if (!v7)
    {
      v8 = [NSPPrivacyProxyProxiedContentNetworkRegistration alloc];
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicAgentUUID](self, "quicAgentUUID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath shortName](self, "shortName"));
      v11 = sub_1000468EC((id *)&v8->super.super.isa, v9, (uint64_t)v10, self);
      -[NSPProxiedContentPath setQuicRegistration:](self, "setQuicRegistration:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicRegistration](self, "quicRegistration"));
      if (!v12)
      {
        v80 = nplog_obj(v13, v14, v15);
        v106 = objc_claimAutoreleasedReturnValue(v80);
        if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v108 = "-[NSPProxiedContentPath resetQUICProxyAgentForceUpdateDelegate:]";
          _os_log_fault_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_FAULT, "%s called with null self.quicRegistration", buf, 0xCu);
        }
        goto LABEL_85;
      }
    }
    v16 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackAgentUUID](self, "fallbackAgentUUID"));
    if (v16)
    {
      v17 = (void *)v16;
      v18 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackRegistration](self, "fallbackRegistration"));
      if (!v18)
      {
        v99 = 0;
        v106 = 0;
        goto LABEL_10;
      }
      v19 = (void *)v18;
      v20 = objc_msgSend(*(id *)(v18 + 24), "isRegistered");

      if (v20)
      {
        v106 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackAgentUUID](self, "fallbackAgentUUID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackRegistration](self, "fallbackRegistration"));
        v21 = sub_1000435D4((uint64_t)v17);
        v99 = (void *)objc_claimAutoreleasedReturnValue(v21);
LABEL_10:

        goto LABEL_12;
      }
    }
    v99 = 0;
    v106 = 0;
LABEL_12:
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath delegate](self, "delegate"));
    v23 = objc_msgSend(v22, "disableDoHBootstrapResults");

    if (v23)
    {
      -[NSPProxiedContentPath setResolvedAddresses:](self, "setResolvedAddresses:", 0);
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolvedAddresses](self, "resolvedAddresses"));

      if (!v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath bootstrapAddresses](self, "bootstrapAddresses"));
        -[NSPProxiedContentPath setResolvedAddresses:](self, "setResolvedAddresses:", v25);

      }
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
    if (v26)
      v27 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
    else
      v27 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
    v28 = v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
    if (v29)
      v30 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
    else
      v30 = 0;

    v31 = (id *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicRegistration](self, "quicRegistration"));
    v32 = sub_1000435D4((uint64_t)v31);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    sub_100042890(v31, 4);
    if (v28)
      v34 = *(void **)(v28 + 24);
    else
      v34 = 0;
    v35 = v34;
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "proxyURL"));
    if (v30)
      v36 = (void *)v30[3];
    else
      v36 = 0;
    v37 = v36;
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "proxyURL"));
    if (v28)
      v38 = *(void **)(v28 + 24);
    else
      v38 = 0;
    v39 = v38;
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "proxyKeyInfos"));
    if (v30)
      v40 = (void *)v30[3];
    else
      v40 = 0;
    v41 = v40;
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "proxyKeyInfos"));
    if (v28)
      v42 = *(void **)(v28 + 24);
    else
      v42 = 0;
    v43 = v42;
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "proxyVersion"));
    if (v30)
      v44 = (void *)v30[3];
    else
      v44 = 0;
    v89 = v44;
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "proxyVersion"));
    if (v28)
      v45 = *(void **)(v28 + 24);
    else
      v45 = 0;
    v88 = v45;
    v85 = objc_msgSend(v88, "supportsResumption");
    if (v30)
      v46 = (void *)v30[3];
    else
      v46 = 0;
    v87 = v46;
    v84 = objc_msgSend(v87, "supportsResumption");
    v86 = sub_10000B9B4(v28);
    if (v86)
    {
      if (v28)
        v47 = *(void **)(v28 + 48);
      else
        v47 = 0;
      v98 = v47;
    }
    else
    {
      v98 = 0;
    }
    v83 = sub_10000B9B4((uint64_t)v30);
    if (v83)
    {
      if (v30)
        v48 = (void *)v30[6];
      else
        v48 = 0;
      v82 = v48;
    }
    else
    {
      v82 = 0;
    }
    v94 = v35;
    v92 = v39;
    if (v28)
      v49 = *(void **)(v28 + 24);
    else
      v49 = 0;
    v50 = v49;
    v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "tokenChallenge"));
    v52 = (void *)v51;
    v97 = (_QWORD *)v28;
    v95 = (void *)v33;
    v93 = v37;
    v90 = v43;
    v91 = v41;
    v53 = v31;
    if (v30)
      v54 = (void *)v30[3];
    else
      v54 = 0;
    v55 = v51 != 0;
    v56 = v54;
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "tokenChallenge"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolvedAddresses](self, "resolvedAddresses"));
    v96 = self;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath associatedMaps](self, "associatedMaps"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "firstObject"));
    sub_100046998(v53, v105, v104, v103, v102, v101, v100, v85, v84, v98, v82, v55, v57 != 0, v58, v106, v99, (char)objc_msgSend(v60, "isPrivacyProxy"));

    if (v83)
    if (v86)

    v61 = sub_1000435D4((uint64_t)v53);
    v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
    v63 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolver](v96, "resolver"));
    if (v63)
    {
      v64 = (void *)v63;
      v65 = objc_msgSend(v62, "isEqualToData:", v95);

      if ((v65 & 1) == 0)
        -[NSPProxiedContentPath unregisterResolverAgent](v96, "unregisterResolverAgent");
    }
    if (v97)
      v66 = (void *)v97[3];
    else
      v66 = 0;
    v67 = objc_msgSend(v66, "supportsResumption");
    if ((_DWORD)v67)
    {
      if (v53)
      {
        v67 = objc_msgSend(v53[3], "tokenCount");
        v70 = v67;
      }
      else
      {
        v70 = 0;
      }
      v71 = nplog_obj(v67, v68, v69);
      v72 = objc_claimAutoreleasedReturnValue(v71);
      v73 = v72;
      if (v70 > 3)
      {
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
        {
          v79 = (char *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath shortName](v96, "shortName"));
          *(_DWORD *)buf = 138412546;
          v108 = v79;
          v109 = 1024;
          v110 = v70;
          _os_log_debug_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEBUG, "proxied content path [%@] has %u tickets, not fetching more", buf, 0x12u);

        }
      }
      else
      {
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          v74 = (char *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath shortName](v96, "shortName"));
          *(_DWORD *)buf = 138412546;
          v108 = v74;
          v109 = 1024;
          v110 = v70;
          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "proxied content path [%@] has %u tickets, fetching more", buf, 0x12u);

        }
        -[NSPProxiedContentPath fetchResumableSessionTickets](v96, "fetchResumableSessionTickets");
      }
    }
    if (!v53 || !objc_msgSend(v53[3], "isRegistered"))
      goto LABEL_84;
    v75 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolver](v96, "resolver"));
    if (v75)
    {
      v76 = (void *)v75;
      v77 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](v96, "resolverRegistration"));
      if ((objc_msgSend(v77, "isRegistered") & 1) == 0)
      {

LABEL_83:
        goto LABEL_84;
      }
      if ((v81 & 1) != 0)
      {

      }
      else
      {
        v78 = -[NSPProxiedContentPath proxiedContentAgentRegistered](v96, "proxiedContentAgentRegistered");

        if ((v78 & 1) != 0)
        {
LABEL_84:

LABEL_85:
          return;
        }
      }
    }
    else if ((v81 & 1) == 0
           && -[NSPProxiedContentPath proxiedContentAgentRegistered](v96, "proxiedContentAgentRegistered"))
    {
      goto LABEL_84;
    }
    -[NSPProxiedContentPath setProxiedContentAgentRegistered:](v96, "setProxiedContentAgentRegistered:", 1);
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath delegate](v96, "delegate"));
    objc_msgSend(v76, "proxiedContentAgentRegistered:", v96);
    goto LABEL_83;
  }
}

- (void)resetFallbackProxyAgent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSPPrivacyProxyProxiedContentFallbackNetworkRegistration *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  id v51;
  void *v52;
  _BOOL4 v53;
  char v54;
  int v55;
  _BOOL4 v56;
  id v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD *v70;
  uint8_t buf[4];
  const char *v72;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));

  if (v3 && -[NSPProxiedContentPath allowFallback](self, "allowFallback"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackAgentUUID](self, "fallbackAgentUUID"));

    if (!v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      -[NSPProxiedContentPath setFallbackAgentUUID:](self, "setFallbackAgentUUID:", v5);

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackRegistration](self, "fallbackRegistration"));

    if (v6)
      goto LABEL_7;
    v7 = [NSPPrivacyProxyProxiedContentFallbackNetworkRegistration alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackAgentUUID](self, "fallbackAgentUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath shortName](self, "shortName"));
    v10 = sub_100047448((id *)&v7->super.super.isa, v8, (uint64_t)v9, self);
    -[NSPProxiedContentPath setFallbackRegistration:](self, "setFallbackRegistration:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackRegistration](self, "fallbackRegistration"));
    if (v11)
    {
LABEL_7:
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
      if (v15)
        v16 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
      else
        v16 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
      v70 = (_QWORD *)v16;

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath ingressProxy](self, "ingressProxy"));
      if (v17)
        v18 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath egressProxy](self, "egressProxy"));
      else
        v18 = 0;

      v19 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackRegistration](self, "fallbackRegistration"));
      if (v70)
        v20 = (void *)v70[3];
      else
        v20 = 0;
      v21 = v20;
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "tcpProxyFqdn"));
      if (v18)
        v23 = (void *)v18[3];
      else
        v23 = 0;
      v24 = v23;
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "tcpProxyFqdn"));
      if (v70)
        v26 = (void *)v70[3];
      else
        v26 = 0;
      v27 = v26;
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "proxyKeyInfos"));
      if (v18)
        v29 = (void *)v18[3];
      else
        v29 = 0;
      v30 = v29;
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "proxyKeyInfos"));
      if (v70)
        v31 = (void *)v70[3];
      else
        v31 = 0;
      v60 = v31;
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "proxyVersion"));
      if (v18)
        v32 = (void *)v18[3];
      else
        v32 = 0;
      v59 = v32;
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "proxyVersion"));
      if (v70)
        v33 = (void *)v70[3];
      else
        v33 = 0;
      v58 = v33;
      v55 = objc_msgSend(v58, "supportsResumption");
      if (v18)
        v34 = (void *)v18[3];
      else
        v34 = 0;
      v57 = v34;
      v54 = objc_msgSend(v57, "supportsResumption");
      v56 = sub_10000B9B4((uint64_t)v70);
      if (v56)
      {
        if (v70)
          v35 = (void *)v70[6];
        else
          v35 = 0;
        v66 = v35;
      }
      else
      {
        v66 = 0;
      }
      v53 = sub_10000B9B4((uint64_t)v18);
      if (v53)
      {
        if (v18)
          v36 = (void *)v18[6];
        else
          v36 = 0;
        v37 = v36;
      }
      else
      {
        v37 = 0;
      }
      v63 = v27;
      v52 = v37;
      if (v70)
        v38 = (void *)v70[3];
      else
        v38 = 0;
      v51 = v38;
      v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "tokenChallenge"));
      v40 = (void *)v39;
      v65 = v21;
      v64 = (void *)v25;
      v61 = v30;
      v62 = (void *)v28;
      v41 = (void *)v22;
      v42 = (void *)v19;
      if (v18)
        v43 = (void *)v18[3];
      else
        v43 = 0;
      v44 = v39 != 0;
      v45 = v43;
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "tokenChallenge"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath associatedMaps](self, "associatedMaps"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "firstObject"));
      sub_1000474F4((uint64_t)v42, v41, v64, v62, v69, v68, v67, v55, v54, v66, v52, v44, v46 != 0, (char)objc_msgSend(v48, "isPrivacyProxy"));

      if (v53)
      if (v56)

    }
    else
    {
      v49 = nplog_obj(v12, v13, v14);
      v50 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v72 = "-[NSPProxiedContentPath resetFallbackProxyAgent]";
        _os_log_fault_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_FAULT, "%s called with null self.fallbackRegistration", buf, 0xCu);
      }

    }
  }
}

- (void)resetResolverAgentForceUpdateDelegate:(BOOL)a3
{
  uint64_t v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSPPrivacyProxyDNSAgent *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  unsigned __int8 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  void *v71;
  void *v72;
  unsigned __int8 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  void *v79;
  uint64_t v80;
  NSObject *v81;
  void *v82;
  void *v83;
  unsigned __int8 v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  unsigned int v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  int *v102;
  char *v103;
  uint64_t v104;
  NSObject *v105;
  uint64_t v106;
  void *v107;
  unsigned __int8 v108;
  void *v109;
  void *v110;
  uint64_t v111;
  _QWORD v112[5];
  _QWORD v113[6];
  uint8_t v114[4];
  NSPProxiedContentPath *v115;
  __int16 v116;
  void *v117;
  __int16 v118;
  char *v119;
  _BYTE buf[24];
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolver](self, "resolver"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));

    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      -[NSPProxiedContentPath setResolverAgentUUID:](self, "setResolverAgentUUID:", v8);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));

    if (!v9)
    {
      v10 = objc_msgSend(objc_alloc((Class)NWNetworkAgentRegistration), "initWithNetworkAgentClass:", objc_opt_class(NSPPrivacyProxyDNSAgent));
      -[NSPProxiedContentPath setResolverRegistration:](self, "setResolverRegistration:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
      if (!v11)
      {
        v111 = nplog_obj(v12, v13, v14);
        v15 = (NSPPrivacyProxyDNSAgent *)objc_claimAutoreleasedReturnValue(v111);
        if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[NSPProxiedContentPath resetResolverAgentForceUpdateDelegate:]";
          _os_log_fault_impl((void *)&_mh_execute_header, &v15->super, OS_LOG_TYPE_FAULT, "%s called with null self.resolverRegistration", buf, 0xCu);
        }
        goto LABEL_59;
      }
    }
    v15 = -[NSPPrivacyProxyDNSAgent initWithDelegate:]([NSPPrivacyProxyDNSAgent alloc], "initWithDelegate:", self);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolver](self, "resolver"));
    -[NSPPrivacyProxyDNSAgent setResolver:](v15, "setResolver:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
    -[NSPPrivacyProxyDNSAgent setAgentUUID:](v15, "setAgentUUID:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolver](self, "resolver"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dohURL"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v19));

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "host"));
    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "host"));
      -[NSPPrivacyProxyDNSAgent setAgentDescription:](v15, "setAgentDescription:", v22);
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolver](self, "resolver"));
      v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dohURL"));
      -[NSPPrivacyProxyDNSAgent setAgentDescription:](v15, "setAgentDescription:", v3);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicAgentUUID](self, "quicAgentUUID"));
    -[NSPPrivacyProxyDNSAgent setProxyAgentUUID:](v15, "setProxyAgentUUID:", v23);

    v27 = nplog_obj(v24, v25, v26);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyDNSAgent resolver](v15, "resolver"));
      v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "dohURL"));
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v3;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%@ setting up resolver agent to %{public}@", buf, 0x16u);

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
    v31 = objc_msgSend(v30, "isRegistered");

    if (v31)
    {
      v35 = nplog_obj(v32, v33, v34);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%@ updating resolver agent with UUID %@", buf, 0x16u);

      }
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
      v39 = objc_msgSend(v38, "updateNetworkAgent:", v15);

      if ((v39 & 1) == 0)
      {
        v43 = nplog_obj(v40, v41, v42);
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v109 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v109;
          _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%@: failed to update the registered resolver agent [%@]", buf, 0x16u);

        }
      }
      goto LABEL_58;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v121 = sub_1000030EC;
    v122 = sub_10000C20C;
    v123 = 0;
    v45 = nplog_obj(v32, v33, v34);
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
      *(_DWORD *)v114 = 138412546;
      v115 = self;
      v116 = 2112;
      v117 = v47;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "%@ looking for resolver agent registration file handle with agent UUID %@", v114, 0x16u);

    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](NEFileHandleMaintainer, "sharedMaintainer"));
    v113[0] = _NSConcreteStackBlock;
    v113[1] = 3221225472;
    v113[2] = sub_100017B24;
    v113[3] = &unk_1000F52F8;
    v113[4] = self;
    v113[5] = buf;
    objc_msgSend(v48, "iterateFileHandlesWithBlock:", v113);

    v51 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v51)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "handle"));
      v53 = dup((int)objc_msgSend(v52, "fileDescriptor"));

      if ((v53 & 0x80000000) != 0)
      {
        v100 = nplog_obj(v54, v55, v56);
        v78 = objc_claimAutoreleasedReturnValue(v100);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        {
          v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "agentUUID"));
          v102 = __error();
          v103 = strerror(*v102);
          *(_DWORD *)v114 = 138412802;
          v115 = self;
          v116 = 2112;
          v117 = v101;
          v118 = 2080;
          v119 = v103;
          _os_log_error_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "%@: failed to dup the resolver agent registration file handle [%@], error: %s", v114, 0x20u);

        }
        goto LABEL_56;
      }
      v57 = nplog_obj(v54, v55, v56);
      v58 = objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "agentUUID"));
        *(_DWORD *)v114 = 138412546;
        v115 = self;
        v116 = 2112;
        v117 = v59;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%@: re-using existing resolver agent registration file handle [%@]", v114, 0x16u);

      }
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
      v3 = (uint64_t)objc_msgSend(v60, "setRegisteredNetworkAgent:fileDescriptor:", v15, v53);

      if ((v3 & 1) == 0)
      {
        v104 = nplog_obj(v61, v62, v63);
        v105 = objc_claimAutoreleasedReturnValue(v104);
        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        {
          v110 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
          *(_DWORD *)v114 = 138412546;
          v115 = self;
          v116 = 2112;
          v117 = v110;
          _os_log_error_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_ERROR, "%@: failed to set the registered resolver agent [%@]", v114, 0x16u);

        }
        close(v53);
        goto LABEL_57;
      }
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
      v65 = objc_msgSend(v64, "isRegistered");

      if (v65)
      {
        v69 = nplog_obj(v66, v67, v68);
        v70 = objc_claimAutoreleasedReturnValue(v69);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
        {
          v71 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
          *(_DWORD *)v114 = 138412546;
          v115 = self;
          v116 = 2112;
          v117 = v71;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "%@ updating registered DNS network agent [%@]", v114, 0x16u);

        }
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
        v73 = objc_msgSend(v72, "updateNetworkAgent:", v15);

        if ((v73 & 1) == 0)
        {
          v77 = nplog_obj(v74, v75, v76);
          v78 = objc_claimAutoreleasedReturnValue(v77);
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            v79 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
            *(_DWORD *)v114 = 138412546;
            v115 = self;
            v116 = 2112;
            v117 = v79;
            _os_log_error_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "%@: failed to update the registered DNS network agent [%@]", v114, 0x16u);

          }
          goto LABEL_56;
        }
      }
    }
    else
    {
      v80 = nplog_obj(0, v49, v50);
      v81 = objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        v82 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
        *(_DWORD *)v114 = 138412546;
        v115 = self;
        v116 = 2112;
        v117 = v82;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "%@ registering DNS network agent [%@]", v114, 0x16u);

      }
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
      v84 = objc_msgSend(v83, "registerNetworkAgent:", v15);

      if ((v84 & 1) == 0)
      {
        v106 = nplog_obj(v85, v86, v87);
        v78 = objc_claimAutoreleasedReturnValue(v106);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        {
          v107 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
          *(_DWORD *)v114 = 138412546;
          v115 = self;
          v116 = 2112;
          v117 = v107;
          _os_log_error_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "%@: failed to register DNS network agent [%@]", v114, 0x16u);

        }
        goto LABEL_56;
      }
      v88 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
      v89 = objc_msgSend(v88, "isRegistered");

      if (v89)
      {
        v3 = (uint64_t)objc_alloc((Class)NENetworkAgentRegistrationFileHandle);
        v90 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
        v91 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
        v92 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
        v93 = objc_msgSend((id)v3, "initWithNetworkAgentRegistration:sessionType:configurationIdentifier:agentUUID:", v90, &off_1000FF1E8, v91, v92);
        v94 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v93;

        v95 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](NEFileHandleMaintainer, "sharedMaintainer"));
        v96 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        v112[0] = _NSConcreteStackBlock;
        v112[1] = 3221225472;
        v112[2] = sub_100017C14;
        v112[3] = &unk_1000F5370;
        v112[4] = self;
        objc_msgSend(v95, "setFileHandle:matchingPredicate:", v96, v112);

        v97 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](NEFileHandleMaintainer, "sharedMaintainer"));
        objc_msgSend(v97, "commit");

      }
    }
    v78 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
    if (-[NSObject isRegistered](v78, "isRegistered"))
    {
      v98 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicRegistration](self, "quicRegistration"));
      if (!v98)
      {
        if (a3)
          goto LABEL_50;
        goto LABEL_51;
      }
      v99 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicRegistration](self, "quicRegistration"));
      v3 = v99;
      if (v99 && (objc_msgSend(*(id *)(v99 + 24), "isRegistered") & 1) != 0)
      {
        if (a3)
        {

LABEL_50:
LABEL_55:
          -[NSPProxiedContentPath setProxiedContentAgentRegistered:](self, "setProxiedContentAgentRegistered:", 1);
          v78 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath delegate](self, "delegate"));
          -[NSObject proxiedContentAgentRegistered:](v78, "proxiedContentAgentRegistered:", self);
          goto LABEL_56;
        }
LABEL_51:
        v108 = -[NSPProxiedContentPath proxiedContentAgentRegistered](self, "proxiedContentAgentRegistered");
        if (v98)
        {

        }
        if ((v108 & 1) != 0)
          goto LABEL_57;
        goto LABEL_55;
      }

    }
LABEL_56:

LABEL_57:
    _Block_object_dispose(buf, 8);

LABEL_58:
LABEL_59:

  }
}

- (void)setupProxyAgentsForceUpdateDelegate:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[NSPProxiedContentPath pathReady](self, "pathReady"))
  {
    -[NSPProxiedContentPath resetFallbackProxyAgent](self, "resetFallbackProxyAgent");
    -[NSPProxiedContentPath resetQUICProxyAgentForceUpdateDelegate:](self, "resetQUICProxyAgentForceUpdateDelegate:", v3);
    -[NSPProxiedContentPath resetResolverAgentForceUpdateDelegate:](self, "resetResolverAgentForceUpdateDelegate:", v3);
  }
}

- (BOOL)unregisterResolverAgent
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  uint8_t buf[4];
  NSPProxiedContentPath *v21;
  __int16 v22;
  void *v23;

  v3 = objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
  if (!v3)
    return 1;
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));

  if (!v5)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
  v7 = objc_msgSend(v6, "isRegistered");

  if (!v7)
    return 1;
  v11 = nplog_obj(v8, v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverAgentUUID](self, "resolverAgentUUID"));
    *(_DWORD *)buf = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ un-registering resolver agent with UUID %@", buf, 0x16u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath resolverRegistration](self, "resolverRegistration"));
  v15 = objc_msgSend(v14, "unregisterNetworkAgent");

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](NEFileHandleMaintainer, "sharedMaintainer"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100017ED4;
  v19[3] = &unk_1000F5370;
  v19[4] = self;
  objc_msgSend(v16, "removeFileHandleMatchingPredicate:", v19);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](NEFileHandleMaintainer, "sharedMaintainer"));
  objc_msgSend(v17, "commit");

  return v15;
}

- (void)removeProxyAgents
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath quicRegistration](self, "quicRegistration"));
  sub_100043354((uint64_t)v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath fallbackRegistration](self, "fallbackRegistration"));
  sub_100043354((uint64_t)v4);

  -[NSPProxiedContentPath unregisterResolverAgent](self, "unregisterResolverAgent");
  if (-[NSPProxiedContentPath proxiedContentAgentRegistered](self, "proxiedContentAgentRegistered"))
  {
    -[NSPProxiedContentPath setProxiedContentAgentRegistered:](self, "setProxiedContentAgentRegistered:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxiedContentPath delegate](self, "delegate"));
    objc_msgSend(v5, "proxiedContentAgentUnregistered:", self);

  }
  -[NSPProxiedContentPath setQuicAgentUUID:](self, "setQuicAgentUUID:", 0);
  -[NSPProxiedContentPath setFallbackAgentUUID:](self, "setFallbackAgentUUID:", 0);
  -[NSPProxiedContentPath setResolverAgentUUID:](self, "setResolverAgentUUID:", 0);
  -[NSPProxiedContentPath setQuicRegistration:](self, "setQuicRegistration:", 0);
  -[NSPProxiedContentPath setFallbackRegistration:](self, "setFallbackRegistration:", 0);
  -[NSPProxiedContentPath setResolverRegistration:](self, "setResolverRegistration:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[NSPProxiedContentPath removeProxyAgents](self, "removeProxyAgents");
  v3.receiver = self;
  v3.super_class = (Class)NSPProxiedContentPath;
  -[NSPProxiedContentPath dealloc](&v3, "dealloc");
}

- (NSPProxiedContentPathDelegate)delegate
{
  return (NSPProxiedContentPathDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)associatedMaps
{
  return self->_associatedMaps;
}

- (void)setAssociatedMaps:(id)a3
{
  objc_storeStrong((id *)&self->_associatedMaps, a3);
}

- (NSPProxyTokenInfo)ingressProxy
{
  return self->_ingressProxy;
}

- (void)setIngressProxy:(id)a3
{
  objc_storeStrong((id *)&self->_ingressProxy, a3);
}

- (NSPProxyTokenInfo)egressProxy
{
  return self->_egressProxy;
}

- (void)setEgressProxy:(id)a3
{
  objc_storeStrong((id *)&self->_egressProxy, a3);
}

- (NSPPrivacyProxyResolverInfo)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)a3
{
  objc_storeStrong((id *)&self->_resolver, a3);
}

- (NSUUID)quicAgentUUID
{
  return self->_quicAgentUUID;
}

- (void)setQuicAgentUUID:(id)a3
{
  objc_storeStrong((id *)&self->_quicAgentUUID, a3);
}

- (NSUUID)fallbackAgentUUID
{
  return self->_fallbackAgentUUID;
}

- (void)setFallbackAgentUUID:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackAgentUUID, a3);
}

- (NSUUID)resolverAgentUUID
{
  return self->_resolverAgentUUID;
}

- (void)setResolverAgentUUID:(id)a3
{
  objc_storeStrong((id *)&self->_resolverAgentUUID, a3);
}

- (NSPPrivacyProxyNetworkRegistration)quicRegistration
{
  return self->_quicRegistration;
}

- (void)setQuicRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_quicRegistration, a3);
}

- (NSPPrivacyProxyNetworkRegistration)fallbackRegistration
{
  return self->_fallbackRegistration;
}

- (void)setFallbackRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackRegistration, a3);
}

- (NWNetworkAgentRegistration)resolverRegistration
{
  return self->_resolverRegistration;
}

- (void)setResolverRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_resolverRegistration, a3);
}

- (BOOL)fetchingSessionTickets
{
  return self->_fetchingSessionTickets;
}

- (void)setFetchingSessionTickets:(BOOL)a3
{
  self->_fetchingSessionTickets = a3;
}

- (BOOL)proxiedContentAgentRegistered
{
  return self->_proxiedContentAgentRegistered;
}

- (void)setProxiedContentAgentRegistered:(BOOL)a3
{
  self->_proxiedContentAgentRegistered = a3;
}

- (NSArray)resolvedAddresses
{
  return self->_resolvedAddresses;
}

- (void)setResolvedAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedAddresses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedAddresses, 0);
  objc_storeStrong((id *)&self->_resolverRegistration, 0);
  objc_storeStrong((id *)&self->_fallbackRegistration, 0);
  objc_storeStrong((id *)&self->_quicRegistration, 0);
  objc_storeStrong((id *)&self->_resolverAgentUUID, 0);
  objc_storeStrong((id *)&self->_fallbackAgentUUID, 0);
  objc_storeStrong((id *)&self->_quicAgentUUID, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_egressProxy, 0);
  objc_storeStrong((id *)&self->_ingressProxy, 0);
  objc_storeStrong((id *)&self->_associatedMaps, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
