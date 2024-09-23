@implementation MSHistoryDirectionsItem

- (int64_t)transportType
{
  void *v2;
  unsigned int v3;
  int64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryDirectionsItem routeRequestStorage](self, "routeRequestStorage"));
  v3 = objc_msgSend(v2, "transportType") - 1;
  if (v3 > 5)
    v4 = 1;
  else
    v4 = qword_100E3A3B0[v3];

  return v4;
}

- (GEOComposedWaypoint)startWaypoint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryDirectionsItem routeRequestStorage](self, "routeRequestStorage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "waypoints"));
  if (objc_msgSend(v4, "count") == (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryDirectionsItem routeRequestStorage](self, "routeRequestStorage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waypoints"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  }
  else
  {
    v7 = 0;
  }

  return (GEOComposedWaypoint *)v7;
}

- (GEOComposedWaypoint)endWaypoint
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryDirectionsItem routeRequestStorage](self, "routeRequestStorage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destinationRouteData"));

  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)GEORouteBuilder_PersistentData), "initWithPersistentData:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "buildRoute"));

    v7 = objc_msgSend(objc_alloc((Class)GEOComposedWaypointToRoute), "initWithRoute:", v6);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryDirectionsItem routeRequestStorage](self, "routeRequestStorage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "waypoints"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));

  }
  return (GEOComposedWaypoint *)v7;
}

- (NSArray)waypoints
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryDirectionsItem routeRequestStorage](self, "routeRequestStorage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "waypoints"));

  return (NSArray *)v3;
}

- (GEOAutomobileOptions)automobileOptions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryDirectionsItem routeRequestStorage](self, "routeRequestStorage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "automobileOptions"));

  return (GEOAutomobileOptions *)v3;
}

- (GEOTransitOptions)transitOptions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryDirectionsItem routeRequestStorage](self, "routeRequestStorage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "transitOptions"));

  return (GEOTransitOptions *)v3;
}

- (GEOWalkingOptions)walkingOptions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryDirectionsItem routeRequestStorage](self, "routeRequestStorage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "walkingOptions"));

  return (GEOWalkingOptions *)v3;
}

- (GEOCyclingOptions)cyclingOptions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryDirectionsItem routeRequestStorage](self, "routeRequestStorage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cyclingOptions"));

  return (GEOCyclingOptions *)v3;
}

- (id)routeInformationSource
{
  return -[HistoryEntryRecentRouteInfoSource initWithItem:]([HistoryEntryRecentRouteInfoSource alloc], "initWithItem:", self);
}

- (void)ifSearch:(id)a3 ifRoute:(id)a4 ifPlaceDisplay:(id)a5 ifTransitLineItem:(id)a6
{
  if (a4)
    (*((void (**)(id, MSHistoryDirectionsItem *))a4 + 2))(a4, self);
}

@end
