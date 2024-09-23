@implementation POIShapeSearchResult

- (POIShapeSearchResult)initWithMapView:(id)a3 searchResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  POIShapeSearchResult *v13;
  objc_super v15;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeData"));

  if (v8)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "composedWaypoint"));
  }
  else
  {
    v10 = objc_alloc((Class)GEOComposedWaypoint);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_geoMapItem"));
    v9 = objc_msgSend(v10, "initWithMapItem:", v12);

  }
  v15.receiver = self;
  v15.super_class = (Class)POIShapeSearchResult;
  v13 = -[POIShapeComposedWaypoint initWithMapView:composedWaypoint:](&v15, "initWithMapView:composedWaypoint:", v7, v9);

  return v13;
}

@end
