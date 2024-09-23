@implementation CurrentLocationMapServiceTicket

- (CurrentLocationMapServiceTicket)initWithLocationManager:(id)a3
{
  id v5;
  CurrentLocationMapServiceTicket *v6;
  id v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  CurrentLocationMapServiceTicket *v12;
  __int16 v13;
  id v14;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CurrentLocationMapServiceTicket;
  v6 = -[CurrentLocationMapServiceTicket init](&v10, "init");
  if (v6)
  {
    v7 = sub_1007E5E0C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v12 = v6;
      v13 = 2112;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Initializing with location manager: %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&v6->_locationManager, a3);
  }

  return v6;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  CurrentLocationMapServiceTicket *v7;

  v3 = sub_1007E5E0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)CurrentLocationMapServiceTicket;
  -[CurrentLocationMapServiceTicket dealloc](&v5, "dealloc");
}

- (void)submitWithTraits:(id)a3 completionHandler:(id)a4 networkActivityHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  CurrentLocationMapServiceTicket *v28;
  __int16 v29;
  void *v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  self->_cancelled = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CurrentLocationMapServiceTicket currentLocation](self, "currentLocation"));
  v12 = sub_1007E5E0C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v14)
    {
      *(_DWORD *)buf = 134349315;
      v28 = self;
      v29 = 2113;
      v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] Submitting rev geo for location: %{private}@", buf, 0x16u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CurrentLocationMapServiceTicket _revGeoTicketForCurrentLocation:traits:completionHandler:networkActivityHandler:](self, "_revGeoTicketForCurrentLocation:traits:completionHandler:networkActivityHandler:", v11, v8, v9, v10));
    -[CurrentLocationMapServiceTicket setRevGeoTicket:](self, "setRevGeoTicket:", v15);

  }
  else
  {
    if (v14)
    {
      *(_DWORD *)buf = 134349056;
      v28 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] Submitting single location update", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CurrentLocationMapServiceTicket locationManager](self, "locationManager"));
    v19 = _NSConcreteStackBlock;
    v20 = 3221225472;
    v21 = sub_1007E619C;
    v22 = &unk_1011C9218;
    objc_copyWeak(&v26, (id *)buf);
    v24 = v9;
    v23 = v8;
    v25 = v10;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "singleLocationUpdateWithHandler:", &v19));
    -[CurrentLocationMapServiceTicket setLocationFixOperation:](self, "setLocationFixOperation:", v17, v19, v20, v21, v22);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CurrentLocationMapServiceTicket locationFixOperation](self, "locationFixOperation"));
    objc_msgSend(v18, "start");

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }

}

- (id)_revGeoTicketForCurrentLocation:(id)a3 traits:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  void *v16;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithCLLocation:", v12);

  v14 = sub_10089D054(v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GEOComposedWaypoint composedWaypointForCurrentLocation:traits:completionHandler:networkActivityHandler:](GEOComposedWaypoint, "composedWaypointForCurrentLocation:traits:completionHandler:networkActivityHandler:", v13, v11, v15, v9));
  return v16;
}

- (void)cancel
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  CurrentLocationMapServiceTicket *v7;

  v3 = sub_1007E5E0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Cancelling", (uint8_t *)&v6, 0xCu);
  }

  self->_cancelled = 1;
  -[CurrentLocationMapServiceTicket setLocationFixOperation:](self, "setLocationFixOperation:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CurrentLocationMapServiceTicket revGeoTicket](self, "revGeoTicket"));
  objc_msgSend(v5, "cancel");

}

- (void)applyToCorrectedSearch:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CurrentLocationMapServiceTicket revGeoTicket](self, "revGeoTicket"));
  objc_msgSend(v5, "applyToCorrectedSearch:", v4);

}

- (CLLocation)currentLocation
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  int v21;
  CurrentLocationMapServiceTicket *v22;
  __int16 v23;
  void *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKLocationManager lastGoodLocation](self->_locationManager, "lastGoodLocation"));
  v4 = sub_1007E5E0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v21 = 134349315;
    v22 = self;
    v23 = 2113;
    v24 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Attempting to use last 'good' location: %{private}@", (uint8_t *)&v21, 0x16u);
  }

  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timestamp"));
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    v9 = v8;
    +[CLLocation _mapkit_timeToExpire](CLLocation, "_mapkit_timeToExpire");
    v11 = v10;

    if (v9 > v11)
    {
      v12 = sub_1007E5E0C();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        +[CLLocation _mapkit_timeToExpire](CLLocation, "_mapkit_timeToExpire");
        v21 = 134349312;
        v22 = self;
        v23 = 2048;
        v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[%{public}p] Last 'good' location is too old (> %f seconds); using last known location",
          (uint8_t *)&v21,
          0x16u);
      }

      v15 = objc_claimAutoreleasedReturnValue(-[MKLocationManager lastLocation](self->_locationManager, "lastLocation"));
      v3 = (void *)v15;
    }
  }
  else
  {
    v16 = sub_1007E5E0C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v21 = 134349056;
      v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[%{public}p] We don't have a last 'good' location; using last known location",
        (uint8_t *)&v21,
        0xCu);
    }

    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKLocationManager lastLocation](self->_locationManager, "lastLocation"));
  }
  v18 = sub_1007E5E0C();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v21 = 134349315;
    v22 = self;
    v23 = 2113;
    v24 = v3;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[%{public}p] Returning current location: %{private}@", (uint8_t *)&v21, 0x16u);
  }

  return (CLLocation *)v3;
}

- (void)setLocationFixOperation:(id)a3
{
  MKLocationManagerOperation *v5;
  MKLocationManagerOperation *v6;
  MKLocationManagerOperation **p_locationFixOperation;
  MKLocationManagerOperation *locationFixOperation;
  MKLocationManagerOperation *v9;

  v5 = (MKLocationManagerOperation *)a3;
  locationFixOperation = self->_locationFixOperation;
  p_locationFixOperation = &self->_locationFixOperation;
  v6 = locationFixOperation;
  if (locationFixOperation != v5)
  {
    v9 = v5;
    -[MKLocationManagerOperation cancel](v6, "cancel");
    objc_storeStrong((id *)p_locationFixOperation, a3);
    v5 = v9;
  }

}

- (void)setRevGeoTicket:(id)a3
{
  GEOMapServiceCorrectableTicket *v5;
  GEOMapServiceCorrectableTicket *v6;
  GEOMapServiceCorrectableTicket **p_revGeoTicket;
  GEOMapServiceCorrectableTicket *revGeoTicket;
  GEOMapServiceCorrectableTicket *v9;

  v5 = (GEOMapServiceCorrectableTicket *)a3;
  revGeoTicket = self->_revGeoTicket;
  p_revGeoTicket = &self->_revGeoTicket;
  v6 = revGeoTicket;
  if (revGeoTicket != v5)
  {
    v9 = v5;
    -[GEOMapServiceCorrectableTicket cancel](v6, "cancel");
    objc_storeStrong((id *)p_revGeoTicket, a3);
    v5 = v9;
  }

}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

- (MKLocationManagerOperation)locationFixOperation
{
  return self->_locationFixOperation;
}

- (GEOMapServiceCorrectableTicket)revGeoTicket
{
  return self->_revGeoTicket;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revGeoTicket, 0);
  objc_storeStrong((id *)&self->_locationFixOperation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
