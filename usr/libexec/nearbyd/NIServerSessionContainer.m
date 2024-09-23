@implementation NIServerSessionContainer

- (id)getQueueForInputingData
{
  return -[NIServerBaseSession getQueueForInputingData](self->_specializedSession, "getQueueForInputingData");
}

- (NIServerSessionContainer)init
{
  __assert_rtn("-[NIServerSessionContainer init]", "NIServerSessionContainer.mm", 296, "false");
}

- (NIServerSessionContainer)initWithClient:(id)a3 clientInfo:(const NIServerClientInfo *)a4 connection:(id)a5 authorizationManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NIServerSessionContainer *v15;
  NIServerSessionContainer *v16;
  uint64_t v17;
  NIServerClientPublisher *client;
  uint64_t v19;
  OS_dispatch_queue *connectionQueue;
  NSUUID *v21;
  NSUUID *sessionIdentifier;
  NSString *bundleIdentifier;
  NSObject *v24;
  void *v25;
  unsigned int v26;
  NSUUID *v27;
  NSData *localDiscoveryToken;
  NIServerAssertionManager *v29;
  NIServerAssertionManager *assertionManager;
  NSError *activationError;
  double v32;
  void *v34;
  void *v35;
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  unsigned int v40;
  __int16 v41;
  NSUUID *v42;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_queue"));
  dispatch_assert_queue_V2(v14);

  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerSessionContainer.mm"), 303, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

    if (v13)
      goto LABEL_3;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerSessionContainer.mm"), 304, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("authorizationManager"));

LABEL_3:
  v36.receiver = self;
  v36.super_class = (Class)NIServerSessionContainer;
  v15 = -[NIServerSessionContainer init](&v36, "init");
  v16 = v15;
  if (v15)
  {
    v15->_entitlementsLock._os_unfair_lock_opaque = 0;
    v17 = objc_claimAutoreleasedReturnValue(+[NIServerClientPublisher publisherForClient:](NIServerClientPublisher, "publisherForClient:", v11));
    client = v16->_client;
    v16->_client = (NIServerClientPublisher *)v17;

    objc_storeStrong((id *)&v16->_connection, a5);
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_queue"));
    connectionQueue = v16->_connectionQueue;
    v16->_connectionQueue = (OS_dispatch_queue *)v19;

    v21 = objc_opt_new(NSUUID);
    sessionIdentifier = v16->_sessionIdentifier;
    v16->_sessionIdentifier = v21;

    objc_storeStrong((id *)&v16->_signingIdentity, a4->var0);
    bundleIdentifier = v16->_bundleIdentifier;
    v16->_bundleIdentifier = 0;

    v16->_pid = a4->var1;
    *(_QWORD *)v16->_clientEntitlementsArray.__elems_ = 0;
    v16->_clientEntitlementsArray.__elems_[8] = 0;
    objc_storeStrong((id *)&v16->_authManager, a6);
    v24 = (id)qword_10085F520;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](v16, "signingIdentity"));
      v26 = -[NIServerSessionContainer pid](v16, "pid");
      v27 = v16->_sessionIdentifier;
      *(_DWORD *)buf = 138412802;
      v38 = v25;
      v39 = 1024;
      v40 = v26;
      v41 = 2112;
      v42 = v27;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#ses-container,Container init. Signing identity: %@, pid: %d, session identifier: %@", buf, 0x1Cu);

    }
    localDiscoveryToken = v16->_localDiscoveryToken;
    v16->_localDiscoveryToken = 0;

    *(_WORD *)&v16->_latestSessionContainerState = 0;
    v16->_latestBluetoothState = 0;
    v16->_latestAppState = 0;
    v29 = -[NIServerAssertionManager initWithClientPid:signingIdentity:sessionIdentifier:]([NIServerAssertionManager alloc], "initWithClientPid:signingIdentity:sessionIdentifier:", v16->_pid, v16->_signingIdentity, v16->_sessionIdentifier);
    assertionManager = v16->_assertionManager;
    v16->_assertionManager = v29;

    v16->_connectedToUwbProvider = 0;
    activationError = v16->_activationError;
    v16->_activationError = 0;

    v32 = sub_10000883C();
    v16->_initTime = v32;
    v16->_timeOfLatestContainerState = v32;
  }

  return v16;
}

- (void)dealloc
{
  NSObject *v3;
  NSString *signingIdentity;
  int pid;
  NSUUID *sessionIdentifier;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  NSString *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  NSUUID *v14;

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    signingIdentity = self->_signingIdentity;
    pid = self->_pid;
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    v10 = signingIdentity;
    v11 = 1024;
    v12 = pid;
    v13 = 2112;
    v14 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-container,Container dealloc. Signing identity: %@, pid: %d, session identifier: %@", buf, 0x1Cu);
  }
  if (self->_connectedToUwbProvider)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer uwbProvider](self, "uwbProvider"));
    objc_msgSend(v7, "disconnect");

    self->_connectedToUwbProvider = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)NIServerSessionContainer;
  -[NIServerSessionContainer dealloc](&v8, "dealloc");
}

- (PRUWBServiceProviding)uwbProvider
{
  PRUWBManagerAgent *v3;
  PRUWBManagerAgent *v4;
  PRUWBManagerAgent *uwbProvider;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  NIServerSessionContainer *v11;

  v11 = self;
  if (!self->_uwbProvider)
  {
    v3 = [PRUWBManagerAgent alloc];
    sub_100054FA8(&v11, &v9);
    v4 = -[PRUWBManagerAgent initWithClientReference:](v3, "initWithClientReference:", &v9);
    uwbProvider = v11->_uwbProvider;
    v11->_uwbProvider = v4;

    v6 = v10;
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
  return (PRUWBServiceProviding *)v11->_uwbProvider;
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc((Class)NSMutableString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession description](self->_specializedSession, "description"));
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("<Session Container %@ running with specialized session: %@>"), v7, v8);

  return (NSString *)v9;
}

- (PRWiFiServiceProviding)wifiProvider
{
  PRWiFiManagerAgent *wifiProvider;
  PRWiFiManagerAgent *v4;
  PRWiFiManagerAgent *v5;

  wifiProvider = self->_wifiProvider;
  if (!wifiProvider)
  {
    v4 = objc_alloc_init(PRWiFiManagerAgent);
    v5 = self->_wifiProvider;
    self->_wifiProvider = v4;

    wifiProvider = self->_wifiProvider;
  }
  return (PRWiFiServiceProviding *)wifiProvider;
}

- (BOOL)supportsSessionObservers
{
  return -[NIServerBaseSession supportsSessionObservers](self->_specializedSession, "supportsSessionObservers");
}

- (BOOL)addObservers:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[NIServerBaseSession supportsSessionObservers](self->_specializedSession, "supportsSessionObservers");
  if (v5)
  {
    -[NIServerClientPublisher addObservers:](self->_client, "addObservers:", v4);
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003CBE94();
  }

  return v5;
}

- (BOOL)removeObservers:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[NIServerBaseSession supportsSessionObservers](self->_specializedSession, "supportsSessionObservers");
  if (v5)
  {
    -[NIServerClientPublisher removeObservers:](self->_client, "removeObservers:", v4);
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003CBEC0();
  }

  return v5;
}

- (void)queryDeviceCapabilities:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  unsigned int v7;
  NSUUID *sessionIdentifier;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  unsigned int v14;
  __int16 v15;
  NSUUID *v16;

  v4 = (void (**)(id, void *))a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v11 = 138412802;
    v12 = v6;
    v13 = 1024;
    v14 = v7;
    v15 = 2112;
    v16 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - queryDeviceCapabilities. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v11, 0x1Cu);

  }
  v9 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer _getExpandedCapabilities](self, "_getExpandedCapabilities"));
  v4[2](v4, v10);

}

- (void)activate:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  NSObject *v5;
  char *v6;
  unsigned int v7;
  NSUUID *sessionIdentifier;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  char *v14;
  void *v15;
  NIServerAnalyticsManager *v16;
  NIServerAnalyticsManager *analyticsManager;
  void *v18;
  BOOL v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  NSError **v23;
  NSError *v24;
  uint64_t v25;
  NSError **p_activationError;
  NSError *activationError;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (char *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    v32 = v6;
    v33 = 1024;
    v34 = v7;
    v35 = 2112;
    v36 = (const char *)sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - activate. Signing identity: %@, pid: %d, session identifier: %@", buf, 0x1Cu);

  }
  v9 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  -[NIServerSessionContainer _setContainerState:](self, "_setContainerState:", 1);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("ForceCrash_SessionActivate"));

    if (v11)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003CBEEC();
      v28 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerSessionContainer.mm";
        v33 = 1024;
        v34 = 423;
        v35 = 2080;
        v36 = "-[NIServerSessionContainer activate:]";
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "#ses-container,%s:%d: assertion failure in %s", buf, 0x1Cu);
      }
      abort();
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 0, CFSTR("InternalClient"))));
  v30 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
  v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v13));

  if (-[NIServerSessionContainer _supportedPlatform](self, "_supportedPlatform"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer activationGuard](self, "activationGuard"));
    if ((objc_msgSend(v15, "isSessionAllowedToActivate:", self) & 1) != 0)
    {
      v16 = -[NIServerAnalyticsManager initWithBundleIdentifier:]([NIServerAnalyticsManager alloc], "initWithBundleIdentifier:", self->_bundleIdentifier);
      analyticsManager = self->_analyticsManager;
      self->_analyticsManager = v16;

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer uwbProvider](self, "uwbProvider"));
      v19 = (objc_msgSend(v18, "deviceCapabilities") & 1) == 0;

      if (!v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer uwbProvider](self, "uwbProvider"));
        objc_msgSend(v20, "connect");

        self->_connectedToUwbProvider = 1;
      }
      v21 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v32 = v14;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#ses-container,activation success. Response: %{private}@", buf, 0xCu);
      }
      -[NIServerSessionContainer _setContainerState:](self, "_setContainerState:", 2);
      v4[2](v4, v14, 0);
    }
    else
    {
      v25 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5885, 0));
      activationError = self->_activationError;
      p_activationError = &self->_activationError;
      *p_activationError = (NSError *)v25;

      ((void (**)(id, void *, NSError *))v4)[2](v4, v14, *p_activationError);
    }

  }
  else
  {
    v22 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5889, 0));
    v24 = self->_activationError;
    v23 = &self->_activationError;
    *v23 = (NSError *)v22;

    ((void (**)(id, void *, NSError *))v4)[2](v4, v14, *v23);
  }

}

- (void)runWithConfiguration:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, NSError *);
  NSObject *v8;
  NSUUID *v9;
  unsigned int v10;
  NSUUID *sessionIdentifier;
  NSObject *v12;
  OS_os_transaction *v13;
  OS_os_transaction *osTransaction;
  NSObject *v15;
  NSError *v16;
  NSError *v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  NSError *v21;
  uint64_t v22;
  uint64_t v23;
  __objc2_class **v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  objc_class *v33;
  NIServerBaseSession *specializedSession;
  uint64_t v35;
  const char *v36;
  NSObject *v37;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  NSObject *v41;
  NSUUID *v42;
  NSObject *v43;
  NIServerSessionLifeCycleManager *lifeCycleManager;
  NIServerBaseSession *v45;
  NIServerBaseSession *v46;
  NIServerBaseSession *v47;
  NIServerBaseSession *v48;
  NIServerBaseSession *v49;
  NIServerSessionLifeCycleManager *v50;
  NIServerSessionLifeCycleManager *v51;
  id v52;
  NIServerBaseSession *v53;
  void *v54;
  void *v55;
  unint64_t v56;
  unint64_t v57;
  void *v58;
  unint64_t v59;
  BOOL v60;
  NSObject *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  void *v67;
  BOOL v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  NSXPCConnection *connection;
  uint64_t v78;
  void *v79;
  id v80;
  void *v81;
  PAAccessInterval *v82;
  PAAccessInterval *v83;
  PAAccessInterval *paAccessInterval;
  NIServerVisionInternalSessionRequest *v85;
  void *v86;
  NIServerVisionInternalSessionRequest *v87;
  NIServerVisionInternalSessionRequest *visionSessionRequest;
  NSUUID *v89;
  const __CFString *v90;
  const __CFString *v91;
  const __CFString *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  void *v97;
  NSUUID *v98;
  unsigned int v99;
  NSUUID *v100;
  _OWORD v101[2];
  _QWORD v102[4];
  id v103;
  _QWORD v104[4];
  id v105;
  id v106;
  uint8_t buf[4];
  NSUUID *v108;
  __int16 v109;
  _BYTE v110[18];
  __int16 v111;
  const __CFString *v112;
  __int16 v113;
  const __CFString *v114;
  NSErrorUserInfoKey v115;
  const __CFString *v116;

  v6 = a3;
  v7 = (void (**)(id, NSError *))a4;
  v8 = (id)qword_10085F520;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v10 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    v108 = v9;
    v109 = 1024;
    *(_DWORD *)v110 = v10;
    *(_WORD *)&v110[4] = 2112;
    *(_QWORD *)&v110[6] = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - runWithConfiguration. Signing identity: %@, pid: %d, session identifier: %@", buf, 0x1Cu);

  }
  v12 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v12);

  if (-[NIServerSessionContainer _supportedPlatform](self, "_supportedPlatform"))
  {
    if (v6)
    {
      -[NIServerSessionContainer _setContainerState:](self, "_setContainerState:", 3);
      if (!self->_osTransaction)
      {
        v13 = (OS_os_transaction *)os_transaction_create("com.apple.nearbyd.hasActiveClient");
        osTransaction = self->_osTransaction;
        self->_osTransaction = v13;

      }
      if (self->_activationError)
      {
        v15 = (id)qword_10085F520;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_1003CC190(buf, -[NSError code](self->_activationError, "code"), v15);

        v7[2](v7, self->_activationError);
        goto LABEL_18;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer uwbProvider](self, "uwbProvider"));
      v19 = objc_msgSend(v18, "deviceCapabilities");

      v21 = (NSError *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer _displayPermissionsPromptIfNeeded](self, "_displayPermissionsPromptIfNeeded"));
      if (v21)
        goto LABEL_16;
      v22 = objc_opt_class(NINearbyPeerConfiguration, v20);
      if ((objc_opt_isKindOfClass(v6, v22) & 1) != 0)
      {
        v24 = off_1007F8670;
      }
      else
      {
        v25 = objc_opt_class(_NIWiFiRangingTestConfiguration, v23);
        if ((objc_opt_isKindOfClass(v6, v25) & 1) != 0)
        {
          v24 = &off_1007F8898;
        }
        else
        {
          v26 = objc_opt_class(NIHomeDeviceConfiguration, v23);
          if ((objc_opt_isKindOfClass(v6, v26) & 1) != 0)
          {
            v24 = off_1007F8660;
          }
          else
          {
            v27 = objc_opt_class(NIRangingAuthConfiguration, v23);
            if ((objc_opt_isKindOfClass(v6, v27) & 1) != 0)
            {
              v24 = off_1007F8678;
            }
            else
            {
              v28 = objc_opt_class(NICarKeyConfiguration, v23);
              if ((objc_opt_isKindOfClass(v6, v28) & 1) != 0)
              {
                v24 = off_1007F8648;
              }
              else
              {
                v29 = objc_opt_class(NIAcwgConfiguration, v23);
                if ((objc_opt_isKindOfClass(v6, v29) & 1) != 0)
                {
                  v24 = off_1007F8640;
                }
                else
                {
                  v30 = objc_opt_class(NINearbyAccessoryConfiguration, v23);
                  if ((objc_opt_isKindOfClass(v6, v30) & 1) != 0)
                  {
                    v24 = off_1007F8668;
                  }
                  else
                  {
                    v31 = objc_opt_class(NIDevicePresenceConfiguration, v23);
                    if ((objc_opt_isKindOfClass(v6, v31) & 1) != 0)
                    {
                      v24 = off_1007F8650;
                    }
                    else
                    {
                      v32 = objc_opt_class(NISpatialBrowsingConfiguration, v23);
                      if ((objc_opt_isKindOfClass(v6, v32) & 1) == 0)
                      {
                        v93 = objc_opt_class(NIFindingConfiguration, v23);
                        if ((objc_opt_isKindOfClass(v6, v93) & 1) != 0)
                        {
                          if (-[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 4))
                          {
                            v24 = off_1007F8658;
                            goto LABEL_37;
                          }
                          v96 = (id)qword_10085F520;
                          if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT))
                          {
                            v98 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
                            v99 = -[NIServerSessionContainer pid](self, "pid");
                            v100 = self->_sessionIdentifier;
                            *(_DWORD *)buf = 138412802;
                            v108 = v98;
                            v109 = 1024;
                            *(_DWORD *)v110 = v99;
                            *(_WORD *)&v110[4] = 2112;
                            *(_QWORD *)&v110[6] = v100;
                            _os_log_fault_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_FAULT, "#ses-container,Finding configuration not allowed. Signing identity: %@, pid: %d, session identifier: %@.", buf, 0x1Cu);

                          }
                          v115 = NSLocalizedFailureReasonErrorKey;
                          v116 = CFSTR("Finding configuration not allowed.");
                          v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1));
                          v21 = (NSError *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v97));

                        }
                        else
                        {
                          v95 = objc_opt_class(NISystemConfiguration, v94);
                          if ((objc_opt_isKindOfClass(v6, v95) & 1) != 0)
                          {
                            v24 = &off_1007F8688;
                            goto LABEL_37;
                          }
                          v21 = (NSError *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
                        }
                        if (v21)
                        {
                          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
                            sub_1003CC128();
LABEL_16:
                          v7[2](v7, v21);
LABEL_17:

                          goto LABEL_18;
                        }
                        v33 = 0;
LABEL_38:
                        specializedSession = self->_specializedSession;
                        if (specializedSession)
                        {
                          if (-[NIServerBaseSession updateConfiguration:](specializedSession, "updateConfiguration:", v6))
                          {
                            v35 = qword_10085F520;
                            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_WORD *)buf = 0;
                              v36 = "#ses-container,runWithConfiguration can update previous configuration.";
                              v37 = v35;
LABEL_45:
                              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v36, buf, 2u);
                              goto LABEL_58;
                            }
                            goto LABEL_58;
                          }
                          v38 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession lastConfiguration](self->_specializedSession, "lastConfiguration"));
                          v39 = objc_msgSend(v38, "isEqual:", v6);

                          v40 = qword_10085F520;
                          if (v39)
                          {
                            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_WORD *)buf = 0;
                              v36 = "#ses-container,runWithConfiguration with previously run configuration.";
                              v37 = v40;
                              goto LABEL_45;
                            }
LABEL_58:
                            v56 = -[NIServerBaseSession requiresUWBToRun](self->_specializedSession, "requiresUWBToRun");
                            v57 = -[NIServerBaseSession requiresNarrowbandToRun](self->_specializedSession, "requiresNarrowbandToRun");
                            if (v57 == 2 && v56 != 2)
                              __assert_rtn("-[NIServerSessionContainer runWithConfiguration:reply:]", "NIServerSessionContainer.mm", 683, "requiresUWBToRun");
                            if (v56 == 2)
                            {
                              v58 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer uwbProvider](self, "uwbProvider"));
                              v59 = (unint64_t)objc_msgSend(v58, "currentServiceState");

                              v60 = (_DWORD)v59 == 1;
                              if (v57 != 2)
                                v60 = (v59 - 1) < 2;
                              if (!v60)
                              {
                                v61 = qword_10085F520;
                                if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
                                {
                                  v89 = self->_sessionIdentifier;
                                  v90 = CFSTR("NO");
                                  *(_DWORD *)buf = 138413314;
                                  if (v57 == 2)
                                    v91 = CFSTR("YES");
                                  else
                                    v91 = CFSTR("NO");
                                  v108 = v89;
                                  v109 = 2112;
                                  if ((v59 - 1) >= 2)
                                    v92 = CFSTR("NO");
                                  else
                                    v92 = CFSTR("YES");
                                  *(_QWORD *)v110 = CFSTR("YES");
                                  if ((_DWORD)v59 == 1)
                                    v90 = CFSTR("YES");
                                  *(_WORD *)&v110[8] = 2112;
                                  *(_QWORD *)&v110[10] = v91;
                                  v111 = 2112;
                                  v112 = v92;
                                  v113 = 2112;
                                  v114 = v90;
                                  _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "#ses-container,Specialized session %@, requires UWB: %@, requires NB: %@, UWB available: %@, NB available: %@", buf, 0x34u);
                                }
                                v21 = (NSError *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer _fatalErrorForUwbServiceState:cause:](self, "_fatalErrorForUwbServiceState:cause:", v59, HIDWORD(v59)));
                                if (!v21)
                                {
                                  if (!-[NIServerSessionContainer _updateInterruptionForUWBServiceState:cause:requiresNarrowBand:](self, "_updateInterruptionForUWBServiceState:cause:requiresNarrowBand:", v59, HIDWORD(v59), v57 == 2))__assert_rtn("-[NIServerSessionContainer runWithConfiguration:reply:]", "NIServerSessionContainer.mm", 730, "false");
                                  v7[2](v7, 0);
                                  v21 = 0;
                                  goto LABEL_17;
                                }
                                goto LABEL_77;
                              }
                            }
                            if (-[NIServerBaseSession requiresSpatialInteractionBluetoothResource](self->_specializedSession, "requiresSpatialInteractionBluetoothResource"))
                            {
                              -[NIServerSessionContainer _activateBluetoothResource](self, "_activateBluetoothResource");
                            }
                            v21 = (NSError *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession configure](self->_specializedSession, "configure"));
                            if (v21)
                            {
                              if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
                                sub_1003CC058();
LABEL_77:
                              v7[2](v7, v21);
                              goto LABEL_17;
                            }
                            if (!-[NIServerBaseSession supportsCameraAssistance](self->_specializedSession, "supportsCameraAssistance")&& objc_msgSend(v6, "_internalIsCameraAssistanceEnabled"))
                            {
                              if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
                                sub_1003CBFE4();
                              v21 = (NSError *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
                              ((void (*)(void (**)(id, NSError *)))v7[2])(v7);
                              goto LABEL_17;
                            }
                            if (-[NIServerBaseSession supportsSessionObservers](self->_specializedSession, "supportsSessionObservers"))
                            {
                              v62 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer observationRegistrar](self, "observationRegistrar"));
                              objc_msgSend(v62, "registerObserversForSession:", self);

                            }
                            if (objc_msgSend(v6, "_internalIsCameraAssistanceEnabled"))
                            {
                              v63 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerVisionDataDistributor sharedProvider](NIServerVisionDataDistributor, "sharedProvider"));
                              objc_msgSend(v63, "registerForVisionInput:", self->_specializedSession);

                            }
                            if (!-[NIServerBaseSession supportsDevicePresence](self->_specializedSession, "supportsDevicePresence"))
                            {
LABEL_91:
                              v21 = (NSError *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession run](self->_specializedSession, "run"));
                              if (v21)
                              {
                                if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
                                  sub_1003CBF7C();
                                v71 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerVisionDataDistributor sharedProvider](NIServerVisionDataDistributor, "sharedProvider"));
                                objc_msgSend(v71, "unregisterForVisionInput:", self->_specializedSession);

                                v72 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer devicePresenceResource](self, "devicePresenceResource"));
                                v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "internalObserver"));
                                objc_msgSend(v73, "stopLeechingForConsumer:", self);

                                v74 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer devicePresenceResource](self, "devicePresenceResource"));
                                v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "internalObserver"));
                                objc_msgSend(v75, "unregisterForInternalBluetoothSamples:", self);

                                v7[2](v7, v21);
                                goto LABEL_17;
                              }
                              -[NIServerSessionContainer _setContainerState:](self, "_setContainerState:", 4);
                              v7[2](v7, 0);
                              v76 = kTCCServiceNearbyInteraction;
                              connection = self->_connection;
                              if (connection)
                                -[NSXPCConnection auditToken](connection, "auditToken");
                              else
                                memset(v101, 0, sizeof(v101));
                              v78 = PAAuthenticatedClientIdentity(v101, 0);
                              v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
                              if (v79)
                              {
                                v80 = objc_msgSend(objc_alloc((Class)PAApplication), "initWithTCCIdentity:", v79);
                                if (v80)
                                {
                                  v81 = (void *)objc_claimAutoreleasedReturnValue(+[PATCCAccess accessWithAccessor:forService:](PATCCAccess, "accessWithAccessor:forService:", v80, v76));
                                  if (v81)
                                  {
                                    v82 = (PAAccessInterval *)objc_claimAutoreleasedReturnValue(+[PAAccessLogger sharedInstance](PAAccessLogger, "sharedInstance"));
                                    v83 = (PAAccessInterval *)objc_claimAutoreleasedReturnValue(-[PAAccessInterval beginIntervalForAccess:](v82, "beginIntervalForAccess:", v81));
                                    paAccessInterval = self->_paAccessInterval;
                                    self->_paAccessInterval = v83;

                                    goto LABEL_104;
                                  }
                                }
                              }
                              else
                              {
                                v80 = 0;
                              }
                              v81 = 0;
                              v82 = self->_paAccessInterval;
                              self->_paAccessInterval = 0;
LABEL_104:

                              if (objc_msgSend(v6, "_internalIsCameraAssistanceEnabled")
                                && (objc_msgSend(v6, "_internalIsCameraAssistanceInClientProcess") & 1) == 0)
                              {
                                v85 = [NIServerVisionInternalSessionRequest alloc];
                                v86 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_sessionIdentifier, "UUIDString"));
                                v87 = -[NIServerVisionInternalSessionRequest initWithIdentifier:observer:](v85, "initWithIdentifier:observer:", v86, self);
                                visionSessionRequest = self->_visionSessionRequest;
                                self->_visionSessionRequest = v87;

                                -[NIServerVisionInternalSessionRequest activate](self->_visionSessionRequest, "activate");
                              }
                              -[NIServerAnalyticsManager sessionSuccessfullyRanWithConfig:withTimestamp:](self->_analyticsManager, "sessionSuccessfullyRanWithConfig:withTimestamp:", v6, sub_10000883C());

                              v21 = 0;
                              goto LABEL_17;
                            }
                            v65 = objc_opt_class(NIDevicePresenceConfiguration, v64);
                            if ((objc_opt_isKindOfClass(v6, v65) & 1) != 0)
                            {
                              v66 = v6;
                              v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "token"));
                              v68 = v67 == 0;

                              if (!v68)
                              {
                                v69 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer devicePresenceResource](self, "devicePresenceResource"));
                                v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "internalObserver"));
                                objc_msgSend(v70, "registerForInternalBluetoothSamples:reportCache:", self, 0);

LABEL_90:
                                goto LABEL_91;
                              }

                            }
                            v66 = (id)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer devicePresenceResource](self, "devicePresenceResource"));
                            v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "internalObserver"));
                            objc_msgSend(v69, "registerForInternalBluetoothSamples:", self);
                            goto LABEL_90;
                          }
                          v41 = (id)qword_10085F520;
                          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                          {
                            v42 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession lastConfiguration](self->_specializedSession, "lastConfiguration"));
                            *(_DWORD *)buf = 138412546;
                            v108 = v42;
                            v109 = 2112;
                            *(_QWORD *)v110 = v6;
                            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "#ses-container,Existing session with different config.\nCurrent:%@\nNew:%@", buf, 0x16u);

                          }
                        }
                        v43 = qword_10085F520;
                        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "#ses-container,Creating a new session.", buf, 2u);
                        }
                        -[NIServerBaseSession invalidate](self->_specializedSession, "invalidate");
                        lifeCycleManager = self->_lifeCycleManager;
                        self->_lifeCycleManager = 0;

                        v45 = self->_specializedSession;
                        self->_specializedSession = 0;

                        sub_100055054(&self->_interruptionsMap.__table_.__bucket_list_.__ptr_.__value_);
                        v106 = 0;
                        v46 = (NIServerBaseSession *)objc_msgSend([v33 alloc], "initWithResourcesManager:configuration:error:", self, v6, &v106);
                        v21 = (NSError *)v106;
                        v47 = self->_specializedSession;
                        self->_specializedSession = v46;

                        if (v21)
                        {
                          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
                            sub_1003CC0C0();
                          v7[2](v7, v21);
                          goto LABEL_17;
                        }
                        objc_initWeak((id *)buf, self);
                        v48 = self->_specializedSession;
                        v104[0] = _NSConcreteStackBlock;
                        v104[1] = 3221225472;
                        v104[2] = sub_10004B750;
                        v104[3] = &unk_1007FA0A0;
                        objc_copyWeak(&v105, (id *)buf);
                        -[NIServerBaseSession setInvalidationHandler:](v48, "setInvalidationHandler:", v104);
                        v49 = self->_specializedSession;
                        v102[0] = _NSConcreteStackBlock;
                        v102[1] = 3221225472;
                        v102[2] = sub_10004B7B0;
                        v102[3] = &unk_1007FB4C8;
                        objc_copyWeak(&v103, (id *)buf);
                        -[NIServerBaseSession setBackgroundSupportUpdateHandler:](v49, "setBackgroundSupportUpdateHandler:", v102);
                        v50 = -[NIServerSessionLifeCycleManager initWithSessionIdentifier:cycleRate:updatesQueue:analyticsManager:]([NIServerSessionLifeCycleManager alloc], "initWithSessionIdentifier:cycleRate:updatesQueue:analyticsManager:", self->_sessionIdentifier, -[NIServerBaseSession nominalCycleRate](self->_specializedSession, "nominalCycleRate"), self->_connectionQueue, self->_analyticsManager);
                        v51 = self->_lifeCycleManager;
                        self->_lifeCycleManager = v50;

                        v52 = -[NIServerSessionLifeCycleManager addObserver:](self->_lifeCycleManager, "addObserver:", self->_specializedSession);
                        v53 = self->_specializedSession;
                        v54 = (void *)voucher_copy(v52);
                        -[NIServerBaseSession setClientVoucher:](v53, "setClientVoucher:", v54);

                        if ((v19 & 1) != 0)
                        {
                          v55 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer uwbProvider](self, "uwbProvider"));
                          objc_msgSend(v55, "requestAsyncServiceStatusUpdate");

                        }
                        -[NIServerSessionContainer _handleSpecializedSessionBackgroundSupportUpdate:](self, "_handleSpecializedSessionBackgroundSupportUpdate:", -[NIServerBaseSession supportsBackgroundedClients](self->_specializedSession, "supportsBackgroundedClients"));
                        objc_destroyWeak(&v103);
                        objc_destroyWeak(&v105);
                        objc_destroyWeak((id *)buf);
                        goto LABEL_58;
                      }
                      v24 = off_1007F8680;
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_37:
      v33 = (objc_class *)objc_opt_class(*v24, v23);
      goto LABEL_38;
    }
    v17 = (NSError *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
    v7[2](v7, v17);

    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CBF18();
  }
  else
  {
    v16 = (NSError *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5889, 0));
    v7[2](v7, v16);

    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CC1D4();
  }
LABEL_18:

}

- (void)pause:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  unsigned int v7;
  NSUUID *sessionIdentifier;
  NSObject *v9;
  PAAccessInterval *paAccessInterval;
  PAAccessInterval *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  NSUUID *v20;

  v4 = (void (**)(id, void *))a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v15 = 138412802;
    v16 = v6;
    v17 = 1024;
    v18 = v7;
    v19 = 2112;
    v20 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - pause. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v15, 0x1Cu);

  }
  v9 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  if (-[NIServerSessionContainer _supportedPlatform](self, "_supportedPlatform"))
  {
    if (self->_specializedSession)
    {
      -[NIServerSessionContainer _setContainerState:](self, "_setContainerState:", 5);
      paAccessInterval = self->_paAccessInterval;
      if (paAccessInterval)
      {
        -[PAAccessInterval end](paAccessInterval, "end");
        v11 = self->_paAccessInterval;
        self->_paAccessInterval = 0;

      }
      -[NIServerAnalyticsManager sessionPausedWithTimestamp:](self->_analyticsManager, "sessionPausedWithTimestamp:", sub_10000883C());
      -[NIServerBaseSession setClientVoucher:](self->_specializedSession, "setClientVoucher:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession pauseWithSource:](self->_specializedSession, "pauseWithSource:", 1));
      if (!v12)
        -[NIServerSessionContainer _setContainerState:](self, "_setContainerState:", 6);
      v4[2](v4, v12);

    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
      v4[2](v4, v14);

      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003CBF18();
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5889, 0));
    v4[2](v4, v13);

    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CC1D4();
  }

}

- (void)generateDiscoveryToken
{
  NSObject *v3;
  void *v4;
  unsigned int v5;
  NSUUID *sessionIdentifier;
  NSObject *v7;
  int v8;
  void *v9;
  __int16 v10;
  unsigned int v11;
  __int16 v12;
  NSUUID *v13;

  v3 = (id)qword_10085F520;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v5 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v8 = 138412802;
    v9 = v4;
    v10 = 1024;
    v11 = v5;
    v12 = 2112;
    v13 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - generateDiscoveryToken. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v8, 0x1Cu);

  }
  v7 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v7);

  -[NIServerSessionContainer _activateBluetoothResource](self, "_activateBluetoothResource");
}

- (void)notifySystemShutdownWithReason:(int64_t)a3 reply:(id)a4
{
  void (**v6)(id, int64_t);
  NSObject *v7;
  void *v8;
  unsigned int v9;
  NSUUID *sessionIdentifier;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSErrorUserInfoKey v17;
  const __CFString *v18;
  NSErrorUserInfoKey v19;
  const __CFString *v20;
  NSErrorUserInfoKey v21;
  const __CFString *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  NSUUID *v28;

  v6 = (void (**)(id, int64_t))a4;
  v7 = (id)qword_10085F520;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v9 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    v24 = v8;
    v25 = 1024;
    v26 = v9;
    v27 = 2112;
    v28 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - notifySystemShutdownWithReason. Signing identity: %@, pid: %d, session identifier: %@", buf, 0x1Cu);

  }
  if (-[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 6))
  {
    if ((unint64_t)(a3 - 1) >= 2)
    {
      if (a3)
      {
        v19 = NSLocalizedDescriptionKey;
        v20 = CFSTR("Invalid reason.");
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
        a3 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v14));

      }
    }
    else
    {
      v11 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-container,#shutdown STARTING non-user shutdown tasks", buf, 2u);
      }
      v12 = sub_1002CA108();
      if ((sub_1002CA358((uint64_t)v12) & 1) != 0)
      {
        a3 = 0;
      }
      else
      {
        v17 = NSLocalizedDescriptionKey;
        v18 = CFSTR("Shutdown operation failed.");
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
        a3 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v15));

      }
      v16 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#ses-container,#shutdown FINISHED non-user shutdown tasks", buf, 2u);
      }
    }
    v6[2](v6, a3);
  }
  else
  {
    v21 = NSLocalizedDescriptionKey;
    v22 = CFSTR("Operation disallowed.");
    a3 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, a3));
    v6[2](v6, (int64_t)v13);

  }
}

- (void)_provideTruthTag:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  NSUUID *sessionIdentifier;
  NSObject *v9;
  int v10;
  void *v11;
  __int16 v12;
  unsigned int v13;
  __int16 v14;
  NSUUID *v15;

  v4 = a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v10 = 138412802;
    v11 = v6;
    v12 = 1024;
    v13 = v7;
    v14 = 2112;
    v15 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - _provideTruthTag. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v10, 0x1Cu);

  }
  v9 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  sub_100056060(v4);
}

- (void)_addObject:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  unsigned int v10;
  NSUUID *sessionIdentifier;
  NSObject *v12;
  NIServerBaseSession *specializedSession;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  NSUUID *v22;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (id)qword_10085F520;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v10 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v17 = 138412802;
    v18 = v9;
    v19 = 1024;
    v20 = v10;
    v21 = 2112;
    v22 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - _addObject. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v17, 0x1Cu);

  }
  v12 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v12);

  if (-[NIServerSessionContainer _supportedPlatform](self, "_supportedPlatform"))
  {
    specializedSession = self->_specializedSession;
    if (specializedSession)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession addObject:](specializedSession, "addObject:", v6));
      v7[2](v7, v14);

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
      v7[2](v7, v16);

      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003CBF18();
    }
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5889, 0));
    v7[2](v7, v15);

    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CC1D4();
  }

}

- (void)_removeObject:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  unsigned int v10;
  NSUUID *sessionIdentifier;
  NSObject *v12;
  NIServerBaseSession *specializedSession;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  NSUUID *v22;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (id)qword_10085F520;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v10 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v17 = 138412802;
    v18 = v9;
    v19 = 1024;
    v20 = v10;
    v21 = 2112;
    v22 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - _removeObject. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v17, 0x1Cu);

  }
  v12 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v12);

  if (-[NIServerSessionContainer _supportedPlatform](self, "_supportedPlatform"))
  {
    specializedSession = self->_specializedSession;
    if (specializedSession)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession removeObject:](specializedSession, "removeObject:", v6));
      v7[2](v7, v14);

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
      v7[2](v7, v16);

      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003CBF18();
    }
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5889, 0));
    v7[2](v7, v15);

    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CC1D4();
  }

}

- (void)isPreciseRangingAllowed:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  void *v6;
  unsigned int v7;
  NSUUID *sessionIdentifier;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  unsigned int v14;
  __int16 v15;
  NSUUID *v16;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v11 = 138412802;
    v12 = v6;
    v13 = 1024;
    v14 = v7;
    v15 = 2112;
    v16 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - isPreciseRangingAllowed. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v11, 0x1Cu);

  }
  v9 = sub_1002CA108();
  v10 = (*(uint64_t (**)(void *))(*(_QWORD *)v9 + 152))(v9);
  v4[2](v4, v10, 0);

}

- (void)isExtendedDistanceMeasurementAllowed:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  void *v6;
  unsigned int v7;
  NSUUID *sessionIdentifier;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  NSUUID *v17;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v12 = 138412802;
    v13 = v6;
    v14 = 1024;
    v15 = v7;
    v16 = 2112;
    v17 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - isExtendedDistanceMeasurementAllowed. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v12, 0x1Cu);

  }
  v9 = sub_1002CA108();
  if ((*(unsigned int (**)(void *))(*(_QWORD *)v9 + 152))(v9))
  {
    v10 = sub_1002CA108();
    v11 = (*(uint64_t (**)(void *))(*(_QWORD *)v10 + 160))(v10);
  }
  else
  {
    v11 = 0;
  }
  v4[2](v4, v11, 0);

}

- (void)processDCKMessage:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  void *v9;
  unsigned int v10;
  NSUUID *sessionIdentifier;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NIServerBaseSession *specializedSession;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  NSUUID *v32;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = (id)qword_10085F520;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v10 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v27 = 138412802;
    v28 = v9;
    v29 = 1024;
    v30 = v10;
    v31 = 2112;
    v32 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - processDCKMessage. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v27, 0x1Cu);

  }
  v12 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v12);

  if (self->_interruptionsMap.__table_.__p2_.__value_)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10014, 0));
    v7[2](v7, 0, v13);

    v14 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CC238(v14, v15, v16, v17, v18, v19, v20, v21);
    -[NIServerSessionContainer _dumpInterruptionsMapWithDebugString:](self, "_dumpInterruptionsMapWithDebugString:", CFSTR("processDCKMessage"));
  }
  else
  {
    specializedSession = self->_specializedSession;
    if (specializedSession)
    {
      v23 = -[NIServerBaseSession processDCKMessage:](specializedSession, "processDCKMessage:", v6);
      v25 = v24;
      ((void (**)(id, id, void *))v7)[2](v7, v23, v24);

    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
      v7[2](v7, 0, v26);

      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003CBF18();
    }
  }

}

- (void)processBluetoothHostTimeSyncWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5 reply:(id)a6
{
  void (**v10)(id, id, void *);
  NSObject *v11;
  void *v12;
  unsigned int v13;
  NSUUID *sessionIdentifier;
  NSObject *v15;
  double v16;
  NIServerBaseSession *specializedSession;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  NSErrorUserInfoKey v30;
  const __CFString *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  NSUUID *v37;

  v10 = (void (**)(id, id, void *))a6;
  v11 = (id)qword_10085F520;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v13 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    v33 = v12;
    v34 = 1024;
    v35 = v13;
    v36 = 2112;
    v37 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - processBluetoothHostTimeSyncWithType. Signing identity: %@, pid: %d, session identifier: %@", buf, 0x1Cu);

  }
  v15 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v15);

  v16 = sub_10000883C();
  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    v29 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession processBluetoothHostTimeSyncWithType:btcClockTicks:eventCounter:monotonicTimeSec:response:](specializedSession, "processBluetoothHostTimeSyncWithType:btcClockTicks:eventCounter:monotonicTimeSec:response:", a3, a4, a5, &v29, v16));
    v19 = v29;
    v10[2](v10, v19, v18);

  }
  else
  {
    v20 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CC2A4(v20, v21, v22, v23, v24, v25, v26, v27);
    v30 = NSLocalizedDescriptionKey;
    v31 = CFSTR("processBluetoothHostTimeSyncWithType called before -runWithConfiguration:");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v28));

    v10[2](v10, 0, v18);
  }

}

- (void)isRangingLimitExceeded:(id)a3
{
  void (**v4)(id, id, void *);
  NSObject *v5;
  void *v6;
  unsigned int v7;
  NSUUID *sessionIdentifier;
  NSObject *v9;
  NIServerBaseSession *specializedSession;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  NSUUID *v22;

  v4 = (void (**)(id, id, void *))a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v17 = 138412802;
    v18 = v6;
    v19 = 1024;
    v20 = v7;
    v21 = 2112;
    v22 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - isRangingLimitExceeded. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v17, 0x1Cu);

  }
  v9 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    v11 = -[NIServerBaseSession isRangingLimitExceeded](specializedSession, "isRangingLimitExceeded");
    v12 = v11;
    v14 = v13;
    if (v11)
      v15 = objc_msgSend(v11, "BOOLValue");
    else
      v15 = 0;
    v4[2](v4, v15, v14);

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
    v4[2](v4, 0, v16);

    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CBF18();
  }

}

- (void)deleteURSKs:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  unsigned int v7;
  NSUUID *sessionIdentifier;
  NSObject *v9;
  NIServerBaseSession *specializedSession;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  NSUUID *v18;

  v4 = (void (**)(id, void *))a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v13 = 138412802;
    v14 = v6;
    v15 = 1024;
    v16 = v7;
    v17 = 2112;
    v18 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - deleteURSKs. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v13, 0x1Cu);

  }
  v9 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession deleteURSKs](specializedSession, "deleteURSKs"));
    v4[2](v4, v11);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
    v4[2](v4, v12);

    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CBF18();
  }

}

- (void)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4 reply:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, void *);
  NSObject *v10;
  void *v11;
  unsigned int v12;
  NSUUID *sessionIdentifier;
  NSObject *v14;
  NIServerBaseSession *specializedSession;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  void *v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  NSUUID *v32;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  v10 = (id)qword_10085F520;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v12 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v27 = 138412802;
    v28 = v11;
    v29 = 1024;
    v30 = v12;
    v31 = 2112;
    v32 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - _setDebugURSK. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v27, 0x1Cu);

  }
  v14 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v14);

  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    if (v8)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession _setDebugURSK:transactionIdentifier:](specializedSession, "_setDebugURSK:transactionIdentifier:", v8, v6));
      v9[2](v9, v16);

    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -19886, 0));
      v9[2](v9, v18);

      v19 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003CC314(v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
    v9[2](v9, v17);

    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CBF18();
  }

}

- (void)_setURSKTTL:(unint64_t)a3 reply:(id)a4
{
  void (**v6)(id, void *);
  NSObject *v7;
  void *v8;
  unsigned int v9;
  NSUUID *sessionIdentifier;
  NSObject *v11;
  NIServerBaseSession *specializedSession;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  NSUUID *v20;

  v6 = (void (**)(id, void *))a4;
  v7 = (id)qword_10085F520;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v9 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v15 = 138412802;
    v16 = v8;
    v17 = 1024;
    v18 = v9;
    v19 = 2112;
    v20 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - _setURSKTTL. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v15, 0x1Cu);

  }
  v11 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v11);

  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession _setURSKTTL:](specializedSession, "_setURSKTTL:", a3));
    v6[2](v6, v13);

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
    v6[2](v6, v14);

    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CBF18();
  }

}

- (void)_processCarKeyEvent:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  unsigned int v10;
  NSUUID *sessionIdentifier;
  NSObject *v12;
  NIServerBaseSession *specializedSession;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  NSUUID *v21;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (id)qword_10085F520;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v10 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v16 = 138412802;
    v17 = v9;
    v18 = 1024;
    v19 = v10;
    v20 = 2112;
    v21 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - _processCarKeyEvent. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v16, 0x1Cu);

  }
  v12 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v12);

  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession _processCarKeyEvent:](specializedSession, "_processCarKeyEvent:", v6));
    v7[2](v7, v14);

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
    v7[2](v7, v15);

    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CBF18();
  }

}

- (id)canHandleAcwgMsg:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (self->_interruptionsMap.__table_.__p2_.__value_)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10014, 0));
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CC3EC();
    -[NIServerSessionContainer _dumpInterruptionsMapWithDebugString:](self, "_dumpInterruptionsMapWithDebugString:", v4);
  }
  else if (self->_specializedSession)
  {
    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CC380();
  }

  return v5;
}

- (void)processAcwgM1Msg:(id)a3 withSessionTriggerReason:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  NSUUID *sessionIdentifier;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  NSUUID *v19;

  v6 = a3;
  v7 = (id)qword_10085F520;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v9 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v14 = 138412802;
    v15 = v8;
    v16 = 1024;
    v17 = v9;
    v18 = 2112;
    v19 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - processAcwgM1Msg. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v14, 0x1Cu);

  }
  v11 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer canHandleAcwgMsg:](self, "canHandleAcwgMsg:", CFSTR("processAcwgM1Msg")));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer remote](self, "remote"));
    objc_msgSend(v13, "didProcessAcwgM1MsgWithResponse:error:", 0, v12);

  }
  else
  {
    -[NIServerBaseSession processAcwgM1Msg:withSessionTriggerReason:](self->_specializedSession, "processAcwgM1Msg:withSessionTriggerReason:", v6, a4);
  }

}

- (void)processAcwgM3Msg:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  NSUUID *sessionIdentifier;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  NSUUID *v17;

  v4 = a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v12 = 138412802;
    v13 = v6;
    v14 = 1024;
    v15 = v7;
    v16 = 2112;
    v17 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - processAcwgM3Msg. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v12, 0x1Cu);

  }
  v9 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer canHandleAcwgMsg:](self, "canHandleAcwgMsg:", CFSTR("processAcwgM3Msg")));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer remote](self, "remote"));
    objc_msgSend(v11, "didProcessAcwgM3MsgWithResponse:error:", 0, v10);

  }
  else
  {
    -[NIServerBaseSession processAcwgM3Msg:](self->_specializedSession, "processAcwgM3Msg:", v4);
  }

}

- (void)suspendAcwgRanging:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  uint64_t v5;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  NSUUID *sessionIdentifier;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  NSUUID *v19;

  v5 = *(_QWORD *)&a3;
  v7 = (id)qword_10085F520;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v9 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v14 = 138412802;
    v15 = v8;
    v16 = 1024;
    v17 = v9;
    v18 = 2112;
    v19 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - suspendAcwgRanging. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v14, 0x1Cu);

  }
  v11 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer canHandleAcwgMsg:](self, "canHandleAcwgMsg:", CFSTR("suspendAcwgRanging")));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer remote](self, "remote"));
    objc_msgSend(v13, "uwbSessionDidFailWithError:", v12);

  }
  else
  {
    -[NIServerBaseSession suspendAcwgRanging:withSuspendTriggerReason:](self->_specializedSession, "suspendAcwgRanging:withSuspendTriggerReason:", v5, a4);
  }

}

- (void)processAcwgRangingSessionResumeRequestMsg:(unsigned int)a3 withResumeTriggerReason:(int64_t)a4
{
  uint64_t v5;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  NSUUID *sessionIdentifier;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  NSUUID *v19;

  v5 = *(_QWORD *)&a3;
  v7 = (id)qword_10085F520;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v9 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v14 = 138412802;
    v15 = v8;
    v16 = 1024;
    v17 = v9;
    v18 = 2112;
    v19 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - processAcwgRangingSessionResumeRequestMsg. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v14, 0x1Cu);

  }
  v11 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer canHandleAcwgMsg:](self, "canHandleAcwgMsg:", CFSTR("processAcwgRangingSessionResumeRequestMsg")));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer remote](self, "remote"));
    objc_msgSend(v13, "didProcessAcwgRangingSessionResumeRequestMsgWithResponse:error:", 0, v12);

  }
  else
  {
    -[NIServerBaseSession processAcwgRangingSessionResumeRequestMsg:withResumeTriggerReason:](self->_specializedSession, "processAcwgRangingSessionResumeRequestMsg:withResumeTriggerReason:", v5, a4);
  }

}

- (void)prefetchAcwgUrsk:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  NSUUID *sessionIdentifier;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  NSUUID *v17;

  v3 = *(_QWORD *)&a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v12 = 138412802;
    v13 = v6;
    v14 = 1024;
    v15 = v7;
    v16 = 2112;
    v17 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - prefetchAcwgUrsk. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v12, 0x1Cu);

  }
  v9 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer canHandleAcwgMsg:](self, "canHandleAcwgMsg:", CFSTR("prefetchAcwgUrsk")));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer remote](self, "remote"));
    objc_msgSend(v11, "didPrefetchAcwgUrsk:error:", v3, v10);

  }
  else
  {
    -[NIServerBaseSession prefetchAcwgUrsk:](self->_specializedSession, "prefetchAcwgUrsk:", v3);
  }

}

- (void)_processBluetoothSample:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer devicePresenceResource](self, "devicePresenceResource"));
  objc_msgSend(v5, "consumeBluetoothSample:", v6);

}

- (void)processVisionInput:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerVisionDataDistributor sharedProvider](NIServerVisionDataDistributor, "sharedProvider"));
  objc_msgSend(v5, "processVisionInput:", v6);

}

- (void)arSessionDidFailWithError:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10010, v5));

  -[NIServerBaseSession invalidate](self->_specializedSession, "invalidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer remote](self, "remote"));
  objc_msgSend(v7, "uwbSessionDidFailWithError:", v6);

}

- (void)arSessionWasInterrupted
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v3);

  -[NIServerSessionContainer interruptSessionWithReason:monotonicTimeSeconds:](self, "interruptSessionWithReason:monotonicTimeSeconds:", 6, sub_10000883C());
}

- (void)arSessionInterruptionEnded
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v3);

  -[NIServerSessionContainer interruptionReasonEnded:monotonicTimeSeconds:](self, "interruptionReasonEnded:monotonicTimeSeconds:", 6, sub_10000883C());
}

- (void)arSessionWillRunWithInvalidConfiguration
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5883, 0));
  -[NIServerBaseSession invalidate](self->_specializedSession, "invalidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer remote](self, "remote"));
  objc_msgSend(v3, "uwbSessionDidFailWithError:", v4);

}

- (void)setLocalDeviceCanInteract:(BOOL)a3 withDiscoveryTokens:(id)a4 reply:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  unsigned int v12;
  NSUUID *sessionIdentifier;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  NIServerSessionContainer *v28;
  id v29;
  _BYTE *v30;
  char v31;
  _BYTE buf[32];
  void (*v33)(uint64_t);
  NSMutableArray *v34;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (id)qword_10085F520;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v12 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v12;
    *(_WORD *)&buf[18] = 2112;
    *(_QWORD *)&buf[20] = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - setLocalDeviceCanInteract:withDiscoveryTokens:. Signing identity: %@, pid: %d, session identifier: %@", buf, 0x1Cu);

  }
  v14 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v15 = "NO";
    if (v6)
      v15 = "YES";
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ses-container,canInteract: %s", buf, 0xCu);
  }
  v16 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v16);

  LOBYTE(v16) = -[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 3);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = sub_10004E8A4;
  v33 = sub_10004E8B4;
  v34 = objc_opt_new(NSMutableArray);
  v24 = _NSConcreteStackBlock;
  v25 = 3221225472;
  v26 = sub_10004E8BC;
  v27 = &unk_1007FB4F0;
  v31 = (char)v16;
  v17 = v9;
  v28 = self;
  v29 = v17;
  v30 = buf;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v24);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild", v24, v25, v26, v27))
    sub_1002B7674(*(void **)(*(_QWORD *)&buf[8] + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
  {
    if (v6)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindableDeviceProxySessionManager sharedInstance](NIServerFindableDeviceProxySessionManager, "sharedInstance"));
      v19 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer processNameBestGuess](self, "processNameBestGuess"));
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startBeingFindableWithDiscoveryTokens:tokenGroup:", v19, v20));
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindableDeviceProxySessionManager sharedInstance](NIServerFindableDeviceProxySessionManager, "sharedInstance"));
      v23 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer processNameBestGuess](self, "processNameBestGuess"));
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stopBeingFindableWithDiscoveryTokens:tokenGroup:", v23, v20));
    }
    v22 = (void *)v21;

  }
  else
  {
    v22 = 0;
  }
  (*((void (**)(id, void *))v17 + 2))(v17, v22);

  _Block_object_dispose(buf, 8);
}

- (void)setLocalDeviceInteractableDiscoveryTokens:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  NSUUID *sessionIdentifier;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  NIServerSessionContainer *v22;
  id v23;
  _BYTE *v24;
  char v25;
  _BYTE buf[32];
  void (*v27)(uint64_t);
  NSMutableArray *v28;

  v6 = a3;
  v7 = a4;
  v8 = (id)qword_10085F520;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v10 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v10;
    *(_WORD *)&buf[18] = 2112;
    *(_QWORD *)&buf[20] = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - setLocalDeviceInteractableDiscoveryTokens. Signing identity: %@, pid: %d, session identifier: %@", buf, 0x1Cu);

  }
  v12 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v12);

  LOBYTE(v12) = -[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 3);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = sub_10004E8A4;
  v27 = sub_10004E8B4;
  v28 = objc_opt_new(NSMutableArray);
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_10004ED60;
  v21 = &unk_1007FB4F0;
  v25 = (char)v12;
  v13 = v7;
  v22 = self;
  v23 = v13;
  v24 = buf;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v18);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild", v18, v19, v20, v21))
    sub_1002B7674(*(void **)(*(_QWORD *)&buf[8] + 40));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindableDeviceProxySessionManager sharedInstance](NIServerFindableDeviceProxySessionManager, "sharedInstance"));
  v15 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer processNameBestGuess](self, "processNameBestGuess"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "setFindableDiscoveryTokens:tokenGroup:", v15, v16));

  (*((void (**)(id, void *))v13 + 2))(v13, v17);
  _Block_object_dispose(buf, 8);

}

- (void)setLocalDeviceDebugParameters:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, NSObject *);
  NSObject *v8;
  void *v9;
  unsigned int v10;
  NSUUID *sessionIdentifier;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSErrorUserInfoKey v17;
  const __CFString *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  NSUUID *v24;

  v6 = a3;
  v7 = (void (**)(id, NSObject *))a4;
  v8 = (id)qword_10085F520;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v10 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    v20 = v9;
    v21 = 1024;
    v22 = v10;
    v23 = 2112;
    v24 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - setLocalDeviceDebugParameters:reply:. Signing identity: %@, pid: %d, session identifier: %@", buf, 0x1Cu);

  }
  v12 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v12);

  if (-[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 3))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindableDeviceProxySessionManager sharedInstance](NIServerFindableDeviceProxySessionManager, "sharedInstance"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "setLocalDeviceDebugParameters:", v6));

    v7[2](v7, v14);
  }
  else
  {
    v17 = NSLocalizedFailureReasonErrorKey;
    v18 = CFSTR("Not allowed to configure findable local device.");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v16 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v15));
    v7[2](v7, v16);

    v14 = (id)qword_10085F520;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
      -[NIServerSessionContainer pid](self, "pid");
      sub_1003CC458();
    }
  }

}

- (void)getInteractableDiscoveryTokens:(id)a3
{
  void (**v4)(id, NSMutableArray *, _QWORD);
  NSObject *v5;
  void *v6;
  unsigned int v7;
  NSUUID *sessionIdentifier;
  NSObject *v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  NSUUID *v19;

  v4 = (void (**)(id, NSMutableArray *, _QWORD))a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v14 = 138412802;
    v15 = v6;
    v16 = 1024;
    v17 = v7;
    v18 = 2112;
    v19 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - getInteractableDiscoveryTokens. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v14, 0x1Cu);

  }
  v9 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  v10 = objc_opt_new(NSMutableArray);
  if (-[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 3))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindableDeviceProxySessionManager sharedInstance](NIServerFindableDeviceProxySessionManager, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer processNameBestGuess](self, "processNameBestGuess"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "findableDiscoveryTokensForGroup:", v12));

    -[NSMutableArray addObjectsFromArray:](v10, "addObjectsFromArray:", v13);
  }
  v4[2](v4, v10, 0);

}

- (void)getActivelyInteractingDiscoveryTokens:(id)a3
{
  void (**v4)(id, NSMutableArray *, _QWORD);
  NSObject *v5;
  void *v6;
  unsigned int v7;
  NSUUID *sessionIdentifier;
  NSObject *v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  NSUUID *v19;

  v4 = (void (**)(id, NSMutableArray *, _QWORD))a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v14 = 138412802;
    v15 = v6;
    v16 = 1024;
    v17 = v7;
    v18 = 2112;
    v19 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - getActivelyInteractingDiscoveryTokens. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v14, 0x1Cu);

  }
  v9 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  v10 = objc_opt_new(NSMutableArray);
  if (-[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 3))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerFindableDeviceProxySessionManager sharedInstance](NIServerFindableDeviceProxySessionManager, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer processNameBestGuess](self, "processNameBestGuess"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interactingFinderDiscoveryTokensForGroup:", v12));

    -[NSMutableArray addObjectsFromArray:](v10, "addObjectsFromArray:", v13);
  }
  v4[2](v4, v10, 0);

}

- (void)getLocalDevicePrintableState:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  unsigned int v7;
  NSUUID *sessionIdentifier;
  NSObject *v9;
  void *v10;
  void *v11;
  void (**v12)(id, _QWORD, void *);
  _QWORD v13[4];
  id v14;
  id v15;
  NSErrorUserInfoKey v16;
  const __CFString *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  NSUUID *v23;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    v19 = v6;
    v20 = 1024;
    v21 = v7;
    v22 = 2112;
    v23 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,XPC Command - getLocalDevicePrintableState. Signing identity: %@, pid: %d, session identifier: %@", buf, 0x1Cu);

  }
  v9 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  if (!-[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 0))
  {
    v16 = NSLocalizedFailureReasonErrorKey;
    v17 = CFSTR("Not allowed to get local device state.");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v10));

    v4[2](v4, 0, v11);
  }
  objc_initWeak((id *)buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004F86C;
  v13[3] = &unk_1007FB518;
  objc_copyWeak(&v15, (id *)buf);
  v14 = v4;
  v12 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)_processFindingEvent:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  NSObject *v9;
  NIServerBaseSession *specializedSession;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  NSUUID *sessionIdentifier;
  int v16;
  void *v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  NSUUID *v21;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (id)qword_10085F520;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v14 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v16 = 138412802;
    v17 = v13;
    v18 = 1024;
    v19 = v14;
    v20 = 2112;
    v21 = sessionIdentifier;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "#ses-container,XPC Command - _processFindingEvent. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v16, 0x1Cu);

  }
  v9 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession _processFindingEvent:](specializedSession, "_processFindingEvent:", v6));
    v7[2](v7, v11);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
    v7[2](v7, v12);

    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CBF18();
  }

}

- (void)_processSystemEvent:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  NSObject *v9;
  NIServerBaseSession *specializedSession;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  NSUUID *sessionIdentifier;
  int v16;
  void *v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  NSUUID *v21;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (id)qword_10085F520;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v14 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v16 = 138412802;
    v17 = v13;
    v18 = 1024;
    v19 = v14;
    v20 = 2112;
    v21 = sessionIdentifier;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "#ses-container,XPC Command - _processSystemEvent. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v16, 0x1Cu);

  }
  v9 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession _processSystemEvent:](specializedSession, "_processSystemEvent:", v6));
    v7[2](v7, v11);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
    v7[2](v7, v12);

    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CBF18();
  }

}

- (void)consumeBluetoothSample:(id)a3
{
  -[NIServerBaseSession consumeBluetoothSample:](self->_specializedSession, "consumeBluetoothSample:", a3);
}

- (BOOL)supportsDevicePresence
{
  return -[NIServerBaseSession supportsDevicePresence](self->_specializedSession, "supportsDevicePresence");
}

- (BOOL)isInterestedInSamplesForDevice:(id)a3
{
  return -[NIServerBaseSession isInterestedInSamplesForDevice:](self->_specializedSession, "isInterestedInSamplesForDevice:", a3);
}

- (BOOL)isInteresetedInSample:(id)a3
{
  return -[NIServerBaseSession isInteresetedInSample:](self->_specializedSession, "isInteresetedInSample:", a3);
}

- (void)_activateBluetoothResource
{
  uint64_t v3;
  NSData *v4;
  NSData *bleProviderSessionIRK;
  uint64_t v6;
  NSData *v7;
  NSData *bleProviderSessionIdentifier;
  NSObject *v9;
  PRBLEDiscoverySession *v10;
  PRBLEDiscoverySession *bleProvider;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  unsigned int v15;
  PRBLEDiscoverySession *v16;
  void *v17;
  NSData *v18;
  NSData *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t v22[16];

  if (!self->_bleProvider)
  {
    if (!self->_bleProviderSessionIRK)
    {
      v3 = NSRandomData(16, 0);
      v4 = (NSData *)objc_claimAutoreleasedReturnValue(v3);
      bleProviderSessionIRK = self->_bleProviderSessionIRK;
      self->_bleProviderSessionIRK = v4;

    }
    if (!self->_bleProviderSessionIdentifier)
    {
      v6 = NSRandomData(3, 0);
      v7 = (NSData *)objc_claimAutoreleasedReturnValue(v6);
      bleProviderSessionIdentifier = self->_bleProviderSessionIdentifier;
      self->_bleProviderSessionIdentifier = v7;

    }
    v9 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ses-container,Activating Bluetooth resource", v22, 2u);
    }
    v10 = objc_opt_new(PRBLEDiscoverySession);
    bleProvider = self->_bleProvider;
    self->_bleProvider = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer uwbProvider](self, "uwbProvider"));
    v13 = objc_msgSend(v12, "deviceCapabilities");

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer wifiProvider](self, "wifiProvider"));
    if ((objc_msgSend(v14, "deviceCapabilities") & 1) != 0)
      v15 = -[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 2);
    else
      v15 = 0;

    v16 = self->_bleProvider;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
    v18 = self->_bleProviderSessionIRK;
    v19 = self->_bleProviderSessionIdentifier;
    v20 = -[NIServerSessionContainer _getDiscoveryTokenFlags](self, "_getDiscoveryTokenFlags");
    v21 = 256;
    if (!v15)
      v21 = 0;
    -[PRBLEDiscoverySession activateWithDelegate:delegateQueue:sessionIRK:sessionIdentifier:controlFlags:tokenFlags:](v16, "activateWithDelegate:delegateQueue:sessionIRK:sessionIdentifier:controlFlags:tokenFlags:", self, v17, v18, v19, v21 | v13 & 1, v20);

  }
}

- (unsigned)_getDiscoveryTokenFlags
{
  unsigned int v3;

  v3 = -[NIServerSessionContainer longRangeEnabled](self, "longRangeEnabled");
  if (-[NIServerSessionContainer requiresBiasCorrection](self, "requiresBiasCorrection"))
    v3 |= 2u;
  if (-[NIServerSessionContainer requiresLargeRegions](self, "requiresLargeRegions"))
    return v3 | 4;
  else
    return v3;
}

- (id)_augmentDiscoveryToken:(id)a3 withHomeAnchorVariant:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _UNKNOWN **v11;
  void *v12;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  if (v5)
  {
    v11 = &off_10082BE48;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4));
    v12 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));

    v8 = sub_10028F314(v7, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_augmentDiscoveryTokenWithNbUwbAcquisitionChannel:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _UNKNOWN **v19;
  void *v20;
  uint8_t buf[4];
  int v22;

  v4 = a3;
  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer discoveryToken](self, "discoveryToken"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("FindingNapChannel")));

    if (v7 && (v9 = objc_opt_class(NSNumber, v8), (objc_opt_isKindOfClass(v7, v9) & 1) != 0))
    {
      LOBYTE(v10) = objc_msgSend(v7, "intValue");
      v11 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v22 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-container,Using NAP channel %d from defaults writes", buf, 8u);
      }
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getIRK"));
      if (!v12)
        __assert_rtn("_pickRandomNbUwbAcquisitionChannelInGivenRange", "NIServerSessionContainer.mm", 2680, "IRK != nil");
      v13 = objc_retainAutorelease(v12);
      v10 = SipHash(objc_msgSend(v13, "bytes"), &unk_100456DD0, 8) % 7uLL + 5;

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10));

    v19 = &off_10082BE60;
    v20 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v16 = sub_10028F314(v15, v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_augmentDiscoveryTokenWithDeviceCapabilities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NIDeviceCapabilities *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _UNKNOWN **v22;
  void *v23;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer _getCapabilities](self, "_getCapabilities"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("UWBSupportedPlatform")));
    v7 = objc_msgSend(v6, "BOOLValue");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("WifiSupportedPlatform")));
    v9 = objc_msgSend(v8, "BOOLValue");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("UWBSupportedPlatformPDOA")));
    v11 = objc_msgSend(v10, "BOOLValue");

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("UWBSupportedPlatformSyntheticAperture")));
    v13 = objc_msgSend(v12, "BOOLValue");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("UWBSupportedPlatformExtendedDistance")));
    v15 = objc_msgSend(v14, "BOOLValue");

    v16 = -[NIDeviceCapabilities initWithFineRangingSupport:coarseRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:]([NIDeviceCapabilities alloc], "initWithFineRangingSupport:coarseRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:", v7, v9, v11, v15, v13);
    v22 = &off_10082BE78;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[NIDeviceCapabilities toBitmap](v16, "toBitmap")));
    v23 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));

    v19 = sub_10028F314(v18, v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)_handleSpecializedSessionInvalidation:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003CC494((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  objc_initWeak(&location, self);
  v12 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050858;
  block[3] = &unk_1007FA330;
  objc_copyWeak(&v16, &location);
  v15 = v4;
  v13 = v4;
  dispatch_async(v12, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_handleSpecializedSessionBackgroundSupportUpdate:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  unsigned __int8 v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id buf;

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ses-container,Specialized session updated background support: %d", (uint8_t *)&buf, 8u);
  }
  if (v3)
    v7 = 1;
  else
    v7 = 2;
  self->_specializedSessionBackgroundSupport = v7;
  objc_initWeak(&buf, self);
  v8 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050A3C;
  block[3] = &unk_1007FA078;
  objc_copyWeak(&v10, &buf);
  dispatch_async(v8, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&buf);
}

- (void)_updateClientAppVisibilityInterruption
{
  NSObject *v3;
  unsigned int v4;
  _QWORD *v5;
  int v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  NSUUID *sessionIdentifier;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  double v17;
  _BYTE v18[12];
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  NSUUID *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;

  v3 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = -[NIServerSessionContainer isBackgroundOperationAllowed](self, "isBackgroundOperationAllowed");
  *(_QWORD *)v18 = 0;
  v5 = sub_1000550B8(&self->_interruptionsMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)v18);
  if (self->_latestAppState == 3)
    v6 = v4 ^ 1;
  else
    v6 = 0;
  v7 = (id)qword_10085F520;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v9 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    v11 = sub_1001BBB88(self->_latestAppState);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)v12;
    v14 = "N";
    *(_DWORD *)v18 = 138413826;
    *(_QWORD *)&v18[4] = v8;
    v19 = 1024;
    if (v6)
      v15 = "Y";
    else
      v15 = "N";
    v20 = v9;
    if (v5)
      v16 = "Y";
    else
      v16 = "N";
    v21 = 2112;
    if (v4)
      v14 = "Y";
    v22 = sessionIdentifier;
    v23 = 2080;
    v24 = v16;
    v25 = 2080;
    v26 = v15;
    v27 = 2112;
    v28 = v12;
    v29 = 2080;
    v30 = v14;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-container,Update client visibility interruption. Signing identity: %@, pid: %d, session identifier: %@, already interrupted: %s, should be interrupted now: %s, app state: %@. BG allowed: %s", v18, 0x44u);

  }
  if ((v5 != 0) != v6)
  {
    v17 = sub_10000883C();
    if (v6)
      -[NIServerSessionContainer interruptSessionWithReason:monotonicTimeSeconds:](self, "interruptSessionWithReason:monotonicTimeSeconds:", 0, v17);
    else
      -[NIServerSessionContainer interruptionReasonEnded:monotonicTimeSeconds:](self, "interruptionReasonEnded:monotonicTimeSeconds:", 0, v17);
  }
}

- (void)setAppStateMonitor:(id)a3
{
  id v5;
  NSObject *v6;
  NSXPCConnection *connection;
  NSObject *v8;
  int v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSObject *v15;
  int pid;
  NSString *v17;
  NSObject *v18;
  NSString *bundleIdentifier;
  id v20;
  _OWORD v21[2];
  uint8_t buf[4];
  int v23;
  __int16 v24;
  NSString *v25;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v6);

  objc_storeStrong((id *)&self->_appStateMonitor, a3);
  -[PRAppStateMonitor addObserver:](self->_appStateMonitor, "addObserver:", self);
  self->_latestAppState = -[PRAppStateMonitor currentAppState](self->_appStateMonitor, "currentAppState");
  if (-[PRAppStateMonitor isRunningBoardApp](self->_appStateMonitor, "isRunningBoardApp"))
  {
    connection = self->_connection;
    if (connection)
      -[NSXPCConnection auditToken](connection, "auditToken");
    else
      memset(v21, 0, sizeof(v21));
    v20 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordForAuditToken:error:](LSBundleRecord, "bundleRecordForAuditToken:error:", v21, &v20));
    v12 = (NSString *)v20;
    v10 = v12;
    if (!v11 || v12)
    {
      v18 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003CC4F8((uint64_t)self, v18);
      bundleIdentifier = self->_bundleIdentifier;
      self->_bundleIdentifier = 0;

    }
    else
    {
      v13 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
      v14 = self->_bundleIdentifier;
      self->_bundleIdentifier = v13;

      v15 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        pid = self->_pid;
        v17 = self->_bundleIdentifier;
        *(_DWORD *)buf = 67109378;
        v23 = pid;
        v24 = 2112;
        v25 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#ses-container,Pid %d bundle identifier is %@", buf, 0x12u);
      }
    }

  }
  else
  {
    v8 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_pid;
      *(_DWORD *)buf = 67109120;
      v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,Pid %d is not a RunningBoard app. Bundle identifier will be nil", buf, 8u);
    }
    v10 = self->_bundleIdentifier;
    self->_bundleIdentifier = 0;
  }

  -[NIServerSessionContainer _populateClientEntitlements](self, "_populateClientEntitlements");
}

- (BOOL)isBackgroundOperationAllowed
{
  NSObject *v3;
  unsigned int v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  int specializedSessionBackgroundSupport;
  int v13;
  void *v14;
  __int16 v15;
  int v16;

  v3 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v3);

  if (-[PRAppStateMonitor isUIBackgroundModeEnabled](self->_appStateMonitor, "isUIBackgroundModeEnabled")
    && self->_specializedSessionBackgroundSupport != 2)
  {
    v5 = (id)qword_10085F520;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor monitoredProcessName](self->_appStateMonitor, "monitoredProcessName"));
      specializedSessionBackgroundSupport = self->_specializedSessionBackgroundSupport;
      v13 = 138412546;
      v14 = v10;
      v15 = 1024;
      v16 = specializedSessionBackgroundSupport;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,BG operation allowed for process %@. Process enables UIBackgroundMode. Specialized session support: %d", (uint8_t *)&v13, 0x12u);

    }
    goto LABEL_11;
  }
  v4 = -[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 1);
  v5 = (id)qword_10085F520;
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor monitoredProcessName](self->_appStateMonitor, "monitoredProcessName"));
      v13 = 138412290;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,BG operation allowed for process %@. Process is granted entitlement", (uint8_t *)&v13, 0xCu);

    }
LABEL_11:
    v9 = 1;
    goto LABEL_12;
  }
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor monitoredProcessName](self->_appStateMonitor, "monitoredProcessName"));
    v13 = 138412290;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,BG operation NOT allowed for process %@", (uint8_t *)&v13, 0xCu);

  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (void)_acquireClientAssertionIfNecessary
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v3);

  if (!-[PRAppStateMonitor isDaemon](self->_appStateMonitor, "isDaemon")
    && -[PRAppStateMonitor isRunningBoardApp](self->_appStateMonitor, "isRunningBoardApp"))
  {
    -[NIServerAssertionManager acquireAssertionToSendMessageToClient](self->_assertionManager, "acquireAssertionToSendMessageToClient");
  }
}

- (BOOL)_isClientInternalTool
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v8;

  if (!self->_appStateMonitor)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerSessionContainer.mm"), 1682, CFSTR("AppStateMonitor is required for to check if client is internal tool."));

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer processNameBestGuess](self, "processNameBestGuess"));
  if ((objc_msgSend(&off_10082BCE0, "containsObject:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor monitoredProcessName](self->_appStateMonitor, "monitoredProcessName"));
    v4 = objc_msgSend(&off_10082BCF8, "containsObject:", v5);

  }
  return v4;
}

- (BOOL)_isClientOnGeneralEntitlementAllowlist
{
  unsigned int v3;
  unsigned int v4;
  int v5;
  unsigned __int8 v6;
  void *v7;
  void *v10;

  if (!self->_appStateMonitor)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerSessionContainer.mm"), 1701, CFSTR("AppStateMonitor is required for to check if client is on general entitlement allowlist."));

  }
  v3 = -[NIServerSessionContainer _isClientInternalTool](self, "_isClientInternalTool");
  v4 = +[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild");
  v5 = os_variant_allows_internal_security_policies(objc_msgSend(CFSTR("com.apple.nearbyd"), "UTF8String"));
  if (-[PRAppStateMonitor isDaemon](self->_appStateMonitor, "isDaemon"))
    return 1;
  v6 = 1;
  if (!-[PRAppStateMonitor isXPCService](self->_appStateMonitor, "isXPCService") && (v3 & (v4 | v5) & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer processNameBestGuess](self, "processNameBestGuess"));
    v6 = objc_msgSend(&off_10082BD10, "containsObject:", v7);

  }
  return v6;
}

- (BOOL)_isClientOnSystemShutdownAllowlist
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  void *v11;

  if (!self->_appStateMonitor)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerSessionContainer.mm"), 1732, CFSTR("AppStateMonitor is required for to check if client is on system shutdown entitlement allowlist."));

  }
  v3 = -[NIServerSessionContainer _isClientInternalTool](self, "_isClientInternalTool");
  v4 = +[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild");
  v5 = os_variant_allows_internal_security_policies(objc_msgSend(CFSTR("com.apple.nearbyd"), "UTF8String"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor launchdJobLabel](self->_appStateMonitor, "launchdJobLabel"));
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.SpringBoard")) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor launchdJobLabel](self->_appStateMonitor, "launchdJobLabel"));
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.Carousel")) & 1) != 0)
      v7 = 1;
    else
      v7 = v3 & (v4 | v5);

  }
  return v7;
}

- (void)_populateClientEntitlements
{
  NSObject *v4;
  unsigned int v5;
  unsigned int v6;
  NSObject *v7;
  void *v8;
  NSString *bundleIdentifier;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  unsigned int v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  os_unfair_lock_t lock;
  unsigned int v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  NSString *v34;
  __int16 v35;
  _BYTE v36[18];
  __int16 v37;
  void *v38;
  __int16 v39;
  unsigned int v40;
  __int16 v41;
  unsigned int v42;
  __int16 v43;
  unsigned int v44;

  v4 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v4);

  if (!self->_appStateMonitor)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerSessionContainer.mm"), 1749, CFSTR("AppStateMonitor is required for populating client entitlements."));

  }
  v5 = -[NIServerSessionContainer _isClientInternalTool](self, "_isClientInternalTool");
  v6 = -[NIServerSessionContainer _isClientOnGeneralEntitlementAllowlist](self, "_isClientOnGeneralEntitlementAllowlist");
  v30 = -[NIServerSessionContainer _isClientOnSystemShutdownAllowlist](self, "_isClientOnSystemShutdownAllowlist");
  v7 = (id)qword_10085F520;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer processNameBestGuess](self, "processNameBestGuess"));
    bundleIdentifier = self->_bundleIdentifier;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor launchdJobLabel](self->_appStateMonitor, "launchdJobLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor monitoredProcessName](self->_appStateMonitor, "monitoredProcessName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    *(_DWORD *)buf = 138414082;
    v32 = v8;
    v33 = 2112;
    v34 = bundleIdentifier;
    v35 = 2112;
    *(_QWORD *)v36 = v10;
    *(_WORD *)&v36[8] = 2112;
    *(_QWORD *)&v36[10] = v11;
    v37 = 2112;
    v38 = v12;
    v39 = 1024;
    v40 = v5;
    v41 = 1024;
    v42 = v6;
    v43 = 1024;
    v44 = v30;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-container,Populating entitlements for client %@ [bundle ID: %@, job label: %@, monitored name: %@, signing identity: %@, internal flags %d|%d|%d]", buf, 0x46u);

  }
  lock = &self->_entitlementsLock;
  os_unfair_lock_lock(&self->_entitlementsLock);
  v13 = 0;
  self->_clientEntitlementsArray.__elems_[8] = 0;
  *(_QWORD *)self->_clientEntitlementsArray.__elems_ = 0;
  do
  {
    if (v13 >= 9)
      __assert_rtn("_stringForEntitlement", "NIServerSessionContainer.mm", 2712, "false");
    v14 = (NSString *)*((_QWORD *)&off_1007FB758 + v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection valueForEntitlement:](self->_connection, "valueForEntitlement:", *((_QWORD *)&off_1007FB710 + v13)));
    if (v16)
    {
      v17 = objc_opt_class(NSNumber, v15);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
        self->_clientEntitlementsArray.__elems_[v13] = objc_msgSend(v16, "BOOLValue", lock);
    }
    v18 = v6;
    if (v13 >= 3)
    {
      v18 = v6;
      if ((_DWORD)v13 != 5)
      {
        if ((_DWORD)v13 != 6)
          goto LABEL_17;
        v18 = v30;
      }
    }
    if (!self->_clientEntitlementsArray.__elems_[v13])
      v18 = 0;
    self->_clientEntitlementsArray.__elems_[v13] = v18;
LABEL_17:
    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild", lock))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
      if (objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.dt.xctest.tool")))
      {

LABEL_21:
        self->_clientEntitlementsArray.__elems_[v13] = 1;
        goto LABEL_22;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.xctest"));

      if (v21)
        goto LABEL_21;
    }
LABEL_22:
    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v23 = objc_msgSend(v22, "BOOLForKey:", CFSTR("NIPrototypingBypassEntitlements"));

      if (v23)
      {
        v24 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#ses-container,Prototyping mode on: enable entitlement bypass", buf, 2u);
        }
        self->_clientEntitlementsArray.__elems_[v13] = 1;
      }
    }
    v25 = (id)qword_10085F520;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer processNameBestGuess](self, "processNameBestGuess"));
      v27 = self->_clientEntitlementsArray.__elems_[v13];
      *(_DWORD *)buf = 138413058;
      v32 = v26;
      v33 = 2112;
      v34 = v14;
      v35 = 1024;
      *(_DWORD *)v36 = v27;
      *(_WORD *)&v36[4] = 2112;
      *(_QWORD *)&v36[6] = v16;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#ses-container,Client: %@, entitlement: %@ | got it: %d, requested it: %@", buf, 0x26u);

    }
    ++v13;
  }
  while (v13 != 9);
  os_unfair_lock_unlock(lock);
}

- (id)_getCapabilities
{
  NSMutableDictionary *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer uwbProvider](self, "uwbProvider"));
  v5 = objc_msgSend(v4, "deviceCapabilities");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer wifiProvider](self, "wifiProvider"));
  LOBYTE(self) = objc_msgSend(v6, "deviceCapabilities");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5 & 1));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v7, CFSTR("UWBSupportedPlatform"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (v5 >> 8) & 1));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v8, CFSTR("UWBSupportedPlatformPDOA"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", HIWORD(v5) & 1));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v9, CFSTR("UWBSupportedPlatformExtendedDistance"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self & 1));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v10, CFSTR("WifiSupportedPlatform"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[NIPlatformInfo supportsSyntheticAperture](NIPlatformInfo, "supportsSyntheticAperture")));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v11, CFSTR("UWBSupportedPlatformSyntheticAperture"));

  return v3;
}

- (id)_getExpandedCapabilities
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer _getCapabilities](self, "_getCapabilities"));
  -[NSMutableDictionary addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer devicePresenceResource](self, "devicePresenceResource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "internalObserver"));
  LODWORD(v4) = objc_msgSend(v6, "deviceCapabilities");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v3, "objectForKey:", CFSTR("UWBSupportedPlatform")));
  LODWORD(v5) = objc_msgSend(v7, "BOOLValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v3, "objectForKey:", CFSTR("WifiSupportedPlatform")));
  LODWORD(v7) = objc_msgSend(v8, "BOOLValue");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5 | -[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 5) & v4 | -[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 2) & v7));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v9, CFSTR("SupportedPlatform"));

  return v3;
}

- (BOOL)_supportedPlatform
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer _getExpandedCapabilities](self, "_getExpandedCapabilities"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("SupportedPlatform")));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSString)displayName
{
  return -[PRAppStateMonitor monitoredProcessName](self->_appStateMonitor, "monitoredProcessName");
}

- (NSString)processNameBestGuess
{
  NSString *bundleIdentifier;
  NSString *v3;
  void *v5;
  PRAppStateMonitor *appStateMonitor;
  void *v7;

  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
  {
    v3 = bundleIdentifier;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor launchdJobLabel](self->_appStateMonitor, "launchdJobLabel"));

    appStateMonitor = self->_appStateMonitor;
    if (v5)
    {
      v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor launchdJobLabel](appStateMonitor, "launchdJobLabel"));
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor monitoredProcessName](appStateMonitor, "monitoredProcessName"));

      if (v7)
        v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor monitoredProcessName](self->_appStateMonitor, "monitoredProcessName"));
      else
        v3 = 0;
    }
  }
  return v3;
}

- (id)_displayPermissionsPromptIfNeeded
{
  unsigned int v3;
  unsigned int v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  NSUUID *sessionIdentifier;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  _BYTE v15[22];
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;

  v3 = -[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 0);
  if ((v3 & 1) != 0)
    v4 = 3;
  else
    v4 = -[NIPrivacyAuthorizationManager authorizationStatusForSession:promptUserIfUndetermined:](self->_authManager, "authorizationStatusForSession:promptUserIfUndetermined:", self, 1);
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = sub_10002A250(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    sessionIdentifier = self->_sessionIdentifier;
    v9 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    v10 = (void *)v9;
    v11 = CFSTR("NO");
    *(_DWORD *)v15 = 138478851;
    *(_QWORD *)&v15[4] = v7;
    *(_WORD *)&v15[12] = 2113;
    if (v3)
      v11 = CFSTR("YES");
    *(_QWORD *)&v15[14] = sessionIdentifier;
    v16 = 2113;
    v17 = v9;
    v18 = 2113;
    v19 = CFSTR("Privileged?");
    v20 = 2113;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,[Session] User authorization status: %{private}@. Session: %{private}@. Signing identity: %{private}@. %{private}@: %{private}@", v15, 0x34u);

  }
  if (v4)
  {
    if (v4 == 4)
    {
      v12 = -5884;
      goto LABEL_13;
    }
    if (v4 != 2)
    {
      v13 = 0;
      return v13;
    }
  }
  v12 = -5887;
LABEL_13:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), v12, 0, *(_OWORD *)v15));
  return v13;
}

- (id)clientProcessSigningIdentity
{
  return self->_signingIdentity;
}

- (int)clientPid
{
  return self->_pid;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_connection;
  if (result)
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 auditToken](result, "auditToken");
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (id)serverSessionIdentifier
{
  return self->_sessionIdentifier;
}

- (id)btResource
{
  return self->_bleProvider;
}

- (id)uwbResource
{
  void *v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer uwbProvider](self, "uwbProvider"));

  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003CC56C();
    v5 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      v6 = 136315650;
      v7 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerSessionContainer.mm";
      v8 = 1024;
      v9 = 1974;
      v10 = 2080;
      v11 = "-[NIServerSessionContainer uwbResource]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ses-container,%s:%d: assertion failure in %s", (uint8_t *)&v6, 0x1Cu);
    }
    abort();
  }
  return -[NIServerSessionContainer uwbProvider](self, "uwbProvider");
}

- (id)wifiResource
{
  void *v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer wifiProvider](self, "wifiProvider"));

  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003CC598();
    v5 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      v6 = 136315650;
      v7 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerSessionContainer.mm";
      v8 = 1024;
      v9 = 1979;
      v10 = 2080;
      v11 = "-[NIServerSessionContainer wifiResource]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ses-container,%s:%d: assertion failure in %s", (uint8_t *)&v6, 0x1Cu);
    }
    abort();
  }
  return -[NIServerSessionContainer wifiProvider](self, "wifiProvider");
}

- (id)visionResource
{
  return +[NIServerVisionDataDistributor sharedProvider](NIServerVisionDataDistributor, "sharedProvider");
}

- (id)lifecycleSupervisor
{
  return self->_lifeCycleManager;
}

- (PRAppStateMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (id)analytics
{
  return self->_analyticsManager;
}

- (id)discoveryToken
{
  NIDiscoveryToken *v2;

  if (self->_localDiscoveryToken)
    v2 = -[NIDiscoveryToken initWithBytes:]([NIDiscoveryToken alloc], "initWithBytes:", self->_localDiscoveryToken);
  else
    v2 = 0;
  return v2;
}

- (id)remote
{
  -[NIServerSessionContainer _acquireClientAssertionIfNecessary](self, "_acquireClientAssertionIfNecessary");
  return self->_client;
}

- (shared_ptr<rose::protobuf::Logger>)protobufLogger
{
  _QWORD *v2;
  _QWORD *v3;
  Logger *v4;
  __shared_weak_count *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  shared_ptr<rose::protobuf::Logger> result;

  v3 = v2;
  v4 = (Logger *)sub_1002CA108();
  v6 = *((_QWORD *)v4 + 21);
  *v3 = *((_QWORD *)v4 + 20);
  v3[1] = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  result.__cntrl_ = v5;
  result.__ptr_ = v4;
  return result;
}

- (BOOL)longRangeEnabled
{
  void *v2;
  unsigned int v3;
  NSObject *v4;
  uint8_t v6[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("DisableLongRangeOverride"));

  if (v3)
  {
    v4 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-container,* disable ND through default writes.", v6, 2u);
    }
  }
  return v3 ^ 1;
}

- (BOOL)entitlementGranted:(int)a3
{
  os_unfair_lock_s *p_entitlementsLock;
  BOOL v6;
  NSObject *v7;

  p_entitlementsLock = &self->_entitlementsLock;
  os_unfair_lock_lock(&self->_entitlementsLock);
  if (a3 >= 9)
  {
    v7 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003CC5C4(a3, v7);
    v6 = 0;
  }
  else
  {
    v6 = self->_clientEntitlementsArray.__elems_[a3];
  }
  os_unfair_lock_unlock(p_entitlementsLock);
  return v6;
}

- (BOOL)requiresBiasCorrection
{
  _DWORD *v2;

  v2 = sub_100004784();
  return sub_100361058(v2[144]);
}

- (BOOL)requiresLargeRegions
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  _DWORD *v5;
  BOOL v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("RegionMonitorRequiresLargeRegionsOverride")));

  if (v3)
  {
    v4 = objc_msgSend(v2, "BOOLForKey:", CFSTR("RegionMonitorRequiresLargeRegionsOverride"));
  }
  else
  {
    v5 = sub_100004784();
    v4 = sub_100361058(v5[144]);
  }
  v6 = v4;

  return v6;
}

- (id)devicePresenceResource
{
  NIServerBluetoothSampleConsumer *devicePresenceProvider;
  NIServerBluetoothSampleConsumer *v4;
  NIServerBluetoothSampleConsumer *v5;
  NIServerBluetoothSampleConsumer *v6;
  _QWORD v8[4];
  id v9;
  id location;

  devicePresenceProvider = self->_devicePresenceProvider;
  if (!devicePresenceProvider)
  {
    objc_initWeak(&location, self);
    v4 = [NIServerBluetoothSampleConsumer alloc];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100052558;
    v8[3] = &unk_1007FB540;
    objc_copyWeak(&v9, &location);
    v5 = -[NIServerBluetoothSampleConsumer initWithConsumerBlock:](v4, "initWithConsumerBlock:", v8);
    v6 = self->_devicePresenceProvider;
    self->_devicePresenceProvider = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    devicePresenceProvider = self->_devicePresenceProvider;
  }
  return devicePresenceProvider;
}

- (shared_ptr<rose::PowerBudgetProvider>)powerBudgetProvider
{
  _QWORD *v2;
  _QWORD *v3;
  PowerBudgetProvider *v4;
  __shared_weak_count *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  shared_ptr<rose::PowerBudgetProvider> result;

  v3 = v2;
  v4 = (PowerBudgetProvider *)sub_1002CA108();
  v6 = *((_QWORD *)v4 + 23);
  *v3 = *((_QWORD *)v4 + 22);
  v3[1] = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  result.__cntrl_ = v5;
  result.__ptr_ = v4;
  return result;
}

- (id)recentlyObservedObjectsCache
{
  return -[NIServerSessionContainer nearbyObjectsCache](self, "nearbyObjectsCache");
}

- (id)printableState
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSUUID *sessionIdentifier;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  double initTime;
  double timeOfLatestContainerState;
  void *p_p;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v28[5];
  void *__p;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  NSMutableArray *v36;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_10004E8A4;
  v35 = sub_10004E8B4;
  v36 = objc_opt_new(NSMutableArray);
  v3 = sub_10000883C();
  os_unfair_lock_lock(&self->_entitlementsLock);
  v4 = 0;
  v5 = 0;
  do
  {
    if (self->_clientEntitlementsArray.__elems_[v4])
      v6 = (1 << v4);
    else
      v6 = 0;
    v5 |= v6;
    ++v4;
  }
  while (v4 != 9);
  os_unfair_lock_unlock(&self->_entitlementsLock);
  v7 = (void *)v32[5];
  sessionIdentifier = self->_sessionIdentifier;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer discoveryToken](self, "discoveryToken"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "descriptionInternal"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Identifier: %@. Token: %@. Entitlements: 0x%llX%s. Transaction: %d"), sessionIdentifier, v10, v5, ", self->_osTransaction != 0));
  objc_msgSend(v7, "addObject:", v11);

  if ((self->_latestSessionContainerState - 1) > 7u)
    v12 = "Initialized";
  else
    v12 = off_1007FB668[(char)(self->_latestSessionContainerState - 1)];
  v13 = (void *)v32[5];
  initTime = self->_initTime;
  timeOfLatestContainerState = self->_timeOfLatestContainerState;
  -[NIServerSessionContainer _interruptionsMapAsString](self, "_interruptionsMapAsString");
  if (v30 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("State: %s. Age: total %.2f s, in-state %.2f s. Interruptions: %s"), v12, v3 - initTime, v3 - timeOfLatestContainerState, p_p));
  objc_msgSend(v13, "addObject:", v17);

  if (v30 < 0)
    operator delete(__p);
  v18 = (void *)v32[5];
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession lastConfiguration](self->_specializedSession, "lastConfiguration"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Configuration: %@"), v19));
  objc_msgSend(v18, "addObject:", v20);

  v21 = (void *)v32[5];
  v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Specialized session: %@"), objc_opt_class(self->_specializedSession, v22));
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  objc_msgSend(v21, "addObject:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession printableState](self->_specializedSession, "printableState"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000529A8;
  v28[3] = &unk_1007FB568;
  v28[4] = &v31;
  objc_msgSend(v25, "enumerateObjectsUsingBlock:", v28);
  v26 = (id)v32[5];

  _Block_object_dispose(&v31, 8);
  return v26;
}

- (void)didFailWithErrorCode:(int64_t)a3 errorString:(const void *)a4
{
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
    sub_1003CC634();
}

- (void)didReceiveNewSolution:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
    sub_1003CC660();
}

- (void)didReceiveSessionStartNotification:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
    sub_1003CC68C();
}

- (void)didReceiveRemoteData:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
    sub_1003CC6B8();
}

- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3
{
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
    sub_1003CC6E4();
}

- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4
{
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  int v12;
  int v13;
  id location;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer uwbProvider](self, "uwbProvider"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getQueue"));
  dispatch_assert_queue_V2(v8);

  objc_initWeak(&location, self);
  v9 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052C64;
  block[3] = &unk_1007FA158;
  objc_copyWeak(&v11, &location);
  v12 = a3;
  v13 = a4;
  dispatch_async(v9, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)didFinishActivatingWithDiscoveryTokenData:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  PRBLEDiscoverySession *bleProvider;
  NSData **p_localDiscoveryToken;
  void *v19;
  unsigned __int8 v20;
  _DWORD *v21;
  uint64_t v22;
  NSData *v23;
  NSData *localDiscoveryToken;
  NSData *v25;
  NSData *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  NSData *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  __int16 v39;
  int v40;

  v7 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  if (v8)
  {
    v10 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CC73C((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);
LABEL_4:
    bleProvider = self->_bleProvider;
    self->_bleProvider = 0;
    goto LABEL_16;
  }
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CC710();
    goto LABEL_4;
  }
  p_localDiscoveryToken = &self->_localDiscoveryToken;
  objc_storeStrong((id *)&self->_localDiscoveryToken, a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v20 = objc_msgSend(v19, "BOOLForKey:", CFSTR("NIHomeDisableDeviceSpecificSTS"));

  v21 = sub_100004784();
  if ((v20 & 1) != 0)
    v22 = 0;
  else
    v22 = sub_1003610AC(v21[144]);
  v23 = (NSData *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer _augmentDiscoveryTokenWithDeviceCapabilities:](self, "_augmentDiscoveryTokenWithDeviceCapabilities:", v7));
  localDiscoveryToken = self->_localDiscoveryToken;
  self->_localDiscoveryToken = v23;

  v25 = (NSData *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer _augmentDiscoveryToken:withHomeAnchorVariant:](self, "_augmentDiscoveryToken:withHomeAnchorVariant:", self->_localDiscoveryToken, v22));
  v26 = self->_localDiscoveryToken;
  self->_localDiscoveryToken = v25;

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer _getCapabilities](self, "_getCapabilities"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("UWBSupportedPlatformExtendedDistance")));
  v29 = objc_msgSend(v28, "BOOLValue");

  if (v29)
  {
    v30 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer _augmentDiscoveryTokenWithNbUwbAcquisitionChannel:](self, "_augmentDiscoveryTokenWithNbUwbAcquisitionChannel:", self->_localDiscoveryToken));
    v31 = *p_localDiscoveryToken;
    *p_localDiscoveryToken = (NSData *)v30;

  }
  v32 = (id)qword_10085F520;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v34 = CUPrintNSObjectMasked(*p_localDiscoveryToken, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v37 = 138478083;
    v38 = v35;
    v39 = 1024;
    v40 = v22;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#ses-container,BT resource activated. Token: %{private}@. Device anchor variant: %u", (uint8_t *)&v37, 0x12u);

  }
  bleProvider = (PRBLEDiscoverySession *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer remote](self, "remote"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer discoveryToken](self, "discoveryToken"));
  -[PRBLEDiscoverySession didUpdateLocalDiscoveryToken:](bleProvider, "didUpdateLocalDiscoveryToken:", v36);

LABEL_16:
}

- (void)didDiscoverDevice:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v4);

  -[NIServerBaseSession deviceDiscovered:](self->_specializedSession, "deviceDiscovered:", v5);
}

- (void)discoveredDevice:(id)a3 didUpdate:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v7);

  -[NIServerBaseSession device:rediscovered:](self->_specializedSession, "device:rediscovered:", v8, v6);
}

- (void)didLoseDevice:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v4);

  -[NIServerBaseSession deviceLost:](self->_specializedSession, "deviceLost:", v5);
}

- (void)bluetoothDidChangeState:(int64_t)a3
{
  NSObject *v5;

  v5 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v5);

  switch(a3)
  {
    case 1:
    case 4:
      -[NIServerSessionContainer _handleBluetoothBecameUnavailable](self, "_handleBluetoothBecameUnavailable");
      break;
    case 2:
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003CC7CC();
      break;
    case 3:
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003CC7A0();
      break;
    case 5:
      -[NIServerSessionContainer _handleBluetoothBecameAvailable](self, "_handleBluetoothBecameAvailable");
      break;
    default:
      break;
  }
  -[NIServerSessionContainer setLatestBluetoothState:](self, "setLatestBluetoothState:", a3);
}

- (void)bluetoothServiceInterrupted
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v3);

  -[NIServerSessionContainer _handleBluetoothBecameUnavailable](self, "_handleBluetoothBecameUnavailable");
}

- (void)bluetoothAdvertisingAddressChanged:(unint64_t)a3
{
  NSObject *v5;

  v5 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v5);

  -[NIServerBaseSession bluetoothAdvertisingAddressChanged:](self->_specializedSession, "bluetoothAdvertisingAddressChanged:", a3);
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)-[NIServerBaseSession nominalCycleRate](self->_specializedSession, "nominalCycleRate");
}

- (void)_setContainerState:(unsigned __int8)a3
{
  NSObject *v5;
  const char *v6;
  const char *v7;
  NSString *signingIdentity;
  int pid;
  NSUUID *sessionIdentifier;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  NSUUID *v20;

  if (self->_latestSessionContainerState != a3)
  {
    v5 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      if ((a3 - 1) > 7u)
        v6 = "Initialized";
      else
        v6 = off_1007FB668[(char)(a3 - 1)];
      if ((self->_latestSessionContainerState - 1) > 7u)
        v7 = "Initialized";
      else
        v7 = off_1007FB668[(char)(self->_latestSessionContainerState - 1)];
      signingIdentity = self->_signingIdentity;
      pid = self->_pid;
      sessionIdentifier = self->_sessionIdentifier;
      v11 = 136316162;
      v12 = v6;
      v13 = 2080;
      v14 = v7;
      v15 = 2112;
      v16 = signingIdentity;
      v17 = 1024;
      v18 = pid;
      v19 = 2112;
      v20 = sessionIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-container,Container state change. New: %s. Old: %s. Signing identity: %@, pid: %d, session identifier: %@", (uint8_t *)&v11, 0x30u);
    }
    self->_latestSessionContainerState = a3;
    self->_timeOfLatestContainerState = sub_10000883C();
  }
}

- (basic_string<char,)_interruptionsMapAsString
{
  _QWORD *v1;
  _QWORD *v2;
  NSObject *v3;
  _QWORD *i;
  const __CFString *v5;
  id v6;
  const char *v7;
  size_t v8;
  uint64_t v9;
  _QWORD v11[2];
  uint64_t v12;
  _QWORD v13[10];
  char v14;
  uint64_t v15;

  v2 = v1;
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "connectionQueue"));
  dispatch_assert_queue_V2(v3);

  sub_1000537E4((uint64_t)v11);
  sub_100054C60(&v12, (uint64_t)"[", 1);
  for (i = (_QWORD *)v2[14]; i; i = (_QWORD *)*i)
  {
    v5 = sub_1002D7610(i[2]);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v5));
    v7 = (const char *)objc_msgSend(v6, "UTF8String");
    v8 = strlen(v7);
    sub_100054C60(&v12, (uint64_t)v7, v8);
    if (*i)
      sub_100054C60(&v12, (uint64_t)", ", 2);

  }
  sub_100054C60(&v12, (uint64_t)"]", 1);
  std::stringbuf::str(v13);
  *(_QWORD *)((char *)v11
  v12 = v9;
  if (v14 < 0)
    operator delete((void *)v13[8]);
  std::streambuf::~streambuf(v13);
  return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)std::ios::~ios(&v15);
}

- (void)_dumpInterruptionsMapWithDebugString:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  void **v8;
  double v9;
  void **p_p;
  void *__p;
  char v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void **v16;
  __int16 v17;
  double v18;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (id)qword_10085F520;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[NIServerSessionContainer _interruptionsMapAsString](self, "_interruptionsMapAsString");
    v7 = v12;
    v8 = (void **)__p;
    v9 = sub_10000883C();
    p_p = &__p;
    *(_DWORD *)buf = 138412802;
    if (v7 < 0)
      p_p = v8;
    v14 = v4;
    v15 = 2080;
    v16 = p_p;
    v17 = 2048;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ses-container,#interrupt [%@] Interruptions map: %s, machContTime: %f", buf, 0x20u);
    if (v12 < 0)
      operator delete(__p);
  }

}

- (void)interruptSessionWithReason:(int64_t)a3 monotonicTimeSeconds:(double)a4
{
  NSObject *v7;
  NSObject *v8;
  NSUUID *sessionIdentifier;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  PAAccessInterval *paAccessInterval;
  PAAccessInterval *v22;
  void *v23;
  int64_t v24;
  _BYTE buf[24];
  double v26;

  v24 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v7);

  v8 = (id)qword_10085F520;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    v10 = sub_1002D7610(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = sessionIdentifier;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2048;
    v26 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,#interrupt Interrupt session %@ with reason: %@. ContTime: %f", buf, 0x20u);

  }
  -[NIServerSessionContainer _setContainerState:](self, "_setContainerState:", 7);
  if (sub_1000550B8(&self->_interruptionsMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v24))
  {
    v12 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ses-container,#interrupt Not interrupting session with duplicate reason.", buf, 2u);
    }
  }
  else
  {
    *(_QWORD *)buf = v24;
    *(_QWORD *)&buf[8] = v24;
    *(double *)&buf[16] = a4;
    sub_10005516C((uint64_t)&self->_interruptionsMap, (unint64_t *)buf, (uint64_t)buf);
    -[NIServerSessionContainer _dumpInterruptionsMapWithDebugString:](self, "_dumpInterruptionsMapWithDebugString:", CFSTR("interruptWithReason"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession pauseWithSource:](self->_specializedSession, "pauseWithSource:", 2));
    if (v13)
    {
      v14 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003CC7F8((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
    }
    paAccessInterval = self->_paAccessInterval;
    if (paAccessInterval)
    {
      -[PAAccessInterval end](paAccessInterval, "end");
      v22 = self->_paAccessInterval;
      self->_paAccessInterval = 0;

    }
    -[NIServerVisionInternalSessionRequest invalidate](self->_visionSessionRequest, "invalidate");
    -[NIServerAnalyticsManager sessionInterruptedWithTimestamp:](self->_analyticsManager, "sessionInterruptedWithTimestamp:", a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer remote](self, "remote"));
    objc_msgSend(v23, "uwbSessionInterruptedWithReason:timestamp:", v24, a4);

  }
}

- (void)interruptionReasonEnded:(int64_t)a3 monotonicTimeSeconds:(double)a4
{
  NSObject *v7;
  NSObject *v8;
  NSUUID *sessionIdentifier;
  const __CFString *v10;
  void *v11;
  uint64_t *v12;
  void *v13;
  int64_t v14;
  uint8_t buf[4];
  NSUUID *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  double v20;

  v14 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v7);

  v8 = (id)qword_10085F520;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    v10 = sub_1002D7610(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138412802;
    v16 = sessionIdentifier;
    v17 = 2112;
    v18 = v11;
    v19 = 2048;
    v20 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,#interrupt Session %@ interruption ended. Reason: %@. ContTime: %f", buf, 0x20u);

  }
  v12 = sub_1000550B8(&self->_interruptionsMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v14);
  if (v12)
  {
    sub_10002A560(&self->_interruptionsMap.__table_.__bucket_list_.__ptr_.__value_, v12);
    -[NIServerSessionContainer _dumpInterruptionsMapWithDebugString:](self, "_dumpInterruptionsMapWithDebugString:", CFSTR("interruptionEnded"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer remote](self, "remote"));
    objc_msgSend(v13, "uwbSessionInterruptionReasonEnded:timestamp:", v14, a4);

  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003CC85C();
  }
}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NIServerBaseSession *specializedSession;
  PRBLEDiscoverySession *bleProvider;
  void *v10;
  NIServerAssertionManager *assertionManager;
  PAAccessInterval *paAccessInterval;
  PAAccessInterval *v13;
  OS_os_transaction *osTransaction;
  NIServerAnalyticsManager *analyticsManager;
  double v16;

  -[NIServerSessionContainer _setContainerState:](self, "_setContainerState:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerVisionDataDistributor sharedProvider](NIServerVisionDataDistributor, "sharedProvider"));
  objc_msgSend(v3, "unregisterForVisionInput:", self->_specializedSession);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer devicePresenceResource](self, "devicePresenceResource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "internalObserver"));
  objc_msgSend(v5, "stopLeechingForConsumer:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer devicePresenceResource](self, "devicePresenceResource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "internalObserver"));
  objc_msgSend(v7, "unregisterForInternalBluetoothSamples:", self);

  -[NIServerBaseSession invalidate](self->_specializedSession, "invalidate");
  specializedSession = self->_specializedSession;
  self->_specializedSession = 0;

  -[PRBLEDiscoverySession invalidate](self->_bleProvider, "invalidate");
  bleProvider = self->_bleProvider;
  self->_bleProvider = 0;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer appStateMonitor](self, "appStateMonitor"));
  objc_msgSend(v10, "removeObserver:", self);

  -[NIServerAssertionManager invalidate](self->_assertionManager, "invalidate");
  assertionManager = self->_assertionManager;
  self->_assertionManager = 0;

  paAccessInterval = self->_paAccessInterval;
  if (paAccessInterval)
  {
    -[PAAccessInterval end](paAccessInterval, "end");
    v13 = self->_paAccessInterval;
    self->_paAccessInterval = 0;

  }
  osTransaction = self->_osTransaction;
  self->_osTransaction = 0;

  -[NIServerVisionInternalSessionRequest invalidate](self->_visionSessionRequest, "invalidate");
  analyticsManager = self->_analyticsManager;
  v16 = sub_10000883C();
  -[NIServerAnalyticsManager sessionInvalidatedWithTimestamp:](analyticsManager, "sessionInvalidatedWithTimestamp:", v16);
}

- (id)_fatalErrorForUwbServiceState:(int)a3 cause:(int)a4
{
  NSObject *v7;
  NSObject *v8;
  NSUUID *sessionIdentifier;
  int v10;
  void **v11;
  void **v12;
  void **v13;
  void *v14;
  void *__p[2];
  char v17;
  void *v18[2];
  char v19;
  uint8_t buf[4];
  NSUUID *v21;
  __int16 v22;
  void **v23;
  __int16 v24;
  void **v25;

  v7 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v7);

  v8 = (id)qword_10085F520;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    sub_10000BF04(v18, off_1007FB6A8[a3]);
    v10 = v19;
    v11 = (void **)v18[0];
    sub_10000BF04(__p, off_1007FB6D0[a4]);
    v12 = v18;
    if (v10 < 0)
      v12 = v11;
    if (v17 >= 0)
      v13 = __p;
    else
      v13 = (void **)__p[0];
    *(_DWORD *)buf = 138412802;
    v21 = sessionIdentifier;
    v22 = 2080;
    v23 = v12;
    v24 = 2080;
    v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-container,Check for fatal error for session %@ for UWB service state %s with cause %s", buf, 0x20u);
    if (v17 < 0)
      operator delete(__p[0]);
    if (v19 < 0)
      operator delete(v18[0]);
  }

  v14 = 0;
  if (a3 == 3 && (a4 - 5) <= 1)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CC888();
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5889, 0));
  }
  return v14;
}

- (BOOL)_updateInterruptionForUWBServiceState:(int)a3 cause:(int)a4 requiresNarrowBand:(BOOL)a5
{
  uint64_t v6;
  NSObject *v9;
  NSObject *v10;
  NSUUID *sessionIdentifier;
  int v12;
  void **v13;
  void **v14;
  void **v15;
  void *__p[2];
  char v18;
  void *v19[2];
  char v20;
  uint8_t buf[4];
  NSUUID *v22;
  __int16 v23;
  void **v24;
  __int16 v25;
  void **v26;

  v6 = *(_QWORD *)&a4;
  v9 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  v10 = (id)qword_10085F520;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    sub_10000BF04(v19, off_1007FB6A8[a3]);
    v12 = v20;
    v13 = (void **)v19[0];
    sub_10000BF04(__p, off_1007FB6D0[(int)v6]);
    v14 = v19;
    if (v12 < 0)
      v14 = v13;
    if (v18 >= 0)
      v15 = __p;
    else
      v15 = (void **)__p[0];
    *(_DWORD *)buf = 138412802;
    v22 = sessionIdentifier;
    v23 = 2080;
    v24 = v14;
    v25 = 2080;
    v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ses-container,Update interruption for session %@ for UWB service state %s with cause %s", buf, 0x20u);
    if (v18 < 0)
      operator delete(__p[0]);
    if (v20 < 0)
      operator delete(v19[0]);
  }

  switch(a3)
  {
    case 0:
      sub_1003CC8B4();
    case 1:
      goto LABEL_16;
    case 2:
      if (a5)
        return -[NIServerSessionContainer _updateInterruptionForUWBSystemOffWithCause:](self, "_updateInterruptionForUWBSystemOffWithCause:", v6);
LABEL_16:
      -[NIServerSessionContainer _updateInterruptionForUWBSystemReady](self, "_updateInterruptionForUWBSystemReady");
      return 0;
    case 3:
      return -[NIServerSessionContainer _updateInterruptionForUWBSystemOffWithCause:](self, "_updateInterruptionForUWBSystemOffWithCause:", v6);
    case 4:
      -[NIServerSessionContainer _updateInterruptionForUWBSystemError](self, "_updateInterruptionForUWBSystemError");
      return 1;
    default:
      return 0;
  }
}

- (void)_updateInterruptionForUWBSystemReady
{
  NSObject *v3;
  unint64_t *v4;
  unint64_t *v5;
  unint64_t *v6;
  unint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  unint64_t *v13;
  unint64_t v14;
  double v15;
  unint64_t *v16;
  double v17;
  unint64_t *__p;
  unint64_t *v19;
  unint64_t *v20;

  v3 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v3);

  __p = 0;
  v19 = 0;
  v20 = 0;
  -[NIServerSessionContainer _dumpInterruptionsMapWithDebugString:](self, "_dumpInterruptionsMapWithDebugString:", CFSTR("_updateInterruptionForUWBSystemReady"));
  v4 = (unint64_t *)&qword_100456DB0;
  do
  {
    if (sub_1000550B8(&self->_interruptionsMap.__table_.__bucket_list_.__ptr_.__value_, v4))
    {
      v5 = v19;
      if (v19 >= v20)
      {
        v7 = __p;
        v8 = v19 - __p;
        v9 = v8 + 1;
        if ((unint64_t)(v8 + 1) >> 61)
          sub_100026E7C();
        v10 = (char *)v20 - (char *)__p;
        if (((char *)v20 - (char *)__p) >> 2 > v9)
          v9 = v10 >> 2;
        if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
          v11 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v11 = v9;
        if (v11)
        {
          v12 = (char *)sub_10005538C((uint64_t)&v20, v11);
          v7 = __p;
          v5 = v19;
        }
        else
        {
          v12 = 0;
        }
        v13 = (unint64_t *)&v12[8 * v8];
        *v13 = *v4;
        v6 = v13 + 1;
        while (v5 != v7)
        {
          v14 = *--v5;
          *--v13 = v14;
        }
        __p = v13;
        v20 = (unint64_t *)&v12[8 * v11];
        if (v7)
          operator delete(v7);
      }
      else
      {
        *v19 = *v4;
        v6 = v19 + 1;
      }
      v19 = v6;
    }
    ++v4;
  }
  while (v4 != (unint64_t *)&unk_100456DD0);
  v15 = sub_10000883C();
  v16 = __p;
  if (__p != v19)
  {
    v17 = v15;
    do
      -[NIServerSessionContainer interruptionReasonEnded:monotonicTimeSeconds:](self, "interruptionReasonEnded:monotonicTimeSeconds:", *v16++, v17);
    while (v16 != v19);
    v16 = __p;
  }
  if (v16)
    operator delete(v16);
}

- (BOOL)_updateInterruptionForUWBSystemOffWithCause:(int)a3
{
  NSObject *v5;
  BOOL v6;
  double v7;
  uint64_t v8;

  v5 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = 0;
  v7 = sub_10000883C();
  v8 = 5;
  switch(a3)
  {
    case 0:
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003CC8DC();
      return 0;
    case 1:
    case 7:
      goto LABEL_7;
    case 2:
      sub_1003CC908();
    case 3:
      v8 = 1;
      goto LABEL_7;
    case 4:
      v8 = 2;
LABEL_7:
      -[NIServerSessionContainer interruptSessionWithReason:monotonicTimeSeconds:](self, "interruptSessionWithReason:monotonicTimeSeconds:", v8, v7);
      v6 = 1;
      break;
    default:
      return v6;
  }
  return v6;
}

- (void)_updateInterruptionForUWBSystemError
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v3);

  -[NIServerSessionContainer interruptSessionWithReason:monotonicTimeSeconds:](self, "interruptSessionWithReason:monotonicTimeSeconds:", 4, sub_10000883C());
}

- (void)_handleBluetoothBecameUnavailable
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v3);

  -[NIServerSessionContainer interruptSessionWithReason:monotonicTimeSeconds:](self, "interruptSessionWithReason:monotonicTimeSeconds:", 7, sub_10000883C());
}

- (void)_handleBluetoothBecameAvailable
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v3);

  -[NIServerSessionContainer interruptionReasonEnded:monotonicTimeSeconds:](self, "interruptionReasonEnded:monotonicTimeSeconds:", 7, sub_10000883C());
}

- (void)monitoredApp:(int)a3 didChangeState:(int)a4
{
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  double v10;
  NSObject *v11;
  int v12;
  _BYTE v13[14];
  __int16 v14;
  const char *v15;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v7 = (id)qword_10085F520;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = sub_1001BBB88(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v12 = 67109378;
    *(_DWORD *)v13 = a3;
    *(_WORD *)&v13[4] = 2112;
    *(_QWORD *)&v13[6] = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-container,Monitored app with pid: %d did change state: %@", (uint8_t *)&v12, 0x12u);

  }
  if (!a4)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003CC930();
    v11 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      v12 = 136315650;
      *(_QWORD *)v13 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServe"
                       "rSessionContainer.mm";
      *(_WORD *)&v13[8] = 1024;
      *(_DWORD *)&v13[10] = 2637;
      v14 = 2080;
      v15 = "-[NIServerSessionContainer monitoredApp:didChangeState:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "#ses-container,%s:%d: assertion failure in %s", (uint8_t *)&v12, 0x1Cu);
    }
    abort();
  }
  v10 = sub_10000883C();
  self->_latestAppState = a4;
  if (a4 == 2)
  {
    -[NIServerAnalyticsManager appBecameVisibleWithTimestamp:](self->_analyticsManager, "appBecameVisibleWithTimestamp:", v10);
  }
  else
  {
    if (a4 != 3)
      return;
    -[NIServerAnalyticsManager appBecameNotVisibleWithTimestamp:](self->_analyticsManager, "appBecameNotVisibleWithTimestamp:", v10);
  }
  -[NIServerSessionContainer _updateClientAppVisibilityInterruption](self, "_updateClientAppVisibilityInterruption");
}

- (id)updatesQueue
{
  return self->_connectionQueue;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 256, 1);
}

- (OS_dispatch_queue)connectionQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 264, 1);
}

- (NSString)signingIdentity
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (int)pid
{
  return self->_pid;
}

- (NSUUID)sessionIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 288, 1);
}

- (NIServerSessionActivationGuard)activationGuard
{
  return (NIServerSessionActivationGuard *)objc_loadWeakRetained((id *)&self->_activationGuard);
}

- (void)setActivationGuard:(id)a3
{
  objc_storeWeak((id *)&self->_activationGuard, a3);
}

- (NIServerSessionObservationRegistrar)observationRegistrar
{
  return (NIServerSessionObservationRegistrar *)objc_loadWeakRetained((id *)&self->_observationRegistrar);
}

- (void)setObservationRegistrar:(id)a3
{
  objc_storeWeak((id *)&self->_observationRegistrar, a3);
}

- (NIServerSessionAggregateStateProvider)aggregateStateProvider
{
  return (NIServerSessionAggregateStateProvider *)objc_loadWeakRetained((id *)&self->_aggregateStateProvider);
}

- (void)setAggregateStateProvider:(id)a3
{
  objc_storeWeak((id *)&self->_aggregateStateProvider, a3);
}

- (NIRecentlyObservedObjectsCache)nearbyObjectsCache
{
  return (NIRecentlyObservedObjectsCache *)objc_loadWeakRetained((id *)&self->_nearbyObjectsCache);
}

- (void)setNearbyObjectsCache:(id)a3
{
  objc_storeWeak((id *)&self->_nearbyObjectsCache, a3);
}

- (unsigned)latestSessionContainerState
{
  return self->_latestSessionContainerState;
}

- (void)setLatestSessionContainerState:(unsigned __int8)a3
{
  self->_latestSessionContainerState = a3;
}

- (int64_t)latestBluetoothState
{
  return self->_latestBluetoothState;
}

- (void)setLatestBluetoothState:(int64_t)a3
{
  self->_latestBluetoothState = a3;
}

- (int)latestAppState
{
  return self->_latestAppState;
}

- (void)setLatestAppState:(int)a3
{
  self->_latestAppState = a3;
}

- (unsigned)specializedSessionBackgroundSupport
{
  return self->_specializedSessionBackgroundSupport;
}

- (void)setSpecializedSessionBackgroundSupport:(unsigned __int8)a3
{
  self->_specializedSessionBackgroundSupport = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nearbyObjectsCache);
  objc_destroyWeak((id *)&self->_aggregateStateProvider);
  objc_destroyWeak((id *)&self->_observationRegistrar);
  objc_destroyWeak((id *)&self->_activationGuard);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_signingIdentity, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_paAccessInterval, 0);
  objc_storeStrong((id *)&self->_visionSessionRequest, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_specializedSession, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_authManager, 0);
  objc_storeStrong((id *)&self->_activationError, 0);
  objc_storeStrong((id *)&self->_osTransaction, 0);
  sub_10002AB34((uint64_t)&self->_interruptionsMap);
  objc_storeStrong((id *)&self->_devicePresenceProvider, 0);
  objc_storeStrong((id *)&self->_wifiProvider, 0);
  objc_storeStrong((id *)&self->_uwbProvider, 0);
  objc_storeStrong((id *)&self->_bleProviderSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_bleProviderSessionIRK, 0);
  objc_storeStrong((id *)&self->_bleProvider, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_lifeCycleManager, 0);
  objc_storeStrong((id *)&self->_localDiscoveryToken, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  return self;
}

@end
