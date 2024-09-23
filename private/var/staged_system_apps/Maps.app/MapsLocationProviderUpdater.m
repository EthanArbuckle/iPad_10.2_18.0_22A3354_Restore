@implementation MapsLocationProviderUpdater

- (MapsLocationProviderUpdater)initWithLocationManager:(id)a3
{
  id v5;
  MapsLocationProviderUpdater *v6;
  MapsLocationProviderUpdater *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsLocationProviderUpdater;
  v6 = -[MapsLocationProviderUpdater init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_locationManager, a3);

  return v7;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)setObservedNavigationSession:(id)a3
{
  NavigationSession *v5;
  NavigationSession *observedNavigationSession;
  NavigationSession *v7;

  v5 = (NavigationSession *)a3;
  observedNavigationSession = self->_observedNavigationSession;
  if (observedNavigationSession != v5)
  {
    v7 = v5;
    -[NavigationSession removeObserver:](observedNavigationSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_observedNavigationSession, a3);
    -[NavigationSession addObserver:](self->_observedNavigationSession, "addObserver:", self);
    v5 = v7;
  }

}

- (void)setObservedRoutePlanningSession:(id)a3
{
  RoutePlanningSession *v5;
  RoutePlanningSession *observedRoutePlanningSession;
  RoutePlanningSession *v7;

  v5 = (RoutePlanningSession *)a3;
  observedRoutePlanningSession = self->_observedRoutePlanningSession;
  if (observedRoutePlanningSession != v5)
  {
    v7 = v5;
    -[RoutePlanningSession removeObserver:](observedRoutePlanningSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_observedRoutePlanningSession, a3);
    -[RoutePlanningSession addObserver:](self->_observedRoutePlanningSession, "addObserver:", self);
    v5 = v7;
  }

}

- (void)_updateLocationProviderType
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationProviderUpdater observedNavigationSession](self, "observedNavigationSession"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationProviderUpdater observedNavigationSession](self, "observedNavigationSession"));
    v5 = objc_msgSend(v4, "sessionState");

    v6 = v5 == (id)1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationProviderUpdater observedRoutePlanningSession](self, "observedRoutePlanningSession"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationProviderUpdater observedRoutePlanningSession](self, "observedRoutePlanningSession"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
      v10 = objc_msgSend(v9, "isNavigationTracePlayback");

      if (v10)
        v6 = 2;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
  }
  -[MapsLocationProviderUpdater setLocationProviderType:](self, "setLocationProviderType:", v6);
}

- (void)setLocationProviderType:(unint64_t)a3
{
  NavigationLocationProvider *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_locationProviderType != a3)
  {
    self->_locationProviderType = a3;
    if (a3 - 1 >= 2)
    {
      if (a3)
        return;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationProviderUpdater locationManager](self, "locationManager"));
      objc_msgSend(v9, "setLocationCorrector:", 0);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationProviderUpdater locationManager](self, "locationManager"));
      objc_msgSend(v10, "setLocationProvider:", 0);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationProviderUpdater locationManager](self, "locationManager"));
      v11 = v7;
      v8 = 0;
    }
    else
    {
      v4 = objc_alloc_init(NavigationLocationProvider);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationProviderUpdater locationManager](self, "locationManager"));
      objc_msgSend(v5, "setLocationProvider:", v4);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationProviderUpdater locationManager](self, "locationManager"));
      objc_msgSend(v6, "setLocationCorrector:", &stru_1011AE730);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationProviderUpdater locationManager](self, "locationManager"));
      v11 = v7;
      v8 = 1;
    }
    objc_msgSend(v7, "setContinuesWhileInactive:", v8);

  }
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v6 = a5;
  v7 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;
  -[MapsLocationProviderUpdater setObservedNavigationSession:](self, "setObservedNavigationSession:", v9);

  v13 = v6;
  v10 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v13, v10) & 1) != 0)
    v11 = v13;
  else
    v11 = 0;
  v12 = v11;

  -[MapsLocationProviderUpdater setObservedRoutePlanningSession:](self, "setObservedRoutePlanningSession:", v12);
  -[MapsLocationProviderUpdater _updateLocationProviderType](self, "_updateLocationProviderType");

}

- (unint64_t)locationProviderType
{
  return self->_locationProviderType;
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (NavigationSession)observedNavigationSession
{
  return self->_observedNavigationSession;
}

- (RoutePlanningSession)observedRoutePlanningSession
{
  return self->_observedRoutePlanningSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedRoutePlanningSession, 0);
  objc_storeStrong((id *)&self->_observedNavigationSession, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
