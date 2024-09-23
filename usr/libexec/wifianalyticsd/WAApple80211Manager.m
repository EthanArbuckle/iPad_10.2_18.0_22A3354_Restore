@implementation WAApple80211Manager

+ (id)sharedObject
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AE78;
  block[3] = &unk_1000CCD10;
  block[4] = a1;
  if (qword_1000ECFA8 != -1)
    dispatch_once(&qword_1000ECFA8, block);
  return (id)qword_1000ECFA0;
}

- (WAApple80211Manager)init
{
  WAApple80211Manager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *interfaceNameToApple80211InstanceMap;
  dispatch_queue_t v5;
  NSObject *serialQueue;
  id v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;

  v9.receiver = self;
  v9.super_class = (Class)WAApple80211Manager;
  v2 = -[WAApple80211Manager init](&v9, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    interfaceNameToApple80211InstanceMap = v2->_interfaceNameToApple80211InstanceMap;
    v2->_interfaceNameToApple80211InstanceMap = v3;

    v5 = dispatch_queue_create("WAApple80211ManagerQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;
  }
  else
  {
    v8 = WALogCategoryDefaultHandle();
    serialQueue = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(serialQueue, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v11 = "-[WAApple80211Manager init]";
      v12 = 1024;
      v13 = 51;
      _os_log_impl((void *)&_mh_execute_header, serialQueue, OS_LOG_TYPE_ERROR, "%{public}s::%d:FAILED to initialize!", buf, 0x12u);
    }
  }

  return v2;
}

- (id)getInfraApple80211
{
  OS_dispatch_queue *serialQueue;
  id v4;
  _QWORD block[5];
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  id location;

  objc_initWeak(&location, self);
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_10002B09C;
  v12 = sub_10002B0AC;
  v13 = 0;
  block[0] = _NSConcreteStackBlock;
  serialQueue = self->_serialQueue;
  block[2] = sub_10002B0B4;
  block[3] = &unk_1000CCD60;
  block[1] = 3221225472;
  objc_copyWeak(&v7, &location);
  block[4] = &v8;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  v4 = (id)v9[5];
  objc_destroyWeak(&v7);
  _Block_object_dispose(&v8, 8);

  objc_destroyWeak(&location);
  return v4;
}

- (id)_getInfraApple80211
{
  NSMutableDictionary *interfaceNameToApple80211InstanceMap;
  uint64_t v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSString *v9;
  NSString *infraInterfaceName;
  NSString *v11;
  id v12;
  id v14;
  NSObject *v15;
  const char *v16;
  id v17;
  id v18;
  NSObject *v19;
  NSMutableDictionary *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSString *v24;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;

  if (self->_infraInterfaceName)
  {
    interfaceNameToApple80211InstanceMap = self->_interfaceNameToApple80211InstanceMap;
    if (interfaceNameToApple80211InstanceMap)
    {
      v4 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](interfaceNameToApple80211InstanceMap, "objectForKey:"));
      if (v4)
      {
        v8 = (void *)v4;
        goto LABEL_10;
      }
    }
  }
  v5 = WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 136446466;
    v26 = "-[WAApple80211Manager _getInfraApple80211]";
    v27 = 1024;
    v28 = 78;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Finding interface name and alloc WAApple80211", (uint8_t *)&v25, 0x12u);
  }

  v7 = -[WAApple80211 initByFindingInterfaceName]([WAApple80211 alloc], "initByFindingInterfaceName");
  v8 = v7;
  if (v7)
  {
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ifName"));
    infraInterfaceName = self->_infraInterfaceName;
    self->_infraInterfaceName = v9;

    v11 = self->_infraInterfaceName;
    if (v11 && -[NSString length](v11, "length"))
    {
      -[NSMutableDictionary setObject:forKey:](self->_interfaceNameToApple80211InstanceMap, "setObject:forKey:", v8, self->_infraInterfaceName);
      goto LABEL_10;
    }
    v14 = WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v25 = 136446466;
      v26 = "-[WAApple80211Manager _getInfraApple80211]";
      v27 = 1024;
      v28 = 84;
      v16 = "%{public}s::%d:WAApple80211 bad infraInterfaceName";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v25, 0x12u);
    }
  }
  else
  {
    v17 = WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v25 = 136446466;
      v26 = "-[WAApple80211Manager _getInfraApple80211]";
      v27 = 1024;
      v28 = 81;
      v16 = "%{public}s::%d:WAApple80211 initByFindingInterfaceName failed";
      goto LABEL_15;
    }
  }

  v18 = WALogCategoryDefaultHandle();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v25 = 136446466;
    v26 = "-[WAApple80211Manager _getInfraApple80211]";
    v27 = 1024;
    v28 = 91;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to create WAApple80211", (uint8_t *)&v25, 0x12u);
  }

  if (self->_infraInterfaceName)
  {
    v20 = self->_interfaceNameToApple80211InstanceMap;
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v20, "objectForKey:"));

      if (v21)
      {
        v22 = WALogCategoryDefaultHandle();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v25 = 136446466;
          v26 = "-[WAApple80211Manager _getInfraApple80211]";
          v27 = 1024;
          v28 = 97;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}s::%d:Removing existing entry in interface map", (uint8_t *)&v25, 0x12u);
        }

        -[NSMutableDictionary removeObjectForKey:](self->_interfaceNameToApple80211InstanceMap, "removeObjectForKey:", self->_infraInterfaceName);
      }
    }
  }
  v24 = self->_infraInterfaceName;
  self->_infraInterfaceName = 0;

  v8 = 0;
LABEL_10:
  v12 = v8;

  return v12;
}

- (NSMutableDictionary)interfaceNameToApple80211InstanceMap
{
  return self->_interfaceNameToApple80211InstanceMap;
}

- (void)setInterfaceNameToApple80211InstanceMap:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceNameToApple80211InstanceMap, a3);
}

- (NSString)infraInterfaceName
{
  return self->_infraInterfaceName;
}

- (void)setInfraInterfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_infraInterfaceName, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_infraInterfaceName, 0);
  objc_storeStrong((id *)&self->_interfaceNameToApple80211InstanceMap, 0);
}

@end
