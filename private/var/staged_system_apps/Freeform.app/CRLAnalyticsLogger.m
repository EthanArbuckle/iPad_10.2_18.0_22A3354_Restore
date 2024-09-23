@implementation CRLAnalyticsLogger

+ (id)loggerWithDomain:(id)a3
{
  id v4;
  uint64_t v5;
  Class v6;
  id v7;

  v4 = a3;
  objc_opt_class(a1, v5);
  v7 = objc_msgSend([v6 alloc], "initWithDomain:", v4);

  return v7;
}

- (CRLAnalyticsLogger)initWithDomain:(id)a3
{
  id v5;
  CRLAnalyticsLogger *v6;
  CRLAnalyticsLogger *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLAnalyticsLogger;
  v6 = -[CRLAnalyticsLogger init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_baseDomain, a3);
    v7->_recalculateDomain = 1;
  }

  return v7;
}

- (NSString)domain
{
  void *v3;
  id v4;

  if (-[CRLAnalyticsLogger recalculateDomain](self, "recalculateDomain"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAnalyticsLogger baseDomain](self, "baseDomain"));
    v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("com.apple.freeform.%@"), v3);
    -[CRLAnalyticsLogger setCachedFullDomain:](self, "setCachedFullDomain:", v4);

    -[CRLAnalyticsLogger setRecalculateDomain:](self, "setRecalculateDomain:", 0);
  }
  return -[CRLAnalyticsLogger cachedFullDomain](self, "cachedFullDomain");
}

- (BOOL)canLogAnalytics
{
  return 1;
}

- (void)p_loadCoreAnalyticsIfNeeded
{
  if (qword_1014157E8 != -1)
    dispatch_once(&qword_1014157E8, &stru_10125A6E0);
}

- (id)p_eventPayloadFromPayload:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  char *v26;
  void *v27;
  void *v29;
  void *v30;
  id obj;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  unsigned int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  _BYTE v45[128];
  _QWORD v46[4];
  _QWORD v47[4];

  v32 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infoDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("CFBundleName")));

  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lowercaseString"));
  v46[0] = CFSTR("bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
  v47[0] = v8;
  v47[1] = v6;
  v30 = (void *)v6;
  v46[1] = CFSTR("appName");
  v46[2] = CFSTR("appVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "infoDictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("CFBundleShortVersionString")));
  v47[2] = v11;
  v46[3] = CFSTR("appBuild");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForInfoDictionaryKey:", kCFBundleVersionKey));
  v47[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v47, v46, 4));

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v29 = v14;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allKeys"));
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(obj);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v18)));

        if (v19)
        {
          v20 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125A700);
          v21 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v38 = v20;
            v39 = 2082;
            v40 = "-[CRLAnalyticsLogger p_eventPayloadFromPayload:]";
            v41 = 2082;
            v42 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnalyticsLogger.m";
            v43 = 1024;
            v44 = 105;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Duplicate key found in Core Analytics event payload, added value may be overridden.", buf, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125A720);
          v22 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v25 = v22;
            v26 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v38 = v20;
            v39 = 2114;
            v40 = v26;
            _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnalyticsLogger p_eventPayloadFromPayload:]"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnalyticsLogger.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 105, 0, "Duplicate key found in Core Analytics event payload, added value may be overridden.");

        }
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v16);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v32));
  objc_msgSend(v27, "addEntriesFromDictionary:", v29);

  return v27;
}

- (void)sendEventLazily:(BOOL)a3 eventPayload:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];

  v4 = a3;
  v6 = a4;
  if (-[CRLAnalyticsLogger canLogAnalytics](self, "canLogAnalytics"))
  {
    -[CRLAnalyticsLogger postNotificationForEventPayload:](self, "postNotificationForEventPayload:", v6);
    -[CRLAnalyticsLogger p_loadCoreAnalyticsIfNeeded](self, "p_loadCoreAnalyticsIfNeeded");
    -[CRLAnalyticsLogger setRecalculateDomain:](self, "setRecalculateDomain:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAnalyticsLogger domain](self, "domain"));
    v8 = objc_claimAutoreleasedReturnValue(-[CRLAnalyticsLogger p_eventPayloadFromPayload:](self, "p_eventPayloadFromPayload:", v6));
    v9 = (void *)v8;
    if (v4 && off_101415800)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1003EF034;
      v10[3] = &unk_10125A748;
      v10[4] = v8;
      off_101415800(v7, v10);
    }
    else if (off_1014157F8)
    {
      off_1014157F8(v7, v8);
    }

  }
}

- (void)postNotificationForEventPayload:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = objc_msgSend(a3, "mutableCopy");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAnalyticsLogger baseDomain](self, "baseDomain"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("CRLAnalyticsLoggerEventLoggedNotificationEventDomainKey"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("CRLAnalyticsLoggerEventLoggedNotification"), self, v6);

}

+ (void)sendEventInDomain:(id)a3 lazily:(BOOL)a4 eventPayload:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a4;
  v8 = a5;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "loggerWithDomain:", a3));
  objc_msgSend(v9, "sendEventLazily:eventPayload:", v5, v8);

}

- (NSString)baseDomain
{
  return self->_baseDomain;
}

- (void)setBaseDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)cachedFullDomain
{
  return self->_cachedFullDomain;
}

- (void)setCachedFullDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)recalculateDomain
{
  return self->_recalculateDomain;
}

- (void)setRecalculateDomain:(BOOL)a3
{
  self->_recalculateDomain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFullDomain, 0);
  objc_storeStrong((id *)&self->_baseDomain, 0);
}

@end
