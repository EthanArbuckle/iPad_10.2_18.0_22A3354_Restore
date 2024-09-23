@implementation PKLocation

- (void)setMaxDistance:(double)a3
{
  self->_maxDistance = a3;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
  atomic_store(0, (unsigned __int8 *)&self->_hashComputed);
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
  atomic_store(0, (unsigned __int8 *)&self->_hashComputed);
}

- (PKLocation)initWithCoder:(id)a3
{
  id v4;
  PKLocation *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  uint64_t v16;
  NSString *name;
  uint64_t v18;
  NSString *relevantText;

  v4 = a3;
  v5 = -[PKLocation init](self, "init");
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("latitude"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v5->_latitude = v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("longitude"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v5->_longitude = v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("altitude"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasAltitude = v12 != 0;
    objc_msgSend(v12, "doubleValue");
    v5->_altitude = v13;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("maxDistance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v5->_maxDistance = v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("name"));
    v16 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("relevantText"));
    v18 = objc_claimAutoreleasedReturnValue();
    relevantText = v5->_relevantText;
    v5->_relevantText = (NSString *)v18;

  }
  return v5;
}

- (PKLocation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKLocation;
  return -[PKLocation init](&v3, sel_init);
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
  self->_hasAltitude = 1;
  atomic_store(0, (unsigned __int8 *)&self->_hashComputed);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", self->_latitude);
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("latitude"));

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", self->_longitude);
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("longitude"));

  if (self->_hasAltitude)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", self->_altitude);
    objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("altitude"));

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", self->_maxDistance);
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("maxDistance"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_relevantText, CFSTR("relevantText"));

}

- (void)setRelevantText:(id)a3
{
  NSString *v4;
  NSString *relevantText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  relevantText = self->_relevantText;
  self->_relevantText = v4;

  atomic_store(0, (unsigned __int8 *)&self->_hashComputed);
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->_name;
  self->_name = v4;

  atomic_store(0, (unsigned __int8 *)&self->_hashComputed);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevantText, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKLocation)initWithDictionary:(id)a3
{
  id v4;
  PKLocation *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSString *relevantText;

  v4 = a3;
  v5 = -[PKLocation init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "PKNumberForKey:", CFSTR("latitude"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v5->_latitude = v7;

    objc_msgSend(v4, "PKNumberForKey:", CFSTR("longitude"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v5->_longitude = v9;

    objc_msgSend(v4, "PKNumberForKey:", CFSTR("altitude"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasAltitude = v10 != 0;
    objc_msgSend(v10, "doubleValue");
    v5->_altitude = v11;
    objc_msgSend(v4, "PKNumberForKey:", CFSTR("maxDistance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v5->_maxDistance = v13;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("name"));
    v14 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v14;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("relevantText"));
    v16 = objc_claimAutoreleasedReturnValue();
    relevantText = v5->_relevantText;
    v5->_relevantText = (NSString *)v16;

  }
  return v5;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_latitude;
  longitude = self->_longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (id)description
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("(%.8g, %.8g)"), *(_QWORD *)&self->_latitude, *(_QWORD *)&self->_longitude);
  if (self->_maxDistance > 0.0)
    objc_msgSend(v3, "appendFormat:", CFSTR(", max distance %.1g"), *(_QWORD *)&self->_maxDistance);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  NSString *relevantText;
  void *v12;
  NSString *v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (!-[PKLocation hasEqualCoordinatesToLocation:](self, "hasEqualCoordinatesToLocation:", v5))
    {
      LOBYTE(v10) = 0;
LABEL_17:

      goto LABEL_18;
    }
    v6 = (void *)v5[3];
    v7 = self->_name;
    v8 = v6;
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      LOBYTE(v10) = 0;
      if (!v7 || !v8)
      {
LABEL_16:

        goto LABEL_17;
      }
      v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

      if (!v10)
        goto LABEL_17;
    }
    relevantText = self->_relevantText;
    v12 = (void *)v5[4];
    v7 = relevantText;
    v13 = v12;
    if (v7 == v13)
    {
      LOBYTE(v10) = 1;
      v9 = v7;
    }
    else
    {
      v9 = v13;
      LOBYTE(v10) = 0;
      if (v7 && v13)
        LOBYTE(v10) = -[NSString isEqualToString:](v7, "isEqualToString:", v13);
    }
    goto LABEL_16;
  }
  LOBYTE(v10) = 0;
LABEL_18:

  return v10;
}

- (BOOL)hasEqualCoordinatesToLocation:(id)a3
{
  double *v4;
  BOOL v5;

  v4 = (double *)a3;
  if (self->_latitude == v4[5] && self->_longitude == v4[6])
  {
    v5 = (*((unsigned __int8 *)v4 + 8) | self->_hasAltitude) == 0;
    if (self->_hasAltitude && *((_BYTE *)v4 + 8))
      v5 = self->_altitude == v4[7];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  unsigned __int8 v3;
  double altitude;
  unint64_t result;
  NSUInteger v6;
  double data;
  CC_SHA1_CTX c;
  unsigned __int8 md[8];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = atomic_load((unsigned __int8 *)&self->_hashComputed);
  if ((v3 & 1) != 0)
    return atomic_load(&self->_hash);
  memset(&c, 0, sizeof(c));
  CC_SHA1_Init(&c);
  CC_SHA1_Update(&c, &self->_latitude, 8u);
  CC_SHA1_Update(&c, &self->_longitude, 8u);
  if (self->_hasAltitude)
    altitude = self->_altitude;
  else
    altitude = 0.0;
  data = altitude;
  CC_SHA1_Update(&c, &data, 8u);
  v6 = -[NSString hash](self->_name, "hash");
  CC_SHA1_Update(&c, &v6, 8u);
  v6 = -[NSString hash](self->_relevantText, "hash");
  CC_SHA1_Update(&c, &v6, 8u);
  CC_SHA1_Final(md, &c);
  result = *(_QWORD *)md;
  atomic_store(*(unint64_t *)md, &self->_hash);
  atomic_store(1u, (unsigned __int8 *)&self->_hashComputed);
  return result;
}

- (id)CLLocation
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", self->_latitude, self->_longitude);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)relevantText
{
  return self->_relevantText;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (BOOL)hasAltitude
{
  return self->_hasAltitude;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)maxDistance
{
  return self->_maxDistance;
}

@end
