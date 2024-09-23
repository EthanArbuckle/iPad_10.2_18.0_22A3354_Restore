@implementation SiriCoreSiriConnection

- (SiriCoreSiriConnection)init
{
  return -[SiriCoreSiriConnection initWithQueue:](self, "initWithQueue:", 0);
}

- (SiriCoreSiriConnection)initWithQueue:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  dispatch_queue_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  dispatch_group_t v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SiriCoreSiriConnection;
  v5 = -[SiriCoreSiriConnection init](&v21, sel_init);
  if (v5)
  {
    v6 = v4;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UNSPECIFIED, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v6)
      v9 = dispatch_queue_create_with_target_V2("SiriCoreSiriConnection", v8, v6);
    else
      v9 = dispatch_queue_create("SiriCoreSiriConnection", v8);
    v10 = v9;

    v11 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v10;

    v12 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v13 = (void *)*((_QWORD *)v5 + 14);
    *((_QWORD *)v5 + 14) = v12;

    v14 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v15 = (void *)*((_QWORD *)v5 + 15);
    *((_QWORD *)v5 + 15) = v14;

    v16 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v17 = (void *)*((_QWORD *)v5 + 16);
    *((_QWORD *)v5 + 16) = v16;

    v18 = dispatch_group_create();
    v19 = (void *)*((_QWORD *)v5 + 18);
    *((_QWORD *)v5 + 18) = v18;

    dispatch_group_enter(*((dispatch_group_t *)v5 + 18));
  }

  return (SiriCoreSiriConnection *)v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (!self->_activeBackgroundConnection)
    dispatch_group_leave((dispatch_group_t)self->_activeConnectionGroup);
  +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics](SiriCoreNetworkingAnalytics, "sharedSiriCoreNetworkingAnalytics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNetworkConnectionId:", 0);

  v4.receiver = self;
  v4.super_class = (Class)SiriCoreSiriConnection;
  -[SiriCoreSiriConnection dealloc](&v4, sel_dealloc);
}

- (id)_connectionInfoForRoute:(id)a3 policy:(id)a4
{
  id v6;
  id v7;
  SiriCoreSiriConnectionInfo *v8;
  NSURL *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v22;
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(SiriCoreSiriConnectionInfo);
  -[SiriCoreSiriConnectionInfo setAceHost:](v8, "setAceHost:", self->_aceHost);
  -[SiriCoreSiriConnectionInfo setLanguageCode:](v8, "setLanguageCode:", self->_languageCode);
  -[SiriCoreSiriConnectionInfo setPrefersWWAN:](v8, "setPrefersWWAN:", self->_prefersWWAN);
  -[SiriCoreSiriConnectionInfo setSkipPeer:](v8, "setSkipPeer:", self->_skipPeer);
  -[SiriCoreSiriConnectionInfo setUseWiFiHint:](v8, "setUseWiFiHint:", self->_useWiFiHint);
  -[SiriCoreSiriConnectionInfo setConnectionPolicy:](v8, "setConnectionPolicy:", v7);

  -[SiriCoreSiriConnectionInfo setForceReconnect:](v8, "setForceReconnect:", self->_forceReconnect);
  -[SiriCoreSiriConnectionInfo setConnectionPolicyRoute:](v8, "setConnectionPolicyRoute:", v6);
  -[SiriCoreSiriConnectionInfo setAssistantIdentifier:](v8, "setAssistantIdentifier:", self->_assistantIdentifier);
  -[SiriCoreSiriConnectionInfo setPeerAssistantIdentifier:](v8, "setPeerAssistantIdentifier:", self->_peerAssistantIdentifier);
  -[SiriCoreSiriConnectionInfo setImposePolicyBan:](v8, "setImposePolicyBan:", self->_imposePolicyBan);
  -[SiriCoreSiriConnectionInfo setForceOnDeviceOnlyDictation:](v8, "setForceOnDeviceOnlyDictation:", _AFPreferencesForceOnDeviceOnlyDictationEnabled());
  -[SiriCoreSiriConnectionInfo setRequiresURLSession:](v8, "setRequiresURLSession:", 0);
  -[SiriCoreSiriConnectionInfo setTimeout:](v8, "setTimeout:", self->_timeout);
  v9 = self->_url;
  if (v6)
  {
    objc_msgSend(v6, "cname");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 || (objc_msgSend(v6, "host"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v9, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHost:", v10);
      objc_msgSend(v11, "URL");
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = (NSURL *)v12;
    }
  }
  -[NSURL port](v9, "port");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[NSURL scheme](v9, "scheme");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "caseInsensitiveCompare:", CFSTR("https"));

    if (v16)
      v14 = CFSTR("80");
    else
      v14 = CFSTR("443");
  }
  v17 = (void *)*MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v18 = v17;
    -[NSURL host](v9, "host");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 136315650;
    v23 = "-[SiriCoreSiriConnection _connectionInfoForRoute:policy:]";
    v24 = 2112;
    v25 = v19;
    v26 = 2112;
    v27 = v14;
    _os_log_impl(&dword_211AB2000, v18, OS_LOG_TYPE_INFO, "%s route host is %@ port is %@", (uint8_t *)&v22, 0x20u);

  }
  -[SiriCoreSiriConnectionInfo setUrl:](v8, "setUrl:", v9);
  objc_msgSend(v6, "connectionId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriCoreSiriConnectionInfo setConnectionId:](v8, "setConnectionId:", v20);

  return v8;
}

- (void)_startBackgroundConnectionWithRoute:(id)a3 policy:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *scheduledRoutes;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  int v15;
  NSObject *v16;
  SiriCoreSiriBackgroundConnection *v17;
  void *v18;
  NSObject *v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  scheduledRoutes = self->_scheduledRoutes;
  if (v6)
  {
    -[NSMutableSet removeObject:](self->_scheduledRoutes, "removeObject:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](scheduledRoutes, "removeObject:", v9);

  }
  if (self->_isCanceledInternal || self->_activeBackgroundConnection)
  {
    v10 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
    {
      v20 = 136315138;
      v21 = "-[SiriCoreSiriConnection _startBackgroundConnectionWithRoute:policy:]";
      v11 = "%s Not starting scheduled background connection because we're canceled or already have an active one";
      v12 = v10;
      v13 = OS_LOG_TYPE_INFO;
LABEL_8:
      _os_log_impl(&dword_211AB2000, v12, v13, v11, (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isDictationHIPAACompliant");

    if (v15)
    {
      v16 = *MEMORY[0x24BE08FA0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FA0], OS_LOG_TYPE_DEFAULT))
        goto LABEL_9;
      v20 = 136315138;
      v21 = "-[SiriCoreSiriConnection _startBackgroundConnectionWithRoute:policy:]";
      v11 = "%s Not starting scheduled background connection because we have HIPAA On-Device Dictation enabled";
      v12 = v16;
      v13 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_8;
    }
    v17 = -[SiriCoreSiriBackgroundConnection initWithQueue:]([SiriCoreSiriBackgroundConnection alloc], "initWithQueue:", self->_queue);
    -[SiriCoreSiriBackgroundConnection setPeerType:](v17, "setPeerType:", self->_peerType);
    -[SiriCoreSiriBackgroundConnection setPeerVersion:](v17, "setPeerVersion:", self->_peerVersion);
    -[SiriCoreSiriBackgroundConnection setPeerProviderClass:](v17, "setPeerProviderClass:", self->_peerProviderClass);
    -[SiriCoreSiriBackgroundConnection setProductTypePrefix:](v17, "setProductTypePrefix:", self->_productTypePrefix);
    -[SiriCoreSiriBackgroundConnection setDelegate:](v17, "setDelegate:", self);
    -[SiriCoreSiriBackgroundConnection setSiriConnectionUsesPeerManagedSync:](v17, "setSiriConnectionUsesPeerManagedSync:", self->_siriConnectionUsesPeerManagedSync);
    -[SiriCoreSiriBackgroundConnection setUsesProxyConnection:](v17, "setUsesProxyConnection:", self->_usesProxyConnection);
    -[SiriCoreSiriBackgroundConnection setDeviceIsInWalkaboutExperimentGroup:](v17, "setDeviceIsInWalkaboutExperimentGroup:", self->_deviceIsInWalkaboutExperimentGroup);
    -[NSMutableSet addObject:](self->_pendingBackgroundConnections, "addObject:", v17);
    -[SiriCoreSiriConnection _connectionInfoForRoute:policy:](self, "_connectionInfoForRoute:policy:", v6, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
    {
      v20 = 136315394;
      v21 = "-[SiriCoreSiriConnection _startBackgroundConnectionWithRoute:policy:]";
      v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_211AB2000, v19, OS_LOG_TYPE_INFO, "%s Starting background connection with connection info: %@", (uint8_t *)&v20, 0x16u);
    }
    -[SiriCoreSiriBackgroundConnection startWithConnectionInfo:](v17, "startWithConnectionInfo:", v18);

  }
LABEL_9:

}

- (void)_scheduleBackgroundConnectionWithRoute:(id)a3 delay:(double)a4 policy:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  double v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  double v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[SiriCoreSiriConnection _scheduleBackgroundConnectionWithRoute:delay:policy:]";
    v20 = 2048;
    v21 = a4 * 1000.0;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_211AB2000, v10, OS_LOG_TYPE_INFO, "%s Scheduling connection after delay %.2f ms with route %@", buf, 0x20u);
  }
  queue = self->_queue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __78__SiriCoreSiriConnection__scheduleBackgroundConnectionWithRoute_delay_policy___block_invoke;
  v14[3] = &unk_24CCE63E0;
  v14[4] = self;
  v15 = v8;
  v17 = a4;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async(queue, v14);

}

- (void)start
{
  NSObject *v3;
  SAConnectionPolicy *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char IsAcceptable;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  uint64_t j;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  uint64_t k;
  void *v53;
  double v54;
  double v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t m;
  NSObject *v61;
  __int128 v62;
  uint64_t v63;
  void *v64;
  id obj;
  id obja;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint8_t v89[128];
  uint8_t v90[4];
  const char *v91;
  __int16 v92;
  void *v93;
  uint8_t buf[4];
  const char *v95;
  __int16 v96;
  double v97;
  __int16 v98;
  double v99;
  __int16 v100;
  id v101;
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v95 = "-[SiriCoreSiriConnection start]";
    _os_log_impl(&dword_211AB2000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v4 = self->_connectionPolicy;
  -[SAConnectionPolicy routes](v4, "routes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, buf, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v84;
    v63 = *MEMORY[0x24BE81AF0];
    *(_QWORD *)&v8 = 136315138;
    v62 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v84 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v11);
        objc_msgSend(v12, "cname", v62);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_RouteHostStringIsAcceptable(v13) & 1) == 0)
        {

LABEL_17:
          v21 = *MEMORY[0x24BE08FC0];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
            goto LABEL_23;
          *(_DWORD *)v90 = 136315394;
          v91 = "_PolicyRouteSetsForConnectionPolicy";
          v92 = 2112;
          v93 = v12;
          v19 = v21;
          v20 = "%s Skipping connection route with unacceptable cname and/or host: %@";
          v22 = 22;
          goto LABEL_19;
        }
        objc_msgSend(v12, "host");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        IsAcceptable = _RouteHostStringIsAcceptable(v14);

        if ((IsAcceptable & 1) == 0)
          goto LABEL_17;
        objc_msgSend(v12, "type");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v63);

        if (!v17)
          goto LABEL_20;
        if ((NetworkServiceProxyIsEnabled() & 1) != 0)
        {
          if (AFIsInternalInstall() && _AFPreferencesGetTuscanyStatus())
          {
            v18 = *MEMORY[0x24BE08FC0];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
              goto LABEL_23;
            *(_DWORD *)v90 = v62;
            v91 = "_PolicyRouteSetsForConnectionPolicy";
            v19 = v18;
            v20 = "%s Not using Tuscany policy as Tuscany is disabled in Internal Settings";
LABEL_27:
            v22 = 12;
LABEL_19:
            _os_log_impl(&dword_211AB2000, v19, OS_LOG_TYPE_INFO, v20, v90, v22);
            goto LABEL_23;
          }
LABEL_20:
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "priority"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKey:", v23);
          v24 = (id)objc_claimAutoreleasedReturnValue();
          if (!v24)
          {
            v24 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
            objc_msgSend(v6, "setObject:forKey:", v24, v23);
          }
          objc_msgSend(v24, "addObject:", v12);

          goto LABEL_23;
        }
        v25 = *MEMORY[0x24BE08FC0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v90 = v62;
          v91 = "_SiriCorePOPServiceExists";
          v19 = v25;
          v20 = "%s POP Service disabled.";
          goto LABEL_27;
        }
LABEL_23:
        ++v11;
      }
      while (v9 != v11);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, buf, 16);
      v9 = v26;
    }
    while (v26);
  }

  objc_msgSend(v6, "allKeys");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sortedArrayUsingSelector:", sel_compare_);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v28, "count"));
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  objc_msgSend(v28, "reverseObjectEnumerator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v80 != v33)
          objc_enumerationMutation(v30);
        objc_msgSend(v6, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
          objc_msgSend(v29, "addObject:", v35);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
    }
    while (v32);
  }

  -[SAConnectionPolicy globalTimeout](v4, "globalTimeout");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v36;
  if (v36)
  {
    objc_msgSend(v36, "doubleValue");
    v38 = fmin(v37 * 1000.0, 10.0);
  }
  else
  {
    v38 = 10.0;
  }
  +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics](SiriCoreNetworkingAnalytics, "sharedSiriCoreNetworkingAnalytics");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setNetworkConnectionId:", v40);

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  obja = v29;
  v41 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v76;
    v44 = 0.0;
    while (2)
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v76 != v43)
          objc_enumerationMutation(obja);
        v46 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v47 = v46;
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v72;
          v51 = 0.0;
          do
          {
            for (k = 0; k != v49; ++k)
            {
              if (*(_QWORD *)v72 != v50)
                objc_enumerationMutation(v47);
              objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * k), "timeout");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "doubleValue");
              v55 = v54 / 1000.0;

              if (v51 < v55)
                v51 = v55;
            }
            v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
          }
          while (v49);
        }
        else
        {
          v51 = 0.0;
        }

        if (v44 >= v38)
        {
          v61 = *MEMORY[0x24BE08FC0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315906;
            v95 = "-[SiriCoreSiriConnection start]";
            v96 = 2048;
            v97 = v44;
            v98 = 2048;
            v99 = v38;
            v100 = 2112;
            v101 = v47;
            _os_log_impl(&dword_211AB2000, v61, OS_LOG_TYPE_INFO, "%s Skipping connection policy route because they would take too long (%.3fs >= %.3fs): %@", buf, 0x2Au);
          }
          goto LABEL_71;
        }
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v56 = v47;
        v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
        if (v57)
        {
          v58 = v57;
          v59 = *(_QWORD *)v68;
          do
          {
            for (m = 0; m != v58; ++m)
            {
              if (*(_QWORD *)v68 != v59)
                objc_enumerationMutation(v56);
              -[SiriCoreSiriConnection _scheduleBackgroundConnectionWithRoute:delay:policy:](self, "_scheduleBackgroundConnectionWithRoute:delay:policy:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * m), v4, v44);
            }
            v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
          }
          while (v58);
        }

        v44 = v44 + fmin(v51, 5.0);
      }
      v42 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
      if (v42)
        continue;
      break;
    }
  }
  else
  {
    v44 = 0.0;
  }
LABEL_71:

  -[SiriCoreSiriConnection _scheduleBackgroundConnectionWithRoute:delay:policy:](self, "_scheduleBackgroundConnectionWithRoute:delay:policy:", 0, v4, v44);
}

- (void)sendCommand:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SiriCoreSiriConnection_sendCommand_errorHandler___block_invoke;
  block[3] = &unk_24CCE6C88;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)sendCommands:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__SiriCoreSiriConnection_sendCommands_errorHandler___block_invoke;
  block[3] = &unk_24CCE6C88;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)setSendPings:(BOOL)a3
{
  uint64_t v3;
  _QWORD v4[4];
  BOOL v5;

  v3 = MEMORY[0x24BDAC760];
  self->_sendPings = a3;
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __39__SiriCoreSiriConnection_setSendPings___block_invoke;
  v4[3] = &__block_descriptor_33_e42_v16__0__SiriCoreSiriBackgroundConnection_8l;
  v5 = a3;
  -[SiriCoreSiriConnection _waitForActiveConnection:](self, "_waitForActiveConnection:", v4);
}

- (void)barrier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__SiriCoreSiriConnection_barrier___block_invoke;
  v6[3] = &unk_24CCE6450;
  v7 = v4;
  v5 = v4;
  -[SiriCoreSiriConnection _waitForActiveConnection:](self, "_waitForActiveConnection:", v6);

}

- (void)probeConnection
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SiriCoreSiriConnection_probeConnection__block_invoke;
  block[3] = &unk_24CCE6BA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_cancelSynchronously:(id)a3
{
  void (**v4)(_QWORD);
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  -[SiriCoreSiriBackgroundConnection cancel](self->_activeBackgroundConnection, "cancel");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_pendingBackgroundConnections;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9++), "cancel");
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_comatoseBackgroundConnections;
  v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "cancel", (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  self->_isCanceledInternal = 1;
  if (v4)
    v4[2](v4);

}

- (void)cancelSynchronously:(BOOL)a3 onQueue:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void (**v8)(_QWORD);
  void *v9;
  OS_dispatch_queue *queue;
  _QWORD v11[5];
  void (**v12)(_QWORD);

  v5 = a4;
  v6 = a3;
  v8 = (void (**)(_QWORD))a5;
  v9 = v8;
  if (self->_isCanceled)
  {
    if (v8)
      v8[2](v8);
  }
  else
  {
    self->_isCanceled = 1;
    if (v5)
    {
      -[SiriCoreSiriConnection _cancelSynchronously:](self, "_cancelSynchronously:", v8);
    }
    else
    {
      queue = self->_queue;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __65__SiriCoreSiriConnection_cancelSynchronously_onQueue_completion___block_invoke;
      v11[3] = &unk_24CCE6758;
      v11[4] = self;
      v12 = v8;
      if (v6)
        MEMORY[0x24BDADFE8](queue, v11);
      else
        MEMORY[0x24BDADCC0](queue, v11);

    }
  }

}

- (id)analysisInfo
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1540;
  v10 = __Block_byref_object_dispose__1541;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__SiriCoreSiriConnection_analysisInfo__block_invoke;
  v5[3] = &unk_24CCE6730;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)getAnalysisInfo:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__SiriCoreSiriConnection_getAnalysisInfo___block_invoke;
  v7[3] = &unk_24CCE6758;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)getConnectionMetricsSynchronously:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  OS_dispatch_queue *queue;
  void (*v8)(OS_dispatch_queue *, _QWORD *);
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v6 = a4;
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__SiriCoreSiriConnection_getConnectionMetricsSynchronously_completion___block_invoke;
  v10[3] = &unk_24CCE6758;
  v10[4] = self;
  v11 = v6;
  if (v4)
    v8 = (void (*)(OS_dispatch_queue *, _QWORD *))MEMORY[0x24BDADFE8];
  else
    v8 = (void (*)(OS_dispatch_queue *, _QWORD *))MEMORY[0x24BDADCC0];
  v9 = v6;
  v8(queue, v10);

}

- (void)_accessPotentiallyActiveConnections:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (!self->_isCanceledInternal)
  {
    if (self->_activeBackgroundConnection)
    {
      (*((void (**)(id))v4 + 2))(v4);
    }
    else
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v6 = (void *)-[NSMutableSet copy](self->_pendingBackgroundConnections, "copy", 0);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            v5[2](v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }

    }
  }

}

- (void)_waitForActiveConnection:(id)a3
{
  id v4;
  NSObject *activeConnectionGroup;
  NSObject *queue;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    activeConnectionGroup = self->_activeConnectionGroup;
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__SiriCoreSiriConnection__waitForActiveConnection___block_invoke;
    block[3] = &unk_24CCE64B8;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    dispatch_group_notify(activeConnectionGroup, queue, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (id)_activeOrAnyPendingConnection
{
  SiriCoreSiriBackgroundConnection *activeBackgroundConnection;

  activeBackgroundConnection = self->_activeBackgroundConnection;
  if (activeBackgroundConnection)
    return activeBackgroundConnection;
  -[NSMutableSet anyObject](self->_pendingBackgroundConnections, "anyObject");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_handleLastEventFromBackgroundConnection:(id)a3 pendingConnectionExhaustionHandler:(id)a4
{
  void (**v6)(_QWORD);
  id v7;

  v7 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (-[NSMutableSet containsObject:](self->_pendingBackgroundConnections, "containsObject:", v7))
  {
    -[NSMutableSet addObject:](self->_comatoseBackgroundConnections, "addObject:", v7);
    -[NSMutableSet removeObject:](self->_pendingBackgroundConnections, "removeObject:", v7);
  }
  if (!self->_activeBackgroundConnection
    && !-[NSMutableSet count](self->_pendingBackgroundConnections, "count")
    && !-[NSMutableSet count](self->_scheduledRoutes, "count"))
  {
    v6[2](v6);
  }

}

- (void)siriBackgroundConnection:(id)a3 willStartWithConnectionType:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[SiriCoreSiriConnection siriBackgroundConnection:willStartWithConnectionType:]";
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_211AB2000, v6, OS_LOG_TYPE_INFO, "%s connectionType=%@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__SiriCoreSiriConnection_siriBackgroundConnection_willStartWithConnectionType___block_invoke;
  v9[3] = &unk_24CCE6BD0;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(queue, v9);

}

- (void)siriBackgroundConnection:(id)a3 didOpenWithConnectionType:(id)a4 routeId:(id)a5 delay:(double)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  double v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "getConnectionMethodUsed");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __91__SiriCoreSiriConnection_siriBackgroundConnection_didOpenWithConnectionType_routeId_delay___block_invoke;
  v19[3] = &unk_24CCE64E0;
  v19[4] = self;
  v20 = v10;
  v21 = v13;
  v22 = v11;
  v23 = v12;
  v24 = a6;
  v15 = v12;
  v16 = v11;
  v17 = v13;
  v18 = v10;
  dispatch_async(queue, v19);

}

- (void)siriBackgroundConnection:(id)a3 didReceiveAceObject:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[SiriCoreSiriConnection siriBackgroundConnection:didReceiveAceObject:]";
    _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__SiriCoreSiriConnection_siriBackgroundConnection_didReceiveAceObject___block_invoke;
  block[3] = &unk_24CCE63B8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

- (void)siriBackgroundConnectionDidClose:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__SiriCoreSiriConnection_siriBackgroundConnectionDidClose___block_invoke;
  v7[3] = &unk_24CCE6BD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)siriBackgroundConnection:(id)a3 didEncounterError:(id)a4 analysisInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "getConnectionMethodUsed");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__SiriCoreSiriConnection_siriBackgroundConnection_didEncounterError_analysisInfo___block_invoke;
  block[3] = &unk_24CCE6530;
  block[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v21 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async(queue, block);

}

- (void)siriBackgroundConnection:(id)a3 didEncounterIntermediateError:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SiriCoreSiriConnection *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__SiriCoreSiriConnection_siriBackgroundConnection_didEncounterIntermediateError___block_invoke;
  block[3] = &unk_24CCE63B8;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)siriBackgroundConnection:(id)a3 willStartConnectionWithHTTPHeader:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __85__SiriCoreSiriConnection_siriBackgroundConnection_willStartConnectionWithHTTPHeader___block_invoke;
  v8[3] = &unk_24CCE6BD0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)_recordConnectionMethodForMetrics:(id)a3
{
  id v4;
  NSMutableArray *connMethodUsedHistory;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSObject *v8;
  NSMutableArray *v9;
  int v10;
  const char *v11;
  __int16 v12;
  NSMutableArray *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  connMethodUsedHistory = self->_connMethodUsedHistory;
  if (!connMethodUsedHistory)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_connMethodUsedHistory;
    self->_connMethodUsedHistory = v6;

    connMethodUsedHistory = self->_connMethodUsedHistory;
  }
  -[NSMutableArray addObject:](connMethodUsedHistory, "addObject:", v4);
  v8 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v9 = self->_connMethodUsedHistory;
    v10 = 136315394;
    v11 = "-[SiriCoreSiriConnection _recordConnectionMethodForMetrics:]";
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v10, 0x16u);
  }

}

- (SiriCoreSiriConnectionDelegate)delegate
{
  return (SiriCoreSiriConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)skipPeer
{
  return self->_skipPeer;
}

- (void)setSkipPeer:(BOOL)a3
{
  self->_skipPeer = a3;
}

- (BOOL)useWiFiHint
{
  return self->_useWiFiHint;
}

- (void)setUseWiFiHint:(BOOL)a3
{
  self->_useWiFiHint = a3;
}

- (NSError)skipPeerError
{
  return self->_skipPeerError;
}

- (void)setSkipPeerError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)prefersWWAN
{
  return self->_prefersWWAN;
}

- (void)setPrefersWWAN:(BOOL)a3
{
  self->_prefersWWAN = a3;
}

- (BOOL)forceReconnect
{
  return self->_forceReconnect;
}

- (void)setForceReconnect:(BOOL)a3
{
  self->_forceReconnect = a3;
}

- (NSString)aceHost
{
  return self->_aceHost;
}

- (void)setAceHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSString)assistantIdentifier
{
  return self->_assistantIdentifier;
}

- (void)setAssistantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)peerAssistantIdentifier
{
  return self->_peerAssistantIdentifier;
}

- (void)setPeerAssistantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)peerType
{
  return self->_peerType;
}

- (void)setPeerType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)peerVersion
{
  return self->_peerVersion;
}

- (void)setPeerVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)productTypePrefix
{
  return self->_productTypePrefix;
}

- (void)setProductTypePrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)usesProxyConnection
{
  return self->_usesProxyConnection;
}

- (void)setUsesProxyConnection:(BOOL)a3
{
  self->_usesProxyConnection = a3;
}

- (BOOL)deviceIsInWalkaboutExperimentGroup
{
  return self->_deviceIsInWalkaboutExperimentGroup;
}

- (void)setDeviceIsInWalkaboutExperimentGroup:(BOOL)a3
{
  self->_deviceIsInWalkaboutExperimentGroup = a3;
}

- (BOOL)siriConnectionUsesPeerManagedSync
{
  return self->_siriConnectionUsesPeerManagedSync;
}

- (void)setSiriConnectionUsesPeerManagedSync:(BOOL)a3
{
  self->_siriConnectionUsesPeerManagedSync = a3;
}

- (Class)peerProviderClass
{
  return self->_peerProviderClass;
}

- (void)setPeerProviderClass:(Class)a3
{
  objc_storeStrong((id *)&self->_peerProviderClass, a3);
}

- (NSString)connectionId
{
  return self->_connectionId;
}

- (void)setConnectionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)imposePolicyBan
{
  return self->_imposePolicyBan;
}

- (void)setImposePolicyBan:(BOOL)a3
{
  self->_imposePolicyBan = a3;
}

- (SAConnectionPolicy)connectionPolicy
{
  return self->_connectionPolicy;
}

- (void)setConnectionPolicy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionPolicy, 0);
  objc_storeStrong((id *)&self->_skipPeerError, 0);
  objc_storeStrong((id *)&self->_connMethodUsedHistory, 0);
  objc_storeStrong((id *)&self->_peerProviderClass, 0);
  objc_storeStrong((id *)&self->_productTypePrefix, 0);
  objc_storeStrong((id *)&self->_peerVersion, 0);
  objc_storeStrong((id *)&self->_peerType, 0);
  objc_storeStrong((id *)&self->_activeConnectionGroup, 0);
  objc_storeStrong((id *)&self->_activeBackgroundConnection, 0);
  objc_storeStrong((id *)&self->_scheduledRoutes, 0);
  objc_storeStrong((id *)&self->_comatoseBackgroundConnections, 0);
  objc_storeStrong((id *)&self->_pendingBackgroundConnections, 0);
  objc_storeStrong((id *)&self->_connectionId, 0);
  objc_storeStrong((id *)&self->_peerAssistantIdentifier, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_aceHost, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __85__SiriCoreSiriConnection_siriBackgroundConnection_willStartConnectionWithHTTPHeader___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(v4, "siriConnection:willStartConnectionWithHTTPHeaderFields:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __81__SiriCoreSiriConnection_siriBackgroundConnection_didEncounterIntermediateError___block_invoke(uint64_t a1)
{
  void *v2;
  BOOL v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  int v9;
  id WeakRetained;
  char v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("SiriCoreSiriConnectionErrorDomain")))
    v3 = objc_msgSend(*(id *)(a1 + 32), "code") == 33;
  else
    v3 = 0;

  objc_msgSend(*(id *)(a1 + 32), "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("SiriCoreSiriConnectionErrorDomain")))
    v5 = objc_msgSend(*(id *)(a1 + 32), "code") == 35;
  else
    v5 = 0;

  objc_msgSend(*(id *)(a1 + 32), "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("SiriCoreSiriConnectionErrorDomain")))
    v7 = objc_msgSend(*(id *)(a1 + 32), "code") == 36;
  else
    v7 = 0;

  v8 = *(_QWORD *)(a1 + 40);
  if (v3 || (*(_QWORD *)(v8 + 136) == *(_QWORD *)(a1 + 48) ? (v9 = 1) : (v9 = v5), ((v9 | v7) & 1) != 0))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v8 + 24));
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = *MEMORY[0x24BE08FC0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
      {
        v13 = *(_QWORD *)(a1 + 32);
        v17 = 136315394;
        v18 = "-[SiriCoreSiriConnection siriBackgroundConnection:didEncounterIntermediateError:]_block_invoke";
        v19 = 2112;
        v20 = v13;
        _os_log_impl(&dword_211AB2000, v12, OS_LOG_TYPE_INFO, "%s Connection got intermediate error from active connection: %@", (uint8_t *)&v17, 0x16u);
      }
      v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
      objc_msgSend(v14, "siriConnection:didEncounterIntermediateError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

    }
  }
  else
  {
    v15 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = 136315394;
      v18 = "-[SiriCoreSiriConnection siriBackgroundConnection:didEncounterIntermediateError:]_block_invoke";
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_211AB2000, v15, OS_LOG_TYPE_INFO, "%s Connection got intermediate error from inactive connection. Error: %@", (uint8_t *)&v17, 0x16u);
    }
  }
}

void __82__SiriCoreSiriConnection_siriBackgroundConnection_didEncounterError_analysisInfo___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_QWORD *);
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = (void *)v2[17];
  v5 = *MEMORY[0x24BE08FC0];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO);
  if (v4 == v3)
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SiriCoreSiriConnection siriBackgroundConnection:didEncounterError:analysisInfo:]_block_invoke";
      v23 = 2112;
      v24 = v4;
      _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_INFO, "%s Got error from active connection: %@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 48), "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("SiriCoreSiriConnectionErrorDomain")))
    {
      v12 = objc_msgSend(*(id *)(a1 + 48), "code");

      if (v12 == 32)
        objc_msgSend(*(id *)(a1 + 40), "updateActiveBackgroundConnectionWithSecondary");
    }
    else
    {

    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(WeakRetained, "siriConnection:didEncounterError:analysisInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SiriCoreSiriConnection siriBackgroundConnection:didEncounterError:analysisInfo:]_block_invoke";
      v23 = 2112;
      v24 = v3;
      _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_INFO, "%s Got error from inactive connection: %@", buf, 0x16u);
      v2 = *(_QWORD **)(a1 + 32);
      v3 = *(void **)(a1 + 40);
    }
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __82__SiriCoreSiriConnection_siriBackgroundConnection_didEncounterError_analysisInfo___block_invoke_18;
    v16 = &unk_24CCE6508;
    v7 = v3;
    v8 = *(_QWORD *)(a1 + 32);
    v17 = v7;
    v18 = v8;
    v19 = *(id *)(a1 + 48);
    v20 = *(id *)(a1 + 56);
    objc_msgSend(v2, "_handleLastEventFromBackgroundConnection:pendingConnectionExhaustionHandler:", v7, &v13);
    v9 = *(_QWORD **)(a1 + 32);
    if (!v9[17])
      objc_msgSend(v9, "_recordConnectionMethodForMetrics:", *(_QWORD *)(a1 + 64), v13, v14, v15, v16);

    WeakRetained = v17;
  }

}

void __82__SiriCoreSiriConnection_siriBackgroundConnection_didEncounterError_analysisInfo___block_invoke_18(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v3 = a1[4];
    v5 = 136315394;
    v6 = "-[SiriCoreSiriConnection siriBackgroundConnection:didEncounterError:analysisInfo:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_211AB2000, v2, OS_LOG_TYPE_INFO, "%s Ran out of pending connections; forwarding error from last connection %@",
      (uint8_t *)&v5,
      0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 24));
  objc_msgSend(WeakRetained, "siriConnection:didEncounterError:analysisInfo:", a1[5], a1[6], a1[7]);

}

void __59__SiriCoreSiriConnection_siriBackgroundConnectionDidClose___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  id WeakRetained;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 136);
  v5 = *MEMORY[0x24BE08FC0];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO);
  if (v4 == v3)
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[SiriCoreSiriConnection siriBackgroundConnectionDidClose:]_block_invoke";
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_INFO, "%s Closing from active connection: %@", buf, 0x16u);
      v2 = *(_QWORD *)(a1 + 32);
    }
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 24));
    objc_msgSend(WeakRetained, "siriConnectionDidClose:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[SiriCoreSiriConnection siriBackgroundConnectionDidClose:]_block_invoke";
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_INFO, "%s Ignoring connection close from inactive connection: %@", buf, 0x16u);
      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(void **)(a1 + 40);
    }
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __59__SiriCoreSiriConnection_siriBackgroundConnectionDidClose___block_invoke_17;
    v10[3] = &unk_24CCE6BD0;
    v7 = v3;
    v8 = *(_QWORD *)(a1 + 32);
    v11 = v7;
    v12 = v8;
    objc_msgSend((id)v2, "_handleLastEventFromBackgroundConnection:pendingConnectionExhaustionHandler:", v7, v10);
    WeakRetained = v11;
  }

}

void __59__SiriCoreSiriConnection_siriBackgroundConnectionDidClose___block_invoke_17(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[SiriCoreSiriConnection siriBackgroundConnectionDidClose:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_211AB2000, v2, OS_LOG_TYPE_INFO, "%s Ran out of pending connections, forwarding close from last connection %@", (uint8_t *)&v5, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(WeakRetained, "siriConnectionDidClose:", *(_QWORD *)(a1 + 40));

}

void __71__SiriCoreSiriConnection_siriBackgroundConnection_didReceiveAceObject___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  id WeakRetained;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a1[4];
  v2 = a1[5];
  v4 = *(_QWORD *)(v3 + 136);
  v5 = *MEMORY[0x24BE08FC0];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO);
  if (v4 == v2)
  {
    if (v6)
    {
      v8 = 136315394;
      v9 = "-[SiriCoreSiriConnection siriBackgroundConnection:didReceiveAceObject:]_block_invoke";
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_INFO, "%s Received ace object from active connection: %@", (uint8_t *)&v8, 0x16u);
      v3 = a1[4];
    }
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 24));
    objc_msgSend(WeakRetained, "siriConnection:didReceiveAceObject:", a1[4], a1[6]);

  }
  else if (v6)
  {
    v8 = 136315394;
    v9 = "-[SiriCoreSiriConnection siriBackgroundConnection:didReceiveAceObject:]_block_invoke";
    v10 = 2112;
    v11 = v2;
    _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_INFO, "%s Ignoring ace object from inactive connection: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __91__SiriCoreSiriConnection_siriBackgroundConnection_didOpenWithConnectionType_routeId_delay___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 136);
  if (v3)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *MEMORY[0x24BE08FC0];
    v6 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO);
    if (v4 == v3)
    {
      if (v6)
      {
        v12 = 136315394;
        v13 = "-[SiriCoreSiriConnection siriBackgroundConnection:didOpenWithConnectionType:routeId:delay:]_block_invoke";
        v14 = 2112;
        v15 = v3;
        _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_INFO, "%s Connection opened twice or connection became viable again. %@", (uint8_t *)&v12, 0x16u);
      }
    }
    else
    {
      if (v6)
      {
        v7 = *(void **)(a1 + 48);
        v12 = 136315650;
        v13 = "-[SiriCoreSiriConnection siriBackgroundConnection:didOpenWithConnectionType:routeId:delay:]_block_invoke";
        v14 = 2112;
        v15 = v7;
        v16 = 2112;
        v17 = v4;
        _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_INFO, "%s A connection lost the race, canceling %@ connection %@", (uint8_t *)&v12, 0x20u);
        v4 = *(void **)(a1 + 40);
      }
      objc_msgSend(v4, "cancel");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeObject:", *(_QWORD *)(a1 + 40));
    }
  }
  else
  {
    v8 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
    {
      v10 = *(void **)(a1 + 40);
      v9 = *(void **)(a1 + 48);
      v12 = 136315650;
      v13 = "-[SiriCoreSiriConnection siriBackgroundConnection:didOpenWithConnectionType:routeId:delay:]_block_invoke";
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_INFO, "%s Connection opened and %@ won the race: %@", (uint8_t *)&v12, 0x20u);
      v2 = *(_QWORD *)(a1 + 32);
    }
    objc_storeStrong((id *)(v2 + 136), *(id *)(a1 + 40));
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(WeakRetained, "siriConnection:didOpenWithConnectionType:routeId:delay:method:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(double *)(a1 + 72));

    objc_msgSend(*(id *)(a1 + 32), "_recordConnectionMethodForMetrics:", *(_QWORD *)(a1 + 48));
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 144));
  }
}

void __79__SiriCoreSiriConnection_siriBackgroundConnection_willStartWithConnectionType___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "siriConnection:willStartWithConnectionType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __51__SiriCoreSiriConnection__waitForActiveConnection___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained && !*((_BYTE *)WeakRetained + 104))
    v3 = WeakRetained[17];
  else
    v3 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __71__SiriCoreSiriConnection_getConnectionMetricsSynchronously_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[SiriCoreSiriConnection getConnectionMetricsSynchronously:completion:]_block_invoke";
    _os_log_impl(&dword_211AB2000, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_activeOrAnyPendingConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "anyObject"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v3, "getConnectionMetrics:withCompletion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192), *(_QWORD *)(a1 + 40));

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }
}

void __42__SiriCoreSiriConnection_getAnalysisInfo___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_activeOrAnyPendingConnection");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "analysisInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

  }
}

void __38__SiriCoreSiriConnection_analysisInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_activeOrAnyPendingConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "analysisInfo");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __65__SiriCoreSiriConnection_cancelSynchronously_onQueue_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelSynchronously:", *(_QWORD *)(a1 + 40));
}

uint64_t __41__SiriCoreSiriConnection_probeConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessPotentiallyActiveConnections:", &__block_literal_global_1542);
}

uint64_t __41__SiriCoreSiriConnection_probeConnection__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "probeConnection");
}

void __34__SiriCoreSiriConnection_barrier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v3, "barrier:", v4);
LABEL_5:
    v3 = v5;
    goto LABEL_6;
  }
  if (v4)
  {
    v5 = 0;
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __39__SiriCoreSiriConnection_setSendPings___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSendPings:", *(unsigned __int8 *)(a1 + 32));
}

void __52__SiriCoreSiriConnection_sendCommands_errorHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__SiriCoreSiriConnection_sendCommands_errorHandler___block_invoke_2;
  v3[3] = &unk_24CCE6408;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_accessPotentiallyActiveConnections:", v3);

}

uint64_t __52__SiriCoreSiriConnection_sendCommands_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sendCommands:errorHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __51__SiriCoreSiriConnection_sendCommand_errorHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__SiriCoreSiriConnection_sendCommand_errorHandler___block_invoke_2;
  v3[3] = &unk_24CCE6408;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_accessPotentiallyActiveConnections:", v3);

}

uint64_t __51__SiriCoreSiriConnection_sendCommand_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sendCommand:moreComing:errorHandler:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
}

void __78__SiriCoreSiriConnection__scheduleBackgroundConnectionWithRoute_delay_policy___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  dispatch_time_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 128);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(v2 + 128), "addObject:");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  v5 = *(double *)(a1 + 56);
  if (v5 <= 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_startBackgroundConnectionWithRoute:policy:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v9 = *(NSObject **)(v7 + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __78__SiriCoreSiriConnection__scheduleBackgroundConnectionWithRoute_delay_policy___block_invoke_2;
    block[3] = &unk_24CCE63B8;
    block[4] = v7;
    v11 = v8;
    v12 = *(id *)(a1 + 48);
    dispatch_after(v6, v9, block);

  }
}

uint64_t __78__SiriCoreSiriConnection__scheduleBackgroundConnectionWithRoute_delay_policy___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startBackgroundConnectionWithRoute:policy:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
