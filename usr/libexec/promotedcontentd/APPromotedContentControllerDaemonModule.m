@implementation APPromotedContentControllerDaemonModule

+ (void)didPrewarm:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("pcStartTime")));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "daemonStartTime"));
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = v6 < 0.0;

    v10 = CFSTR("coldStart");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
    v11 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));

    +[APAnalytics sendEvent:customPayload:](APAnalytics, "sendEvent:customPayload:", CFSTR("coldstart"), v9);
  }

}

+ (NSDate)daemonStartTime
{
  return (NSDate *)(id)_daemonStartTime;
}

+ (id)setup
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v4 = (void *)_daemonStartTime;
  _daemonStartTime = v3;

  v5 = objc_autoreleasePoolPush();
  objc_msgSend(a1, "_migrateData");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_loadSettings"));
  objc_autoreleasePoolPop(v5);
  return v6;
}

+ (void)_migrateData
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[8];
  id v10;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[APKeychainServices objectForKey:error:](APKeychainServices, "objectForKey:error:", CFSTR("APPromotedContentDaemonSettings.efsVersion"), &v10));
  v3 = v10;
  v4 = v3;
  if (!v3
    || ((v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain")),
         !objc_msgSend(v5, "isEqualToString:", APKeychainServicesErrorDomain))
      ? (v6 = 1)
      : (v6 = objc_msgSend(v4, "code") != (id)-25300),
        v5,
        !v6))
  {
    if (v2)
    {
      v7 = APLogForCategory(14);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Detected old EFS version.", v9, 2u);
      }

      +[APStorageManager cleanupOldStorage](APStorageManager, "cleanupOldStorage");
      +[APKeychainServices setObject:forKey:](APKeychainServices, "setObject:forKey:", 0, CFSTR("com.apple.ap.APCryptor.seed"));
      +[APKeychainServices setObject:forKey:](APKeychainServices, "setObject:forKey:", 0, CFSTR("APPromotedContentDaemonSettings.efsVersion"));
    }
  }

}

+ (id)_loadSettings
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  double v7;
  double v8;
  id v9;
  APPromotedContentControllerDaemonModule *v10;
  void *v11;
  unsigned __int8 v12;
  dispatch_queue_global_t global_queue;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  double v18;
  id v19;
  id v20;
  id v21;
  char v22;
  char v23;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[APPCControllerDaemonSettings settings](APPCControllerDaemonSettings, "settings"));
  v3 = objc_msgSend(v2, "useAMSMescalValue");
  v4 = objc_msgSend(v2, "httpUseFixedHttpSessionManagerValue");
  v5 = objc_msgSend(v2, "httpMaximumConnectionsPerHostValue");
  v6 = objc_msgSend(v2, "httpMaximumConnectionsPerHostTempSessionValue");
  objc_msgSend(v2, "httpLookBackWindowValue");
  v8 = v7;
  v9 = objc_msgSend(v2, "cacheSizeLimitValue");
  v10 = objc_alloc_init(APPromotedContentControllerDaemonModule);
  -[APPromotedContentControllerDaemonModule setUseAMSMescal:](v10, "setUseAMSMescal:", v3);
  -[APPromotedContentControllerDaemonModule setHttpUseFixedHttpSessionManager:](v10, "setHttpUseFixedHttpSessionManager:", v4);
  -[APPromotedContentControllerDaemonModule setHttpMaximumConnectionsPerHost:](v10, "setHttpMaximumConnectionsPerHost:", v5);
  -[APPromotedContentControllerDaemonModule setHttpMaximumConnectionsPerHostTempSession:](v10, "setHttpMaximumConnectionsPerHostTempSession:", v6);
  -[APPromotedContentControllerDaemonModule setHttpLookBackWindow:](v10, "setHttpLookBackWindow:", v8);
  -[APPromotedContentControllerDaemonModule setCacheSizeLimit:](v10, "setCacheSizeLimit:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v12 = objc_msgSend(v11, "isRunningTests");

  if ((v12 & 1) == 0)
  {
    global_queue = dispatch_get_global_queue(25, 0);
    v14 = objc_claimAutoreleasedReturnValue(global_queue);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10016D5F8;
    v16[3] = &unk_100218948;
    v22 = (char)v3;
    v17 = v2;
    v23 = (char)v4;
    v18 = v8;
    v19 = v5;
    v20 = v6;
    v21 = v9;
    dispatch_async(v14, v16);

  }
  return v10;
}

- (BOOL)useAMSMescal
{
  return self->_useAMSMescal;
}

- (void)setUseAMSMescal:(BOOL)a3
{
  self->_useAMSMescal = a3;
}

- (BOOL)httpUseFixedHttpSessionManager
{
  return self->_httpUseFixedHttpSessionManager;
}

- (void)setHttpUseFixedHttpSessionManager:(BOOL)a3
{
  self->_httpUseFixedHttpSessionManager = a3;
}

- (int64_t)httpMaximumConnectionsPerHost
{
  return self->_httpMaximumConnectionsPerHost;
}

- (void)setHttpMaximumConnectionsPerHost:(int64_t)a3
{
  self->_httpMaximumConnectionsPerHost = a3;
}

- (int64_t)httpMaximumConnectionsPerHostTempSession
{
  return self->_httpMaximumConnectionsPerHostTempSession;
}

- (void)setHttpMaximumConnectionsPerHostTempSession:(int64_t)a3
{
  self->_httpMaximumConnectionsPerHostTempSession = a3;
}

- (double)httpLookBackWindow
{
  return self->_httpLookBackWindow;
}

- (void)setHttpLookBackWindow:(double)a3
{
  self->_httpLookBackWindow = a3;
}

- (int64_t)cacheSizeLimit
{
  return self->_cacheSizeLimit;
}

- (void)setCacheSizeLimit:(int64_t)a3
{
  self->_cacheSizeLimit = a3;
}

@end
