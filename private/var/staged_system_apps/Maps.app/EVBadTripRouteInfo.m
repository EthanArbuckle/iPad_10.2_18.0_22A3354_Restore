@implementation EVBadTripRouteInfo

- (EVBadTripRouteInfo)initWithRoute:(id)a3 currentVehicleState:(id)a4
{
  id v7;
  id v8;
  EVBadTripRouteInfo *v9;
  EVBadTripRouteInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EVBadTripRouteInfo;
  v9 = -[EVBadTripRouteInfo init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_route, a3);
    v10->_initialBatteryCharge = (NSNumber *)objc_msgSend(v8, "currentBatteryCharge");
  }

  return v10;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute uniqueRouteID](self->_route, "uniqueRouteID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p, routeId: %@, lastTraversedStepIdx: %lu, initial: %lu, expected: %lu, real: %lu>"), v3, self, v5, -[GEOComposedRouteStep stepIndex](self->_lastTraversedStep, "stepIndex"), -[NSNumber unsignedLongValue](self->_initialBatteryCharge, "unsignedLongValue"), -[NSNumber unsignedLongValue](self->_expectedArrivalBatteryCharge, "unsignedLongValue"), -[NSNumber unsignedLongValue](self->_realArrivalBatteryCharge, "unsignedLongValue")));

  return v6;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
}

- (GEOComposedRouteStep)lastTraversedStep
{
  return self->_lastTraversedStep;
}

- (void)setLastTraversedStep:(id)a3
{
  objc_storeStrong((id *)&self->_lastTraversedStep, a3);
}

- (NSNumber)initialBatteryCharge
{
  return self->_initialBatteryCharge;
}

- (void)setInitialBatteryCharge:(id)a3
{
  self->_initialBatteryCharge = (NSNumber *)a3;
}

- (NSNumber)expectedArrivalBatteryCharge
{
  return self->_expectedArrivalBatteryCharge;
}

- (void)setExpectedArrivalBatteryCharge:(id)a3
{
  self->_expectedArrivalBatteryCharge = (NSNumber *)a3;
}

- (NSNumber)realArrivalBatteryCharge
{
  return self->_realArrivalBatteryCharge;
}

- (void)setRealArrivalBatteryCharge:(id)a3
{
  self->_realArrivalBatteryCharge = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTraversedStep, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

@end
