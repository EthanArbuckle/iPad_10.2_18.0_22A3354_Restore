@implementation NSPObliviousPath

- (NSPObliviousPath)initWithDelegate:(id)a3 obliviousConfig:(id)a4 obliviousHTTPType:(int)a5 transparencyKeyBundle:(id)a6 transparencyProof:(id)a7 obliviousTarget:(id)a8 proxyInfo:(id)a9 allowFailOpen:(BOOL)a10 networkCharacteristics:(id)a11
{
  id v17;
  id v18;
  id v19;
  NSPObliviousPath *v20;
  uint64_t v21;
  uint64_t v22;
  NSPObliviousPath *v23;
  NSPProxyAgentNetworkStatistics *v24;
  NSPProxyAgentNetworkStatistics *statistics;
  uint64_t v26;
  NSUUID *quicAgentUUID;
  uint64_t v28;
  NSUUID *fallbackAgentUUID;
  NSPObliviousPath *v30;
  uint64_t v32;
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[16];
  objc_super v39;

  v17 = a3;
  v18 = a4;
  v37 = a6;
  v36 = a7;
  v35 = a8;
  v34 = a9;
  v19 = a11;
  v39.receiver = self;
  v39.super_class = (Class)NSPObliviousPath;
  v20 = -[NSPObliviousPath init](&v39, "init");
  v23 = v20;
  if (v20)
  {
    objc_storeWeak((id *)&v20->_delegate, v17);
    objc_storeStrong((id *)&v23->_obliviousConfig, a4);
    v23->_obliviousHTTPType = a5;
    objc_storeStrong((id *)&v23->_obliviousTarget, a8);
    objc_storeStrong((id *)&v23->_transparencyKeyBundle, a6);
    objc_storeStrong((id *)&v23->_transparencyProof, a7);
    objc_storeStrong((id *)&v23->_proxyInfo, a9);
    v23->_allowFailOpen = a10;
    v24 = objc_alloc_init(NSPProxyAgentNetworkStatistics);
    statistics = v23->_statistics;
    v23->_statistics = v24;

    sub_100010990((uint64_t)v23->_statistics, v19);
    v23->_transparencyState = 0;
    v26 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    quicAgentUUID = v23->_quicAgentUUID;
    v23->_quicAgentUUID = (NSUUID *)v26;

    if (-[NSPObliviousPath allowFallback](v23, "allowFallback"))
    {
      v28 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      fallbackAgentUUID = v23->_fallbackAgentUUID;
      v23->_fallbackAgentUUID = (NSUUID *)v28;

    }
    v30 = v23;
  }
  else
  {
    v32 = nplog_obj(0, v21, v22);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }

  }
  return v23;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v7 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithCapacity:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
  sub_1000418A4(v7, v8, CFSTR("Oblivious target"), a3, a4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  sub_1000418A4(v7, v9, CFSTR("Proxy"), a3, a4);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicAgentUUID](self, "quicAgentUUID"));
  sub_1000418A4(v7, v10, CFSTR("QUIC Agent UUID"), a3, a4);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackAgentUUID](self, "fallbackAgentUUID"));
  sub_1000418A4(v7, v11, CFSTR("Fallback Agent UUID"), a3, a4);

  sub_1000420E0(v7, -[NSPObliviousPath allowFailOpen](self, "allowFailOpen"), (uint64_t)CFSTR("Allow fail open"), a3, a4);
  sub_100042144(v7, -[NSPObliviousPath transparencyState](self, "transparencyState"), (uint64_t)CFSTR("Transparency state"), a3, a4);
  v12 = -[NSPObliviousPath obliviousHTTPType](self, "obliviousHTTPType");
  if (v12 >= 3)
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v12));
  else
    v13 = *(&off_1000F5BD8 + (int)v12);
  sub_1000418A4(v7, v13, CFSTR("Oblivious HTTP type"), a3, a4);

  return v7;
}

- (NSString)description
{
  return (NSString *)-[NSPObliviousPath descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)deferCommit
{
  void *v4;
  unsigned __int8 v5;

  if (-[NSPObliviousPath deferAgentCommit](self, "deferAgentCommit"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath delegate](self, "delegate"));
  v5 = objc_msgSend(v4, "deferCommit");

  return v5;
}

- (NSPObliviousPath)initWithCoder:(id)a3
{
  id v4;
  NSPObliviousPath *v5;
  id v6;
  uint64_t v7;
  NSPProxyTokenInfo *proxyInfo;
  id v9;
  uint64_t v10;
  NSUUID *quicAgentUUID;
  id v12;
  uint64_t v13;
  NSUUID *fallbackAgentUUID;
  id v15;
  uint64_t v16;
  NSData *obliviousConfig;
  id v18;
  uint64_t v19;
  NSPPrivacyProxyObliviousTargetInfo *obliviousTarget;
  id v21;
  uint64_t v22;
  NSData *transparencyKeyBundle;
  id v24;
  uint64_t v25;
  NSData *transparencyProof;
  unsigned __int8 v27;
  unsigned __int8 v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)NSPObliviousPath;
  v5 = -[NSPObliviousPath init](&v30, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSPProxyTokenInfo), CFSTR("obliviousPathProxy"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    proxyInfo = v5->_proxyInfo;
    v5->_proxyInfo = (NSPProxyTokenInfo *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("obliviousPathQUICAgentUUID"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    quicAgentUUID = v5->_quicAgentUUID;
    v5->_quicAgentUUID = (NSUUID *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("obliviousPathFallbackAgentUUID"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    fallbackAgentUUID = v5->_fallbackAgentUUID;
    v5->_fallbackAgentUUID = (NSUUID *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("obliviousPathConfig"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    obliviousConfig = v5->_obliviousConfig;
    v5->_obliviousConfig = (NSData *)v16;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSPPrivacyProxyObliviousTargetInfo), CFSTR("obliviousPathTarget"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    obliviousTarget = v5->_obliviousTarget;
    v5->_obliviousTarget = (NSPPrivacyProxyObliviousTargetInfo *)v19;

    v5->_allowFailOpen = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("obliviousPathAllowFailOpen"));
    v5->_obliviousHTTPType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("obliviousPathType"));
    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("obliviousPathTransparencyKeyBundle"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    transparencyKeyBundle = v5->_transparencyKeyBundle;
    v5->_transparencyKeyBundle = (NSData *)v22;

    v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("obliviousPathTransparencyProof"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    transparencyProof = v5->_transparencyProof;
    v5->_transparencyProof = (NSData *)v25;

    v27 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("obliviousPathTransparencyState"));
    if (v27 == 1)
      v28 = 0;
    else
      v28 = v27;
    v5->_transparencyState = v28;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("obliviousPathProxy"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicAgentUUID](self, "quicAgentUUID"));
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("obliviousPathQUICAgentUUID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackAgentUUID](self, "fallbackAgentUUID"));
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("obliviousPathFallbackAgentUUID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousConfig](self, "obliviousConfig"));
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("obliviousPathConfig"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("obliviousPathTarget"));

  objc_msgSend(v11, "encodeBool:forKey:", -[NSPObliviousPath allowFailOpen](self, "allowFailOpen"), CFSTR("obliviousPathAllowFailOpen"));
  objc_msgSend(v11, "encodeInteger:forKey:", -[NSPObliviousPath obliviousHTTPType](self, "obliviousHTTPType"), CFSTR("obliviousPathType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath transparencyKeyBundle](self, "transparencyKeyBundle"));
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("obliviousPathTransparencyKeyBundle"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath transparencyProof](self, "transparencyProof"));
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("obliviousPathTransparencyProof"));

  if (-[NSPObliviousPath transparencyState](self, "transparencyState") != 1)
    objc_msgSend(v11, "encodeInteger:forKey:", -[NSPObliviousPath transparencyState](self, "transparencyState"), CFSTR("obliviousPathTransparencyState"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NSPObliviousPath *v4;
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

  v4 = -[NSPObliviousPath init](+[NSPObliviousPath allocWithZone:](NSPObliviousPath, "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousConfig](self, "obliviousConfig"));
  -[NSPObliviousPath setObliviousConfig:](v4, "setObliviousConfig:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
  -[NSPObliviousPath setObliviousTarget:](v4, "setObliviousTarget:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  -[NSPObliviousPath setProxyInfo:](v4, "setProxyInfo:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicAgentUUID](self, "quicAgentUUID"));
  -[NSPObliviousPath setQuicAgentUUID:](v4, "setQuicAgentUUID:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackAgentUUID](self, "fallbackAgentUUID"));
  -[NSPObliviousPath setFallbackAgentUUID:](v4, "setFallbackAgentUUID:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicRegistration](self, "quicRegistration"));
  -[NSPObliviousPath setQuicRegistration:](v4, "setQuicRegistration:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackRegistration](self, "fallbackRegistration"));
  -[NSPObliviousPath setFallbackRegistration:](v4, "setFallbackRegistration:", v11);

  -[NSPObliviousPath setObliviousAgentRegistered:](v4, "setObliviousAgentRegistered:", -[NSPObliviousPath obliviousAgentRegistered](self, "obliviousAgentRegistered"));
  -[NSPObliviousPath setAllowFailOpen:](v4, "setAllowFailOpen:", -[NSPObliviousPath allowFailOpen](self, "allowFailOpen"));
  -[NSPObliviousPath setObliviousHTTPType:](v4, "setObliviousHTTPType:", -[NSPObliviousPath obliviousHTTPType](self, "obliviousHTTPType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath statistics](self, "statistics"));
  -[NSPObliviousPath setStatistics:](v4, "setStatistics:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath transparencyKeyBundle](self, "transparencyKeyBundle"));
  -[NSPObliviousPath setTransparencyKeyBundle:](v4, "setTransparencyKeyBundle:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath transparencyProof](self, "transparencyProof"));
  -[NSPObliviousPath setTransparencyProof:](v4, "setTransparencyProof:", v14);

  -[NSPObliviousPath setTransparencyState:](v4, "setTransparencyState:", -[NSPObliviousPath transparencyState](self, "transparencyState"));
  return v4;
}

- (void)enableFailOpen:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[NSPObliviousPath allowFailOpen](self, "allowFailOpen") != a3)
  {
    -[NSPObliviousPath setAllowFailOpen:](self, "setAllowFailOpen:", v3);
    -[NSPObliviousPath resetFallbackProxyAgent](self, "resetFallbackProxyAgent");
    -[NSPObliviousPath resetQUICProxyAgentForceUpdateDelegate:](self, "resetQUICProxyAgentForceUpdateDelegate:", 0);
  }
}

- (id)shortName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "targetHost"));

  return v3;
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
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));

    if (v7)
    {
      v8 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
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
      v18 = "-[NSPObliviousPath matchIngress:]";
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
  void *v30;
  int v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int128 buffer;
  _OWORD v40[3];

  v6 = *(_QWORD *)&a4;
  v8 = (id *)a3;
  buffer = 0u;
  memset(v40, 0, sizeof(v40));
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
      v31 = 67109120;
      v32 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to convert from PID (%d) to process name", (uint8_t *)&v31, 8u);
    }

    goto LABEL_11;
  }
  v21 = (const char *)v40;
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
    v31 = 67109890;
    v32 = v6;
    v33 = 2080;
    v34 = v26;
    v35 = 2112;
    v36 = v28;
    v37 = 2112;
    v38 = v29;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Received error (%d) from %s for oblivious %@ agent on interface %@", (uint8_t *)&v31, 0x26u);

  }
  if ((_DWORD)v6)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath delegate](self, "delegate"));
    objc_msgSend(v30, "reportObliviousPathError:interface:obliviousPath:", v6, v14, self);

  }
}

- (void)handleNetworkCharacteristicsChange:(id)a3
{
  id v4;
  void *v5;
  _OWORD *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath statistics](self, "statistics"));
  sub_100010990((uint64_t)v5, v4);

  v6 = (_OWORD *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath statistics](self, "statistics"));
  if (v6)
  {
    v6[6] = 0u;
    v6[7] = 0u;
    v6[4] = 0u;
    v6[5] = 0u;
    v6[2] = 0u;
    v6[3] = 0u;
    v6[1] = 0u;
  }

}

- (void)resetStats
{
  _OWORD *v2;

  v2 = (_OWORD *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath statistics](self, "statistics"));
  if (v2)
  {
    v2[6] = 0u;
    v2[7] = 0u;
    v2[4] = 0u;
    v2[5] = 0u;
    v2[2] = 0u;
    v2[3] = 0u;
    v2[1] = 0u;
  }

}

- (void)resetError
{
  uint64_t v3;
  void *v4;
  id *v5;
  id *v6;

  v3 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicRegistration](self, "quicRegistration"));
  v4 = (void *)v3;
  if (v3)
    objc_msgSend(*(id *)(v3 + 24), "resetError");

  v5 = (id *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackRegistration](self, "fallbackRegistration"));
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5[3], "resetError");
    v5 = v6;
  }

}

- (BOOL)shouldBePenalized
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;

  v3 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath statistics](self, "statistics"));
  v4 = (void *)v3;
  if (v3 && *(_QWORD *)(v3 + 80) > 2uLL)
  {
    v7 = 1;
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath statistics](self, "statistics"));
    v6 = (void *)v5;
    if (v5 && *(_QWORD *)(v5 + 72) > 2uLL)
    {
      v7 = 1;
    }
    else
    {
      v8 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath statistics](self, "statistics"));
      v9 = (void *)v8;
      if (v8 && *(_QWORD *)(v8 + 24) > 9uLL)
      {
        v7 = 1;
      }
      else
      {
        v10 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath statistics](self, "statistics"));
        v11 = (void *)v10;
        if (v10 && *(_QWORD *)(v10 + 64) > 2uLL)
        {
          v7 = 1;
        }
        else
        {
          v12 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath statistics](self, "statistics"));
          v13 = (void *)v12;
          if (v12 && *(_QWORD *)(v12 + 56) > 9uLL)
          {
            v7 = 1;
          }
          else
          {
            v14 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath statistics](self, "statistics"));
            if (v14)
              v7 = v14[4] > 2uLL;
            else
              v7 = 0;

          }
        }

      }
    }

  }
  return v7;
}

- (BOOL)validateTransparencyIfNecessaryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  char v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  BOOL v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  void (**v51)(_QWORD, _QWORD);
  _QWORD v52[4];
  void (**v53)(_QWORD, _QWORD);
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath transparencyKeyBundle](self, "transparencyKeyBundle"));

  if (v5)
  {
    v6 = objc_alloc((Class)NSPPrivacyProxyTransparencyOHTTPEntry);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath transparencyKeyBundle](self, "transparencyKeyBundle"));
    v8 = objc_msgSend(v6, "initWithData:", v7);

    if (v8)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keyConfiguration"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousConfig](self, "obliviousConfig"));
      v14 = objc_msgSend(v12, "isEqualToData:", v13);

      if ((v14 & 1) != 0)
      {
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "targetInformations"));
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        if (v19)
        {
          v20 = v19;
          v50 = v8;
          v51 = (void (**)(_QWORD, _QWORD))v4;
          v21 = 0;
          v22 = *(_QWORD *)v55;
          do
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(_QWORD *)v55 != v22)
                objc_enumerationMutation(v18);
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1)
                                                                                 + 8 * (_QWORD)i), "targetHost"));
              v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "targetHost"));
              v27 = objc_msgSend(v24, "isEqualToString:", v26);

              v21 |= v27;
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
          }
          while (v20);

          v8 = v50;
          v4 = v51;
          if ((v21 & 1) != 0)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v50, "configurationDeliveryStart")));
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v50, "configurationDeliveryEnd")));
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath delegate](self, "delegate"));
            v34 = objc_msgSend(v33, "configurationFetchDateIsWithinStart:end:", v31, v32);

            if ((v34 & 1) != 0)
            {
              v38 = objc_msgSend(objc_alloc((Class)SoftwareTransparency), "initWithApplication:", 0);
              v39 = v38 == 0;
              if (v38)
              {
                v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath transparencyProof](self, "transparencyProof"));
                v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath transparencyKeyBundle](self, "transparencyKeyBundle"));
                v52[0] = _NSConcreteStackBlock;
                v52[1] = 3221225472;
                v52[2] = sub_100011E1C;
                v52[3] = &unk_1000F5888;
                v53 = v51;
                objc_msgSend(v38, "verifyExpiringProofs:for:completion:", v40, v41, v52);

              }
              else
              {
                v51[2](v51, 0);
              }

            }
            else
            {
              v48 = nplog_obj(v35, v36, v37);
              v49 = objc_claimAutoreleasedReturnValue(v48);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v59 = v31;
                v60 = 2112;
                v61 = v32;
                _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Configuration start time (%@) and end time (%@) are not valid, blocking installing oblivious config", buf, 0x16u);
              }

              v51[2](v51, 0);
              v39 = 1;
            }

            goto LABEL_25;
          }
        }
        else
        {

        }
        v46 = nplog_obj(v28, v29, v30);
        v43 = objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v44 = "Failed to find target info in transparency blob for oblivious config, blocking";
          goto LABEL_23;
        }
LABEL_24:

        (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
        v39 = 1;
LABEL_25:

        goto LABEL_26;
      }
      v45 = nplog_obj(v15, v16, v17);
      v43 = objc_claimAutoreleasedReturnValue(v45);
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v44 = "Failed to match key configuration in transparency blob for oblivious config, blocking";
    }
    else
    {
      v42 = nplog_obj(v9, v10, v11);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v44 = "Failed to parse transparency blob for oblivious config, blocking";
    }
LABEL_23:
    _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, v44, buf, 2u);
    goto LABEL_24;
  }
  v39 = 1;
  (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
LABEL_26:

  return v39;
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
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[6];
  uint8_t v43[4];
  NSPObliviousPath *v44;
  __int16 v45;
  void *v46;
  _BYTE buf[24];
  uint64_t v48;
  __int16 v49;
  uint64_t v50;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  if (sub_10000B9B4((uint64_t)v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
    v5 = sub_10000D9B0((uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
    v7 = sub_10000E610((uint64_t)v6);

    if (v5 <= v7)
    {
      v11 = nplog_obj(v8, v9, v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath shortName](self, "shortName"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
        v15 = sub_10000D9B0((uint64_t)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
        *(_DWORD *)buf = 134218754;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2048;
        v48 = v15;
        v49 = 2048;
        v50 = sub_10000E610((uint64_t)v16);
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%p oblivious path [%@] is not ready due to insufficient ingress proxy tokens (cache+agent: %lu), (ingress proxy low-water mark: %lu)", buf, 0x2Au);

      }
      return 0;
    }
  }
  else
  {

  }
  v17 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath transparencyKeyBundle](self, "transparencyKeyBundle"));
  v20 = (void *)v17;
  if (v17)
  {
    v21 = -[NSPObliviousPath transparencyState](self, "transparencyState");

    if (v21 != 2)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v48) = 1;
      if (-[NSPObliviousPath transparencyState](self, "transparencyState"))
        goto LABEL_14;
      -[NSPObliviousPath setTransparencyState:](self, "setTransparencyState:", 1);
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_100012474;
      v42[3] = &unk_1000F5838;
      v42[4] = self;
      v42[5] = buf;
      v26 = -[NSPObliviousPath validateTransparencyIfNecessaryWithCompletion:](self, "validateTransparencyIfNecessaryWithCompletion:", v42);
      if (v26)
      {
LABEL_14:
        v29 = -[NSPObliviousPath transparencyState](self, "transparencyState");
        if ((_DWORD)v29 == 3)
        {
          v32 = nplog_obj(v29, v30, v31);
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath shortName](self, "shortName"));
            *(_DWORD *)v43 = 134218242;
            v44 = self;
            v45 = 2112;
            v46 = v40;
            _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%p oblivious path [%@] is not ready due to invalid transparency status", v43, 0x16u);

          }
        }
        else
        {
          v34 = -[NSPObliviousPath transparencyState](self, "transparencyState");
          if ((_DWORD)v34 != 1)
          {
            _Block_object_dispose(buf, 8);
            goto LABEL_9;
          }
          v37 = nplog_obj(v34, v35, v36);
          v33 = objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath shortName](self, "shortName"));
            *(_DWORD *)v43 = 134218242;
            v44 = self;
            v45 = 2112;
            v46 = v41;
            _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%p oblivious path [%@] is not ready due to pending transparency status", v43, 0x16u);

          }
        }
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = 0;
        v38 = nplog_obj(v26, v27, v28);
        v33 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath shortName](self, "shortName"));
          *(_DWORD *)v43 = 134218242;
          v44 = self;
          v45 = 2112;
          v46 = v39;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%p oblivious path [%@] is not ready due to unknown transparency status", v43, 0x16u);

        }
      }

      _Block_object_dispose(buf, 8);
      return 0;
    }
  }
LABEL_9:
  v22 = nplog_obj(v17, v18, v19);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath shortName](self, "shortName"));
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%p oblivious path [%@] is ready", buf, 0x16u);

  }
  return 1;
}

- (BOOL)allowFallback
{
  _QWORD *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v3 = v2;
  if (v2)
    v2 = (_QWORD *)v2[3];
  v4 = objc_msgSend(v2, "supportsFallback");

  return v4;
}

- (BOOL)resetQUICProxyAgentForceUpdateDelegate:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSPPrivacyProxyObliviousHopsNetworkRegistration *v13;
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unsigned int v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  unsigned int v41;
  uint64_t v42;
  void *v43;
  id v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  id v53;
  void *v54;
  unsigned __int8 v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  unsigned __int8 v69;
  void *v70;
  id v71;
  _BOOL4 v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  BOOL v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id *v89;
  void *v90;
  uint8_t buf[4];
  const char *v92;

  v5 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  if (!v5)
    return v5;
  v6 = (void *)v5;
  v7 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousConfig](self, "obliviousConfig"));
  if (!v7)
  {

    goto LABEL_14;
  }
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));

  if (!v9)
  {
LABEL_14:
    LOBYTE(v5) = 0;
    return v5;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicAgentUUID](self, "quicAgentUUID"));

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    -[NSPObliviousPath setQuicAgentUUID:](self, "setQuicAgentUUID:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicRegistration](self, "quicRegistration"));

  if (!v12)
  {
    v13 = [NSPPrivacyProxyObliviousHopsNetworkRegistration alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicAgentUUID](self, "quicAgentUUID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "targetHost"));
    v17 = sub_1000449D0((id *)&v13->super.super.isa, v14, v16, self);
    -[NSPObliviousPath setQuicRegistration:](self, "setQuicRegistration:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicRegistration](self, "quicRegistration"));
    if (!v18)
    {
      v66 = nplog_obj(v19, v20, v21);
      v67 = objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v92 = "-[NSPObliviousPath resetQUICProxyAgentForceUpdateDelegate:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_FAULT, "%s called with null self.quicRegistration", buf, 0xCu);
      }

      goto LABEL_14;
    }
  }
  v22 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackAgentUUID](self, "fallbackAgentUUID"));
  if (!v22)
    goto LABEL_15;
  v23 = (void *)v22;
  v24 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackRegistration](self, "fallbackRegistration"));
  if (!v24)
  {
    v85 = 0;
    v90 = 0;
    goto LABEL_12;
  }
  v25 = (void *)v24;
  v26 = objc_msgSend(*(id *)(v24 + 24), "isRegistered");

  if (!v26)
  {
LABEL_15:
    v85 = 0;
    v90 = 0;
    goto LABEL_16;
  }
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackAgentUUID](self, "fallbackAgentUUID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackRegistration](self, "fallbackRegistration"));
  v27 = sub_1000435D4((uint64_t)v23);
  v90 = (void *)objc_claimAutoreleasedReturnValue(v27);
LABEL_12:

LABEL_16:
  v28 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicRegistration](self, "quicRegistration"));
  v29 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v83 = (void *)v29;
  if (v29)
    v30 = *(void **)(v29 + 24);
  else
    v30 = 0;
  v31 = v30;
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "proxyURL"));
  v32 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v81 = (void *)v32;
  if (v32)
    v33 = *(void **)(v32 + 24);
  else
    v33 = 0;
  v34 = v33;
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "proxyKeyInfos"));
  v35 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v79 = (void *)v35;
  if (v35)
    v36 = *(void **)(v35 + 24);
  else
    v36 = 0;
  v37 = v36;
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "proxyVersion"));
  v38 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v77 = (void *)v38;
  if (v38)
    v39 = *(void **)(v38 + 24);
  else
    v39 = 0;
  v40 = v39;
  v41 = objc_msgSend(v40, "supportsResumption");
  v42 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v75 = (void *)v42;
  v73 = v41;
  if (v42)
    v43 = *(void **)(v42 + 24);
  else
    v43 = 0;
  v44 = v43;
  v45 = objc_msgSend(v44, "algorithm");
  v46 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v72 = sub_10000B9B4(v46);
  v74 = (void *)v46;
  if (v72)
  {
    v47 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
    v70 = (void *)v47;
    if (v47)
      v48 = *(void **)(v47 + 48);
    else
      v48 = 0;
    v71 = v48;
  }
  else
  {
    v71 = 0;
  }
  v49 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v50 = (void *)v49;
  v84 = a3;
  v89 = (id *)v28;
  v82 = v31;
  v80 = v34;
  v78 = v37;
  v76 = v40;
  if (v49)
    v51 = *(void **)(v49 + 24);
  else
    v51 = 0;
  v52 = v45 == 2;
  v53 = v51;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "tokenChallenge"));
  v55 = -[NSPObliviousPath allowFailOpen](self, "allowFailOpen");
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousConfig](self, "obliviousConfig"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "proxyURLPath"));
  v69 = v55;
  v59 = v85;
  sub_100044A88((uint64_t)v89, v88, v87, v86, v73, v52, v71, v54 != 0, v85, v69, v56, v58, -[NSPObliviousPath obliviousHTTPType](self, "obliviousHTTPType"), v90);

  if (v72)
  {

  }
  if (v89
    && objc_msgSend(v89[3], "isRegistered")
    && (v84 || !-[NSPObliviousPath obliviousAgentRegistered](self, "obliviousAgentRegistered")))
  {
    -[NSPObliviousPath setObliviousAgentRegistered:](self, "setObliviousAgentRegistered:", 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath delegate](self, "delegate"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "targetHost"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "processes"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicAgentUUID](self, "quicAgentUUID"));
    objc_msgSend(v60, "obliviousHopAgentRegistered:hostname:processes:agentUUID:", self, v62, v64, v65);

    v59 = v85;
  }

  LOBYTE(v5) = 1;
  return v5;
}

- (BOOL)resetFallbackProxyAgent
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSPPrivacyProxyObliviousHopsFallbackNetworkRegistration *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  unsigned int v33;
  uint64_t v34;
  void *v35;
  id v36;
  unsigned int v37;
  uint64_t v38;
  _BOOL4 v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  id v46;
  void *v47;
  unsigned __int8 v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  void *v55;
  id v56;
  _BOOL4 v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint8_t buf[4];
  const char *v74;

  v3 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  if (!v3)
    return v3;
  v4 = (void *)v3;
  v5 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousConfig](self, "obliviousConfig"));
  if (!v5)
  {

    goto LABEL_24;
  }
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));

  if (!v7)
  {
LABEL_24:
    LOBYTE(v3) = 0;
    return v3;
  }
  LODWORD(v3) = -[NSPObliviousPath allowFallback](self, "allowFallback");
  if (!(_DWORD)v3)
    return v3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackAgentUUID](self, "fallbackAgentUUID"));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    -[NSPObliviousPath setFallbackAgentUUID:](self, "setFallbackAgentUUID:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackRegistration](self, "fallbackRegistration"));

  if (!v10)
  {
    v11 = [NSPPrivacyProxyObliviousHopsFallbackNetworkRegistration alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackAgentUUID](self, "fallbackAgentUUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "targetHost"));
    v15 = sub_10004618C((id *)&v11->super.super.isa, v12, v14, self);
    -[NSPObliviousPath setFallbackRegistration:](self, "setFallbackRegistration:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackRegistration](self, "fallbackRegistration"));
    if (!v16)
    {
      v52 = nplog_obj(v17, v18, v19);
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v74 = "-[NSPObliviousPath resetFallbackProxyAgent]";
        _os_log_fault_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_FAULT, "%s called with null self.fallbackRegistration", buf, 0xCu);
      }

      goto LABEL_24;
    }
  }
  v20 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackRegistration](self, "fallbackRegistration"));
  v21 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v69 = (void *)v21;
  if (v21)
    v22 = *(void **)(v21 + 24);
  else
    v22 = 0;
  v23 = v22;
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "tcpProxyFqdn"));
  v24 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v66 = (void *)v24;
  if (v24)
    v25 = *(void **)(v24 + 24);
  else
    v25 = 0;
  v26 = v25;
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "proxyKeyInfos"));
  v27 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v65 = (void *)v27;
  if (v27)
    v28 = *(void **)(v27 + 24);
  else
    v28 = 0;
  v29 = v28;
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "proxyVersion"));
  v30 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v63 = (void *)v30;
  if (v30)
    v31 = *(void **)(v30 + 24);
  else
    v31 = 0;
  v32 = v31;
  v33 = objc_msgSend(v32, "supportsResumption");
  v34 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v64 = v29;
  v61 = (void *)v34;
  v58 = v33;
  if (v34)
    v35 = *(void **)(v34 + 24);
  else
    v35 = 0;
  v36 = v35;
  v37 = objc_msgSend(v36, "algorithm");
  v38 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v39 = sub_10000B9B4(v38);
  v62 = v32;
  if (v39)
  {
    v40 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
    v55 = (void *)v40;
    if (v40)
      v41 = *(void **)(v40 + 48);
    else
      v41 = 0;
    v56 = v41;
  }
  else
  {
    v56 = 0;
  }
  v42 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v43 = (void *)v42;
  v70 = (void *)v20;
  v68 = v23;
  v59 = (void *)v38;
  v60 = v36;
  v57 = v39;
  if (v42)
    v44 = *(void **)(v42 + 24);
  else
    v44 = 0;
  v45 = v37 == 2;
  v46 = v44;
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "tokenChallenge"));
  v48 = -[NSPObliviousPath allowFailOpen](self, "allowFailOpen");
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousConfig](self, "obliviousConfig"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "proxyURLPath"));
  sub_100046244((uint64_t)v70, v67, v72, v71, v58, v45, v56, v47 != 0, v48, v49, v51, -[NSPObliviousPath obliviousHTTPType](self, "obliviousHTTPType"));

  if (v57)
  {

  }
  LOBYTE(v3) = 1;
  return v3;
}

- (void)setupProxyAgentsForceUpdateDelegate:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  unsigned __int8 v6;
  id v7;

  v3 = a3;
  if (-[NSPObliviousPath pathReady](self, "pathReady"))
  {
    -[NSPObliviousPath setDeferAgentCommit:](self, "setDeferAgentCommit:", 1);
    v5 = -[NSPObliviousPath resetFallbackProxyAgent](self, "resetFallbackProxyAgent");
    v6 = -[NSPObliviousPath resetQUICProxyAgentForceUpdateDelegate:](self, "resetQUICProxyAgentForceUpdateDelegate:", v3);
    -[NSPObliviousPath setDeferAgentCommit:](self, "setDeferAgentCommit:", 0);
    if (((v6 & 1) != 0 || v5) && !-[NSPObliviousPath deferCommit](self, "deferCommit"))
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](NEFileHandleMaintainer, "sharedMaintainer"));
      objc_msgSend(v7, "commit");

    }
  }
}

- (void)removeProxyAgents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicAgentUUID](self, "quicAgentUUID"));
  -[NSPObliviousPath setDeferAgentCommit:](self, "setDeferAgentCommit:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicRegistration](self, "quicRegistration"));
  sub_100043354((uint64_t)v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackRegistration](self, "fallbackRegistration"));
  sub_100043354((uint64_t)v4);

  -[NSPObliviousPath setDeferAgentCommit:](self, "setDeferAgentCommit:", 0);
  if (!-[NSPObliviousPath deferCommit](self, "deferCommit"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](NEFileHandleMaintainer, "sharedMaintainer"));
    objc_msgSend(v5, "commit");

  }
  if (-[NSPObliviousPath obliviousAgentRegistered](self, "obliviousAgentRegistered"))
  {
    -[NSPObliviousPath setObliviousAgentRegistered:](self, "setObliviousAgentRegistered:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath delegate](self, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "targetHost"));
    objc_msgSend(v6, "obliviousHopAgentUnregistered:hostname:agentUUID:", self, v8, v9);

  }
  -[NSPObliviousPath setQuicAgentUUID:](self, "setQuicAgentUUID:", 0);
  -[NSPObliviousPath setFallbackAgentUUID:](self, "setFallbackAgentUUID:", 0);
  -[NSPObliviousPath setQuicRegistration:](self, "setQuicRegistration:", 0);
  -[NSPObliviousPath setFallbackRegistration:](self, "setFallbackRegistration:", 0);

}

- (void)dealloc
{
  objc_super v3;

  -[NSPObliviousPath removeProxyAgents](self, "removeProxyAgents");
  v3.receiver = self;
  v3.super_class = (Class)NSPObliviousPath;
  -[NSPObliviousPath dealloc](&v3, "dealloc");
}

- (NSPObliviousPathDelegate)delegate
{
  return (NSPObliviousPathDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSData)obliviousConfig
{
  return self->_obliviousConfig;
}

- (void)setObliviousConfig:(id)a3
{
  objc_storeStrong((id *)&self->_obliviousConfig, a3);
}

- (NSData)transparencyKeyBundle
{
  return self->_transparencyKeyBundle;
}

- (void)setTransparencyKeyBundle:(id)a3
{
  objc_storeStrong((id *)&self->_transparencyKeyBundle, a3);
}

- (NSData)transparencyProof
{
  return self->_transparencyProof;
}

- (void)setTransparencyProof:(id)a3
{
  objc_storeStrong((id *)&self->_transparencyProof, a3);
}

- (NSPPrivacyProxyObliviousTargetInfo)obliviousTarget
{
  return self->_obliviousTarget;
}

- (void)setObliviousTarget:(id)a3
{
  objc_storeStrong((id *)&self->_obliviousTarget, a3);
}

- (NSPProxyTokenInfo)proxyInfo
{
  return self->_proxyInfo;
}

- (void)setProxyInfo:(id)a3
{
  objc_storeStrong((id *)&self->_proxyInfo, a3);
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

- (BOOL)obliviousAgentRegistered
{
  return self->_obliviousAgentRegistered;
}

- (void)setObliviousAgentRegistered:(BOOL)a3
{
  self->_obliviousAgentRegistered = a3;
}

- (BOOL)allowFailOpen
{
  return self->_allowFailOpen;
}

- (void)setAllowFailOpen:(BOOL)a3
{
  self->_allowFailOpen = a3;
}

- (BOOL)deferAgentCommit
{
  return self->_deferAgentCommit;
}

- (void)setDeferAgentCommit:(BOOL)a3
{
  self->_deferAgentCommit = a3;
}

- (int)obliviousHTTPType
{
  return self->_obliviousHTTPType;
}

- (void)setObliviousHTTPType:(int)a3
{
  self->_obliviousHTTPType = a3;
}

- (NSPProxyAgentNetworkStatistics)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_statistics, a3);
}

- (unsigned)transparencyState
{
  return self->_transparencyState;
}

- (void)setTransparencyState:(unsigned __int8)a3
{
  self->_transparencyState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_fallbackRegistration, 0);
  objc_storeStrong((id *)&self->_quicRegistration, 0);
  objc_storeStrong((id *)&self->_fallbackAgentUUID, 0);
  objc_storeStrong((id *)&self->_quicAgentUUID, 0);
  objc_storeStrong((id *)&self->_proxyInfo, 0);
  objc_storeStrong((id *)&self->_obliviousTarget, 0);
  objc_storeStrong((id *)&self->_transparencyProof, 0);
  objc_storeStrong((id *)&self->_transparencyKeyBundle, 0);
  objc_storeStrong((id *)&self->_obliviousConfig, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
