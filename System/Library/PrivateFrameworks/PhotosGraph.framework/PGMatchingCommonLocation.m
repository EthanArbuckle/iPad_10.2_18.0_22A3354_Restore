@implementation PGMatchingCommonLocation

- (double)distanceBetweenCoordinates
{
  double result;

  result = self->_distance;
  if (result == 1.79769313e308)
  {
    CLLocationCoordinate2DGetDistanceFrom();
    self->_distance = result;
  }
  return result;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
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

- (CLLocationCoordinate2D)addressCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_addressCoordinate.latitude;
  longitude = self->_addressCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setAddressCoordinate:(CLLocationCoordinate2D)a3
{
  self->_addressCoordinate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

+ (id)matchingCommonLocationWithLabel:(id)a3 coordinate:(CLLocationCoordinate2D)a4 forAddressCoordinate:(CLLocationCoordinate2D)a5
{
  double longitude;
  double latitude;
  double v7;
  double v8;
  id v9;
  _QWORD *v10;

  longitude = a5.longitude;
  latitude = a5.latitude;
  v7 = a4.longitude;
  v8 = a4.latitude;
  v9 = a3;
  objc_opt_class();
  v10 = (_QWORD *)objc_opt_new();
  objc_msgSend(v10, "setLabel:", v9);

  objc_msgSend(v10, "setCoordinate:", v8, v7);
  objc_msgSend(v10, "setAddressCoordinate:", latitude, longitude);
  v10[1] = 0x7FEFFFFFFFFFFFFFLL;
  return v10;
}

@end
