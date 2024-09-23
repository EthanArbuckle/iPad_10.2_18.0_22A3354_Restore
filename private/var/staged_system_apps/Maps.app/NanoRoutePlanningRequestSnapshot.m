@implementation NanoRoutePlanningRequestSnapshot

- (NanoRoutePlanningRequestSnapshot)init
{
  NanoRoutePlanningRequestSnapshot *v2;
  uint64_t v3;
  NSDate *timestamp;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NanoRoutePlanningRequestSnapshot;
  v2 = -[NanoRoutePlanningRequestSnapshot init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    timestamp = v2->_timestamp;
    v2->_timestamp = (NSDate *)v3;

  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
  {
    v5 = v4;
    v6 = -[NanoRoutePlanningRequestSnapshot transportType](self, "transportType");
    if (v6 == objc_msgSend(v5, "transportType"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequestSnapshot waypoints](self, "waypoints"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waypoints"));
      v9 = +[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", v7, v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)deltaFromSnapshot:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NanoRoutePlanningRequestDelta *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4 && (v5 = objc_opt_class(self), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
  {
    v6 = v4;
    v7 = objc_alloc_init(NanoRoutePlanningRequestDelta);
    -[NanoRoutePlanningRequestDelta setTransportTypeChanged:](v7, "setTransportTypeChanged:", -[NanoRoutePlanningRequestSnapshot transportType](self, "transportType") != objc_msgSend(v6, "transportType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequestSnapshot waypoints](self, "waypoints"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "waypoints"));

    -[NanoRoutePlanningRequestDelta setWaypointsChanged:](v7, "setWaypointsChanged:", +[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", v8, v9) ^ 1);
  }
  else
  {
    v7 = (NanoRoutePlanningRequestDelta *)objc_claimAutoreleasedReturnValue(+[NanoRoutePlanningRequestDelta everythingChanged](NanoRoutePlanningRequestDelta, "everythingChanged"));
  }

  return v7;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (int)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
  objc_storeStrong((id *)&self->_waypoints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
