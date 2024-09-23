@implementation VLFLocationManager

+ (VLFLocationManager)sharedLocationManager
{
  if (qword_1014D3700 != -1)
    dispatch_once(&qword_1014D3700, &stru_1011D9BF0);
  return (VLFLocationManager *)(id)qword_1014D36F8;
}

- (VLFLocationManager)init
{
  VLFLocationManager *v2;
  VLFLocationManager *v3;
  CLLocationManager *v4;
  CLLocationManager *locationManager;
  GEOObserverHashTable *v6;
  GEOObserverHashTable *observers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VLFLocationManager;
  v2 = -[VLFLocationManager init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_observingLock._os_unfair_lock_opaque = 0;
    v4 = (CLLocationManager *)objc_msgSend(objc_alloc((Class)CLLocationManager), "_initWithDelegate:onQueue:", v2, &_dispatch_main_q);
    locationManager = v3->_locationManager;
    v3->_locationManager = v4;

    -[CLLocationManager _setFusionInfoEnabled:](v3->_locationManager, "_setFusionInfoEnabled:", 1);
    -[CLLocationManager setDesiredAccuracy:](v3->_locationManager, "setDesiredAccuracy:", kCLLocationAccuracyLeech);
    v6 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___VLFLocationManagerDelegate, &_dispatch_main_q);
    observers = v3->_observers;
    v3->_observers = v6;

  }
  return v3;
}

- (CLLocation)lastLocation
{
  os_unfair_lock_s *p_lastLocationLock;
  CLLocation *v4;

  p_lastLocationLock = &self->_lastLocationLock;
  os_unfair_lock_lock(&self->_lastLocationLock);
  v4 = self->_lastLocation;
  os_unfair_lock_unlock(p_lastLocationLock);
  return v4;
}

- (void)addObserver:(id)a3
{
  char *v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  char *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  char *v23;
  id v24;
  NSObject *v25;
  int v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;

  v4 = (char *)a3;
  if (v4)
  {
    v5 = sub_100878D28();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = (objc_class *)objc_opt_class(v4);
      v8 = NSStringFromClass(v7);
      v9 = (char *)objc_claimAutoreleasedReturnValue(v8);
      v26 = 138412546;
      v27 = v9;
      v28 = 2048;
      v29 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Adding observer: <%@: %p>", (uint8_t *)&v26, 0x16u);

    }
    os_unfair_lock_lock(&self->_observingLock);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VLFLocationManager observers](self, "observers"));
    v11 = objc_msgSend(v10, "hasObservers");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VLFLocationManager observers](self, "observers"));
    objc_msgSend(v12, "registerObserver:", v4);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VLFLocationManager observers](self, "observers"));
    v14 = objc_msgSend(v13, "hasObservers");

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[VLFLocationManager stopLocationUpdatesTimer](self, "stopLocationUpdatesTimer"));
    -[VLFLocationManager setStopLocationUpdatesTimer:](self, "setStopLocationUpdatesTimer:", 0);
    if (v11 != v14)
    {
      v16 = sub_100878D28();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
      if (v15)
      {
        if (v18)
        {
          LOWORD(v26) = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Got the first observer but the location disable timer never fired; keeping location updates going",
            (uint8_t *)&v26,
            2u);
        }
      }
      else
      {
        if (v18)
        {
          LOWORD(v26) = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Got the first observer; start updating location",
            (uint8_t *)&v26,
            2u);
        }

        v17 = objc_claimAutoreleasedReturnValue(-[VLFLocationManager locationManager](self, "locationManager"));
        -[NSObject startUpdatingLocation](v17, "startUpdatingLocation");
      }

    }
    os_unfair_lock_unlock(&self->_observingLock);
  }
  else
  {
    v19 = sub_1004318FC();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v26 = 136315906;
      v27 = "-[VLFLocationManager addObserver:]";
      v28 = 2080;
      v29 = "VLFLocationManager.m";
      v30 = 1024;
      v31 = 91;
      v32 = 2080;
      v33 = "observer != nil";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v26, 0x26u);
    }

    if (sub_100A70734())
    {
      v21 = sub_1004318FC();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v26 = 138412290;
        v27 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v26, 0xCu);

      }
    }
    v24 = sub_100878D28();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Observer should not be nil", (uint8_t *)&v26, 2u);
    }

  }
}

- (void)removeObserver:(id)a3
{
  char *v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  char *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  char *v23;
  id v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;

  v4 = (char *)a3;
  if (v4)
  {
    v5 = sub_100878D28();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = (objc_class *)objc_opt_class(v4);
      v8 = NSStringFromClass(v7);
      v9 = (char *)objc_claimAutoreleasedReturnValue(v8);
      *(_DWORD *)buf = 138412546;
      v29 = v9;
      v30 = 2048;
      v31 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Removing observer: <%@: %p>", buf, 0x16u);

    }
    os_unfair_lock_lock(&self->_observingLock);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VLFLocationManager observers](self, "observers"));
    v11 = objc_msgSend(v10, "hasObservers");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VLFLocationManager observers](self, "observers"));
    objc_msgSend(v12, "unregisterObserver:", v4);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VLFLocationManager observers](self, "observers"));
    v14 = objc_msgSend(v13, "hasObservers");

    if (v11 != v14)
    {
      v15 = sub_100878D28();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Removed the last observer; starting the location update disable timer",
          buf,
          2u);
      }

      objc_initWeak((id *)buf, self);
      v17 = &_dispatch_main_q;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100879114;
      v26[3] = &unk_1011AE190;
      objc_copyWeak(&v27, (id *)buf);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v26, 5.0));
      -[VLFLocationManager setStopLocationUpdatesTimer:](self, "setStopLocationUpdatesTimer:", v18);

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
    }
    os_unfair_lock_unlock(&self->_observingLock);
  }
  else
  {
    v19 = sub_1004318FC();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v29 = "-[VLFLocationManager removeObserver:]";
      v30 = 2080;
      v31 = "VLFLocationManager.m";
      v32 = 1024;
      v33 = 122;
      v34 = 2080;
      v35 = "observer != nil";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v21 = sub_1004318FC();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v29 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v24 = sub_100878D28();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Observer should not be nil", buf, 2u);
    }

  }
}

- (void)_stopLocationUpdatesFromTimer
{
  os_unfair_lock_s *p_observingLock;
  void *v4;
  void *v5;

  p_observingLock = &self->_observingLock;
  os_unfair_lock_lock(&self->_observingLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VLFLocationManager stopLocationUpdatesTimer](self, "stopLocationUpdatesTimer"));

  if (v4)
  {
    -[VLFLocationManager setStopLocationUpdatesTimer:](self, "setStopLocationUpdatesTimer:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFLocationManager locationManager](self, "locationManager"));
    objc_msgSend(v5, "stopUpdatingLocation");

  }
  os_unfair_lock_unlock(p_observingLock);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  const char *label;
  const char *v9;
  BOOL v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  NSObject *v18;
  unsigned int v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  id v23;
  NSObject *v24;
  const char *v25;
  const char *v26;
  id v27;
  NSObject *v28;
  char *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  const char *v48;

  v6 = a3;
  v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      v23 = sub_1004318FC();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v26 = dispatch_queue_get_label(0);
        *(_DWORD *)buf = 136316418;
        v38 = "-[VLFLocationManager locationManager:didUpdateLocations:]";
        v39 = 2080;
        v40 = "VLFLocationManager.m";
        v41 = 1024;
        v42 = 164;
        v43 = 2080;
        v44 = "dispatch_get_main_queue()";
        v45 = 2080;
        v46 = v25;
        v47 = 2080;
        v48 = v26;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v27 = sub_1004318FC();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v38 = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  if (objc_msgSend(v7, "count"))
  {
    v30 = v7;
    v31 = v6;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          v17 = sub_100878D28();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            v19 = objc_msgSend(v16, "isCoordinateFused");
            *(_DWORD *)buf = 138478083;
            v20 = CFSTR("NO");
            if (v19)
              v20 = CFSTR("YES");
            v38 = (const char *)v16;
            v39 = 2113;
            v40 = (const char *)v20;
            v21 = v20;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Got a location update: %{private}@; fused: %{private}@",
              buf,
              0x16u);

          }
          os_unfair_lock_lock(&self->_lastLocationLock);
          objc_storeStrong((id *)&self->_lastLocation, v16);
          os_unfair_lock_unlock(&self->_lastLocationLock);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[VLFLocationManager observers](self, "observers"));
          objc_msgSend(v22, "locationManager:didUpdateLocation:", self, v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v13);
    }

    v7 = v30;
    v6 = v31;
  }

}

- (void)setLastLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocation, a3);
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (GCDTimer)stopLocationUpdatesTimer
{
  return self->_stopLocationUpdatesTimer;
}

- (void)setStopLocationUpdatesTimer:(id)a3
{
  objc_storeStrong((id *)&self->_stopLocationUpdatesTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopLocationUpdatesTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
}

@end
