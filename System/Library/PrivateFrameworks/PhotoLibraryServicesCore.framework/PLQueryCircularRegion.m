@implementation PLQueryCircularRegion

- (PLQueryCircularRegion)initWithCenterLatitude:(double)a3 centerLongitude:(double)a4 radius:(double)a5 identifier:(id)a6
{
  id v11;
  PLQueryCircularRegion *v12;
  PLQueryCircularRegion *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PLQueryCircularRegion;
  v12 = -[PLQueryCircularRegion init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_latitude = a3;
    v12->_longitude = a4;
    v12->_radius = a5;
    objc_storeStrong((id *)&v12->_identifier, a6);
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double latitude;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  latitude = self->_latitude;
  v9 = a3;
  objc_msgSend(v4, "numberWithDouble:", latitude);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("latitude"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_longitude);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("longitude"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_radius);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("radius"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
}

- (PLQueryCircularRegion)initWithCoder:(id)a3
{
  id v4;
  PLQueryCircularRegion *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  uint64_t v12;
  NSString *identifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLQueryCircularRegion;
  v5 = -[PLQueryCircularRegion init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("latitude"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v5->_latitude = v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("longitude"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v5->_longitude = v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("radius"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v5->_radius = v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lat - %f, lng - %f, radius - %f, identifier - %@"), *(_QWORD *)&self->_latitude, *(_QWORD *)&self->_longitude, *(_QWORD *)&self->_radius, self->_identifier);
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)radius
{
  return self->_radius;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
