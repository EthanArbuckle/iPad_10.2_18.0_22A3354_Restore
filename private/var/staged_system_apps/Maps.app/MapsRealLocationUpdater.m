@implementation MapsRealLocationUpdater

- (BOOL)startLocationUpdatesForDelegate:(id)a3
{
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  char *v10;
  NSString *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t Log;
  BOOL v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSString *v21;
  void *v22;
  void *v23;
  int v25;
  const char *v26;
  __int16 v27;
  _BYTE v28[14];
  __int16 v29;
  const char *v30;

  v6 = a3;
  if (!v6)
  {
    v13 = sub_10043253C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v25 = 136446978;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/MapsRealLocationUpdater.m";
      v27 = 1024;
      *(_DWORD *)v28 = 24;
      *(_WORD *)&v28[4] = 2082;
      *(_QWORD *)&v28[6] = "-[MapsRealLocationUpdater startLocationUpdatesForDelegate:]";
      v29 = 2082;
      v30 = "nil == delegate";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. delegate cannot be nil", (uint8_t *)&v25, 0x26u);
    }

    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "TransitPay");
    v7 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v25 = 136446978;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/MapsRealLocationUpdater.m";
      v27 = 1024;
      *(_DWORD *)v28 = 24;
      *(_WORD *)&v28[4] = 2082;
      *(_QWORD *)&v28[6] = "-[MapsRealLocationUpdater startLocationUpdatesForDelegate:]";
      v29 = 2082;
      v30 = "nil == delegate";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. delegate cannot be nil", (uint8_t *)&v25, 0x26u);
    }
    goto LABEL_10;
  }
  v7 = self->_delegate;
  objc_sync_enter(v7);
  if (self->_delegate)
  {
    v8 = sub_10043253C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (char *)(id)objc_opt_class(self);
      v11 = NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v25 = 138412546;
      v26 = v10;
      v27 = 2112;
      *(_QWORD *)v28 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ %@: delegate for location updates is already set", (uint8_t *)&v25, 0x16u);

    }
    objc_sync_exit(v7);
LABEL_10:
    v16 = 0;
    goto LABEL_14;
  }
  objc_sync_exit(v7);

  v17 = sub_10043253C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = (void *)objc_opt_class(self);
    v20 = v19;
    v21 = NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v25 = 138412546;
    v26 = (const char *)v19;
    v27 = 2112;
    *(_QWORD *)v28 = v22;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@ %@: starting location updates", (uint8_t *)&v25, 0x16u);

  }
  v7 = self->_delegate;
  objc_sync_enter(v7);
  objc_storeStrong((id *)&self->_delegate, a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v23, "startLocationUpdateWithObserver:", self);

  objc_sync_exit(v7);
  v16 = 1;
LABEL_14:

  return v16;
}

- (void)stopLocationUpdates
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSString *v8;
  void *v9;
  MapsLocationUpdaterDelegate *v10;
  MapsLocationUpdaterDelegate *delegate;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;

  v4 = sub_10043253C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_opt_class(self);
    v7 = v6;
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v13 = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ %@: stopping location updates", (uint8_t *)&v13, 0x16u);

  }
  v10 = self->_delegate;
  objc_sync_enter(v10);
  delegate = self->_delegate;
  self->_delegate = 0;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v12, "stopLocationUpdateWithObserver:", self);

  objc_sync_exit(v10);
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  MapsLocationUpdaterDelegate *v4;
  MapsLocationUpdaterDelegate *delegate;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self->_delegate;
  objc_sync_enter(v4);
  delegate = self->_delegate;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentLocation"));
  -[MapsLocationUpdaterDelegate didUpdateLocation:](delegate, "didUpdateLocation:", v6);

  objc_sync_exit(v4);
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
