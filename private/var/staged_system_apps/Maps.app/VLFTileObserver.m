@implementation VLFTileObserver

- (VLFTileObserver)initWithLocationManager:(id)a3 navigationService:(id)a4 purpose:(int64_t)a5
{
  id v9;
  id v10;
  VLFTileObserver *v11;
  id v12;
  NSObject *v13;
  GEOObserverHashTable *v14;
  GEOObserverHashTable *observers;
  VLLocalizer *v16;
  VLLocalizer *localizer;
  void *v18;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  char *v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  char *v29;
  objc_super v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  const char *v38;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    v20 = sub_1004318FC();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v32 = "-[VLFTileObserver initWithLocationManager:navigationService:purpose:]";
      v33 = 2080;
      v34 = "VLFTileObserver.m";
      v35 = 1024;
      v36 = 54;
      v37 = 2080;
      v38 = "locationManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v22 = sub_1004318FC();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v32 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v10)
  {
    v25 = sub_1004318FC();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v32 = "-[VLFTileObserver initWithLocationManager:navigationService:purpose:]";
      v33 = 2080;
      v34 = "VLFTileObserver.m";
      v35 = 1024;
      v36 = 55;
      v37 = 2080;
      v38 = "navigationService != nil";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v27 = sub_1004318FC();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v32 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v30.receiver = self;
  v30.super_class = (Class)VLFTileObserver;
  v11 = -[VLFTileObserver init](&v30, "init");
  if (v11)
  {
    v12 = sub_100535E24();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v32 = (const char *)v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    v11->_purpose = a5;
    v14 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___VLFTileAvailabilityObserver, &_dispatch_main_q);
    observers = v11->_observers;
    v11->_observers = v14;

    objc_storeStrong((id *)&v11->_locationManager, a3);
    -[MKLocationManager listenForLocationUpdates:](v11->_locationManager, "listenForLocationUpdates:", v11);
    objc_storeStrong((id *)&v11->_navigationService, a4);
    -[MNNavigationService registerObserver:](v11->_navigationService, "registerObserver:", v11);
    -[VLFTileObserver checkForUnsupportedNavigationTransportType](v11, "checkForUnsupportedNavigationTransportType");
    v16 = (VLLocalizer *)objc_msgSend(objc_alloc((Class)VLLocalizer), "initWithAuditToken:", 0);
    localizer = v11->_localizer;
    v11->_localizer = v16;

    v11->_previouslyCheckedCoordinate = kCLLocationCoordinate2DInvalid;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MKLocationManager lastLocation](v11->_locationManager, "lastLocation"));
    if (v18)
      -[VLFTileObserver checkForTileAvailabilityAtLocation:](v11, "checkForTileAvailabilityAtLocation:", v18);

  }
  return v11;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  VLFTileObserver *v7;

  v3 = sub_100535E24();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocing", buf, 0xCu);
  }

  -[MNNavigationService unregisterObserver:](self->_navigationService, "unregisterObserver:", self);
  -[MKLocationManager stopListeningForLocationUpdates:](self->_locationManager, "stopListeningForLocationUpdates:", self);
  v5.receiver = self;
  v5.super_class = (Class)VLFTileObserver;
  -[VLFTileObserver dealloc](&v5, "dealloc");
}

- (void)addAvailabilityObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[VLFTileObserver observers](self, "observers"));
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)removeAvailabilityObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[VLFTileObserver observers](self, "observers"));
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (double)errorTimeoutThreshold
{
  return GEOConfigGetDouble(MapsConfig_VLFSessionTileAvailabilityErrorTimeoutThreshold, off_1014B3BA8);
}

- (double)distanceThreshold
{
  return GEOConfigGetDouble(MapsConfig_VLFSessionTileAvailabilityMonitorDistanceThreshold, off_1014B37E8);
}

- (void)setNavigatingInUnsupportedTransportType:(BOOL)a3
{
  id v4;
  NSObject *v5;
  int v6;
  VLFTileObserver *v7;

  if (self->_navigatingInUnsupportedTransportType != a3)
  {
    self->_navigatingInUnsupportedTransportType = a3;
    if (!a3)
    {
      v4 = sub_100535E24();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v6 = 134349056;
        v7 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] No longer navigating in an unsupported transport type; clearing previously checked coordinate",
          (uint8_t *)&v6,
          0xCu);
      }

      -[VLFTileObserver setPreviouslyCheckedCoordinate:](self, "setPreviouslyCheckedCoordinate:", kCLLocationCoordinate2DInvalid.latitude, kCLLocationCoordinate2DInvalid.longitude);
    }
  }
}

- (void)setAreTilesAvailable:(BOOL)a3
{
  id v4;

  if (self->_areTilesAvailable != a3)
  {
    self->_areTilesAvailable = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[VLFTileObserver observers](self, "observers"));
    objc_msgSend(v4, "tileObserver:didChangeTileAvailability:", self, self->_areTilesAvailable);

  }
}

- (void)checkForTileAvailabilityAtLocation:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  BOOL v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  BOOL v18;
  id v19;
  _BOOL4 v20;
  double v21;
  double v22;
  double v23;
  id v24;
  NSObject *v25;
  int64_t v26;
  double v27;
  double v28;
  double v29;
  id v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  int64_t v35;
  id v36;
  id v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  id v41;
  NSObject *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  CLLocationCoordinate2D v48;
  id location;
  _OWORD v50[2];
  CLLocationCoordinate2D v51;
  _BYTE buf[40];
  const char *v53;
  __int16 v54;
  const char *v55;
  CLLocationCoordinate2D v56;
  CLLocationCoordinate2D v57;

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v39 = sub_1004318FC();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "-[VLFTileObserver checkForTileAvailabilityAtLocation:]";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "VLFTileObserver.m";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 148;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = "dispatch_get_main_queue()";
        *(_WORD *)&buf[38] = 2080;
        v53 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v54 = 2080;
        v55 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v41 = sub_1004318FC();
        v42 = objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v43;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  if (-[VLFTileObserver isAvailabilityCheckInFlight](self, "isAvailabilityCheckInFlight"))
  {
    v8 = sub_100535E24();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] An availability check is currently in flight; ignoring",
        buf,
        0xCu);
    }
LABEL_31:

    goto LABEL_35;
  }
  if (-[VLFTileObserver isNavigatingInUnsupportedTransportType](self, "isNavigatingInUnsupportedTransportType"))
  {
    v10 = sub_100535E24();
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Currently navigating with an unsupported transport type; ignoring",
        buf,
        0xCu);
    }
    goto LABEL_31;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VLFTileObserver lastErrorDate](self, "lastErrorDate"));
  v12 = v11 == 0;

  if (!v12)
  {
    -[VLFTileObserver errorTimeoutThreshold](self, "errorTimeoutThreshold");
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VLFTileObserver lastErrorDate](self, "lastErrorDate"));
    objc_msgSend(v15, "timeIntervalSinceDate:", v16);
    v18 = v17 >= v14;

    v19 = sub_100535E24();
    v9 = objc_claimAutoreleasedReturnValue(v19);
    v20 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (!v18)
    {
      if (v20)
      {
        *(_DWORD *)buf = 134349312;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v14;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] An error occurred less than %f seconds ago; ignoring",
          buf,
          0x16u);
      }
      goto LABEL_31;
    }
    if (v20)
    {
      *(_DWORD *)buf = 134349056;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Error timeout has passed, will start checking tile availability again", buf, 0xCu);
    }

    -[VLFTileObserver setLastErrorDate:](self, "setLastErrorDate:", 0);
  }
  objc_msgSend(v4, "coordinate");
  v51 = v56;
  if (!CLLocationCoordinate2DIsValid(v56))
  {
    v36 = sub_100535E24();
    v9 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%{public}p] Invalid coordinate from location update; ignoring",
        buf,
        0xCu);
    }
    goto LABEL_31;
  }
  -[VLFTileObserver previouslyCheckedCoordinate](self, "previouslyCheckedCoordinate");
  if (CLLocationCoordinate2DIsValid(v57)
    && (-[VLFTileObserver distanceThreshold](self, "distanceThreshold"),
        v22 = v21,
        v23 = CLLocationCoordinate2DGetDistanceFrom(&v51, &self->_previouslyCheckedCoordinate),
        v23 < v22))
  {
    v37 = sub_100535E24();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349568;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2048;
      *(double *)&buf[24] = v22;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "[%{public}p] Distance from previous tile availability check (%.2f) is less than %.2f meters; ignoring",
        buf,
        0x20u);
    }

  }
  else
  {
    v24 = sub_100535E24();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v26 = -[VLFTileObserver purpose](self, "purpose");
      *(_DWORD *)buf = 134349312;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "[%{public}p] Checking for VLF tile availability at the current location for purpose: %ld", buf, 0x16u);
    }

    v27 = GEOLocationCoordinate2DFromCLLocationCoordinate2D(v51.latitude, v51.longitude);
    v29 = v28;
    v30 = objc_msgSend(v4, "altitude");
    VLECEFFromCoordinate(v50, v30, v27, v29, v31);
    v44 = v50[1];
    v45 = v50[0];
    objc_msgSend(v4, "horizontalAccuracy");
    v33 = v32;
    -[VLFTileObserver setAvailabilityCheckInFlight:](self, "setAvailabilityCheckInFlight:", 1);
    objc_initWeak(&location, self);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[VLFTileObserver localizer](self, "localizer"));
    v35 = -[VLFTileObserver purpose](self, "purpose");
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100536774;
    v46[3] = &unk_1011BA9B8;
    objc_copyWeak(&v47, &location);
    v48 = v51;
    *(_OWORD *)buf = v45;
    *(_OWORD *)&buf[16] = v44;
    *(_QWORD *)&buf[32] = v33;
    v53 = 0;
    objc_msgSend(v34, "determineAvailabilityAtLocation:purpose:callbackQueue:callback:", buf, v35, &_dispatch_main_q, v46);

    objc_destroyWeak(&v47);
    objc_destroyWeak(&location);
  }
LABEL_35:

}

- (void)checkForUnsupportedNavigationTransportType
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  unsigned __int8 v10;
  id v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  int v15;
  VLFTileObserver *v16;
  __int16 v17;
  unsigned int v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFTileObserver navigationService](self, "navigationService"));
  v4 = objc_msgSend(v3, "isInNavigatingState");

  if ((v4 & 1) == 0)
  {
    v8 = sub_100535E24();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v15 = 134349056;
      v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Detected not navigating", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_10;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFTileObserver navigationService](self, "navigationService"));
  v6 = objc_msgSend(v5, "navigationTransportType") - 1;
  if (v6 > 5)
    v7 = 1;
  else
    v7 = qword_100E378D0[v6];
  v10 = +[VLFSessionTask isSupportedForTransportType:](VLFSessionTask, "isSupportedForTransportType:", v7);

  v11 = sub_100535E24();
  v9 = objc_claimAutoreleasedReturnValue(v11);
  v12 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if ((v10 & 1) != 0)
  {
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[VLFTileObserver navigationService](self, "navigationService"));
      v15 = 134349312;
      v16 = self;
      v17 = 1024;
      v18 = objc_msgSend(v13, "navigationTransportType");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Detected navigating in a supported transport type: %d", (uint8_t *)&v15, 0x12u);

    }
LABEL_10:

    -[VLFTileObserver setNavigatingInUnsupportedTransportType:](self, "setNavigatingInUnsupportedTransportType:", 0);
    return;
  }
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VLFTileObserver navigationService](self, "navigationService"));
    v15 = 134349312;
    v16 = self;
    v17 = 1024;
    v18 = objc_msgSend(v14, "navigationTransportType");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Detected navigating in an unsupported transport type: %d", (uint8_t *)&v15, 0x12u);

  }
  -[VLFTileObserver setNavigatingInUnsupportedTransportType:](self, "setNavigatingInUnsupportedTransportType:", 1);
  -[VLFTileObserver setAreTilesAvailable:](self, "setAreTilesAvailable:", 0);
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  int v7;
  VLFTileObserver *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lastLocation"));
  if (v4)
  {
    -[VLFTileObserver checkForTileAvailabilityAtLocation:](self, "checkForTileAvailabilityAtLocation:", v4);
  }
  else
  {
    v5 = sub_100535E24();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = 134349056;
      v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Got nil location update; ignoring",
        (uint8_t *)&v7,
        0xCu);
    }

  }
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (BOOL)areTilesAvailable
{
  return self->_areTilesAvailable;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(int64_t)a3
{
  self->_purpose = a3;
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (VLLocalizer)localizer
{
  return self->_localizer;
}

- (void)setLocalizer:(id)a3
{
  objc_storeStrong((id *)&self->_localizer, a3);
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
  objc_storeStrong((id *)&self->_navigationService, a3);
}

- (NSDate)lastErrorDate
{
  return self->_lastErrorDate;
}

- (void)setLastErrorDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastErrorDate, a3);
}

- (BOOL)isAvailabilityCheckInFlight
{
  return self->_availabilityCheckInFlight;
}

- (void)setAvailabilityCheckInFlight:(BOOL)a3
{
  self->_availabilityCheckInFlight = a3;
}

- (CLLocationCoordinate2D)previouslyCheckedCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_previouslyCheckedCoordinate.latitude;
  longitude = self->_previouslyCheckedCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setPreviouslyCheckedCoordinate:(CLLocationCoordinate2D)a3
{
  self->_previouslyCheckedCoordinate = a3;
}

- (BOOL)isNavigatingInUnsupportedTransportType
{
  return self->_navigatingInUnsupportedTransportType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastErrorDate, 0);
  objc_storeStrong((id *)&self->_navigationService, 0);
  objc_storeStrong((id *)&self->_localizer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
