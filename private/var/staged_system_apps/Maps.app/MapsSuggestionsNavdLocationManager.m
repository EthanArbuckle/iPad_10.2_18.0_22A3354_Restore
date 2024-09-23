@implementation MapsSuggestionsNavdLocationManager

- (MapsSuggestionsNavdLocationManager)initWithName:(id)a3 locationBundleID:(id)a4 queue:(id)a5
{
  id v7;
  MapsSuggestionsNavdLocationManager *v8;
  id v9;
  CLLocationManager *v10;
  CLLocationManager *locationManager;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v7 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MapsSuggestionsNavdLocationManager;
  v8 = -[MapsSuggestionsNavdLocationManager initWithName:queue:](&v16, "initWithName:queue:", a3, v7);
  if (v8)
  {
    v9 = objc_alloc((Class)CLLocationManager);
    v10 = (CLLocationManager *)objc_msgSend(v9, "initWithEffectiveBundleIdentifier:delegate:onQueue:", MapsAppBundleId, v8, v7);
    locationManager = v8->_locationManager;
    v8->_locationManager = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NavdLocationLeecher sharedLeecher](NavdLocationLeecher, "sharedLeecher"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leechedLocations"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastObject"));
    -[MapsSuggestionsNavdLocationManager considerMyNewLocation:](v8, "considerMyNewLocation:", v14);

  }
  return v8;
}

- (MapsSuggestionsNavdLocationManager)initWithName:(id)a3 locationBundlePath:(id)a4 limitingBundleID:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  MapsSuggestionsNavdLocationManager *v13;
  CLLocationManager *v14;
  CLLocationManager *locationManager;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MapsSuggestionsNavdLocationManager;
  v13 = -[MapsSuggestionsNavdLocationManager initWithName:queue:](&v20, "initWithName:queue:", a3, v12);
  if (v13)
  {
    v14 = (CLLocationManager *)objc_msgSend(objc_alloc((Class)CLLocationManager), "initWithEffectiveBundlePath:limitingBundleIdentifier:delegate:onQueue:", v10, v11, v13, v12);
    locationManager = v13->_locationManager;
    v13->_locationManager = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NavdLocationLeecher sharedLeecher](NavdLocationLeecher, "sharedLeecher"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leechedLocations"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastObject"));
    -[MapsSuggestionsNavdLocationManager considerMyNewLocation:](v13, "considerMyNewLocation:", v18);

  }
  return v13;
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(self), "description");
}

- (void)onStartImplementation
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[MapsSuggestionsNavdLocationManager dispatchQueue](self, "dispatchQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008DA090;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)onStopImplementation
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[MapsSuggestionsNavdLocationManager dispatchQueue](self, "dispatchQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008DA308;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_updateLocationIfAllowed:(id)a3
{
  id v4;

  v4 = a3;
  -[MapsSuggestionsNavdLocationManager considerMyAllowanceAsLimited:](self, "considerMyAllowanceAsLimited:", -[MapsSuggestionsNavdLocationManager _hasMapsCoarseLocationEnabled](self, "_hasMapsCoarseLocationEnabled"));
  if (-[MapsSuggestionsNavdLocationManager hasMapsLocationAccess](self, "hasMapsLocationAccess"))
    -[MapsSuggestionsNavdLocationManager considerMyNewLocation:](self, "considerMyNewLocation:", v4);

}

- (void)locationLeecher:(id)a3 receivedLocation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_claimAutoreleasedReturnValue(-[MapsSuggestionsNavdLocationManager dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008DA5D8;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v12, &location);
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)locationLeecher:(id)a3 errorLeechingLocation:(id)a4
{
  char *v4;
  uint64_t Log;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;

  v4 = (char *)a4;
  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "MapsSuggestionsNavdLocationManager");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v12 = 138412290;
      v13 = v4;
      v8 = "Error leeching location : %@";
      v9 = v7;
      v10 = OS_LOG_TYPE_DEBUG;
      v11 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v12, v11);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    v12 = 136446978;
    v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/MapsSuggestionsNavdLocationManager.m";
    v14 = 1024;
    v15 = 119;
    v16 = 2082;
    v17 = "-[MapsSuggestionsNavdLocationManager locationLeecher:errorLeechingLocation:]";
    v18 = 2082;
    v19 = "nil == (error)";
    v8 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an error";
    v9 = v7;
    v10 = OS_LOG_TYPE_FAULT;
    v11 = 38;
    goto LABEL_6;
  }

}

- (BOOL)_hasMapsCoarseLocationEnabled
{
  return -[CLLocationManager accuracyAuthorization](self->_locationManager, "accuracyAuthorization") != CLAccuracyAuthorizationFullAccuracy;
}

- (BOOL)hasMapsLocationAccess
{
  if (+[CLLocationManager authorizationStatusForBundleIdentifier:](CLLocationManager, "authorizationStatusForBundleIdentifier:", MapsAppBundleId)- 3 > 1)return 0;
  else
    return !-[MapsSuggestionsNavdLocationManager _hasMapsCoarseLocationEnabled](self, "_hasMapsCoarseLocationEnabled");
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  _BOOL8 v4;
  uint64_t Log;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;

  v4 = -[MapsSuggestionsNavdLocationManager _hasMapsCoarseLocationEnabled](self, "_hasMapsCoarseLocationEnabled", a3);
  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "MapsSuggestionsNavdLocationManager");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = CFSTR("NO");
    if (v4)
      v7 = CFSTR("YES");
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "DidChangeAuthorization coarse location enabled : %@", (uint8_t *)&v8, 0xCu);
  }

  -[MapsSuggestionsNavdLocationManager considerMyAllowanceAsLimited:](self, "considerMyAllowanceAsLimited:", v4);
}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  MapsSuggestionsNavdLocationManager *v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_claimAutoreleasedReturnValue(-[MapsSuggestionsNavdLocationManager dispatchQueue](self, "dispatchQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1008DAA7C;
  v10[3] = &unk_1011AFE28;
  v11 = v7;
  v9 = v7;
  objc_copyWeak(&v13, &location);
  v12 = self;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (BOOL)hasLocationAccess
{
  BOOL result;

  result = -[MapsSuggestionsNavdLocationManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
