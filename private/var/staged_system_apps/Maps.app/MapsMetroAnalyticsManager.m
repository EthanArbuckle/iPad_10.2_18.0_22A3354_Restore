@implementation MapsMetroAnalyticsManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004B9864;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D2678 != -1)
    dispatch_once(&qword_1014D2678, block);
  return (id)qword_1014D2670;
}

- (MapsMetroAnalyticsManager)init
{
  MapsMetroAnalyticsManager *v2;
  uint64_t v3;
  uint64_t v4;
  OS_dispatch_queue *analyticsQueue;
  MeCardDataProvider *v6;
  MeCardDataProvider *meCardProvider;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MapsMetroAnalyticsManager;
  v2 = -[MapsMetroAnalyticsManager init](&v13, "init");
  if (v2)
  {
    v3 = geo_dispatch_queue_create_with_qos("com.apple.Maps.MapsMetroAnalyticsManager", 17);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    analyticsQueue = v2->_analyticsQueue;
    v2->_analyticsQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(MeCardDataProvider);
    meCardProvider = v2->_meCardProvider;
    v2->_meCardProvider = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardDataProvider observers](v2->_meCardProvider, "observers"));
    objc_msgSend(v8, "registerObserver:", v2);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, "_applicationWillEnterForeground:", UIApplicationWillEnterForegroundNotification, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, "_applicationDidEnterBackground:", UIApplicationDidEnterBackgroundNotification, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, "_locationManagerApprovalDidChange:", MKLocationManagerApprovalDidChangeNotification, 0);

  }
  return v2;
}

- (void)startMonitoring
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsMetroAnalyticsManager meCardProvider](self, "meCardProvider"));
  objc_msgSend(v3, "setActive:", 1);

  -[MapsMetroAnalyticsManager _startLocationUpdateTimerIfNeeded](self, "_startLocationUpdateTimerIfNeeded");
}

- (void)stopMonitoring
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsMetroAnalyticsManager meCardProvider](self, "meCardProvider"));
  objc_msgSend(v3, "setActive:", 0);

  -[MapsMetroAnalyticsManager _stopLocationUpdateTimer](self, "_stopLocationUpdateTimer");
}

- (void)_applicationDidEnterBackground:(id)a3
{
  -[MapsMetroAnalyticsManager stopMonitoring](self, "stopMonitoring", a3);
}

- (void)_locationManagerApprovalDidChange:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager", a3));
  v5 = objc_msgSend(v4, "isAuthorizedForPreciseLocation");

  if (v5)
  {
    dispatch_async((dispatch_queue_t)self->_analyticsQueue, &stru_1011B8B68);
    -[MapsMetroAnalyticsManager _startLocationUpdateTimerIfNeeded](self, "_startLocationUpdateTimerIfNeeded");
  }
  else
  {
    -[MapsMetroAnalyticsManager _stopLocationUpdateTimer](self, "_stopLocationUpdateTimer");
    v6 = (id)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
    objc_msgSend(v6, "setCurrentMetro:", 0);

  }
}

- (void)_startLocationUpdateTimerIfNeeded
{
  void *v3;
  unsigned int v4;
  double Double;
  OS_dispatch_source *v6;
  OS_dispatch_source *currentLocationUpdateTimer;

  if (!self->_currentLocationUpdateTimer)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v4 = objc_msgSend(v3, "isAuthorizedForPreciseLocation");

    if (v4)
    {
      Double = GEOConfigGetDouble(MapsConfig_MetroAnalyticsCurrentLocationUpdateTimeInterval, off_1014B3DC8);
      v6 = (OS_dispatch_source *)geo_dispatch_timer_create_on_queue(self->_analyticsQueue, &stru_1011B8B88, 0.0, Double, 1.0);
      currentLocationUpdateTimer = self->_currentLocationUpdateTimer;
      self->_currentLocationUpdateTimer = v6;

      dispatch_resume((dispatch_object_t)self->_currentLocationUpdateTimer);
    }
  }
}

- (void)_stopLocationUpdateTimer
{
  NSObject *currentLocationUpdateTimer;
  OS_dispatch_source *v4;

  currentLocationUpdateTimer = self->_currentLocationUpdateTimer;
  if (currentLocationUpdateTimer)
  {
    dispatch_source_cancel(currentLocationUpdateTimer);
    v4 = self->_currentLocationUpdateTimer;
    self->_currentLocationUpdateTimer = 0;

  }
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *analyticsQueue;
  id v11;
  _QWORD block[4];
  id v13;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsMetroAnalyticsManager meCardProvider](self, "meCardProvider"));

  if (v5 == v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsMetroAnalyticsManager meCardProvider](self, "meCardProvider"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "meCard"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItemsForHome"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

    analyticsQueue = self->_analyticsQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004B9DB4;
    block[3] = &unk_1011AC860;
    v13 = v9;
    v11 = v9;
    dispatch_async(analyticsQueue, block);

  }
}

- (MeCardDataProvider)meCardProvider
{
  return self->_meCardProvider;
}

- (void)setMeCardProvider:(id)a3
{
  objc_storeStrong((id *)&self->_meCardProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meCardProvider, 0);
  objc_storeStrong((id *)&self->_currentLocationUpdateTimer, 0);
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
}

@end
