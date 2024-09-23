@implementation POIShapeFactory

+ (id)userLocationPOIShapeWithMapView:(id)a3
{
  id v3;
  POIShapeUserLocation *v4;

  v3 = a3;
  v4 = -[POIShapeUserLocation initWithMapView:coordinate:]([POIShapeUserLocation alloc], "initWithMapView:coordinate:", v3, kCLLocationCoordinate2DInvalid.latitude, kCLLocationCoordinate2DInvalid.longitude);

  return v4;
}

+ (id)userLocationPOIShapeWithMapView:(id)a3 coordinate:(CLLocationCoordinate2D)a4
{
  double longitude;
  double latitude;
  id v6;
  POIShapeUserLocation *v7;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v6 = a3;
  v7 = -[POIShapeUserLocation initWithMapView:coordinate:]([POIShapeUserLocation alloc], "initWithMapView:coordinate:", v6, latitude, longitude);

  return v7;
}

+ (id)customPOIShapeWithMapView:(id)a3 customFeatureAnnotation:(id)a4
{
  id v5;
  id v6;
  POIShapeCustomFeatureAnnotation *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[POIShapeCustomFeatureAnnotation initWithMapView:customFeatureAnnotation:]([POIShapeCustomFeatureAnnotation alloc], "initWithMapView:customFeatureAnnotation:", v6, v5);

  return v7;
}

+ (id)composedWaypointPOIShapeWithMapView:(id)a3 composedWaypoint:(id)a4
{
  id v6;
  id v7;
  POIShapeComposedWaypoint *v8;
  POIShapeComposedWaypoint *v9;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "isCurrentLocation"))
  {
    objc_msgSend(v6, "coordinate");
    v8 = (POIShapeComposedWaypoint *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userLocationPOIShapeWithMapView:coordinate:", v7));
  }
  else
  {
    v8 = -[POIShapeComposedWaypoint initWithMapView:composedWaypoint:]([POIShapeComposedWaypoint alloc], "initWithMapView:composedWaypoint:", v7, v6);
  }
  v9 = v8;

  return v9;
}

+ (id)searchResultWaypointPOIShapeWithMapView:(id)a3 searchResult:(id)a4
{
  id v6;
  id v7;
  POIShapeSearchResult *v8;
  POIShapeSearchResult *v9;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "isDynamicCurrentLocation"))
  {
    objc_msgSend(v6, "coordinate");
    v8 = (POIShapeSearchResult *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userLocationPOIShapeWithMapView:coordinate:", v7));
  }
  else
  {
    v8 = -[POIShapeSearchResult initWithMapView:searchResult:]([POIShapeSearchResult alloc], "initWithMapView:searchResult:", v7, v6);
  }
  v9 = v8;

  return v9;
}

@end
