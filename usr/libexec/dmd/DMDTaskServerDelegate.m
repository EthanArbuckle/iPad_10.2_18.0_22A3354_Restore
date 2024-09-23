@implementation DMDTaskServerDelegate

- (DMDTaskServerDelegate)initWithPolicyPersistence:(id)a3 activationManager:(id)a4
{
  id v6;
  id v7;
  DMDTaskServerDelegate *v8;
  CATOperationQueue *v9;
  CATOperationQueue *concurrentOperationQueue;
  NSString *v11;
  void *v12;
  char v13;
  NSMutableDictionary *v14;
  uint64_t v15;
  char v16;
  CATSerialOperationQueue *v17;
  NSMutableDictionary *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSDictionary *v23;
  NSDictionary *serialOperationQueuesByGroup;
  DMDDeviceStateObserver *v25;
  DMDDeviceStateObserver *deviceStateObserver;
  id v27;
  DMDConfigurationEngine *v28;
  DMDConfigurationEngine *configurationEngine;
  id v30;
  uint64_t v31;
  void *v32;
  DMFOSStateHandler *v33;
  DMFOSStateHandler *stateHandler;
  id v36;
  _QWORD v37[4];
  id v38;
  id location;
  objc_super v40;

  v6 = a3;
  v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)DMDTaskServerDelegate;
  v8 = -[DMDTaskServerDelegate init](&v40, "init");
  if (v8)
  {
    v36 = v7;
    v9 = objc_opt_new(CATOperationQueue);
    concurrentOperationQueue = v8->_concurrentOperationQueue;
    v8->_concurrentOperationQueue = v9;

    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%p.concurrent"), objc_opt_class(v8), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[CATOperationQueue setName:](v8->_concurrentOperationQueue, "setName:", v12);

    v13 = 1;
    -[CATOperationQueue setSuspended:](v8->_concurrentOperationQueue, "setSuspended:", 1);
    v14 = objc_opt_new(NSMutableDictionary);
    v15 = 0;
    do
    {
      v16 = v13;
      v17 = objc_opt_new(CATSerialOperationQueue);
      v18 = v14;
      v19 = objc_opt_class(v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate _nameForOperationGroup:](v8, "_nameForOperationGroup:", v15));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%p.serial.%@"), v19, v8, v20));
      -[CATSerialOperationQueue setName:](v17, "setName:", v21);

      v14 = v18;
      -[CATSerialOperationQueue setSuspended:](v17, "setSuspended:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v15));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v17, v22);

      v13 = 0;
      v15 = 1;
    }
    while ((v16 & 1) != 0);
    v23 = (NSDictionary *)-[NSMutableDictionary copy](v18, "copy");
    serialOperationQueuesByGroup = v8->_serialOperationQueuesByGroup;
    v8->_serialOperationQueuesByGroup = v23;

    v25 = objc_opt_new(DMDDeviceStateObserver);
    deviceStateObserver = v8->_deviceStateObserver;
    v8->_deviceStateObserver = v25;

    v27 = +[DMDConfigurationDatabase newUserDatabase](DMDConfigurationDatabase, "newUserDatabase");
    v7 = v36;
    v28 = -[DMDConfigurationEngine initWithDatabase:policyPersistence:activationManager:]([DMDConfigurationEngine alloc], "initWithDatabase:policyPersistence:activationManager:", v27, v6, v36);
    configurationEngine = v8->_configurationEngine;
    v8->_configurationEngine = v28;

    -[DMDConfigurationEngine setDelegate:](v8->_configurationEngine, "setDelegate:", v8);
    -[DMDConfigurationEngine setDeviceStateProvider:](v8->_configurationEngine, "setDeviceStateProvider:", v8->_deviceStateObserver);
    -[DMDConfigurationEngine setTaskOperationProvider:](v8->_configurationEngine, "setTaskOperationProvider:", v8);

    -[DMDDeviceStateObserver startObservingChanges](v8->_deviceStateObserver, "startObservingChanges");
    objc_initWeak(&location, v8);
    v30 = objc_alloc((Class)DMFOSStateHandler);
    v31 = CATGetCatalystQueue();
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000686FC;
    v37[3] = &unk_1000B9D18;
    objc_copyWeak(&v38, &location);
    v33 = (DMFOSStateHandler *)objc_msgSend(v30, "initWithQueue:name:stateHandlerBlock:", v32, CFSTR("DMD"), v37);
    stateHandler = v8->_stateHandler;
    v8->_stateHandler = v33;

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);

  }
  return v8;
}

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Starting…", v7, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_currentLocaleDidChange:", NSCurrentLocaleDidChangeNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate concurrentOperationQueue](self, "concurrentOperationQueue"));
  objc_msgSend(v4, "setSuspended:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate serialOperationQueuesByGroup](self, "serialOperationQueuesByGroup"));
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &stru_1000BBDB0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate configurationEngine](self, "configurationEngine"));
  objc_msgSend(v6, "resume");

}

- (NSString)description
{
  NSMutableString *v3;
  void *v4;
  NSMutableString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;
  void *v12;
  _QWORD v13[5];
  NSMutableString *v14;

  v3 = objc_opt_new(NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate serialOperationQueuesByGroup](self, "serialOperationQueuesByGroup"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100068948;
  v13[3] = &unk_1000BBDD8;
  v13[4] = self;
  v14 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v13);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate deviceStateObserver](self, "deviceStateObserver"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate concurrentOperationQueue](self, "concurrentOperationQueue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "operations"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate configurationEngine](self, "configurationEngine"));
  v8 = DMFObjectDescription(self, CFSTR("\nDevice state:\n%@\nDMD serial operations:%@\nDMD concurrent operations:\n%@\nConfiguration engine:\n%@"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return (NSString *)v9;
}

- (id)operationForRequest:(id)a3 targetUID:(unsigned int)a4 appleID:(id)a5 transport:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  objc_class *v12;
  objc_class *v13;
  DMDTaskOperationContext *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  uint64_t v22;
  void *v23;
  id v24;
  NSBundle *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  DMDTaskOperationContext *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  NSErrorUserInfoKey v39;
  uint64_t v40;
  uint8_t v41[128];
  uint8_t buf[4];
  id v43;

  v10 = a3;
  v11 = a6;
  v12 = -[DMDTaskServerDelegate operationClassForRequest:error:](self, "operationClassForRequest:error:", v10, a7);
  if (v12)
  {
    v13 = v12;
    v14 = objc_opt_new(DMDTaskOperationContext);
    v15 = objc_opt_class(CATXPCTransport);
    if ((objc_opt_isKindOfClass(v11, v15) & 1) != 0)
    {
      v33 = v14;
      v34 = v11;
      v16 = v11;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class requiredEntitlements](v13, "requiredEntitlements"));
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v36;
        while (2)
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(_QWORD *)v36 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
            if ((objc_msgSend(v16, "BOOLValueForEntitlement:", v22) & 1) == 0)
            {
              v25 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
              v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Process is missing entitlement “%@”"), &stru_1000BC2E0, CFSTR("DMFServerErrors")));

              v28 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v22));
              v29 = (void *)v28;
              if (a7)
              {
                v39 = NSLocalizedFailureReasonErrorKey;
                v40 = v28;
                v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
                v31 = DMFErrorWithCodeAndUserInfo(5, v30);
                *a7 = (id)objc_claimAutoreleasedReturnValue(v31);

              }
              v24 = 0;
              v14 = v33;
              v11 = v34;
              goto LABEL_21;
            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
          if (v19)
            continue;
          break;
        }
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForEntitlement:", DMFEntitlementsApplicationIdentifierKey));
      v14 = v33;
      -[DMDTaskOperationContext setClientBundleIdentifier:](v33, "setClientBundleIdentifier:", v23);

      -[DMDTaskOperationContext setUid:](v33, "setUid:", objc_msgSend(v16, "effectiveUserIdentifier"));
      v11 = v34;
    }
    if (-[objc_class validateRequest:error:](v13, "validateRequest:error:", v10, a7))
    {
      v24 = objc_msgSend([v13 alloc], "initWithRequest:", v10);
      -[DMDTaskServerDelegate prepareToRunOperation:withContext:withDatabase:](self, "prepareToRunOperation:withContext:withDatabase:", v24, v14, 0);
    }
    else
    {
      v24 = 0;
    }
LABEL_21:

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v43 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not get operation class for request: %{public}@", buf, 0xCu);
    }
    v24 = 0;
  }

  return v24;
}

- (Class)operationClassForRequest:(id)a3 error:(id *)a4
{
  id v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  NSString *v22;
  Class v23;
  uint64_t v24;
  objc_class *v25;
  _QWORD block[6];

  v7 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068EFC;
  block[3] = &unk_1000BA488;
  block[4] = self;
  block[5] = a2;
  if (qword_1000EBAB0 != -1)
    dispatch_once(&qword_1000EBAB0, block);
  v8 = (objc_class *)objc_opt_class(v7);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000EBAA8, "firstMatchInString:options:range:", v10, 0, 0, objc_msgSend(v10, "length")));
  v12 = v11;
  if (!v11)
  {
    v23 = 0;
    if (!a4)
      goto LABEL_14;
    goto LABEL_12;
  }
  v13 = objc_msgSend(v11, "rangeAtIndex:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringWithRange:", v13, v14));
  v16 = objc_msgSend((id)objc_opt_class(self), "_specialCasedRequestNamesToOperationNames");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v15));
  v19 = (void *)v18;
  if (v18)
    v20 = (void *)v18;
  else
    v20 = v15;
  v21 = v20;

  v22 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DMD%@Operation"), v21));
  v23 = NSClassFromString(v22);
  if (!-[objc_class isSubclassOfClass:](v23, "isSubclassOfClass:", objc_opt_class(DMDTaskOperation)))v23 = 0;

  if (a4)
  {
LABEL_12:
    if (!v23)
    {
      v24 = DMFErrorWithCodeAndUserInfo(4, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue(v24);
    }
  }
LABEL_14:
  v25 = v23;

  return v25;
}

- (void)prepareToRunOperation:(id)a3 withContext:(id)a4 withDatabase:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_opt_class(DMDTaskOperation);
  if ((objc_opt_isKindOfClass(v14, v10) & 1) != 0)
  {
    v11 = v14;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate configurationEngine](self, "configurationEngine"));
    objc_msgSend(v11, "setConfigurationEngine:", v12);

    objc_msgSend(v11, "setContext:", v8);
  }
  v13 = objc_opt_class(DMDEngineDatabaseOperation);
  if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0)
    objc_msgSend(v14, "setDatabase:", v9);

}

- (id)server:(id)a3 clientSession:(id)a4 operationForRequest:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v27;
  int v28;
  id v29;
  __int16 v30;
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 138543618;
    v29 = v12;
    v30 = 2114;
    v31 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received request: %{public}@, from client: %{public}@", (uint8_t *)&v28, 0x16u);
  }
  v13 = objc_opt_class(DMFTaskRequest);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0
    && (objc_msgSend((id)objc_opt_class(v12), "isPermittedOnCurrentPlatform") & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "clientUserInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transport"));
    v16 = objc_opt_class(CATXPCTransport);
    isKindOfClass = objc_opt_isKindOfClass(v15, v16);

    if ((isKindOfClass & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transport"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", DMFConnectionSenderPIDKey));
      v20 = objc_msgSend(v19, "intValue");

      if (v20 && v20 != objc_msgSend(v18, "processIdentifier"))
      {
        if (a6)
        {
          v27 = DMFErrorWithCodeAndUserInfo(5, 0);
          v24 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue(v27);
        }
        else
        {
          v24 = 0;
        }
        goto LABEL_10;
      }

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", DMFConnectionTargetUIDKey));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", DMFConnectionAppleIDKey));
    v22 = objc_msgSend(v18, "intValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transport"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate operationForRequest:targetUID:appleID:transport:error:](self, "operationForRequest:targetUID:appleID:transport:error:", v12, v22, v21, v23, a6));

LABEL_10:
    goto LABEL_14;
  }
  if (a6)
  {
    v25 = DMFErrorWithCodeAndUserInfo(4, 0);
    v24 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue(v25);
  }
  else
  {
    v24 = 0;
  }
LABEL_14:

  return v24;
}

- (void)server:(id)a3 clientSessionDidConnect:(id)a4
{
  int v5;
  id v6;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Connected %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)server:(id)a3 clientSessionDidDisconnect:(id)a4
{
  int v5;
  id v6;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Disconnected %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)server:(id)a3 clientSessionDidInvalidate:(id)a4
{
  int v5;
  id v6;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalidated %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)server:(id)a3 clientSession:(id)a4 didInterruptWithError:(id)a5
{
  id v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;

  v6 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "verboseDescription"));
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Interrupted %{public}@: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(v6, "invalidate");

}

- (void)server:(id)a3 clientSession:(id)a4 didReceiveNotificationWithName:(id)a5 userInfo:(id)a6
{
  int v9;
  id v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543874;
    v10 = a4;
    v11 = 2114;
    v12 = a5;
    v13 = 2114;
    v14 = a6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Notification %{public}@: %{public}@ %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)server:(id)a3 clientSession:(id)a4 enqueueOperation:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Add operation: %{public}@", buf, 0xCu);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate serialOperationQueuesByGroup](self, "serialOperationQueuesByGroup"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", &off_1000C35B8));

  if (objc_msgSend(v11, "conformsToProtocol:", &OBJC_PROTOCOL___DMDTaskOperationProtocol))
  {
    v14 = v11;
    if (objc_msgSend(v14, "runConcurrently"))
    {
      v15 = objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate concurrentOperationQueue](self, "concurrentOperationQueue"));
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate serialOperationQueuesByGroup](self, "serialOperationQueuesByGroup"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "queueGroup")));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v17));

      v13 = v16;
    }

    v13 = (void *)v15;
  }
  if (!v13)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDTaskServerDelegate.m"), 295, CFSTR("Queue must not be nil for operation: %@"), v11);

  }
  objc_msgSend(v13, "addOperation:", v11);

}

- (void)configurationEngineDidResume:(id)a3
{
  uint8_t v3[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Declaration engine did resume", v3, 2u);
  }
}

- (void)configurationEngineWillSuspend:(id)a3
{
  uint8_t v3[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Declaration engine did suspend", v3, 2u);
  }
}

+ (id)_specialCasedRequestNamesToOperationNames
{
  if (qword_1000EBAC0 != -1)
    dispatch_once(&qword_1000EBAC0, &stru_1000BBDF8);
  return (id)qword_1000EBAB8;
}

- (void)_currentLocaleDidChange:(id)a3
{
  uint8_t v3[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Notified of locale change. Exiting when clean.", v3, 2u);
  }
  xpc_transaction_exit_clean();
}

- (id)_nameForOperationGroup:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("declaration");
  else
    return CFSTR("unspecified");
}

- (CATOperationQueue)concurrentOperationQueue
{
  return self->_concurrentOperationQueue;
}

- (NSDictionary)serialOperationQueuesByGroup
{
  return self->_serialOperationQueuesByGroup;
}

- (DMDDeviceStateObserver)deviceStateObserver
{
  return self->_deviceStateObserver;
}

- (DMDConfigurationEngine)configurationEngine
{
  return self->_configurationEngine;
}

- (DMFOSStateHandler)stateHandler
{
  return self->_stateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_storeStrong((id *)&self->_configurationEngine, 0);
  objc_storeStrong((id *)&self->_deviceStateObserver, 0);
  objc_storeStrong((id *)&self->_serialOperationQueuesByGroup, 0);
  objc_storeStrong((id *)&self->_concurrentOperationQueue, 0);
}

@end
