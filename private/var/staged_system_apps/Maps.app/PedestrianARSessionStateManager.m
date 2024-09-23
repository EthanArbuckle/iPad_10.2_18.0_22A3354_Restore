@implementation PedestrianARSessionStateManager

- (PedestrianARSessionStateManager)initWithPlatformController:(id)a3
{
  id v4;
  PedestrianARSessionStateManager *v5;
  id v6;
  NSObject *v7;
  GEOObserverHashTable *v8;
  GEOObserverHashTable *observers;
  uint64_t v10;
  NSMutableSet *monitors;
  uint64_t v12;
  NSMapTable *classMonitorMap;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  char *v19;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;

  v4 = a3;
  if (!v4)
  {
    v15 = sub_1004318FC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v22 = "-[PedestrianARSessionStateManager initWithPlatformController:]";
      v23 = 2080;
      v24 = "PedestrianARSessionStateManager.m";
      v25 = 1024;
      v26 = 59;
      v27 = 2080;
      v28 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v17 = sub_1004318FC();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v22 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)PedestrianARSessionStateManager;
  v5 = -[PedestrianARSessionStateManager init](&v20, "init");
  if (v5)
  {
    v6 = sub_1002A958C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v22 = (const char *)v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeWeak((id *)&v5->_platformController, v4);
    v8 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___PedestrianARSessionStateManagerDelegate, 0);
    observers = v5->_observers;
    v5->_observers = v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    monitors = v5->_monitors;
    v5->_monitors = (NSMutableSet *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    classMonitorMap = v5->_classMonitorMap;
    v5->_classMonitorMap = (NSMapTable *)v12;

    -[PedestrianARSessionStateManager listenForGEOConfigKeyChanges](v5, "listenForGEOConfigKeyChanges");
    -[PedestrianARSessionStateManager createEnabledMonitors](v5, "createEnabledMonitors");
    -[PedestrianARSessionStateManager calculateState](v5, "calculateState");
  }

  return v5;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  objc_super v6;
  uint8_t buf[4];
  PedestrianARSessionStateManager *v8;

  v3 = sub_1002A958C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocing", buf, 0xCu);
  }

  GEOConfigRemoveDelegateListenerForAllKeys(self, v5);
  v6.receiver = self;
  v6.super_class = (Class)PedestrianARSessionStateManager;
  -[PedestrianARSessionStateManager dealloc](&v6, "dealloc");
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  PedestrianARSessionStateManager *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v5 = sub_1002A958C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134349314;
      v9 = self;
      v10 = 2112;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Adding observer: %@", (uint8_t *)&v8, 0x16u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionStateManager observers](self, "observers"));
    objc_msgSend(v7, "registerObserver:", v4);

  }
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  PedestrianARSessionStateManager *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v5 = sub_1002A958C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134349314;
      v9 = self;
      v10 = 2112;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Removing observer: %@", (uint8_t *)&v8, 0x16u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionStateManager observers](self, "observers"));
    objc_msgSend(v7, "unregisterObserver:", v4);

  }
}

- (void)listenForGEOConfigKeyChanges
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v3 = +[PedestrianARSessionCarPlayConnectionMonitor enablementGEOConfigKey](PedestrianARSessionCarPlayConnectionMonitor, "enablementGEOConfigKey");
  _GEOConfigAddDelegateListenerForKey(v3, v4, &_dispatch_main_q, self);
  v5 = +[PedestrianARSessionCoarseLocationMonitor enablementGEOConfigKey](PedestrianARSessionCoarseLocationMonitor, "enablementGEOConfigKey");
  _GEOConfigAddDelegateListenerForKey(v5, v6, &_dispatch_main_q, self);

  v7 = +[PedestrianARSessionNetworkReachabilityMonitor enablementGEOConfigKey](PedestrianARSessionNetworkReachabilityMonitor, "enablementGEOConfigKey");
  _GEOConfigAddDelegateListenerForKey(v7, v8, &_dispatch_main_q, self);

  v9 = +[PedestrianARSessionOfflineMonitor enablementGEOConfigKey](PedestrianARSessionOfflineMonitor, "enablementGEOConfigKey");
  _GEOConfigAddDelegateListenerForKey(v9, v10, &_dispatch_main_q, self);

  v11 = +[PedestrianARSessionThermalStateMonitor enablementGEOConfigKey](PedestrianARSessionThermalStateMonitor, "enablementGEOConfigKey");
  _GEOConfigAddDelegateListenerForKey(v11, v12, &_dispatch_main_q, self);

  v13 = +[PedestrianARSessionTileAvailabilityMonitor enablementGEOConfigKey](PedestrianARSessionTileAvailabilityMonitor, "enablementGEOConfigKey");
  _GEOConfigAddDelegateListenerForKey(v13, v14, &_dispatch_main_q, self);

  v15 = +[PedestrianARSessionTransportTypeMonitor enablementGEOConfigKey](PedestrianARSessionTransportTypeMonitor, "enablementGEOConfigKey");
  _GEOConfigAddDelegateListenerForKey(v15, v16, &_dispatch_main_q, self);

  v17 = +[PedestrianARSessionSunsetSunriseMonitor enablementGEOConfigKey](PedestrianARSessionSunsetSunriseMonitor, "enablementGEOConfigKey");
  _GEOConfigAddDelegateListenerForKey(v17, v18, &_dispatch_main_q, self);

}

- (void)createEnabledMonitors
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  uint8_t buf[4];
  PedestrianARSessionStateManager *v21;
  __int16 v22;
  void *v23;

  v3 = sub_1002A958C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v21 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Creating newly enabled monitors", buf, 0xCu);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1002A9D5C;
  v19[3] = &unk_1011AF790;
  v19[4] = self;
  -[PedestrianARSessionStateManager createMonitorIfNecessary:configurationBlock:](self, "createMonitorIfNecessary:configurationBlock:", objc_opt_class(PedestrianARSessionArrivalStepAvailabilityMonitor), v19);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1002A9E00;
  v18[3] = &unk_1011AF790;
  v18[4] = self;
  -[PedestrianARSessionStateManager createMonitorIfNecessary:configurationBlock:](self, "createMonitorIfNecessary:configurationBlock:", objc_opt_class(PedestrianARSessionCarPlayConnectionMonitor), v18);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1002A9E30;
  v17[3] = &unk_1011AF790;
  v17[4] = self;
  -[PedestrianARSessionStateManager createMonitorIfNecessary:configurationBlock:](self, "createMonitorIfNecessary:configurationBlock:", objc_opt_class(PedestrianARSessionCoarseLocationMonitor), v17);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1002A9E94;
  v16[3] = &unk_1011AF790;
  v16[4] = self;
  -[PedestrianARSessionStateManager createMonitorIfNecessary:configurationBlock:](self, "createMonitorIfNecessary:configurationBlock:", objc_opt_class(PedestrianARSessionMapsSkyMonitor), v16);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002A9EC4;
  v15[3] = &unk_1011AF790;
  v15[4] = self;
  -[PedestrianARSessionStateManager createMonitorIfNecessary:configurationBlock:](self, "createMonitorIfNecessary:configurationBlock:", objc_opt_class(PedestrianARSessionNetworkReachabilityMonitor), v15);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1002A9EF4;
  v14[3] = &unk_1011AF790;
  v14[4] = self;
  -[PedestrianARSessionStateManager createMonitorIfNecessary:configurationBlock:](self, "createMonitorIfNecessary:configurationBlock:", objc_opt_class(PedestrianARSessionOfflineMonitor), v14);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002A9F24;
  v13[3] = &unk_1011AF790;
  v13[4] = self;
  -[PedestrianARSessionStateManager createMonitorIfNecessary:configurationBlock:](self, "createMonitorIfNecessary:configurationBlock:", objc_opt_class(PedestrianARSessionRouteDistanceMonitor), v13);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002A9FC8;
  v12[3] = &unk_1011AF790;
  v12[4] = self;
  -[PedestrianARSessionStateManager createMonitorIfNecessary:configurationBlock:](self, "createMonitorIfNecessary:configurationBlock:", objc_opt_class(PedestrianARSessionRoutePlanningConfigurationMonitor), v12);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002AA02C;
  v11[3] = &unk_1011AF790;
  v11[4] = self;
  -[PedestrianARSessionStateManager createMonitorIfNecessary:configurationBlock:](self, "createMonitorIfNecessary:configurationBlock:", objc_opt_class(PedestrianARSessionThermalStateMonitor), v11);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002AA094;
  v10[3] = &unk_1011AF790;
  v10[4] = self;
  -[PedestrianARSessionStateManager createMonitorIfNecessary:configurationBlock:](self, "createMonitorIfNecessary:configurationBlock:", objc_opt_class(PedestrianARSessionTileAvailabilityMonitor), v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002AA134;
  v9[3] = &unk_1011AF790;
  v9[4] = self;
  -[PedestrianARSessionStateManager createMonitorIfNecessary:configurationBlock:](self, "createMonitorIfNecessary:configurationBlock:", objc_opt_class(PedestrianARSessionTransportTypeMonitor), v9);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002AA198;
  v8[3] = &unk_1011AF790;
  v8[4] = self;
  -[PedestrianARSessionStateManager createMonitorIfNecessary:configurationBlock:](self, "createMonitorIfNecessary:configurationBlock:", objc_opt_class(PedestrianARSessionSunsetSunriseMonitor), v8);
  -[PedestrianARSessionStateManager setDidFinishCreatingMonitors:](self, "setDidFinishCreatingMonitors:", 1);
  v5 = sub_1002A958C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionStateManager monitors](self, "monitors"));
    *(_DWORD *)buf = 134349314;
    v21 = self;
    v22 = 2112;
    v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Finished creating monitors: %@", buf, 0x16u);

  }
}

- (void)createMonitorIfNecessary:(Class)a3 configurationBlock:(id)a4
{
  uint64_t (**v6)(_QWORD);
  unsigned int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSString *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  NSString *v20;
  int v21;
  PedestrianARSessionStateManager *v22;
  __int16 v23;
  NSObject *v24;

  v6 = (uint64_t (**)(_QWORD))a4;
  v7 = -[PedestrianARSessionStateManager shouldCreateMonitor:](self, "shouldCreateMonitor:", a3);
  v8 = sub_1002A958C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v11 = NSStringFromClass(a3);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v21 = 134349314;
      v22 = self;
      v23 = 2112;
      v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}p] Creating monitor: %@", (uint8_t *)&v21, 0x16u);

    }
    v13 = v6[2](v6);
    v10 = objc_claimAutoreleasedReturnValue(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionStateManager monitors](self, "monitors"));
    objc_msgSend(v14, "addObject:", v10);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionStateManager classMonitorMap](self, "classMonitorMap"));
    objc_msgSend(v15, "setObject:forKey:", v10, a3);

    v16 = sub_1002A958C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    v21 = 134349314;
    v22 = self;
    v23 = 2112;
    v24 = v10;
    v18 = "[%{public}p] Created monitor: %@";
    v19 = v17;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v21, 0x16u);
LABEL_9:

    goto LABEL_10;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v20 = NSStringFromClass(a3);
    v17 = objc_claimAutoreleasedReturnValue(v20);
    v21 = 134349314;
    v22 = self;
    v23 = 2112;
    v24 = v17;
    v18 = "[%{public}p] NOT creating monitor: %@";
    v19 = v10;
    goto LABEL_8;
  }
LABEL_10:

}

- (BOOL)shouldCreateMonitor:(Class)a3
{
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSString *v10;
  void *v11;
  const char *v12;
  id v13;
  NSString *v14;
  BOOL v15;
  NSString *v17;
  void *v18;
  int v19;
  PedestrianARSessionStateManager *v20;
  __int16 v21;
  void *v22;

  if ((-[objc_class isEnabled](a3, "isEnabled") & 1) == 0)
  {
    v13 = sub_1002A958C();
    v8 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v14 = NSStringFromClass(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v19 = 134349314;
      v20 = self;
      v21 = 2112;
      v22 = v11;
      v12 = "[%{public}p] %@ is not enabled; should not create";
      goto LABEL_7;
    }
LABEL_8:
    v15 = 0;
    goto LABEL_9;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionStateManager classMonitorMap](self, "classMonitorMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", a3));

  v7 = sub_1002A958C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v9)
    {
      v10 = NSStringFromClass(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v19 = 134349314;
      v20 = self;
      v21 = 2112;
      v22 = v11;
      v12 = "[%{public}p] %@ already exists; should not create";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v19, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v9)
  {
    v17 = NSStringFromClass(a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = 134349314;
    v20 = self;
    v21 = 2112;
    v22 = v18;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] %@ should be created", (uint8_t *)&v19, 0x16u);

  }
  v15 = 1;
LABEL_9:

  return v15;
}

- (void)removeDisabledMonitors
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  PedestrianARSessionStateManager *v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v3 = sub_1002A958C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v31 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Removing newly disabled monitors", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionStateManager monitors](self, "monitors"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend((id)objc_opt_class(v11), "isEnabled") & 1) == 0)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v8);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j);
        v18 = sub_1002A958C();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349314;
          v31 = self;
          v32 = 2112;
          v33 = v17;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}p] Removing newly disabled monitor: %@", buf, 0x16u);
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionStateManager classMonitorMap](self, "classMonitorMap"));
        objc_msgSend(v20, "removeObjectForKey:", objc_opt_class(v17));

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionStateManager monitors](self, "monitors"));
        objc_msgSend(v21, "removeObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v14);
  }

}

- (void)calculateState
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  PedestrianARSessionStateManager *v18;
  __int16 v19;
  void *v20;
  _BYTE v21[128];

  if (-[PedestrianARSessionStateManager didFinishCreatingMonitors](self, "didFinishCreatingMonitors"))
  {
    v3 = sub_1002A958C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Calculating state", buf, 0xCu);
    }

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionStateManager monitors](self, "monitors", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v10, "shouldShowPedestrianAR") & 1) == 0)
          {
            v11 = sub_1002A958C();
            v12 = objc_claimAutoreleasedReturnValue(v11);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134349314;
              v18 = self;
              v19 = 2112;
              v20 = v10;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Monitor is requesting to disable the feature: %@", buf, 0x16u);
            }

            -[PedestrianARSessionStateManager setShouldShowPedestrianAR:](self, "setShouldShowPedestrianAR:", 0);
            return;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v7)
          continue;
        break;
      }
    }

    -[PedestrianARSessionStateManager setShouldShowPedestrianAR:](self, "setShouldShowPedestrianAR:", 1);
  }
}

- (void)setShouldShowPedestrianAR:(BOOL)a3
{
  id v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  int v9;
  PedestrianARSessionStateManager *v10;
  __int16 v11;
  __CFString *v12;

  if (self->_shouldShowPedestrianAR != a3)
  {
    self->_shouldShowPedestrianAR = a3;
    v4 = sub_1002A958C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (self->_shouldShowPedestrianAR)
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      v7 = v6;
      v9 = 134349314;
      v10 = self;
      v11 = 2112;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Updating global state: %@", (uint8_t *)&v9, 0x16u);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionStateManager observers](self, "observers"));
    objc_msgSend(v8, "stateManager:didChangeState:", self, self->_shouldShowPedestrianAR);

  }
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  unsigned int v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionStateManager allMonitors](self, "allMonitors"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingComparator:", &stru_1011AF7D0));

  v6 = (objc_class *)objc_opt_class(self);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[PedestrianARSessionStateManager shouldShowPedestrianAR](self, "shouldShowPedestrianAR");
  v10 = CFSTR("NO");
  if (v9)
    v10 = CFSTR("YES");
  v11 = v10;
  v12 = sub_10039DCD4(v5, &stru_1011AF810);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p\nshould show pedestrian AR: %@\nstate monitors: %@>"), v8, self, v11, v13));

  return (NSString *)v14;
}

- (id)allMonitors
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionStateManager monitors](self, "monitors"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (void)monitor:(id)a3 didChangeState:(BOOL)a4
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  int v11;
  PedestrianARSessionStateManager *v12;
  __int16 v13;
  void *v14;

  v5 = a3;
  v6 = sub_1002A958C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = (objc_class *)objc_opt_class(v5);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = 134349314;
    v12 = self;
    v13 = 2112;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Monitor (%@) changed state; recalculating global state",
      (uint8_t *)&v11,
      0x16u);

  }
  -[PedestrianARSessionStateManager calculateState](self, "calculateState");

}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  PedestrianARSessionStateManager *v7;

  v4 = sub_1002A958C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] One of the monitors' enablement geo config key changed; updating monitors and global state",
      (uint8_t *)&v6,
      0xCu);
  }

  -[PedestrianARSessionStateManager setDidFinishCreatingMonitors:](self, "setDidFinishCreatingMonitors:", 0);
  -[PedestrianARSessionStateManager removeDisabledMonitors](self, "removeDisabledMonitors");
  -[PedestrianARSessionStateManager createEnabledMonitors](self, "createEnabledMonitors");
  -[PedestrianARSessionStateManager calculateState](self, "calculateState");
}

- (BOOL)shouldShowPedestrianAR
{
  return self->_shouldShowPedestrianAR;
}

- (NSMutableSet)monitors
{
  return self->_monitors;
}

- (void)setMonitors:(id)a3
{
  objc_storeStrong((id *)&self->_monitors, a3);
}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSMapTable)classMonitorMap
{
  return self->_classMonitorMap;
}

- (void)setClassMonitorMap:(id)a3
{
  objc_storeStrong((id *)&self->_classMonitorMap, a3);
}

- (BOOL)didFinishCreatingMonitors
{
  return self->_didFinishCreatingMonitors;
}

- (void)setDidFinishCreatingMonitors:(BOOL)a3
{
  self->_didFinishCreatingMonitors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classMonitorMap, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong((id *)&self->_monitors, 0);
}

@end
