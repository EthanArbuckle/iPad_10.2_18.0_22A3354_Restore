@implementation FROpenInNewsManager

- (FROpenInNewsManager)init
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
    v6 = "-[FROpenInNewsManager init]";
    v7 = 2080;
    v8 = "FROpenInNewsManager.m";
    v9 = 1024;
    v10 = 35;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FROpenInNewsManager init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (FROpenInNewsManager)initWithConfigurationManager:(id)a3 networkReachability:(id)a4
{
  id v7;
  id v8;
  FROpenInNewsManager *v9;
  FROpenInNewsManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FROpenInNewsManager;
  v9 = -[FROpenInNewsManager init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configurationManager, a3);
    objc_storeStrong((id *)&v10->_networkReachability, a4);
  }

  return v10;
}

- (void)openArticleWithURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc((Class)FCWebURLResolutionEndpointConnection);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FROpenInNewsManager configurationManager](self, "configurationManager"));
  v11 = FCURLForContainerizedUserAccountCachesDirectory(1, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FROpenInNewsManager networkReachability](self, "networkReachability"));
  v14 = objc_msgSend(v8, "initWithConfigurationManager:cachesDirectoryURL:networkReachability:", v9, v12, v13);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100004460;
  v17[3] = &unk_100008418;
  v18 = v6;
  v19 = v7;
  v15 = v7;
  v16 = v6;
  objc_msgSend(v14, "resolveWebURL:withQualityOfService:completion:", v16, 25, v17);

}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (FCNetworkReachabilityType)networkReachability
{
  return self->_networkReachability;
}

- (void)setNetworkReachability:(id)a3
{
  objc_storeStrong((id *)&self->_networkReachability, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
}

@end
