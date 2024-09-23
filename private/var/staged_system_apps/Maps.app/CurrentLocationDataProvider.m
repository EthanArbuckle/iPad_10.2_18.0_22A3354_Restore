@implementation CurrentLocationDataProvider

- (CurrentLocationDataProvider)init
{
  CurrentLocationDataProvider *v2;
  uint64_t v3;
  MKLocationManager *locationManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CurrentLocationDataProvider;
  v2 = -[CurrentLocationDataProvider init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    locationManager = v2->_locationManager;
    v2->_locationManager = (MKLocationManager *)v3;

  }
  return v2;
}

- (void)setActive:(BOOL)a3
{
  MKLocationManager *locationManager;

  if (self->_active != a3)
  {
    self->_active = a3;
    locationManager = self->_locationManager;
    if (a3)
    {
      -[MKLocationManager startLocationUpdateWithObserver:](locationManager, "startLocationUpdateWithObserver:", self);
      -[CurrentLocationDataProvider _updateCurrentLocationAndNotifyObservers:](self, "_updateCurrentLocationAndNotifyObservers:", 0);
    }
    else
    {
      -[MKLocationManager stopLocationUpdateWithObserver:](locationManager, "stopLocationUpdateWithObserver:", self);
    }
  }
}

- (BOOL)hasInitialData
{
  return 1;
}

- (GEOObserverHashTable)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___HomeDataProvidingObserver, 0);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (void)_updateCurrentLocationAndNotifyObservers:(BOOL)a3
{
  _BOOL4 v3;
  GEOLocation *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  NSString *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;

  if (self->_active)
  {
    v3 = a3;
    if (-[MKLocationManager isAuthorizedForPreciseLocation](self->_locationManager, "isAuthorizedForPreciseLocation"))v6 = (GEOLocation *)objc_claimAutoreleasedReturnValue(-[MKLocationManager currentLocation](self->_locationManager, "currentLocation"));
    else
      v6 = 0;
    if (v6 == self->_currentLocation)
      v7 = 1;
    else
      v7 = -[GEOLocation isEqual:](v6, "isEqual:");
    v8 = sub_100432EDC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class(self);
      v11 = NSStringFromClass(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = NSStringFromSelector(a2);
      v14 = (id)objc_claimAutoreleasedReturnValue(v13);
      if (v6)
      {
        -[GEOLocation coordinate](v6, "coordinate");
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%+.8f, %+.8f"), v15, v16));
      }
      else
      {
        v17 = 0;
      }
      v18 = sub_10039E4FC(v7 ^ 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 138413058;
      v21 = v12;
      v22 = 2112;
      v23 = v14;
      v24 = 2112;
      v25 = v17;
      v26 = 2112;
      v27 = v19;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ %@, currentLocation = %@, currentLocationChanged = %@", buf, 0x2Au);
      if (v6)

    }
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentLocation, v6);
      if (v3)
        -[GEOObserverHashTable homeDataProvidingObjectDidUpdate:](self->_observers, "homeDataProvidingObjectDidUpdate:", self);
    }

  }
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  -[CurrentLocationDataProvider _updateCurrentLocationAndNotifyObservers:](self, "_updateCurrentLocationAndNotifyObservers:", 1);
}

- (void)locationManagerDidReset:(id)a3
{
  -[CurrentLocationDataProvider _updateCurrentLocationAndNotifyObservers:](self, "_updateCurrentLocationAndNotifyObservers:", 1);
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (BOOL)active
{
  return self->_active;
}

- (GEOLocation)currentLocation
{
  return self->_currentLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
