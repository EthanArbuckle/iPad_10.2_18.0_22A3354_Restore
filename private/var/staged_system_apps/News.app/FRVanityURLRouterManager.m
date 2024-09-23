@implementation FRVanityURLRouterManager

- (FRVanityURLRouterManager)initWithAnalyticsReferralFactory:(id)a3 redirectService:(id)a4 routerManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  FRVanityURLRouterManager *v12;
  FRVanityURLRouterManager *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007E394();
    if (v10)
      goto LABEL_6;
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007E2DC();
LABEL_6:
  if (!v11 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007E224();
  v15.receiver = self;
  v15.super_class = (Class)FRVanityURLRouterManager;
  v12 = -[FRVanityURLRouterManager init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_analyticsReferralFactory, a3);
    objc_storeStrong((id *)&v13->_redirectService, a4);
    objc_storeStrong((id *)&v13->_routerManager, a5);
  }

  return v13;
}

- (void)addRoutable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FRVanityURLRouterManager routerManager](self, "routerManager"));
  objc_msgSend(v5, "addRoutable:", v4);

}

- (FRURLRouterManagerType)routerManager
{
  return self->_routerManager;
}

- (FRVanityURLRouterManager)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRVanityURLRouterManager init]";
    v7 = 2080;
    v8 = "FRVanityURLRouterManager.m";
    v9 = 1024;
    v10 = 25;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRVanityURLRouterManager init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (BOOL)handleOpenURL:(id)a3 options:(id)a4 analyticsReferral:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  unsigned __int8 v19;
  int v21;
  void *v22;
  __int16 v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRVanityURLRouterManager redirectService](self, "redirectService"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "destinationURLForURL:", v8));

  v13 = FRNavigationLog;
  if (os_log_type_enabled((os_log_t)FRNavigationLog, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138543618;
    v22 = v12;
    v23 = 2114;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "VanityURL manager has destination URL <%{public}@> for URL <%{public}@>", (uint8_t *)&v21, 0x16u);
  }
  if (v12)
  {
    v14 = v12;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRVanityURLRouterManager analyticsReferralFactory](self, "analyticsReferralFactory"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", UIApplicationOpenURLOptionsSourceApplicationKey));
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "analyticsReferralForURL:sourceApplication:", v14, v16));

  }
  else
  {
    v14 = v8;
    v17 = v10;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRVanityURLRouterManager routerManager](self, "routerManager"));
  v19 = objc_msgSend(v18, "handleOpenURL:options:analyticsReferral:", v14, v9, v17);

  return v19;
}

- (FRURLAnalyticsReferralFactory)analyticsReferralFactory
{
  return self->_analyticsReferralFactory;
}

- (FCVanityURLRedirectService)redirectService
{
  return self->_redirectService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routerManager, 0);
  objc_storeStrong((id *)&self->_redirectService, 0);
  objc_storeStrong((id *)&self->_analyticsReferralFactory, 0);
}

@end
