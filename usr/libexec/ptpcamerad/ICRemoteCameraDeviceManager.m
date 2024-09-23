@implementation ICRemoteCameraDeviceManager

- (id)initManaging:(id)a3 systemDaemon:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  ICRemoteCameraDeviceManager *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *remoteManagerConnections;
  NSMutableArray *v10;
  NSMutableArray *remoteCameraDevices;
  NSMutableDictionary *v12;
  NSMutableDictionary *osTransactions;
  objc_super v15;

  v4 = a4;
  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICRemoteCameraDeviceManager;
  v7 = -[ICRemoteCameraDeviceManager init](&v15, "init");
  if (v7)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    remoteManagerConnections = v7->_remoteManagerConnections;
    v7->_remoteManagerConnections = v8;

    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    remoteCameraDevices = v7->_remoteCameraDevices;
    v7->_remoteCameraDevices = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    osTransactions = v7->_osTransactions;
    v7->_osTransactions = v12;

    v7->_remoteManagerConnectionsLock._os_unfair_lock_opaque = 0;
    v7->_remoteCameraDevicesLock._os_unfair_lock_opaque = 0;
    -[ICRemoteCameraDeviceManager setSystemDaemon:](v7, "setSystemDaemon:", v4);
    -[ICRemoteCameraDeviceManager setManagedObjectName:](v7, "setManagedObjectName:", v6);
  }

  return v7;
}

- (void)dealloc
{
  NSMutableDictionary *remoteManagerConnections;
  objc_super v4;

  if (self->_remoteManagerConnections)
  {
    -[ICRemoteCameraDeviceManager removeRemoteManagerConnectionWithProcessIdentifier:](self, "removeRemoteManagerConnectionWithProcessIdentifier:", 0xFFFFFFFFLL);
    remoteManagerConnections = self->_remoteManagerConnections;
    self->_remoteManagerConnections = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)ICRemoteCameraDeviceManager;
  -[ICRemoteCameraDeviceManager dealloc](&v4, "dealloc");
}

- (id)remoteDeviceForUUID:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = -[NSMutableArray copy](self->_remoteCameraDevices, "copy");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uuidString", (_QWORD)v14));
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)remoteDeviceForPrimaryIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = -[NSMutableArray copy](self->_remoteCameraDevices, "copy");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "primaryIdentifierString", (_QWORD)v14));
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)removeRemoteCameraDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;

  v4 = a3;
  os_unfair_lock_lock(&self->_remoteCameraDevicesLock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDeviceManager remoteDeviceForPrimaryIdentifier:](self, "remoteDeviceForPrimaryIdentifier:", v4));
  if (v5)
  {
    v6 = objc_autoreleasePoolPush();
    __ICOSLogCreate();
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDeviceManager managedObjectName](self, "managedObjectName"));
    if ((unint64_t)objc_msgSend(v7, "length") >= 0x15)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", 0, 18));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR("..")));

      v7 = (void *)v9;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("close device")));
    v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_retainAutorelease(v7);
      v13 = v11;
      v16 = 136446466;
      v17 = objc_msgSend(v12, "UTF8String");
      v18 = 2114;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v16, 0x16u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuidString"));
    -[ICRemoteCameraDeviceManager closeDevice:](self, "closeDevice:", v14);

    objc_autoreleasePoolPop(v6);
  }
  os_unfair_lock_unlock(&self->_remoteCameraDevicesLock);

  return v5 != 0;
}

- (BOOL)addRemoteCameraDevice:(id)a3 uuidString:(id)a4 deviceName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  ICRemoteCameraDeviceProxy *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_unfair_lock_lock(&self->_remoteCameraDevicesLock);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDeviceManager remoteDeviceForPrimaryIdentifier:](self, "remoteDeviceForPrimaryIdentifier:", v8));

  if (!v11)
  {
    v12 = -[ICRemoteCameraDeviceProxy initWithPrimaryIdentifierString:uuidString:localizedName:]([ICRemoteCameraDeviceProxy alloc], "initWithPrimaryIdentifierString:uuidString:localizedName:", v8, v9, v10);
    -[NSMutableArray addObject:](self->_remoteCameraDevices, "addObject:", v12);

  }
  os_unfair_lock_unlock(&self->_remoteCameraDevicesLock);

  return v11 == 0;
}

- (void)notifyClientDeviceAdded:(id)a3 uuidString:(id)a4 deviceName:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  os_unfair_lock_t lock;
  id v20;
  void *v21;
  NSMutableDictionary *obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v8 = a3;
  if (-[ICRemoteCameraDeviceManager addRemoteCameraDevice:uuidString:deviceName:](self, "addRemoteCameraDevice:uuidString:deviceName:", v8, a4, a5))
  {
    v20 = v8;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDeviceManager remoteDeviceForPrimaryIdentifier:](self, "remoteDeviceForPrimaryIdentifier:", v8));
    lock = &self->_remoteManagerConnectionsLock;
    os_unfair_lock_lock(&self->_remoteManagerConnectionsLock);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = self->_remoteManagerConnections;
    v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(obj);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteManagerConnections, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v12), lock));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ICRemoteManagerConnection")));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ICRemoteManagerAuthorized")));
          v16 = objc_msgSend(v15, "BOOLValue");

          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", &stru_1000490D8));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "deviceContext"));
            objc_msgSend(v17, "notifyAddedDevice:", v18);

          }
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v10);
    }

    os_unfair_lock_unlock(lock);
    v8 = v20;
  }

}

- (void)notifyClientDeviceRemoved:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  os_unfair_lock_t lock;
  id v16;
  void *v17;
  NSMutableDictionary *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDeviceManager remoteDeviceForPrimaryIdentifier:](self, "remoteDeviceForPrimaryIdentifier:", v4));
  if (v17)
  {
    lock = &self->_remoteManagerConnectionsLock;
    v16 = v4;
    os_unfair_lock_lock(&self->_remoteManagerConnectionsLock);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = self->_remoteManagerConnections;
    v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(obj);
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteManagerConnections, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v8), lock));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ICRemoteManagerConnection")));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ICRemoteManagerAuthorized")));
          v12 = objc_msgSend(v11, "BOOLValue");

          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", &stru_1000490F8));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceContext"));
            objc_msgSend(v13, "notifyRemovedDevice:", v14);

          }
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v6);
    }

    os_unfair_lock_unlock(lock);
    v4 = v16;
    -[ICRemoteCameraDeviceManager removeRemoteCameraDevice:](self, "removeRemoteCameraDevice:", v16);
  }

}

- (void)requestDeviceListWithOptions:(id)a3 reply:(id)a4
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002CEF0;
  v5[3] = &unk_100048958;
  v5[4] = self;
  v6 = a4;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)openDevice:(id)a3 withReply:(id)a4
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D1F8;
  block[3] = &unk_1000488E0;
  block[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)closeDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDeviceManager remoteDeviceForUUID:](self, "remoteDeviceForUUID:", v4));
  if (v6)
  {
    __ICOSLogCreate();
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDeviceManager managedObjectName](self, "managedObjectName"));
    if ((unint64_t)objc_msgSend(v7, "length") >= 0x15)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", 0, 18));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR("..")));

      v7 = (void *)v9;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("close: %@"), v4));
    v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_retainAutorelease(v7);
      v13 = v11;
      *(_DWORD *)buf = 136446466;
      v16 = objc_msgSend(v12, "UTF8String");
      v17 = 2114;
      v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "camera"));
    objc_msgSend(v14, "removeAllSessions");

    -[NSMutableArray removeObject:](self->_remoteCameraDevices, "removeObject:", v6);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)ejectDevice:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)addSelectorToInterface:(id)a3 selectorString:(id)a4 origin:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  NSString *v8;
  uint64_t v9;
  SEL v10;
  id v11;

  v5 = a5;
  v7 = qword_10005F4F0;
  v8 = (NSString *)a4;
  v11 = a3;
  if (v7 != -1)
    dispatch_once(&qword_10005F4F0, &stru_100049118);
  v9 = qword_10005F4E8;
  v10 = NSSelectorFromString(v8);

  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v9, v10, 0, v5);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;

  v5 = a4;
  __ICOSLogCreate();
  v6 = CFSTR("remoteManager");
  if ((unint64_t)objc_msgSend(CFSTR("remoteManager"), "length") >= 0x15)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("remoteManager"), "substringWithRange:", 0, 18));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("..")));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("New Connection: %d"), objc_msgSend(v5, "processIdentifier")));
  v9 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_retainAutorelease(v6);
    v11 = v9;
    *(_DWORD *)buf = 136446466;
    v16 = -[__CFString UTF8String](v10, "UTF8String");
    v17 = 2114;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___ICXPCDeviceManagerProtocol));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___ICXPCDeviceManagerProtocol));
  -[ICRemoteCameraDeviceManager addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v12, CFSTR("requestDeviceListWithOptions:reply:"), 1);
  -[ICRemoteCameraDeviceManager addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v12, CFSTR("openDevice:withReply:"), 1);
  -[ICRemoteCameraDeviceManager addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v12, CFSTR("closeDevice:withReply:"), 1);
  -[ICRemoteCameraDeviceManager addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v13, CFSTR("notifyAddedDevice:"), 0);
  -[ICRemoteCameraDeviceManager addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v13, CFSTR("notifyRemovedDevice:"), 0);
  objc_msgSend(v5, "setExportedInterface:", v12);
  objc_msgSend(v5, "setRemoteObjectInterface:", v13);
  objc_msgSend(v5, "setExportedObject:", self);
  -[ICRemoteCameraDeviceManager addRemoteManagerConnection:](self, "addRemoteManagerConnection:", v5);
  objc_msgSend(v5, "resume");

  return 1;
}

- (void)addRemoteManagerConnection:(id)a3
{
  id v4;
  ICRemoteCameraDeviceManager *v5;
  void *v6;
  __SecTask *v7;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  CFErrorRef error[5];
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  ICRemoteCameraDeviceManager *v26;
  audit_token_t token;

  v4 = a3;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_10002E18C;
  v25[4] = sub_10002E19C;
  v5 = self;
  v26 = v5;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002E1A4;
  v22[3] = &unk_100049140;
  v24 = v25;
  v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "processIdentifier")));
  v23 = v20;
  objc_msgSend(v4, "setInvalidationHandler:", v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "invalidationHandler"));
  objc_msgSend(v4, "setInterruptionHandler:", v6);

  memset(&error[1], 0, 32);
  if (v4)
    objc_msgSend(v4, "auditToken");
  token = *(audit_token_t *)&error[1];
  v7 = SecTaskCreateWithAuditToken(0, &token);
  error[0] = 0;
  v8 = (__CFString *)SecTaskCopySigningIdentifier(v7, error);
  if (v7)
    CFRelease(v7);
  os_unfair_lock_lock(&v5->_remoteManagerConnectionsLock);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%05d-%@"), objc_msgSend(v4, "processIdentifier"), v8)));
  v10 = (void *)os_transaction_create(objc_msgSend(v9, "UTF8String"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_osTransactions, "setObject:forKeyedSubscript:", v10, v9);
  __ICOSLogCreate();
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDeviceManager managedObjectName](v5, "managedObjectName"));
  if ((unint64_t)objc_msgSend(v11, "length") >= 0x15)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringWithRange:", 0, 18));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", CFSTR("..")));

    v11 = (void *)v13;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDeviceManager osTransactions](v5, "osTransactions"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allKeys"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("+ %@:[%05lu]"), v9, objc_msgSend(v15, "count")));

  v17 = (id)_gICOSLog;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    token.val[0] = 136446466;
    *(_QWORD *)&token.val[1] = v18;
    LOWORD(token.val[3]) = 2114;
    *(_QWORD *)((char *)&token.val[3] + 2) = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&token, 0x16u);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v4, CFSTR("ICRemoteManagerConnection"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("ICRemoteManagerAuthorized"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_remoteManagerConnections, "setObject:forKeyedSubscript:", v19, v9);
  os_unfair_lock_unlock(&v5->_remoteManagerConnectionsLock);

  _Block_object_dispose(v25, 8);
}

- (void)removeRemoteManagerConnectionWithProcessIdentifier:(int)a3
{
  ICRemoteCameraDeviceManager *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  ICRemoteCameraDeviceManager *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  ICRemoteCameraDeviceManager *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  id v44;
  os_unfair_lock_t lock;
  uint64_t v46;
  id v47;
  int v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  id v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];

  v4 = self;
  lock = &self->_remoteManagerConnectionsLock;
  os_unfair_lock_lock(&self->_remoteManagerConnectionsLock);
  v5 = -[NSMutableDictionary copy](v4->_remoteManagerConnections, "copy");
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v55;
    v48 = a3;
    v46 = *(_QWORD *)v55;
    v47 = v6;
    do
    {
      v10 = 0;
      v49 = v8;
      do
      {
        if (*(_QWORD *)v55 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ICRemoteManagerConnection")));
        v14 = objc_msgSend(v13, "processIdentifier");
        if (a3 == -1 || v14 == a3)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDeviceManager osTransactions](v4, "osTransactions"));
          objc_msgSend(v15, "removeObjectForKey:", v11);

          __ICOSLogCreate();
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDeviceManager managedObjectName](v4, "managedObjectName"));
          if ((unint64_t)objc_msgSend(v16, "length") >= 0x15)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "substringWithRange:", 0, 18));
            v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", CFSTR("..")));

            v16 = (void *)v18;
          }
          v19 = v4;
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDeviceManager osTransactions](v4, "osTransactions"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allKeys"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("- %@:[%05lu]"), v11, objc_msgSend(v21, "count")));

          v23 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v24 = objc_retainAutorelease(v16);
            v25 = v23;
            v26 = objc_msgSend(v24, "UTF8String");
            *(_DWORD *)buf = 136446466;
            v60 = v26;
            v61 = 2114;
            v62 = v22;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

          }
          objc_msgSend(v13, "setInvalidationHandler:", 0);
          objc_msgSend(v13, "setInterruptionHandler:", 0);
          objc_msgSend(v13, "invalidate");
          v4 = v19;
          -[NSMutableDictionary removeObjectForKey:](v19->_remoteManagerConnections, "removeObjectForKey:", v11);
          a3 = v48;
          v9 = v46;
          v6 = v47;
          v8 = v49;
        }

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    }
    while (v8);
  }

  if (v4->_systemDaemon && !-[NSMutableDictionary count](v4->_remoteManagerConnections, "count"))
  {
    v27 = v4;
    v28 = -[NSMutableArray copy](v4->_remoteCameraDevices, "copy");
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v29 = v28;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(_QWORD *)v51 != v32)
            objc_enumerationMutation(v29);
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i), "camera"));
          objc_msgSend(v34, "closeDevice");

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      }
      while (v31);
    }

    os_unfair_lock_unlock(lock);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDeviceManager managedObjectName](v27, "managedObjectName"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-[D]"), v35));

    __ICOSLogCreate();
    v37 = v36;
    v38 = v37;
    if ((unint64_t)objc_msgSend(v37, "length") >= 0x15)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "substringWithRange:", 0, 18));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "stringByAppendingString:", CFSTR("..")));

    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Exiting %@"), v37));
    v41 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v42 = objc_retainAutorelease(v38);
      v43 = v41;
      v44 = objc_msgSend(v42, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v60 = v44;
      v61 = 2114;
      v62 = v40;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    exit(0);
  }
  os_unfair_lock_unlock(lock);

}

- (void)updateRemoteManagerConnectionWithProcessIdentifier:(int)a3 authorized:(BOOL)a4
{
  os_unfair_lock_s *p_remoteManagerConnectionsLock;
  NSMutableDictionary *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v15 = a4;
  p_remoteManagerConnectionsLock = &self->_remoteManagerConnectionsLock;
  os_unfair_lock_lock(&self->_remoteManagerConnectionsLock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_remoteManagerConnections;
  v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteManagerConnections, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i)));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ICRemoteManagerConnection")));
        if (objc_msgSend(v13, "processIdentifier") == a3)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v15));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("ICRemoteManagerAuthorized"));

          goto LABEL_11;
        }

      }
      v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_remoteManagerConnectionsLock);
}

- (BOOL)remoteManagerConnectionWithProcessIdentifierAuthorized:(int)a3
{
  os_unfair_lock_s *p_remoteManagerConnectionsLock;
  NSMutableDictionary *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  p_remoteManagerConnectionsLock = &self->_remoteManagerConnectionsLock;
  os_unfair_lock_lock(&self->_remoteManagerConnectionsLock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_remoteManagerConnections;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteManagerConnections, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), (_QWORD)v16));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ICRemoteManagerConnection")));
        if (objc_msgSend(v12, "processIdentifier") == a3)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ICRemoteManagerAuthorized")));
          v13 = objc_msgSend(v14, "BOOLValue");

          goto LABEL_11;
        }

      }
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  os_unfair_lock_unlock(p_remoteManagerConnectionsLock);
  return v13;
}

- (NSMutableDictionary)remoteManagerConnections
{
  return self->_remoteManagerConnections;
}

- (void)setRemoteManagerConnections:(id)a3
{
  objc_storeStrong((id *)&self->_remoteManagerConnections, a3);
}

- (NSMutableArray)remoteCameraDevices
{
  return self->_remoteCameraDevices;
}

- (void)setRemoteCameraDevices:(id)a3
{
  objc_storeStrong((id *)&self->_remoteCameraDevices, a3);
}

- (NSMutableDictionary)osTransactions
{
  return self->_osTransactions;
}

- (void)setOsTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_osTransactions, a3);
}

- (BOOL)systemDaemon
{
  return self->_systemDaemon;
}

- (void)setSystemDaemon:(BOOL)a3
{
  self->_systemDaemon = a3;
}

- (NSString)managedObjectName
{
  return self->_managedObjectName;
}

- (void)setManagedObjectName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (os_unfair_lock_s)remoteManagerConnectionsLock
{
  return self->_remoteManagerConnectionsLock;
}

- (void)setRemoteManagerConnectionsLock:(os_unfair_lock_s)a3
{
  self->_remoteManagerConnectionsLock = a3;
}

- (os_unfair_lock_s)remoteCameraDevicesLock
{
  return self->_remoteCameraDevicesLock;
}

- (void)setRemoteCameraDevicesLock:(os_unfair_lock_s)a3
{
  self->_remoteCameraDevicesLock = a3;
}

- (BOOL)startDeviceNotifications
{
  return self->_startDeviceNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectName, 0);
  objc_storeStrong((id *)&self->_osTransactions, 0);
  objc_storeStrong((id *)&self->_remoteCameraDevices, 0);
  objc_storeStrong((id *)&self->_remoteManagerConnections, 0);
}

@end
