@implementation DataStreamBulkSendProtocol

- (DataStreamBulkSendProtocol)initWithQueue:(id)a3 accessory:(id)a4 logIdentifier:(id)a5
{
  return -[DataStreamBulkSendProtocol initWithQueue:accessory:logIdentifier:bulkSendSessionContextFactory:](self, "initWithQueue:accessory:logIdentifier:bulkSendSessionContextFactory:", a3, a4, a5, &stru_1002371E0);
}

- (DataStreamBulkSendProtocol)initWithQueue:(id)a3 accessory:(id)a4 logIdentifier:(id)a5 bulkSendSessionContextFactory:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  DataStreamBulkSendProtocol *v15;
  DataStreamBulkSendProtocol *v16;
  uint64_t v17;
  NSMapTable *listeners;
  uint64_t v19;
  NSMapTable *activeBulkSendSessions;
  id v21;
  id bulkSendSessionContextFactory;
  NSMutableDictionary *v23;
  NSMutableDictionary *pendingBulkSendSessionContextBySessionIdentifier;
  NSString *v25;
  NSString *logIdentifier;
  objc_super v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v28.receiver = self;
  v28.super_class = (Class)DataStreamBulkSendProtocol;
  v15 = -[DataStreamBulkSendProtocol init](&v28, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeWeak(&v16->_accessory, v12);
    v17 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    listeners = v16->_listeners;
    v16->_listeners = (NSMapTable *)v17;

    v19 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    activeBulkSendSessions = v16->_activeBulkSendSessions;
    v16->_activeBulkSendSessions = (NSMapTable *)v19;

    v16->_isConnected = 0;
    v16->_nextSessionIdentifier = 1;
    v21 = objc_retainBlock(v14);
    bulkSendSessionContextFactory = v16->_bulkSendSessionContextFactory;
    v16->_bulkSendSessionContextFactory = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingBulkSendSessionContextBySessionIdentifier = v16->_pendingBulkSendSessionContextBySessionIdentifier;
    v16->_pendingBulkSendSessionContextBySessionIdentifier = v23;

    v25 = (NSString *)objc_msgSend(v13, "copy");
    logIdentifier = v16->_logIdentifier;
    v16->_logIdentifier = v25;

  }
  return v16;
}

+ (id)protocolName
{
  return CFSTR("dataSend");
}

- (void)addListener:(id)a3 fileType:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  DataStreamBulkSendProtocol *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = -[DataStreamBulkSendProtocol isActive](self, "isActive");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol listeners](self, "listeners"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v7));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol accessory](self, "accessory"));
  if (v10)
  {
    v12 = self;
    v14 = sub_10007CCE4((uint64_t)v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = sub_10007CD2C(v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v19 = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@Rejecting BulkSend registration for file type %@; handler already exists",
        (uint8_t *)&v19,
        0x16u);

    }
    objc_msgSend(v6, "accessoryDidCloseDataStream:", v11);
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol listeners](self, "listeners"));
    objc_msgSend(v18, "setObject:forKey:", v6, v7);

    if (-[DataStreamBulkSendProtocol isConnected](self, "isConnected"))
      objc_msgSend(v6, "accessoryDidStartListening:", v11);
    -[DataStreamBulkSendProtocol _notifyActiveStatusChangedFromPreviousValue:](self, "_notifyActiveStatusChangedFromPreviousValue:", v8);
  }

}

- (void)removeListener:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = -[DataStreamBulkSendProtocol isActive](self, "isActive");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol listeners](self, "listeners", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keyEnumerator"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol listeners](self, "listeners"));
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v12));

        if (v14 == v4)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol listeners](self, "listeners"));
          objc_msgSend(v15, "removeObjectForKey:", v12);

          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol accessory](self, "accessory"));
  objc_msgSend(v4, "accessoryDidCloseDataStream:", v16);

  -[DataStreamBulkSendProtocol _notifyActiveStatusChangedFromPreviousValue:](self, "_notifyActiveStatusChangedFromPreviousValue:", v5);
}

- (void)_notifyActiveStatusChangedFromPreviousValue:(BOOL)a3
{
  DataStreamBulkSendProtocol *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;

  if (-[DataStreamBulkSendProtocol isActive](self, "isActive") != a3)
  {
    v4 = self;
    v6 = sub_10007CCE4((uint64_t)v4, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = sub_10007CD2C(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = HMFBooleanToString(-[DataStreamBulkSendProtocol isActive](v4, "isActive"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v13 = 138543618;
      v14 = v9;
      v15 = 2112;
      v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@BulkSend protocol changes active to %@", (uint8_t *)&v13, 0x16u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol dataStream](v4, "dataStream"));
    objc_msgSend(v12, "protocolDidUpdateActiveStatus:", v4);

  }
}

- (void)_closeAllSessionsWithError:(id)a3
{
  id v4;
  DataStreamBulkSendProtocol *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  NSErrorUserInfoKey v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;

  v4 = a3;
  v5 = self;
  v7 = sub_10007CCE4((uint64_t)v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = sub_10007CD2C(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol listeners](v5, "listeners"));
    v12 = objc_msgSend(v11, "count");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol activeBulkSendSessions](v5, "activeBulkSendSessions"));
    *(_DWORD *)buf = 138543874;
    v46 = v10;
    v47 = 2048;
    v48 = v12;
    v49 = 2048;
    v50 = objc_msgSend(v13, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}@Session closed; removing %lu listeners and closing %lu sessions",
      buf,
      0x20u);

  }
  -[DataStreamBulkSendProtocol setIsConnected:](v5, "setIsConnected:", 0);
  if (v4)
  {
    v43 = NSUnderlyingErrorKey;
    v44 = v4;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -1005, v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol accessory](v5, "accessory"));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol activeBulkSendSessions](v5, "activeBulkSendSessions"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectEnumerator"));

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v38;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v22);
        if (v23)
          objc_msgSend(v23, "asyncHandleRemoteCloseWithError:", v15);
        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v20);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol listeners](v5, "listeners", 0));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectEnumerator"));

  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v34;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v34 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v29);
        if (v30)
          objc_msgSend(v30, "accessoryDidCloseDataStream:", v16);
        v29 = (char *)v29 + 1;
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v27);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol listeners](v5, "listeners"));
  objc_msgSend(v31, "removeAllObjects");

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol activeBulkSendSessions](v5, "activeBulkSendSessions"));
  objc_msgSend(v32, "removeAllObjects");

}

- (BOOL)isActive
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol listeners](self, "listeners"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)dataStream:(id)a3 didFailWithError:(id)a4
{
  id v5;
  DataStreamBulkSendProtocol *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;

  v5 = a4;
  v6 = self;
  v8 = sub_10007CCE4((uint64_t)v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = sub_10007CD2C(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@DataStream failed with error; cleaning up. (%@)",
      (uint8_t *)&v12,
      0x16u);

  }
  -[DataStreamBulkSendProtocol _closeAllSessionsWithError:](v6, "_closeAllSessionsWithError:", v5);

}

- (void)dataStreamInitiatedClose:(id)a3
{
  DataStreamBulkSendProtocol *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = self;
  v5 = sub_10007CCE4((uint64_t)v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = sub_10007CD2C(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = 138543362;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@DataStream initiated closing...", (uint8_t *)&v9, 0xCu);

  }
}

- (void)dataStreamDidClose:(id)a3
{
  DataStreamBulkSendProtocol *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = self;
  v5 = sub_10007CCE4((uint64_t)v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = sub_10007CD2C(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = 138543362;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@DataStream closed; cleaning up",
      (uint8_t *)&v9,
      0xCu);

  }
  -[DataStreamBulkSendProtocol _closeAllSessionsWithError:](v3, "_closeAllSessionsWithError:", 0);
}

- (void)dataStreamDidOpen:(id)a3
{
  DataStreamBulkSendProtocol *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;

  v3 = self;
  v5 = sub_10007CCE4((uint64_t)v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = sub_10007CD2C(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 138543362;
    v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}@DataStream did open; connected.",
      buf,
      0xCu);

  }
  -[DataStreamBulkSendProtocol setIsConnected:](v3, "setIsConnected:", 1);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol listeners](v3, "listeners", 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectEnumerator"));

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v14);
        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol accessory](v3, "accessory"));
          objc_msgSend(v15, "accessoryDidStartListening:", v16);

        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

}

- (void)dataStream:(id)a3 didReceiveEvent:(id)a4 header:(id)a5 payload:(id)a6
{
  id v8;
  id v9;
  DataStreamBulkSendProtocol *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  id v20;
  __CFString *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;

  v8 = a4;
  v9 = a6;
  if (!-[DataStreamBulkSendProtocol isConnected](self, "isConnected"))
  {
    v10 = self;
    v12 = sub_10007CCE4((uint64_t)v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = sub_10007CD2C(v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v22 = 138543618;
      v23 = v15;
      v24 = 2112;
      v25 = v8;
      v16 = "%{public}@BulkSend dropping message because it is not running (topic=%@).";
      v17 = v13;
      v18 = OS_LOG_TYPE_DEBUG;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, (uint8_t *)&v22, 0x16u);

    }
LABEL_11:

    goto LABEL_12;
  }
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("data")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("close")))
    {
      -[DataStreamBulkSendProtocol _handleCloseMessage:](self, "_handleCloseMessage:", v9);
      goto LABEL_12;
    }
    v10 = self;
    v20 = sub_10007CCE4((uint64_t)v10, v19);
    v13 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v21 = sub_10007CD2C(v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v22 = 138543618;
      v23 = v15;
      v24 = 2112;
      v25 = v8;
      v16 = "%{public}@DataSend received unexpected event '%@'";
      v17 = v13;
      v18 = OS_LOG_TYPE_INFO;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  -[DataStreamBulkSendProtocol _handleDataMessage:](self, "_handleDataMessage:", v9);
LABEL_12:

}

- (void)dataStream:(id)a3 didReceiveRequest:(id)a4 header:(id)a5 payload:(id)a6
{
  id v9;
  id v10;
  id v11;
  DataStreamBulkSendProtocol *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (-[DataStreamBulkSendProtocol isConnected](self, "isConnected"))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("open")))
    {
      -[DataStreamBulkSendProtocol _handleOpenWithRequestHeader:payload:](self, "_handleOpenWithRequestHeader:payload:", v10, v11);
    }
    else
    {
      v12 = self;
      v14 = sub_10007CCE4((uint64_t)v12, v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = sub_10007CD2C(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v18 = 138543618;
        v19 = v17;
        v20 = 2112;
        v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@DataSend received unexpected request '%@'", (uint8_t *)&v18, 0x16u);

      }
    }
  }

}

- (void)asyncBulkSendSessionCandidate:(id)a3 didAcceptOnQueue:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100045864;
  v15[3] = &unk_100237208;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)asyncBulkSendSessionCandidate:(id)a3 didRejectWithStatus:(unsigned __int16)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned __int16 v11;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045914;
  block[3] = &unk_100237230;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)asyncBulkSendSessionDidCancelSessionWithIdentifier:(id)a3 reason:(unsigned __int16)a4 hadReceivedEof:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  unsigned __int16 v18;
  BOOL v19;

  v10 = a3;
  v11 = a6;
  v12 = objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000459F8;
  v15[3] = &unk_100237258;
  v15[4] = self;
  v16 = v10;
  v18 = a4;
  v19 = a5;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, v15);

}

- (id)_createSessionCandidateWithRequestHeader:(id)a3 metadata:(id)a4
{
  id v6;
  DataStreamBulkSendProtocol *v7;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  DataStreamBulkSendSessionCandidate *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;

  v6 = a3;
  v7 = self;
  v8 = a4;
  v10 = sub_10007CCE4((uint64_t)v7, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = sub_10007CD2C(v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v16 = 138543618;
    v17 = v13;
    v18 = 2112;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@Creating new receive candidate session (header %@)", (uint8_t *)&v16, 0x16u);

  }
  v14 = -[DataStreamBulkSendSessionCandidate initWithProtocol:requestHeader:metadata:]([DataStreamBulkSendSessionCandidate alloc], "initWithProtocol:requestHeader:metadata:", v7, v6, v8);

  return v14;
}

- (id)_createSessionFromCandidate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  DataStreamBulkSendSession *v9;
  void *v10;
  DataStreamBulkSendSession *v11;
  DataStreamBulkSendProtocol *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol _createSessionIdentifier](self, "_createSessionIdentifier"));
  v9 = [DataStreamBulkSendSession alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol logIdentifier](self, "logIdentifier"));
  v11 = -[DataStreamBulkSendSession initWithProtocol:sessionIdentifier:queue:logIdentifier:](v9, "initWithProtocol:sessionIdentifier:queue:logIdentifier:", self, v8, v6, v10);

  v12 = self;
  v14 = sub_10007CCE4((uint64_t)v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = sub_10007CD2C(v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v21 = 138543618;
    v22 = v17;
    v23 = 2112;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}@Creating new receive session with streamIdentifier=%@", (uint8_t *)&v21, 0x16u);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol activeBulkSendSessions](v12, "activeBulkSendSessions"));
  objc_msgSend(v18, "setObject:forKey:", v11, v8);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "requestHeader"));
  -[DataStreamBulkSendProtocol _sendOpenResponseWithRequestHeader:streamIdentifier:](v12, "_sendOpenResponseWithRequestHeader:streamIdentifier:", v19, v8);

  return v11;
}

- (void)_sendOpenResponseWithRequestHeader:(id)a3 streamIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const __CFString *v9;
  id v10;

  v9 = CFSTR("streamId");
  v10 = a4;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));

  -[DataStreamBulkSendProtocol _sendOpenResponseWithRequestHeader:payload:status:](self, "_sendOpenResponseWithRequestHeader:payload:status:", v7, v8, 0);
}

- (void)_sendOpenResponseWithRequestHeader:(id)a3 bulkSendStatus:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v4 = a4;
  v9 = CFSTR("status");
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v4));
  v10 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));

  -[DataStreamBulkSendProtocol _sendOpenResponseWithRequestHeader:payload:status:](self, "_sendOpenResponseWithRequestHeader:payload:status:", v6, v8, 6);
}

- (void)_sendOpenResponseWithRequestHeader:(id)a3 payload:(id)a4 status:(unsigned __int16)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  DataStreamBulkSendProtocol *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  _QWORD v19[5];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol dataStream](self, "dataStream"));
  if (v10)
  {
    v11 = self;
    v13 = sub_10007CCE4((uint64_t)v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = sub_10007CD2C(v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = sub_10003D668(v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138543874;
      v21 = v16;
      v22 = 2112;
      v23 = v18;
      v24 = 2048;
      v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@Sending open response with status %@ (%ld)", buf, 0x20u);

    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100045FE0;
    v19[3] = &unk_100237150;
    v19[4] = v11;
    objc_msgSend(v10, "sendResponseForRequestHeader:payload:status:completion:", v8, v9, v5, v19);
  }

}

- (void)_sendOpenResponseWithRequestHeader:(id)a3 status:(unsigned __int16)a4
{
  -[DataStreamBulkSendProtocol _sendOpenResponseWithRequestHeader:payload:status:](self, "_sendOpenResponseWithRequestHeader:payload:status:", a3, &__NSDictionary0__struct, a4);
}

- (id)_createSessionIdentifier
{
  uint64_t v3;

  v3 = -[DataStreamBulkSendProtocol nextSessionIdentifier](self, "nextSessionIdentifier");
  -[DataStreamBulkSendProtocol setNextSessionIdentifier:](self, "setNextSessionIdentifier:", (v3 + 1));
  return +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3);
}

- (void)_startSessionCandidate:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol _createSessionFromCandidate:queue:](self, "_createSessionFromCandidate:queue:", v8, v9));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pendingReads"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        -[DataStreamBulkSendProtocol _pumpMessage:session:](self, "_pumpMessage:session:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v16), v11);
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v14);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "receivedFailure"));
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "receivedFailure"));
    -[DataStreamBulkSendProtocol _pumpReceiveFailure:session:](self, "_pumpReceiveFailure:session:", v18, v11);

  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100046358;
  v21[3] = &unk_100236E80;
  v22 = v11;
  v23 = v10;
  v19 = v11;
  v20 = v10;
  dispatch_async(v9, v21);

}

- (void)_rejectSessionCandidate:(id)a3 status:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;

  v4 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "requestHeader"));
  -[DataStreamBulkSendProtocol _sendOpenResponseWithRequestHeader:bulkSendStatus:](self, "_sendOpenResponseWithRequestHeader:bulkSendStatus:", v6, v4);

}

- (id)_getBulkSendSessionForSessionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol activeBulkSendSessions](self, "activeBulkSendSessions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

- (void)_removeBulkSendSessionForSessionIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol activeBulkSendSessions](self, "activeBulkSendSessions"));
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (void)_handleOpenWithRequestHeader:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  BOOL v23;
  DataStreamBulkSendProtocol *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  DataStreamBulkSendProtocol *v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  void *v42;
  int v43;
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type")));
  v10 = objc_opt_class(NSString, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
    v11 = v8;
  else
    v11 = 0;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("target")));
  v15 = objc_opt_class(NSString, v14);
  if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
    v16 = v13;
  else
    v16 = 0;
  v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("metadata")));
  v20 = objc_opt_class(NSDictionary, v19);
  if ((objc_opt_isKindOfClass(v18, v20) & 1) != 0)
    v21 = v18;
  else
    v21 = 0;
  v22 = v21;

  if (v12)
    v23 = v17 == 0;
  else
    v23 = 1;
  if (v23)
  {
    v24 = self;
    v26 = sub_10007CCE4((uint64_t)v24, v25);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = sub_10007CD2C(v24);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v43 = 138543874;
      v44 = v29;
      v45 = 2112;
      v46 = v12;
      v47 = 2112;
      v48 = v17;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%{public}@Dropping 'open' because it is missing required keys (type=%@, target=%@)", (uint8_t *)&v43, 0x20u);

    }
    -[DataStreamBulkSendProtocol _sendOpenResponseWithRequestHeader:status:](v24, "_sendOpenResponseWithRequestHeader:status:", v6, 4);
  }
  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol listeners](self, "listeners"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", v12));

    v32 = self;
    v34 = sub_10007CCE4((uint64_t)v32, v33);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    v36 = v35;
    if (v31)
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        v37 = sub_10007CD2C(v32);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        v43 = 138543618;
        v44 = v38;
        v45 = 2112;
        v46 = v12;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%{public}@Received 'open' with type=%@; passing to listener",
          (uint8_t *)&v43,
          0x16u);

      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol _createSessionCandidateWithRequestHeader:metadata:](v32, "_createSessionCandidateWithRequestHeader:metadata:", v6, v22));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol accessory](v32, "accessory"));
      objc_msgSend(v31, "accessory:didReceiveBulkSessionCandidate:", v40, v39);

    }
    else
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v41 = sub_10007CD2C(v32);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        v43 = 138543618;
        v44 = v42;
        v45 = 2112;
        v46 = v12;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%{public}@Received 'open' for type=%@ but no active listener accepted it", (uint8_t *)&v43, 0x16u);

      }
      -[DataStreamBulkSendProtocol _maybeSubmitMetricForDroppedOpenRequestOfType:](v32, "_maybeSubmitMetricForDroppedOpenRequestOfType:", v12);
      -[DataStreamBulkSendProtocol _sendOpenResponseWithRequestHeader:bulkSendStatus:](v32, "_sendOpenResponseWithRequestHeader:bulkSendStatus:", v6, 1);
    }

  }
}

- (void)_handleCloseMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _UNKNOWN **v14;
  void *v15;
  DataStreamBulkSendProtocol *v16;
  NSObject *v17;
  DataStreamBulkSendProtocol *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  __CFString *v23;
  DataStreamBulkSendProtocol *v24;
  uint64_t v25;
  id v26;
  __CFString *v27;
  __CFString *v28;
  DataStreamBulkSendProtocol *v29;
  int v30;
  DataStreamBulkSendProtocol *v31;
  __int16 v32;
  id v33;
  const __CFString *v34;
  _UNKNOWN **v35;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("streamId")));
  v7 = objc_opt_class(NSNumber, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    v8 = v5;
  else
    v8 = 0;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reason")));
  v12 = objc_opt_class(NSNumber, v11);
  if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
    v13 = v10;
  else
    v13 = 0;
  v14 = v13;

  if (!v9)
  {
    v16 = self;
    v26 = sub_10007CCE4((uint64_t)v16, v25);
    v17 = objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    v27 = sub_10007CD2C(v16);
    v18 = (DataStreamBulkSendProtocol *)objc_claimAutoreleasedReturnValue(v27);
    v30 = 138543362;
    v31 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@Close dropped because streamIdentifier was not included", (uint8_t *)&v30, 0xCu);
LABEL_20:

    goto LABEL_21;
  }
  if (v14)
    v14 = (_UNKNOWN **)v10;
  else
    v14 = &off_100245780;
  v34 = CFSTR("reason");
  v35 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
  v16 = (DataStreamBulkSendProtocol *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 28, v15));

  v17 = objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol _getBulkSendSessionForSessionIdentifier:](self, "_getBulkSendSessionForSessionIdentifier:", v9));
  v18 = self;
  v20 = sub_10007CCE4((uint64_t)v18, v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = v21;
  if (!v17)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v28 = sub_10007CD2C(v18);
      v29 = (DataStreamBulkSendProtocol *)objc_claimAutoreleasedReturnValue(v28);
      v30 = 138543618;
      v31 = v29;
      v32 = 2112;
      v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%{public}@Close packet for streamIdentifier=%@ dropped because no session is active", (uint8_t *)&v30, 0x16u);

    }
    goto LABEL_20;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v23 = sub_10007CD2C(v18);
    v24 = (DataStreamBulkSendProtocol *)objc_claimAutoreleasedReturnValue(v23);
    v30 = 138543618;
    v31 = v24;
    v32 = 2112;
    v33 = v9;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Received close packet for stream identifier: %@", (uint8_t *)&v30, 0x16u);

  }
  -[DataStreamBulkSendProtocol _pumpReceiveFailure:session:](v18, "_pumpReceiveFailure:session:", v16, v17);
LABEL_21:

}

- (void)_handleDataMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  DataStreamBulkSendProtocol *v10;
  uint64_t v11;
  id v12;
  DataStreamBulkSendProtocol *v13;
  __CFString *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  __CFString *v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  __int16 v22;
  id v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("streamId")));
  v7 = objc_opt_class(NSNumber, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    v8 = v5;
  else
    v8 = 0;
  v9 = v8;

  if (!v9)
  {
    v10 = self;
    v12 = sub_10007CCE4((uint64_t)v10, v11);
    v13 = (DataStreamBulkSendProtocol *)objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
    {
LABEL_12:

      goto LABEL_13;
    }
    v14 = sub_10007CD2C(v10);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v20 = 138543362;
    v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, &v13->super, OS_LOG_TYPE_ERROR, "%{public}@Data packet dropped because no session identifier was present", (uint8_t *)&v20, 0xCu);
LABEL_11:

    goto LABEL_12;
  }
  v10 = (DataStreamBulkSendProtocol *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol _getBulkSendSessionForSessionIdentifier:](self, "_getBulkSendSessionForSessionIdentifier:", v9));
  if (!v10)
  {
    v13 = self;
    v17 = sub_10007CCE4((uint64_t)v13, v16);
    v15 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v18 = sub_10007CD2C(v13);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v20 = 138543618;
      v21 = v19;
      v22 = 2112;
      v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}@Data packet for streamIdentifier=%@ dropped because no session is active", (uint8_t *)&v20, 0x16u);

    }
    goto LABEL_11;
  }
  -[DataStreamBulkSendProtocol _pumpMessage:session:](self, "_pumpMessage:session:", v4, v10);
LABEL_13:

}

- (void)_pumpMessage:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  DataStreamBulkSendProtocol *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  __CFString *v25;
  void *v26;
  int v27;
  void *v28;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("packets")));
  v10 = objc_opt_class(NSArray, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
    v11 = v8;
  else
    v11 = 0;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("endOfStream")));
  v15 = objc_opt_class(NSNumber, v14);
  if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
    v16 = v13;
  else
    v16 = 0;
  v17 = v16;

  if (!v17)
  {
    if (!v12)
      goto LABEL_15;
    v19 = 0;
    goto LABEL_13;
  }
  v18 = objc_msgSend(v17, "BOOLValue");
  v19 = (uint64_t)v18;
  if (v12)
  {
LABEL_13:
    v20 = objc_msgSend(v12, "count");
    if ((v19 & 1) != 0 || v20)
      goto LABEL_18;
    goto LABEL_15;
  }
  if ((v18 & 1) != 0)
  {
    v19 = 1;
LABEL_18:
    objc_msgSend(v6, "asyncHandleIncomingPackets:isEof:", v12, v19);
    goto LABEL_19;
  }
LABEL_15:
  v21 = self;
  v23 = sub_10007CCE4((uint64_t)v21, v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = sub_10007CD2C(v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = 138543362;
    v28 = v26;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%{public}@Received message with no packets", (uint8_t *)&v27, 0xCu);

  }
LABEL_19:

}

- (void)_pumpReceiveFailure:(id)a3 session:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(v6, "asyncHandleRemoteCloseWithError:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionIdentifier"));

  -[DataStreamBulkSendProtocol _removeBulkSendSessionForSessionIdentifier:](self, "_removeBulkSendSessionForSessionIdentifier:", v7);
}

- (void)_cancelSessionWithIdentifier:(id)a3 reason:(unsigned __int16)a4 hadReceivedEof:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v6;
  uint64_t v7;
  id v10;
  id v11;

  v6 = a5;
  v7 = a4;
  v10 = a6;
  v11 = a3;
  -[DataStreamBulkSendProtocol _removeBulkSendSessionForSessionIdentifier:](self, "_removeBulkSendSessionForSessionIdentifier:");
  if ((_DWORD)v7 || !v6)
    -[DataStreamBulkSendProtocol _sendCloseMessageWithIdentifier:reason:completion:](self, "_sendCloseMessageWithIdentifier:reason:completion:", v11, v7, v10);
  else
    -[DataStreamBulkSendProtocol _sendAckMessageWithIdentifier:completion:](self, "_sendAckMessageWithIdentifier:completion:", v11, v10);

}

- (void)_sendCloseMessageWithIdentifier:(id)a3 reason:(unsigned __int16)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  DataStreamBulkSendProtocol *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  void *v18;
  DataStreamBulkSendProtocol *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  __CFString *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int v30;
  _QWORD v31[2];
  _QWORD v32[2];

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol dataStream](self, "dataStream"));
  if (v10)
  {
    v31[0] = CFSTR("streamId");
    v31[1] = CFSTR("reason");
    v32[0] = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v6));
    v32[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2));

    v13 = self;
    v15 = sub_10007CCE4((uint64_t)v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = sub_10007CD2C(v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v25 = 138543874;
      v26 = v18;
      v27 = 2112;
      v28 = v8;
      v29 = 1024;
      v30 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@Sending 'close' for sid=%@ with reason %d", (uint8_t *)&v25, 0x1Cu);

    }
    objc_msgSend(v10, "sendEventForProtocol:topic:payload:completion:", CFSTR("dataSend"), CFSTR("close"), v12, v9);
  }
  else
  {
    v19 = self;
    v21 = sub_10007CCE4((uint64_t)v19, v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = sub_10007CD2C(v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = 138543362;
      v26 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@No data stream found", (uint8_t *)&v25, 0xCu);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 1, 0));
    v9[2](v9, v12);
  }

}

- (void)_sendAckMessageWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  DataStreamBulkSendProtocol *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  DataStreamBulkSendProtocol *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  _QWORD v26[2];
  _QWORD v27[2];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol dataStream](self, "dataStream"));
  if (v8)
  {
    v26[0] = CFSTR("streamId");
    v26[1] = CFSTR("endOfStream");
    v27[0] = v6;
    v27[1] = &__kCFBooleanTrue;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 2));
    v10 = self;
    v12 = sub_10007CCE4((uint64_t)v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = sub_10007CD2C(v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v22 = 138543618;
      v23 = v15;
      v24 = 2112;
      v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@Sending 'ack' for sid=%@", (uint8_t *)&v22, 0x16u);

    }
    objc_msgSend(v8, "sendEventForProtocol:topic:payload:completion:", CFSTR("dataSend"), CFSTR("ack"), v9, v7);
  }
  else
  {
    v16 = self;
    v18 = sub_10007CCE4((uint64_t)v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = sub_10007CD2C(v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = 138543362;
      v23 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@No data stream found", (uint8_t *)&v22, 0xCu);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 1, 0));
    v7[2](v7, v9);
  }

}

- (void)openSessionForFileType:(id)a3 reason:(id)a4 metadata:(id)a5 queue:(id)a6 callback:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol queue](self, "queue"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10004752C;
  v23[3] = &unk_100237280;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(v17, v23);

}

- (void)_openSessionForFileType:(id)a3 reason:(id)a4 metadata:(id)a5 queue:(id)a6 callback:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t (**v21)(_QWORD, _QWORD);
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  DataStreamBulkSendProtocol *v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  _QWORD v54[4];
  _QWORD v55[4];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol queue](self, "queue"));
  dispatch_assert_queue_V2(v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol _createSessionIdentifier](self, "_createSessionIdentifier"));
  v54[0] = CFSTR("type");
  v54[1] = CFSTR("streamId");
  v54[2] = CFSTR("target");
  v54[3] = CFSTR("reason");
  v43 = v12;
  v55[0] = v12;
  v55[1] = v18;
  v55[2] = CFSTR("controller");
  v55[3] = v13;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v55, v54, 4));
  v20 = objc_msgSend(v19, "mutableCopy");

  if (v14 && objc_msgSend(v14, "count"))
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, CFSTR("metadata"));
  v21 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol bulkSendSessionContextFactory](self, "bulkSendSessionContextFactory"));
  v22 = ((uint64_t (**)(_QWORD, id))v21)[2](v21, v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol pendingBulkSendSessionContextBySessionIdentifier](self, "pendingBulkSendSessionContextBySessionIdentifier"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v18);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "handleOpenRequestResponseTimer"));
  objc_msgSend(v25, "setDelegate:", self);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol queue](self, "queue"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "handleOpenRequestResponseTimer"));
  objc_msgSend(v27, "setDelegateQueue:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "handleOpenRequestResponseTimer"));
  objc_msgSend(v28, "resume");

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sendCloseEventTimer"));
  objc_msgSend(v29, "setDelegate:", self);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol queue](self, "queue"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sendCloseEventTimer"));
  objc_msgSend(v31, "setDelegateQueue:", v30);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sendCloseEventTimer"));
  objc_msgSend(v32, "resume");

  v33 = self;
  v35 = sub_10007CCE4((uint64_t)v33, v34);
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v37 = sub_10007CD2C(v33);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    *(_DWORD *)buf = 138543874;
    v49 = v38;
    v50 = 2112;
    v51 = v18;
    v52 = 2112;
    v53 = v14;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%{public}@Starting bulk session with identifier: %@ and metadata: %@", buf, 0x20u);

  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol dataStream](v33, "dataStream"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100047918;
  v44[3] = &unk_1002372E8;
  v44[4] = v33;
  v45 = v18;
  v46 = v15;
  v47 = v16;
  v40 = v15;
  v41 = v16;
  v42 = v18;
  objc_msgSend(v39, "sendRequestForProtocol:topic:payload:completion:", CFSTR("dataSend"), CFSTR("open"), v20, v44);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  DataStreamBulkSendProtocol *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  DataStreamBulkSendProtocol *v16;
  DataStreamBulkSendProtocol *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  __CFString *v21;
  void *v22;
  const char *v23;
  DataStreamBulkSendProtocol *v24;
  DataStreamBulkSendProtocol *v25;
  uint64_t v26;
  id v27;
  __CFString *v28;
  void *v29;
  NSObject *v30;
  DataStreamBulkSendProtocol *v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  __CFString *v35;
  void *v36;
  uint64_t v37;
  id v38;
  __CFString *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  DataStreamBulkSendProtocol *v48;
  _BYTE v49[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol pendingBulkSendSessionContextBySessionIdentifier](self, "pendingBulkSendSessionContextBySessionIdentifier", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (!v7)
    goto LABEL_10;
  v8 = v7;
  v9 = *(_QWORD *)v42;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v42 != v9)
        objc_enumerationMutation(v6);
      v11 = *(DataStreamBulkSendProtocol **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol pendingBulkSendSessionContextBySessionIdentifier](self, "pendingBulkSendSessionContextBySessionIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v11));

      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "handleOpenRequestResponseTimer"));
      if (v14 == v4)
      {
        objc_msgSend(v13, "setHandleOpenRequestResponseTimer:", 0);
        v16 = v11;
        v17 = self;
        v19 = sub_10007CCE4((uint64_t)v17, v18);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          goto LABEL_16;
        v21 = sub_10007CD2C(v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        *(_DWORD *)buf = 138543618;
        v46 = v22;
        v47 = 2112;
        v48 = v16;
        v23 = "%{public}@Session with identifier: %@ open request response timer has expired";
        goto LABEL_15;
      }
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sendCloseEventTimer"));

      if (v15 == v4)
      {
        objc_msgSend(v13, "setSendCloseEventTimer:", 0);
        v24 = v11;
        v25 = self;
        v27 = sub_10007CCE4((uint64_t)v25, v26);
        v20 = objc_claimAutoreleasedReturnValue(v27);
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          goto LABEL_16;
        v28 = sub_10007CD2C(v25);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v28);
        *(_DWORD *)buf = 138543618;
        v46 = v22;
        v47 = 2112;
        v48 = v24;
        v23 = "%{public}@Session with identifier: %@ send event close timer has expired";
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v23, buf, 0x16u);

LABEL_16:
        if (!v11)
          goto LABEL_20;
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol pendingBulkSendSessionContextBySessionIdentifier](self, "pendingBulkSendSessionContextBySessionIdentifier"));
        v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", v11));

        if (-[NSObject shouldCloseSessionWithTimeoutReason](v30, "shouldCloseSessionWithTimeoutReason"))
        {
          v31 = self;
          v33 = sub_10007CCE4((uint64_t)v31, v32);
          v34 = objc_claimAutoreleasedReturnValue(v33);
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
LABEL_24:

            goto LABEL_25;
          }
          v35 = sub_10007CD2C(v31);
          v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
          *(_DWORD *)buf = 138543362;
          v46 = v36;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%{public}@Skipping invoking the session start callback since handle response timer hasn't expired", buf, 0xCu);
        }
        else
        {
          v31 = (DataStreamBulkSendProtocol *)objc_claimAutoreleasedReturnValue(-[NSObject sessionStartCallback](v30, "sessionStartCallback"));
          v34 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 12, 0));
          ((void (*)(DataStreamBulkSendProtocol *, _QWORD, NSObject *))v31->_dataStream)(v31, 0, v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendProtocol pendingBulkSendSessionContextBySessionIdentifier](self, "pendingBulkSendSessionContextBySessionIdentifier"));
          objc_msgSend(v36, "setObject:forKeyedSubscript:", 0, v11);
        }

        goto LABEL_24;
      }

    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v8)
      continue;
    break;
  }
LABEL_10:

LABEL_20:
  v11 = self;
  v38 = sub_10007CCE4((uint64_t)v11, v37);
  v30 = objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v39 = sub_10007CD2C(v11);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    *(_DWORD *)buf = 138543618;
    v46 = v40;
    v47 = 2112;
    v48 = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%{public}@Could not find expired timer for session with identifier: %@", buf, 0x16u);

  }
LABEL_25:

}

- (DataStreamProtocolDelegate)dataStream
{
  return (DataStreamProtocolDelegate *)objc_loadWeakRetained((id *)&self->_dataStream);
}

- (void)setDataStream:(id)a3
{
  objc_storeWeak((id *)&self->_dataStream, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)accessory
{
  return objc_loadWeakRetained(&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak(&self->_accessory, a3);
}

- (NSMapTable)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (unsigned)nextSessionIdentifier
{
  return self->_nextSessionIdentifier;
}

- (void)setNextSessionIdentifier:(unsigned int)a3
{
  self->_nextSessionIdentifier = a3;
}

- (NSMapTable)activeBulkSendSessions
{
  return (NSMapTable *)objc_getProperty(self, a2, 56, 1);
}

- (NSMutableDictionary)pendingBulkSendSessionContextBySessionIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (id)bulkSendSessionContextFactory
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_bulkSendSessionContextFactory, 0);
  objc_storeStrong((id *)&self->_pendingBulkSendSessionContextBySessionIdentifier, 0);
  objc_storeStrong((id *)&self->_activeBulkSendSessions, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_destroyWeak(&self->_accessory);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_dataStream);
}

@end
