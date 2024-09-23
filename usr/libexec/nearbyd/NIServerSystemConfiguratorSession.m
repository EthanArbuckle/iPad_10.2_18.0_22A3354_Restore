@implementation NIServerSystemConfiguratorSession

- (NIServerSystemConfiguratorSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NIServerSystemConfiguratorSession *v15;
  uint64_t v16;
  OS_dispatch_queue *clientQueue;
  NISystemConfiguration *v18;
  NISystemConfiguration *configuration;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *configuratorClientIdentifier;
  void *v25;
  void *v26;
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v12 = objc_opt_class(v10, v11);
  if (v12 != objc_opt_class(NISystemConfiguration, v13))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerSystemConfiguratorSession.mm"), 33, CFSTR("Invalid configuration type."));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverSessionIdentifier"));

  if (!v14)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerSystemConfiguratorSession.mm"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resourcesManager.serverSessionIdentifier"));

  }
  v27.receiver = self;
  v27.super_class = (Class)NIServerSystemConfiguratorSession;
  v15 = -[NIServerBaseSession initWithResourcesManager:configuration:error:](&v27, "initWithResourcesManager:configuration:error:", v9, v10, a5);
  if (v15)
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientConnectionQueue"));
    clientQueue = v15->_clientQueue;
    v15->_clientQueue = (OS_dispatch_queue *)v16;

    v18 = (NISystemConfiguration *)objc_msgSend(v10, "copy");
    configuration = v15->_configuration;
    v15->_configuration = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUIDString"));
    v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ses-system-%@"), v21));
    configuratorClientIdentifier = v15->_configuratorClientIdentifier;
    v15->_configuratorClientIdentifier = (NSString *)v22;

  }
  return v15;
}

- (id)configure
{
  NIServerSessionResourceManager *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  objc_super v8;
  NSErrorUserInfoKey v9;
  const __CFString *v10;

  v8.receiver = self;
  v8.super_class = (Class)NIServerSystemConfiguratorSession;
  v2 = -[NIServerBaseSession resourcesManager](&v8, "resourcesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if ((objc_msgSend(v3, "entitlementGranted:", 0) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D77EC(v5);
    v9 = NSLocalizedDescriptionKey;
    v10 = CFSTR("Not authorized.");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v6));

  }
  return v4;
}

- (id)run
{
  NSObject *v3;
  NISystemConfiguration *configuration;
  NIServerSessionResourceManager *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  uint8_t buf[4];
  NISystemConfiguration *v13;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    configuration = self->_configuration;
    *(_DWORD *)buf = 138412290;
    v13 = configuration;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-system,Run with configuration: %@", buf, 0xCu);
  }
  v11.receiver = self;
  v11.super_class = (Class)NIServerSystemConfiguratorSession;
  v5 = -[NIServerBaseSession resourcesManager](&v11, "resourcesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lifecycleSupervisor"));
  objc_msgSend(v7, "setTimeoutOnPeerInactivity:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerSystemConfigurator sharedInstance](NIServerSystemConfigurator, "sharedInstance"));
  objc_msgSend(v8, "addClient:identifier:", self, self->_configuratorClientIdentifier);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerSystemConfigurator sharedInstance](NIServerSystemConfigurator, "sharedInstance"));
  objc_msgSend(v9, "clientWithIdentifier:requestedPrewarmUWB:prewarmSecureElementChannel:", self->_configuratorClientIdentifier, -[NISystemConfiguration prewarmUWB](self->_configuration, "prewarmUWB"), -[NISystemConfiguration prewarmSecureElementChannel](self->_configuration, "prewarmSecureElementChannel"));

  return 0;
}

- (id)pauseWithSource:(int64_t)a3
{
  NSObject *v3;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-system,Pause (no-op)", v5, 2u);
  }
  return 0;
}

- (BOOL)updateConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  NISystemConfiguration *configuration;
  NISystemConfiguration *v7;
  NISystemConfiguration *v8;
  int v10;
  id v11;
  __int16 v12;
  NISystemConfiguration *v13;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    configuration = self->_configuration;
    v10 = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = configuration;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-system,Update to configuration: %@. Previous: %@", (uint8_t *)&v10, 0x16u);
  }
  v7 = (NISystemConfiguration *)objc_msgSend(v4, "copy");
  v8 = self->_configuration;
  self->_configuration = v7;

  return 1;
}

- (id)_processSystemEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  NSString *v9;
  Class v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char isKindOfClass;
  id v18;
  id v19;
  int v21;
  id v22;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!v4)
    __assert_rtn("-[NIServerSystemConfiguratorSession _processSystemEvent:]", "NIServerSystemConfiguratorSession.mm", 91, "event");
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-system,Process system event: %@", (uint8_t *)&v21, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SystemEventDictKey_EventType")));
  v7 = objc_msgSend(v6, "integerValue");

  if ((unint64_t)v7 >= 3)
    v8 = 0;
  else
    v8 = v7;
  if (v8 == (id)1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SystemEventDictKey_PassiveAccessIntentOptions")));
    if (v12)
    {
      v16 = objc_opt_class(NSNumber, v15);
      isKindOfClass = objc_opt_isKindOfClass(v12, v16);
    }
    else
    {
      isKindOfClass = 0;
    }
    v18 = objc_msgSend(v12, "unsignedIntegerValue");
    if ((isKindOfClass & 1) == 0)
      goto LABEL_18;
    v19 = v18;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerSystemConfigurator sharedInstance](NIServerSystemConfigurator, "sharedInstance"));
    objc_msgSend(v14, "clientWithIdentifier:notifiedPassiveAccessIntent:", self->_configuratorClientIdentifier, v19);
    goto LABEL_17;
  }
  if (v8 == (id)2)
  {
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SystemEventDictKey_ConfigurationType")));
    v10 = NSClassFromString(v9);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SystemEventDictKey_ResourceUsageLimitExceededValue")));
    if (!v12)
      goto LABEL_18;
    v13 = objc_opt_class(NSNumber, v11);
    if (((v10 != 0) & objc_opt_isKindOfClass(v12, v13)) != 1)
      goto LABEL_18;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerSystemConfigurator sharedInstance](NIServerSystemConfigurator, "sharedInstance"));
    objc_msgSend(v14, "clientWithIdentifier:notifiedResourceUsageLimitExceeded:forSessionConfigurationType:", self->_configuratorClientIdentifier, objc_msgSend(v12, "BOOLValue"), v10);
LABEL_17:

LABEL_18:
  }

  return 0;
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-system,Invalidate", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerSystemConfigurator sharedInstance](NIServerSystemConfigurator, "sharedInstance"));
  objc_msgSend(v4, "removeClientWithIdentifier:", self->_configuratorClientIdentifier);

  v5.receiver = self;
  v5.super_class = (Class)NIServerSystemConfiguratorSession;
  -[NIServerBaseSession invalidate](&v5, "invalidate");
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[16];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-system,Dealloc", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerSystemConfigurator sharedInstance](NIServerSystemConfigurator, "sharedInstance"));
  objc_msgSend(v4, "removeClientWithIdentifier:", self->_configuratorClientIdentifier);

  v5.receiver = self;
  v5.super_class = (Class)NIServerSystemConfiguratorSession;
  -[NIServerSystemConfiguratorSession dealloc](&v5, "dealloc");
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)100;
}

- (void)didUpdateSystemState:(id)a3
{
  id v4;
  OS_dispatch_queue *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001BAD84;
  v7[3] = &unk_1007FA518;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)clientQueue, v7);

}

- (void)didUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationType:(Class)a4
{
  OS_dispatch_queue *clientQueue;
  _QWORD block[6];
  BOOL v6;

  clientQueue = self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BAE74;
  block[3] = &unk_10080C288;
  v6 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async((dispatch_queue_t)clientQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuratorClientIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end
