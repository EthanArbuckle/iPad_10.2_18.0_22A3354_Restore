@implementation RAPSelfLoadedPlace

- (RAPSelfLoadedPlace)initWithMapItem:(id)a3
{
  id v5;
  RAPSelfLoadedPlace *v6;
  RAPSelfLoadedPlace *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPSelfLoadedPlace;
  v6 = -[RAPSelfLoadedPlace init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mapItem, a3);

  return v7;
}

- (NSString)userVisibleTitle
{
  return -[MKMapItem name](self->_mapItem, "name");
}

- (int64_t)source
{
  return 2;
}

- (CLLocationCoordinate2D)coordinate
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CLLocationCoordinate2D result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self->_mapItem, "placemark"));
  objc_msgSend(v2, "coordinate");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.longitude = v8;
  result.latitude = v7;
  return result;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (GEORPPlaceInfo)placeInfo
{
  return 0;
}

- (NSString)sourceURL
{
  return 0;
}

- (NSString)sourceApplication
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
