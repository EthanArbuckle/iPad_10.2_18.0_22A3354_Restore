@implementation VKMapView

- (void)_mapstest_jumpToCoords:(id)a3 pitch:(double)a4 yaw:(double)a5 altitudeIsRegionSize:(BOOL)a6
{
  id v9;

  if (a6)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[GEOMapRegion _mapstest_mapRegionAtCenterLocation:](GEOMapRegion, "_mapstest_mapRegionAtCenterLocation:", a3.var0, a3.var1, a3.var2));
    -[VKMapView setMapRegion:pitch:yaw:](self, "setMapRegion:pitch:yaw:", v9, a4, a5);

  }
  else
  {
    -[VKMapView setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:](self, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", 0, 0, VKLocationCoordinate2DMake(a3.var0, a3.var1));
  }
}

- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_jumpToBayArea
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v3 = VKLocationCoordinate3DMake(self, 37.6142, -122.3115, 0.45);
  v5 = v4;
  v7 = v6;
  -[VKMapView _mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:](self, "_mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:", 1);
  v8 = v3;
  v9 = v5;
  v10 = v7;
  result.var2 = v10;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_jumpToCupertino
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v3 = VKLocationCoordinate3DMake(self, 37.3277769, -122.138762, 0.36);
  v5 = v4;
  v7 = v6;
  -[VKMapView _mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:](self, "_mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:", 1);
  v8 = v3;
  v9 = v5;
  v10 = v7;
  result.var2 = v10;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_jumpToTokyo
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v3 = VKLocationCoordinate3DMake(self, 35.659263, 139.700697, 0.025);
  v5 = v4;
  v7 = v6;
  -[VKMapView _mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:](self, "_mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:", 1);
  v8 = v3;
  v9 = v5;
  v10 = v7;
  result.var2 = v10;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

@end
