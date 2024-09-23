@implementation TransitVehiclePositionAnnotation

- (TransitVehiclePositionAnnotation)initWithVehiclePosition:(id)a3
{
  id v5;
  TransitVehiclePositionAnnotation *v6;
  TransitVehiclePositionAnnotation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransitVehiclePositionAnnotation;
  v6 = -[TransitVehiclePositionAnnotation init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_vehiclePosition, a3);

  return v7;
}

- (void)updateVehiclePosition:(id)a3
{
  GEOTransitVehiclePosition *v4;
  GEOTransitVehiclePosition *vehiclePosition;

  v4 = (GEOTransitVehiclePosition *)a3;
  -[TransitVehiclePositionAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("vehiclePosition"));
  -[TransitVehiclePositionAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("coordinate"));
  -[TransitVehiclePositionAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("heading"));
  -[TransitVehiclePositionAnnotation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("title"));
  vehiclePosition = self->_vehiclePosition;
  self->_vehiclePosition = v4;

  -[TransitVehiclePositionAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("vehiclePosition"));
  -[TransitVehiclePositionAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("coordinate"));
  -[TransitVehiclePositionAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("heading"));
  -[TransitVehiclePositionAnnotation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("title"));
}

- (CLLocationCoordinate2D)coordinate
{
  double v3;
  CLLocationDegrees v4;
  CLLocationDegrees v5;
  double latitude;
  double longitude;
  CLLocationCoordinate2D v8;
  CLLocationCoordinate2D result;

  -[GEOTransitVehiclePosition coordinate](self->_vehiclePosition, "coordinate");
  v4 = v3;
  -[GEOTransitVehiclePosition coordinate](self->_vehiclePosition, "coordinate");
  v8 = CLLocationCoordinate2DMake(v4, v5);
  longitude = v8.longitude;
  latitude = v8.latitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (UIColor)color
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotation vehiclePosition](self, "vehiclePosition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorHexString"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _maps_colorFromHexString:](UIColor, "_maps_colorFromHexString:", v3));
  return (UIColor *)v4;
}

- (id)imageWithScale:(double)a3 nightMode:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotation vehiclePosition](self, "vehiclePosition"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "artworkDataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKTransitArtworkManager sharedInstance](MKTransitArtworkManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transitArtworkImageWithDataSource:size:featureType:scale:nightMode:", v7, 6, 2, v4, a3));

  return v9;
}

- (BOOL)allowsAccuracyRing
{
  return 1;
}

- (BOOL)allowsTimestampLabel
{
  return 1;
}

- (GEOTransitVehiclePosition)vehiclePosition
{
  return self->_vehiclePosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehiclePosition, 0);
}

@end
