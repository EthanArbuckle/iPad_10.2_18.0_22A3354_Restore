@implementation TrafficIncidentLayoutManager

- (TrafficIncidentLayoutManager)initWithFormType:(int)a3
{
  TrafficIncidentLayoutManager *v4;
  TrafficIncidentLayoutManager *v5;
  void *v6;
  uint64_t v7;
  TrafficIncidentLayout *incidentLayout;
  CARSessionStatus *v9;
  CARSessionStatus *carSessionStatus;
  id v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TrafficIncidentLayoutManager;
  v4 = -[TrafficIncidentLayoutManager init](&v14, "init");
  v5 = v4;
  if (v4)
  {
    v4->_formType = a3;
    if (a3 == 7)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutStorage sharedInstance](TrafficIncidentLayoutStorage, "sharedInstance"));
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cachedIncidentLayout"));
    }
    else
    {
      if (a3 != 9)
      {
LABEL_7:
        v9 = objc_opt_new(CARSessionStatus);
        carSessionStatus = v5->_carSessionStatus;
        v5->_carSessionStatus = v9;

        -[CARSessionStatus addSessionObserver:](v5->_carSessionStatus, "addSessionObserver:", v5);
        v11 = +[TrafficIncidentAuthenticationManager sharedInstance](TrafficIncidentAuthenticationManager, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v12, "addObserver:selector:name:object:", v5, "offlineMapsStateChanged", CFSTR("UsingOfflineMapsStateChangedNotification"), 0);

        return v5;
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutStorage sharedInstance](TrafficIncidentLayoutStorage, "sharedInstance"));
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cachedIncidentVotingLayout"));
    }
    incidentLayout = v5->_incidentLayout;
    v5->_incidentLayout = (TrafficIncidentLayout *)v7;

    goto LABEL_7;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[TrafficIncidentLayoutManager stopPeriodicRefresh](self, "stopPeriodicRefresh");
  v3.receiver = self;
  v3.super_class = (Class)TrafficIncidentLayoutManager;
  -[TrafficIncidentLayoutManager dealloc](&v3, "dealloc");
}

+ (TrafficIncidentLayoutManager)sharedInstance
{
  if (qword_1014D37A8 != -1)
    dispatch_once(&qword_1014D37A8, &stru_1011DA088);
  return (TrafficIncidentLayoutManager *)(id)qword_1014D37B0;
}

+ (int64_t)creationPreference
{
  return 1;
}

- (BOOL)isIncidentReportingEnabled
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v4 = objc_msgSend(v3, "isUsingOfflineMaps");

  if ((v4 & 1) != 0 || !MapsFeature_IsEnabled_Bakersfield())
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentAuthenticationManager sharedInstance](TrafficIncidentAuthenticationManager, "sharedInstance"));
  if (objc_msgSend(v5, "isSupported"))
    v6 = -[TrafficIncidentLayout isIncidentReportingEnabled](self->_incidentLayout, "isIncidentReportingEnabled");
  else
    v6 = 0;

  return v6;
}

- (void)setIncidentLayout:(id)a3
{
  TrafficIncidentLayout *v5;
  TrafficIncidentLayout *incidentLayout;
  unsigned int v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  TrafficIncidentLayout *v11;
  void *v12;
  int v13;
  TrafficIncidentLayout *v14;

  v5 = (TrafficIncidentLayout *)a3;
  incidentLayout = self->_incidentLayout;
  if (incidentLayout != v5)
  {
    v7 = -[TrafficIncidentLayout isIncidentReportingEnabled](incidentLayout, "isIncidentReportingEnabled");
    v8 = v7 ^ -[TrafficIncidentLayout isIncidentReportingEnabled](v5, "isIncidentReportingEnabled");
    objc_storeStrong((id *)&self->_incidentLayout, a3);
    v9 = sub_1004327DC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = self->_incidentLayout;
      v13 = 138412290;
      v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "TrafficIncidentLayoutManager: cached incidentLayout %@", (uint8_t *)&v13, 0xCu);
    }

    if (v8)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentLayoutManager observers](self, "observers"));
      objc_msgSend(v12, "incidentsReportingEnablementDidUpdate");

    }
  }

}

- (id)currentIncidentsLayout
{
  return -[TrafficIncidentLayout layoutItems](self->_incidentLayout, "layoutItems");
}

- (void)fetchTrafficIncidentsLayout:(id)a3
{
  void (**v4)(id, void *);
  TrafficIncidentLayout *incidentLayout;
  void *v6;
  void *v7;
  TrafficIncidentLayoutFetcher *v8;
  uint64_t v9;
  _QWORD v10[4];
  void (**v11)(id, void *);
  id v12;
  id location;

  v4 = (void (**)(id, void *))a3;
  if (v4
    && (incidentLayout = self->_incidentLayout) != 0
    && !-[TrafficIncidentLayout shouldInvalidateLayout](incidentLayout, "shouldInvalidateLayout"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentLayout layoutItems](self->_incidentLayout, "layoutItems"));
    v4[2](v4, v7);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentLocation"));

    if (v7)
    {
      v8 = objc_alloc_init(TrafficIncidentLayoutFetcher);
      objc_initWeak(&location, self);
      v9 = -[TrafficIncidentLayoutManager formType](self, "formType");
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100895F6C;
      v10[3] = &unk_1011DA0B0;
      objc_copyWeak(&v12, &location);
      v11 = v4;
      -[TrafficIncidentLayoutFetcher fetchTrafficIncidentsLayoutForLocation:formType:completion:](v8, "fetchTrafficIncidentsLayoutForLocation:formType:completion:", v7, v9, v10);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);

    }
    else if (v4)
    {
      v4[2](v4, &__NSArray0__struct);
    }
  }

}

- (BOOL)containsVKTrafficIncidentType:(int64_t)a3
{
  return -[TrafficIncidentLayoutManager containsGEOTrafficIncidentType:](self, "containsGEOTrafficIncidentType:", +[TrafficIncidentLayoutItem geoTrafficIncidentTypeForVKType:](TrafficIncidentLayoutItem, "geoTrafficIncidentTypeForVKType:", a3));
}

- (BOOL)containsGEOTrafficIncidentType:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentLayoutManager incidentLayout](self, "incidentLayout"));
  LOBYTE(v3) = objc_msgSend(v4, "isIncidentTypeSupported:", v3);

  return v3;
}

- (BOOL)isIncidentTypeDisplayedOnMap:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentLayoutManager incidentLayout](self, "incidentLayout"));
  LOBYTE(v3) = objc_msgSend(v4, "isIncidentTypeDisplayedOnMap:", v3);

  return v3;
}

- (void)startPeriodicRefresh
{
  NSTimer *v3;
  id v4;

  v3 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_invalidateCachedLayoutIfNeeded", 0, 1, GEOConfigGetDouble(MapsConfig_TrafficIncidentLayoutManagerFrequencyLimit, off_1014B35A8));
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  -[TrafficIncidentLayoutManager setLayoutRefreshTimer:](self, "setLayoutRefreshTimer:", v4);

}

- (void)stopPeriodicRefresh
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentLayoutManager layoutRefreshTimer](self, "layoutRefreshTimer"));
  objc_msgSend(v3, "invalidate");

  -[TrafficIncidentLayoutManager setLayoutRefreshTimer:](self, "setLayoutRefreshTimer:", 0);
}

- (BOOL)_shouldInvalidateLayout
{
  TrafficIncidentLayout *incidentLayout;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  incidentLayout = self->_incidentLayout;
  if (incidentLayout)
    return -[TrafficIncidentLayout shouldInvalidateLayout](incidentLayout, "shouldInvalidateLayout");
  v4 = sub_1004327DC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "TrafficIncidentLayoutManager: Initial fetching", v6, 2u);
  }

  return 1;
}

- (void)_invalidateCachedLayoutIfNeeded
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (-[TrafficIncidentLayoutManager _shouldInvalidateLayout](self, "_shouldInvalidateLayout"))
  {
    -[TrafficIncidentLayoutManager fetchTrafficIncidentsLayout:](self, "fetchTrafficIncidentsLayout:", &stru_1011DA0F0);
  }
  else
  {
    v3 = sub_1004327DC();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "TrafficIncidentLayoutManager: invalidateCachedLayout not needed", v5, 2u);
    }

  }
}

- (void)platformController:(id)a3 willChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a4;
  v7 = a5;
  if (MapsFeature_IsEnabled_Bakersfield())
  {
    v8 = objc_opt_class(RoutePlanningSession);
    if ((objc_opt_isKindOfClass(v11, v8) & 1) != 0)
    {
      v9 = objc_opt_class(NavigationSession);
      if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
      {
        -[TrafficIncidentLayoutManager _invalidateCachedLayoutIfNeeded](self, "_invalidateCachedLayoutIfNeeded");
        -[TrafficIncidentLayoutManager startPeriodicRefresh](self, "startPeriodicRefresh");
      }
    }
    v10 = objc_opt_class(NavigationSession);
    if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0)
      -[TrafficIncidentLayoutManager stopPeriodicRefresh](self, "stopPeriodicRefresh");
  }

}

- (id)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___TrafficIncidentLayoutManagerObserver, &_dispatch_main_q);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TrafficIncidentLayoutManager observers](self, "observers"));
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TrafficIncidentLayoutManager observers](self, "observers"));
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (void)sessionDidConnect:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_1004327DC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "TrafficIncidentLayoutManager: carSession didConnect", v6, 2u);
  }

  -[TrafficIncidentLayoutManager _invalidateCachedLayoutIfNeeded](self, "_invalidateCachedLayoutIfNeeded");
}

- (void)offlineMapsStateChanged
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_1004327DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "TrafficIncidentLayoutManager: offlineMapsStateChanged", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentLayoutManager observers](self, "observers"));
  objc_msgSend(v5, "incidentsReportingEnablementDidUpdate");

}

- (TrafficIncidentLayout)incidentLayout
{
  return self->_incidentLayout;
}

- (NSTimer)layoutRefreshTimer
{
  return self->_layoutRefreshTimer;
}

- (void)setLayoutRefreshTimer:(id)a3
{
  objc_storeStrong((id *)&self->_layoutRefreshTimer, a3);
}

- (int)formType
{
  return self->_formType;
}

- (void)setFormType:(int)a3
{
  self->_formType = a3;
}

- (CARSessionStatus)carSessionStatus
{
  return self->_carSessionStatus;
}

- (void)setCarSessionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_carSessionStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_layoutRefreshTimer, 0);
  objc_storeStrong((id *)&self->_incidentLayout, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
