@implementation NavigationRouteHistoryInfoProvider

- (NavigationRouteHistoryInfoProvider)initWithNavigationService:(id)a3
{
  id v5;
  NavigationRouteHistoryInfoProvider *v6;
  NavigationRouteHistoryInfoProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NavigationRouteHistoryInfoProvider;
  v6 = -[NavigationRouteHistoryInfoProvider init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_navigationService, a3);

  return v7;
}

- (id)_composedRoute
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider navigationService](self, "navigationService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "route"));

  return v3;
}

- (id)routeId
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider navigationService](self, "navigationService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "routeId"));

  return v3;
}

- (id)legacyRouteRepresentation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider navigationService](self, "navigationService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "legacyRouteRepresentation"));

  return v3;
}

- (id)originalWaypointRouteRepresentation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider navigationService](self, "navigationService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "originalWaypointRouteRepresentation"));

  return v3;
}

- (NSData)sessionState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider _composedRoute](self, "_composedRoute"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "routeInitializerData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "directionsResponse"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionState"));

  return (NSData *)v5;
}

- (id)auxiliaryTasksManager
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appSessionController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentlyNavigatingPlatformController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "auxiliaryTasksManager"));

  return v5;
}

- (HistoryEntryRecentsItem)historyEntryRoute
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider auxiliaryTasksManager](self, "auxiliaryTasksManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "routePlanningSessionRouteLoadedNotifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentRouteHistoryEntry"));

  return (HistoryEntryRecentsItem *)v4;
}

- (void)updateHistoryEntryRoute:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider auxiliaryTasksManager](self, "auxiliaryTasksManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routePlanningSessionRouteLoadedNotifier"));
  objc_msgSend(v5, "setCurrentRouteHistoryEntry:", v4);

}

- (NSUUID)currentHistoryEntryRouteIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider historyEntryRoute](self, "historyEntryRoute"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "historyEntry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storageIdentifier"));

  return (NSUUID *)v4;
}

- (GEORouteAttributes)routeAttributes
{
  void *v3;
  id v4;
  double v5;
  double v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService lastLocation](self->_navigationService, "lastLocation"));
  if (v3)
  {
    v4 = objc_alloc((Class)GEOLatLng);
    objc_msgSend(v3, "coordinate");
    v6 = v5;
    objc_msgSend(v3, "coordinate");
    v7 = (unint64_t)objc_msgSend(v4, "initWithLatitude:longitude:", v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService currentRequest](self->_navigationService, "currentRequest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "waypointTypeds"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "locationForWaypoint"));

  if (v7 && v11)
  {
    v22 = v7;
    v23 = v11;
    v12 = &v22;
    v13 = 2;
  }
  else
  {
    if (!(v7 | v11))
    {
      v15 = 0;
      goto LABEL_14;
    }
    if (v7)
      v14 = v7;
    else
      v14 = v11;
    v21 = v14;
    v12 = (unint64_t *)&v21;
    v13 = 1;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, v13, v21, v22, v23));
LABEL_14:
  v16 = objc_alloc((Class)MNRouteAttributes);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider _composedRoute](self, "_composedRoute"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "routeAttributes"));
  v19 = objc_msgSend(v16, "initWithAttributes:latLngs:", v18, v15);

  return (GEORouteAttributes *)v19;
}

- (NSData)archivedTripSharingState
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "archivedSharingState"));

  return (NSData *)v3;
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
  objc_storeStrong((id *)&self->_navigationService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationService, 0);
}

@end
