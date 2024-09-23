@implementation MapsDistanceUnitUpdater

- (MapsDistanceUnitUpdater)init
{
  void *v3;
  MapsDistanceUnitUpdater *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOKeyBagNotification sharedObject](GEOKeyBagNotification, "sharedObject"));
  v4 = -[MapsDistanceUnitUpdater initWithKeyBagNotification:](self, "initWithKeyBagNotification:", v3);

  return v4;
}

- (MapsDistanceUnitUpdater)initWithKeyBagNotification:(id)a3
{
  id v5;
  MapsDistanceUnitUpdater *v6;
  MapsDistanceUnitUpdater *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsDistanceUnitUpdater;
  v6 = -[MapsDistanceUnitUpdater init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_keybagNotification, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[MapsDistanceUnitUpdater stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)MapsDistanceUnitUpdater;
  -[MapsDistanceUnitUpdater dealloc](&v3, "dealloc");
}

- (void)start
{
  int *p_unitChangedToken;
  uint64_t Log;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD handler[4];
  id v9;
  id buf[2];

  p_unitChangedToken = &self->_unitChangedToken;
  if (self->_unitChangedToken < 1)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsDistanceUnitUpdater");
    v5 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "registering for changes", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v6 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1007F0C80;
    handler[3] = &unk_1011BCB28;
    objc_copyWeak(&v9, buf);
    notify_register_dispatch("com.apple.Maps.DistanceUnitsChanged", p_unitChangedToken, (dispatch_queue_t)&_dispatch_main_q, handler);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", self, "_localeDidChange:", NSCurrentLocaleDidChangeNotification, 0);

    -[MapsDistanceUnitUpdater _updateDistanceUnit](self, "_updateDistanceUnit");
    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
  else
  {
    -[MapsDistanceUnitUpdater _updateDistanceUnit](self, "_updateDistanceUnit");
  }
}

- (void)stop
{
  uint64_t Log;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (self->_unitChangedToken)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsDistanceUnitUpdater");
    v4 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "unregistering for changes", v6, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "removeObserver:", self);

    notify_cancel(self->_unitChangedToken);
    self->_unitChangedToken = 0;
  }
}

- (void)_localeDidChange:(id)a3
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  id v9;

  v4 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsDistanceUnitUpdater");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "locale did change - %@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007F0F08;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)protectedDataDidBecomeAvailable:(id)a3
{
  uint64_t Log;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsDistanceUnitUpdater");
  v5 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "protected data did become available", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007F0FCC;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_updateDistanceUnit
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  NSObject *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  const __CFString *v15;
  NSObject *v16;
  char v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t Log;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  void *v26;
  __int16 v27;
  NSObject *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  NSObject *v32;
  __int16 v33;
  uint64_t v34;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDistanceUnitUpdater keybagNotification](self, "keybagNotification"));
  v4 = objc_msgSend(v3, "canAccessFilesWithProtection:", 3);

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults __maps_groupUserDefaults](NSUserDefaults, "__maps_groupUserDefaults"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForKey:", CFSTR("DistanceUnits")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPaths mapsApplicationContainerPaths](MSPMapsPaths, "mapsApplicationContainerPaths"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeDirectory"));
    v9 = _CFPreferencesCopyAppValueWithContainer(CFSTR("DistanceUnits"), CFSTR("com.apple.Maps"), v8);

    if (v6)
    {
      v10 = CFSTR("group container");
      v11 = v6;
    }
    else
    {
      if (!v9)
      {
        v16 = 0;
        v10 = 0;
        goto LABEL_11;
      }
      v10 = CFSTR("app container");
      v11 = v9;
    }
    v16 = v11;
LABEL_11:
    if ((-[NSObject isEqualToString:](v16, "isEqualToString:", CFSTR("Imperial")) & 1) != 0)
    {
      v17 = 0;
      v18 = 2;
    }
    else
    {
      v19 = -[NSObject isEqualToString:](v16, "isEqualToString:", CFSTR("Metric"));
      v17 = v19 ^ 1;
      v18 = v19;
    }
    v20 = DefaultLoggingSubsystem;
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsDistanceUnitUpdater");
    v22 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v25 = 138413314;
      v26 = v6;
      v27 = 2112;
      v28 = v9;
      v29 = 2112;
      v30 = v10;
      v31 = 2112;
      v32 = v16;
      v33 = 2048;
      v34 = v18;
    }

    if (v6 && v9 && (-[NSObject isEqualToString:](v6, "isEqualToString:", v9) & 1) == 0)
    {
      v23 = GEOFindOrCreateLog(v20, "MapsDistanceUnitUpdater");
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = 138412546;
        v26 = v9;
        v27 = 2112;
        v28 = v6;
      }

    }
    if ((v17 & 1) == 0)
      +[NSLocale _navigation_overrideDistanceUnit:](NSLocale, "_navigation_overrideDistanceUnit:", v18);

    goto LABEL_25;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDistanceUnitUpdater keybagNotification](self, "keybagNotification"));
  v13 = objc_msgSend(v12, "addDataDidBecomeAvailableAfterFirstUnlockObserver:", self);

  v14 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsDistanceUnitUpdater");
  v6 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v15 = CFSTR("NO");
    if (v13)
      v15 = CFSTR("YES");
    v25 = 138412290;
    v26 = (void *)v15;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "unable to read user defaults because the user has not authenticated yet since boot, observer added %@", (uint8_t *)&v25, 0xCu);
  }
LABEL_25:

}

- (int)unitChangedToken
{
  return self->_unitChangedToken;
}

- (void)setUnitChangedToken:(int)a3
{
  self->_unitChangedToken = a3;
}

- (GEOKeyBagNotification)keybagNotification
{
  return self->_keybagNotification;
}

- (void)setKeybagNotification:(id)a3
{
  objc_storeStrong((id *)&self->_keybagNotification, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keybagNotification, 0);
}

@end
