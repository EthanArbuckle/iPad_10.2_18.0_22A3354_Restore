@implementation VKEVChargeStationRouteWaypoint

- (VKEVChargeStationRouteWaypoint)initWithWaypoint:(id)a3 displayInfo:(id)a4 legIndex:(unint64_t)a5 routeCoordinate:(id)a6 adjacentRouteCoordinate:(id)a7 polylineCoordinate:(PolylineCoordinate)a8
{
  VKEVChargeStationRouteWaypoint *v8;
  VKEVChargeStationRouteWaypoint *v9;
  VKEVChargeStationRouteWaypoint *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VKEVChargeStationRouteWaypoint;
  v8 = -[VKRouteWaypointInfo initWithWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:waypointType:](&v12, sel_initWithWaypoint_displayInfo_legIndex_routeCoordinate_adjacentRouteCoordinate_polylineCoordinate_waypointType_, a3, a4, a5, a8, 2, a6.var0, a6.var1, a6.var2, a7.var0, a7.var1, a7.var2);
  v9 = v8;
  if (v8)
    v10 = v8;

  return v9;
}

- (void)setChargeTimeText:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_chargeTimeText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_chargeTimeText, a3);
    -[VKRouteWaypointInfo setNeedsTextUpdate:](self, "setNeedsTextUpdate:", 1);
  }

}

- (GEOComposedRouteEVChargingStationInfo)chargeInfo
{
  void *v2;
  void *v3;

  -[VKRouteWaypointInfo waypoint](self, "waypoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chargingInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedRouteEVChargingStationInfo *)v3;
}

- (NSString)chargeTimeText
{
  return self->_chargeTimeText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chargeTimeText, 0);
}

@end
