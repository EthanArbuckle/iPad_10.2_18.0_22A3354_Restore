@implementation CLUsageReportCoordinate

- (CLUsageReportCoordinate)initWithLatitude:(double)a3 longitude:(double)a4
{
  CLUsageReportCoordinate *v6;
  CLUsageReportCoordinate *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLUsageReportCoordinate;
  v6 = -[CLUsageReportCoordinate init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[CLUsageReportCoordinate setLatitude:](v6, "setLatitude:", a3);
    -[CLUsageReportCoordinate setLongitude:](v7, "setLongitude:", a4);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLUsageReportCoordinate)initWithCoder:(id)a3
{
  double v5;
  double v6;
  double v7;

  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("CL2dLocationLatCodingKey"));
  v6 = v5;
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("CL2dLocationLonCodingKey"));
  return -[CLUsageReportCoordinate initWithLatitude:longitude:](self, "initWithLatitude:longitude:", v6, v7);
}

- (void)encodeWithCoder:(id)a3
{
  -[CLUsageReportCoordinate latitude](self, "latitude");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("CL2dLocationLatCodingKey"));
  -[CLUsageReportCoordinate longitude](self, "longitude");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("CL2dLocationLonCodingKey"));
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

@end
