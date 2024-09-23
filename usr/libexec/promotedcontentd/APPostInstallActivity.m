@implementation APPostInstallActivity

- (APPostInstallActivity)initWithConfigurationStorage:(id)a3
{
  id v5;
  APPostInstallActivity *v6;
  APPostInstallActivity *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APPostInstallActivity;
  v6 = -[APPostInstallActivity init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configurationStorage, a3);

  return v7;
}

- (NSString)taskID
{
  return (NSString *)CFSTR("com.apple.ap.promotedcontentd.postinstall");
}

- (BOOL)runActivity:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id buf[2];

  v4 = a3;
  v5 = APLogForCategory(16);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Post Install Activity started.", (uint8_t *)buf, 2u);
  }

  -[APPostInstallActivity removeWaitingForNetworkDateDirectory](self, "removeWaitingForNetworkDateDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APPostInstallActivity configurationStorage](self, "configurationStorage"));
  v8 = objc_msgSend(v7, "resetConfigurationSystem");

  if (v8)
  {
    objc_initWeak(buf, self);
    v9 = objc_alloc((Class)APConfigurationRequester);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APPostInstallActivity _storefront](self, "_storefront"));
    v11 = objc_msgSend(v9, "initWithStorefront:", v10);
    -[APPostInstallActivity setConfigRequester:](self, "setConfigRequester:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APPostInstallActivity configRequester](self, "configRequester"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10003BB54;
    v16[3] = &unk_10020E0A0;
    objc_copyWeak(&v18, buf);
    v17 = v4;
    objc_msgSend(v12, "requestConfigurationWithCompletionHandler:", v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(buf);
  }
  else
  {
    v13 = APLogForCategory(8);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Reset Configuration System failed.", (uint8_t *)buf, 2u);
    }

  }
  return v8;
}

- (void)removeWaitingForNetworkDateDirectory
{
  id v2;

  v2 = objc_msgSend(objc_alloc((Class)APStorageManager), "initWithPathPrefix:", CFSTR("m"));
  objc_msgSend(v2, "removeObjectAtPath:error:", CFSTR("w"), 0);

}

- (void)terminateActivity:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = APLogForCategory(16);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Post Install Activity terminated.", v6, 2u);
  }

  -[APPostInstallActivity _cancelConfigRequest](self, "_cancelConfigRequest");
}

- (void)deferActivity:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, uint64_t);
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = (void (**)(id, uint64_t))a4;
  v6 = APLogForCategory(16);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Post Install Activity defered.", v8, 2u);
  }

  -[APPostInstallActivity _cancelConfigRequest](self, "_cancelConfigRequest");
  v5[2](v5, 1);

}

- (id)_storefront
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v9[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "storefront"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("-")));

  if (objc_msgSend(v4, "count"))
  {
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  }
  else
  {
    v6 = APLogForCategory(8);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error creating storefront.", v9, 2u);
    }

    v5 = &stru_100219118;
  }

  return v5;
}

- (void)_cancelConfigRequest
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[APPostInstallActivity configRequester](self, "configRequester"));
  if (v4)
    objc_msgSend(v4, "cancelRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APPostInstallActivity configurationStorage](self, "configurationStorage"));
  objc_msgSend(v3, "cancelConfigurationUpdate");

}

- (APXPCActivityCriteria)criteria
{
  return self->criteria;
}

- (APConfigurationStorage)configurationStorage
{
  return self->_configurationStorage;
}

- (APConfigurationRequester)configRequester
{
  return self->_configRequester;
}

- (void)setConfigRequester:(id)a3
{
  objc_storeStrong((id *)&self->_configRequester, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configRequester, 0);
  objc_storeStrong((id *)&self->_configurationStorage, 0);
  objc_storeStrong((id *)&self->criteria, 0);
  objc_storeStrong((id *)&self->taskID, 0);
}

@end
