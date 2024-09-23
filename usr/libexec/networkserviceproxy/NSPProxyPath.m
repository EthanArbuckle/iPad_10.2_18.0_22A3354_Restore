@implementation NSPProxyPath

- (NSPProxyPath)initWithDelegate:(id)a3 ingressProxy:(id)a4 egressProxy:(id)a5 proxyPathWeight:(unint64_t)a6 allowFallback:(BOOL)a7 fallbackToQUIC:(BOOL)a8 forceFallback:(BOOL)a9 allowFailOpen:(BOOL)a10 geohashSharingEnabled:(BOOL)a11 configEpoch:(id)a12 networkCharacteristics:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSPProxyPath *v25;
  NSPProxyPath *v26;
  NSPProxyAgentNetworkStatistics *v27;
  NSPProxyAgentNetworkStatistics *networkSingleHopAgentStatistics;
  NSPProxyAgentNetworkStatistics *v29;
  NSPProxyAgentNetworkStatistics *networkMultiHopAgentStatistics;
  NSPProxyPath *v31;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  id v38;
  objc_super v39;
  uint8_t buf[4];
  const char *v41;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v38 = a12;
  v21 = a13;
  v24 = v21;
  if (!v19)
  {
    v33 = nplog_obj(v21, v22, v23);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      v31 = 0;
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136315138;
    v41 = "-[NSPProxyPath initWithDelegate:ingressProxy:egressProxy:proxyPathWeight:allowFallback:fallbackToQUIC:forceFal"
          "lback:allowFailOpen:geohashSharingEnabled:configEpoch:networkCharacteristics:]";
    v35 = "%s called with null ingressProxy";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, v35, buf, 0xCu);
    goto LABEL_10;
  }
  if (!v20)
  {
    v36 = nplog_obj(v21, v22, v23);
    v34 = objc_claimAutoreleasedReturnValue(v36);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      goto LABEL_10;
    *(_DWORD *)buf = 136315138;
    v41 = "-[NSPProxyPath initWithDelegate:ingressProxy:egressProxy:proxyPathWeight:allowFallback:fallbackToQUIC:forceFal"
          "lback:allowFailOpen:geohashSharingEnabled:configEpoch:networkCharacteristics:]";
    v35 = "%s called with null egressProxy";
    goto LABEL_12;
  }
  v39.receiver = self;
  v39.super_class = (Class)NSPProxyPath;
  v25 = -[NSPProxyPath init](&v39, "init");
  v26 = v25;
  if (v25)
  {
    objc_storeWeak((id *)&v25->_delegate, v18);
    objc_storeStrong((id *)&v26->_ingressProxy, a4);
    objc_storeStrong((id *)&v26->_egressProxy, a5);
    v26->_proxyPathWeight = a6;
    v26->_allowFallback = a7;
    v26->_fallbackToQUIC = a8;
    v26->_forceFallback = a9;
    v26->_allowFailOpen = a10;
    v26->_geohashSharingEnabled = a11;
    objc_storeStrong((id *)&v26->_configEpoch, a12);
    v27 = objc_alloc_init(NSPProxyAgentNetworkStatistics);
    networkSingleHopAgentStatistics = v26->_networkSingleHopAgentStatistics;
    v26->_networkSingleHopAgentStatistics = v27;

    v29 = objc_alloc_init(NSPProxyAgentNetworkStatistics);
    networkMultiHopAgentStatistics = v26->_networkMultiHopAgentStatistics;
    v26->_networkMultiHopAgentStatistics = v29;

    sub_100010990((uint64_t)v26->_networkMultiHopAgentStatistics, v24);
    sub_100010990((uint64_t)v26->_networkSingleHopAgentStatistics, v24);
  }
  self = v26;
  v31 = self;
LABEL_6:

  return v31;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithCapacity:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  sub_1000418A4(v7, v8, CFSTR("Ingress proxy"), a3, a4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  sub_1000418A4(v7, v9, CFSTR("Egress proxy"), a3, a4);

  sub_1000420E0(v7, -[NSPProxyPath allowFallback](self, "allowFallback"), (uint64_t)CFSTR("Allow fallback"), a3, a4);
  sub_1000420E0(v7, -[NSPProxyPath fallbackToQUIC](self, "fallbackToQUIC"), (uint64_t)CFSTR("Fallback to QUIC"), a3, a4);
  sub_1000420E0(v7, -[NSPProxyPath allowFailOpen](self, "allowFailOpen"), (uint64_t)CFSTR("Allow fail open"), a3, a4);
  sub_1000420E0(v7, -[NSPProxyPath geohashSharingEnabled](self, "geohashSharingEnabled"), (uint64_t)CFSTR("Geohash Sharing Enabled"), a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath configEpoch](self, "configEpoch"));
  sub_1000418A4(v7, v10, CFSTR("Config Epoch"), a3, a4);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath nonDefaultAgentUUID](self, "nonDefaultAgentUUID"));
  sub_1000418A4(v7, v11, CFSTR("Agent UUID"), a3, a4);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self, "networkSingleHopAgentStatistics"));
  sub_1000418A4(v7, v12, CFSTR("Single hop statistics"), a3, a4);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self, "networkMultiHopAgentStatistics"));
  sub_1000418A4(v7, v13, CFSTR("Multi hop statistics"), a3, a4);

  return v7;
}

- (NSString)description
{
  return (NSString *)-[NSPProxyPath descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPProxyPath)initWithCoder:(id)a3
{
  id v4;
  NSPProxyPath *v5;
  id v6;
  uint64_t v7;
  NSPProxyTokenInfo *ingressProxy;
  id v9;
  uint64_t v10;
  NSPProxyTokenInfo *egressProxy;
  id v12;
  uint64_t v13;
  NSNumber *configEpoch;
  id v15;
  uint64_t v16;
  NSUUID *nonDefaultAgentUUID;
  id v18;
  uint64_t v19;
  NSPProxyAgentNetworkStatistics *networkSingleHopAgentStatistics;
  id v21;
  uint64_t v22;
  NSPProxyAgentNetworkStatistics *networkMultiHopAgentStatistics;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NSPProxyPath;
  v5 = -[NSPProxyPath init](&v25, "init");
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

    v5->_proxyPathWeight = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("proxyPathWeight"));
    v5->_allowFallback = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proxyPathAllowFallback"));
    v5->_fallbackToQUIC = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proxyPathFallbackToQUIC"));
    v5->_forceFallback = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proxyPathForceFallback"));
    v5->_allowFailOpen = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proxyPathAllowFailOpen"));
    v5->_geohashSharingEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proxyPathGeohashSharingEnabled"));
    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("proxyPathConfigEpoch"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    configEpoch = v5->_configEpoch;
    v5->_configEpoch = (NSNumber *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("proxyPathAgentUUID"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    nonDefaultAgentUUID = v5->_nonDefaultAgentUUID;
    v5->_nonDefaultAgentUUID = (NSUUID *)v16;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSPProxyAgentNetworkStatistics), CFSTR("proxyPathSingleHopAgentStatistics"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    networkSingleHopAgentStatistics = v5->_networkSingleHopAgentStatistics;
    v5->_networkSingleHopAgentStatistics = (NSPProxyAgentNetworkStatistics *)v19;

    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSPProxyAgentNetworkStatistics), CFSTR("proxyPathMultipleHopAgentStatistics"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    networkMultiHopAgentStatistics = v5->_networkMultiHopAgentStatistics;
    v5->_networkMultiHopAgentStatistics = (NSPProxyAgentNetworkStatistics *)v22;

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
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("proxyPathIngressProxy"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("proxyPathEgressProxy"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[NSPProxyPath proxyPathWeight](self, "proxyPathWeight"), CFSTR("proxyPathWeight"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NSPProxyPath allowFallback](self, "allowFallback"), CFSTR("proxyPathAllowFallback"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NSPProxyPath fallbackToQUIC](self, "fallbackToQUIC"), CFSTR("proxyPathFallbackToQUIC"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NSPProxyPath forceFallback](self, "forceFallback"), CFSTR("proxyPathForceFallback"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NSPProxyPath allowFailOpen](self, "allowFailOpen"), CFSTR("proxyPathAllowFailOpen"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NSPProxyPath geohashSharingEnabled](self, "geohashSharingEnabled"), CFSTR("proxyPathGeohashSharingEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath configEpoch](self, "configEpoch"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("proxyPathConfigEpoch"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath nonDefaultAgentUUID](self, "nonDefaultAgentUUID"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("proxyPathAgentUUID"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self, "networkSingleHopAgentStatistics"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("proxyPathSingleHopAgentStatistics"));

  v10 = (id)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self, "networkMultiHopAgentStatistics"));
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("proxyPathMultipleHopAgentStatistics"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NSPProxyPath *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = -[NSPProxyPath init](+[NSPProxyPath allocWithZone:](NSPProxyPath, "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
  -[NSPProxyPath setDelegate:](v4, "setDelegate:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  -[NSPProxyPath setIngressProxy:](v4, "setIngressProxy:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  -[NSPProxyPath setEgressProxy:](v4, "setEgressProxy:", v7);

  -[NSPProxyPath setProxyPathWeight:](v4, "setProxyPathWeight:", -[NSPProxyPath proxyPathWeight](self, "proxyPathWeight"));
  -[NSPProxyPath setAllowFallback:](v4, "setAllowFallback:", -[NSPProxyPath allowFallback](self, "allowFallback"));
  -[NSPProxyPath setFallbackToQUIC:](v4, "setFallbackToQUIC:", -[NSPProxyPath fallbackToQUIC](self, "fallbackToQUIC"));
  -[NSPProxyPath setForceFallback:](v4, "setForceFallback:", -[NSPProxyPath forceFallback](self, "forceFallback"));
  -[NSPProxyPath setAllowFailOpen:](v4, "setAllowFailOpen:", -[NSPProxyPath allowFailOpen](self, "allowFailOpen"));
  -[NSPProxyPath setGeohashSharingEnabled:](v4, "setGeohashSharingEnabled:", -[NSPProxyPath geohashSharingEnabled](self, "geohashSharingEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath configEpoch](self, "configEpoch"));
  -[NSPProxyPath setConfigEpoch:](v4, "setConfigEpoch:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath nonDefaultAgentUUID](self, "nonDefaultAgentUUID"));
  -[NSPProxyPath setNonDefaultAgentUUID:](v4, "setNonDefaultAgentUUID:", v9);

  -[NSPProxyPath setSingleHopRegistered:](v4, "setSingleHopRegistered:", -[NSPProxyPath singleHopRegistered](self, "singleHopRegistered"));
  -[NSPProxyPath setMultiHopRegistered:](v4, "setMultiHopRegistered:", -[NSPProxyPath multiHopRegistered](self, "multiHopRegistered"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
  -[NSPProxyPath setSingleHopRegistration:](v4, "setSingleHopRegistration:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
  -[NSPProxyPath setMultiHopRegistration:](v4, "setMultiHopRegistration:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self, "networkSingleHopAgentStatistics"));
  -[NSPProxyPath setNetworkSingleHopAgentStatistics:](v4, "setNetworkSingleHopAgentStatistics:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self, "networkMultiHopAgentStatistics"));
  -[NSPProxyPath setNetworkMultiHopAgentStatistics:](v4, "setNetworkMultiHopAgentStatistics:", v13);

  return v4;
}

- (void)setupSingleHopProxyRegistrations
{
  __assert_rtn("-[NSPProxyPath setupSingleHopProxyRegistrations]", "NSPPrivacyProxyAgentManager.m", 2837, "0");
}

- (void)setupMultiHopProxyRegistrations
{
  __assert_rtn("-[NSPProxyPath setupMultiHopProxyRegistrations]", "NSPPrivacyProxyAgentManager.m", 2842, "0");
}

- (void)resetSingleHopProxyAgent
{
  __assert_rtn("-[NSPProxyPath resetSingleHopProxyAgent]", "NSPPrivacyProxyAgentManager.m", 2847, "0");
}

- (void)resetMultiHopProxyAgent
{
  __assert_rtn("-[NSPProxyPath resetMultiHopProxyAgent]", "NSPPrivacyProxyAgentManager.m", 2852, "0");
}

- (BOOL)isMultiHopRegistered
{
  uint64_t v2;
  void *v3;
  unsigned __int8 v4;

  v2 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
  v3 = (void *)v2;
  if (v2)
    v4 = objc_msgSend(*(id *)(v2 + 24), "isRegistered");
  else
    v4 = 0;

  return v4;
}

- (BOOL)isSingleHopRegistered
{
  uint64_t v2;
  void *v3;
  unsigned __int8 v4;

  v2 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
  v3 = (void *)v2;
  if (v2)
    v4 = objc_msgSend(*(id *)(v2 + 24), "isRegistered");
  else
    v4 = 0;

  return v4;
}

- (void)updateIngressProxy:(id)a3 egressProxy:(id)a4 proxyPathWeight:(unint64_t)a5
{
  id v8;

  v8 = a4;
  -[NSPProxyPath setIngressProxy:](self, "setIngressProxy:", a3);
  -[NSPProxyPath setEgressProxy:](self, "setEgressProxy:", v8);

  -[NSPProxyPath setProxyPathWeight:](self, "setProxyPathWeight:", a5);
  -[NSPProxyPath resetSingleHopProxyAgent](self, "resetSingleHopProxyAgent");
  -[NSPProxyPath resetMultiHopProxyAgent](self, "resetMultiHopProxyAgent");
}

- (void)enableFailOpen:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[NSPProxyPath allowFailOpen](self, "allowFailOpen") != a3)
  {
    -[NSPProxyPath setAllowFailOpen:](self, "setAllowFailOpen:", v3);
    -[NSPProxyPath resetSingleHopProxyAgent](self, "resetSingleHopProxyAgent");
    -[NSPProxyPath resetMultiHopProxyAgent](self, "resetMultiHopProxyAgent");
  }
}

- (void)updateGeohashSharing:(BOOL)a3
{
  -[NSPProxyPath setGeohashSharingEnabled:](self, "setGeohashSharingEnabled:", a3);
  -[NSPProxyPath resetMultiHopProxyAgent](self, "resetMultiHopProxyAgent");
}

- (void)updateConfigEpoch:(id)a3
{
  -[NSPProxyPath setConfigEpoch:](self, "setConfigEpoch:", a3);
  -[NSPProxyPath resetSingleHopProxyAgent](self, "resetSingleHopProxyAgent");
  -[NSPProxyPath resetMultiHopProxyAgent](self, "resetMultiHopProxyAgent");
}

- (BOOL)proxyPathIsValid:(id)a3 proxyPathList:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __assert_rtn("-[NSPProxyPath proxyPathIsValid:proxyPathList:]", "NSPPrivacyProxyAgentManager.m", 2902, "0");
}

- (BOOL)matchIngress:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  int v23;
  const char *v24;

  v6 = (id *)a3;
  if (!v6)
  {
    v19 = nplog_obj(0, v4, v5);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      v17 = 0;
      goto LABEL_6;
    }
    v23 = 136315138;
    v24 = "-[NSPProxyPath matchIngress:]";
    v21 = "%s called with null proxyTokenInfo";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, v21, (uint8_t *)&v23, 0xCu);
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));

  if (!v7)
  {
    v22 = nplog_obj(v8, v9, v10);
    v20 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      goto LABEL_10;
    v23 = 136315138;
    v24 = "-[NSPProxyPath matchIngress:]";
    v21 = "%s called with null self.ingressProxy";
    goto LABEL_12;
  }
  v11 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v12 = (void *)v11;
  if (v11)
    v13 = *(void **)(v11 + 24);
  else
    v13 = 0;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "proxyURL"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[3], "proxyURL"));
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

LABEL_6:
  return v17;
}

- (BOOL)matchEgress:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  int v23;
  const char *v24;

  v6 = (id *)a3;
  if (!v6)
  {
    v19 = nplog_obj(0, v4, v5);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      v17 = 0;
      goto LABEL_6;
    }
    v23 = 136315138;
    v24 = "-[NSPProxyPath matchEgress:]";
    v21 = "%s called with null proxyTokenInfo";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, v21, (uint8_t *)&v23, 0xCu);
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));

  if (!v7)
  {
    v22 = nplog_obj(v8, v9, v10);
    v20 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      goto LABEL_10;
    v23 = 136315138;
    v24 = "-[NSPProxyPath matchEgress:]";
    v21 = "%s called with null self.egressProxy";
    goto LABEL_12;
  }
  v11 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v12 = (void *)v11;
  if (v11)
    v13 = *(void **)(v11 + 24);
  else
    v13 = 0;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "proxyURL"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[3], "proxyURL"));
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

LABEL_6:
  return v17;
}

- (void)handleNetworkCharacteristicsChange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _OWORD *v11;
  _OWORD *v12;
  uint8_t v13[16];

  v4 = a3;
  v7 = nplog_obj(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "proxy path: network signature changed", v13, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self, "networkSingleHopAgentStatistics"));
  sub_100010990((uint64_t)v9, v4);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self, "networkMultiHopAgentStatistics"));
  sub_100010990((uint64_t)v10, v4);

  v11 = (_OWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self, "networkSingleHopAgentStatistics"));
  if (v11)
  {
    v11[6] = 0u;
    v11[7] = 0u;
    v11[4] = 0u;
    v11[5] = 0u;
    v11[2] = 0u;
    v11[3] = 0u;
    v11[1] = 0u;
  }

  v12 = (_OWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self, "networkMultiHopAgentStatistics"));
  if (v12)
  {
    v12[6] = 0u;
    v12[7] = 0u;
    v12[4] = 0u;
    v12[5] = 0u;
    v12[2] = 0u;
    v12[3] = 0u;
    v12[1] = 0u;
  }

}

- (void)resetStats
{
  _OWORD *v3;
  _OWORD *v4;

  v3 = (_OWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self, "networkSingleHopAgentStatistics"));
  if (v3)
  {
    v3[6] = 0u;
    v3[7] = 0u;
    v3[4] = 0u;
    v3[5] = 0u;
    v3[2] = 0u;
    v3[3] = 0u;
    v3[1] = 0u;
  }

  v4 = (_OWORD *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self, "networkMultiHopAgentStatistics"));
  if (v4)
  {
    v4[6] = 0u;
    v4[7] = 0u;
    v4[4] = 0u;
    v4[5] = 0u;
    v4[2] = 0u;
    v4[3] = 0u;
    v4[1] = 0u;
  }

}

- (void)resetError
{
  uint64_t v3;
  void *v4;
  id *v5;
  id *v6;

  v3 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
  v4 = (void *)v3;
  if (v3)
    objc_msgSend(*(id *)(v3 + 24), "resetError");

  v5 = (id *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5[3], "resetError");
    v5 = v6;
  }

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
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id *v20;
  const char *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  id *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  id *v35;
  void *v36;
  void *v37;
  id *v38;
  id *v39;
  uint64_t v40;
  void *v41;
  id v42;
  id *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  void *v53;
  void *v54;
  uint64_t v55;
  const char *string_ptr;
  uint64_t v57;
  NSObject *v58;
  void *v59;
  void *v60;
  uint8_t buf[8];
  _BYTE v62[10];
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int128 buffer;
  _OWORD v70[3];

  v6 = *(_QWORD *)&a4;
  v8 = (id *)a3;
  buffer = 0u;
  memset(v70, 0, sizeof(v70));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKeyedSubscript:", NWNetworkAgentStartOptionClientUUID));
  v12 = v9;
  if (!v9)
  {
    v60 = 0;
    v21 = 0;
    v13 = 0;
LABEL_8:
    v22 = 0;
    goto LABEL_22;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NWPath pathForClientID:](NWPath, "pathForClientID:", v9));
  v13 = v9;
  if (!v9)
  {
    v60 = 0;
    v21 = 0;
    goto LABEL_8;
  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "interface"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parameters"));
  v15 = objc_msgSend(v14, "pid");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "effectiveProcessUUID"));
  v59 = v12;
  if ((_DWORD)v15)
  {
    v17 = proc_pidinfo((int)v15, 13, 1uLL, &buffer, 64);
    if ((_DWORD)v17 == 64)
    {
      v20 = v8;
      v21 = (const char *)v70;
    }
    else
    {
      v24 = nplog_obj(v17, v18, v19);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = (_DWORD)v15;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to convert from PID (%d) to process name", buf, 8u);
      }
      v20 = v8;

      v21 = 0;
    }
    v23 = (void *)ne_copy_signing_identifier_for_pid(v15);
    if (v23)
      goto LABEL_16;
  }
  else
  {
    v20 = v8;
    v21 = 0;
    v23 = 0;
  }
  if (v16)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)v62 = 0;
    objc_msgSend(v16, "getUUIDBytes:", buf);
    v23 = (void *)NEHelperCacheCopySigningIdentifierMapping(buf);
  }
LABEL_16:
  if (v23 && xpc_get_type(v23) == (xpc_type_t)&_xpc_type_string && (string_ptr = xpc_string_get_string_ptr(v23)) != 0)
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string_ptr));
  else
    v22 = 0;

  if (v22)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
    objc_msgSend(v26, "reportActivityForApp:path:", v22, 0);

  }
  v8 = v20;
  v12 = v59;
LABEL_22:
  if ((v6 & 0xFFFF0000) != 0xFF0000)
  {
    v33 = nplog_obj(v9, v10, v11);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      if (!v21)
        v21 = "none";
      v35 = sub_100042794(v8);
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "interfaceName"));
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&buf[4] = v6;
      *(_WORD *)v62 = 2080;
      *(_QWORD *)&v62[2] = v21;
      v63 = 2112;
      v64 = v22;
      v65 = 2112;
      v66 = v36;
      v67 = 2112;
      v68 = v37;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Received error (%d) from %s (%@) for %@ agent on interface %@", buf, 0x30u);

    }
    v38 = (id *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));

    if (v38 == v8)
    {
      v40 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkMultiHopAgentStatistics](self, "networkMultiHopAgentStatistics"));
    }
    else
    {
      v39 = (id *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));

      if (v39 != v8)
      {
        v31 = 0;
        goto LABEL_39;
      }
      v40 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath networkSingleHopAgentStatistics](self, "networkSingleHopAgentStatistics"));
    }
    v31 = v40;
LABEL_39:
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "interface", v59));
    v42 = objc_msgSend(v41, "type");

    if (v42 == (id)1)
    {
      v43 = v8;
      v44 = +[NPUtilities copyCurrentNetworkCharacteristicsForPath:](NPUtilities, "copyCurrentNetworkCharacteristicsForPath:", v13);
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("Signature")));
      if (v31)
        v46 = *(void **)(v31 + 8);
      else
        v46 = 0;
      v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("Signature")));
      v48 = (void *)v47;
      if (v45)
      {
        if (v47)
        {
          v49 = objc_msgSend(v45, "isEqual:", v47);
          if ((v49 & 1) == 0)
          {
            v57 = nplog_obj(v49, v50, v51);
            v58 = objc_claimAutoreleasedReturnValue(v57);
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "ignore error, network signature does not match", buf, 2u);
            }

            v8 = v43;
            goto LABEL_28;
          }
        }
      }

      v8 = v43;
    }
    if ((int)v6 <= 1099)
    {
      if ((int)v6 > 0)
      {
        switch((int)v6)
        {
          case '<':
            if (v31)
              ++*(_QWORD *)(v31 + 24);
            v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
            v54 = v53;
            v55 = 60;
            goto LABEL_63;
          case '=':
            if (v31)
              ++*(_QWORD *)(v31 + 32);
            v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
            v54 = v53;
            v55 = 61;
            goto LABEL_63;
          case '>':
          case '?':
            goto LABEL_94;
          case '@':
            if (v31)
              ++*(_QWORD *)(v31 + 40);
            goto LABEL_28;
          case 'A':
            if (v31)
              ++*(_QWORD *)(v31 + 48);
            goto LABEL_28;
          default:
            if ((_DWORD)v6 != 1)
              goto LABEL_94;
            goto LABEL_28;
        }
      }
      if ((v6 + 65568) <= 0x1E)
      {
        if (((1 << (v6 + 32)) & 0x4004C000) != 0)
        {
          if (v31)
            ++*(_QWORD *)(v31 + 72);
          goto LABEL_62;
        }
        if ((_DWORD)v6 == -65568)
        {
          if (v31)
            ++*(_QWORD *)(v31 + 64);
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
          v54 = v53;
          v55 = 4294901728;
          goto LABEL_63;
        }
      }
      if (!(_DWORD)v6)
      {
        if (v31)
        {
          *(_QWORD *)(v31 + 120) = 0;
          *(_OWORD *)(v31 + 104) = 0u;
          *(_OWORD *)(v31 + 88) = 0u;
          *(_OWORD *)(v31 + 72) = 0u;
          *(_OWORD *)(v31 + 56) = 0u;
          *(_OWORD *)(v31 + 40) = 0u;
          *(_OWORD *)(v31 + 24) = 0u;
          *(_QWORD *)(v31 + 16) = 1;
        }
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
        v32 = v60;
        objc_msgSend(v54, "reportProxySuccessOnInterface:proxyPath:", v60, self);
        goto LABEL_64;
      }
      goto LABEL_94;
    }
    if ((int)v6 > 1199)
    {
      if ((v6 - 1200) > 7)
      {
LABEL_75:
        if ((_DWORD)v6 == 1301)
        {
          if (v31)
            ++*(_QWORD *)(v31 + 112);
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
          v54 = v53;
          v55 = 1301;
          goto LABEL_63;
        }
        if ((_DWORD)v6 == 1302)
        {
          if (v31)
            ++*(_QWORD *)(v31 + 120);
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
          v54 = v53;
          v55 = 1302;
          goto LABEL_63;
        }
        goto LABEL_94;
      }
      v52 = 1 << (v6 + 80);
      if ((v52 & 0x51) == 0)
      {
        if ((v52 & 0xA2) != 0)
        {
          if (v31)
            ++*(_QWORD *)(v31 + 96);
LABEL_62:
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
          v54 = v53;
          v55 = v6;
LABEL_63:
          v32 = v60;
          objc_msgSend(v53, "reportProxyError:interface:proxyPath:", v55, v60, self);
LABEL_64:

          goto LABEL_65;
        }
        goto LABEL_75;
      }
LABEL_60:
      if (v31)
        ++*(_QWORD *)(v31 + 88);
      goto LABEL_62;
    }
    if ((v6 - 1100) <= 7)
    {
      if (((1 << (v6 - 76)) & 0x33) != 0)
        goto LABEL_60;
      if ((_DWORD)v6 == 1106)
      {
        if (v31)
          ++*(_QWORD *)(v31 + 80);
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
        v54 = v53;
        v55 = 1106;
        goto LABEL_63;
      }
      if ((_DWORD)v6 == 1107)
      {
        if (v31)
          ++*(_QWORD *)(v31 + 104);
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
        v54 = v53;
        v55 = 1107;
        goto LABEL_63;
      }
    }
LABEL_94:
    if (v31)
      ++*(_QWORD *)(v31 + 56);
    goto LABEL_62;
  }
  v27 = nplog_obj(v9, v10, v11);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    if (!v21)
      v21 = "none";
    v29 = sub_100042794(v8);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = (unsigned __int16)v6;
    *(_WORD *)v62 = 2080;
    *(_QWORD *)&v62[2] = v21;
    v63 = 2112;
    v64 = v22;
    v65 = 2112;
    v66 = v30;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Received epoch (%u) from %s (%@) for %@ agent", buf, 0x26u);

  }
  v31 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
  objc_msgSend((id)v31, "reportEpoch:", (unsigned __int16)v6);
LABEL_28:
  v32 = v60;
LABEL_65:

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
  sub_100043354((uint64_t)v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
  objc_msgSend(v4, "singleHopAgentUnregistered:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
  sub_100043354((uint64_t)v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
  objc_msgSend(v6, "multiHopAgentUnregistered:", self);

  v7.receiver = self;
  v7.super_class = (Class)NSPProxyPath;
  -[NSPProxyPath dealloc](&v7, "dealloc");
}

- (id)singleHopConfigurationHash
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
  v3 = sub_1000435D4((uint64_t)v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)multiHopConfigurationHash
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
  v3 = sub_1000435D4((uint64_t)v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (NSPProxyPathDelegate)delegate
{
  return (NSPProxyPathDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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

- (unint64_t)proxyPathWeight
{
  return self->_proxyPathWeight;
}

- (void)setProxyPathWeight:(unint64_t)a3
{
  self->_proxyPathWeight = a3;
}

- (BOOL)allowFallback
{
  return self->_allowFallback;
}

- (void)setAllowFallback:(BOOL)a3
{
  self->_allowFallback = a3;
}

- (BOOL)fallbackToQUIC
{
  return self->_fallbackToQUIC;
}

- (void)setFallbackToQUIC:(BOOL)a3
{
  self->_fallbackToQUIC = a3;
}

- (BOOL)forceFallback
{
  return self->_forceFallback;
}

- (void)setForceFallback:(BOOL)a3
{
  self->_forceFallback = a3;
}

- (BOOL)allowFailOpen
{
  return self->_allowFailOpen;
}

- (void)setAllowFailOpen:(BOOL)a3
{
  self->_allowFailOpen = a3;
}

- (BOOL)singleHopRegistered
{
  return self->_singleHopRegistered;
}

- (void)setSingleHopRegistered:(BOOL)a3
{
  self->_singleHopRegistered = a3;
}

- (BOOL)multiHopRegistered
{
  return self->_multiHopRegistered;
}

- (void)setMultiHopRegistered:(BOOL)a3
{
  self->_multiHopRegistered = a3;
}

- (BOOL)geohashSharingEnabled
{
  return self->_geohashSharingEnabled;
}

- (void)setGeohashSharingEnabled:(BOOL)a3
{
  self->_geohashSharingEnabled = a3;
}

- (NSNumber)configEpoch
{
  return self->_configEpoch;
}

- (void)setConfigEpoch:(id)a3
{
  objc_storeStrong((id *)&self->_configEpoch, a3);
}

- (NSUUID)nonDefaultAgentUUID
{
  return self->_nonDefaultAgentUUID;
}

- (void)setNonDefaultAgentUUID:(id)a3
{
  objc_storeStrong((id *)&self->_nonDefaultAgentUUID, a3);
}

- (NSPPrivacyProxyNetworkRegistration)singleHopRegistration
{
  return self->_singleHopRegistration;
}

- (void)setSingleHopRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_singleHopRegistration, a3);
}

- (NSPPrivacyProxyNetworkRegistration)multiHopRegistration
{
  return self->_multiHopRegistration;
}

- (void)setMultiHopRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_multiHopRegistration, a3);
}

- (NSPProxyAgentNetworkStatistics)networkSingleHopAgentStatistics
{
  return self->_networkSingleHopAgentStatistics;
}

- (void)setNetworkSingleHopAgentStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_networkSingleHopAgentStatistics, a3);
}

- (NSPProxyAgentNetworkStatistics)networkMultiHopAgentStatistics
{
  return self->_networkMultiHopAgentStatistics;
}

- (void)setNetworkMultiHopAgentStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_networkMultiHopAgentStatistics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMultiHopAgentStatistics, 0);
  objc_storeStrong((id *)&self->_networkSingleHopAgentStatistics, 0);
  objc_storeStrong((id *)&self->_multiHopRegistration, 0);
  objc_storeStrong((id *)&self->_singleHopRegistration, 0);
  objc_storeStrong((id *)&self->_nonDefaultAgentUUID, 0);
  objc_storeStrong((id *)&self->_configEpoch, 0);
  objc_storeStrong((id *)&self->_egressProxy, 0);
  objc_storeStrong((id *)&self->_ingressProxy, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
