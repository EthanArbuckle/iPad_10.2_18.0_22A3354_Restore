@implementation STMapViewportVertex

- (void)encodeWithCoder:(id)a3
{
  double latitude;
  id v5;

  latitude = self->_latitude;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_latitude"), latitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_longitude"), self->_longitude);

}

- (STMapViewportVertex)initWithCoder:(id)a3
{
  id v4;
  STMapViewportVertex *v5;
  double v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STMapViewportVertex;
  v5 = -[STMapViewportVertex init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_latitude"));
    v5->_latitude = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_longitude"));
    v5->_longitude = v7;
  }

  return v5;
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
