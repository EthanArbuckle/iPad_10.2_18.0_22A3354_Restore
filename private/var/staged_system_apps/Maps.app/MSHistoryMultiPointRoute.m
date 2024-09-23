@implementation MSHistoryMultiPointRoute

- (int64_t)transportType
{
  void *v2;
  unsigned int v3;
  int64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryMultiPointRoute routeRequestStorage](self, "routeRequestStorage"));
  v3 = objc_msgSend(v2, "transportType") - 1;
  if (v3 > 5)
    v4 = 1;
  else
    v4 = qword_100E3A3B0[v3];

  return v4;
}

- (GEOComposedWaypoint)startWaypoint
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryMultiPointRoute routeRequestStorage](self, "routeRequestStorage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "waypoints"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  return (GEOComposedWaypoint *)v4;
}

- (GEOComposedWaypoint)endWaypoint
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryMultiPointRoute routeRequestStorage](self, "routeRequestStorage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "waypoints"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  return (GEOComposedWaypoint *)v4;
}

- (NSArray)waypoints
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryMultiPointRoute routeRequestStorage](self, "routeRequestStorage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "waypoints"));

  return (NSArray *)v3;
}

- (GEOAutomobileOptions)automobileOptions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryMultiPointRoute routeRequestStorage](self, "routeRequestStorage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "automobileOptions"));

  return (GEOAutomobileOptions *)v3;
}

- (GEOTransitOptions)transitOptions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryMultiPointRoute routeRequestStorage](self, "routeRequestStorage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "transitOptions"));

  return (GEOTransitOptions *)v3;
}

- (GEOWalkingOptions)walkingOptions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryMultiPointRoute routeRequestStorage](self, "routeRequestStorage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "walkingOptions"));

  return (GEOWalkingOptions *)v3;
}

- (GEOCyclingOptions)cyclingOptions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryMultiPointRoute routeRequestStorage](self, "routeRequestStorage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cyclingOptions"));

  return (GEOCyclingOptions *)v3;
}

- (void)ifSearch:(id)a3 ifRoute:(id)a4 ifPlaceDisplay:(id)a5 ifTransitLineItem:(id)a6
{
  if (a4)
    (*((void (**)(id, MSHistoryMultiPointRoute *))a4 + 2))(a4, self);
}

@end
