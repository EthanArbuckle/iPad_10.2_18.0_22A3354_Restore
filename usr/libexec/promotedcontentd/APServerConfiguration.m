@implementation APServerConfiguration

- (id)serverURLForMessageID:(id)a3 andBundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  int v27;
  void *v28;

  v6 = a3;
  v7 = a4;
  if (!+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))goto LABEL_4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings settings](APMockAdServerSettings, "settings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mockAdServerUrl"));

  if (!v9
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings settings](APMockAdServerSettings, "settings")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mockAdServerUrl")),
        v12 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v11)),
        v11,
        v10,
        !v12))
  {
LABEL_4:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://iadsdk.apple.com/adserver")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[APServerConfiguration configurations](self, "configurations"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[APServerConfiguration configurations](self, "configurations"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v7));

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v6));
        v18 = APLogForCategory(21);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        v20 = v19;
        if (v17)
        {
          v21 = v17;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v27 = 138543362;
            v28 = v17;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Returning serverConfig URL: %{public}@", (uint8_t *)&v27, 0xCu);
            v21 = v17;
          }
        }
        else
        {
          v21 = v13;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v27) = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Did not find serverURL. Returning default serverURL", (uint8_t *)&v27, 2u);
            v21 = v13;
          }
        }

        v12 = v21;
      }
      else
      {
        v24 = APLogForCategory(21);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v27) = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Did not find requestTypeDictionary in serverConfigRecord. Returning default serverURL", (uint8_t *)&v27, 2u);
        }

        v12 = v13;
      }

    }
    else
    {
      v22 = APLogForCategory(21);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v27) = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Did not find configurations in serverConfigRecord. Returning default serverURL", (uint8_t *)&v27, 2u);
      }

      v12 = v13;
    }

  }
  return v12;
}

- (NSDictionary)configurations
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfigurations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (APServerConfiguration)init
{
  APServerConfiguration *v2;
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  void *v5;
  uint64_t v6;
  NSDictionary *configurations;
  NSDictionary *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  uint64_t v16;
  NSOperationQueue *v17;
  uint64_t v18;
  id notificationObject;
  _QWORD v21[4];
  id v22;
  id buf[2];
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)APServerConfiguration;
  v2 = -[APServerConfiguration init](&v24, "init");
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[APServerConfigurationSettings settings](APServerConfigurationSettings, "settings"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serverConfig"));
    configurations = v2->_configurations;
    v2->_configurations = (NSDictionary *)v6;

    v8 = v2->_configurations;
    v9 = APLogForCategory(21);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        v12 = "Read configurations from settings module.";
        v13 = v11;
        v14 = OS_LOG_TYPE_INFO;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, (uint8_t *)buf, 2u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      v12 = "Error reading from settings module.";
      v13 = v11;
      v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }

    objc_initWeak(buf, v2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    v16 = kAPAdLibBundleID;
    v17 = v2->_operationQueue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100003A8C;
    v21[3] = &unk_100213E80;
    objc_copyWeak(&v22, buf);
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "addObserverForName:object:queue:usingBlock:", CFSTR("ADConfigurationDidChangeNotification"), v16, v17, v21));
    notificationObject = v2->_notificationObject;
    v2->_notificationObject = (id)v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak(buf);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self->_notificationObject);

  v4.receiver = self;
  v4.super_class = (Class)APServerConfiguration;
  -[APServerConfiguration dealloc](&v4, "dealloc");
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (id)notificationObject
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setNotificationObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationObject, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
}

@end
