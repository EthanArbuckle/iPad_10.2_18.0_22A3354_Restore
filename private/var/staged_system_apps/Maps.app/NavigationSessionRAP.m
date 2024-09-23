@implementation NavigationSessionRAP

- (NavigationSessionRAP)initWithNavigationSession:(id)a3 routePlanningSession:(id)a4
{
  id v7;
  id v8;
  NavigationSessionRAP *v9;
  NavigationSessionRAP *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NavigationSessionRAP;
  v9 = -[NavigationSessionRAP init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_navigationSession, a3);
    objc_storeStrong((id *)&v10->_routePlanningSession, a4);
  }

  return v10;
}

- (GEOComposedRoute)activeComposedRoute
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession currentRouteCollection](self->_navigationSession, "currentRouteCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentRoute"));

  return (GEOComposedRoute *)v3;
}

- (RAPDisplayedRouteState)currentDirections
{
  void *v3;
  void *navigationSession;
  char *v5;
  RAPDisplayedRouteState *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  RAPDisplayedRouteState *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSessionRAP activeComposedRoute](self, "activeComposedRoute"));

  if (v3)
  {
    navigationSession = self->_navigationSession;
    if (!navigationSession)
      navigationSession = self->_routePlanningSession;
    v5 = (char *)objc_msgSend(navigationSession, "currentTransportType");
    v6 = [RAPDisplayedRouteState alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession originName](self->_routePlanningSession, "originName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession destinationName](self->_routePlanningSession, "destinationName"));
    if ((unint64_t)(v5 - 2) > 3)
      v9 = 0;
    else
      v9 = dword_100E35030[(_QWORD)(v5 - 2)];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSessionRAP activeComposedRoute](self, "activeComposedRoute"));
    v10 = -[RAPDisplayedRouteState initWithStartWaypointTitle:endWaypointTitle:transportType:composedRoute:](v6, "initWithStartWaypointTitle:endWaypointTitle:transportType:composedRoute:", v7, v8, v9, v11);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (RAPDisplayedDirectionsPlan)displayedDirectionsPlan
{
  unint64_t v3;
  BOOL v4;
  RAPDisplayedDirectionsPlan *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[NavigationSession currentTransportType](self->_navigationSession, "currentTransportType");
  v4 = v3 > 4 || ((1 << v3) & 0x19) == 0;
  if (v4
    && ((v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession currentRouteCollection](self->_navigationSession, "currentRouteCollection"))) != 0
     || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession currentRouteCollection](self->_routePlanningSession, "currentRouteCollection"))) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession reportAProblemRecorder](self->_routePlanningSession, "reportAProblemRecorder"));
    v8 = objc_msgSend(v7, "copyCurrentPartialRecording");

    v5 = -[RAPDisplayedDirectionsPlan initWithRouteCollection:recording:]([RAPDisplayedDirectionsPlan alloc], "initWithRouteCollection:recording:", v6, v8);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)isShowingDirections
{
  return self->_navigationSession != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routePlanningSession, 0);
  objc_storeStrong((id *)&self->_navigationSession, 0);
}

@end
