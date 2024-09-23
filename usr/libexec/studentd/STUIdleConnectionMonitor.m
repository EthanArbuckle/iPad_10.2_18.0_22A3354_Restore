@implementation STUIdleConnectionMonitor

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[STUIdleConnectionMonitor endObservingDeviceIdleness](self, "endObservingDeviceIdleness");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor maxIdleLengthTimer](self, "maxIdleLengthTimer"));
  objc_msgSend(v3, "cancel");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor configurationManager](self, "configurationManager"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("STUConfigurationManagerDidUpdateConfigurationNotificationName"), v5);

  v6.receiver = self;
  v6.super_class = (Class)STUIdleConnectionMonitor;
  -[STUIdleConnectionMonitor dealloc](&v6, "dealloc");
}

- (STUIdleConnectionMonitor)initWithDaemon:(id)a3 device:(id)a4 configurationManager:(id)a5 timerPrimitives:(id)a6 dateProvider:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  STUIdleConnectionMonitor *v17;
  STUIdleConnectionMonitor *v18;
  void *v19;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)STUIdleConnectionMonitor;
  v17 = -[STUIdleConnectionMonitor init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_daemon, v12);
    objc_storeStrong((id *)&v18->_device, a4);
    objc_storeStrong((id *)&v18->_configurationManager, a5);
    objc_storeStrong((id *)&v18->_timerPrimitives, a6);
    objc_storeStrong((id *)&v18->_dateProvider, a7);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v19, "addObserver:selector:name:object:", v18, "configurationDidChange:", CFSTR("STUConfigurationManagerDidUpdateConfigurationNotificationName"), v14);

  }
  return v18;
}

- (void)connectedTaskSessionsDidChange
{
  unsigned int v3;
  void *v4;

  v3 = -[STUIdleConnectionMonitor hasCurrentlyConnectedIDSTaskSessions](self, "hasCurrentlyConnectedIDSTaskSessions");
  if (v3 != -[STUIdleConnectionMonitor isObservingDeviceIdleness](self, "isObservingDeviceIdleness"))
  {
    if ((v3 & 1) != 0)
    {
      -[STUIdleConnectionMonitor beginObservingDeviceIdleness](self, "beginObservingDeviceIdleness");
      -[STUIdleConnectionMonitor idlenessDidChange](self, "idlenessDidChange");
    }
    else
    {
      -[STUIdleConnectionMonitor endObservingDeviceIdleness](self, "endObservingDeviceIdleness");
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor maxIdleLengthTimer](self, "maxIdleLengthTimer"));
      objc_msgSend(v4, "cancel");

      -[STUIdleConnectionMonitor setMaxIdleLengthTimer:](self, "setMaxIdleLengthTimer:", 0);
    }
  }
}

- (BOOL)isCurrentDeviceIdle
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor device](self, "device"));
  if (objc_msgSend(v3, "lockState"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor device](self, "device"));
    v5 = objc_msgSend(v4, "lockState") != (id)1;

  }
  else
  {
    v5 = 0;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor device](self, "device"));
  if (objc_msgSend(v6, "screenState"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor device](self, "device"));
    v8 = objc_msgSend(v7, "isScreenSaverActive") | v5;

  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (BOOL)hasCurrentlyConnectedIDSTaskSessions
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor currentIDSTaskSessions](self, "currentIDSTaskSessions"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)currentIDSTaskSessions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor daemon](self, "daemon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "IDSTaskSessions"));

  return v3;
}

- (BOOL)isCurrentlyTrackingIdleness
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor maxIdleLengthTimer](self, "maxIdleLengthTimer"));
  v3 = v2 != 0;

  return v3;
}

- (double)currentMaxIdleLength
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor configurationManager](self, "configurationManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "adHocConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kCRKAdHocConfigurationRemoteLearningMaxIdleLengthKey));
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (id)makeMaxIdleLengthTimer
{
  STUSuspendableTimer *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  STUSuspendableTimer *v8;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = [STUSuspendableTimer alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor timerPrimitives](self, "timerPrimitives"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor dateProvider](self, "dateProvider"));
  -[STUIdleConnectionMonitor currentMaxIdleLength](self, "currentMaxIdleLength");
  v7 = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005C810;
  v10[3] = &unk_1000C9F38;
  objc_copyWeak(&v11, &location);
  v8 = -[STUSuspendableTimer initWithTimerPrimitives:dateProvider:timeout:timeoutHandler:](v3, "initWithTimerPrimitives:dateProvider:timeout:timeoutHandler:", v4, v5, v10, v7);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  return v8;
}

- (void)configurationDidChange:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor maxIdleLengthTimer](self, "maxIdleLengthTimer", a3));
  -[STUIdleConnectionMonitor currentMaxIdleLength](self, "currentMaxIdleLength");
  objc_msgSend(v4, "updateWithTimeout:");

}

- (void)maxIdleLengthTimerDidFire
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = sub_10005C944();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_10007D17C(v4);

  v5 = CRKErrorWithCodeAndUserInfo(131, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor currentIDSTaskSessions](self, "currentIDSTaskSessions"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005C984;
  v9[3] = &unk_1000CB768;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

- (void)idlenessDidChange
{
  unsigned int v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = -[STUIdleConnectionMonitor isCurrentDeviceIdle](self, "isCurrentDeviceIdle");
  if (v3 != -[STUIdleConnectionMonitor isCurrentlyTrackingIdleness](self, "isCurrentlyTrackingIdleness"))
  {
    v4 = sub_10005C944();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Idle monitor beginning max idle time countdown", buf, 2u);
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor makeMaxIdleLengthTimer](self, "makeMaxIdleLengthTimer"));
      -[STUIdleConnectionMonitor setMaxIdleLengthTimer:](self, "setMaxIdleLengthTimer:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor maxIdleLengthTimer](self, "maxIdleLengthTimer"));
      objc_msgSend(v8, "resume");

    }
    else
    {
      if (v6)
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Idle monitor ending max idle time countdown", v10, 2u);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor maxIdleLengthTimer](self, "maxIdleLengthTimer"));
      objc_msgSend(v9, "cancel");

      -[STUIdleConnectionMonitor setMaxIdleLengthTimer:](self, "setMaxIdleLengthTimer:", 0);
    }
  }
}

+ (id)observedKeyPaths
{
  _QWORD v3[3];

  v3[0] = CFSTR("lockState");
  v3[1] = CFSTR("screenState");
  v3[2] = CFSTR("screenSaverActive");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 3));
}

- (void)beginObservingDeviceIdleness
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];

  if (!-[STUIdleConnectionMonitor isObservingDeviceIdleness](self, "isObservingDeviceIdleness"))
  {
    v3 = sub_10005C944();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Idle monitor beginning observation of idle state", buf, 2u);
    }

    -[STUIdleConnectionMonitor setObservingDeviceIdleness:](self, "setObservingDeviceIdleness:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor device](self, "device"));
    objc_msgSend(v5, "startObservingChanges");

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend((id)objc_opt_class(self), "observedKeyPaths", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor device](self, "device"));
          objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, v12, 0, CFSTR("IdleMonitorObservationContext"));

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v9);
    }

  }
}

- (void)endObservingDeviceIdleness
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];

  if (-[STUIdleConnectionMonitor isObservingDeviceIdleness](self, "isObservingDeviceIdleness"))
  {
    v3 = sub_10005C944();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Idle monitor ending observation of idle state", buf, 2u);
    }

    -[STUIdleConnectionMonitor setObservingDeviceIdleness:](self, "setObservingDeviceIdleness:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor device](self, "device"));
    objc_msgSend(v5, "stopObservingChanges");

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend((id)objc_opt_class(self), "observedKeyPaths", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUIdleConnectionMonitor device](self, "device"));
          objc_msgSend(v13, "removeObserver:forKeyPath:context:", self, v12, CFSTR("IdleMonitorObservationContext"));

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v9);
    }

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == CFSTR("IdleMonitorObservationContext"))
  {
    -[STUIdleConnectionMonitor idlenessDidChange](self, "idlenessDidChange", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)STUIdleConnectionMonitor;
    -[STUIdleConnectionMonitor observeValueForKeyPath:ofObject:change:context:](&v8, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (STUDaemon)daemon
{
  return (STUDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (void)setDaemon:(id)a3
{
  objc_storeWeak((id *)&self->_daemon, a3);
}

- (STUDevice)device
{
  return self->_device;
}

- (STUConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (CRKTimerPrimitives)timerPrimitives
{
  return self->_timerPrimitives;
}

- (STUDateProviderProtocol)dateProvider
{
  return self->_dateProvider;
}

- (STUSuspendableTimer)maxIdleLengthTimer
{
  return self->_maxIdleLengthTimer;
}

- (void)setMaxIdleLengthTimer:(id)a3
{
  objc_storeStrong((id *)&self->_maxIdleLengthTimer, a3);
}

- (BOOL)isObservingDeviceIdleness
{
  return self->_observingDeviceIdleness;
}

- (void)setObservingDeviceIdleness:(BOOL)a3
{
  self->_observingDeviceIdleness = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxIdleLengthTimer, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_timerPrimitives, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_daemon);
}

@end
