@implementation SSTimeZoneLocation

+ (id)timeZoneWithLocation:(id)a3 timeZoneName:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0C99E80];
  v7 = a3;
  objc_msgSend(v6, "timeZoneWithName:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLocation:timeZone:", v7, v8);

  return v9;
}

+ (id)timeZoneWithLocation:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLocation:timeZone:", v7, v6);

  return v8;
}

- (SSTimeZoneLocation)initWithLocation:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  SSTimeZoneLocation *v8;
  SSTimeZoneLocation *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SSTimeZoneLocation;
  v8 = -[SSTimeZoneLocation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SSTimeZoneLocation setLocation:](v8, "setLocation:", v6);
    -[SSTimeZoneLocation setTimeZone:](v9, "setTimeZone:", v7);
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SSTimeZoneLocation location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSTimeZoneLocation timeZone](self, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
  objc_storeStrong((id *)&self->_latitude, a3);
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
  objc_storeStrong((id *)&self->_longitude, a3);
}

- (NSString)countryName
{
  return self->_countryName;
}

- (void)setCountryName:(id)a3
{
  objc_storeStrong((id *)&self->_countryName, a3);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (BOOL)isCapital
{
  return self->_isCapital;
}

- (void)setIsCapital:(BOOL)a3
{
  self->_isCapital = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_countryName, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
