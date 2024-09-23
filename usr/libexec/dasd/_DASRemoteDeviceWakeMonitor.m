@implementation _DASRemoteDeviceWakeMonitor

- (_DASRemoteDeviceWakeMonitor)initWithDaemon:(id)a3
{
  id v5;
  _DASRemoteDeviceWakeMonitor *v6;
  _DASRemoteDeviceWakeMonitor *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  NSMutableDictionary *deviceMonitors;
  uint64_t v14;
  NSMutableDictionary *connectedDevices;
  uint64_t v16;
  NSMutableSet *pendingActivities;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_DASRemoteDeviceWakeMonitor;
  v6 = -[_DASRemoteDeviceWakeMonitor init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_daemon, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("com.apple.remoteWakeMonitor.queue", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    deviceMonitors = v7->_deviceMonitors;
    v7->_deviceMonitors = (NSMutableDictionary *)v12;

    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    connectedDevices = v7->_connectedDevices;
    v7->_connectedDevices = (NSMutableDictionary *)v14;

    v16 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    pendingActivities = v7->_pendingActivities;
    v7->_pendingActivities = (NSMutableSet *)v16;

  }
  return v7;
}

+ (id)sharedMonitorWithDaemon:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v8;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046490;
  block[3] = &unk_10015D4E0;
  v8 = a3;
  v3 = qword_1001AB5E8;
  v4 = v8;
  if (v3 != -1)
    dispatch_once(&qword_1001AB5E8, block);
  v5 = (id)qword_1001AB5F0;

  return v5;
}

+ (BOOL)appliesToActivity:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteDevice"));
  if (!v4 || objc_msgSend(v3, "targetDevice") != (id)1)
  {

    goto LABEL_6;
  }
  v5 = objc_msgSend(v3, "requiresRemoteDeviceWake");

  if ((v5 & 1) == 0)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  v6 = 1;
LABEL_7:

  return v6;
}

- (BOOL)isRemoteDeviceAwake:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  NSObject *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  char v15;
  NSObject *v16;
  id v17;
  int v19;
  id v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;

  v4 = a3;
  v5 = self->_deviceMonitors;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMonitors, "objectForKeyedSubscript:", v4));
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "isAsleep");
    v9 = -[_DASRemoteDeviceWakeMonitor unprotectedIsRemoteDeviceConnected:](self, "unprotectedIsRemoteDeviceConnected:", v7);
    v10 = -[_DASRemoteDeviceWakeMonitor unprotectedIsRemoteDeviceNearby:](self, "unprotectedIsRemoteDeviceNearby:", v7);
    v11 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("remoteScreenMonitor")));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = CFSTR("awake");
      if (v8)
        v12 = CFSTR("asleep");
      if (v9)
        v13 = CFSTR("connected");
      else
        v13 = CFSTR("disconnected");
      v19 = 138413058;
      v20 = v4;
      v22 = v12;
      v21 = 2112;
      v23 = 2112;
      v24 = v13;
      if (v10)
        v14 = CFSTR("nearby");
      else
        v14 = CFSTR("not nearby");
      v25 = 2112;
      v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ is %@, %@, %@", (uint8_t *)&v19, 0x2Au);
    }

    v15 = v10 & ~(_BYTE)v8;
  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("remoteScreenMonitor")));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000E1858();

    v17 = +[NRDeviceIdentifier copyDeviceIdentifierWithIDSDeviceID:](NRDeviceIdentifier, "copyDeviceIdentifierWithIDSDeviceID:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceWakeMonitor unprotectedInitializeMonitorForDevice:](self, "unprotectedInitializeMonitorForDevice:", v17));

    v15 = 0;
  }

  objc_sync_exit(v5);
  return v15;
}

- (void)registerRemoteDeviceWakeStateWithActivity:(id)a3
{
  NSMutableDictionary *v4;
  void *v5;
  NSMutableDictionary *deviceMonitors;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  if (+[_DASRemoteDeviceWakeMonitor appliesToActivity:](_DASRemoteDeviceWakeMonitor, "appliesToActivity:"))
  {
    v4 = self->_deviceMonitors;
    objc_sync_enter(v4);
    if (!-[_DASRemoteDeviceWakeMonitor unprotectedIsAlreadyPendingActivity:](self, "unprotectedIsAlreadyPendingActivity:", v12))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "remoteDevice"));
      deviceMonitors = self->_deviceMonitors;
      if (!deviceMonitors)
      {
        v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v8 = self->_deviceMonitors;
        self->_deviceMonitors = v7;

        deviceMonitors = self->_deviceMonitors;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](deviceMonitors, "objectForKeyedSubscript:", v5));

      if (!v9)
      {
        v10 = +[NRDeviceIdentifier copyDeviceIdentifierWithIDSDeviceID:](NRDeviceIdentifier, "copyDeviceIdentifierWithIDSDeviceID:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceWakeMonitor unprotectedInitializeMonitorForDevice:](self, "unprotectedInitializeMonitorForDevice:", v10));
        if (v11)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMonitors, "setObject:forKeyedSubscript:", v11, v5);
          -[NSCountedSet addObject:](self->_monitorCount, "addObject:", v5);
          -[NSMutableSet addObject:](self->_pendingActivities, "addObject:", v12);
        }

      }
    }
    objc_sync_exit(v4);

  }
}

- (void)unregisterRemoteDeviceWakeStateWithActivity:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;

  v4 = a3;
  if (+[_DASRemoteDeviceWakeMonitor appliesToActivity:](_DASRemoteDeviceWakeMonitor, "appliesToActivity:", v4))
  {
    v5 = self->_deviceMonitors;
    objc_sync_enter(v5);
    if (!-[_DASRemoteDeviceWakeMonitor unprotectedIsAlreadyPendingActivity:](self, "unprotectedIsAlreadyPendingActivity:", v4))
    {
      v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("remoteScreenMonitor")));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_1000E1918();
      goto LABEL_12;
    }
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteDevice"));
    -[NSMutableSet removeObject:](self->_pendingActivities, "removeObject:", v4);
    -[NSCountedSet removeObject:](self->_monitorCount, "removeObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMonitors, "objectForKeyedSubscript:", v6));

    if (v7)
    {
      if ((-[NSCountedSet containsObject:](self->_monitorCount, "containsObject:", v6) & 1) != 0)
      {
LABEL_12:

        objc_sync_exit(v5);
        goto LABEL_13;
      }
      -[NSMutableDictionary removeObjectForKey:](self->_deviceMonitors, "removeObjectForKey:", v6);
      v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("remoteScreenMonitor")));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138412290;
        v10 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Stop monitoring screen wake state for %@", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("remoteScreenMonitor")));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1000E18B8();
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (BOOL)unprotectedIsAlreadyPendingActivity:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_pendingActivities;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "uuid", (_QWORD)v13));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if ((v11 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (id)unprotectedInitializeMonitorForDevice:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v17;
  id v18;

  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)NRDeviceMonitor), "initWithDeviceIdentifier:delegate:queue:", v4, self, self->_queue);
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("remoteScreenMonitor")));
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        v18 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Started monitoring screen wake state with identifier %@", (uint8_t *)&v17, 0xCu);
      }

      v5 = v5;
      v8 = v5;
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_1000E19E0();

      v8 = 0;
    }
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("remoteScreenMonitor")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000E1978(v5, v9, v10, v11, v12, v13, v14, v15);
    v8 = 0;
  }

  return v8;
}

- (BOOL)unprotectedIsRemoteDeviceConnected:(id)a3
{
  return objc_msgSend(a3, "isConnected");
}

- (BOOL)unprotectedIsRemoteDeviceNearby:(id)a3
{
  return objc_msgSend(a3, "isConnected");
}

- (void)deviceIsAsleepDidChange:(id)a3 isAsleep:(BOOL)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  dispatch_queue_global_t global_queue;
  NSObject *v22;
  void *v23;
  void *v24;
  NSMutableDictionary *v25;
  void *v26;
  id obj;
  uint64_t v28;
  id v30;
  void *v31;
  void *v32;
  _QWORD block[4];
  id v34;
  id v35;
  _DASRemoteDeviceWakeMonitor *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;

  v5 = a3;
  v31 = v5;
  if (a4)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("remoteScreenMonitor")));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "deviceIdentifier"));
      *(_DWORD *)buf = 138412290;
      v43 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is now asleep", buf, 0xCu);

    }
  }
  else
  {
    v8 = v5;
    if ((objc_msgSend(v5, "isConnected") & 1) != 0)
    {
      if ((objc_msgSend(v8, "isNearby") & 1) != 0)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        v25 = self->_deviceMonitors;
        objc_sync_enter(v25);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceWakeMonitor pendingActivities](self, "pendingActivities"));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v10)
        {
          obj = v9;
          v28 = *(_QWORD *)v38;
          do
          {
            v30 = v10;
            for (i = 0; i != v30; i = (char *)i + 1)
            {
              if (*(_QWORD *)v38 != v28)
                objc_enumerationMutation(obj);
              v32 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "remoteDevice"));
              v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMonitors, "objectForKeyedSubscript:", v12));
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceIdentifier"));
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "nrDeviceIdentifier"));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "deviceIdentifier"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "nrDeviceIdentifier"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
              v20 = objc_msgSend(v16, "isEqualToString:", v19);

              if (v20)
                objc_msgSend(v26, "addObject:", v32);

            }
            v9 = obj;
            v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          }
          while (v10);
        }

        objc_sync_exit(v25);
        global_queue = dispatch_get_global_queue(0, 0);
        v22 = objc_claimAutoreleasedReturnValue(global_queue);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000471DC;
        block[3] = &unk_10015D530;
        v34 = v31;
        v35 = v26;
        v36 = self;
        v6 = v26;
        dispatch_async(v22, block);

      }
      else
      {
        v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("remoteScreenMonitor")));
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "deviceIdentifier"));
          *(_DWORD *)buf = 138412290;
          v43 = v24;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ awake, connected, but not nearby", buf, 0xCu);

        }
      }
    }
    else
    {
      v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("remoteScreenMonitor")));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "deviceIdentifier"));
        *(_DWORD *)buf = 138412290;
        v43 = v23;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ awake but disconnected", buf, 0xCu);

      }
    }
  }

}

- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;

  v4 = a4;
  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("remoteScreenMonitor")));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceIdentifier"));
    v8 = (void *)v7;
    v9 = CFSTR("disconnected");
    if (v4)
      v9 = CFSTR("connected");
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is now %@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)deviceIsNearbyDidChange:(id)a3 isNearby:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;

  v4 = a4;
  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("remoteScreenMonitor")));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceIdentifier"));
    v8 = (void *)v7;
    v9 = CFSTR("not nearby");
    if (v4)
      v9 = CFSTR("nearby");
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is now %@", (uint8_t *)&v10, 0x16u);

  }
}

- (_DASDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_daemon, a3);
}

- (NSMutableDictionary)deviceMonitors
{
  return self->_deviceMonitors;
}

- (void)setDeviceMonitors:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMonitors, a3);
}

- (NSMutableDictionary)connectedDevices
{
  return self->_connectedDevices;
}

- (void)setConnectedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_connectedDevices, a3);
}

- (NSMutableSet)pendingActivities
{
  return self->_pendingActivities;
}

- (void)setPendingActivities:(id)a3
{
  objc_storeStrong((id *)&self->_pendingActivities, a3);
}

- (NSCountedSet)monitorCount
{
  return self->_monitorCount;
}

- (void)setMonitorCount:(id)a3
{
  objc_storeStrong((id *)&self->_monitorCount, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_monitorCount, 0);
  objc_storeStrong((id *)&self->_pendingActivities, 0);
  objc_storeStrong((id *)&self->_connectedDevices, 0);
  objc_storeStrong((id *)&self->_deviceMonitors, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
}

@end
