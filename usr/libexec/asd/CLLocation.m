@implementation CLLocation

- (id)distanceFromLat:(id)a3 andLon:(id)a4
{
  id v6;
  id v7;
  id v8;
  float v9;
  float v10;
  float v11;
  float v12;
  id v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)CLLocation);
  objc_msgSend(v7, "floatValue");
  v10 = v9;

  objc_msgSend(v6, "floatValue");
  v12 = v11;

  v13 = objc_msgSend(v8, "initWithLatitude:longitude:", v10, v12);
  -[CLLocation distanceFromLocation:](self, "distanceFromLocation:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

  return v14;
}

- (id)getLatitude
{
  -[CLLocation coordinate](self, "coordinate");
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
}

- (id)getLongitude
{
  double v2;

  -[CLLocation coordinate](self, "coordinate");
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v2);
}

@end
