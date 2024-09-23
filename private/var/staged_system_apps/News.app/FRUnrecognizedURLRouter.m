@implementation FRUnrecognizedURLRouter

- (FRUnrecognizedURLRouter)initWithAnalyticsReferralFactory:(id)a3 redirectService:(id)a4
{
  id v7;
  id v8;
  FRUnrecognizedURLRouter *v9;
  FRUnrecognizedURLRouter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100077B50();
    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100077A88();
LABEL_6:
  v12.receiver = self;
  v12.super_class = (Class)FRUnrecognizedURLRouter;
  v9 = -[FRUnrecognizedURLRouter init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_analyticsReferralFactory, a3);
    objc_storeStrong((id *)&v10->_redirectService, a4);
  }

  return v10;
}

- (void)setRetryHandler:(id)a3
{
  objc_storeWeak((id *)&self->_retryHandler, a3);
}

- (FRUnrecognizedURLRouter)init
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
    v6 = "-[FRUnrecognizedURLRouter init]";
    v7 = 2080;
    v8 = "FRUnrecognizedURLRouter.m";
    v9 = 1024;
    v10 = 28;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRUnrecognizedURLRouter init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (BOOL)handleOpenURL:(id)a3 options:(id)a4 analyticsReferral:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRUnrecognizedURLRouter redirectService](self, "redirectService"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001CEA8;
  v12[3] = &unk_1000D98C0;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  objc_msgSend(v9, "resolveURL:withQualityOfService:completion:", v8, 25, v12);

  return 1;
}

- (FRURLRouterManagerType)retryHandler
{
  return (FRURLRouterManagerType *)objc_loadWeakRetained((id *)&self->_retryHandler);
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
  objc_storeStrong((id *)&self->_redirectService, 0);
  objc_storeStrong((id *)&self->_analyticsReferralFactory, 0);
  objc_destroyWeak((id *)&self->_retryHandler);
}

@end
