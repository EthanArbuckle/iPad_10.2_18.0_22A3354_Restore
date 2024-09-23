@implementation _MapsCoordinateKey

+ (id)coordinateKeyFromCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  id v5;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setCoordinate:", latitude, longitude);
  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p %f, %f>"), objc_opt_class(self), self, *(_QWORD *)&self->_coordinate.latitude, *(_QWORD *)&self->_coordinate.longitude);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  double latitude;
  double v8;
  BOOL v9;
  double longitude;
  double v11;

  v4 = a3;
  v5 = objc_opt_class(_MapsCoordinateKey);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    latitude = self->_coordinate.latitude;
    objc_msgSend(v6, "coordinate");
    if (vabdd_f64(latitude, v8) <= 0.000000999999997)
    {
      longitude = self->_coordinate.longitude;
      objc_msgSend(v6, "coordinate");
      v9 = vabdd_f64(longitude, v11) <= 0.000000999999997;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return (unint64_t)self->_coordinate.longitude ^ (unint64_t)self->_coordinate.latitude;
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

@end
