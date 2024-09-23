@implementation MapsScreenLayoutMonitor

+ (MapsScreenLayoutMonitor)sharedMonitor
{
  if (qword_1014D2C78 != -1)
    dispatch_once(&qword_1014D2C78, &stru_1011BEDB0);
  return (MapsScreenLayoutMonitor *)(id)qword_1014D2C70;
}

- (MapsScreenLayoutMonitor)init
{
  MapsScreenLayoutMonitor *v2;
  GEOObserverHashTable *v3;
  GEOObserverHashTable *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapsScreenLayoutMonitor;
  v2 = -[MapsScreenLayoutMonitor init](&v6, "init");
  if (v2)
  {
    v3 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___MapsScreenLayoutObserver, &_dispatch_main_q);
    observers = v2->_observers;
    v2->_observers = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MapsScreenLayoutMonitor setLayoutMonitor:](self, "setLayoutMonitor:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MapsScreenLayoutMonitor;
  -[MapsScreenLayoutMonitor dealloc](&v3, "dealloc");
}

- (void)setLocked:(BOOL)a3
{
  if (self->_locked != a3)
  {
    self->_locked = a3;
    self->_needsUpdate = 1;
  }
}

- (void)setIsScreenFullyOn:(BOOL)a3
{
  if (self->_isScreenFullyOn != a3)
  {
    self->_isScreenFullyOn = a3;
    self->_needsUpdate = 1;
  }
}

- (void)setIsScreenOn:(BOOL)a3
{
  if (self->_isScreenOn != a3)
  {
    self->_isScreenOn = a3;
    self->_needsUpdate = 1;
  }
}

- (void)setIsOurAppActive:(BOOL)a3
{
  if (self->_isOurAppActive != a3)
  {
    self->_isOurAppActive = a3;
    self->_needsUpdate = 1;
  }
}

- (void)setChangeReason:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  int v7;
  unint64_t v8;

  if (self->_changeReason != a3)
  {
    v5 = sub_10064B114();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 134217984;
      v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Setting changeReason to %lu", (uint8_t *)&v7, 0xCu);
    }

    self->_changeReason = a3;
  }
}

- (void)setLayoutMonitor:(id)a3
{
  FBSDisplayLayoutMonitor *v5;
  FBSDisplayLayoutMonitor *v6;
  FBSDisplayLayoutMonitor **p_layoutMonitor;
  FBSDisplayLayoutMonitor *layoutMonitor;
  FBSDisplayLayoutMonitor *v9;

  v5 = (FBSDisplayLayoutMonitor *)a3;
  layoutMonitor = self->_layoutMonitor;
  p_layoutMonitor = &self->_layoutMonitor;
  v6 = layoutMonitor;
  if (layoutMonitor != v5)
  {
    v9 = v5;
    -[FBSDisplayLayoutMonitor invalidate](v6, "invalidate");
    objc_storeStrong((id *)p_layoutMonitor, a3);
    v5 = v9;
  }

}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  FBSDisplayLayoutMonitor *layoutMonitor;
  void *v4;
  FBSDisplayLayoutMonitor *v5;
  FBSDisplayLayoutMonitor *v6;

  layoutMonitor = self->_layoutMonitor;
  if (!layoutMonitor)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsScreenLayoutMonitor configuration](self, "configuration"));
    v5 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v4));
    v6 = self->_layoutMonitor;
    self->_layoutMonitor = v5;

    self->_hasFirstUpdate = 0;
    layoutMonitor = self->_layoutMonitor;
  }
  return layoutMonitor;
}

- (FBSDisplayLayoutMonitorConfiguration)configuration
{
  FBSDisplayLayoutMonitorConfiguration *configuration;
  void *v4;
  MapsScreenLayoutMonitor *v5;
  FBSDisplayLayoutMonitorConfiguration *v6;
  id v7;
  _QWORD v9[5];

  configuration = self->_configuration;
  if (!configuration)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor](FBSDisplayLayoutMonitorConfiguration, "configurationForDefaultMainDisplayMonitor"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10064B2C0;
    v9[3] = &unk_1011BEDD8;
    v9[4] = self;
    v5 = self;
    objc_msgSend(v4, "setTransitionHandler:", v9);
    v6 = self->_configuration;
    self->_configuration = (FBSDisplayLayoutMonitorConfiguration *)v4;
    v7 = v4;

    configuration = self->_configuration;
  }
  return configuration;
}

- (void)startMonitoringWithObserver:(id)a3
{
  id v4;
  MapsScreenLayoutMonitor *v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[GEOObserverHashTable registerObserver:](v5->_observers, "registerObserver:", v4);
  v6 = sub_10064B114();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Added observer %@", (uint8_t *)&v8, 0xCu);
  }

  if (v5->_hasFirstUpdate
    && ((objc_opt_respondsToSelector(v4, "notifyCurrentStateWhenStartMonitoring") & 1) == 0
     || objc_msgSend(v4, "notifyCurrentStateWhenStartMonitoring")))
  {
    objc_msgSend(v4, "screenLayoutDidChangeWithReason:", -[MapsScreenLayoutMonitor changeReason](v5, "changeReason"));
  }
  -[MapsScreenLayoutMonitor _prepareLayoutMonitor](v5, "_prepareLayoutMonitor");
  objc_sync_exit(v5);

}

- (void)stopMonitoringWithObserver:(id)a3
{
  id v4;
  MapsScreenLayoutMonitor *v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[GEOObserverHashTable unregisterObserver:](v5->_observers, "unregisterObserver:", v4);
  v6 = sub_10064B114();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Removed observer %@", (uint8_t *)&v8, 0xCu);
  }

  if ((-[GEOObserverHashTable hasObservers](v5->_observers, "hasObservers") & 1) == 0)
    -[MapsScreenLayoutMonitor setLayoutMonitor:](v5, "setLayoutMonitor:", 0);
  objc_sync_exit(v5);

}

- (void)_prepareLayoutMonitor
{
  id v2;

  v2 = -[MapsScreenLayoutMonitor layoutMonitor](self, "layoutMonitor");
}

- (void)_notifyObserversWithReason:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  int v7;
  unint64_t v8;

  if (self->_needsUpdate || !self->_hasFirstUpdate)
  {
    *(_WORD *)&self->_hasFirstUpdate = 1;
    v5 = sub_10064B114();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notifying observers didChange: %lu", (uint8_t *)&v7, 0xCu);
    }

    -[GEOObserverHashTable screenLayoutDidChangeWithReason:](self->_observers, "screenLayoutDidChangeWithReason:", a3);
  }
}

- (BOOL)_isMapsActiveInLayout:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  unsigned __int8 v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "elements", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = MapsAppBundleId;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "bundleIdentifier"));
        v10 = objc_msgSend(v9, "isEqualToString:", v7);

        if ((v10 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (unint64_t)_changeReasonWithNewLayout:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  unint64_t v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v15;
  unsigned __int8 v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transitionReasons"));
  v9 = objc_msgSend(v8, "containsObject:", SBDisplayLayoutBacklightTransitionReasonLockButton);

  if ((v9 & 1) == 0)
  {
    if (!self->_hasFirstUpdate)
    {
      v10 = 1;
      goto LABEL_13;
    }
    if (self->_lastKnownLayout)
    {
      v11 = -[MapsScreenLayoutMonitor _isMapsActiveInLayout:](self, "_isMapsActiveInLayout:");
      if (v11 != -[MapsScreenLayoutMonitor _isMapsActiveInLayout:](self, "_isMapsActiveInLayout:", v6))
      {
        v10 = 2;
        goto LABEL_13;
      }
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transitionReasons"));
    if ((objc_msgSend(v12, "containsObject:", SBDisplayLayoutBacklightTransitionReasonLiftToWake) & 1) == 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transitionReasons"));
      if (!objc_msgSend(v13, "containsObject:", SBDisplayLayoutBacklightTransitionReasonTouch))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transitionReasons"));
        if ((objc_msgSend(v15, "containsObject:", SBDisplayLayoutBacklightTransitionReasonIdleTimer) & 1) != 0)
        {
          v16 = -[MapsScreenLayoutMonitor isScreenFullyOn](self, "isScreenFullyOn");

          if ((v16 & 1) != 0)
            goto LABEL_11;
        }
        else
        {

        }
        v10 = 0;
        goto LABEL_13;
      }

    }
LABEL_11:
    v10 = 4;
    goto LABEL_13;
  }
  v10 = 3;
LABEL_13:

  return v10;
}

- (void)_layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  MapsScreenLayoutMonitor *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v11 = sub_10064B114();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "monitor: %@ layout: %@ context: %@", buf, 0x20u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10064B9EC;
    block[3] = &unk_1011AD238;
    v14 = v9;
    v15 = self;
    v16 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (BOOL)isScreenFullyOn
{
  return self->_isScreenFullyOn;
}

- (BOOL)isScreenOn
{
  return self->_isScreenOn;
}

- (BOOL)isOurAppActive
{
  return self->_isOurAppActive;
}

- (unint64_t)changeReason
{
  return self->_changeReason;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_lastKnownLayout, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
