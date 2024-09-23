@implementation BCLightLevelController

+ (void)preWarm
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[BCLightLevelController sharedInstance](BCLightLevelController, "sharedInstance"));
  objc_msgSend(v2, "_startMonitoring");

}

+ (id)sharedInstance
{
  if (qword_30DCF0 != -1)
    dispatch_once(&qword_30DCF0, &stru_290EC8);
  return (id)qword_30DCE8;
}

+ (BCLightLevelController)shared
{
  return +[BCLightLevelController sharedInstance](BCLightLevelController, "sharedInstance");
}

- (BCLightLevelController)init
{
  BCLightLevelController *v2;
  BrightnessSystemClient *v3;
  BrightnessSystemClient *client;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BCLightLevelController;
  v2 = -[BCLightLevelController init](&v6, "init");
  if (v2)
  {
    v3 = (BrightnessSystemClient *)objc_alloc_init((Class)BrightnessSystemClient);
    client = v2->_client;
    v2->_client = v3;

    v2->_emulatedLightLevel = 0;
    v2->_currentLightLevel = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BCLightLevelController _stopMonitoring](self, "_stopMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)BCLightLevelController;
  -[BCLightLevelController dealloc](&v3, "dealloc");
}

- (BOOL)_sensorAvailable
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D6290;
  block[3] = &unk_28BBD8;
  block[4] = self;
  if (qword_30DD00 != -1)
    dispatch_once(&qword_30DD00, block);
  return byte_30DCF8;
}

- (BOOL)_sensorShouldBeAvailable
{
  if (qword_30DD10 != -1)
    dispatch_once(&qword_30DD10, &stru_290F08);
  return byte_30DD08;
}

- (BOOL)shouldMonitorLightLevel
{
  _BOOL4 v3;

  v3 = -[BCLightLevelController _sensorAvailable](self, "_sensorAvailable");
  if (v3)
    LOBYTE(v3) = -[BCLightLevelController _sensorShouldBeAvailable](self, "_sensorShouldBeAvailable");
  return v3;
}

- (void)addObserver:(id)a3 changeHandler:(id)a4
{
  id v6;
  NSMapTable *observers;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  observers = self->_observers;
  if (!observers)
  {
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    v9 = self->_observers;
    self->_observers = v8;

    observers = self->_observers;
  }
  v10 = objc_msgSend(v6, "copy");
  -[NSMapTable setObject:forKey:](observers, "setObject:forKey:", v10, v11);

  -[BCLightLevelController _startMonitoring](self, "_startMonitoring");
}

- (void)removeObserver:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMapTable removeObjectForKey:](self->_observers, "removeObjectForKey:");
  if (!-[NSMapTable count](self->_observers, "count"))
    -[BCLightLevelController _stopMonitoring](self, "_stopMonitoring");

}

- (BOOL)isLowLight
{
  return (char *)-[BCLightLevelController currentLightLevel](self, "currentLightLevel") == (char *)&dword_0 + 2;
}

- (int64_t)currentLightLevel
{
  int64_t result;

  result = self->_emulatedLightLevel;
  if (!result)
    return self->_currentLightLevel;
  return result;
}

- (void)emulateCurrentLightLevelChange:(int64_t)a3
{
  void *v5;

  v5 = -[BCLightLevelController currentLightLevel](self, "currentLightLevel");
  self->_emulatedLightLevel = a3;
  if (v5 != (void *)-[BCLightLevelController currentLightLevel](self, "currentLightLevel"))
    -[BCLightLevelController _notifyLightLevelChange](self, "_notifyLightLevelChange");
}

- (void)_updateCurrentLightLevel:(int64_t)a3 force:(BOOL)a4
{
  char *v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  int v14;
  __CFString *v15;
  __int16 v16;
  __CFString *v17;

  v7 = -[BCLightLevelController currentLightLevel](self, "currentLightLevel");
  if (a4 || a3 && self->_currentLightLevel != a3)
    self->_currentLightLevel = a3;
  if (v7 != (char *)-[BCLightLevelController currentLightLevel](self, "currentLightLevel"))
  {
    v8 = _BCLightLevelLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v7 == (_BYTE *)&dword_0 + 1)
        v10 = CFSTR("regular");
      else
        v10 = CFSTR("unknown");
      if (v7 == (_BYTE *)&dword_0 + 2)
        v10 = CFSTR("low");
      v11 = v10;
      if (a3 == 1)
        v12 = CFSTR("regular");
      else
        v12 = CFSTR("unknown");
      if (a3 == 2)
        v12 = CFSTR("low");
      v13 = v12;
      v14 = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "_notifyLightLevelChange old:%@ new: %@", (uint8_t *)&v14, 0x16u);

    }
    -[BCLightLevelController _notifyLightLevelChange](self, "_notifyLightLevelChange");
  }
}

- (void)_notifyLightLevelChange
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("BCLightLevelChangedNotification"), self);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_observers, "keyEnumerator", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_observers, "objectForKey:", v8));
        ((void (**)(_QWORD, BCLightLevelController *, uint64_t))v9)[2](v9, self, v8);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (int64_t)_luxToLightLevel:(float)a3
{
  if (a3 < 0.0)
    return 0;
  if (a3 <= 2.5)
    return 2;
  return a3 >= 20.0;
}

- (void)_updateStatsAndLightLevelNow
{
  id v3;
  uint64_t v4;
  char isKindOfClass;
  id v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  int v14;
  id v15;

  if (-[BCLightLevelController shouldMonitorLightLevel](self, "shouldMonitorLightLevel"))
  {
    v3 = -[BrightnessSystemClient copyPropertyForKey:](self->_client, "copyPropertyForKey:", CFSTR("TrustedLux"));
    v4 = objc_opt_class(NSNumber);
    isKindOfClass = objc_opt_isKindOfClass(v3, v4);
    v6 = _BCLightLevelLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    if ((isKindOfClass & 1) != 0)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v3;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "_updateStatsAndLightLevelNow: lux value: %@", (uint8_t *)&v14, 0xCu);
      }

      objc_msgSend(v3, "floatValue");
      v9 = -[BCLightLevelController _luxToLightLevel:](self, "_luxToLightLevel:");
      if (v9 <= 1)
        v10 = 1;
      else
        v10 = v9;
      -[BCLightLevelController _updateCurrentLightLevel:force:](self, "_updateCurrentLightLevel:force:", v10, 1);
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v11 = (objc_class *)objc_opt_class(v3);
        v12 = NSStringFromClass(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = 138412290;
        v15 = v13;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Object for 'kCBTrustedLux' was '%@' and not NSNumber like expected", (uint8_t *)&v14, 0xCu);

      }
    }

  }
}

- (void)_startMonitoring
{
  void *v3;
  unsigned __int8 v4;
  BrightnessSystemClient *client;
  id v6;
  NSObject *v7;
  uint8_t v8[16];
  _QWORD v9[5];
  unsigned __int8 v10;

  if (!self->_monitoring && -[BCLightLevelController shouldMonitorLightLevel](self, "shouldMonitorLightLevel"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("BCShouldOverrideNightMode"));

    client = self->_client;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_D6B68;
    v9[3] = &unk_290F58;
    v10 = v4;
    v9[4] = self;
    -[BrightnessSystemClient registerNotificationBlock:forProperties:](client, "registerNotificationBlock:forProperties:", v9, &off_2AF948);
    self->_monitoring = 1;
    -[BCLightLevelController _updateStatsAndLightLevelNow](self, "_updateStatsAndLightLevelNow");
    v6 = _BCLightLevelLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Light Level Monitoring Started", v8, 2u);
    }

  }
}

- (void)_stopMonitoring
{
  BrightnessSystemClient *client;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  client = self->_client;
  if (client)
  {
    -[BrightnessSystemClient registerNotificationBlock:forProperties:](client, "registerNotificationBlock:forProperties:", 0, 0);
    v4 = _BCLightLevelLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Light Level Monitoring Stopped", v6, 2u);
    }

  }
  self->_monitoring = 0;
}

- (int64_t)emulatedLightLevel
{
  return self->_emulatedLightLevel;
}

- (void)setEmulatedLightLevel:(int64_t)a3
{
  self->_emulatedLightLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
