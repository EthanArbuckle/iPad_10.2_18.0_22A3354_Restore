@implementation SPBTRSSIMeasurement

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPBTRSSIMeasurement *v4;
  void *v5;
  void *v6;
  SPBTRSSIMeasurement *v7;

  v4 = [SPBTRSSIMeasurement alloc];
  -[SPBTRSSIMeasurement beaconIdentifier](self, "beaconIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBTRSSIMeasurement timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SPBTRSSIMeasurement initWithBeaconIdentifier:timestamp:channel:rssi:](v4, "initWithBeaconIdentifier:timestamp:channel:rssi:", v5, v6, -[SPBTRSSIMeasurement channel](self, "channel"), -[SPBTRSSIMeasurement rssi](self, "rssi"));

  return v7;
}

- (SPBTRSSIMeasurement)initWithBeaconIdentifier:(id)a3 timestamp:(id)a4 channel:(int64_t)a5 rssi:(int64_t)a6
{
  id v11;
  id v12;
  SPBTRSSIMeasurement *v13;
  SPBTRSSIMeasurement *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SPBTRSSIMeasurement;
  v13 = -[SPBTRSSIMeasurement init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_beaconIdentifier, a3);
    objc_storeStrong((id *)&v14->_timestamp, a4);
    v14->_channel = a5;
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
  objc_msgSend(v5, "encodeInteger:forKey:", self->_channel, CFSTR("channel"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_rssi, CFSTR("rssi"));

}

- (SPBTRSSIMeasurement)initWithCoder:(id)a3
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

  self->_channel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("channel"));
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rssi"));

  self->_rssi = v9;
  return self;
}

- (id)description
{
  int64_t channel;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  channel = self->_channel;
  v4 = CFSTR("channel38");
  v5 = CFSTR("channel39");
  if (channel != 39)
    v5 = 0;
  if (channel != 38)
    v4 = v5;
  v6 = CFSTR("channelOther");
  v7 = CFSTR("channel37");
  if (channel != 37)
    v7 = 0;
  if (channel)
    v6 = v7;
  if (channel <= 37)
    v8 = v6;
  else
    v8 = v4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = objc_opt_class();
  -[SPBTRSSIMeasurement beaconIdentifier](self, "beaconIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@ %p: %@ %ld %@>"), v10, self, v11, -[SPBTRSSIMeasurement rssi](self, "rssi"), v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSUUID)beaconIdentifier
{
  return self->_beaconIdentifier;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int64_t)channel
{
  return self->_channel;
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
