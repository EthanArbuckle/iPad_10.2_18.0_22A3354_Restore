@implementation TestPLClusterable

- (TestPLClusterable)initWithLatitude:(double)a3 longitude:(double)a4 time:(double)a5
{
  TestPLClusterable *v8;
  uint64_t v9;
  NSDate *pl_date;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TestPLClusterable;
  v8 = -[TestPLClusterable init](&v12, sel_init);
  if (v8)
  {
    v8->_pl_coordinate = CLLocationCoordinate2DMake(a3, a4);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", a5);
    v9 = objc_claimAutoreleasedReturnValue();
    pl_date = v8->_pl_date;
    v8->_pl_date = (NSDate *)v9;

    v8->_pl_gpsHorizontalAccuracy = -1.0;
  }
  return v8;
}

- (NSString)description
{
  void *v2;
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  latitude = self->_pl_coordinate.latitude;
  longitude = self->_pl_coordinate.longitude;
  -[TestPLClusterable pl_date](self, "pl_date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("(%20.20f,%20.20f) at %@"), *(_QWORD *)&latitude, *(_QWORD *)&longitude, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (CLLocationCoordinate2D)pl_coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_pl_coordinate.latitude;
  longitude = self->_pl_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (double)pl_gpsHorizontalAccuracy
{
  return self->_pl_gpsHorizontalAccuracy;
}

- (NSDate)pl_date
{
  return self->_pl_date;
}

- (NSString)pl_uuid
{
  return self->_pl_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pl_uuid, 0);
  objc_storeStrong((id *)&self->_pl_date, 0);
}

+ (id)clusterableWithLatitude:(double)a3 longitude:(double)a4 time:(double)a5
{
  return -[TestPLClusterable initWithLatitude:longitude:time:]([TestPLClusterable alloc], "initWithLatitude:longitude:time:", a3, a4, a5);
}

@end
