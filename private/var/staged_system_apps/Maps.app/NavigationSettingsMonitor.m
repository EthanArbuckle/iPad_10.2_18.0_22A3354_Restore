@implementation NavigationSettingsMonitor

- (NavigationSettingsMonitor)initWithUserDefaults:(id)a3
{
  id v5;
  NavigationSettingsMonitor *v6;
  NavigationSettingsMonitor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NavigationSettingsMonitor;
  v6 = -[NavigationSettingsMonitor init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userDefaults, a3);
    -[NavigationSettingsMonitor _startObserving](v7, "_startObserving");
    -[NavigationSettingsMonitor _updateUserOptionsAndNotifyObservers:](v7, "_updateUserOptionsAndNotifyObservers:", 1);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NavigationSettingsMonitor _stopObserving](self, "_stopObserving");
  v3.receiver = self;
  v3.super_class = (Class)NavigationSettingsMonitor;
  -[NavigationSettingsMonitor dealloc](&v3, "dealloc");
}

- (BOOL)isCarPlay
{
  NavigationSettingsMonitor *v2;
  BOOL isCarPlay;

  v2 = self;
  objc_sync_enter(v2);
  isCarPlay = v2->_isCarPlay;
  objc_sync_exit(v2);

  return isCarPlay;
}

- (void)setIsCarPlay:(BOOL)a3
{
  _BOOL4 v3;
  NavigationSettingsMonitor *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_isCarPlay != v3)
  {
    obj->_isCarPlay = v3;
    -[NavigationSettingsMonitor _updateUserOptionsAndNotifyObservers:](obj, "_updateUserOptionsAndNotifyObservers:", 1);
  }
  objc_sync_exit(obj);

}

- (int64_t)transportType
{
  NavigationSettingsMonitor *v2;
  int64_t transportType;

  v2 = self;
  objc_sync_enter(v2);
  transportType = v2->_transportType;
  objc_sync_exit(v2);

  return transportType;
}

- (void)setTransportType:(int64_t)a3
{
  NavigationSettingsMonitor *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_transportType != a3)
  {
    obj->_transportType = a3;
    -[NavigationSettingsMonitor _updateUserOptionsAndNotifyObservers:](obj, "_updateUserOptionsAndNotifyObservers:", 1);
  }
  objc_sync_exit(obj);

}

- (MNUserOptions)userOptions
{
  NavigationSettingsMonitor *v2;
  MNUserOptions *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NavigationSettingsMonitor _updateUserOptionsAndNotifyObservers:](v2, "_updateUserOptionsAndNotifyObservers:", 0);
  v3 = v2->_userOptions;
  objc_sync_exit(v2);

  return v3;
}

- (void)_startObserving
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  if (qword_1014D2180 != -1)
    dispatch_once(&qword_1014D2180, &stru_1011B2460);
  v3 = (id)qword_1014D2188;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSettingsMonitor userDefaults](self, "userDefaults"));
        objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, v8, 0, &off_1011B2458);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = objc_msgSend(&off_101273EF0, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(&off_101273EF0);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSettingsMonitor userDefaults](self, "userDefaults"));
        objc_msgSend(v15, "addObserver:forKeyPath:options:context:", self, v14, 0, &off_1011B2458);

      }
      v11 = objc_msgSend(&off_101273EF0, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v11);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v17 = MNLocaleDidChangeNotification();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v16, "addObserver:selector:name:object:", self, "_localeMetricDidChange:", v18, 0);

}

- (void)_stopObserving
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  if (qword_1014D2180 != -1)
    dispatch_once(&qword_1014D2180, &stru_1011B2460);
  v3 = (id)qword_1014D2188;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSettingsMonitor userDefaults](self, "userDefaults"));
        objc_msgSend(v9, "removeObserver:forKeyPath:", self, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = objc_msgSend(&off_101273EF0, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(&off_101273EF0);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)j);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSettingsMonitor userDefaults](self, "userDefaults"));
        objc_msgSend(v15, "removeObserver:forKeyPath:", self, v14);

      }
      v11 = objc_msgSend(&off_101273EF0, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v11);
  }
}

- (void)_updateUserOptionsAndNotifyObservers:(BOOL)a3
{
  _BOOL4 v3;
  NavigationSettingsMonitor *v4;
  void *v5;
  void *v6;
  MNUserOptions *v7;
  MNUserOptions *userOptions;
  id v9;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userOptions"));
  v7 = (MNUserOptions *)objc_msgSend(v6, "copy");

  userOptions = v4->_userOptions;
  v4->_userOptions = v7;

  objc_sync_exit(v4);
  if (v3)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("NavigationSettingsMonitorDidUpdateSettings"), v4);

  }
}

- (void)_localeMetricDidChange:(id)a3
{
  -[NavigationSettingsMonitor _updateUserOptionsAndNotifyObservers:](self, "_updateUserOptionsAndNotifyObservers:", 1);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10 || a6 != &off_1011B2458)
    goto LABEL_8;
  if (qword_1014D2180 != -1)
    dispatch_once(&qword_1014D2180, &stru_1011B2460);
  if ((objc_msgSend((id)qword_1014D2188, "containsObject:", v10) & 1) != 0
    || objc_msgSend(&off_101273EF0, "containsObject:", v10))
  {
    -[NavigationSettingsMonitor _updateUserOptionsAndNotifyObservers:](self, "_updateUserOptionsAndNotifyObservers:", 1);
  }
  else
  {
LABEL_8:
    v13.receiver = self;
    v13.super_class = (Class)NavigationSettingsMonitor;
    -[NavigationSettingsMonitor observeValueForKeyPath:ofObject:change:context:](&v13, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_userOptions, 0);
}

@end
