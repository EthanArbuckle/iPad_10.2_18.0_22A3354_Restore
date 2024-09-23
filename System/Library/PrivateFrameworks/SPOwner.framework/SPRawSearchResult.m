@implementation SPRawSearchResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPRawSearchResult *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  SPRawSearchResult *v14;

  v4 = [SPRawSearchResult alloc];
  -[SPRawSearchResult hashedPublicKey](self, "hashedPublicKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPRawSearchResult publicKey](self, "publicKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SPRawSearchResult status](self, "status");
  -[SPRawSearchResult timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPRawSearchResult latitude](self, "latitude");
  v10 = v9;
  -[SPRawSearchResult longitude](self, "longitude");
  v12 = v11;
  -[SPRawSearchResult horizontalAccuracy](self, "horizontalAccuracy");
  v14 = -[SPRawSearchResult initWithHashedPublicKey:publicKey:status:timestamp:latitude:longitude:horizontalAccuracy:](v4, "initWithHashedPublicKey:publicKey:status:timestamp:latitude:longitude:horizontalAccuracy:", v5, v6, v7, v8, v10, v12, v13);

  return v14;
}

- (SPRawSearchResult)initWithHashedPublicKey:(id)a3 publicKey:(id)a4 status:(int64_t)a5 timestamp:(id)a6 latitude:(double)a7 longitude:(double)a8 horizontalAccuracy:(double)a9
{
  id v17;
  id v18;
  id v19;
  SPRawSearchResult *v20;
  SPRawSearchResult *v21;
  objc_super v23;

  v17 = a3;
  v18 = a4;
  v19 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SPRawSearchResult;
  v20 = -[SPRawSearchResult init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_hashedPublicKey, a3);
    objc_storeStrong((id *)&v21->_publicKey, a4);
    v21->_status = a5;
    objc_storeStrong((id *)&v21->_timestamp, a6);
    v21->_latitude = a7;
    v21->_longitude = a8;
    v21->_horizontalAccuracy = a9;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *hashedPublicKey;
  id v5;

  hashedPublicKey = self->_hashedPublicKey;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", hashedPublicKey, CFSTR("hashedPublicKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_publicKey, CFSTR("publicKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("latitude"), self->_latitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("longitude"), self->_longitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("horizontalAccuracy"), self->_horizontalAccuracy);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("status"));

}

- (SPRawSearchResult)initWithCoder:(id)a3
{
  id v4;
  NSData *v5;
  NSData *hashedPublicKey;
  NSData *v7;
  NSData *publicKey;
  NSDate *v9;
  NSDate *timestamp;
  double v11;
  double v12;
  double v13;
  int64_t v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hashedPublicKey"));
  v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  hashedPublicKey = self->_hashedPublicKey;
  self->_hashedPublicKey = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKey"));
  v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  publicKey = self->_publicKey;
  self->_publicKey = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  self->_timestamp = v9;

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
  self->_latitude = v11;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
  self->_longitude = v12;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("horizontalAccuracy"));
  self->_horizontalAccuracy = v13;
  v14 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));

  self->_status = v14;
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
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SPRawSearchResult latitude](self, "latitude");
  v6 = v5;
  -[SPRawSearchResult longitude](self, "longitude");
  v8 = v7;
  -[SPRawSearchResult timestamp](self, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPRawSearchResult horizontalAccuracy](self, "horizontalAccuracy");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: %.06f/%.06f %@ (%.0f)>"), v4, self, v6, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSData)hashedPublicKey
{
  return self->_hashedPublicKey;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (int64_t)status
{
  return self->_status;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_hashedPublicKey, 0);
}

@end
