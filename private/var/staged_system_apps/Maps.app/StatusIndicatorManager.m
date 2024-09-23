@implementation StatusIndicatorManager

- (StatusIndicatorManager)initWithDelegate:(id)a3
{
  id v4;
  StatusIndicatorManager *v5;
  StatusIndicatorManager *v6;
  RadiosPreferences *v7;
  RadiosPreferences *radioPreferences;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)StatusIndicatorManager;
  v5 = -[StatusIndicatorManager init](&v16, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (RadiosPreferences *)objc_msgSend(objc_alloc((Class)RadiosPreferences), "initWithQueue:", &_dispatch_main_q);
    radioPreferences = v6->_radioPreferences;
    v6->_radioPreferences = v7;

    -[RadiosPreferences setDelegate:](v6->_radioPreferences, "setDelegate:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "locationProvider"));
    v6->_initialLocationProviderClass = (Class)objc_opt_class(v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver"));
    objc_msgSend(v11, "addNetworkReachableObserver:selector:", v6, "updateIndicatorType");

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, "updateIndicatorType", CFSTR("UsingOfflineMapsStateChangedNotification"), 0);

    _GEOConfigAddDelegateListenerForKey(MapsConfig_OfflineOnlyData, off_1014B4C08, &_dispatch_main_q, v6);
    _GEOConfigAddDelegateListenerForKey(MapsConfig_EnableStatusBarIndicator, off_1014B4FE8, &_dispatch_main_q, v6);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, "locationManagerApprovalDidChange:", MKLocationManagerApprovalDidChangeNotification, 0);

    v6->_indicatorType = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v6->_waitingForAuthorization = objc_msgSend(v14, "isAuthorizationNotDetermined");

    -[StatusIndicatorManager updateIndicatorType](v6, "updateIndicatorType");
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver"));
  objc_msgSend(v3, "removeNetworkReachableObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)StatusIndicatorManager;
  -[StatusIndicatorManager dealloc](&v4, "dealloc");
}

- (void)locationManagerApprovalDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "locationProvider"));
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100392100;
  v9[3] = &unk_1011AD1E8;
  objc_copyWeak(&v11, &location);
  v7 = v6;
  v10 = v7;
  v8 = objc_retainBlock(v9);
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    ((void (*)(_QWORD *))v8[2])(v8);
  else
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)setIndicatorType:(unint64_t)a3
{
  void *v4;

  if (self->_indicatorType != a3)
  {
    self->_indicatorType = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorManager delegate](self, "delegate"));
    objc_msgSend(v4, "statusIndicatorTypeChanged:", -[StatusIndicatorManager indicatorType](self, "indicatorType"));

    +[MapsAnalyticStateProvider updatePreciseLocationInformation](MapsAnalyticStateProvider, "updatePreciseLocationInformation");
  }
}

- (void)updateIndicatorType
{
  uint64_t BOOL;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  StatusIndicatorManager *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  _BOOL4 waitingForAuthorization;

  BOOL = GEOConfigGetBOOL(MapsConfig_EnableStatusBarIndicator, off_1014B4FE8);
  if ((BOOL & 1) == 0)
    goto LABEL_17;
  v5 = MKCurrentNetworkConnectionFailureDiagnosis(BOOL, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v7 = objc_msgSend(v6, "isUsingForcedOfflineMaps");

  if (!v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v11 = objc_msgSend(v10, "isUsingOfflineMaps");

    if (v11)
    {
      v8 = self;
      v9 = 7;
      goto LABEL_18;
    }
    switch(v5)
    {
      case 1:
        v8 = self;
        v9 = 3;
        goto LABEL_18;
      case 2:
        v8 = self;
        v9 = 4;
        goto LABEL_18;
      case 3:
        v8 = self;
        v9 = 2;
        goto LABEL_18;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v13 = objc_msgSend(v12, "isLocationServicesPossiblyAvailable");

    if ((v13 & 1) == 0)
    {
      v8 = self;
      v9 = 5;
      goto LABEL_18;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    if ((objc_msgSend(v14, "isAuthorizedForPreciseLocation") & 1) != 0)
    {

    }
    else
    {
      waitingForAuthorization = self->_waitingForAuthorization;

      if (!waitingForAuthorization)
      {
        v8 = self;
        v9 = 6;
        goto LABEL_18;
      }
    }
LABEL_17:
    v8 = self;
    v9 = 1;
    goto LABEL_18;
  }
  v8 = self;
  v9 = 8;
LABEL_18:
  -[StatusIndicatorManager setIndicatorType:](v8, "setIndicatorType:", v9);
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  void *var1;
  unsigned int var0;

  var1 = a3.var1;
  var0 = a3.var0;
  if (a3.var0 == (_DWORD)MapsConfig_EnableStatusBarIndicator && a3.var1 == off_1014B4FE8)
    -[StatusIndicatorManager updateIndicatorType](self, "updateIndicatorType");
  if (var0 == (_DWORD)MapsConfig_OfflineOnlyData && var1 == off_1014B4C08)
    -[StatusIndicatorManager updateIndicatorType](self, "updateIndicatorType");
}

- (unint64_t)indicatorType
{
  return self->_indicatorType;
}

- (StatusIndicatorDelegate)delegate
{
  return (StatusIndicatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_radioPreferences, 0);
}

@end
