@implementation NIRegionPredicate

- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4 preferredUpdateRate:(int64_t)a5
{
  id v10;
  NIRegionPredicate *v11;
  NIRegionPredicate *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v10 = a3;
  if (!v10)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIRegionPredicate.mm"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  if (a4 <= 0.0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIRegionPredicate.mm"), 23, CFSTR("radius must be larger than 0"));

  }
  v16.receiver = self;
  v16.super_class = (Class)NIRegionPredicate;
  v11 = -[NIRegionPredicate init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_radius = a4;
    v12->_regionSizeCategory = 0;
    v12->_preferredUpdateRate = a5;
    v12->_requiresUserIntent = 0;
    v12->_devicePresencePreset = 0;
  }

  return v12;
}

- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4
{
  id v6;
  uint64_t v7;
  id v8;
  double v9;
  NIRegionPredicate *v10;

  v6 = a3;
  v8 = objc_alloc((Class)objc_opt_class(self, v7));
  *(float *)&v9 = a4;
  v10 = (NIRegionPredicate *)objc_msgSend(v8, "initWithName:radius:preferredUpdateRate:", v6, 0, v9);

  return v10;
}

- (NIRegionPredicate)initWithName:(id)a3 devicePresencePreset:(int64_t)a4
{
  uint64_t v7;
  id v8;
  id v9;
  NIRegionPredicate *v10;
  void *v12;
  void *v13;

  v8 = a3;
  if (v8)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIRegionPredicate.mm"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (a4)
      goto LABEL_3;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIRegionPredicate.mm"), 42, CFSTR("device presence preset cannot be unspecified"));

LABEL_3:
  v9 = objc_alloc((Class)objc_opt_class(self, v7));
  +[NIDevicePresenceConfiguration _radiusFromDevicePresencePreset:](NIDevicePresenceConfiguration, "_radiusFromDevicePresencePreset:", a4);
  v10 = (NIRegionPredicate *)objc_msgSend(v9, "initWithName:radius:", v8);

  if (v10)
    v10->_devicePresencePreset = a4;

  return v10;
}

- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4 preferredUpdateRate:(int64_t)a5 requiresUserIntent:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  NIRegionPredicate *v11;
  double v12;
  NIRegionPredicate *v13;

  v6 = a6;
  v10 = a3;
  v11 = [NIRegionPredicate alloc];
  *(float *)&v12 = a4;
  v13 = -[NIRegionPredicate initWithName:radius:preferredUpdateRate:](v11, "initWithName:radius:preferredUpdateRate:", v10, a5, v12);
  -[NIRegionPredicate setRequiresUserIntent:](v13, "setRequiresUserIntent:", v6);

  return v13;
}

- (NIRegionPredicate)initWithName:(id)a3 regionSizeCategory:(int64_t)a4 radius:(float)a5 preferredUpdateRate:(int64_t)a6 requiresUserIntent:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  NIRegionPredicate *v13;
  double v14;
  NIRegionPredicate *v15;

  v7 = a7;
  v12 = a3;
  v13 = [NIRegionPredicate alloc];
  *(float *)&v14 = a5;
  v15 = -[NIRegionPredicate initWithName:radius:preferredUpdateRate:requiresUserIntent:](v13, "initWithName:radius:preferredUpdateRate:requiresUserIntent:", v12, a6, v7, v14);
  -[NIRegionPredicate setRegionSizeCategory:](v15, "setRegionSizeCategory:", a4);

  return v15;
}

- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4 preferredUpdateRate:(int64_t)a5 requiresUserIntent:(BOOL)a6 devicePresencePreset:(int64_t)a7
{
  _BOOL8 v8;
  id v12;
  NIRegionPredicate *v13;
  double v14;
  NIRegionPredicate *v15;

  v8 = a6;
  v12 = a3;
  v13 = [NIRegionPredicate alloc];
  *(float *)&v14 = a4;
  v15 = -[NIRegionPredicate initWithName:radius:preferredUpdateRate:requiresUserIntent:](v13, "initWithName:radius:preferredUpdateRate:requiresUserIntent:", v12, a5, v8, v14);
  -[NIRegionPredicate setDevicePresencePreset:](v15, "setDevicePresencePreset:", a7);

  return v15;
}

- (NIRegionPredicate)initWithName:(id)a3 regionSizeCategory:(int64_t)a4 radius:(float)a5 preferredUpdateRate:(int64_t)a6 requiresUserIntent:(BOOL)a7 devicePresencePreset:(int64_t)a8
{
  _BOOL8 v9;
  id v14;
  NIRegionPredicate *v15;
  double v16;
  NIRegionPredicate *v17;

  v9 = a7;
  v14 = a3;
  v15 = [NIRegionPredicate alloc];
  *(float *)&v16 = a5;
  v17 = -[NIRegionPredicate initWithName:radius:preferredUpdateRate:requiresUserIntent:devicePresencePreset:](v15, "initWithName:radius:preferredUpdateRate:requiresUserIntent:devicePresencePreset:", v14, a6, v9, a8, v16);
  -[NIRegionPredicate setRegionSizeCategory:](v17, "setRegionSizeCategory:", a4);

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)devicePresencePreset
{
  return self->_devicePresencePreset;
}

- (void)setDevicePresencePreset:(int64_t)a3
{
  self->_devicePresencePreset = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  double v5;

  v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  *(float *)&v5 = self->_radius;
  return _objc_msgSend(v4, "initWithName:regionSizeCategory:radius:preferredUpdateRate:requiresUserIntent:devicePresencePreset:", self->_name, self->_regionSizeCategory, self->_preferredUpdateRate, self->_requiresUserIntent, self->_devicePresencePreset, v5);
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_regionSizeCategory, CFSTR("regionSizeCategory"));
  *(float *)&v4 = self->_radius;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("radius"), v4);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_preferredUpdateRate, CFSTR("preferredUpdateRate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requiresUserIntent, CFSTR("requiresUserIntent"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_devicePresencePreset, CFSTR("devicePresencePreset"));

}

- (NIRegionPredicate)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  float v9;
  float v10;
  id v11;
  id v12;
  int64_t v13;
  NIRegionPredicate *v14;
  unsigned __int8 v15;
  NIRegionPredicate *v16;
  NIRegionPredicate *v17;
  objc_super v19;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("regionSizeCategory"));
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("radius"));
  v10 = v9;
  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredUpdateRate"));
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("devicePresencePreset"));
  if (v7 && ((v13 = (int64_t)v12, v10 >= 0.0) || v12))
  {
    v15 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresUserIntent"));
    v19.receiver = self;
    v19.super_class = (Class)NIRegionPredicate;
    v16 = -[NIRegionPredicate init](&v19, "init");
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_name, v7);
      v17->_radius = v10;
      v17->_regionSizeCategory = (int64_t)v8;
      v17->_preferredUpdateRate = (int64_t)v11;
      v17->_requiresUserIntent = v15;
      v17->_devicePresencePreset = v13;
    }
    self = v17;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NIRegionPredicate *v7;
  NIRegionPredicate *v8;
  void *v9;
  float v10;
  BOOL v11;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NIRegionPredicate *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v11 = 1;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIRegionPredicate name](v7, "name"));
      v11 = objc_msgSend(v9, "isEqualToString:", self->_name)
         && -[NIRegionPredicate regionSizeCategory](v8, "regionSizeCategory") == self->_regionSizeCategory
         && (-[NIRegionPredicate radius](v8, "radius"), v10 == self->_radius)
         && -[NIRegionPredicate preferredUpdateRate](v8, "preferredUpdateRate") == self->_preferredUpdateRate
         && self->_requiresUserIntent == -[NIRegionPredicate requiresUserIntent](v8, "requiresUserIntent")
         && -[NIRegionPredicate devicePresencePreset](v8, "devicePresencePreset") == self->_devicePresencePreset;

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return self->_regionSizeCategory ^ self->_preferredUpdateRate ^ -[NSString hash](self->_name, "hash") ^ self->_requiresUserIntent ^ self->_devicePresencePreset ^ (int)self->_radius;
}

- (id)description
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc((Class)NSMutableString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIRegionPredicate descriptionInternal](self, "descriptionInternal"));
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  int64_t regionSizeCategory;
  NSString *name;
  const __CFString *v5;
  float radius;
  const char *v7;
  unint64_t devicePresencePreset;

  name = self->_name;
  regionSizeCategory = self->_regionSizeCategory;
  if (regionSizeCategory)
  {
    if (regionSizeCategory != 10)
      sub_1003E2EE0();
    v5 = CFSTR("Large");
  }
  else
  {
    v5 = CFSTR("Default");
  }
  radius = self->_radius;
  v7 = +[NIUtils NINearbyObjectUpdateRateToString:](NIUtils, "NINearbyObjectUpdateRateToString:", self->_preferredUpdateRate);
  devicePresencePreset = self->_devicePresencePreset;
  if (devicePresencePreset >= 7)
    sub_1003E2F08();
  return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("name: %@, cat: %@, radius: %0.2f m, rate: %s, intent: %d, presencePreset: %s"), name, v5, radius, v7, self->_requiresUserIntent, off_100810D90[devicePresencePreset]));
}

- (id)shortDescription
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %0.2fm %s C:%d,I:%d,P:%d"), self->_name, self->_radius, +[NIUtils NINearbyObjectUpdateRateToShortString:](NIUtils, "NINearbyObjectUpdateRateToShortString:", self->_preferredUpdateRate), self->_regionSizeCategory, self->_requiresUserIntent, self->_devicePresencePreset);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)regionSizeCategory
{
  return self->_regionSizeCategory;
}

- (void)setRegionSizeCategory:(int64_t)a3
{
  self->_regionSizeCategory = a3;
}

- (float)radius
{
  return self->_radius;
}

- (int64_t)preferredUpdateRate
{
  return self->_preferredUpdateRate;
}

- (void)setPreferredUpdateRate:(int64_t)a3
{
  self->_preferredUpdateRate = a3;
}

- (BOOL)requiresUserIntent
{
  return self->_requiresUserIntent;
}

- (void)setRequiresUserIntent:(BOOL)a3
{
  self->_requiresUserIntent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
