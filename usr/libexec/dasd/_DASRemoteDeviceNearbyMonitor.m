@implementation _DASRemoteDeviceNearbyMonitor

- (_DASRemoteDeviceNearbyMonitor)initWithDaemon:(id)a3
{
  id v5;
  _DASRemoteDeviceNearbyMonitor *v6;
  _DASRemoteDeviceNearbyMonitor *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  NSMutableSet *pendingWidgets;
  uint64_t v14;
  NSMutableSet *nearbyDevices;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_DASRemoteDeviceNearbyMonitor;
  v6 = -[_DASRemoteDeviceNearbyMonitor init](&v17, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_daemon, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("com.apple.nearbyRemoteMonitor.queue", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    pendingWidgets = v7->_pendingWidgets;
    v7->_pendingWidgets = (NSMutableSet *)v12;

    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    nearbyDevices = v7->_nearbyDevices;
    v7->_nearbyDevices = (NSMutableSet *)v14;

    *(_QWORD *)&v7->_lock._os_unfair_lock_opaque = 0;
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
  block[2] = sub_100025EA4;
  block[3] = &unk_10015D4E0;
  v8 = a3;
  v3 = qword_1001AB440;
  v4 = v8;
  if (v3 != -1)
    dispatch_once(&qword_1001AB440, block);
  v5 = (id)qword_1001AB448;

  return v5;
}

- (id)remoteDevices
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor pendingWidgets](self, "pendingWidgets", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remoteDevice"));

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remoteDevice"));
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)registerForRemoteDeviceWithActivity:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  OS_dispatch_queue *queue;
  id v8;
  _QWORD block[5];
  id v10;

  v8 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "remoteDevice"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_msgSend(v8, "targetDevice");

    if (v6 == (id)3)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000260D8;
      block[3] = &unk_10015D558;
      block[4] = self;
      v10 = v8;
      dispatch_sync((dispatch_queue_t)queue, block);

    }
  }

}

- (void)unregisterForRemoteDeviceWithActivity:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  OS_dispatch_queue *queue;
  id v8;
  _QWORD block[5];
  id v10;

  v8 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "remoteDevice"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_msgSend(v8, "targetDevice");

    if (v6 == (id)3)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000261E0;
      block[3] = &unk_10015D558;
      block[4] = self;
      v10 = v8;
      dispatch_sync((dispatch_queue_t)queue, block);

    }
  }

}

- (void)updateDeviceLost:(id)a3
{
  id v4;
  NSObject *v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("NWBrowser")));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1000E0094();

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor nearbyDevices](self, "nearbyDevices"));
  v8 = objc_msgSend(v7, "containsObject:", v4);

  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("NWBrowser")));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Remote Device %@ is no longer nearby", (uint8_t *)&v11, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor nearbyDevices](self, "nearbyDevices"));
    objc_msgSend(v10, "removeObject:", v4);

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)updateDeviceNearby:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("NWBrowser")));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1000E00F4();

  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor nearbyDevices](self, "nearbyDevices"));
  objc_msgSend(v6, "addObject:", v4);

  os_unfair_lock_unlock(&self->_lock);
  global_queue = dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000264C0;
  v10[3] = &unk_10015D558;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(v8, v10);

}

- (BOOL)isRemoteDeviceNearby:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  unsigned __int8 v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor nearbyDevices](self, "nearbyDevices"));
  v7 = objc_msgSend(v6, "containsObject:", v5);

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (BOOL)resetNearbyDevicesWithCurrentDevices:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];

  v4 = a3;
  v5 = -[NSSet mutableCopy](self->_lastRegisteredDevices, "mutableCopy");
  v17 = v4;
  objc_msgSend(v5, "minusSet:", v4);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        os_unfair_lock_lock(&self->_lock);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor nearbyDevices](self, "nearbyDevices"));
        v13 = objc_msgSend(v12, "containsObject:", v11);

        if (v13)
        {
          v14 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("NWBrowser")));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v11;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Setting %@ to not nearby", buf, 0xCu);
          }

          v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor nearbyDevices](self, "nearbyDevices"));
          objc_msgSend(v15, "removeObject:", v11);

        }
        os_unfair_lock_unlock(&self->_lock);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }

  return 1;
}

- (void)protectedRegisterForRemoteDevices
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  void *v14;

  v3 = objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor remoteDevices](self, "remoteDevices"));
  if (objc_msgSend(v4, "isEqualToSet:", self->_lastRegisteredDevices))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("NWBrowser")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_1000E0154();
    goto LABEL_13;
  }
  -[_DASRemoteDeviceNearbyMonitor resetNearbyDevicesWithCurrentDevices:](self, "resetNearbyDevicesWithCurrentDevices:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor browser](self, "browser"));

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor browser](self, "browser"));
    nw_browser_set_browse_results_changed_handler(v7, 0);

    v8 = objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor browser](self, "browser"));
    nw_browser_set_state_changed_handler(v8, 0);

    v9 = objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor browser](self, "browser"));
    nw_browser_cancel(v9);

    -[_DASRemoteDeviceNearbyMonitor setBrowser:](self, "setBrowser:", 0);
    -[_DASRemoteDeviceNearbyMonitor setLastRegisteredDevices:](self, "setLastRegisteredDevices:", 0);
  }
  if (!objc_msgSend(v4, "count"))
    goto LABEL_9;
  v10 = objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor setUpNetworkBrowserWithDevices:](self, "setUpNetworkBrowserWithDevices:", v4));
  if (v10)
  {
    v11 = v10;
    -[_DASRemoteDeviceNearbyMonitor setUpBrowserStateChange:](self, "setUpBrowserStateChange:", v10);
    -[_DASRemoteDeviceNearbyMonitor setUpBrowserResultsChanged:](self, "setUpBrowserResultsChanged:", v11);
    v12 = objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor queue](self, "queue"));
    nw_browser_set_queue(v11, v12);

    nw_browser_start(v11);
    -[_DASRemoteDeviceNearbyMonitor setBrowser:](self, "setBrowser:", v11);

LABEL_9:
    -[_DASRemoteDeviceNearbyMonitor setLastRegisteredDevices:](self, "setLastRegisteredDevices:", v4);
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("NWBrowser")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Create browser to monitor %@", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_13;
  }
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("NWBrowser")));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000E018C();
LABEL_13:

}

- (id)createParameters
{
  nw_parameters_t application_service;
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  NSObject *v6;
  NSObject *v7;

  application_service = nw_parameters_create_application_service();
  nw_parameters_set_include_screen_off_devices(application_service, 1);
  nw_parameters_set_include_ble(application_service, 1);
  v3 = xpc_array_create(0, 0);
  xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, off_1001AA238);
  v4 = xpc_array_create(0, 0);
  xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, off_1001AA240);
  nw_parameters_set_required_netagent_classes(application_service, v3, v4);
  v5 = xpc_array_create(0, 0);
  xpc_array_set_uint64(v5, 0xFFFFFFFFFFFFFFFFLL, 0x3E9uLL);
  nw_parameters_set_preferred_interface_subtypes(application_service, v5);
  if (application_service)
  {
    v6 = application_service;
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("NWBrowser")));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000E01EC();

  }
  return application_service;
}

- (id)setUpNetworkBrowserWithDevices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *application_service;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  nw_browser_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor parameters](self, "parameters"));

  if (v5
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor createParameters](self, "createParameters")),
        -[_DASRemoteDeviceNearbyMonitor setParameters:](self, "setParameters:", v6),
        v6,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor parameters](self, "parameters")),
        v7,
        v7))
  {
    application_service = nw_browse_descriptor_create_application_service(off_1001AA230);
    nw_browse_descriptor_set_browse_scope(application_service, 1);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v13));
          v15 = objc_msgSend(v14, "UTF8String", (_QWORD)v19);
          if (v15)
            nw_browse_descriptor_add_device_filter(application_service, v15);
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

    v16 = objc_claimAutoreleasedReturnValue(-[_DASRemoteDeviceNearbyMonitor parameters](self, "parameters"));
    v17 = nw_browser_create(application_service, v16);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)setUpBrowserResultsChanged:(id)a3
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100026F04;
  v5[3] = &unk_10015D650;
  objc_copyWeak(&v6, &location);
  nw_browser_set_browse_results_changed_handler(v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)setUpBrowserStateChange:(id)a3
{
  nw_browser_set_state_changed_handler((nw_browser_t)a3, &stru_10015D690);
}

- (_DASDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_daemon, a3);
}

- (NSMutableSet)pendingWidgets
{
  return self->_pendingWidgets;
}

- (void)setPendingWidgets:(id)a3
{
  objc_storeStrong((id *)&self->_pendingWidgets, a3);
}

- (NSMutableSet)nearbyDevices
{
  return self->_nearbyDevices;
}

- (void)setNearbyDevices:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyDevices, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_nw_browser)browser
{
  return self->_browser;
}

- (void)setBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_browser, a3);
}

- (OS_nw_parameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (NSSet)lastRegisteredDevices
{
  return self->_lastRegisteredDevices;
}

- (void)setLastRegisteredDevices:(id)a3
{
  objc_storeStrong((id *)&self->_lastRegisteredDevices, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (os_unfair_lock_s)pendingWidgetsLock
{
  return self->_pendingWidgetsLock;
}

- (void)setPendingWidgetsLock:(os_unfair_lock_s)a3
{
  self->_pendingWidgetsLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRegisteredDevices, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nearbyDevices, 0);
  objc_storeStrong((id *)&self->_pendingWidgets, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
}

@end
