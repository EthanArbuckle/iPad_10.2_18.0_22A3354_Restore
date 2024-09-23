@implementation STGenericIntentLocation

- (STGenericIntentLocation)initWithName:(id)a3 latitude:(double)a4 longitude:(double)a5
{
  id v9;
  STGenericIntentLocation *v10;
  STGenericIntentLocation *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STGenericIntentLocation;
  v10 = -[STGenericIntentLocation init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_name, a3);
    v11->_latitude = a4;
    v11->_longitude = a5;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("_name"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_latitude"), self->_latitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_longitude"), self->_longitude);
  objc_msgSend(v5, "encodeBool:forKey:", self->_isLatLong, CFSTR("_isLatLong"));

}

- (STGenericIntentLocation)initWithCoder:(id)a3
{
  id v4;
  STGenericIntentLocation *v5;
  uint64_t v6;
  NSString *name;
  double v8;
  double v9;
  STGenericIntentLocation *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)STGenericIntentLocation;
  v5 = -[STGenericIntentLocation init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_latitude"));
    v5->_latitude = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_longitude"));
    v5->_longitude = v9;
    v5->_isLatLong = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isLatLong"));
    v10 = v5;
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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

- (BOOL)isLatLong
{
  return self->_isLatLong;
}

- (void)setIsLatLong:(BOOL)a3
{
  self->_isLatLong = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
