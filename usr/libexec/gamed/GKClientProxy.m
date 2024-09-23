@implementation GKClientProxy

+ (BOOL)isExtensionBundleID:(id)a3
{
  uint64_t v3;
  id v4;
  unsigned __int8 v5;

  v3 = qword_100317FC8;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_100317FC8, &stru_1002C2F60);
  v5 = objc_msgSend((id)qword_100317FC0, "containsObject:", v4);

  return v5;
}

- (void)initializeInitializationStateMachine
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];
  _QWORD v8[3];

  v3 = objc_alloc_init((Class)_GKStateMachine);
  v8[0] = CFSTR("GKAppInitInProgress");
  v7[0] = CFSTR("GKAppInitUnknown");
  v7[1] = CFSTR("GKAppInitInProgress");
  v6[0] = CFSTR("GKAppInitialized");
  v6[1] = CFSTR("GKAppInitUnknown");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));
  v7[2] = CFSTR("GKAppInitialized");
  v8[1] = v4;
  v8[2] = CFSTR("GKAppInitUnknown");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 3));
  objc_msgSend(v3, "setValidTransitions:", v5);

  objc_msgSend(v3, "setCurrentState:", CFSTR("GKAppInitUnknown"));
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setShouldLogStateTransitions:", 1);
  -[GKClientProxy setAppInitStateMachine:](self, "setAppInitStateMachine:", v3);

}

- (NSString)description
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t pid;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GKClientProxy;
  v3 = -[GKClientProxy description](&v12, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleShortVersion](self, "bundleShortVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleVersion](self, "bundleVersion"));
  pid = self->_pid;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy originalBundleIdentifier](self, "originalBundleIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (identifier:%@ bundleShortVersion:%@ bundleVersion:%@ pid:%d, originalBundleIdentifier:%@)"), v4, v5, v6, v7, pid, v9));

  return (NSString *)v10;
}

- (void)getPrivateServicesForPID:(int)a3 localPlayer:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!os_log_GKGeneral)
    v11 = (id)GKOSLoggers(v9);
  v12 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v26) = a3;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "GKClientProxy: client requests private services for pid %d", buf, 8u);
  }
  if (self->_pid != a3)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (pid == _pid)\n[%s (%s:%d)]"), v13, "-[GKClientProxy(GKDaemonProtocol) getPrivateServicesForPID:localPlayer:reply:]", objc_msgSend(v15, "UTF8String"), 1350));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v16);
  }
  -[GKClientProxy updateAppInitState](self, "updateAppInitState");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy credentialForPlayer:](self, "credentialForPlayer:", v8));
  v18 = objc_claimAutoreleasedReturnValue(-[GKClientProxy transportWithCredential:](self, "transportWithCredential:", v17));
  v19 = (void *)v18;
  if (!os_log_GKGeneral)
    v20 = (id)GKOSLoggers(v18);
  v21 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "alias"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accountName"));
    *(_DWORD *)buf = 138412546;
    v26 = v23;
    v27 = 2112;
    v28 = v24;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "alloc private services for %@:%@", buf, 0x16u);

  }
  -[GKClientProxy getPrivateServicesWithTransport:forClient:reply:](self, "getPrivateServicesWithTransport:forClient:reply:", v19, self, v10);

}

- (void)getServicesForPID:(int)a3 localPlayer:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!os_log_GKGeneral)
    v11 = (id)GKOSLoggers(v9);
  v12 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v29) = a3;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "GKClientProxy: client requests services for pid %d", buf, 8u);
  }
  if (self->_pid != a3)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (pid == _pid)\n[%s (%s:%d)]"), v13, "-[GKClientProxy(GKDaemonProtocol) getServicesForPID:localPlayer:reply:]", objc_msgSend(v15, "UTF8String"), 1334));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v16);
  }
  -[GKClientProxy updateAppInitState](self, "updateAppInitState");
  v17 = objc_claimAutoreleasedReturnValue(-[GKClientProxy credentialForPlayer:](self, "credentialForPlayer:", v8));
  v18 = (void *)v17;
  if (!os_log_GKGeneral)
    v19 = (id)GKOSLoggers(v17);
  v20 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "credential: %@", buf, 0xCu);
  }
  v21 = objc_claimAutoreleasedReturnValue(-[GKClientProxy transportWithCredential:](self, "transportWithCredential:", v18));
  v22 = (void *)v21;
  if (!os_log_GKGeneral)
    v23 = (id)GKOSLoggers(v21);
  v24 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "alias"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accountName"));
    *(_DWORD *)buf = 138412546;
    v29 = v26;
    v30 = 2112;
    v31 = v27;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "alloc services for %@:%@", buf, 0x16u);

  }
  -[GKClientProxy getServicesWithTransport:forClient:reply:](self, "getServicesWithTransport:forClient:reply:", v22, self, v10);

}

- (unsigned)applicationState
{
  return self->_applicationState;
}

- (void)updateAppInitState
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  id v6;
  id v7;

  if (self->_pid)
  {
    if (self->_bundleIdentifier)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[_GKStateMachine currentState](self->_appInitStateMachine, "currentState"));
      v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("GKAppInitUnknown"));

      if (v4)
      {
        v6 = objc_msgSend((id)objc_opt_class(self, v5), "lastKnownAppInitStateForClientWithBundleID:pid:", self->_bundleIdentifier, self->_pid);
        v7 = (id)objc_claimAutoreleasedReturnValue(v6);
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("GKAppInitialized")))
          -[_GKStateMachine setCurrentState:](self->_appInitStateMachine, "setCurrentState:", CFSTR("GKAppInitialized"));

      }
    }
  }
}

+ (id)lastKnownAppInitStateForClientWithBundleID:(id)a3 pid:(int)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v12;
  uint64_t *v13;
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  __CFString *v20;

  v5 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1000FC888;
  v19 = sub_1000FC898;
  v20 = CFSTR("GKAppInitUnknown");
  v6 = GKSavedAuthentiactionStateQueue();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A7A8;
  block[3] = &unk_1002C3210;
  v14 = a4;
  v12 = v5;
  v13 = &v15;
  v8 = v5;
  dispatch_sync(v7, block);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (NSString)originalBundleIdentifier
{
  return self->_originalBundleIdentifier;
}

- (GKClientProxy)initWithBundleIdentifier:(id)a3 bundleOrNil:(id)a4 pid:(int)a5
{
  uint64_t v5;
  id v9;
  id v10;
  GKClientProxy *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  LSApplicationRecord *v22;
  LSApplicationRecord *applicationRecord;
  uint64_t v24;
  NSNumber *adamID;
  uint64_t v26;
  NSNumber *externalVersion;
  uint64_t v28;
  NSString *language;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSString *v33;
  dispatch_queue_t v34;
  OS_dispatch_queue *authQueue;
  dispatch_queue_t v36;
  OS_dispatch_queue *checkMatchStatusQueue;
  dispatch_queue_t v38;
  OS_dispatch_queue *replyQueue;
  dispatch_queue_t v40;
  OS_dispatch_queue *cacheQueue;
  dispatch_queue_t v42;
  OS_dispatch_queue *delayedRequestsQueue;
  void *v44;
  NSMutableArray *v45;
  NSMutableArray *pendingDataTypesForRefresh;
  id v47;
  void *v48;
  GKThreadsafeDictionary *v49;
  GKThreadsafeDictionary *appSessions;
  uint64_t v51;
  NSDate *achievementsRateLimitingStartDate;
  uint64_t v53;
  NSDate *scoresRateLimitingStartDate;
  NSMapTable *v55;
  NSMapTable *extensionProxies;
  id v57;
  void *context;

  v5 = *(_QWORD *)&a5;
  v9 = a3;
  v10 = a4;
  v11 = -[GKClientProxy init](self, "init");
  if (!v11)
    goto LABEL_20;
  context = objc_autoreleasePoolPush();
  if (!v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GKClientProxy MUST have a bundleIdentifier")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"));
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (bundleIdentifier != nil)\n[%s (%s:%d)]"), v12, "-[GKClientProxy initWithBundleIdentifier:bundleOrNil:pid:]", objc_msgSend(v14, "UTF8String"), 171));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v15);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "applicationProxyForBundleID:", v9));
  v18 = v17;
  v11->_installed = v17 != 0;
  if (!v10)
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundle"));
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundleVersion"));
  if (objc_msgSend(v9, "isEqualToString:", GKGameCenterIdentifier))
  {
    v20 = GKGameCenterBundleVersion;

    v19 = v20;
  }
  if (!v19)
    v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_gkBundleVersion"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundleShortVersion"));
  if ((v21 || (v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_gkBundleShortVersion"))) != 0)
    && !v19)
  {
    v19 = v21;
  }
  else if (!v19 || v21)
  {
    goto LABEL_17;
  }
  v19 = v19;
  v21 = v19;
LABEL_17:
  v11->_pid = v5;
  objc_storeStrong((id *)&v11->_bundleIdentifier, a3);
  v22 = (LSApplicationRecord *)objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v9, 0, 0);
  applicationRecord = v11->_applicationRecord;
  v11->_applicationRecord = v22;

  objc_storeStrong((id *)&v11->_bundleVersion, v19);
  objc_storeStrong((id *)&v11->_bundleShortVersion, v21);
  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "adamID"));
  adamID = v11->_adamID;
  v11->_adamID = (NSNumber *)v24;

  v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "externalVersion"));
  externalVersion = v11->_externalVersion;
  v11->_externalVersion = (NSNumber *)v26;

  v11->_isAppUnlistedAndDisallowed = 0;
  v28 = objc_claimAutoreleasedReturnValue(+[NSBundle _gkPreferredSystemLanguage](NSBundle, "_gkPreferredSystemLanguage"));
  language = v11->_language;
  v11->_language = (NSString *)v28;

  if (!v11->_language)
  {
    v30 = GKGetPreferredLanguage();
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = objc_claimAutoreleasedReturnValue(+[NSLocale canonicalLanguageIdentifierFromString:](NSLocale, "canonicalLanguageIdentifierFromString:", v31));
    v33 = v11->_language;
    v11->_language = (NSString *)v32;

  }
  v11->_applicationState = GKGetApplicationStateForBundleID(v11->_bundleIdentifier);
  v34 = dispatch_queue_create("com.apple.gamecenter.clientproxy.authQueue", 0);
  authQueue = v11->_authQueue;
  v11->_authQueue = (OS_dispatch_queue *)v34;

  v36 = dispatch_queue_create("com.apple.gamecenter.clientproxy.checkMatchStatusQueue", 0);
  checkMatchStatusQueue = v11->_checkMatchStatusQueue;
  v11->_checkMatchStatusQueue = (OS_dispatch_queue *)v36;

  v38 = dispatch_queue_create("com.apple.gamecenter.clientproxy.replyQueue", 0);
  replyQueue = v11->_replyQueue;
  v11->_replyQueue = (OS_dispatch_queue *)v38;

  -[GKClientProxy initializeInitializationStateMachine](v11, "initializeInitializationStateMachine");
  v40 = dispatch_queue_create("com.apple.gamecenter.clientproxy.cacheQueue", 0);
  cacheQueue = v11->_cacheQueue;
  v11->_cacheQueue = (OS_dispatch_queue *)v40;

  v42 = dispatch_queue_create("com.apple.gamecenter.clientproxy.delayedRequestsQueue", 0);
  delayedRequestsQueue = v11->_delayedRequestsQueue;
  v11->_delayedRequestsQueue = (OS_dispatch_queue *)v42;

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v11->_environment = (int64_t)objc_msgSend(v44, "currentEnvironment");
  v45 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  pendingDataTypesForRefresh = v11->_pendingDataTypesForRefresh;
  v11->_pendingDataTypesForRefresh = v45;

  v47 = objc_alloc((Class)GKThreadsafeDictionary);
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.gamed.gk-app-sessions-%@-%d"), v9, v5));
  v49 = (GKThreadsafeDictionary *)objc_msgSend(v47, "initWithName:", v48);
  appSessions = v11->_appSessions;
  v11->_appSessions = v49;

  v11->_achievementsRateLimitingCurrentNumberOfRequests = 0;
  v11->_achievementsRateLimitedCurrentState = 0;
  v51 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  achievementsRateLimitingStartDate = v11->_achievementsRateLimitingStartDate;
  v11->_achievementsRateLimitingStartDate = (NSDate *)v51;

  v11->_scoresRateLimitingCurrentNumberOfRequests = 0;
  v11->_scoresRateLimitedCurrentState = 0;
  v53 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  scoresRateLimitingStartDate = v11->_scoresRateLimitingStartDate;
  v11->_scoresRateLimitingStartDate = (NSDate *)v53;

  v55 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 5, 5, 6);
  extensionProxies = v11->_extensionProxies;
  v11->_extensionProxies = v55;

  v57 = objc_alloc_init((Class)NSMutableDictionary);
  -[GKClientProxy setAlreadyCoalescingNetworkRequests:](v11, "setAlreadyCoalescingNetworkRequests:", v57);

  objc_autoreleasePoolPop(context);
LABEL_20:

  return v11;
}

- (BOOL)clientHasAnyPrivateEntitlement
{
  void *v3;
  GKClientProxy *v4;
  GKClientProxy *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));

  if (v3)
  {
    v4 = (GKClientProxy *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectEnumerator"));
      v5 = (GKClientProxy *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextObject"));

      goto LABEL_6;
    }
    v4 = self;
  }
  v5 = v4;
LABEL_6:
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy entitlements](v5, "entitlements"));
  v11 = objc_msgSend(v10, "hasAnyPrivateEntitlement");

  return v11;
}

- (GKUIViewService)viewService
{
  return (GKUIViewService *)objc_loadWeakRetained((id *)&self->_viewService);
}

- (NSMapTable)extensionProxies
{
  return self->_extensionProxies;
}

- (void)getServicesWithTransport:(id)a3 forClient:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  NSObject *queue;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  _QWORD block[4];
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;

  v56 = a5;
  v8 = a4;
  v9 = a3;
  v11 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKAccountService, v10), v9, v8, 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKProfileService, v12), v9, v8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v16 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKFriendService, v15), v9, v8, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v19 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKGameService, v18), v9, v8, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v22 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKGameStatService, v21), v9, v8, 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKChallengeService, v23), v9, v8, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v27 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKMultiplayerMatchService, v26), v9, v8, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v29 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKTurnBasedService, v28), v9, v8, 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKUtilityService, v30), v9, v8, 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKBulletinService, v32), v9, v8, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  v36 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKGameSessionService, v35), v9, v8, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);

  queue = objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F8F0;
  block[3] = &unk_1002C30C0;
  v58 = v55;
  v59 = v14;
  v60 = v17;
  v61 = v20;
  v62 = v46;
  v63 = v25;
  v64 = v47;
  v65 = v49;
  v66 = v51;
  v67 = v34;
  v68 = v37;
  v69 = v56;
  v54 = v37;
  v53 = v34;
  v52 = v51;
  v50 = v49;
  v48 = v47;
  v38 = v25;
  v39 = v46;
  v40 = v20;
  v41 = v17;
  v42 = v14;
  v43 = v55;
  v44 = v56;
  dispatch_async(queue, block);

}

- (void)getPrivateServicesWithTransport:(id)a3 forClient:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  NSObject *queue;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  _QWORD block[4];
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;

  v56 = a5;
  v8 = a4;
  v9 = a3;
  v11 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKAccountServicePrivate, v10), v9, v8, 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKProfileServicePrivate, v12), v9, v8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v16 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKFriendServicePrivate, v15), v9, v8, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v19 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKGameServicePrivate, v18), v9, v8, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v22 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKGameStatServicePrivate, v21), v9, v8, 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKChallengeServicePrivate, v23), v9, v8, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v27 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKMultiplayerMatchServicePrivate, v26), v9, v8, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v29 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKTurnBasedServicePrivate, v28), v9, v8, 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKUtilityServicePrivate, v30), v9, v8, 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKBulletinServicePrivate, v32), v9, v8, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  v36 = -[GKClientProxy serviceForClass:transport:client:credential:](self, "serviceForClass:transport:client:credential:", objc_opt_class(GKGameSessionServicePrivate, v35), v9, v8, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);

  queue = objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F8AC;
  block[3] = &unk_1002C30C0;
  v58 = v55;
  v59 = v14;
  v60 = v17;
  v61 = v20;
  v62 = v46;
  v63 = v25;
  v64 = v47;
  v65 = v49;
  v66 = v51;
  v67 = v34;
  v68 = v37;
  v69 = v56;
  v54 = v37;
  v53 = v34;
  v52 = v51;
  v50 = v49;
  v48 = v47;
  v38 = v25;
  v39 = v46;
  v40 = v20;
  v41 = v17;
  v42 = v14;
  v43 = v55;
  v44 = v56;
  dispatch_async(queue, block);

}

- (void)didEnterForeground
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  GKClientProxy *v12;
  uint8_t buf[4];
  void *v14;

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "did enter foreground: %@", buf, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  objc_msgSend(v7, "invalidate");

  if (-[GKClientProxy isGameCenter](self, "isGameCenter"))
  {
    -[GKClientProxy refreshPendingDataTypes](self, "refreshPendingDataTypes");
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
    objc_msgSend(v8, "setAuthenticatingWithSettingsBundleID:", 0);

  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100100D60;
  v10[3] = &unk_1002BB658;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy inviteSession](self, "inviteSession"));
  v12 = self;
  v9 = v11;
  objc_msgSend(v9, "performAsync:", v10);

}

- (BOOL)isGameCenter
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
  v3 = objc_msgSend(v2, "isEqualToString:", GKGameCenterIdentifier);

  return v3;
}

- (GKInviteSession)inviteSession
{
  return (GKInviteSession *)objc_getProperty(self, a2, 232, 1);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

+ (id)gameCenterClient
{
  return objc_msgSend(a1, "clientForBundleID:bundle:pid:createIfNecessary:", GKGameCenterIdentifier, 0, 0, 1);
}

- (id)transportWithCredential:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeBag"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataTransport transportWithBag:clientProxy:credential:](GKDataTransport, "transportWithBag:clientProxy:credential:", v6, self, v4));

  return v7;
}

- (id)transactionGroupWithName:(id)a3 forPlayerID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy+Cache.m", 59, "-[GKClientProxy(Cache) transactionGroupWithName:forPlayerID:]"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy _managedObjectContextForPlayerID:](self, "_managedObjectContextForPlayerID:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v6, v7, self));
  return v8;
}

- (id)_managedObjectContextForPlayerID:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v5 = a3;
  if (qword_100317FF0 != -1)
    dispatch_once(&qword_100317FF0, &stru_1002C3568);
  v6 = objc_msgSend((id)objc_opt_class(self, v4), "contextKeyForPlayerID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)qword_100317FE8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001068DC;
  v12[3] = &unk_1002C3590;
  v12[4] = self;
  v13 = v5;
  v9 = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:objectProducerBlock:", v7, v12));

  return v10;
}

+ (id)contextKeyForPlayerID:(id)a3
{
  if (a3)
    return a3;
  else
    return CFSTR("<global>");
}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (id)credentialForPlayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  uint64_t v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountName"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "credentialForUsername:environment:", v7, -[GKClientProxy environment](self, "environment")));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "playerID"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
    v10 = -[GKClientProxy environment](self, "environment");
    if (v9)
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "credentialForPlayer:environment:", v4, v10));
    else
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "primaryCredentialForEnvironment:", v10));
    v8 = (void *)v11;
  }

  return v8;
}

- (void)updateIfRecentlyInstalled
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKClientProxy: updateIfRecentlyInstalled", buf, 2u);
  }
  if (!-[GKClientProxy installed](self, "installed"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "applicationProxyForBundleID:", v6));

    if (v7)
    {
      if (!os_log_GKGeneral)
        v9 = (id)GKOSLoggers(v8);
      v10 = os_log_GKTrace;
      if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKClientProxy: updateIfRecentlyInstalled - workspace and appProxy exist, updating", v15, 2u);
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleVersion"));
      -[GKClientProxy setBundleVersion:](self, "setBundleVersion:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleShortVersion"));
      -[GKClientProxy setBundleShortVersion:](self, "setBundleShortVersion:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "adamID"));
      -[GKClientProxy setAdamID:](self, "setAdamID:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "externalVersion"));
      -[GKClientProxy setExternalVersion:](self, "setExternalVersion:", v14);

      -[GKClientProxy setInstalled:](self, "setInstalled:", 1);
    }

  }
}

- (BOOL)installed
{
  return self->_installed;
}

+ (id)_clientLookup
{
  if (qword_100317FB8 != -1)
    dispatch_once(&qword_100317FB8, &stru_1002C2F40);
  return (id)qword_100317FB0;
}

+ (id)clientForBundleID:(id)a3 bundle:(id)a4 pid:(int)a5 createIfNecessary:(BOOL)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v24;
  id v25;
  _BYTE *v26;
  id v27;
  int v28;
  BOOL v29;
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (!os_log_GKGeneral)
    v13 = (id)GKOSLoggers(v11);
  v14 = os_log_GKTrace;
  v15 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if ((_DWORD)v15)
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "GKClientProxy: clientForBundleID: %@, pid: %d", buf, 0x12u);
  }
  if (v10 || !(_DWORD)v7)
  {
    if (v10)
    {
LABEL_13:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v31 = sub_1000FC888;
      v32 = sub_1000FC898;
      v33 = 0;
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "factoryQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000E5EC;
      block[3] = &unk_1002C2F88;
      v26 = buf;
      v27 = a1;
      v28 = v7;
      v24 = v10;
      v29 = a6;
      v25 = v12;
      v19 = v10;
      dispatch_sync(v18, block);

      v20 = *(id *)(*(_QWORD *)&buf[8] + 40);
      _Block_object_dispose(buf, 8);

      goto LABEL_19;
    }
  }
  else
  {
    v15 = objc_claimAutoreleasedReturnValue(+[NSBundle _gkBundleIdentifierOrProcessNameForPID:](NSBundle, "_gkBundleIdentifierOrProcessNameForPID:", v7));
    v10 = (id)v15;
    if (v15)
    {
      if (!os_log_GKGeneral)
        v16 = (id)GKOSLoggers(v15);
      v17 = os_log_GKTrace;
      if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v10;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "GKClientProxy: clientForBundleID: - Obtained bundleID: %@", buf, 0xCu);
      }
      goto LABEL_13;
    }
  }
  if (!os_log_GKGeneral)
    v21 = (id)GKOSLoggers(v15);
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    sub_1001062E4();
  v20 = 0;
LABEL_19:

  return v20;
}

- (id)serviceForClass:(Class)a3 transport:(id)a4 client:(id)a5 credential:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class(GKService, v13)) & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"));
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([serviceClass isSubclassOfClass:[GKService class]])\n[%s (%s:%d)]"), v14, "-[GKClientProxy(GKDaemonProtocol) serviceForClass:transport:client:credential:]", objc_msgSend(v16, "UTF8String"), 1195));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v17);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy entitlements](self, "entitlements"));
  if (objc_msgSend(v18, "hasEntitlements:", -[objc_class requiredEntitlements](a3, "requiredEntitlements")))v19 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class serviceWithTransport:forClient:credential:](a3, "serviceWithTransport:forClient:credential:", v10, v11, v12));
  else
    v19 = 0;
  if (objc_msgSend(v19, "requiresAuthentication")
    && (objc_msgSend(v18, "hasEntitlements:", &_mh_execute_header) & 1) == 0
    && !-[GKClientProxy isUIService](self, "isUIService")
    && !-[GKClientProxy isExtension](self, "isExtension"))
  {
    v20 = objc_claimAutoreleasedReturnValue(+[GKAuthenticationWrapperService authenticationWrapperForService:](GKAuthenticationWrapperService, "authenticationWrapperForService:", v19));

    v19 = (void *)v20;
  }

  return v19;
}

- (GKEntitlements)entitlements
{
  return (GKEntitlements *)objc_getProperty(self, a2, 56, 1);
}

- (int64_t)environment
{
  return self->_environment;
}

+ (id)factoryQueue
{
  if (qword_100317FA8 != -1)
    dispatch_once(&qword_100317FA8, &stru_1002C2F20);
  return (id)qword_100317FA0;
}

- (void)setPreviousApplicationState:(unsigned int)a3
{
  self->_previousApplicationState = a3;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void)setOriginalBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_originalBundleIdentifier, a3);
}

- (void)setEntitlements:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setConnection:(id)a3
{
  self->_connection = (NSXPCConnection *)a3;
}

- (void)setApplicationState:(unsigned int)a3
{
  self->_applicationState = a3;
}

- (void)setAppInitStateMachine:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (void)setAlreadyCoalescingNetworkRequests:(id)a3
{
  objc_storeStrong((id *)&self->_alreadyCoalescingNetworkRequests, a3);
}

- (BOOL)isUIService
{
  return 0;
}

- (BOOL)isExtension
{
  return 0;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSString)bundleShortVersion
{
  return self->_bundleShortVersion;
}

+ (id)clientForBundleID:(id)a3 pid:(int)a4 createIfNecessary:(BOOL)a5
{
  return objc_msgSend(a1, "clientForBundleID:bundle:pid:createIfNecessary:", a3, 0, *(_QWORD *)&a4, a5);
}

- (BOOL)currentGameSupportsMultiplayer
{
  void *v3;
  unsigned __int8 v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy currentGame](self, "currentGame"));
  if ((objc_msgSend(v3, "supportsMultiplayer") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy currentGame](self, "currentGame"));
    v4 = objc_msgSend(v5, "supportsTurnBasedMultiplayer");

  }
  return v4;
}

- (GKViceroyNearbyDiscovery)nearbyDiscovery
{
  void *v3;
  unsigned __int8 v4;
  _BOOL8 v5;
  GKViceroyNearbyDiscovery *nearbyDiscovery;
  GKViceroyNearbyDiscovery *v7;
  GKViceroyNearbyDiscovery *v8;
  GKViceroyNearbyDiscovery *v9;
  id v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v4 = objc_msgSend(v3, "disableViceroyNearby");

  if ((v4 & 1) != 0)
  {
LABEL_10:
    v9 = 0;
    return v9;
  }
  v5 = -[GKClientProxy currentGameSupportsMultiplayer](self, "currentGameSupportsMultiplayer");
  if (!v5)
  {
    if (!os_log_GKGeneral)
      v10 = (id)GKOSLoggers(v5);
    v11 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      sub_100105FDC(v11, self);
    goto LABEL_10;
  }
  nearbyDiscovery = self->_nearbyDiscovery;
  if (!nearbyDiscovery)
  {
    v7 = (GKViceroyNearbyDiscovery *)objc_alloc_init((Class)GKViceroyNearbyDiscovery);
    v8 = self->_nearbyDiscovery;
    self->_nearbyDiscovery = v7;

    nearbyDiscovery = self->_nearbyDiscovery;
  }
  v9 = nearbyDiscovery;
  return v9;
}

- (GKPeerDiscovery)peerDiscovery
{
  _BOOL8 v3;
  GKPeerDiscovery *peerDiscovery;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  GKPeerDiscovery *v14;
  void *v15;
  GKPeerDiscovery *v16;
  GKPeerDiscovery *v17;
  id v18;
  void *v19;
  GKPeerDiscovery *v20;
  id v21;

  v3 = -[GKClientProxy currentGameSupportsMultiplayer](self, "currentGameSupportsMultiplayer");
  if (v3)
  {
    peerDiscovery = self->_peerDiscovery;
    if (!peerDiscovery)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pushCredentialForEnvironment:", -[GKClientProxy environment](self, "environment")));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playerInternal"));

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pushToken"));

      if (v9 && (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "playerID")), v11, v11))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
        v13 = objc_msgSend(v12, "fastSyncTransportEnabled");

        if (v13)
        {
          v14 = [GKPeerDiscovery alloc];
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "playerID"));
          v16 = -[GKPeerDiscovery initWithDelegate:localPlayerID:localPushToken:](v14, "initWithDelegate:localPlayerID:localPushToken:", self, v15, v9);
          v17 = self->_peerDiscovery;
          self->_peerDiscovery = v16;

        }
      }
      else
      {
        if (!os_log_GKGeneral)
          v21 = (id)GKOSLoggers(v10);
        if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
          sub_100106068();
      }

      peerDiscovery = self->_peerDiscovery;
    }
    v20 = peerDiscovery;
  }
  else
  {
    if (!os_log_GKGeneral)
      v18 = (id)GKOSLoggers(v3);
    v19 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      sub_100106094(v19, self);
    v20 = 0;
  }
  return v20;
}

- (void)clearDiscoveryInfo
{
  id v3;
  GKViceroyNearbyDiscovery *nearbyDiscovery;
  id v5;
  void *v6;
  void *v7;
  GKPeerDiscovery *peerDiscovery;
  id v9;
  GKPeerDiscovery *v10;
  id v11;
  GKPeerDiscovery *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  if (self->_nearbyDiscovery)
  {
    if (!os_log_GKGeneral)
      v3 = (id)GKOSLoggers(self);
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      sub_10010614C();
    -[GKViceroyNearbyDiscovery stopBrowsing](self->_nearbyDiscovery, "stopBrowsing");
    -[GKViceroyNearbyDiscovery stopAdvertising](self->_nearbyDiscovery, "stopAdvertising");
    nearbyDiscovery = self->_nearbyDiscovery;
    self->_nearbyDiscovery = 0;

  }
  if (self->_peerDiscovery)
  {
    if (!os_log_GKGeneral)
      v5 = (id)GKOSLoggers(self);
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      sub_100106120();
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m", 310, "-[GKClientProxy clearDiscoveryInfo]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v6));

    objc_msgSend(v7, "enter");
    peerDiscovery = self->_peerDiscovery;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000FA890;
    v15[3] = &unk_1002BBBD8;
    v9 = v7;
    v16 = v9;
    -[GKPeerDiscovery stopListeningWithCompletionHandler:](peerDiscovery, "stopListeningWithCompletionHandler:", v15);
    objc_msgSend(v9, "enter");
    v10 = self->_peerDiscovery;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000FA8F8;
    v13[3] = &unk_1002BBBD8;
    v14 = v9;
    v11 = v9;
    -[GKPeerDiscovery stopBrowsingWithCompletionHandler:](v10, "stopBrowsingWithCompletionHandler:", v13);
    objc_msgSend(v11, "wait");
    v12 = self->_peerDiscovery;
    self->_peerDiscovery = 0;

  }
}

- (NSString)parentBundleIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy applicationRecord](self, "applicationRecord"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy applicationRecord](self, "applicationRecord"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appClipMetadata"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentApplicationIdentifiers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy getParentBundleIDPrefixWithChildBundleID:parentBundleID:](GKClientProxy, "getParentBundleIDPrefixWithChildBundleID:parentBundleID:", v4, v8));

  }
  else
  {
    v9 = 0;
  }

  return (NSString *)v9;
}

- (BOOL)distributorIsFirstPartyApple
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy applicationRecord](self, "applicationRecord"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iTunesMetadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "distributorInfo"));
  v6 = objc_msgSend(v5, "distributorIsFirstPartyApple");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy applicationRecord](self, "applicationRecord"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "iTunesMetadata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sourceApp"));

  if (qword_100317F88 != -1)
    dispatch_once(&qword_100317F88, &stru_1002C2E40);
  v10 = +[GKClientProxy isFirstParty:sourceApp:allowList:](GKClientProxy, "isFirstParty:sourceApp:allowList:", v6, v9, qword_100317F80);

  return v10;
}

+ (BOOL)isFirstParty:(BOOL)a3 sourceApp:(id)a4 allowList:(id)a5
{
  id v7;
  id v8;
  char v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;

  v7 = a4;
  v8 = objc_msgSend(a5, "containsObject:", v7);
  v9 = (char)v8;
  if ((_DWORD)v8)
  {
    v10 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v11 = (id)GKOSLoggers(v8);
      v10 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_1001061D0();
  }
  else if (!a3)
  {
    v12 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v13 = (id)GKOSLoggers(v8);
      v12 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_100106234();
  }

  return v9 | a3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
  objc_msgSend(v3, "setHostClient:", 0);

  -[GKClientProxy setViewService:](self, "setViewService:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy sandboxExtensionToken](self, "sandboxExtensionToken"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy sandboxExtensionToken](self, "sandboxExtensionToken"));
    sandbox_extension_release(objc_msgSend(v5, "longLongValue"));

  }
  -[NSMapTable removeAllObjects](self->_extensionProxies, "removeAllObjects");
  v6.receiver = self;
  v6.super_class = (Class)GKClientProxy;
  -[GKClientProxy dealloc](&v6, "dealloc");
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (v10
      && (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleVersion")),
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleVersion](self, "bundleVersion")),
          v13 = objc_msgSend(v11, "isEqual:", v12),
          v12,
          v11,
          v13))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleShortVersion"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleShortVersion](self, "bundleShortVersion"));
      v16 = objc_msgSend(v14, "isEqual:", v15);

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSDictionary)gameDescriptor
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = objc_claimAutoreleasedReturnValue(-[GKClientProxy adamID](self, "adamID"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy adamID](self, "adamID"));
    v7 = (uint64_t)objc_msgSend(v6, "integerValue");

    if (v7 >= 1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy adamID](self, "adamID"));
      objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("adam-id"));

    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy externalVersion](self, "externalVersion"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy externalVersion](self, "externalVersion"));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("external-version"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("bundle-id"));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy parentBundleIdentifier](self, "parentBundleIdentifier"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy parentBundleIdentifier](self, "parentBundleIdentifier"));
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("parent-bundle-id"));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleVersion](self, "bundleVersion"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleVersion](self, "bundleVersion"));
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("bundle-version"));

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleShortVersion](self, "bundleShortVersion"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleShortVersion](self, "bundleShortVersion"));
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("short-bundle-version"));

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameDescriptor stringForPlatform:](GKGameDescriptor, "stringForPlatform:", +[GKApplicationWorkspace getPlatformForBundleID:](GKApplicationWorkspace, "getPlatformForBundleID:", v19)));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("platform"));

  return (NSDictionary *)v3;
}

- (NSLocale)locale
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy language](self, "language"));
  if (v2)
    v3 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", v2);
  else
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v4 = v3;

  return (NSLocale *)v4;
}

- (int64_t)appSignatureType
{
  uint64_t v3;
  void *v4;
  void *v5;
  int64_t v6;
  _OWORD v8[2];

  v3 = -[GKClientProxy pid](self, "pid");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy connection](self, "connection"));
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "auditToken");
  else
    memset(v8, 0, sizeof(v8));
  v6 = +[GKClientAppSigningStatus appSignatureType:auditToken:](GKClientAppSigningStatus, "appSignatureType:auditToken:", v3, v8);

  return v6;
}

- (BOOL)isDevSigned
{
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;
  _OWORD v8[2];

  v3 = -[GKClientProxy pid](self, "pid");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy connection](self, "connection"));
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "auditToken");
  else
    memset(v8, 0, sizeof(v8));
  v6 = +[GKClientAppSigningStatus appIsDevSigned:auditToken:](GKClientAppSigningStatus, "appIsDevSigned:auditToken:", v3, v8);

  return v6;
}

- (BOOL)conformsToMultiUserRestrictions
{
  return 1;
}

- (NSString)protocolVersion
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v3 = GKGetProtocolVersionString(objc_msgSend(v2, "useTestProtocols"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (NSString *)v4;
}

- (void)setExtensionProxy:(id)a3 forBundleID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v6)
  {
    if (v10)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy preferencesFromBag](self, "preferencesFromBag"));

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy preferencesFromBag](self, "preferencesFromBag"));
        objc_msgSend(v10, "setPreferencesValues:", v8);

      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
      objc_msgSend(v9, "setObject:forKey:", v10, v6);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
      objc_msgSend(v9, "removeObjectForKey:", v6);
    }

  }
}

- (void)updatePreferencesFromBag:(id)a3
{
  id v4;

  v4 = a3;
  -[GKClientProxy setPreferencesFromBag:](self, "setPreferencesFromBag:", v4);
  -[GKClientProxy setPreferencesValues:](self, "setPreferencesValues:", v4);

}

- (void)setLaunchEvent:(unint64_t)a3 withContext:(id)a4
{
  id v6;
  GKEventTuple *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  unsigned int v12;
  void *v13;
  _DWORD v14[2];
  __int16 v15;
  void *v16;
  __int16 v17;
  GKClientProxy *v18;

  v6 = a4;
  v7 = (GKEventTuple *)objc_claimAutoreleasedReturnValue(-[GKClientProxy launchEvent](self, "launchEvent"));
  if (!v7)
    v7 = objc_alloc_init(GKEventTuple);
  -[GKEventTuple setEventType:](v7, "setEventType:", a3);
  -[GKEventTuple setContext:](v7, "setContext:", v6);

  v8 = -[GKClientProxy setLaunchEvent:](self, "setLaunchEvent:", v7);
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v8);
  v10 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = -[GKEventTuple eventType](v7, "eventType");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKEventTuple context](v7, "context"));
    v14[0] = 67109634;
    v14[1] = v12;
    v15 = 2112;
    v16 = v13;
    v17 = 2112;
    v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "New launch event(%d) context %@ for client %@", (uint8_t *)v14, 0x1Cu);

  }
}

+ (id)syncQueue
{
  if (qword_100317F98 != -1)
    dispatch_once(&qword_100317F98, &stru_1002C2E60);
  return (id)qword_100317F90;
}

- (void)performSync:(id)a3
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  dispatch_queue_t current_queue;
  NSObject *v8;
  const char *label;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  dispatch_block_t block;

  block = a3;
  v5 = objc_msgSend((id)objc_opt_class(self, v4), "syncQueue");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  current_queue = dispatch_get_current_queue();
  v8 = objc_claimAutoreleasedReturnValue(current_queue);

  if (v8 == v6)
  {
    label = dispatch_queue_get_label(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the same queue(\"%s\"), would deadlock at %@"), "-[GKClientProxy performSync:]", label, v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (dispatch_get_current_queue() != queue)\n[%s (%s:%d)]"), v11, "-[GKClientProxy performSync:]", objc_msgSend(v13, "UTF8String"), 586));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }
  dispatch_sync(v6, block);

}

- (void)performAsync:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;

  v4 = a3;
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "syncQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  dispatch_async(v7, v4);

}

- (void)checkMatchStatus
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  GKClientProxy *v9;
  id v10;
  unsigned int v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy currentMatchResponse](self, "currentMatchResponse"));
  if (objc_msgSend(v3, "transitionToState:", 3))
  {
    v4 = objc_msgSend(v3, "sequence");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "matchingGroup"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000FB748;
    v7[3] = &unk_1002C2EB0;
    v8 = v3;
    v9 = self;
    v11 = v4;
    v10 = v5;
    v6 = v5;
    objc_msgSend(v6, "perform:", v7);

  }
}

- (BOOL)processMatchResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  _BOOL8 v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v42;
  double v43;
  double v44;
  dispatch_time_t v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  GKClientProxy *v51;
  _QWORD v52[6];
  uint8_t buf[4];
  void *v54;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy currentMatchResponse](self, "currentMatchResponse"));
  v6 = v5;
  if (!v5)
  {
    if (!os_log_GKGeneral)
      v9 = (id)GKOSLoggers(0);
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      sub_100106260();
    goto LABEL_28;
  }
  v7 = objc_msgSend(v5, "isFinished");
  if ((_DWORD)v7)
  {
    if (!os_log_GKGeneral)
      v8 = (id)GKOSLoggers(v7);
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      sub_10010628C();
    goto LABEL_28;
  }
  if (!v4)
  {
LABEL_28:
    v17 = 0;
    goto LABEL_29;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("rid")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rid"));

  if (!v11)
  {
    objc_msgSend(v6, "setRid:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serverRequest"));
    v13 = objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "setObject:forKey:", v10, CFSTR("rid"));
    objc_msgSend(v6, "setServerRequest:", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("match-id")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status")));
  v16 = objc_msgSend(v15, "integerValue");

  v17 = v16 != (id)5067;
  if (v16 == (id)5067)
  {
    objc_msgSend(v6, "transitionToState:", 6);
  }
  else if (v14)
  {
    if (objc_msgSend(v6, "transitionToState:", 4))
    {
      v48 = v10;
      -[GKClientProxy cancelOutstandingCheckMatchStatus](self, "cancelOutstandingCheckMatchStatus");
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("matches")));
      objc_msgSend(v6, "setMatches:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("match-id")));
      objc_msgSend(v6, "setMatchID:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("rid")));
      objc_msgSend(v6, "setRid:", v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("session-token")));
      objc_msgSend(v6, "setSessionToken:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("ticket")));
      objc_msgSend(v6, "setCdxTicket:", v22);

      v23 = GKSuggestedTransportVersionKey;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", GKSuggestedTransportVersionKey));

      if (v24)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v23));
        objc_msgSend(v6, "setTransportVersionToUse:", v26);

      }
      v47 = v14;
      if (!os_log_GKGeneral)
        v27 = (id)GKOSLoggers(v25);
      v28 = (void *)os_log_GKMatch;
      v29 = os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO);
      if (v29)
      {
        v30 = v28;
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "matches"));
        *(_DWORD *)buf = 138412290;
        v54 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "SUCCESS matches: %@", buf, 0xCu);

      }
      if (!os_log_GKGeneral)
        v32 = (id)GKOSLoggers(v29);
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_DEBUG))
        sub_1001062B8();
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m", 709, "-[GKClientProxy processMatchResponse:]"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "pushCredentialForEnvironment:", -[GKClientProxy environment](self, "environment")));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "playerInternal"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "playerID"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy transactionGroupWithName:forPlayerID:](self, "transactionGroupWithName:forPlayerID:", v33, v37));

      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "context"));
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_1000FC1F8;
      v49[3] = &unk_1002BB658;
      v50 = v38;
      v51 = self;
      v40 = v38;
      objc_msgSend(v39, "performBlockAndWait:", v49);

      v14 = v47;
      v10 = v48;
    }
  }
  else
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("poll-delay-ms")));
    objc_msgSend(v42, "doubleValue");
    v44 = v43 / 1000.0;

    v45 = dispatch_time(0, (uint64_t)(v44 * 1000000000.0));
    if (objc_msgSend(v6, "transitionToState:", 2))
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "matchingGroup"));
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_1000FC014;
      v52[3] = &unk_1002BBF58;
      v52[4] = self;
      v52[5] = v45;
      objc_msgSend(v46, "perform:", v52);

    }
  }

LABEL_29:
  return v17;
}

- (void)setCheckMatchStatusTimer:(id)a3
{
  OS_dispatch_source *v4;
  dispatch_queue_t current_queue;
  NSObject *v6;
  NSObject *v7;
  const char *label;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *checkMatchStatusTimer;
  OS_dispatch_source *v17;

  v4 = (OS_dispatch_source *)a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  v7 = objc_claimAutoreleasedReturnValue(-[GKClientProxy checkMatchStatusQueue](self, "checkMatchStatusQueue"));

  if (v6 != v7)
  {
    label = dispatch_queue_get_label(v6);
    v9 = objc_claimAutoreleasedReturnValue(-[GKClientProxy checkMatchStatusQueue](self, "checkMatchStatusQueue"));
    v10 = dispatch_queue_get_label(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKClientProxy setCheckMatchStatusTimer:]", label, v10, v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"));
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == self.checkMatchStatusQueue)\n[%s (%s:%d)]"), v12, "-[GKClientProxy setCheckMatchStatusTimer:]", objc_msgSend(v14, "UTF8String"), 724));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v15);
  }

  checkMatchStatusTimer = self->_checkMatchStatusTimer;
  if (checkMatchStatusTimer)
    dispatch_source_cancel(checkMatchStatusTimer);
  v17 = self->_checkMatchStatusTimer;
  self->_checkMatchStatusTimer = v4;

}

- (void)cancelOutstandingCheckMatchStatus
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[GKClientProxy checkMatchStatusQueue](self, "checkMatchStatusQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FC4B0;
  block[3] = &unk_1002BBBD8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)cancelInvitationForSession:(id)a3 playerID:(id)a4 pushTokens:(id)a5 handler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD block[4];
  id v33;
  _QWORD *v34;
  _QWORD v35[4];
  NSObject *v36;
  _QWORD *v37;
  _QWORD v38[5];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[2];
  _QWORD v47[2];
  _BYTE v48[128];

  v30 = a3;
  v9 = a4;
  v10 = a5;
  v27 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v41;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v41 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v15);
        v46[0] = CFSTR("id");
        v46[1] = CFSTR("push-token");
        v47[0] = v9;
        v47[1] = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v47, v46, 2));
        objc_msgSend(v11, "addObject:", v17);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v13);
  }

  v44[0] = CFSTR("session-token");
  v44[1] = CFSTR("peers");
  v45[0] = v30;
  v45[1] = v11;
  v44[2] = CFSTR("reason");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
  v45[2] = v18;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 3));

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v19 = dispatch_group_create();
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_1000FC888;
  v38[4] = sub_1000FC898;
  v39 = 0;
  dispatch_group_enter(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "storeBag"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "_gkPlistXMLDataForClient:player:", self, 0));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "pushCredentialForEnvironment:", -[GKClientProxy environment](self, "environment")));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000FC8A0;
  v35[3] = &unk_1002C2ED8;
  v37 = v38;
  v24 = v19;
  v36 = v24;
  objc_msgSend(v20, "writeDataForBagKey:postData:client:credential:completion:", CFSTR("gk-invitation-cancel"), v21, self, v23, v35);

  v25 = objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FC93C;
  block[3] = &unk_1002C2C60;
  v33 = v27;
  v34 = v38;
  v26 = v27;
  dispatch_group_notify(v24, v25, block);

  _Block_object_dispose(v38, 8);
}

- (id)fetchOrCreateInviteSession
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  GKInviteSession *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy inviteSession](self, "inviteSession"));

  if (v3)
  {
    if (!os_log_GKGeneral)
      v5 = (id)GKOSLoggers(v4);
    v6 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy inviteSession](self, "inviteSession"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy inviteSession](self, "inviteSession"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sessionToken"));
      v20 = 134218242;
      v21 = v8;
      v22 = 2112;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Already have GKInviteSession(%p), token: %@", (uint8_t *)&v20, 0x16u);

LABEL_10:
    }
  }
  else
  {
    v11 = objc_alloc_init(GKInviteSession);
    -[GKClientProxy setInviteSession:](self, "setInviteSession:", v11);

    if (!os_log_GKGeneral)
      v13 = (id)GKOSLoggers(v12);
    v14 = (void *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      v7 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy inviteSession](self, "inviteSession"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy inviteSession](self, "inviteSession"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sessionToken"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v20 = 134218498;
      v21 = v15;
      v22 = 2112;
      v23 = v17;
      v24 = 2112;
      v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Created a new GKInviteSession(%p), token: %@. Thread: %@", (uint8_t *)&v20, 0x20u);

      goto LABEL_10;
    }
  }
  return (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy inviteSession](self, "inviteSession"));
}

- (void)deleteInviteSession
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = (void *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy inviteSession](self, "inviteSession"));
    v10 = 134217984;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKClientProxy - deleteInviteSession, self.inviteSession: %p", (uint8_t *)&v10, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy inviteSession](self, "inviteSession"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shareRecordID"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession privateDatabase](GKCloudGameSession, "privateDatabase"));
    +[GKCloudGameSession deleteInviteRecordWithRecordID:fromDatabase:](GKCloudGameSession, "deleteInviteRecordWithRecordID:fromDatabase:", v8, v9);

  }
  -[GKClientProxy setInviteSession:](self, "setInviteSession:", 0);

}

- (void)refreshPendingDataTypes
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Refreshing pending data types for %@", buf, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy pendingDataTypesForRefresh](self, "pendingDataTypesForRefresh"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy pendingDataTypesForRefresh](self, "pendingDataTypesForRefresh"));
    v10 = objc_msgSend(v9, "copy");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy pendingDataTypesForRefresh](self, "pendingDataTypesForRefresh"));
    objc_msgSend(v11, "removeAllObjects");

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000FCE54;
    v12[3] = &unk_1002C2F00;
    v12[4] = self;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);

  }
}

- (void)playerFound:(id)a3 deviceID:(id)a4 discoveryInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v10);
  v13 = os_log_GKFastSync;
  if (os_log_type_enabled(os_log_GKFastSync, OS_LOG_TYPE_INFO))
  {
    v14 = 138412802;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "PeerDiscovery player found: %@, deviceID: %@, discoveryInfo: %@", (uint8_t *)&v14, 0x20u);
  }
  -[GKClientProxy nearbyPlayerFoundForPlayerID:deviceID:discoveryInfo:](self, "nearbyPlayerFoundForPlayerID:deviceID:discoveryInfo:", v8, v9, v11);

}

- (void)playerLost:(id)a3 deviceID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKFastSync;
  if (os_log_type_enabled(os_log_GKFastSync, OS_LOG_TYPE_INFO))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "PeerDiscovery player lost: %@, deviceID: %@", (uint8_t *)&v11, 0x16u);
  }
  -[GKClientProxy nearbyPlayerLostForPlayerID:deviceID:](self, "nearbyPlayerLostForPlayerID:deviceID:", v6, v8);

}

- (void)receivedData:(id)a3 deviceID:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v10);
  v13 = os_log_GKFastSync;
  if (os_log_type_enabled(os_log_GKFastSync, OS_LOG_TYPE_INFO))
  {
    v14 = 138412546;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "PeerDiscovery data received from player: %@, deviceID: %@", (uint8_t *)&v14, 0x16u);
  }
  -[GKClientProxy nearbyDataReceivedForPlayerID:deviceID:data:](self, "nearbyDataReceivedForPlayerID:deviceID:data:", v8, v9, v11);

}

- (OS_dispatch_queue)authQueue
{
  return self->_authQueue;
}

- (void)setAuthQueue:(id)a3
{
  objc_storeStrong((id *)&self->_authQueue, a3);
}

- (int)pid
{
  return self->_pid;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  objc_storeStrong((id *)&self->_adamID, a3);
}

- (LSApplicationRecord)applicationRecord
{
  return self->_applicationRecord;
}

- (NSNumber)sandboxExtensionToken
{
  return self->_sandboxExtensionToken;
}

- (void)setSandboxExtensionToken:(id)a3
{
  objc_storeStrong((id *)&self->_sandboxExtensionToken, a3);
}

- (NSNumber)externalVersion
{
  return self->_externalVersion;
}

- (void)setExternalVersion:(id)a3
{
  objc_storeStrong((id *)&self->_externalVersion, a3);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (void)setBundleVersion:(id)a3
{
  objc_storeStrong((id *)&self->_bundleVersion, a3);
}

- (void)setBundleShortVersion:(id)a3
{
  objc_storeStrong((id *)&self->_bundleShortVersion, a3);
}

- (void)setEnvironment:(int64_t)a3
{
  self->_environment = a3;
}

- (void)setInstalled:(BOOL)a3
{
  self->_installed = a3;
}

- (BOOL)supportsMultipleActivePlayers
{
  return self->_supportsMultipleActivePlayers;
}

- (void)setSupportsMultipleActivePlayers:(BOOL)a3
{
  self->_supportsMultipleActivePlayers = a3;
}

- (NSString)persistentAnchorIdentifier
{
  return self->_persistentAnchorIdentifier;
}

- (void)setPersistentAnchorIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)isOcelot
{
  return self->_isOcelot;
}

- (void)setIsOcelot:(BOOL)a3
{
  self->_isOcelot = a3;
}

- (BOOL)isGameCenterEnabledClient
{
  return self->_isGameCenterEnabledClient;
}

- (void)setIsGameCenterEnabledClient:(BOOL)a3
{
  self->_isGameCenterEnabledClient = a3;
}

- (BOOL)isAppUnlistedAndDisallowed
{
  return self->_isAppUnlistedAndDisallowed;
}

- (void)setIsAppUnlistedAndDisallowed:(BOOL)a3
{
  self->_isAppUnlistedAndDisallowed = a3;
}

- (NSDate)achievementsRateLimitingStartDate
{
  return self->_achievementsRateLimitingStartDate;
}

- (void)setAchievementsRateLimitingStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_achievementsRateLimitingStartDate, a3);
}

- (int64_t)achievementsRateLimitingCurrentNumberOfRequests
{
  return self->_achievementsRateLimitingCurrentNumberOfRequests;
}

- (void)setAchievementsRateLimitingCurrentNumberOfRequests:(int64_t)a3
{
  self->_achievementsRateLimitingCurrentNumberOfRequests = a3;
}

- (unsigned)achievementsRateLimitedCurrentState
{
  return self->_achievementsRateLimitedCurrentState;
}

- (void)setAchievementsRateLimitedCurrentState:(unsigned __int8)a3
{
  self->_achievementsRateLimitedCurrentState = a3;
}

- (NSDate)scoresRateLimitingStartDate
{
  return self->_scoresRateLimitingStartDate;
}

- (void)setScoresRateLimitingStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_scoresRateLimitingStartDate, a3);
}

- (int64_t)scoresRateLimitingCurrentNumberOfRequests
{
  return self->_scoresRateLimitingCurrentNumberOfRequests;
}

- (void)setScoresRateLimitingCurrentNumberOfRequests:(int64_t)a3
{
  self->_scoresRateLimitingCurrentNumberOfRequests = a3;
}

- (unsigned)scoresRateLimitedCurrentState
{
  return self->_scoresRateLimitedCurrentState;
}

- (void)setScoresRateLimitedCurrentState:(unsigned __int8)a3
{
  self->_scoresRateLimitedCurrentState = a3;
}

- (NSMutableDictionary)alreadyCoalescingNetworkRequests
{
  return self->_alreadyCoalescingNetworkRequests;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (void)setViewService:(id)a3
{
  objc_storeWeak((id *)&self->_viewService, a3);
}

- (void)setCurrentGame:(id)a3
{
  objc_storeStrong((id *)&self->_currentGame, a3);
}

- (void)setNearbyDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyDiscovery, a3);
}

- (void)setPeerDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_peerDiscovery, a3);
}

- (unsigned)previousApplicationState
{
  return self->_previousApplicationState;
}

- (GKEventTuple)launchEvent
{
  return self->_launchEvent;
}

- (void)setLaunchEvent:(id)a3
{
  objc_storeStrong((id *)&self->_launchEvent, a3);
}

- (void)setInviteSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (GKMatchResponse)currentMatchResponse
{
  return (GKMatchResponse *)objc_getProperty(self, a2, 240, 1);
}

- (void)setCurrentMatchResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (void)setExtensionProxies:(id)a3
{
  objc_storeStrong((id *)&self->_extensionProxies, a3);
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (_GKStateMachine)appInitStateMachine
{
  return (_GKStateMachine *)objc_getProperty(self, a2, 256, 1);
}

- (GKThreadsafeDictionary)appSessions
{
  return self->_appSessions;
}

- (void)setAppSessions:(id)a3
{
  objc_storeStrong((id *)&self->_appSessions, a3);
}

- (OS_dispatch_queue)delayedRequestsQueue
{
  return self->_delayedRequestsQueue;
}

- (void)setDelayedRequestsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delayedRequestsQueue, a3);
}

- (GKDatabaseConnection)delayedRequestsDBConnection
{
  return self->_delayedRequestsDBConnection;
}

- (void)setDelayedRequestsDBConnection:(id)a3
{
  objc_storeStrong((id *)&self->_delayedRequestsDBConnection, a3);
}

- (OS_dispatch_queue)cacheQueue
{
  return self->_cacheQueue;
}

- (void)setCacheQueue:(id)a3
{
  objc_storeStrong((id *)&self->_cacheQueue, a3);
}

- (NSMutableArray)pendingDataTypesForRefresh
{
  return self->_pendingDataTypesForRefresh;
}

- (void)setPendingDataTypesForRefresh:(id)a3
{
  objc_storeStrong((id *)&self->_pendingDataTypesForRefresh, a3);
}

- (NSDictionary)preferencesFromBag
{
  return self->_preferencesFromBag;
}

- (void)setPreferencesFromBag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (OS_dispatch_source)checkMatchStatusTimer
{
  return self->_checkMatchStatusTimer;
}

- (OS_dispatch_queue)checkMatchStatusQueue
{
  return self->_checkMatchStatusQueue;
}

- (void)setCheckMatchStatusQueue:(id)a3
{
  objc_storeStrong((id *)&self->_checkMatchStatusQueue, a3);
}

- (void)setParentBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_parentBundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_checkMatchStatusQueue, 0);
  objc_storeStrong((id *)&self->_checkMatchStatusTimer, 0);
  objc_storeStrong((id *)&self->_preferencesFromBag, 0);
  objc_storeStrong((id *)&self->_pendingDataTypesForRefresh, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
  objc_storeStrong((id *)&self->_delayedRequestsDBConnection, 0);
  objc_storeStrong((id *)&self->_delayedRequestsQueue, 0);
  objc_storeStrong((id *)&self->_appSessions, 0);
  objc_storeStrong((id *)&self->_appInitStateMachine, 0);
  objc_storeStrong((id *)&self->_extensionProxies, 0);
  objc_storeStrong((id *)&self->_currentMatchResponse, 0);
  objc_storeStrong((id *)&self->_inviteSession, 0);
  objc_storeStrong((id *)&self->_launchEvent, 0);
  objc_storeStrong((id *)&self->_peerDiscovery, 0);
  objc_storeStrong((id *)&self->_nearbyDiscovery, 0);
  objc_storeStrong((id *)&self->_currentGame, 0);
  objc_destroyWeak((id *)&self->_viewService);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_alreadyCoalescingNetworkRequests, 0);
  objc_storeStrong((id *)&self->_scoresRateLimitingStartDate, 0);
  objc_storeStrong((id *)&self->_achievementsRateLimitingStartDate, 0);
  objc_storeStrong((id *)&self->_persistentAnchorIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleShortVersion, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_originalBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_externalVersion, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionToken, 0);
  objc_storeStrong((id *)&self->_applicationRecord, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_authQueue, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
}

+ (id)clientForBundleID:(id)a3
{
  return objc_msgSend(a1, "clientForBundleID:bundle:pid:createIfNecessary:", a3, 0, 0, 1);
}

+ (id)clientForProcessIdentifier:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _gkBundleWithPID:](NSBundle, "_gkBundleWithPID:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "clientForBundleID:bundle:pid:createIfNecessary:", v6, v5, v3, 1));

  return v7;
}

+ (id)foregroundClient
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1000FC888;
  v9 = sub_1000FC898;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000FD8E0;
  v4[3] = &unk_1002C2FB0;
  v4[4] = &v5;
  +[GKClientProxy enumerateClientsUsingBlock:](GKClientProxy, "enumerateClientsUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (id)nonGameCenterForegroundClient
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1000FC888;
  v9 = sub_1000FC898;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000FDA14;
  v4[3] = &unk_1002C2FB0;
  v4[4] = &v5;
  +[GKClientProxy enumerateClientsUsingBlock:](GKClientProxy, "enumerateClientsUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (BOOL)isGameCenterDashboardForegroundRunning
{
  id v2;
  id v3;
  NSObject *v4;
  const __CFString *v5;
  char v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint8_t buf[4];
  const __CFString *v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000FDBEC;
  v8[3] = &unk_1002C2FB0;
  v8[4] = &v9;
  v2 = +[GKClientProxy enumerateClientsUsingBlock:](GKClientProxy, "enumerateClientsUsingBlock:", v8);
  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(v2);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    if (*((_BYTE *)v10 + 24))
      v5 = CFSTR("YES");
    else
      v5 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "isGameCenterDashboardForegroundRunning: %@", buf, 0xCu);
  }
  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

+ (id)clientForInviteSessionToken:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "clientForInviteSessionToken: incoming session token %@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v15 = 0x3032000000;
  v16 = sub_1000FC888;
  v17 = sub_1000FC898;
  v18 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000FDFA8;
  v11[3] = &unk_1002BB710;
  v8 = v5;
  v12 = v8;
  p_buf = &buf;
  objc_msgSend(a1, "enumerateClientsUsingBlock:", v11);
  v9 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v9;
}

+ (id)clientForMatchmakingRID:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_1000FC888;
  v14 = sub_1000FC898;
  v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FE200;
  v7[3] = &unk_1002C2FD8;
  v9 = &v10;
  v4 = a3;
  v8 = v4;
  objc_msgSend(a1, "enumerateClientsUsingBlock:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

+ (id)clientsToBeEnumerated
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1000FC888;
  v11 = sub_1000FC898;
  v12 = objc_alloc_init((Class)NSMutableArray);
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "factoryQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000FE390;
  v6[3] = &unk_1002C3050;
  v6[4] = &v7;
  v6[5] = a1;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (void)enumerateClientsUsingBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "clientsToBeEnumerated"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FE500;
  v7[3] = &unk_1002C3078;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

+ (void)removeClient:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
  if (v5)
  {
    objc_msgSend(v4, "setConnection:", 0);
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "factoryQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000FE5D8;
    block[3] = &unk_1002BBA40;
    v10 = a1;
    v8 = v5;
    v9 = v4;
    dispatch_async(v6, block);

  }
}

- (void)setHostPID:(int)a3 reply:(id)a4
{
  if (a4)
    dispatch_async((dispatch_queue_t)self->_replyQueue, a4);
}

- (void)messagesDidReceiveGameCenterURL:(id)a3 senderHandle:(id)a4 contactID:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  NSObject *log;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "absoluteString"));
    v11 = (void *)v10;
    if (!os_log_GKGeneral)
      v12 = (id)GKOSLoggers(v10);
    v13 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v55 = v8;
      v56 = 2112;
      v57 = v9;
      v58 = 2112;
      v59 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Received URL from %@ (%@) : %@", buf, 0x20u);
    }
    if (!v11)
      goto LABEL_33;
    v48 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v7, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "queryItems"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (!v15)
      goto LABEL_32;
    v16 = v15;
    v46 = v9;
    v47 = v11;
    v45 = v8;
    v17 = 0;
    v18 = *(_QWORD *)v50;
    v19 = GKFriendRequestURLZippedData;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v18)
          objc_enumerationMutation(v14);
        v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
        v23 = objc_msgSend(v22, "isEqualToString:", v19);

        if (v23)
        {
          v24 = v21;

          v17 = v24;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v16);
    v8 = v45;
    v9 = v46;
    v11 = v47;
    if (!v17)
    {
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    v25 = objc_alloc((Class)NSData);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value"));
    v27 = objc_msgSend(v25, "initWithBase64EncodedString:options:", v26, 0);

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "_gkZippedDictionaryValue"));
    v29 = objc_msgSend(v28, "mutableCopy");

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", GKFriendRequestURLFriendCode));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", GKFriendRequestURLSenderAlias));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "dataUsingEncoding:", 4));
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "base64EncodedStringWithOptions:", 0));
    v44 = (void *)v31;
    v32 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v33 = (id)GKOSLoggers(v31);
      v32 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v55 = v30;
      v56 = 2112;
      v57 = v43;
      v58 = 2112;
      v59 = v44;
      _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "New friend request with code: %@, senderAlias: %@, decoded url to %@", buf, 0x20u);
      if (v30)
        goto LABEL_21;
    }
    else if (v30)
    {
LABEL_21:
      v34 = v30;
      v41 = v27;
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v44, GKFriendRequestURL);
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v45, GKFriendRequestURLSenderHandle);
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v46, GKFriendRequestURLContactID);
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v35, GKFriendRequestTimestamp);

      os_unfair_lock_lock(+[GKFriendServicePrivate messageInboxEntriesLock](GKFriendServicePrivate, "messageInboxEntriesLock"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[GKFriendServicePrivate messageInboxLocation](GKFriendServicePrivate, "messageInboxLocation"));
      v37 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v36));
      if (!v37)
        v37 = objc_alloc_init((Class)NSMutableDictionary);
      objc_msgSend(v37, "setObject:forKeyedSubscript:", v29, v34);
      v38 = objc_msgSend(v37, "writeToFile:atomically:", v36, 1);
      if ((v38 & 1) != 0)
      {
        os_unfair_lock_unlock(+[GKFriendServicePrivate messageInboxEntriesLock](GKFriendServicePrivate, "messageInboxEntriesLock"));
        +[GKClientProxy enumerateClientsUsingBlock:](GKClientProxy, "enumerateClientsUsingBlock:", &stru_1002C3098);
        v9 = v46;
      }
      else
      {
        v9 = v46;
        if (!os_log_GKGeneral)
          v39 = (id)GKOSLoggers(v38);
        log = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v55 = v36;
          v56 = 2112;
          v57 = v29;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Failed to write message inbox: %@ value of: %@", buf, 0x16u);
        }
        os_unfair_lock_unlock(+[GKFriendServicePrivate messageInboxEntriesLock](GKFriendServicePrivate, "messageInboxEntriesLock"));
      }

      v27 = v41;
      v30 = v34;
    }

    v11 = v47;
    goto LABEL_32;
  }
LABEL_34:

}

- (void)setTestGame:(id)a3 protocolVersion:(id)a4 reply:(id)a5
{
  id v6;
  void *v7;
  NSObject *replyQueue;
  _QWORD block[4];
  id v10;

  v6 = a5;
  v7 = v6;
  if (v6)
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000FEC54;
    block[3] = &unk_1002BB540;
    v10 = v6;
    dispatch_async(replyQueue, block);

  }
}

- (void)getAuthenticatedPlayerInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  if (v4)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = sub_1000FC888;
    v17[4] = sub_1000FC898;
    v18 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m", 1370, "-[GKClientProxy(GKDaemonProtocol) getAuthenticatedPlayerInfo:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy entitlements](self, "entitlements"));
    v8 = objc_msgSend(v7, "hasEntitlements:", 0x10000);

    if (v8)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000FEE34;
      v14[3] = &unk_1002C30E8;
      v14[4] = self;
      v16 = v17;
      v15 = v6;
      objc_msgSend(v15, "perform:", v14);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000FEF24;
    v11[3] = &unk_1002BB450;
    v13 = v4;
    v10 = v6;
    v12 = v10;
    objc_msgSend(v10, "notifyOnQueue:block:", v9, v11);

    _Block_object_dispose(v17, 8);
  }

}

- (void)getAuthenticatedPlayerCredential:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  if (v4)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = sub_1000FC888;
    v17[4] = sub_1000FC898;
    v18 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m", 1403, "-[GKClientProxy(GKDaemonProtocol) getAuthenticatedPlayerCredential:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy entitlements](self, "entitlements"));
    v8 = objc_msgSend(v7, "hasEntitlements:", 0x200000000);

    if (v8)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000FF144;
      v14[3] = &unk_1002C30E8;
      v14[4] = self;
      v16 = v17;
      v15 = v6;
      objc_msgSend(v15, "perform:", v14);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000FF284;
    v11[3] = &unk_1002BB450;
    v13 = v4;
    v10 = v6;
    v12 = v10;
    objc_msgSend(v10, "notifyOnQueue:block:", v9, v11);

    _Block_object_dispose(v17, 8);
  }

}

- (void)getGamedFiredUpWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  __CFString *v12;
  id v13;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m", 1464, "-[GKClientProxy(GKDaemonProtocol) getGamedFiredUpWithHandler:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5));

    if (!os_log_GKGeneral)
      v8 = (id)GKOSLoggers(v7);
    v9 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "gamed is loaded and initialized.", buf, 2u);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000FF438;
    v11[3] = &unk_1002BB450;
    v12 = CFSTR("Gamed at your service");
    v13 = v4;
    objc_msgSend(v6, "notifyOnQueue:block:", v10, v11);

  }
}

- (void)getAuthenticatedLocalPlayersWithStatus:(unint64_t)a3 handler:(id)a4
{
  id v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  GKClientProxy *v28;
  _QWORD v29[4];
  id v30;
  GKClientProxy *v31;
  unint64_t v32;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v8 = -[GKClientProxy environment](self, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allCredentialsForEnvironment:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "primaryCredentialForEnvironment:", v8));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.gamecenter"));

    if ((v12 & 1) == 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m", 1487, "-[GKClientProxy(GKDaemonProtocol) getAuthenticatedLocalPlayersWithStatus:handler:]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playerInternal"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "playerID"));
      v16 = -[GKClientProxy transactionGroupWithName:forPlayerID:](self, "transactionGroupWithName:forPlayerID:", v13, v15);

    }
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000FF704;
  v29[3] = &unk_1002C3138;
  v17 = v10;
  v31 = self;
  v32 = a3;
  v30 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_gkFilterWithBlock:", v29));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m", 1545, "-[GKClientProxy(GKDaemonProtocol) getAuthenticatedLocalPlayersWithStatus:handler:]"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v19));

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, CFSTR("players"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000FF8D4;
  v26[3] = &unk_1002C3188;
  v21 = v20;
  v27 = v21;
  v28 = self;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v26);
  if (v6)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000FFEA4;
    v23[3] = &unk_1002BB450;
    v25 = v6;
    v24 = v21;
    objc_msgSend(v24, "notifyOnQueue:block:", v22, v23);

  }
}

- (void)getAccountNameWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m", 1616, "-[GKClientProxy(GKDaemonProtocol) getAccountNameWithHandler:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy entitlements](self, "entitlements"));
    v8 = objc_msgSend(v7, "hasEntitlements:", 0x10000);

    if (v8)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10010005C;
      v14[3] = &unk_1002BBB70;
      v15 = v6;
      objc_msgSend(v15, "perform:", v14);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001000E0;
    v11[3] = &unk_1002BB450;
    v12 = v6;
    v13 = v4;
    v10 = v6;
    objc_msgSend(v10, "notifyOnQueue:block:", v9, v11);

  }
}

- (void)getAuthenticatedPlayerIDWithHandler:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001001A8;
    v6[3] = &unk_1002BC080;
    v7 = v4;
    -[GKClientProxy getAuthenticatedPlayerInfo:](self, "getAuthenticatedPlayerInfo:", v6);

  }
}

- (void)localizedMessageFromDictionary:(id)a3 forBundleID:(id)a4 handler:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a5;
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _gkLocalizedMessageFromDictionary:forBundleID:](NSBundle, "_gkLocalizedMessageFromDictionary:forBundleID:", a3, a4));
    v10 = objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001002C0;
    v12[3] = &unk_1002BB450;
    v13 = v9;
    v14 = v8;
    v11 = v9;
    dispatch_async(v10, v12);

  }
}

- (void)loadRemoteImageDataForURL:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scheme"));
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("https")))
    {

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scheme"));
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("http"));

      if ((v9 & 1) == 0)
      {
        v6[2](v6, 0);
        goto LABEL_7;
      }
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
    +[NSData _gkRequestClientsRemoteImageDataForURL:queue:reply:](NSData, "_gkRequestClientsRemoteImageDataForURL:queue:reply:", v11, v10, v6);

  }
LABEL_7:

}

- (void)resetLoginCancelCount
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (!os_log_GKGeneral)
    v2 = (id)GKOSLoggers(self);
  v3 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "resetCancelledLogins: user will be presented with fullscreen sheet if they are not signed in", v6, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "signInVisibilityManager"));
  objc_msgSend(v5, "reset");

}

- (void)handleCloudKitShareMetadata:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKActivity named:](GKActivity, "named:", CFSTR("handleCloudKitShareMetadata")));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100100528;
  v10[3] = &unk_1002BB758;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "execute:", v10);

}

+ (void)authenticationDidChange
{
  objc_msgSend(a1, "enumerateClientsUsingBlock:", &stru_1002C31A8);
}

- (void)sendAuthenticationDidChangeNotificationWithAuthenticatingBundleID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m", 1697, "-[GKClientProxy(Authentication) sendAuthenticationDidChangeNotificationWithAuthenticatingBundleID:completionHandler:]"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001006D8;
  v11[3] = &unk_1002BB568;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v8, v11);

}

- (id)missingTransitionFromState:(id)a3 toState:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v9 = (id)GKOSLoggers(v6);
    v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_100106418((uint64_t)v5);

  return v7;
}

- (void)stateDidChange
{
  void *v3;
  id v4;

  if (self->_pid)
  {
    if (self->_bundleIdentifier)
    {
      v3 = (void *)objc_opt_class(self, a2);
      v4 = (id)objc_claimAutoreleasedReturnValue(-[_GKStateMachine currentState](self->_appInitStateMachine, "currentState"));
      objc_msgSend(v3, "saveAppInitState:forBundleID:pid:", v4, self->_bundleIdentifier, self->_pid);

    }
  }
}

- (BOOL)setAppInitState:(id)a3
{
  return -[_GKStateMachine applyState:](self->_appInitStateMachine, "applyState:", a3);
}

- (id)appInitState
{
  return -[_GKStateMachine currentState](self->_appInitStateMachine, "currentState");
}

- (id)verifyAuthorized
{
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  __CFString *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v4 = objc_msgSend(v3, "isGameCenterRestricted");

  if ((v4 & 1) != 0)
  {
    v5 = 10;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
    v7 = objc_msgSend(v6, "lockedDown");

    if ((v7 & 1) != 0)
    {
      v5 = 36;
    }
    else
    {
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[GKClientProxy appInitState](self, "appInitState"));

      if (v8 == CFSTR("GKAppInitialized"))
      {
        v9 = 0;
        return v9;
      }
      v5 = 6;
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:underlyingError:](NSError, "userErrorForCode:underlyingError:", v5, 0));
  return v9;
}

+ (void)saveAppInitState:(id)a3 forBundleID:(id)a4 pid:(int)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  int v16;

  v7 = a3;
  v8 = a4;
  v9 = GKSavedAuthentiactionStateQueue();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100100AA8;
  block[3] = &unk_1002C3238;
  v14 = v7;
  v15 = v8;
  v16 = a5;
  v11 = v8;
  v12 = v7;
  dispatch_async(v10, block);

}

- (id)connectionProxyForUseCase:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy connection](self, "connection"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100101024;
  v9[3] = &unk_1002C3260;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9));

  return v7;
}

- (void)metricsValuesChanged
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("metricsValuesChanged")));
  objc_msgSend(v2, "metricsValuesChanged");

}

- (void)requestSandboxExtension:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("requestSandboxExtension")));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100101170;
  v7[3] = &unk_1002C3288;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "requestSandboxExtension:", v7);

}

- (void)beginNetworkActivity
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("beginNetworkActivity")));
  objc_msgSend(v2, "beginNetworkActivity");

}

- (void)endNetworkActivity
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("endNetworkActivity")));
  objc_msgSend(v2, "endNetworkActivity");

}

- (void)resetNetworkActivity
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("resetNetworkActivity")));
  objc_msgSend(v2, "resetNetworkActivity");

}

- (void)respondedToNearbyInvite:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("respondedToNearbyInvite")));
  objc_msgSend(v5, "respondedToNearbyInvite:", v4);

}

- (void)friendRequestSelected:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("friendRequestSelected")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
  v6 = objc_msgSend(v5, "isEqualToString:", GKGameCenterIdentifier);

  if (v6)
    objc_msgSend(v4, "friendRequestSelected:", v7);

}

- (void)receivedChallengeSelected:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("receivedChallengeSelected")));
  objc_msgSend(v5, "receivedChallengeSelected:", v4);

}

- (void)completedChallengeSelected:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("completedChallengeSelected")));
  objc_msgSend(v5, "completedChallengeSelected:", v4);

}

- (void)challengeReceived:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("challengeReceived")));
  objc_msgSend(v5, "challengeReceived:", v4);

}

- (void)challengeCompleted:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("challengeCompleted")));
  objc_msgSend(v5, "challengeCompleted:", v4);

}

- (void)scoreSelected:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("scoreSelected")));
  objc_msgSend(v5, "scoreSelected:", v4);

}

- (void)achievementSelected:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("achievement")));
  objc_msgSend(v5, "achievementSelected:", v4);

}

- (void)fetchTurnBasedData
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("fetchTurnBasedData")));
  objc_msgSend(v3, "fetchTurnBasedData");
  -[GKClientProxy refreshContentsForDataType:userInfo:](self, "refreshContentsForDataType:userInfo:", 14, 0);

}

- (void)acceptMultiplayerGameInvite
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("acceptMultiplayerGameInvite")));
  objc_msgSend(v5, "acceptMultiplayerGameInvite");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
  objc_msgSend(v3, "acceptMultiplayerGameInvite");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
  objc_msgSend(v4, "_gkEnumerateKeysAndObjectsUsingBlock:", &stru_1002C32C8);

}

- (void)acceptInviteWithNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("acceptInviteWithNotification")));
  objc_msgSend(v5, "acceptInviteWithNotification:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
  objc_msgSend(v6, "acceptInviteWithNotification:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100101698;
  v9[3] = &unk_1002C32F0;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "_gkEnumerateKeysAndObjectsUsingBlock:", v9);

}

- (void)declineInviteWithNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("declineInviteWithNotification")));
  objc_msgSend(v5, "declineInviteWithNotification:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
  objc_msgSend(v6, "declineInviteWithNotification:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100101780;
  v9[3] = &unk_1002C32F0;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "_gkEnumerateKeysAndObjectsUsingBlock:", v9);

}

- (void)updateInviteWithNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy connection](self, "connection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &stru_1002C3310));

  if (v6)
  {
    objc_msgSend(v6, "updateInviteWithNotification:", v4);
  }
  else
  {
    if (!os_log_GKGeneral)
      v8 = (id)GKOSLoggers(v7);
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_1001064F4();
  }

}

- (void)cancelInviteWithNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("cancelInviteWithNotification")));
  objc_msgSend(v5, "cancelInviteWithNotification:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
  objc_msgSend(v6, "cancelInviteWithNotification:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100101990;
  v9[3] = &unk_1002C32F0;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "_gkEnumerateKeysAndObjectsUsingBlock:", v9);

}

- (void)cancelGameInvite:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("cancelGameInvite")));
  objc_msgSend(v5, "cancelGameInvite:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
  objc_msgSend(v6, "cancelGameInvite:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100101A78;
  v9[3] = &unk_1002C32F0;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "_gkEnumerateKeysAndObjectsUsingBlock:", v9);

}

- (void)nearbyPlayerFoundForPlayerID:(id)a3 deviceID:(id)a4 discoveryInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("nearbyPlayerFound")));
  objc_msgSend(v11, "nearbyPlayerFoundForPlayerID:deviceID:discoveryInfo:", v10, v9, v8);

}

- (void)nearbyPlayerLostForPlayerID:(id)a3 deviceID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("nearbyPlayerLost")));
  objc_msgSend(v8, "nearbyPlayerLostForPlayerID:deviceID:", v7, v6);

}

- (void)nearbyDataReceivedForPlayerID:(id)a3 deviceID:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("nearbyDataReceived")));
  objc_msgSend(v11, "nearbyDataReceivedForPlayerID:deviceID:data:", v10, v9, v8);

}

- (void)relayPushNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("relayPushNotification")));
  objc_msgSend(v5, "relayPushNotification:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
  objc_msgSend(v6, "relayPushNotification:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100101CD8;
  v9[3] = &unk_1002C32F0;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "_gkEnumerateKeysAndObjectsUsingBlock:", v9);

}

- (void)didConnectToParticipantWithID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("didConnectToParticipantWithID")));
  objc_msgSend(v5, "didConnectToParticipantWithID:", v4);

}

- (void)didDisconnectFromParticipantWithID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("didDisconnectFromParticipantWithID")));
  objc_msgSend(v5, "didDisconnectFromParticipantWithID:", v4);

}

- (void)didReceiveData:(id)a3 reliably:(BOOL)a4 forRecipients:(id)a5 fromSender:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  id v13;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("didReceiveData")));
  objc_msgSend(v13, "didReceiveData:reliably:forRecipients:fromSender:", v12, v7, v11, v10);

}

- (void)session:(id)a3 addedPlayer:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("session:addedPlayer")));
  objc_msgSend(v8, "session:addedPlayer:", v7, v6);

}

- (void)session:(id)a3 removedPlayer:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("session:removedPlayer:")));
  objc_msgSend(v8, "session:removedPlayer:", v7, v6);

}

- (void)session:(id)a3 player:(id)a4 didChangeConnectionState:(int64_t)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("session:player:didChangeConnectionState:")));
  objc_msgSend(v10, "session:player:didChangeConnectionState:", v9, v8, a5);

}

- (void)session:(id)a3 player:(id)a4 didSaveData:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("session:player:didSaveData")));
  objc_msgSend(v11, "session:player:didSaveData:", v10, v9, v8);

}

- (void)session:(id)a3 didReceiveData:(id)a4 fromPlayer:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("session:didReceiveData:fromPlayer:")));
  objc_msgSend(v11, "session:didReceiveData:fromPlayer:", v10, v9, v8);

}

- (void)session:(id)a3 didReceiveMessage:(id)a4 withData:(id)a5 fromPlayer:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("session:didReceiveMessage:withData:fromPlayer:")));
  objc_msgSend(v14, "session:didReceiveMessage:withData:fromPlayer:", v13, v12, v11, v10);

}

- (void)setBadgeCount:(unint64_t)a3 forType:(unint64_t)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("setBadgeCount:forType:")));
  objc_msgSend(v6, "setBadgeCount:forType:", a3, a4);

}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  GKRefreshData *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  int v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if ((-[GKClientProxy applicationState](self, "applicationState") == 2
     || -[GKClientProxy applicationState](self, "applicationState") == 4)
    && !-[GKClientProxy isExtension](self, "isExtension")
    && !(v7 = -[GKClientProxy isUIService](self, "isUIService")))
  {
    if (!os_log_GKGeneral)
      v18 = (id)GKOSLoggers(v7);
    v19 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = v4;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "App is backgrounded, defering refresh until app is running in foreground for data type = %i", buf, 8u);
    }
    v9 = objc_alloc_init(GKRefreshData);
    -[GKRefreshData setDataType:](v9, "setDataType:", v4);
    -[GKRefreshData setUserInfo:](v9, "setUserInfo:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy pendingDataTypesForRefresh](self, "pendingDataTypesForRefresh"));
    objc_msgSend(v17, "addObject:", v9);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[GKClientProxy connectionProxyForUseCase:](self, "connectionProxyForUseCase:", CFSTR("refreshContentsForDataType")));
    v9 = (GKRefreshData *)v8;
    if (!os_log_GKGeneral)
      v10 = (id)GKOSLoggers(v8);
    v11 = (void *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      v12 = v11;
      v13 = GKRefreshDataTypeAsString(v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138412546;
      v24 = v14;
      v25 = 2112;
      v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "GKRefreshContents - refreshing contents for dataType: %@ userInfo: %@", buf, 0x16u);

    }
    -[GKRefreshData refreshContentsForDataType:userInfo:](v9, "refreshContentsForDataType:userInfo:", v4, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
    objc_msgSend(v15, "refreshContentsForDataType:userInfo:", v4, v6);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100102408;
    v20[3] = &unk_1002C3338;
    v22 = v4;
    v21 = v6;
    objc_msgSend(v16, "_gkEnumerateKeysAndObjectsUsingBlock:", v20);

    v17 = v21;
  }

}

- (void)setPreferencesValues:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy connection](self, "connection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxy"));

  objc_msgSend(v6, "setPreferencesValues:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
  objc_msgSend(v7, "setPreferencesValues:", v4);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100102500;
  v10[3] = &unk_1002C32F0;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "_gkEnumerateKeysAndObjectsUsingBlock:", v10);

}

- (void)getPreferenceForKey:(id)a3 handler:(id)a4
{
  void (**v5)(id, id, BOOL);
  void *v6;
  void *v7;
  id v8;
  void (**v9)(id, id, BOOL);

  v5 = (void (**)(id, id, BOOL))a4;
  if (v5)
  {
    v9 = v5;
    v6 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, GKGameCenterIdentifier);
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "BOOLValue");
    else
      v8 = 0;
    v9[2](v9, v8, v7 != 0);

    v5 = v9;
  }

}

- (void)setCurrentGame:(id)a3 serverEnvironment:(int64_t)a4 reply:(id)a5
{
  id v8;
  dispatch_group_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *replyQueue;
  id v20;
  _QWORD block[4];
  id v22;
  _QWORD v23[4];
  id v24;
  int64_t v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD v28[4];
  NSObject *v29;

  v8 = a3;
  v20 = a5;
  v9 = dispatch_group_create();
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleVersion](self, "bundleVersion"));
  if (v10)
    objc_msgSend(v8, "setBundleVersion:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleShortVersion](self, "bundleShortVersion"));
  if (v11)
    objc_msgSend(v8, "setShortBundleVersion:", v11);
  -[GKClientProxy setCurrentGame:](self, "setCurrentGame:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy connection](self, "connection"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1001027D8;
  v28[3] = &unk_1002C3260;
  v13 = v9;
  v29 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v28));

  if (v14)
  {
    dispatch_group_enter(v13);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100102864;
    v26[3] = &unk_1002BBBD8;
    v27 = v13;
    objc_msgSend(v14, "setCurrentGame:serverEnvironment:reply:", v8, a4, v26);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy viewService](self, "viewService"));
  v16 = v15;
  if (v15)
    objc_msgSend(v15, "setCurrentGame:serverEnvironment:reply:", v8, a4, &stru_1002C3358);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy extensionProxies](self, "extensionProxies"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100102870;
  v23[3] = &unk_1002C33A0;
  v18 = v8;
  v24 = v18;
  v25 = a4;
  objc_msgSend(v17, "_gkEnumerateKeysAndObjectsUsingBlock:", v23);

  if (v20)
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010288C;
    block[3] = &unk_1002BB540;
    v22 = v20;
    dispatch_group_notify(v13, replyQueue, block);

  }
}

- (GKGameInternal)currentGame
{
  GKGameInternal *currentGame;
  GKGameInternal *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  currentGame = self->_currentGame;
  if (currentGame)
  {
    v3 = currentGame;
  }
  else
  {
    v3 = objc_opt_new(GKGameInternal);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
    -[GKGameInternal setBundleIdentifier:](v3, "setBundleIdentifier:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleVersion](self, "bundleVersion"));
    -[GKGameInternal setBundleVersion:](v3, "setBundleVersion:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleShortVersion](self, "bundleShortVersion"));
    -[GKGameInternal setShortBundleVersion:](v3, "setShortBundleVersion:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
    -[GKGameInternal setName:](v3, "setName:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
      -[GKGameInternal setPlatform:](v3, "setPlatform:", +[GKApplicationWorkspace getPlatformForBundleID:](GKApplicationWorkspace, "getPlatformForBundleID:", v10));

    }
    else
    {
      -[GKGameInternal setPlatform:](v3, "setPlatform:", +[GKGameDescriptor currentPlatform](GKGameDescriptor, "currentPlatform"));
    }

  }
  return v3;
}

- (void)completedOptimisticAuthenticationWithResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy connection](self, "connection"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "remoteObjectProxy"));

  objc_msgSend(v9, "completedOptimisticAuthenticationWithResponse:error:", v7, v6);
}

- (void)authenticatedPlayersDidChange:(id)a3 authenticatingBundleID:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m", 2286, "-[GKClientProxy(GKClientInterface) authenticatedPlayersDidChange:authenticatingBundleID:reply:]"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100102B60;
  v15[3] = &unk_1002BB518;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v11, v15);

}

- (id)appTerminateRequestWithBackgroundFlag:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v9[0] = CFSTR("background");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  v10[0] = v3;
  v9[1] = CFSTR("timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkServerTimestamp](NSDate, "_gkServerTimestamp"));
  v10[1] = v4;
  v9[2] = CFSTR("udid");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKDevice currentDevice](GKDevice, "currentDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "udid"));
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  return v7;
}

- (void)terminateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  dispatch_queue_global_t global_queue;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  GKClientProxy *v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m", 2341, "-[GKClientProxy(GKClientInterface) terminateWithCompletionHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5));

  if (-[GKClientProxy initialized](self, "initialized"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy appTerminateRequestWithBackgroundFlag:](self, "appTerminateRequestWithBackgroundFlag:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKThreadsafeDictionary dictionaryCopy](self->_appSessions, "dictionaryCopy"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100103170;
    v15[3] = &unk_1002C3458;
    v16 = v6;
    v17 = self;
    v18 = v7;
    v9 = v7;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v15);

  }
  if (v4)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100103460;
    v12[3] = &unk_1002BB450;
    v14 = v4;
    v13 = v6;
    objc_msgSend(v13, "notifyOnQueue:block:", v11, v12);

  }
}

- (void)backgroundWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  GKThreadsafeDictionary *appSessions;
  id v9;
  dispatch_queue_global_t global_queue;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  GKClientProxy *v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m", 2374, "-[GKClientProxy(GKClientInterface) backgroundWithCompletionHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5));

  if (-[GKClientProxy initialized](self, "initialized"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy appTerminateRequestWithBackgroundFlag:](self, "appTerminateRequestWithBackgroundFlag:", 1));
    appSessions = self->_appSessions;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100103650;
    v15[3] = &unk_1002C3480;
    v16 = v6;
    v17 = self;
    v18 = v7;
    v9 = v7;
    -[GKThreadsafeDictionary readFromDictionary:](appSessions, "readFromDictionary:", v15);

  }
  if (v4)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001039C4;
    v12[3] = &unk_1002BB450;
    v14 = v4;
    v13 = v6;
    objc_msgSend(v13, "notifyOnQueue:block:", v11, v12);

  }
}

- (void)addAppSession:(id)a3 forCredential:(id)a4
{
  GKThreadsafeDictionary *appSessions;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  if (a3)
  {
    appSessions = self->_appSessions;
    v11[0] = a3;
    v11[1] = a4;
    v6 = a4;
    v7 = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playerInternal"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playerID"));
    -[GKThreadsafeDictionary setObject:forKey:](appSessions, "setObject:forKey:", v8, v10);

  }
}

- (id)appSessionForPlayer:(id)a3
{
  GKThreadsafeDictionary *appSessions;
  void *v4;
  void *v5;
  void *v6;

  appSessions = self->_appSessions;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "playerID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKThreadsafeDictionary objectForKey:](appSessions, "objectForKey:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  return v6;
}

- (void)removeAppSessionForPlayer:(id)a3
{
  -[GKThreadsafeDictionary removeObjectForKey:](self->_appSessions, "removeObjectForKey:", a3);
}

- (void)initializeWithCredential:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  dispatch_queue_global_t global_queue;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  _QWORD v30[3];
  _QWORD v31[3];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m", 2428, "-[GKClientProxy(GKClientInterface) initializeWithCredential:completionHandler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v30[0] = CFSTR("background");
  v10 = -[GKClientProxy previousApplicationState](self, "previousApplicationState") == 2
     || -[GKClientProxy previousApplicationState](self, "previousApplicationState") == 4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10));
  v31[0] = v11;
  v30[1] = CFSTR("timestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkServerTimestamp](NSDate, "_gkServerTimestamp"));
  v31[1] = v12;
  v30[2] = CFSTR("udid");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKDevice currentDevice](GKDevice, "currentDevice"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "udid"));
  v31[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 3));

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100103E0C;
  v26[3] = &unk_1002BC3A8;
  v26[4] = self;
  v27 = v6;
  v28 = v15;
  v16 = v9;
  v29 = v16;
  v17 = v15;
  v18 = v6;
  objc_msgSend(v16, "perform:", v26);
  global_queue = dispatch_get_global_queue(0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100104030;
  v23[3] = &unk_1002BB608;
  v24 = v16;
  v25 = v7;
  v23[4] = self;
  v21 = v16;
  v22 = v7;
  objc_msgSend(v21, "notifyOnQueue:block:", v20, v23);

}

- (void)bgInitializeWithCredential:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  dispatch_queue_global_t global_queue;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  const __CFString *v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m", 2471, "-[GKClientProxy(GKClientInterface) bgInitializeWithCredential:completionHandler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v24 = CFSTR("timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkServerTimestamp](NSDate, "_gkServerTimestamp"));
  v25 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001042BC;
  v20[3] = &unk_1002BC3A8;
  v20[4] = self;
  v12 = v6;
  v21 = v12;
  v13 = v11;
  v22 = v13;
  v14 = v9;
  v23 = v14;
  objc_msgSend(v14, "perform:", v20);
  if (v7)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100104430;
    v17[3] = &unk_1002BB450;
    v19 = v7;
    v18 = v14;
    objc_msgSend(v18, "notifyOnQueue:block:", v16, v17);

  }
}

+ (id)storeAndForwardDirectoryPathForEnvironment:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = GKSupportDataRoot(a1, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (a3 == 5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("DelayedRequests")));
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[GKPreferences displayNameForEnvironment:](GKPreferences, "displayNameForEnvironment:", a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DelayedRequests-%@"), v8));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v9));

    v6 = (void *)v8;
  }

  return v7;
}

- (id)storeAndForwardDirectoryPathForEnvironment:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_msgSend((id)objc_opt_class(self, a2), "storeAndForwardDirectoryPathForEnvironment:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", self->_bundleIdentifier));

  return v6;
}

- (id)requestsCacheForEnvironment:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy storeAndForwardDirectoryPathForEnvironment:](self, "storeAndForwardDirectoryPathForEnvironment:", a3));
  objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences displayNameForEnvironment:](GKPreferences, "displayNameForEnvironment:", a3));
  v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.delayedRequests"), v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v8));

  LOBYTE(v8) = objc_msgSend(v5, "fileExistsAtPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKDatabaseConnection connectionWithDatabasePath:](GKDatabaseConnection, "connectionWithDatabasePath:", v9));
  if ((v8 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("delayed_requests.schema"), "stringByDeletingPathExtension"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("delayed_requests.schema"), "pathExtension"));
    v13 = GKGameCenterFoundationBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pathForResource:ofType:", v11, v12));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKSQLRunner runnerWithConnection:](GKSQLRunner, "runnerWithConnection:", v10));
    objc_msgSend(v16, "runSQLFromFileAtPath:", v15);

  }
  return v10;
}

- (void)_setupDelayedRequestsWriters
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  NSObject *v5;
  NSObject *delayedRequestsQueue;
  const char *label;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  v5 = v4;
  delayedRequestsQueue = self->_delayedRequestsQueue;
  if (v4 != delayedRequestsQueue)
  {
    label = dispatch_queue_get_label(v4);
    v8 = dispatch_queue_get_label(delayedRequestsQueue);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKClientProxy(DelayedRequests) _setupDelayedRequestsWriters]", label, v8, v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == _delayedRequestsQueue)\n[%s (%s:%d)]"), v10, "-[GKClientProxy(DelayedRequests) _setupDelayedRequestsWriters]", objc_msgSend(v12, "UTF8String"), 2562));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }

  if (!self->_delayedRequestsDBConnection)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy requestsCacheForEnvironment:](self, "requestsCacheForEnvironment:", -[GKClientProxy environment](self, "environment")));
    -[GKClientProxy setDelayedRequestsDBConnection:](self, "setDelayedRequestsDBConnection:", v14);

  }
  v15 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy delayedRequestsDBConnection](self, "delayedRequestsDBConnection"));
  objc_msgSend(v15, "checkAndOpenDatabase");

}

- (void)_removeDelayedRequestStore
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  NSObject *v5;
  NSObject *delayedRequestsQueue;
  const char *label;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  unsigned int v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  v5 = v4;
  delayedRequestsQueue = self->_delayedRequestsQueue;
  if (v4 != delayedRequestsQueue)
  {
    label = dispatch_queue_get_label(v4);
    v8 = dispatch_queue_get_label(delayedRequestsQueue);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKClientProxy(DelayedRequests) _removeDelayedRequestStore]", label, v8, v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy.m"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == _delayedRequestsQueue)\n[%s (%s:%d)]"), v10, "-[GKClientProxy(DelayedRequests) _removeDelayedRequestStore]", objc_msgSend(v12, "UTF8String"), 2575));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy storeAndForwardDirectoryPathForEnvironment:](self, "storeAndForwardDirectoryPathForEnvironment:", -[GKClientProxy environment](self, "environment")));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", CFSTR(".doomed")));
  v17 = (void *)v16;
  if (!os_log_GKGeneral)
    v18 = (id)GKOSLoggers(v16);
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1001067B8();
  v31 = 0;
  v19 = objc_msgSend(v14, "moveItemAtPath:toPath:error:", v15, v17, &v31);
  v20 = v31;
  v21 = v20;
  if (v19)
  {
    -[GKClientProxy setDelayedRequestsDBConnection:](self, "setDelayedRequestsDBConnection:", 0);
    v30 = v21;
    v22 = objc_msgSend(v14, "removeItemAtPath:error:", v17, &v30);
    v23 = v30;

    if ((v22 & 1) != 0)
    {
      if (!os_log_GKGeneral)
        v25 = (id)GKOSLoggers(v24);
      v26 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v17;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Deleted delayed request store file at path %@", buf, 0xCu);
      }
    }
    else
    {
      if (!os_log_GKGeneral)
        v29 = (id)GKOSLoggers(v24);
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
        sub_100106750((uint64_t)v17);
    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v27 = (id)GKOSLoggers(v20);
    v28 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v33 = v15;
      v34 = 2112;
      v35 = v17;
      v36 = 2112;
      v37 = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to move delayed requests store \"%@\" to \"%@\". ERROR: %@", buf, 0x20u);
    }
    v23 = v21;
  }

}

- (id)_delayedRequestWriterWithCacheWriterClass:(Class)a3 cacheReaderClass:(Class)a4 networkWriterClass:(Class)a5 bagKey:(id)a6 batchSubmissionInterval:(int64_t)a7 credential:(id)a8
{
  id v14;
  id v15;
  NSObject *delayedRequestsQueue;
  id v17;
  id v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t *v24;
  Class v25;
  Class v26;
  Class v27;
  int64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v14 = a6;
  v15 = a8;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_1000FC888;
  v33 = sub_1000FC898;
  v34 = 0;
  delayedRequestsQueue = self->_delayedRequestsQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100104D68;
  v21[3] = &unk_1002C34A8;
  v25 = a3;
  v26 = a4;
  v21[4] = self;
  v22 = v15;
  v23 = v14;
  v24 = &v29;
  v27 = a5;
  v28 = a7;
  v17 = v14;
  v18 = v15;
  dispatch_sync(delayedRequestsQueue, v21);
  v19 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  return v19;
}

- (id)setPlayerStatusWriterWithCredential:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;

  v4 = a3;
  v6 = objc_opt_class(GKDelayedSetPlayerStatusCacheWriter, v5);
  v8 = objc_opt_class(GKDelayedSetPlayerStatusCacheReader, v7);
  v10 = -[GKClientProxy _delayedRequestWriterWithCacheWriterClass:cacheReaderClass:networkWriterClass:bagKey:batchSubmissionInterval:credential:](self, "_delayedRequestWriterWithCacheWriterClass:cacheReaderClass:networkWriterClass:bagKey:batchSubmissionInterval:credential:", v6, v8, objc_opt_class(GKDelayedRequestsNetworkWriter, v9), CFSTR("gk-set-player-status"), 0, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (id)setPlayerPhotoWriterWithCredential:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;

  v4 = a3;
  v6 = objc_opt_class(GKDelayedSetPhotoCacheWriter, v5);
  v8 = objc_opt_class(GKDelayedSetPhotoCacheReader, v7);
  v10 = -[GKClientProxy _delayedRequestWriterWithCacheWriterClass:cacheReaderClass:networkWriterClass:bagKey:batchSubmissionInterval:credential:](self, "_delayedRequestWriterWithCacheWriterClass:cacheReaderClass:networkWriterClass:bagKey:batchSubmissionInterval:credential:", v6, v8, objc_opt_class(GKDelayedSetPhotoNetworkWriter, v9), CFSTR("gk-get-image-upload-url"), 0, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (id)deletePlayerPhotoWriterWithCredential:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;

  v4 = a3;
  v6 = objc_opt_class(GKDelayedDeletePhotoCacheWriter, v5);
  v8 = objc_opt_class(GKDelayedDeletePhotoCacheReader, v7);
  v10 = -[GKClientProxy _delayedRequestWriterWithCacheWriterClass:cacheReaderClass:networkWriterClass:bagKey:batchSubmissionInterval:credential:](self, "_delayedRequestWriterWithCacheWriterClass:cacheReaderClass:networkWriterClass:bagKey:batchSubmissionInterval:credential:", v6, v8, objc_opt_class(GKDelayedRequestsNetworkWriter, v9), CFSTR("gk-delete-profile-image"), 0, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (id)removeGameWriterWithCredential:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;

  v4 = a3;
  v6 = objc_opt_class(GKRemoveGamesCacheWriter, v5);
  v8 = objc_opt_class(GKRemoveGamesCacheReader, v7);
  v10 = -[GKClientProxy _delayedRequestWriterWithCacheWriterClass:cacheReaderClass:networkWriterClass:bagKey:batchSubmissionInterval:credential:](self, "_delayedRequestWriterWithCacheWriterClass:cacheReaderClass:networkWriterClass:bagKey:batchSubmissionInterval:credential:", v6, v8, objc_opt_class(GKDelayedRequestsNetworkWriter, v9), CFSTR("gk-remove-game"), 0, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

+ (void)performDelayedRequestsForEnvironment:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint8_t v9[8];
  _QWORD block[5];

  v5 = GKAtomicCompareAndSwap32Barrier(0, 1, &unk_100317FE0);
  if ((_DWORD)v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cacheFileQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100105260;
    block[3] = &unk_1002C10A8;
    block[4] = a3;
    dispatch_async(v6, block);

  }
  else
  {
    if (!os_log_GKGeneral)
      v7 = (id)GKOSLoggers(v5);
    v8 = os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Game Center not sending store and forward as achievements or scores are being sent on another thread", v9, 2u);
    }
  }
}

- (void)performDelayedRequestsForEnvironment:(int64_t)a3
{
  void *v5;
  id v6;
  _QWORD v7[5];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allCredentialsForEnvironment:", a3));

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100105508;
  v7[3] = &unk_1002C34D0;
  v7[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

- (void)performDelayedRequestsForCredential:(id)a3
{
  id v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  GKClientProxy *v10;

  v4 = a3;
  global_queue = dispatch_get_global_queue(9, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001055B0;
  block[3] = &unk_1002BB658;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_sync(v6, block);

}

+ (id)_existingManagedObjectContextForPlayerID:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v6 = objc_msgSend((id)objc_opt_class(a1, v5), "contextKeyForPlayerID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100317FE8, "objectForKey:", v7));
  return v8;
}

- (id)transactionGroupIfCacheExistsForPlayerID:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "_existingManagedObjectContextForPlayerID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy+Cache.m", 71, "-[GKClientProxy(Cache) transactionGroupIfCacheExistsForPlayerID:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v8, v7, self));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)cacheDirectoryForBundleID:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  v4 = GKInsecureCacheRoot(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Data")));

  if (v3)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v3));

    v6 = (void *)v7;
  }

  return v6;
}

+ (id)insecureDatabaseDirectoryURLForBundleID:(id)a3 language:(id)a4 playerID:(id)a5
{
  __CFString *v8;
  id v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = (__CFString *)a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cacheDirectoryForBundleID:", a3));
  v11 = CFSTR("global");
  if (v8)
    v11 = v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@.gcdata"), v9, v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v13, 1));

  return v14;
}

+ (id)insecureDatabaseFileURLForBundleID:(id)a3 language:(id)a4 playerID:(id)a5 name:(id)a6
{
  id v10;
  void *v11;
  void *v12;

  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "insecureDatabaseDirectoryURLForBundleID:language:playerID:", a3, a4, a5));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v10, 0));

  return v12;
}

+ (void)removeCacheForPlayerID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "contextKeyForPlayerID:", v4));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cacheFileQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100106E08;
  block[3] = &unk_1002BBA40;
  v7 = v4;
  v28 = v5;
  v29 = a1;
  v27 = v7;
  v8 = v5;
  dispatch_sync(v6, block);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "gameCenterClient"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "entityCacheProvider"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "language"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100106E88;
  v21[3] = &unk_1002BC3F8;
  v22 = v6;
  v14 = v10;
  v23 = v14;
  v24 = v9;
  v25 = v7;
  v15 = v7;
  v16 = v9;
  v17 = v6;
  objc_msgSend(v12, "deleteCacheWithPlayerID:language:completionHandler:", v15, v13, v21);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100106FA4;
  v19[3] = &unk_1002BBBD8;
  v20 = v14;
  v18 = v14;
  dispatch_async(v17, v19);

}

+ (void)removeAllCachesWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100317FE8, "dictionaryCopy"));
  v6 = (void *)qword_100317FE8;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
  objc_msgSend(v6, "removeObjectsForKeys:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entityCacheProvider"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100107198;
  v12[3] = &unk_1002C0B88;
  v14 = v4;
  v15 = a1;
  v13 = v5;
  v10 = v4;
  v11 = v5;
  objc_msgSend(v9, "deleteAllCachesWithCompletionHandler:", v12);

}

+ (void)removeAllCaches
{
  +[GKClientProxy removeAllCachesWithHandler:](GKClientProxy, "removeAllCachesWithHandler:", &stru_1002C35B0);
}

+ (id)managedObjectModel
{
  if (qword_100317FF8 != -1)
    dispatch_once(&qword_100317FF8, &stru_1002C35D0);
  return (id)qword_100318000;
}

+ (id)cacheFileQueue
{
  if (qword_100318008 != -1)
    dispatch_once(&qword_100318008, &stru_1002C35F0);
  return (id)qword_100318010;
}

+ (void)migrateInsecureDatabaseToSecureDatabaseURL:(id)a3 usingPersistantStoreCoordinator:(id)a4 fileManager:(id)a5 options:(id)a6 playerID:(id)a7 bundleID:(id)a8 language:(id)a9 name:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  GKInsecureDatabaseMigrator *v21;
  id v22;

  v16 = a8;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "insecureDatabaseFileURLForBundleID:language:playerID:name:", v16, a9, a7, a10));
  v21 = -[GKInsecureDatabaseMigrator initWithInsecureDatabaseURL:secureDatabaseURL:persistentStoreCoordinator:options:fileManager:bundleID:]([GKInsecureDatabaseMigrator alloc], "initWithInsecureDatabaseURL:secureDatabaseURL:persistentStoreCoordinator:options:fileManager:bundleID:", v22, v20, v19, v17, v18, v16);

  -[GKInsecureDatabaseMigrator migrate](v21, "migrate");
}

+ (id)_newManagedObjectContextWithCacheURL:(id)a3 environment:(int64_t)a4 psc:(id)a5 storeOptions:(id)a6
{
  id v10;
  id v11;
  id v12;
  dispatch_queue_t current_queue;
  NSObject *v14;
  NSObject *v15;
  const char *label;
  NSObject *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  int64_t v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  current_queue = dispatch_get_current_queue();
  v14 = objc_claimAutoreleasedReturnValue(current_queue);
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cacheFileQueue"));

  if (v14 != v15)
  {
    label = dispatch_queue_get_label(v14);
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cacheFileQueue"));
    v18 = dispatch_queue_get_label(v17);
    v39 = a4;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "+[GKClientProxy(Cache) _newManagedObjectContextWithCacheURL:environment:psc:storeOptions:]", label, v18, v19));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKClientProxy+Cache.m"));
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastPathComponent")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == [self cacheFileQueue])\n[%s (%s:%d)]"), v20, "+[GKClientProxy(Cache) _newManagedObjectContextWithCacheURL:environment:psc:storeOptions:]", objc_msgSend(v22, "UTF8String"), 282));

    a4 = v39;
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v23);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v25 = objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "primaryCredentialForEnvironment:", a4));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "playerInternal"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "playerID"));

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100107A9C;
  v40[3] = &unk_1002BC358;
  v41 = v10;
  v42 = v11;
  v43 = v12;
  v44 = v24;
  v30 = v25;
  v45 = v30;
  v46 = v29;
  v31 = v29;
  v32 = v24;
  v33 = v12;
  v34 = v11;
  v35 = v10;
  objc_msgSend(v30, "performBlockAndWait:", v40);
  v36 = v46;
  v37 = v30;

  return v37;
}

+ (id)newManagedObjectContextForPlayerID:(id)a3 bundleID:(id)a4 language:(id)a5 environment:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  id v24;
  int64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_100107F58;
  v30 = sub_100107F68;
  v31 = 0;
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cacheFileQueue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100107F70;
  v19[3] = &unk_1002C3618;
  v20 = v10;
  v21 = v12;
  v22 = v11;
  v23 = &v26;
  v24 = a1;
  v25 = a6;
  v14 = v11;
  v15 = v12;
  v16 = v10;
  dispatch_sync(v13, v19);

  v17 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v17;
}

+ (id)gameCenterCacheDatabaseURLForPlayerID:(id)a3 language:(id)a4 name:(id)a5 fileManager:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  GKSecureFileLocator *v13;
  uint64_t v14;
  void *v15;

  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = -[GKSecureFileLocator initWithFileManager:]([GKSecureFileLocator alloc], "initWithFileManager:", v10);

  if (objc_msgSend(v9, "length"))
    v14 = objc_claimAutoreleasedReturnValue(-[GKSecureFileLocator databaseFileWithBundleID:language:contextID:name:](v13, "databaseFileWithBundleID:language:contextID:name:", GKGameCenterIdentifier, v12, v9, v11));
  else
    v14 = objc_claimAutoreleasedReturnValue(-[GKSecureFileLocator globalDatabaseFileWithBundleID:language:name:](v13, "globalDatabaseFileWithBundleID:language:name:", GKGameCenterIdentifier, v12, v11));
  v15 = (void *)v14;

  return v15;
}

+ (id)createPersistentStoreCoordinator
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  CFAbsoluteTimeGetCurrent();
  v2 = objc_alloc((Class)NSPersistentStoreCoordinator);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy managedObjectModel](GKClientProxy, "managedObjectModel"));
  v4 = objc_msgSend(v2, "initWithManagedObjectModel:", v3);

  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v5);
  v7 = (void *)os_log_GKPerf;
  if (os_log_type_enabled(os_log_GKPerf, OS_LOG_TYPE_DEBUG))
    sub_10010892C(v7);
  return v4;
}

+ (void)closeDatabaseFromManagedObjectContextForPlayerID:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_existingManagedObjectContextForPlayerID:", a3));
  objc_msgSend(a1, "closeDatabaseFromManagedObjectContextForMOC:", v4);

}

+ (void)closeDatabaseFromManagedObjectContextForMOC:(id)a3
{
  id v3;
  _QWORD v4[4];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100108318;
  v4[3] = &unk_1002BBBD8;
  v5 = a3;
  v3 = v5;
  objc_msgSend(v3, "performBlockAndWait:", v4);

}

+ (id)getParentBundleIDPrefixWithChildBundleID:(id)a3 parentBundleID:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSString v13;
  uint64_t v14;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  if (a4)
  {
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v9;
  }
  else
  {
    v8 = 0;
  }
  sub_100164584(v5, v7, v8, (uint64_t)a4);
  v11 = v10;
  swift_bridgeObjectRelease(v7, v10);
  swift_bridgeObjectRelease(a4, v12);
  if (v11)
  {
    v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v11, v14);
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

@end
