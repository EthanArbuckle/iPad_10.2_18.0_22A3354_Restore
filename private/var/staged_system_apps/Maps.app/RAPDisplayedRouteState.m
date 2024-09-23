@implementation RAPDisplayedRouteState

- (RAPDisplayedRouteState)initWithStartWaypointTitle:(id)a3 endWaypointTitle:(id)a4 transportType:(int)a5 composedRoute:(id)a6
{
  id v10;
  id v11;
  id v12;
  RAPDisplayedRouteState *v13;
  NSString *v14;
  NSString *startWaypointTitle;
  NSString *v16;
  NSString *endWaypointTitle;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)RAPDisplayedRouteState;
  v13 = -[RAPDisplayedRouteState init](&v19, "init");
  if (v13)
  {
    v14 = (NSString *)objc_msgSend(v10, "copy");
    startWaypointTitle = v13->_startWaypointTitle;
    v13->_startWaypointTitle = v14;

    v16 = (NSString *)objc_msgSend(v11, "copy");
    endWaypointTitle = v13->_endWaypointTitle;
    v13->_endWaypointTitle = v16;

    v13->_transportType = a5;
    objc_storeStrong((id *)&v13->_composedRoute, a6);
  }

  return v13;
}

- (int)transportType
{
  return self->_transportType;
}

- (GEOComposedRoute)composedRoute
{
  return self->_composedRoute;
}

- (NSString)startWaypointTitle
{
  return self->_startWaypointTitle;
}

- (NSString)endWaypointTitle
{
  return self->_endWaypointTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endWaypointTitle, 0);
  objc_storeStrong((id *)&self->_startWaypointTitle, 0);
  objc_storeStrong((id *)&self->_composedRoute, 0);
}

@end
