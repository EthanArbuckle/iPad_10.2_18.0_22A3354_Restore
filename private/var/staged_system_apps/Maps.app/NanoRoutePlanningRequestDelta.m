@implementation NanoRoutePlanningRequestDelta

+ (id)everythingChanged
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setWaypointsChanged:", 1);
  objc_msgSend(v2, "setTransportTypeChanged:", 1);
  return v2;
}

- (BOOL)waypointsChanged
{
  return self->_waypointsChanged;
}

- (void)setWaypointsChanged:(BOOL)a3
{
  self->_waypointsChanged = a3;
}

- (BOOL)transportTypeChanged
{
  return self->_transportTypeChanged;
}

- (void)setTransportTypeChanged:(BOOL)a3
{
  self->_transportTypeChanged = a3;
}

@end
