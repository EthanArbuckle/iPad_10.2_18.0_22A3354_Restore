@implementation MapsLightLevelController

- (MapsLightLevelController)initWithWindowScene:(id)a3
{
  id v4;
  MapsLightLevelController *v5;
  GEOObserverHashTable *v6;
  GEOObserverHashTable *observers;
  MapsAmbientLightMonitor *v8;
  MapsAmbientLightMonitor *ambientLightMonitor;
  MapsAstronomicalConditionMonitor *v10;
  MapsAstronomicalConditionMonitor *astronomicalConditionMonitor;
  MapsExternalDeviceLightMonitor *v12;
  MapsExternalDeviceLightMonitor *externalLightMonitor;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MapsLightLevelController;
  v5 = -[MapsLightLevelController init](&v16, "init");
  if (v5)
  {
    v6 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___LightLevelObserver, &_dispatch_main_q);
    observers = v5->_observers;
    v5->_observers = v6;

    v8 = objc_opt_new(MapsAmbientLightMonitor);
    ambientLightMonitor = v5->_ambientLightMonitor;
    v5->_ambientLightMonitor = v8;

    v10 = objc_opt_new(MapsAstronomicalConditionMonitor);
    astronomicalConditionMonitor = v5->_astronomicalConditionMonitor;
    v5->_astronomicalConditionMonitor = v10;

    v12 = -[MapsExternalDeviceLightMonitor initWithWindowScene:]([MapsExternalDeviceLightMonitor alloc], "initWithWindowScene:", v4);
    externalLightMonitor = v5->_externalLightMonitor;
    v5->_externalLightMonitor = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
    objc_msgSend(v14, "addObserver:forMitigationNamed:", v5, CFSTR("NavigationForceNightModeMitigation"));

  }
  return v5;
}

+ (LightLevelProviding)sharedController
{
  if (qword_1014D28F8 != -1)
    dispatch_once(&qword_1014D28F8, &stru_1011BAB30);
  return (LightLevelProviding *)(id)qword_1014D28F0;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  if (self->_active != a3)
  {
    v3 = a3;
    v5 = sub_1004317AC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Activated light level controller", buf, 2u);
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLightLevelController astronomicalConditionMonitor](self, "astronomicalConditionMonitor"));
      objc_msgSend(v8, "startMonitoringWithObserver:", self);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLightLevelController externalLightMonitor](self, "externalLightMonitor"));
      objc_msgSend(v9, "startMonitoringWithObserver:", self);
    }
    else
    {
      if (v7)
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Deactivated light level controller", v12, 2u);
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLightLevelController ambientLightMonitor](self, "ambientLightMonitor"));
      objc_msgSend(v10, "stopMonitoringWithObserver:", self);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLightLevelController astronomicalConditionMonitor](self, "astronomicalConditionMonitor"));
      objc_msgSend(v11, "stopMonitoringWithObserver:", self);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLightLevelController externalLightMonitor](self, "externalLightMonitor"));
      objc_msgSend(v9, "stopMonitoringWithObserver:", self);
    }

    self->_active = v3;
  }
}

- (void)setWindowScene:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_windowScene, obj);
    -[MapsExternalDeviceLightMonitor setWindowScene:](self->_externalLightMonitor, "setWindowScene:", obj);

  }
}

- (void)setCurrentLightLevel:(int64_t)a3
{
  -[MapsLightLevelController setCurrentLightLevel:forceUpdate:](self, "setCurrentLightLevel:forceUpdate:", a3, 0);
}

- (void)setCurrentLightLevel:(int64_t)a3 forceUpdate:(BOOL)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  unint64_t currentLightLevel;
  void *v12;
  id v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;

  if (self->_currentLightLevel == a3)
  {
    if (!a4)
      return;
    v6 = sub_1004317AC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)a3 >= 3)
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), a3));
      else
        v8 = *(&off_1011BAB50 + a3);
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Force updating light level to %@", buf, 0xCu);

    }
  }
  else
  {
    v9 = sub_1004317AC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      currentLightLevel = self->_currentLightLevel;
      if (currentLightLevel >= 3)
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), self->_currentLightLevel));
      else
        v12 = *(&off_1011BAB50 + currentLightLevel);
      v13 = v12;
      if ((unint64_t)a3 >= 3)
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), a3));
      else
        v14 = *(&off_1011BAB50 + a3);
      *(_DWORD *)buf = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Changing light level from %@ to %@", buf, 0x16u);

    }
    self->_currentLightLevel = a3;
  }
  -[GEOObserverHashTable lightLevelController:didUpdateLightLevel:](self->_observers, "lightLevelController:didUpdateLightLevel:", self, a3);
}

- (BOOL)shouldUseNightMode
{
  return (id)-[MapsLightLevelController currentLightLevel](self, "currentLightLevel") == (id)2;
}

- (void)addObserver:(id)a3
{
  -[GEOObserverHashTable registerObserver:](self->_observers, "registerObserver:", a3);
  -[MapsLightLevelController setActive:](self, "setActive:", 1);
}

- (void)removeObserver:(id)a3
{
  -[GEOObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", a3);
  -[MapsLightLevelController setActive:](self, "setActive:", -[GEOObserverHashTable hasObservers](self->_observers, "hasObservers"));
}

- (void)reloadForChangedLightLevelTrackers
{
  -[MapsLightLevelController setCurrentLightLevel:forceUpdate:](self, "setCurrentLightLevel:forceUpdate:", -[MapsLightLevelController _computedLightLevel](self, "_computedLightLevel"), 1);
}

- (void)didUpdateMitigationNamed:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10053DB38;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)lightMonitorDidUpdate:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;

  v7 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MapsLightLevelController ambientLightMonitor](self, "ambientLightMonitor"));

  if (v4 == v7)
  {
    -[MapsLightLevelController ambientLightMonitorDidUpdate:](self, "ambientLightMonitorDidUpdate:", v7);
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsLightLevelController astronomicalConditionMonitor](self, "astronomicalConditionMonitor"));

    if (v5 == v7)
    {
      -[MapsLightLevelController astronomicalConditionMonitorDidUpdate:](self, "astronomicalConditionMonitorDidUpdate:", v7);
    }
    else
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(-[MapsLightLevelController externalLightMonitor](self, "externalLightMonitor"));

      if (v6 == v7)
        -[MapsLightLevelController externalLightMonitorDidUpdate:](self, "externalLightMonitorDidUpdate:", v7);
    }
  }

}

- (void)ambientLightMonitorDidUpdate:(id)a3
{
  -[MapsLightLevelController setCurrentLightLevel:](self, "setCurrentLightLevel:", -[MapsLightLevelController _computedLightLevel](self, "_computedLightLevel", a3));
}

- (void)astronomicalConditionMonitorDidUpdate:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_msgSend(v4, "astronomicalCondition");
  v6 = objc_msgSend(v4, "isBeforeSolarTransit");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLightLevelController ambientLightMonitor](self, "ambientLightMonitor"));
  objc_msgSend(v7, "setIsBeforeSolarTransit:", v6);

  v8 = sub_1004317AC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5 == (id)2)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Astronomical conditions in transition period", buf, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLightLevelController ambientLightMonitor](self, "ambientLightMonitor"));
    objc_msgSend(v11, "startMonitoringWithObserver:", self);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLightLevelController ambientLightMonitor](self, "ambientLightMonitor"));
    objc_msgSend(v12, "initializeWithLightLevel:", -[MapsLightLevelController currentLightLevel](self, "currentLightLevel"));
  }
  else
  {
    if (v10)
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Astronomical conditions not in transition period", v13, 2u);
    }

    -[MapsLightLevelController setCurrentLightLevel:](self, "setCurrentLightLevel:", -[MapsLightLevelController _computedLightLevel](self, "_computedLightLevel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLightLevelController ambientLightMonitor](self, "ambientLightMonitor"));
    objc_msgSend(v12, "stopMonitoringWithObserver:", self);
  }

}

- (void)externalLightMonitorDidUpdate:(id)a3
{
  -[MapsLightLevelController setCurrentLightLevel:](self, "setCurrentLightLevel:", -[MapsLightLevelController _computedLightLevel](self, "_computedLightLevel", a3));
}

- (int64_t)_computedLightLevel
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  int64_t v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  uint8_t buf[4];
  void *v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
  v4 = objc_msgSend(v3, "shouldActivateMitigationNamed:", CFSTR("NavigationForceNightModeMitigation"));

  if (v4)
  {
    v5 = sub_1004317AC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Thermal mitigation is forcing night mode!", buf, 2u);
    }

    return 2;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLightLevelController externalLightMonitor](self, "externalLightMonitor"));
  v9 = objc_msgSend(v8, "isCarPlayConnected");

  if (v9)
  {
    v10 = sub_1004317AC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLightLevelController externalLightMonitor](self, "externalLightMonitor"));
      v13 = objc_msgSend(v12, "lightLevel");
      if ((unint64_t)v13 >= 3)
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), v13));
      else
        v14 = *(&off_1011BAB50 + (_QWORD)v13);
      *(_DWORD *)buf = 138412290;
      v32 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Connected to CarPlay and car provided light level: %@", buf, 0xCu);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLightLevelController externalLightMonitor](self, "externalLightMonitor"));
    v7 = (int64_t)objc_msgSend(v26, "lightLevel");
LABEL_33:

    return v7;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLightLevelController astronomicalConditionMonitor](self, "astronomicalConditionMonitor"));
  v16 = objc_msgSend(v15, "astronomicalCondition");

  v17 = sub_1004317AC();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  if (v16 != (id)2)
  {
    if (v19)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLightLevelController astronomicalConditionMonitor](self, "astronomicalConditionMonitor"));
      v24 = objc_msgSend(v23, "astronomicalCondition");
      if ((unint64_t)v24 >= 4)
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), v24));
      else
        v25 = *(&off_1011BAB68 + (_QWORD)v24);
      *(_DWORD *)buf = 138412290;
      v32 = v25;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Astronomical condition is full Day or Night: %@", buf, 0xCu);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLightLevelController astronomicalConditionMonitor](self, "astronomicalConditionMonitor"));
    if (objc_msgSend(v26, "astronomicalCondition") == (id)1)
      v7 = 2;
    else
      v7 = 1;
    goto LABEL_33;
  }
  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLightLevelController ambientLightMonitor](self, "ambientLightMonitor"));
    v21 = objc_msgSend(v20, "ambientLightLevel");
    if ((unint64_t)v21 >= 3)
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), v21));
    else
      v22 = *(&off_1011BAB50 + (_QWORD)v21);
    *(_DWORD *)buf = 138412290;
    v32 = v22;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Astronomical condition is transitory, using light level: %@", buf, 0xCu);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLightLevelController ambientLightMonitor](self, "ambientLightMonitor"));
  v7 = (int64_t)objc_msgSend(v27, "ambientLightLevel");

  if (v7)
  {
    if (v7 == 1)
      return v7;
    return 2;
  }
  v28 = sub_1004317AC();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Updated from ambient light at 'Unsupported' to 'Regular'", buf, 2u);
  }

  return 1;
}

- (int64_t)currentLightLevel
{
  return self->_currentLightLevel;
}

- (UIWindowScene)windowScene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)connectedToCarplay
{
  return self->_connectedToCarplay;
}

- (void)setConnectedToCarplay:(BOOL)a3
{
  self->_connectedToCarplay = a3;
}

- (MapsAmbientLightMonitor)ambientLightMonitor
{
  return self->_ambientLightMonitor;
}

- (void)setAmbientLightMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_ambientLightMonitor, a3);
}

- (MapsAstronomicalConditionMonitor)astronomicalConditionMonitor
{
  return self->_astronomicalConditionMonitor;
}

- (void)setAstronomicalConditionMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_astronomicalConditionMonitor, a3);
}

- (MapsExternalDeviceLightMonitor)externalLightMonitor
{
  return self->_externalLightMonitor;
}

- (void)setExternalLightMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_externalLightMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalLightMonitor, 0);
  objc_storeStrong((id *)&self->_astronomicalConditionMonitor, 0);
  objc_storeStrong((id *)&self->_ambientLightMonitor, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
