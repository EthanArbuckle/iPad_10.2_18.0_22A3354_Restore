@implementation PXAnnotatedLocation

- (PXAnnotatedLocation)initWithLatitude:(double)a3 longitude:(double)a4 placeAnnotation:(id)a5
{
  id v8;
  CLLocationCoordinate2D v9;
  PXAnnotatedLocation *v10;

  v8 = a5;
  v9 = CLLocationCoordinate2DMake(a3, a4);
  v10 = -[PXAnnotatedLocation initWithCoordinate:placeAnnotation:](self, "initWithCoordinate:placeAnnotation:", v8, v9.latitude, v9.longitude);

  return v10;
}

- (PXAnnotatedLocation)initWithCoordinate:(CLLocationCoordinate2D)a3 placeAnnotation:(id)a4
{
  double longitude;
  double latitude;
  objc_class *v7;
  id v8;
  void *v9;
  PXAnnotatedLocation *v10;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v7 = (objc_class *)MEMORY[0x1E0C9E3B8];
  v8 = a4;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithLatitude:longitude:", latitude, longitude);
  v10 = -[PXAnnotatedLocation initWithLocation:placeAnnotation:](self, "initWithLocation:placeAnnotation:", v9, v8);

  return v10;
}

- (PXAnnotatedLocation)initWithLocation:(id)a3 placeAnnotation:(id)a4
{
  id v8;
  id v9;
  PXAnnotatedLocation *v10;
  PXAnnotatedLocation *v11;
  CLLocationDegrees v12;
  CLLocationDegrees v13;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAnnotatedLocation.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("location"));

  }
  v16.receiver = self;
  v16.super_class = (Class)PXAnnotatedLocation;
  v10 = -[PXAnnotatedLocation init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_location, a3);
    objc_storeStrong((id *)&v11->_placeAnnotation, a4);
    objc_msgSend(v8, "coordinate");
    v11->_coordinate.latitude = v12;
    v11->_coordinate.longitude = v13;
  }

  return v11;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (PXPlaceAnnotation)placeAnnotation
{
  return self->_placeAnnotation;
}

- (NSNumber)locationType
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocationType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationType, 0);
  objc_storeStrong((id *)&self->_placeAnnotation, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
