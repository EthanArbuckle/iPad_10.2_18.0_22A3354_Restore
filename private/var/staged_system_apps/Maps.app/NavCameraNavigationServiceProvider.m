@implementation NavCameraNavigationServiceProvider

- (NavCameraNavigationServiceProvider)init
{
  NavCameraNavigationServiceProvider *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavCameraNavigationServiceProvider;
  v2 = -[NavCameraNavigationServiceProvider init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v3, "registerObserver:", v2);

  }
  return v2;
}

- (BOOL)isInNavigatingState
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v3 = objc_msgSend(v2, "isInNavigatingState");

  return v3;
}

- (GEOComposedRoute)route
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "route"));

  return (GEOComposedRoute *)v3;
}

- (unint64_t)stepIndex
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v3 = objc_msgSend(v2, "stepIndex");

  return (unint64_t)v3;
}

- (unint64_t)displayedStepIndex
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v3 = objc_msgSend(v2, "displayedStepIndex");

  return (unint64_t)v3;
}

- (int)navigationState
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v3 = objc_msgSend(v2, "navigationState");

  return v3;
}

- (unint64_t)navigationDestination
{
  return 1;
}

- (MNLocation)lastLocation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastLocation"));

  return (MNLocation *)v3;
}

- (double)distanceUntilManeuver
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v2, "distanceUntilManeuver");
  v4 = v3;

  return v4;
}

- (double)timeUntilManeuver
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v2, "timeUntilManeuver");
  v4 = v3;

  return v4;
}

- (NSArray)alternateRoutes
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "alternateRoutes"));

  return (NSArray *)v3;
}

- (NSDictionary)alternateRouteTraffics
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraNavigationServiceProvider alternateRoutes](self, "alternateRoutes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v2, "count")));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "traffic", (_QWORD)v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueRouteID"));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = objc_msgSend(v3, "copy");
  return (NSDictionary *)v12;
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  uint64_t v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[NavCameraNavigationServiceProvider delegate](self, "delegate", a3));
  objc_msgSend(v9, "navigationProvider:didChangeToNavigating:", self, MNNavigationServiceStateChangedToNavigating(a4, a5, v8));

}

- (void)navigationService:(id)a3 didChangeNavigationState:(int)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[NavCameraNavigationServiceProvider delegate](self, "delegate", a3));
  objc_msgSend(v6, "navigationProvider:didChangeNavigationState:", self, v4);

}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[NavCameraNavigationServiceProvider delegate](self, "delegate"));
  objc_msgSend(v6, "navigationProvider:didUpdateMatchedLocation:", self, v5);

}

- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[NavCameraNavigationServiceProvider delegate](self, "delegate", a3));
  objc_msgSend(v8, "navigationProvider:didUpdateStepIndex:segmentIndex:", self, a4, a5);

}

- (void)navigationService:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[NavCameraNavigationServiceProvider delegate](self, "delegate", a3));
  objc_msgSend(v8, "navigationProvider:didUpdateStepIndex:segmentIndex:", self, a4, a5);

}

- (void)navigationService:(id)a3 didUpdateDistanceUntilManeuver:(double)a4 timeUntilManeuver:(double)a5 forStepIndex:(unint64_t)a6
{
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[NavCameraNavigationServiceProvider delegate](self, "delegate", a3));
  objc_msgSend(v10, "navigationProvider:didUpdateDistanceUntilManeuver:timeUntilManeuver:forStepIndex:", self, a6, a4, a5);

}

- (void)navigationService:(id)a3 didUpdateAlternateRoutes:(id)a4 traffics:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[NavCameraNavigationServiceProvider delegate](self, "delegate"));
  objc_msgSend(v9, "navigationProvider:didUpdateAlternateRoutes:traffics:", self, v8, v7);

}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[NavCameraNavigationServiceProvider delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traffic"));
  objc_msgSend(v8, "navigationProvider:didUpdateRoute:traffic:", self, v6, v7);

}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  id v8;
  id v9;
  id v10;

  v8 = a6;
  v9 = a5;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[NavCameraNavigationServiceProvider delegate](self, "delegate"));
  objc_msgSend(v10, "navigationProvider:didUpdateRoute:traffic:", self, v9, v8);

}

- (NavCameraNavigationDelegate)delegate
{
  return (NavCameraNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
