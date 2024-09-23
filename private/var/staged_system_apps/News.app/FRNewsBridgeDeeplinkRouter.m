@implementation FRNewsBridgeDeeplinkRouter

- (FRNewsBridgeDeeplinkRouter)initWithApplication:(id)a3 bridgedAppDelegate:(id)a4
{
  id v6;
  id v7;
  FRNewsBridgeDeeplinkRouter *v8;
  FRNewsBridgeDeeplinkRouter *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100079D94();
  v11.receiver = self;
  v11.super_class = (Class)FRNewsBridgeDeeplinkRouter;
  v8 = -[FRNewsBridgeDeeplinkRouter init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_application, v6);
    objc_storeWeak((id *)&v9->_bridgedAppDelegate, v7);
  }

  return v9;
}

- (FRNewsBridgeDeeplinkRouter)init
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
    v6 = "-[FRNewsBridgeDeeplinkRouter init]";
    v7 = 2080;
    v8 = "FRNewsBridgeDeeplinkRouter.m";
    v9 = 1024;
    v10 = 25;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRNewsBridgeDeeplinkRouter init]"));
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
  unsigned __int8 v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100079E5C();
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRNewsBridgeDeeplinkRouter bridgedAppDelegate](self, "bridgedAppDelegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRNewsBridgeDeeplinkRouter application](self, "application"));
  v13 = objc_msgSend(v11, "application:openURL:options:", v12, v8, v9);

  return v13;
}

- (UIApplication)application
{
  return (UIApplication *)objc_loadWeakRetained((id *)&self->_application);
}

- (UIApplicationDelegate)bridgedAppDelegate
{
  return (UIApplicationDelegate *)objc_loadWeakRetained((id *)&self->_bridgedAppDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bridgedAppDelegate);
  objc_destroyWeak((id *)&self->_application);
}

@end
