@implementation PLLocationOfInterestLocation

- (PLLocationOfInterestLocation)initWithLocation:(id)a3 uncertainty:(double)a4
{
  id v7;
  PLLocationOfInterestLocation *v8;
  double latitude;
  double longitude;
  _BOOL4 v11;
  objc_super v13;
  CLLocationCoordinate2D v14;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLLocationOfInterestLocation;
  v8 = -[PLLocationOfInterestLocation init](&v13, sel_init);
  if (v8)
  {
    if (!v7)
      goto LABEL_9;
    objc_msgSend(v7, "coordinate");
    latitude = v14.latitude;
    longitude = v14.longitude;
    if (!CLLocationCoordinate2DIsValid(v14))
      goto LABEL_9;
    v11 = latitude != 0.0;
    if (longitude != 0.0)
      v11 = 1;
    if (v11 && (latitude != 40.0 || longitude != -100.0))
    {
      objc_storeStrong((id *)&v8->_location, a3);
      v8->_uncertainty = a4;
    }
    else
    {
LABEL_9:

      v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  CLLocation *location;
  void *v4;
  CLLocation *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double uncertainty;
  void *v11;
  objc_super v13;

  location = self->_location;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)PLLocationOfInterestLocation;
  v5 = location;
  -[PLLocationOfInterestLocation description](&v13, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLLocation coordinate](v5, "coordinate");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.8f, %.8f}"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  uncertainty = self->_uncertainty;

  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ - %@ – %.2f"), v6, v9, *(_QWORD *)&uncertainty);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (double)distanceFromLocation:(id)a3 withTypeRadius:(double)a4
{
  double v6;
  double uncertainty;
  double v8;
  double v9;
  double result;

  -[CLLocation distanceFromLocation:](self->_location, "distanceFromLocation:", a3);
  uncertainty = self->_uncertainty;
  v8 = v6 - fmin(uncertainty, 1500.0);
  if (uncertainty == 1.79769313e308)
    v9 = 1.79769313e308;
  else
    v9 = v8;
  result = v6 - a4;
  if (v9 < result)
    return v9;
  return result;
}

- (CLLocation)location
{
  return self->_location;
}

- (double)uncertainty
{
  return self->_uncertainty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end
