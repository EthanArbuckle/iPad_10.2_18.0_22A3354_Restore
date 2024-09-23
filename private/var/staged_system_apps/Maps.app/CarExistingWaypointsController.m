@implementation CarExistingWaypointsController

- (CarExistingWaypointsController)initWithRoutePlanningSession:(id)a3
{
  id v5;
  CarExistingWaypointsController *v6;
  CarExistingWaypointsController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarExistingWaypointsController;
  v6 = -[CarExistingWaypointsController init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_routePlanningSession, a3);

  return v7;
}

- (id)originSearchResult
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarExistingWaypointsController routePlanningSession](self, "routePlanningSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "originDisplayableMarker"));

  return v3;
}

- (id)destinationSearchResultIfAvailable
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarExistingWaypointsController routePlanningSession](self, "routePlanningSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "destinationDisplayableMarker"));

  return v3;
}

- (id)titleForCurrentDestination
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarExistingWaypointsController routePlanningSession](self, "routePlanningSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "destinationName"));

  return v3;
}

- (id)subtitleForCurrentDestination
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarExistingWaypointsController destinationSearchResultIfAvailable](self, "destinationSearchResultIfAvailable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_addressFormattedAsShortenedAddress"));

  return v4;
}

- (BOOL)shouldStartLoadWhenBecomingCurrent
{
  return 0;
}

- (RoutePlanningSession)routePlanningSession
{
  return self->_routePlanningSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routePlanningSession, 0);
}

@end
