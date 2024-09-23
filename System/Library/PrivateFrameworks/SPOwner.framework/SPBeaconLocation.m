@implementation SPBeaconLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPBeaconLocation *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  SPBeaconLocation *v13;

  v4 = [SPBeaconLocation alloc];
  -[SPBeaconLocation timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconLocation latitude](self, "latitude");
  v7 = v6;
  -[SPBeaconLocation longitude](self, "longitude");
  v9 = v8;
  -[SPBeaconLocation horizontalAccuracy](self, "horizontalAccuracy");
  v11 = v10;
  -[SPBeaconLocation source](self, "source");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SPBeaconLocation initWithTimestamp:latitude:longitude:horizontalAccuracy:source:](v4, "initWithTimestamp:latitude:longitude:horizontalAccuracy:source:", v5, v12, v7, v9, v11);

  return v13;
}

- (SPBeaconLocation)initWithTimestamp:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 source:(id)a7
{
  id v13;
  id v14;
  SPBeaconLocation *v15;
  SPBeaconLocation *v16;
  objc_super v18;

  v13 = a3;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)SPBeaconLocation;
  v15 = -[SPBeaconLocation init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_timestamp, a3);
    v16->_latitude = a4;
    v16->_longitude = a5;
    v16->_horizontalAccuracy = a6;
    objc_storeStrong((id *)&v16->_source, a7);
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("latitude"), self->_latitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("longitude"), self->_longitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("horizontalAccuracy"), self->_horizontalAccuracy);
  objc_msgSend(v5, "encodeObject:forKey:", self->_source, CFSTR("source"));

}

- (SPBeaconLocation)initWithCoder:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *timestamp;
  double v7;
  double v8;
  double v9;
  NSString *v10;
  NSString *source;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  self->_timestamp = v5;

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
  self->_latitude = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
  self->_longitude = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("horizontalAccuracy"));
  self->_horizontalAccuracy = v9;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();

  source = self->_source;
  self->_source = v10;

  return self;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SPBeaconLocation latitude](self, "latitude");
  v6 = v5;
  -[SPBeaconLocation longitude](self, "longitude");
  v8 = v7;
  -[SPBeaconLocation timestamp](self, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconLocation horizontalAccuracy](self, "horizontalAccuracy");
  v11 = v10;
  -[SPBeaconLocation source](self, "source");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: %.06f/%.06f %@ (%.0f) source: %@>"), v4, self, v6, v8, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
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

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
