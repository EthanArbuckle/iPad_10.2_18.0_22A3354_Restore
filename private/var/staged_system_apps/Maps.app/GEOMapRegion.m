@implementation GEOMapRegion

+ (id)_maps_offlineDownloadRegionForRouteBounds:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CLLocationCoordinate2D v11;
  double Double;
  double v13;
  double v14;
  double v15;
  MKMapPoint v17;
  MKMapRect v18;
  MKMapRect v19;
  MKMapRect v20;

  v4 = GEOMapRectForMapRegion(a3, a2);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v17.x = v4 + v7 * 0.5;
  v17.y = v5 + v9 * 0.5;
  v11 = MKCoordinateForMapPoint(v17);
  Double = GEOConfigGetDouble(MapsConfig_SaveRouteOfflineRegionMinSize, off_1014B5298);
  v20.origin.x = MKMapRectMakeWithRadialDistance(v11.latitude, v11.longitude, Double * 0.5);
  v20.origin.y = v13;
  v20.size.width = v14;
  v20.size.height = v15;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  v19 = MKMapRectUnion(v18, v20);
  return objc_msgSend(objc_alloc((Class)a1), "initWithMapRect:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
}

+ (id)_maps_offlineCoverageRegionForRouteBounds:(id)a3
{
  return a3;
}

+ (id)_mapstest_mapRegionWithCenterLatitude:(double)a3 longitude:(double)a4 size:(double)a5
{
  id v8;
  double v9;

  v8 = objc_alloc_init((Class)GEOMapRegion);
  v9 = a5 * 0.5;
  objc_msgSend(v8, "setWestLng:", fmin(fmax(a4 - v9, -180.0), 180.0));
  objc_msgSend(v8, "setEastLng:", fmin(fmax(v9 + a4, -180.0), 180.0));
  objc_msgSend(v8, "setSouthLat:", fmin(fmax(a3 - v9, -90.0), 90.0));
  objc_msgSend(v8, "setNorthLat:", fmin(fmax(v9 + a3, -90.0), 90.0));
  return v8;
}

@end
