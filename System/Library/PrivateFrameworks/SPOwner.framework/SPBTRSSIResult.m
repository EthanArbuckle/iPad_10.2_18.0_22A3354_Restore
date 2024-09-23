@implementation SPBTRSSIResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPBTRSSIResult *v4;
  void *v5;
  void *v6;
  SPBTRSSIResult *v7;

  v4 = [SPBTRSSIResult alloc];
  -[SPBTRSSIResult beaconIdentifier](self, "beaconIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBTRSSIResult timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SPBTRSSIResult initWithBeaconIdentifier:timestamp:bucket:rssi:](v4, "initWithBeaconIdentifier:timestamp:bucket:rssi:", v5, v6, -[SPBTRSSIResult bucket](self, "bucket"), -[SPBTRSSIResult rssi](self, "rssi"));

  return v7;
}

- (SPBTRSSIResult)initWithBeaconIdentifier:(id)a3 timestamp:(id)a4 bucket:(int64_t)a5 rssi:(int64_t)a6
{
  id v11;
  id v12;
  SPBTRSSIResult *v13;
  SPBTRSSIResult *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SPBTRSSIResult;
  v13 = -[SPBTRSSIResult init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_beaconIdentifier, a3);
    objc_storeStrong((id *)&v14->_timestamp, a4);
    v14->_bucket = a5;
    v14->_rssi = a6;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *beaconIdentifier;
  id v5;

  beaconIdentifier = self->_beaconIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", beaconIdentifier, CFSTR("beaconIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_bucket, CFSTR("bucket"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_rssi, CFSTR("rssi"));

}

- (SPBTRSSIResult)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *beaconIdentifier;
  NSDate *v7;
  NSDate *timestamp;
  int64_t v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("beaconIdentifier"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  beaconIdentifier = self->_beaconIdentifier;
  self->_beaconIdentifier = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  self->_timestamp = v7;

  self->_bucket = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bucket"));
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rssi"));

  self->_rssi = v9;
  return self;
}

- (id)description
{
  unint64_t bucket;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  bucket = self->_bucket;
  if (bucket > 3)
    v4 = 0;
  else
    v4 = off_1E5E16DF0[bucket];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  -[SPBTRSSIResult beaconIdentifier](self, "beaconIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %p: %@ %@ %ld>"), v6, self, v7, v4, -[SPBTRSSIResult rssi](self, "rssi"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSUUID)beaconIdentifier
{
  return self->_beaconIdentifier;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int64_t)bucket
{
  return self->_bucket;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_beaconIdentifier, 0);
}

@end
