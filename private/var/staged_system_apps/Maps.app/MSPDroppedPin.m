@implementation MSPDroppedPin

- (MSPDroppedPin)initWithSearchResult:(id)a3
{
  id v4;
  MSPDroppedPin *v5;
  double v6;
  double v7;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSPDroppedPin;
  v5 = -[MSPDroppedPin init](&v10, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "type") == 3)
    {
      objc_msgSend(v4, "coordinate");
      v8 = objc_msgSend(objc_alloc((Class)GEOLatLng), "initWithLatitude:longitude:", v6, v7);
      -[MSPDroppedPin setLatLng:](v5, "setLatLng:", v8);

      objc_msgSend(v4, "timestamp");
      -[MSPDroppedPin setTimestamp:](v5, "setTimestamp:");
      if (objc_msgSend(v4, "hasFloorOrdinal"))
        -[MSPDroppedPin setFloorOrdinal:](v5, "setFloorOrdinal:", objc_msgSend(v4, "floorOrdinal"));
    }
  }

  return v5;
}

- (CLLocationCoordinate2D)coordinate
{
  void *v3;
  double v4;
  CLLocationDegrees v5;
  void *v6;
  CLLocationDegrees v7;
  CLLocationCoordinate2D v8;
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSPDroppedPin latLng](self, "latLng"));
  objc_msgSend(v3, "lat");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSPDroppedPin latLng](self, "latLng"));
  objc_msgSend(v6, "lng");
  v8 = CLLocationCoordinate2DMake(v5, v7);

  latitude = v8.latitude;
  longitude = v8.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

@end
