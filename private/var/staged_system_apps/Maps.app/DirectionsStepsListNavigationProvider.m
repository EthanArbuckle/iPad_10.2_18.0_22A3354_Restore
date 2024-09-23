@implementation DirectionsStepsListNavigationProvider

- (void)dealloc
{
  objc_super v3;

  -[DirectionsStepsListNavigationProvider _stopObservingNavigation](self, "_stopObservingNavigation");
  v3.receiver = self;
  v3.super_class = (Class)DirectionsStepsListNavigationProvider;
  -[DirectionsStepsListNavigationProvider dealloc](&v3, "dealloc");
}

- (DirectionsStepsListNavigationProvider)initWithDelegate:(id)a3
{
  id v4;
  DirectionsStepsListNavigationProvider *v5;
  DirectionsStepsListNavigationProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DirectionsStepsListNavigationProvider;
  v5 = -[DirectionsStepsListNavigationProvider init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    -[DirectionsStepsListNavigationProvider setDelegate:](v5, "setDelegate:", v4);
    -[DirectionsStepsListNavigationProvider _startObservingNavigation](v6, "_startObservingNavigation");
  }

  return v6;
}

- (void)_startObservingNavigation
{
  MNNavigationService *v3;
  MNNavigationService *navigationService;

  if (!self->_navigationService)
  {
    v3 = (MNNavigationService *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    navigationService = self->_navigationService;
    self->_navigationService = v3;

    -[MNNavigationService registerObserver:](self->_navigationService, "registerObserver:", self);
  }
}

- (void)_stopObservingNavigation
{
  MNNavigationService *navigationService;
  MNNavigationService *v4;

  navigationService = self->_navigationService;
  if (navigationService)
  {
    -[MNNavigationService unregisterObserver:](navigationService, "unregisterObserver:", self);
    v4 = self->_navigationService;
    self->_navigationService = 0;

  }
}

- (GEOComposedRoute)route
{
  return (GEOComposedRoute *)-[MNNavigationService route](self->_navigationService, "route");
}

- (BOOL)isNavigating
{
  return -[MNNavigationService isInNavigatingState](self->_navigationService, "isInNavigatingState");
}

- (unint64_t)activeStepIndex
{
  return (unint64_t)-[MNNavigationService stepIndex](self->_navigationService, "stepIndex");
}

- (double)elapsedDistance
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService remainingDistanceInfo](self->_navigationService, "remainingDistanceInfo"));
  -[DirectionsStepsListNavigationProvider _progressAlongRouteWithDistanceInfo:](self, "_progressAlongRouteWithDistanceInfo:", v3);
  v5 = v4;

  return v5;
}

- (unint64_t)displayedStepIndex
{
  return (unint64_t)-[MNNavigationService displayedStepIndex](self->_navigationService, "displayedStepIndex");
}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
  -[MNNavigationService setDisplayedStepIndex:](self->_navigationService, "setDisplayedStepIndex:", a3);
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v7;
  uint64_t v8;
  uint64_t IsNavigating;
  void *v10;
  id v11;

  v7 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListNavigationProvider delegate](self, "delegate"));
  IsNavigating = MNNavigationServiceStateIsNavigating(a5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "route"));

  objc_msgSend(v11, "navigationProvider:didChangeToNavigating:withRoute:", self, IsNavigating, v10);
}

- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  id v5;
  NSObject *v6;
  id v9;
  uint8_t buf[16];

  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = sub_10043309C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Auto-advance step index is NSNotFound, meaning no matched step. Ignore it and maintain what we have.", buf, 2u);
    }

  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListNavigationProvider delegate](self, "delegate", a3, a4, a5));
    objc_msgSend(v9, "navigationProvider:didUpdateActiveStepIndex:", self, a4);

  }
}

- (void)navigationService:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListNavigationProvider delegate](self, "delegate", a3, a4, a5));
  objc_msgSend(v7, "navigationProvider:didUpdateDisplayedStepIndex:", self, a4);

}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListNavigationProvider delegate](self, "delegate"));
  objc_msgSend(v6, "navigationProvider:didUpdateMatchedLocation:", self, v5);

}

- (void)navigationService:(id)a3 didReceiveRealtimeUpdates:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "route"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueRouteID"));

  v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v13);
        v15 = objc_opt_class(MNRealtimeTransitUpdate);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "routeID"));
          v17 = objc_msgSend(v7, "isEqual:", v16);

          if (v17)
          {
            v18 = v14;
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "transitUpdate"));

            if (v19)
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "transitUpdate"));
              objc_msgSend(v8, "addObject:", v20);

            }
          }
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListNavigationProvider delegate](self, "delegate"));
  v22 = objc_msgSend(v8, "copy");
  objc_msgSend(v21, "navigationProvider:didReceiveRealtimeUpdates:", self, v22);

}

- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListNavigationProvider delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "navigationProvider:didUpdateElapsedDistanceAlongRoute:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListNavigationProvider delegate](self, "delegate"));
    -[DirectionsStepsListNavigationProvider _progressAlongRouteWithDistanceInfo:](self, "_progressAlongRouteWithDistanceInfo:", v10);
    objc_msgSend(v9, "navigationProvider:didUpdateElapsedDistanceAlongRoute:", self);

  }
}

- (double)_progressAlongRouteWithDistanceInfo:(id)a3
{
  MNNavigationService *navigationService;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double result;

  if (!a3)
    return 0.0;
  navigationService = self->_navigationService;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](navigationService, "route"));
  objc_msgSend(v5, "distance");
  v7 = v6;
  objc_msgSend(v4, "distanceRemainingToEndOfLeg");
  v9 = v8;

  v10 = v7 - v9;
  result = 0.0;
  if (v10 >= 0.0)
    return v10;
  return result;
}

- (MNLocation)matchedLocation
{
  return self->_matchedLocation;
}

- (DirectionsStepsListNavigationDelegate)delegate
{
  return (DirectionsStepsListNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_matchedLocation, 0);
  objc_storeStrong((id *)&self->_navigationService, 0);
}

@end
