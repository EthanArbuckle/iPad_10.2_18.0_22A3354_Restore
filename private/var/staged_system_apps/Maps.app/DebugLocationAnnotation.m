@implementation DebugLocationAnnotation

- (CLLocationCoordinate2D)coordinate
{
  unsigned int locationType;
  CLLocation *location;
  double v4;
  double v5;
  CLLocationCoordinate2D result;

  locationType = self->_locationType;
  location = self->_location;
  if (locationType)
    -[CLLocation coordinate](location, "coordinate");
  else
    -[CLLocation rawCoordinate](location, "rawCoordinate");
  result.longitude = v5;
  result.latitude = v4;
  return result;
}

- (double)course
{
  unsigned int locationType;
  CLLocation *location;
  double result;

  locationType = self->_locationType;
  location = self->_location;
  if (locationType)
    -[CLLocation course](location, "course");
  else
    -[CLLocation rawCourse](location, "rawCourse");
  return result;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (unsigned)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(unsigned int)a3
{
  self->_locationType = a3;
}

- (int64_t)navType
{
  return self->_navType;
}

- (void)setNavType:(int64_t)a3
{
  self->_navType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end
