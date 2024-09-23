@implementation HAPPowerManager

+ (id)sharedInstance
{
  if (qword_1002716E8 != -1)
    dispatch_once(&qword_1002716E8, &stru_100237D98);
  return (id)qword_1002716E0;
}

- (HAPPowerManager)init
{
  id v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  io_connect_t v9;
  id v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  HAPPowerManager *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  objc_super v23;
  uint8_t buf[4];
  void *v25;

  v23.receiver = self;
  v23.super_class = (Class)HAPPowerManager;
  v2 = -[HAPPowerManager init](&v23, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("HAPPowerManager", v4);
    v6 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToWeakObjectsMapTable](NSMapTable, "weakToWeakObjectsMapTable"));
    v8 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v7;

    v9 = IORegisterForSystemPower(v2, (IONotificationPortRef *)v2 + 3, (IOServiceInterestCallback)j__objc_msgSend_systemPowerChanged_notificationID_, (io_object_t *)v2 + 5);
    *((_DWORD *)v2 + 4) = v9;
    if (v9)
    {
      IONotificationPortSetDispatchQueue((IONotificationPortRef)objc_msgSend(v2, "systemPowerPort"), *((dispatch_queue_t *)v2 + 1));
    }
    else
    {
      v10 = v2;
      v12 = sub_10007CCE4((uint64_t)v10, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = sub_10007CD2C(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        *(_DWORD *)buf = 138543362;
        v25 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Error registering for system power", buf, 0xCu);

      }
    }
  }
  v16 = (HAPPowerManager *)v2;
  v18 = sub_10007CCE4((uint64_t)v16, v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = sub_10007CD2C(v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    *(_DWORD *)buf = 138543362;
    v25 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%{public}@Initialized Power Manager.", buf, 0xCu);

  }
  return v16;
}

- (void)dealloc
{
  unsigned int *p_systemPowerNotifier;
  IOReturn v4;
  IOReturn v5;
  HAPPowerManager *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  IONotificationPort *systemPowerPort;
  io_connect_t systemPowerMgr;
  kern_return_t v14;
  kern_return_t v15;
  HAPPowerManager *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  HAPPowerManager *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  __CFString *v26;
  void *v27;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  IOReturn v32;

  p_systemPowerNotifier = &self->_systemPowerNotifier;
  if (self->_systemPowerNotifier)
  {
    v4 = IODeregisterForSystemPower(&self->_systemPowerNotifier);
    if (v4)
    {
      v5 = v4;
      v6 = self;
      v8 = sub_10007CCE4((uint64_t)v6, v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = sub_10007CD2C(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        *(_DWORD *)buf = 138543618;
        v30 = v11;
        v31 = 1024;
        v32 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to deregister from system power with error: %d", buf, 0x12u);

      }
    }
    *p_systemPowerNotifier = 0;
  }
  systemPowerPort = self->_systemPowerPort;
  if (systemPowerPort)
  {
    IONotificationPortDestroy(systemPowerPort);
    self->_systemPowerPort = 0;
  }
  systemPowerMgr = self->_systemPowerMgr;
  if (systemPowerMgr)
  {
    v14 = IOServiceClose(systemPowerMgr);
    if (v14)
    {
      v15 = v14;
      v16 = self;
      v18 = sub_10007CCE4((uint64_t)v16, v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = sub_10007CD2C(v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        *(_DWORD *)buf = 138543618;
        v30 = v21;
        v31 = 1024;
        v32 = v15;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to close power IO Service with error: %d", buf, 0x12u);

      }
    }
    self->_systemPowerMgr = 0;
  }
  v22 = self;
  v24 = sub_10007CCE4((uint64_t)v22, v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = sub_10007CD2C(v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    *(_DWORD *)buf = 138543362;
    v30 = v27;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%{public}@Deallocating Power Manager", buf, 0xCu);

  }
  v28.receiver = v22;
  v28.super_class = (Class)HAPPowerManager;
  -[HAPPowerManager dealloc](&v28, "dealloc");
}

- (void)registerForSleepWake:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079DBC;
  block[3] = &unk_100236EA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);

}

- (void)deRegisterFromSleepWake:(id)a3
{
  id v4;
  OS_dispatch_queue *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100079E94;
  v7[3] = &unk_100236AD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);

}

- (void)systemPowerChanged:(unsigned int)a3 notificationID:(void *)a4
{
  uint64_t v5;
  HAPPowerManager *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSMapTable *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  IOReturn v23;
  IOReturn v24;
  HAPPowerManager *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  __CFString *v29;
  void *v30;
  id v31;
  void *v32;
  int v33;
  void *v34;
  _QWORD block[4];
  id v36;
  uint64_t v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  IOReturn v43;

  v5 = *(_QWORD *)&a3;
  v6 = self;
  v8 = sub_10007CCE4((uint64_t)v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = sub_10007CD2C(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = sub_10007A1AC(v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)buf = 138543618;
    v39 = v11;
    v40 = 2112;
    v41 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@System power changed: %@", buf, 0x16u);

  }
  switch((_DWORD)v5)
  {
    case 0xE0000270:
      goto LABEL_14;
    case 0xE0000320:
      v14 = 2;
      v15 = -[HAPPowerManager delegatesMap](v6, "delegatesMap", 0, a4);
      break;
    case 0xE0000280:
      v14 = 1;
      v15 = -[HAPPowerManager delegatesMap](v6, "delegatesMap", 1, a4);
      break;
    default:
      return;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "keyEnumerator"));

  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "nextObject"));
  if (v18)
  {
    v19 = (void *)v18;
    do
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[HAPPowerManager delegatesMap](v6, "delegatesMap"));
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", v19));

      if (v21)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10007A218;
        block[3] = &unk_100237DC0;
        v36 = v19;
        v37 = v14;
        dispatch_async(v21, block);

      }
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "nextObject"));

      v19 = (void *)v22;
    }
    while (v22);
  }

  a4 = v34;
  if (v33)
  {
LABEL_14:
    v23 = IOAllowPowerChange(-[HAPPowerManager systemPowerMgr](v6, "systemPowerMgr"), (intptr_t)a4);
    if (v23)
    {
      v24 = v23;
      v25 = v6;
      v27 = sub_10007CCE4((uint64_t)v25, v26);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = sub_10007CD2C(v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v31 = sub_10007A1AC(v5);
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        *(_DWORD *)buf = 138543874;
        v39 = v30;
        v40 = 2112;
        v41 = v32;
        v42 = 1024;
        v43 = v24;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}@Falied to allow for %@ with error: %d", buf, 0x1Cu);

      }
    }
  }
}

+ (id)logCategory
{
  if (qword_1002716F0 != -1)
    dispatch_once(&qword_1002716F0, &stru_100237DE0);
  return (id)qword_1002716F8;
}

- (unsigned)systemPowerMgr
{
  return self->_systemPowerMgr;
}

- (IONotificationPort)systemPowerPort
{
  return self->_systemPowerPort;
}

- (unsigned)systemPowerNotifier
{
  return self->_systemPowerNotifier;
}

- (NSMapTable)delegatesMap
{
  return self->_delegatesMap;
}

- (void)setDelegatesMap:(id)a3
{
  objc_storeStrong((id *)&self->_delegatesMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegatesMap, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
