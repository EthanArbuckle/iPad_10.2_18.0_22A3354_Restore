@implementation RouteCellularCoverageDebugOverlay

- (RouteCellularCoverageDebugOverlay)init
{
  RouteCellularCoverageDebugOverlay *result;

  result = (RouteCellularCoverageDebugOverlay *)+[NSException raise:format:](NSException, "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (RouteCellularCoverageDebugOverlay)initWithRoute:(id)a3
{
  id v5;
  RouteCellularCoverageDebugOverlay *v6;
  RouteCellularCoverageDebugOverlay *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  MKMapPoint v18;
  double y;
  RouteCellularCoverageDebugOverlay *v20;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RouteCellularCoverageDebugOverlay;
  v6 = -[RouteCellularCoverageDebugOverlay init](&v22, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_route, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "boundingMapRegion"));
    v7->_boundingMapRect.origin.x = GEOMapRectForMapRegion(v8, v9);
    v7->_boundingMapRect.origin.y = v10;
    v7->_boundingMapRect.size.width = v11;
    v7->_boundingMapRect.size.height = v12;

    __asm { FMOV            V2.2D, #0.5 }
    v18 = (MKMapPoint)vaddq_f64((float64x2_t)v7->_boundingMapRect.origin, vmulq_f64((float64x2_t)v7->_boundingMapRect.size, _Q2));
    y = v18.y;
    v7->_coordinate = MKCoordinateForMapPoint(v18);
    v20 = v7;
  }

  return v7;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D v4;
  CLLocationCoordinate2D result;

  v4 = CLLocationCoordinate2DMake(0.0, 0.0);
  longitude = v4.longitude;
  latitude = v4.latitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)boundingMapRect
{
  double x;
  double y;
  double width;
  double height;
  $C79183323B9A0D5602617FF3BE5395AC result;

  x = self->_boundingMapRect.origin.x;
  y = self->_boundingMapRect.origin.y;
  width = self->_boundingMapRect.size.width;
  height = self->_boundingMapRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
}

@end
