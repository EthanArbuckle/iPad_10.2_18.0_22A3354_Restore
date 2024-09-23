@implementation HomeResultDataProvider

- (HomeResultDataProvider)initWithDelegate:(id)a3
{
  id v4;
  HomeResultDataProvider *v5;
  HomeResultDataProvider *v6;
  uint64_t v7;
  MKLocationManager *locationManager;
  uint64_t v9;
  GEONetworkObserver *networkObserver;
  HomeResultCache *v11;
  HomeResultCache *cache;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HomeResultDataProvider;
  v5 = -[HomeResultDataProvider init](&v14, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    locationManager = v6->_locationManager;
    v6->_locationManager = (MKLocationManager *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver"));
    networkObserver = v6->_networkObserver;
    v6->_networkObserver = (GEONetworkObserver *)v9;

    v11 = objc_alloc_init(HomeResultCache);
    cache = v6->_cache;
    v6->_cache = v11;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[HomeResultDataProvider _cancelTicket](self, "_cancelTicket");
  -[HomeResultDataProvider _cancelExpirationTimer](self, "_cancelExpirationTimer");
  v3.receiver = self;
  v3.super_class = (Class)HomeResultDataProvider;
  -[HomeResultDataProvider dealloc](&v3, "dealloc");
}

- (BOOL)hasInitialData
{
  return 1;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  id v6;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  MKLocationManager *locationManager;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;

  if (self->_active != a3)
  {
    v3 = a3;
    self->_active = a3;
    v6 = sub_100432EDC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class(self);
      v9 = NSStringFromClass(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = sub_10039E4FC(v3);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v20 = 138412802;
      v21 = v10;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ %@%@", (uint8_t *)&v20, 0x20u);

    }
    locationManager = self->_locationManager;
    if (v3)
    {
      -[MKLocationManager startLocationUpdateWithObserver:](locationManager, "startLocationUpdateWithObserver:", self);
      -[GEONetworkObserver addNetworkReachableObserver:selector:](self->_networkObserver, "addNetworkReachableObserver:selector:", self, "_networkReachabilityDidChange");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v16, "addObserver:selector:name:object:", self, "countryConfigurationDidChange:", GEOCountryConfigurationCountryCodeDidChangeNotification, 0);

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v17, "addObserver:selector:name:object:", self, "countryConfigurationDidChange:", GEOCountryConfigurationProvidersDidChangeNotification, 0);

      -[HomeResultDataProvider _refreshCachedResultAndNotifyObservers:](self, "_refreshCachedResultAndNotifyObservers:", 0);
      -[HomeResultDataProvider _createExpirationTimerIfNeeded](self, "_createExpirationTimerIfNeeded");
    }
    else
    {
      -[MKLocationManager stopLocationUpdateWithObserver:](locationManager, "stopLocationUpdateWithObserver:", self);
      -[GEONetworkObserver removeNetworkReachableObserver:](self->_networkObserver, "removeNetworkReachableObserver:", self);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v18, "removeObserver:name:object:", self, GEOCountryConfigurationCountryCodeDidChangeNotification, 0);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v19, "removeObserver:name:object:", self, GEOCountryConfigurationProvidersDidChangeNotification, 0);

      -[HomeResultDataProvider _cancelTicket](self, "_cancelTicket");
      -[HomeResultDataProvider _cancelExpirationTimer](self, "_cancelExpirationTimer");
    }
  }
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

- (HomeResult)homeResult
{
  void *v3;
  unsigned int v4;
  HomeResult *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeResult responseResult](self->_result, "responseResult"));
  v4 = objc_msgSend(v3, "isSuccess");

  if (v4)
    v5 = self->_result;
  else
    v5 = 0;
  return v5;
}

- (void)_updateWithResult:(id)a3 cacheKey:(id)a4 notifyObservers:(BOOL)a5
{
  _BOOL4 v5;
  HomeResult *v10;
  HomeResultCacheKey *v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  id v18;
  NSObject *v19;
  int v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  NSString *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  const char *aSelector;
  HomeResultCacheKey *v35;
  int v36;
  unsigned int v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  HomeResultCacheKey *v51;

  v5 = a5;
  v10 = (HomeResult *)a3;
  v11 = (HomeResultCacheKey *)a4;
  if (!self->_active)
    goto LABEL_19;
  v36 = v5;
  if (self->_result == v10)
    v12 = 1;
  else
    v12 = -[HomeResult isEqual:](v10, "isEqual:");
  v37 = v12;
  aSelector = a2;
  if (self->_resultCacheKey == v11)
    v13 = 1;
  else
    v13 = -[HomeResultCacheKey isEqual:](v11, "isEqual:");
  v35 = v11;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HomeResult expirationDate](v10, "expirationDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HomeResult expirationDate](self->_result, "expirationDate"));
  if (v14 == v15)
    v16 = 1;
  else
    v16 = objc_msgSend(v14, "isEqual:", v15);

  v17 = v37;
  if ((v37 & 1) != 0)
  {
    if ((v13 & 1) != 0)
      goto LABEL_13;
LABEL_21:
    objc_storeStrong((id *)&self->_resultCacheKey, a4);
    if ((v16 & 1) != 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  objc_storeStrong((id *)&self->_result, a3);
  if ((v13 & 1) == 0)
    goto LABEL_21;
LABEL_13:
  if ((v16 & 1) == 0)
  {
LABEL_14:
    -[HomeResultDataProvider _cancelExpirationTimer](self, "_cancelExpirationTimer");
    -[HomeResultDataProvider _createExpirationTimerIfNeeded](self, "_createExpirationTimerIfNeeded");
  }
LABEL_15:
  v18 = sub_100432EDC();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = v16 ^ 1;
    v21 = (objc_class *)objc_opt_class(self);
    v22 = NSStringFromClass(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = NSStringFromSelector(aSelector);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = sub_10039E4FC(v37 ^ 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = sub_10039E4FC(v13 ^ 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = sub_10039E4FC(v20);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = sub_10039E4FC(v36);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    *(_DWORD *)buf = 138413826;
    v39 = v23;
    v40 = 2112;
    v41 = v25;
    v42 = 2112;
    v43 = v27;
    v44 = 2112;
    v45 = v29;
    v46 = 2112;
    v47 = v31;
    v48 = 2112;
    v49 = v33;
    v50 = 2112;
    v51 = v35;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%@ %@, resultChanged = %@, cacheKeyChanged = %@, expirationDateChanged = %@, notifyObservers = %@, cacheKey = %@", buf, 0x48u);

    v17 = v37;
  }

  v11 = v35;
  if (((v17 | v36 ^ 1) & 1) == 0)
    -[GEOObserverHashTable homeDataProvidingObjectDidUpdate:](self->_observers, "homeDataProvidingObjectDidUpdate:", self);
LABEL_19:

}

- (void)_refreshCachedResultAndNotifyObservers:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_active)
  {
    v3 = a3;
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeResultDataProvider _currentCacheKey](self, "_currentCacheKey"));
    v6 = v5;
    if (!self->_resultCacheKey
      || !objc_msgSend(v5, "isEqualivantToKey:")
      || -[HomeResult isExpiredAtDate:](self->_result, "isExpiredAtDate:", v9))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeResultCache resultForKey:](self->_cache, "resultForKey:", v6));
      v8 = v7;
      if (v7 && (objc_msgSend(v7, "isExpiredAtDate:", v9) & 1) == 0)
      {
        -[HomeResultDataProvider _updateWithResult:cacheKey:notifyObservers:](self, "_updateWithResult:cacheKey:notifyObservers:", v8, v6, v3);
      }
      else if (!self->_ticketCacheKey || (objc_msgSend(v6, "isEqualivantToKey:") & 1) == 0)
      {
        -[HomeResultDataProvider _startTicketWithCacheKey:](self, "_startTicketWithCacheKey:", v6);
      }

    }
  }
}

- (void)_cancelTicket
{
  GEOMapServiceMapsHomeTicket *ticket;
  HomeResultCacheKey *ticketCacheKey;

  -[GEOMapServiceMapsHomeTicket cancel](self->_ticket, "cancel");
  ticket = self->_ticket;
  self->_ticket = 0;

  ticketCacheKey = self->_ticketCacheKey;
  self->_ticketCacheKey = 0;

}

- (void)_startTicketWithCacheKey:(id)a3
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  GEOMapServiceMapsHomeTicket **p_ticket;
  GEOMapServiceMapsHomeTicket *ticket;
  GEOMapServiceMapsHomeTicket *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;

  v6 = a3;
  v7 = sub_100432EDC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class(self);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)buf = 138412802;
    v26 = v11;
    v27 = 2112;
    v28 = v13;
    v29 = 2112;
    v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ %@, cacheKey = %@", buf, 0x20u);

  }
  -[HomeResultDataProvider _cancelTicket](self, "_cancelTicket");
  objc_initWeak((id *)buf, self);
  objc_storeStrong((id *)&self->_ticketCacheKey, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HomeResultDataProvider delegate](self, "delegate"));
  v16 = objc_msgSend(v15, "newTraits");
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ticketForMapsHomeWithTraits:", v16));
  ticket = self->_ticket;
  p_ticket = &self->_ticket;
  *p_ticket = (GEOMapServiceMapsHomeTicket *)v17;

  v20 = *p_ticket;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100850C98;
  v22[3] = &unk_1011D90F8;
  objc_copyWeak(&v24, (id *)buf);
  v21 = v6;
  v23 = v21;
  -[GEOMapServiceMapsHomeTicket submitWithHandler:networkActivity:](v20, "submitWithHandler:networkActivity:", v22, 0);

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

}

- (void)_handleResult:(id)a3 error:(id)a4 cacheKey:(id)a5
{
  id v9;
  id v10;
  HomeResultCacheKey *v11;
  HomeResultCacheKey *ticketCacheKey;
  uint64_t v13;
  void *v14;
  HomeResultCacheKey *v15;
  HomeResult *v16;
  void *v17;
  HomeResult *v18;
  void *v19;
  id v20;
  NSObject *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  HomeResultDataProvider *v29;
  HomeResult *v30;
  HomeResultCacheKey *v31;
  void **v32;
  uint64_t v33;
  void (*v34)(uint64_t, void *);
  void *v35;
  HomeResultDataProvider *v36;
  HomeResultCacheKey *v37;
  SEL v38;
  _QWORD v39[5];
  HomeResultCacheKey *v40;
  SEL v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;

  v9 = a3;
  v10 = a4;
  v11 = (HomeResultCacheKey *)a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  ticketCacheKey = self->_ticketCacheKey;
  if (ticketCacheKey == v11 || -[HomeResultCacheKey isEqual:](ticketCacheKey, "isEqual:", v11))
  {
    -[HomeResultDataProvider _cancelTicket](self, "_cancelTicket");
    if (v10)
    {
      if (-[HomeResultDataProvider _isNoNetworkError:](self, "_isNoNetworkError:", v10))
        goto LABEL_11;
      v13 = objc_claimAutoreleasedReturnValue(+[Result resultWithError:](Result, "resultWithError:", v10));
    }
    else
    {
      if (!v9)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HomeResultDataProviderErrorDomain"), 1, 0));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[Result resultWithError:](Result, "resultWithError:", v19));

        if (v14)
          goto LABEL_9;
        goto LABEL_11;
      }
      v13 = objc_claimAutoreleasedReturnValue(+[Result resultWithValue:](Result, "resultWithValue:", v9));
    }
    v14 = (void *)v13;
    if (v13)
    {
LABEL_9:
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_1008510DC;
      v39[3] = &unk_1011D9120;
      v39[4] = self;
      v41 = a2;
      v40 = v11;
      v32 = _NSConcreteStackBlock;
      v33 = 3221225472;
      v34 = sub_1008511C8;
      v35 = &unk_1011D9148;
      v36 = self;
      v38 = a2;
      v15 = v40;
      v37 = v15;
      objc_msgSend(v14, "withValue:orError:", v39, &v32);

      v16 = [HomeResult alloc];
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", v32, v33, v34, v35, v36));
      v18 = -[HomeResult initWithResponseResult:responseDate:](v16, "initWithResponseResult:responseDate:", v14, v17);

      -[HomeResultCache setResult:forKey:](self->_cache, "setResult:forKey:", v18, v15);
      goto LABEL_14;
    }
LABEL_11:
    v20 = sub_100432EDC();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = (objc_class *)objc_opt_class(self);
      v23 = NSStringFromClass(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      *(_DWORD *)buf = 138412546;
      v43 = v24;
      v44 = 2112;
      v45 = v26;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%@ %@, network is offline", buf, 0x16u);

    }
    v14 = 0;
    v18 = 0;
LABEL_14:
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[HomeResultDataProvider _currentCacheKey](self, "_currentCacheKey"));
    v28 = v27;
    if (v18)
    {
      if (objc_msgSend(v27, "isEqualivantToKey:", v11))
      {
        v29 = self;
        v30 = v18;
        v31 = v11;
LABEL_19:
        -[HomeResultDataProvider _updateWithResult:cacheKey:notifyObservers:](v29, "_updateWithResult:cacheKey:notifyObservers:", v30, v31, 1);
      }
    }
    else if (!-[HomeResultCacheKey isEqualivantToKey:](self->_resultCacheKey, "isEqualivantToKey:", v11))
    {
      v29 = self;
      v30 = 0;
      v31 = 0;
      goto LABEL_19;
    }

  }
}

- (BOOL)_isNoNetworkError:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  BOOL v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v5 = objc_msgSend(v4, "isEqualToString:", NSURLErrorDomain);

  if (v5)
  {
    if (objc_msgSend(v3, "code") != (id)-1009)
    {
LABEL_7:
      v10 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v7 = GEOErrorDomain(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

    if (!v9 || objc_msgSend(v3, "code") != (id)-9)
      goto LABEL_7;
  }
  v10 = 1;
LABEL_8:

  return v10;
}

- (id)_currentCacheKey
{
  void *v3;
  void *v4;
  void *v5;
  HomeResultCacheKey *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "countryCode"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKLocationManager currentLocation](self->_locationManager, "currentLocation"));
  v6 = -[HomeResultCacheKey initWithCountryCode:location:]([HomeResultCacheKey alloc], "initWithCountryCode:location:", v4, v5);

  return v6;
}

- (void)_cancelExpirationTimer
{
  NSTimer *resultExpirationTimer;

  -[NSTimer invalidate](self->_resultExpirationTimer, "invalidate");
  resultExpirationTimer = self->_resultExpirationTimer;
  self->_resultExpirationTimer = 0;

}

- (void)_createExpirationTimerIfNeeded
{
  void *v3;
  NSTimer *v4;
  NSTimer *resultExpirationTimer;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  if (!self->_resultExpirationTimer)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeResult expirationDate](self->_result, "expirationDate"));
    if (v3)
    {
      objc_initWeak(&location, self);
      v6 = _NSConcreteStackBlock;
      v7 = 3221225472;
      v8 = sub_100851534;
      v9 = &unk_1011ADF20;
      objc_copyWeak(&v10, &location);
      v4 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer _maps_scheduledTimerWithFireDate:block:](NSTimer, "_maps_scheduledTimerWithFireDate:block:", v3, &v6));
      resultExpirationTimer = self->_resultExpirationTimer;
      self->_resultExpirationTimer = v4;

      -[NSTimer setTolerance:](self->_resultExpirationTimer, "setTolerance:", 1.0, v6, v7, v8, v9);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }

  }
}

- (void)_expirationTimerFired
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v4 = sub_100432EDC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v11, 0x16u);

  }
  -[HomeResultDataProvider _cancelExpirationTimer](self, "_cancelExpirationTimer");
  -[HomeResultDataProvider _refreshCachedResultAndNotifyObservers:](self, "_refreshCachedResultAndNotifyObservers:", 1);
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  -[HomeResultDataProvider _refreshCachedResultAndNotifyObservers:](self, "_refreshCachedResultAndNotifyObservers:", 1);
}

- (void)locationManagerDidReset:(id)a3
{
  -[HomeResultDataProvider _refreshCachedResultAndNotifyObservers:](self, "_refreshCachedResultAndNotifyObservers:", 1);
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (void)_networkReachabilityDidChange
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[HomeResultDataProvider _refreshCachedResultAndNotifyObservers:](self, "_refreshCachedResultAndNotifyObservers:", 1);
}

- (void)countryConfigurationDidChange:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[HomeResultDataProvider _refreshCachedResultAndNotifyObservers:](self, "_refreshCachedResultAndNotifyObservers:", 1);
}

- (BOOL)active
{
  return self->_active;
}

- (HomeResultDataProviderDelegate)delegate
{
  return (HomeResultDataProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_ticketCacheKey, 0);
  objc_storeStrong((id *)&self->_resultExpirationTimer, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_resultCacheKey, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_networkObserver, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
