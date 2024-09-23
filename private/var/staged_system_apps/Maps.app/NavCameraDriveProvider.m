@implementation NavCameraDriveProvider

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v3, "stopListeningForLocationUpdates:", self);

  v4.receiver = self;
  v4.super_class = (Class)NavCameraDriveProvider;
  -[NavCameraDriveProvider dealloc](&v4, "dealloc");
}

- (NavCameraDriveProvider)init
{
  NavCameraDriveProvider *v2;
  GEORoadMatcher *v3;
  GEORoadMatcher *roadMatcher;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NavCameraDriveProvider;
  v2 = -[NavCameraDriveProvider init](&v7, "init");
  if (v2)
  {
    v3 = (GEORoadMatcher *)objc_msgSend(objc_alloc((Class)GEORoadMatcher), "initWithAuditToken:", 0);
    roadMatcher = v2->_roadMatcher;
    v2->_roadMatcher = v3;

    -[GEORoadMatcher setSearchRadius:](v2->_roadMatcher, "setSearchRadius:", 35.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    objc_msgSend(v5, "listenForLocationUpdates:", v2);

  }
  return v2;
}

- (void)setRouteGeniusEntry:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_routeGeniusEntry, a3);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraDriveProvider delegate](self, "delegate"));
  objc_msgSend(v6, "navigationProvider:didChangeNavigationDestination:", self, -[NavCameraDriveProvider navigationDestination](self, "navigationDestination"));

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "route"));
  -[NavCameraDriveProvider _updateWithRoute:](self, "_updateWithRoute:", v7);

}

- (void)_updateWithRoute:(id)a3
{
  GEOComposedRoute **p_route;
  GEORouteMatcher *v6;
  GEORouteMatch *previousRouteMatch;
  GEORouteMatcher *routeMatcher;
  void *v9;
  void *v10;
  id v11;

  p_route = &self->_route;
  v11 = a3;
  if ((-[GEOComposedRoute _MapsCarPlay_isEqual:](*p_route, "_MapsCarPlay_isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_route, a3);
    if (self->_route)
    {
      v6 = (GEORouteMatcher *)objc_msgSend(objc_alloc((Class)GEORouteMatcher), "initWithRoute:auditToken:", *p_route, 0);
    }
    else
    {
      previousRouteMatch = self->_previousRouteMatch;
      self->_previousRouteMatch = 0;

      v6 = 0;
    }
    routeMatcher = self->_routeMatcher;
    self->_routeMatcher = v6;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraDriveProvider delegate](self, "delegate"));
    objc_msgSend(v9, "navigationProvider:didChangeNavigationState:", self, -[NavCameraDriveProvider navigationState](self, "navigationState"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraDriveProvider delegate](self, "delegate"));
    objc_msgSend(v10, "navigationProvider:didUpdateRoute:traffic:", self, self->_route, 0);

  }
}

- (id)_matchedLocationForLocation:(id)a3
{
  id v4;
  id v5;
  GEORouteMatcher *routeMatcher;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithCLLocation:", v4);
    routeMatcher = self->_routeMatcher;
    if (!routeMatcher
      || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEORouteMatcher matchToRouteWithLocation:previousRouteMatch:](routeMatcher, "matchToRouteWithLocation:previousRouteMatch:", v5, self->_previousRouteMatch)), objc_storeStrong((id *)&self->_previousRouteMatch, v7), !v7)|| (v8 = objc_msgSend(objc_alloc((Class)MNLocation), "initWithRouteMatch:rawLocation:locationMatchType:", v7, v4, 2), v7, !v8))
    {
      v9 = objc_claimAutoreleasedReturnValue(-[GEORoadMatcher matchLocation:forTransportType:](self->_roadMatcher, "matchLocation:forTransportType:", v5, 0));
      if (!v9
        || (v10 = (void *)v9,
            v8 = objc_msgSend(objc_alloc((Class)MNLocation), "initWithRoadMatch:rawLocation:locationMatchType:", v9, v4, 0), v10, !v8))
      {
        v8 = objc_msgSend(objc_alloc((Class)MNLocation), "initWithRawLocation:locationMatchType:", v4, 0);
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isInNavigatingState
{
  return 0;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (unint64_t)stepIndex
{
  return 0;
}

- (int)navigationState
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraDriveProvider route](self, "route"));
  v3 = 2 * (v2 != 0);

  return v3;
}

- (unint64_t)navigationDestination
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraDriveProvider routeGeniusEntry](self, "routeGeniusEntry"));
  v3 = 2 * (v2 != 0);

  return v3;
}

- (MNLocation)lastLocation
{
  MNLocation *lastLocation;
  void *v4;
  void *v5;
  MNLocation *v6;
  MNLocation *v7;

  lastLocation = self->_lastLocation;
  if (!lastLocation)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));
    v6 = (MNLocation *)objc_claimAutoreleasedReturnValue(-[NavCameraDriveProvider _matchedLocationForLocation:](self, "_matchedLocationForLocation:", v5));
    v7 = self->_lastLocation;
    self->_lastLocation = v6;

    lastLocation = self->_lastLocation;
  }
  return lastLocation;
}

- (double)distanceUntilManeuver
{
  return 0.0;
}

- (double)timeUntilManeuver
{
  return 0.0;
}

- (NSArray)alternateRoutes
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSDictionary)alternateRouteTraffics
{
  return (NSDictionary *)&__NSDictionary0__struct;
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->_roadMatcher)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lastLocation"));
    if (v4)
    {
      v7 = v4;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraDriveProvider _matchedLocationForLocation:](self, "_matchedLocationForLocation:", v4));
      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraDriveProvider delegate](self, "delegate"));
        objc_msgSend(v6, "navigationProvider:didUpdateMatchedLocation:", self, v5);

      }
      v4 = v7;
    }

  }
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return !-[NavCameraDriveProvider isInNavigatingState](self, "isInNavigatingState", a3);
}

- (NavCameraNavigationDelegate)delegate
{
  return (NavCameraNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MapsSuggestionsRouteGeniusEntry)routeGeniusEntry
{
  return self->_routeGeniusEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeGeniusEntry, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_previousRouteMatch, 0);
  objc_storeStrong((id *)&self->_routeMatcher, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_roadMatcher, 0);
}

@end
