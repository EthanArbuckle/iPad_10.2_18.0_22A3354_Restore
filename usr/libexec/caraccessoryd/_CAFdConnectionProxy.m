@implementation _CAFdConnectionProxy

- (_CAFdConnectionProxy)initWithConnection:(id)a3 agent:(id)a4
{
  id v7;
  id v8;
  _CAFdConnectionProxy *v9;
  _CAFdConnectionProxy *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *registrations;
  uint64_t v13;
  NSMutableSet *assertions;
  void *v15;
  id v16;
  const char *v17;
  dispatch_queue_attr_t v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *proxyQueue;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location;
  objc_super v34;
  uint8_t buf[4];
  _CAFdConnectionProxy *v36;

  v7 = a3;
  v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)_CAFdConnectionProxy;
  v9 = -[_CAFdConnectionProxy init](&v34, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeWeak((id *)&v10->_agent, v8);
    v10->_registrationsLock._os_unfair_lock_opaque = 0;
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    registrations = v10->_registrations;
    v10->_registrations = v11;

    v10->_lastAssertion = (NSDate *)+[NSDate distantPast](NSDate, "distantPast");
    v10->_assertionsLock._os_unfair_lock_opaque = 0;
    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    assertions = v10->_assertions;
    v10->_assertions = (NSMutableSet *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.private.carp.wake")));
    v10->_takeAssertions = objc_msgSend(v15, "BOOLValue");

    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.caraccessoryframework.CAFdConnectionProxy-%p"), v10)));
    v17 = (const char *)objc_msgSend(v16, "UTF8String");
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = dispatch_queue_create(v17, v19);
    proxyQueue = v10->_proxyQueue;
    v10->_proxyQueue = (OS_dispatch_queue *)v20;

    v22 = CAFCarDataServiceInterface();
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    objc_msgSend(v7, "setExportedInterface:", v23);

    v24 = CAFCarDataClientInterface();
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    objc_msgSend(v7, "setRemoteObjectInterface:", v25);

    objc_msgSend(v7, "setExportedObject:", v10);
    objc_initWeak(&location, v10);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = __49___CAFdConnectionProxy_initWithConnection_agent___block_invoke;
    v31[3] = &unk_100030C48;
    objc_copyWeak(&v32, &location);
    objc_msgSend(v7, "setInterruptionHandler:", v31);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __49___CAFdConnectionProxy_initWithConnection_agent___block_invoke_21;
    v29[3] = &unk_100030C48;
    objc_copyWeak(&v30, &location);
    v26 = CAFDLogging(objc_msgSend(v7, "setInvalidationHandler:", v29));
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v10;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Activating connection %{public}@", buf, 0xCu);
    }

    objc_msgSend(v7, "activate");
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)invalidateAndRemoveAssertions
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Invalidate and remove assertions for conexion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createAssertionWithAction:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  _QWORD v22[5];
  void *v23;

  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  if (!-[_CAFdConnectionProxy takeAssertions](self, "takeAssertions")
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy lastAssertion](self, "lastAssertion")),
        objc_msgSend(v5, "timeIntervalSinceDate:", v6),
        v8 = v7,
        v6,
        v8 < 1.0))
  {
    if (!v4)
      goto LABEL_15;
    goto LABEL_14;
  }
  -[_CAFdConnectionProxy setLastAssertion:](self, "setLastAssertion:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.caraccessoryd"), CFSTR("WakeClient")));
  v23 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy connection](self, "connection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithPid:](RBSTarget, "targetWithPid:", objc_msgSend(v11, "processIdentifier")));

  v13 = objc_msgSend(objc_alloc((Class)RBSAssertion), "initWithExplanation:target:attributes:", CFSTR("CAFd wakes up clients"), v12, v10);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __50___CAFdConnectionProxy_createAssertionWithAction___block_invoke;
  v22[3] = &unk_100030C70;
  v22[4] = self;
  objc_msgSend(v13, "setInvalidationHandler:", v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy agent](self, "agent"));
  objc_msgSend(v14, "_observeAssertion:", v13);

  v21 = 0;
  objc_msgSend(v13, "acquireWithError:", &v21);
  v15 = v21;
  if (v15)
  {
    v16 = CAFDAssertionLogging();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[_CAFdConnectionProxy createAssertionWithAction:].cold.1();

  }
  else
  {
    os_unfair_lock_lock(&self->_assertionsLock);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy assertions](self, "assertions"));
    objc_msgSend(v18, "addObject:", v13);

    v19 = CAFDAssertionLogging();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[_CAFdConnectionProxy createAssertionWithAction:].cold.2(self, v20);

    os_unfair_lock_unlock(&self->_assertionsLock);
  }

  if (v4 && !v15)
LABEL_14:
    v4[2](v4);
LABEL_15:

}

- (CAFCarDataClient)remoteProxy
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy connection](self, "connection"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "remoteObjectProxy"));
  if (objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___CAFCarDataClient))
    v4 = v3;
  else
    v4 = 0;

  return (CAFCarDataClient *)v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  unsigned int v11;
  const __CFString *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy lastAssertion](self, "lastAssertion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  if ((objc_msgSend(v3, "isEqualToDate:", v4) & 1) != 0)
  {
    v5 = CFSTR("NONE");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy lastAssertion](self, "lastAssertion"));
    objc_msgSend(v6, "timeIntervalSinceNow");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.3f"), v7));

  }
  v8 = objc_opt_class(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy connection](self, "connection"));
  v10 = objc_msgSend(v9, "processIdentifier");
  v11 = -[_CAFdConnectionProxy takeAssertions](self, "takeAssertions");
  v12 = CFSTR("NO");
  if (v11)
    v12 = CFSTR("YES");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p: pid=%d takeAssertions=%@ lastAssertion=%@>"), v8, self, v10, v12, v5));

  return (NSString *)v13;
}

- (void)fetchCurrentCarConfigWithReply:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;

  v4 = (void (**)(id, id))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy agent](self, "agent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentCar"));

  if (v6)
  {
    if (objc_msgSend(v6, "isConfigured"))
    {
      v7 = v6;
      v8 = CAFDDataLogging();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[_CAFdConnectionProxy fetchCurrentCarConfigWithReply:].cold.2();
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy agent](self, "agent"));
      v13 = objc_msgSend(v12, "allowPartialConfiguration");

      if (v13)
      {
        v7 = v6;
        v14 = CAFDDataLogging();
        v9 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[_CAFdConnectionProxy fetchCurrentCarConfigWithReply:].cold.3();
      }
      else
      {
        v7 = objc_msgSend(v6, "copyWithoutPlugins");
        v15 = CAFDDataLogging();
        v9 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[_CAFdConnectionProxy fetchCurrentCarConfigWithReply:].cold.4();
      }
    }

    if (v4)
      v4[2](v4, v7);

  }
  else
  {
    v10 = CAFDDataLogging();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[_CAFdConnectionProxy fetchCurrentCarConfigWithReply:].cold.1();

    if (v4)
      v4[2](v4, 0);
  }

}

- (void)addRegistrationToPluginID:(id)a3 instanceIDs:(id)a4 priority:(id)a5 withResponse:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  _CAFdConnectionProxy *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  os_unfair_lock_lock(&self->_registrationsLock);
  v14 = CAFDDataLogging();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v21 = 138544130;
    v22 = self;
    v23 = 2114;
    v24 = v10;
    v25 = 2050;
    v26 = objc_msgSend(v11, "count");
    v27 = 2114;
    v28 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}@: add registration pluginID: %{public}@ instanceIDs count %{public}lu with priority: %{public}@", (uint8_t *)&v21, 0x2Au);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy registrations](self, "registrations"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v10));

  if (v17)
  {
    objc_msgSend(v17, "addObjectsFromArray:", v11);
  }
  else
  {
    v18 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy registrations](self, "registrations"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v10);

  }
  os_unfair_lock_unlock(&self->_registrationsLock);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy agent](self, "agent"));
  objc_msgSend(v20, "_addRegistration:instanceIDs:priority:withResponse:", v10, v11, v12, v13);

}

- (void)removeRegistrationFromPluginID:(id)a3 instanceIDs:(id)a4 priority:(id)a5 withResponse:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  _CAFdConnectionProxy *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  os_unfair_lock_lock(&self->_registrationsLock);
  v14 = CAFDDataLogging();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138544130;
    v22 = self;
    v23 = 2114;
    v24 = v10;
    v25 = 2050;
    v26 = objc_msgSend(v11, "count");
    v27 = 2114;
    v28 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}@ remove registration pluginID: %{public}@ instanceIDs count %{public}lu with priority: %{public}@", buf, 0x2Au);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy registrations](self, "registrations"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v10));

  if (v17)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __89___CAFdConnectionProxy_removeRegistrationFromPluginID_instanceIDs_priority_withResponse___block_invoke;
    v19[3] = &unk_100030C98;
    v20 = v17;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v19);
    os_unfair_lock_unlock(&self->_registrationsLock);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy agent](self, "agent"));
    objc_msgSend(v18, "_removeRegistration:instanceIDs:priority:withResponse:", v10, v11, v12, v13);

  }
  else
  {
    os_unfair_lock_unlock(&self->_registrationsLock);
  }

}

- (void)readFromPluginID:(id)a3 instanceIDs:(id)a4 priority:(id)a5 withResponse:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  uint8_t buf[4];
  _CAFdConnectionProxy *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy agent](self, "agent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_getClient:", v10));

  if (v15)
  {
    objc_msgSend(v15, "readInstanceIDs:priority:withResponse:", v11, v12, v13);
  }
  else
  {
    v16 = CAFDDataLogging();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v22 = self;
      v23 = 2114;
      v24 = v10;
      v25 = 2114;
      v26 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@: Read request for pluginID: %{public}@ with priority: %{public}@ failed due to missing plugin", buf, 0x20u);
    }

    if (v13)
    {
      v18 = objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy proxyQueue](self, "proxyQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __75___CAFdConnectionProxy_readFromPluginID_instanceIDs_priority_withResponse___block_invoke;
      block[3] = &unk_100030CC0;
      v20 = v13;
      dispatch_async(v18, block);

    }
  }

}

- (void)writeToPluginID:(id)a3 values:(id)a4 priority:(id)a5 withResponse:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  uint8_t buf[4];
  _CAFdConnectionProxy *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy agent](self, "agent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_getClient:", v10));

  if (v15)
  {
    objc_msgSend(v15, "writeValues:priority:withResponse:", v11, v12, v13);
  }
  else
  {
    v16 = CAFDDataLogging();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v22 = self;
      v23 = 2114;
      v24 = v10;
      v25 = 2114;
      v26 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@: Write request for pluginID: %{public}@ with priority: %{public}@ failed due to missing plugin", buf, 0x20u);
    }

    if (v13)
    {
      v18 = objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy proxyQueue](self, "proxyQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __69___CAFdConnectionProxy_writeToPluginID_values_priority_withResponse___block_invoke;
      block[3] = &unk_100030CC0;
      v20 = v13;
      dispatch_async(v18, block);

    }
  }

}

- (void)requestPluginID:(id)a3 instanceID:(id)a4 value:(id)a5 priority:(id)a6 withResponse:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD block[4];
  id v23;
  uint8_t buf[4];
  _CAFdConnectionProxy *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy agent](self, "agent"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_getClient:", v12));

  if (v18)
  {
    objc_msgSend(v18, "requestInstanceID:value:priority:withResponse:", v13, v14, v15, v16);
  }
  else
  {
    v19 = CAFDDataLogging();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v25 = self;
      v26 = 2112;
      v27 = v12;
      v28 = 2112;
      v29 = v13;
      v30 = 2112;
      v31 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@: Request pluginID: %@ instanceID: %@ with priority: %@ failed due to missing plugin", buf, 0x2Au);
    }

    if (v16)
    {
      v21 = objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy proxyQueue](self, "proxyQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __79___CAFdConnectionProxy_requestPluginID_instanceID_value_priority_withResponse___block_invoke;
      block[3] = &unk_100030CC0;
      v23 = v16;
      dispatch_async(v21, block);

    }
  }

}

- (void)notifyPluginID:(id)a3 instanceID:(id)a4 value:(id)a5 priority:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  _CAFdConnectionProxy *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy agent](self, "agent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_getClient:", v10));

  if (v15)
  {
    objc_msgSend(v15, "notifyInstanceID:value:priority:", v11, v12, v13);
  }
  else
  {
    v16 = CAFDDataLogging();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = 138413058;
      v19 = self;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      v24 = 2112;
      v25 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@: Notify pluginID: %@ instanceID: %@ with priority: %@ failed due to missing plugin", (uint8_t *)&v18, 0x2Au);
    }

  }
}

- (void)didUpdateCurrentCarConfig:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  _CAFdConnectionProxy *v13;
  __int16 v14;
  id v15;

  v4 = a3;
  os_unfair_lock_lock(&self->_registrationsLock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy registrations](self, "registrations"));
  objc_msgSend(v5, "removeAllObjects");

  os_unfair_lock_unlock(&self->_registrationsLock);
  v7 = CAFDLogging(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v13 = self;
    v14 = 2114;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ didUpdateCurrentCarConfig: %{public}@", buf, 0x16u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __50___CAFdConnectionProxy_didUpdateCurrentCarConfig___block_invoke;
  v10[3] = &unk_100030CE8;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  -[_CAFdConnectionProxy createAssertionWithAction:](self, "createAssertionWithAction:", v10);

}

- (void)didUpdateConfig:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  _CAFdConnectionProxy *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = CAFDLogging(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", ")));
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ didUpdateConfig: [%{public}@]", buf, 0x16u);

  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __40___CAFdConnectionProxy_didUpdateConfig___block_invoke;
  v10[3] = &unk_100030CE8;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  -[_CAFdConnectionProxy createAssertionWithAction:](self, "createAssertionWithAction:", v10);

}

- (void)didUpdatePluginID:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_registrationsLock);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy registrations](self, "registrations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v6));
  v10 = objc_msgSend(v9, "copy");

  os_unfair_lock_unlock(&self->_registrationsLock);
  if (v10)
  {
    v11 = objc_alloc_init((Class)NSMutableDictionary);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __49___CAFdConnectionProxy_didUpdatePluginID_values___block_invoke;
    v16[3] = &unk_100030D10;
    v17 = v10;
    v12 = v11;
    v18 = v12;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v16);
    if (objc_msgSend(v12, "count"))
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = __49___CAFdConnectionProxy_didUpdatePluginID_values___block_invoke_2;
      v13[3] = &unk_100030D38;
      v13[4] = self;
      v14 = v6;
      v15 = v12;
      -[_CAFdConnectionProxy createAssertionWithAction:](self, "createAssertionWithAction:", v13);

    }
  }

}

- (void)didRequestPluginID:(id)a3 instanceID:(id)a4 value:(id)a5 withResponse:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[_CAFdConnectionProxy _isRegisteredForPluginID:instanceID:](self, "_isRegisteredForPluginID:instanceID:", v10, v11))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __73___CAFdConnectionProxy_didRequestPluginID_instanceID_value_withResponse___block_invoke;
    v15[3] = &unk_100030D60;
    v15[4] = self;
    v16 = v10;
    v17 = v11;
    v18 = v12;
    v19 = v13;
    -[_CAFdConnectionProxy createAssertionWithAction:](self, "createAssertionWithAction:", v15);

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0));
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v14);

  }
}

- (void)didNotifyPluginID:(id)a3 instanceID:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[_CAFdConnectionProxy _isRegisteredForPluginID:instanceID:](self, "_isRegisteredForPluginID:instanceID:", v8, v9))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __59___CAFdConnectionProxy_didNotifyPluginID_instanceID_value___block_invoke;
    v11[3] = &unk_100030D88;
    v11[4] = self;
    v12 = v8;
    v13 = v9;
    v14 = v10;
    -[_CAFdConnectionProxy createAssertionWithAction:](self, "createAssertionWithAction:", v11);

  }
}

- (BOOL)_isRegisteredForPluginID:(id)a3 instanceID:(id)a4
{
  os_unfair_lock_s *p_registrationsLock;
  id v7;
  id v8;
  void *v9;
  void *v10;

  p_registrationsLock = &self->_registrationsLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_registrationsLock);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy registrations](self, "registrations"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v8));

  LOBYTE(v8) = objc_msgSend(v10, "containsObject:", v7);
  os_unfair_lock_unlock(p_registrationsLock);
  return (char)v8;
}

- (id)registrationsForPluginID:(id)a3
{
  os_unfair_lock_s *p_registrationsLock;
  id v5;
  void *v6;
  void *v7;
  id v8;

  p_registrationsLock = &self->_registrationsLock;
  v5 = a3;
  os_unfair_lock_lock(p_registrationsLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_CAFdConnectionProxy registrations](self, "registrations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));

  v8 = objc_msgSend(v7, "copy");
  os_unfair_lock_unlock(p_registrationsLock);
  return v8;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (CAFDCarDataServiceAgent)agent
{
  return (CAFDCarDataServiceAgent *)objc_loadWeakRetained((id *)&self->_agent);
}

- (void)setAgent:(id)a3
{
  objc_storeWeak((id *)&self->_agent, a3);
}

- (os_unfair_lock_s)registrationsLock
{
  return self->_registrationsLock;
}

- (void)setRegistrationsLock:(os_unfair_lock_s)a3
{
  self->_registrationsLock = a3;
}

- (NSMutableDictionary)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
  objc_storeStrong((id *)&self->_registrations, a3);
}

- (OS_dispatch_queue)proxyQueue
{
  return self->_proxyQueue;
}

- (void)setProxyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_proxyQueue, a3);
}

- (os_unfair_lock_s)assertionsLock
{
  return self->_assertionsLock;
}

- (void)setAssertionsLock:(os_unfair_lock_s)a3
{
  self->_assertionsLock = a3;
}

- (BOOL)takeAssertions
{
  return self->_takeAssertions;
}

- (NSMutableSet)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_assertions, a3);
}

- (NSDate)lastAssertion
{
  return self->_lastAssertion;
}

- (void)setLastAssertion:(id)a3
{
  self->_lastAssertion = (NSDate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_proxyQueue, 0);
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_destroyWeak((id *)&self->_agent);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)createAssertionWithAction:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_5();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "%{public}@ Assertion acquirement error: %{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)createAssertionWithAction:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "assertions"));
  objc_msgSend(v3, "count");
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, a2, v4, "%{public}@ Assertion acquired. active count=%lu", v5);

  OUTLINED_FUNCTION_10();
}

- (void)fetchCurrentCarConfigWithReply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "%{public}@: No car", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)fetchCurrentCarConfigWithReply:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, (uint64_t)v0, "%{public}@: Current car: %{public}@ with config", v1);
  OUTLINED_FUNCTION_3();
}

- (void)fetchCurrentCarConfigWithReply:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, (uint64_t)v0, "%{public}@: Current car: %{public}@ with incomplete config", v1);
  OUTLINED_FUNCTION_3();
}

- (void)fetchCurrentCarConfigWithReply:.cold.4()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, (uint64_t)v0, "%{public}@: Current car: %{public}@ without config", v1);
  OUTLINED_FUNCTION_3();
}

@end
