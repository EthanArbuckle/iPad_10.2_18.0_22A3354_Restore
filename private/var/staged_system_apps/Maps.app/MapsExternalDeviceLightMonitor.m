@implementation MapsExternalDeviceLightMonitor

- (MapsExternalDeviceLightMonitor)init
{
  return -[MapsExternalDeviceLightMonitor initWithWindowScene:](self, "initWithWindowScene:", 0);
}

- (MapsExternalDeviceLightMonitor)initWithWindowScene:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MapsExternalDeviceLightMonitor;
  v5 = -[MapsBaseLightMonitor init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)(v5 + 25), v4);
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v8 = *(void **)(v6 + 33);
    *(_QWORD *)(v6 + 33) = v7;

  }
  return (MapsExternalDeviceLightMonitor *)v6;
}

- (void)_setMonitoring:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[MapsBaseLightMonitor _isMonitoring](self, "_isMonitoring");
  v6.receiver = self;
  v6.super_class = (Class)MapsExternalDeviceLightMonitor;
  -[MapsBaseLightMonitor _setMonitoring:](&v6, "_setMonitoring:", v3);
  if (v5 != v3)
    -[MapsExternalDeviceLightMonitor _updateForCurrentMonitoringState](self, "_updateForCurrentMonitoringState");
}

- (void)_updateForCurrentMonitoringState
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  if (-[MapsBaseLightMonitor _isMonitoring](self, "_isMonitoring"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_lightLevel + 1));
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "_sceneWillConnnect:", UISceneWillConnectNotification, WeakRetained);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = objc_loadWeakRetained((id *)((char *)&self->_lightLevel + 1));
    objc_msgSend(v6, "addObserver:selector:name:object:", self, "_sceneDidDisconnect:", UISceneDidDisconnectNotification, v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", self, "_carPlayWindowMapTraitDidChange:", CRSUIWindowMapStyleChangedNotification, 0);

    -[MapsExternalDeviceLightMonitor _reloadConnectedScenes](self, "_reloadConnectedScenes");
    -[MapsExternalDeviceLightMonitor _updateLightLevel](self, "_updateLightLevel");
  }
  else
  {
    objc_msgSend(*(id *)((char *)&self->_windowScene + 1), "removeAllObjects");
    -[MapsExternalDeviceLightMonitor setLightLevel:](self, "setLightLevel:", 0);
  }
}

- (void)setWindowScene:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_lightLevel + 1));

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)((char *)&self->_lightLevel + 1), obj);
    -[MapsExternalDeviceLightMonitor _updateForCurrentMonitoringState](self, "_updateForCurrentMonitoringState");
    v5 = obj;
  }

}

- (int64_t)lightLevel
{
  void *v3;
  void *v4;
  unint64_t v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  uint8_t buf[4];
  MapsExternalDeviceLightMonitor *v11;
  __int16 v12;
  __CFString *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("MapsDebugCarPlayLightLevelKey")));

  if ((objc_opt_respondsToSelector(v4, "integerValue") & 1) != 0)
  {
    v5 = (unint64_t)objc_msgSend(v4, "integerValue");
    v6 = sub_1004317AC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if (v5 >= 3)
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), v5));
      else
        v8 = off_1011AD7D8[v5];
      *(_DWORD *)buf = 138412546;
      v11 = self;
      v12 = 2112;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@: Using override CarPlay light level: %@", buf, 0x16u);

    }
  }
  else
  {
    v5 = *(_QWORD *)(&self->super._monitoring + 1);
  }

  return v5;
}

- (void)setLightLevel:(int64_t)a3
{
  id v5;
  NSObject *v6;
  unint64_t v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  uint8_t buf[4];
  MapsExternalDeviceLightMonitor *v12;
  __int16 v13;
  __CFString *v14;
  __int16 v15;
  __CFString *v16;

  if (*(_QWORD *)(&self->super._monitoring + 1) != a3)
  {
    v5 = sub_1004317AC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(&self->super._monitoring + 1);
      if (v7 >= 3)
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), *(_QWORD *)(&self->super._monitoring + 1)));
      else
        v8 = off_1011AD7D8[v7];
      v9 = v8;
      if ((unint64_t)a3 >= 3)
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), a3));
      else
        v10 = off_1011AD7D8[a3];
      *(_DWORD *)buf = 138412802;
      v12 = self;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@: Changing light level from %@ to %@", buf, 0x20u);

    }
    *(_QWORD *)(&self->super._monitoring + 1) = a3;
    -[MapsBaseLightMonitor _notifyDidChange](self, "_notifyDidChange");
  }
}

- (BOOL)isCarPlayConnected
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDeviceLightMonitor scenesByType](self, "scenesByType"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_carPlayWindowMapTraitDidChange:(id)a3
{
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  unint64_t v13;
  const __CFString *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  NSObject *v18;
  void *v19;
  unint64_t v20;
  const __CFString *v21;
  unint64_t v22;
  const __CFString *v23;
  int v24;
  MapsExternalDeviceLightMonitor *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;

  v4 = (__CFString *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString object](v4, "object"));
  v6 = objc_opt_class(CRSUIWindow);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  v9 = sub_1004317AC();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "windowScene"));
      v13 = (unint64_t)objc_msgSend(v12, "carSceneType");
      if (v13 > 7)
        v14 = CFSTR(".Unknown");
      else
        v14 = off_1011AD7F0[v13];
      v24 = 138412546;
      v25 = self;
      v26 = 2112;
      v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@: _carPlayWindowMapTraitDidChange: carSceneType: %@", (uint8_t *)&v24, 0x16u);

    }
    v11 = objc_claimAutoreleasedReturnValue(-[MapsExternalDeviceLightMonitor _sceneWithHighestPriority](self, "_sceneWithHighestPriority"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "windowScene"));
    v16 = -[NSObject isEqual:](v11, "isEqual:", v15);

    if ((v16 & 1) != 0)
    {
      -[MapsExternalDeviceLightMonitor _updateLightLevel](self, "_updateLightLevel");
    }
    else
    {
      v17 = sub_1004317AC();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "windowScene"));
        v20 = (unint64_t)objc_msgSend(v19, "carSceneType");
        if (v20 > 7)
          v21 = CFSTR(".Unknown");
        else
          v21 = off_1011AD7F0[v20];
        v22 = (unint64_t)-[NSObject carSceneType](v11, "carSceneType");
        if (v22 > 7)
          v23 = CFSTR(".Unknown");
        else
          v23 = off_1011AD7F0[v22];
        v24 = 138413058;
        v25 = self;
        v26 = 2112;
        v27 = v4;
        v28 = 2112;
        v29 = v21;
        v30 = 2112;
        v31 = v23;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@: got notified by a scene with lower priority.: %@. SceneType from notification: %@, current highest priority sceneType: %@", (uint8_t *)&v24, 0x2Au);

      }
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v24 = 138412546;
    v25 = self;
    v26 = 2112;
    v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "%@: was notified from an unsupported window scene.: %@", (uint8_t *)&v24, 0x16u);
  }

}

- (void)_sceneWillConnnect:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  unint64_t v12;
  const __CFString *v13;
  unint64_t v14;
  __CFString *v15;
  uint8_t buf[4];
  MapsExternalDeviceLightMonitor *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  __CFString *v21;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  v8 = -[__CFString isCarScene](v7, "isCarScene");
  v9 = sub_1004317AC();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v11)
    {
      v12 = (unint64_t)-[__CFString carSceneType](v7, "carSceneType");
      if (v12 > 7)
        v13 = CFSTR(".Unknown");
      else
        v13 = off_1011AD7F0[v12];
      v14 = (unint64_t)-[__CFString _maps_interfaceStyle](v7, "_maps_interfaceStyle");
      if (v14 >= 3)
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown %ld>"), v14));
      else
        v15 = off_1011AD7C0[v14];
      *(_DWORD *)buf = 138412802;
      v17 = self;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@: _sceneWillConnnect: sceneType: %@ interfaceStyle: %@", buf, 0x20u);

    }
    -[MapsExternalDeviceLightMonitor _processWindowScene:willConnect:](self, "_processWindowScene:willConnect:", v7, 1);
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412546;
      v17 = self;
      v18 = 2112;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@: _sceneWillConnnect: received non-CarPlay scene: %@", buf, 0x16u);
    }

  }
}

- (void)_sceneDidDisconnect:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  unint64_t v12;
  const __CFString *v13;
  unint64_t v14;
  __CFString *v15;
  uint8_t buf[4];
  MapsExternalDeviceLightMonitor *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  __CFString *v21;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  v8 = -[__CFString isCarScene](v7, "isCarScene");
  v9 = sub_1004317AC();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v11)
    {
      v12 = (unint64_t)-[__CFString carSceneType](v7, "carSceneType");
      if (v12 > 7)
        v13 = CFSTR(".Unknown");
      else
        v13 = off_1011AD7F0[v12];
      v14 = (unint64_t)-[__CFString _maps_interfaceStyle](v7, "_maps_interfaceStyle");
      if (v14 >= 3)
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown %ld>"), v14));
      else
        v15 = off_1011AD7C0[v14];
      *(_DWORD *)buf = 138412802;
      v17 = self;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@: _sceneDidDisconnect: sceneType: %@ interfaceStyle: %@", buf, 0x20u);

    }
    -[MapsExternalDeviceLightMonitor _processWindowScene:willConnect:](self, "_processWindowScene:willConnect:", v7, 0);
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412546;
      v17 = self;
      v18 = 2112;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@: _sceneDidDisconnect: received non-CarPlay scene: %@", buf, 0x16u);
    }

  }
}

- (void)_processWindowScene:(id)a3 willConnect:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  MapsExternalDeviceLightMonitor *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  _BOOL4 v19;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "carSceneType");
  if (v7)
  {
    v8 = v7;
    if (v4)
      v9 = v6;
    else
      v9 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDeviceLightMonitor scenesByType](self, "scenesByType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

    -[MapsExternalDeviceLightMonitor _updateLightLevel](self, "_updateLightLevel");
  }
  else
  {
    v12 = sub_1004317AC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412802;
      v15 = self;
      v16 = 2112;
      v17 = v6;
      v18 = 1024;
      v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@: received invalid scene type for windowScene: %@ willConnect: %d", (uint8_t *)&v14, 0x1Cu);
    }

  }
}

- (void)_updateLightLevel
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  unint64_t v11;
  __CFString *v12;
  id v13;
  unint64_t v14;
  const __CFString *v15;
  uint8_t buf[4];
  MapsExternalDeviceLightMonitor *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  __CFString *v23;
  __int16 v24;
  const __CFString *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDeviceLightMonitor _sceneWithHighestPriority](self, "_sceneWithHighestPriority"));
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "_maps_interfaceStyle");
    v6 = v5;
    if (v5 == (id)2)
      v7 = 2;
    else
      v7 = v5 == (id)1;
    v8 = sub_1004317AC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = off_1011AD7D8[v7];
      v11 = -[MapsExternalDeviceLightMonitor lightLevel](self, "lightLevel");
      if (v11 >= 3)
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), v11));
      else
        v12 = off_1011AD7D8[v11];
      v14 = (unint64_t)objc_msgSend(v4, "carSceneType");
      if (v14 > 7)
        v15 = CFSTR(".Unknown");
      else
        v15 = off_1011AD7F0[v14];
      *(_DWORD *)buf = 138413314;
      v17 = self;
      v18 = 2048;
      v19 = v6;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@: _updateLightLevel. mapStyle is: %ld, using lightLevel: %@ (was: %@), dictated by scene of type: %@", buf, 0x34u);

    }
  }
  else
  {
    v13 = sub_1004317AC();
    v9 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@: _updateLightLevel. There is no connected CarPlay scene. Setting lightLevel to unsupported", buf, 0xCu);
    }
    v7 = 0;
  }

  -[MapsExternalDeviceLightMonitor setLightLevel:](self, "setLightLevel:", v7);
}

- (void)_reloadConnectedScenes
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  MapsExternalDeviceLightMonitor *v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDeviceLightMonitor scenesByType](self, "scenesByType"));
  objc_msgSend(v3, "removeAllObjects");

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedScenes"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v11 = objc_opt_class(UIWindowScene);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          v12 = v10;
        else
          v12 = 0;
        v13 = v12;

        if (v13 && objc_msgSend(v13, "isCarScene"))
        {
          v14 = objc_msgSend(v13, "carSceneType");
          if (v14)
          {
            v15 = v14;
            v16 = objc_claimAutoreleasedReturnValue(-[MapsExternalDeviceLightMonitor scenesByType](self, "scenesByType"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v15));
            -[NSObject setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v13, v17);

          }
          else
          {
            v18 = sub_1004317AC();
            v16 = objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v27 = self;
              v28 = 2112;
              v29 = v13;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@: received a scene with type unspecified. scene: %@", buf, 0x16u);
            }
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v7);
  }

  v19 = sub_1004317AC();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDeviceLightMonitor scenesByType](self, "scenesByType"));
    *(_DWORD *)buf = 138412546;
    v27 = self;
    v28 = 2112;
    v29 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@: finished reloading connected scenes: %@", buf, 0x16u);

  }
}

- (id)_sceneWithHighestPriority
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  id WeakRetained;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  MapsExternalDeviceLightMonitor *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDeviceLightMonitor scenesByType](self, "scenesByType", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectEnumerator"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v4);
        v11 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_lightLevel + 1));

        if (v11 == WeakRetained)
        {
          v16 = v11;

          v8 = objc_msgSend(v16, "_maps_lightLevelPriority");
          v7 = v16;
          goto LABEL_14;
        }
        v13 = objc_msgSend(v11, "_maps_lightLevelPriority");
        if ((uint64_t)v13 > (uint64_t)v8)
        {
          v14 = v13;
          v15 = v11;

          v7 = v15;
          v8 = v14;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
LABEL_14:

  v17 = sub_1004317AC();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = objc_loadWeakRetained((id *)((char *)&self->_lightLevel + 1));
    *(_DWORD *)buf = 138413058;
    v26 = self;
    v27 = 2112;
    v28 = v7;
    v29 = 2048;
    v30 = v8;
    v31 = 2112;
    v32 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@: _sceneWithHighestPriority, scene: %@ priority: %ld windowScene: %@", buf, 0x2Au);

  }
  return v7;
}

- (UIWindowScene)windowScene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)((char *)&self->_lightLevel + 1));
}

- (NSMutableDictionary)scenesByType
{
  return *(NSMutableDictionary **)((char *)&self->_windowScene + 1);
}

- (void)setScenesByType:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_windowScene + 1), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_windowScene + 1), 0);
  objc_destroyWeak((id *)((char *)&self->_lightLevel + 1));
}

@end
