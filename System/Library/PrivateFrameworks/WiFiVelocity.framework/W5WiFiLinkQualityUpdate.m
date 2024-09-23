@implementation W5WiFiLinkQualityUpdate

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5WiFiLinkQualityUpdate;
  if (-[W5WiFiLinkQualityUpdate conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || (objc_msgSend(a3, "isEqual:", &unk_2545B0870) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isEqual:", &unk_2545B06D8);
  }
}

- (id)description
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  objc_msgSend(v3, "appendFormat:", CFSTR("RSSI: %ld dBm\n"), self->_rssi);
  objc_msgSend(v3, "appendFormat:", CFSTR("txRate: %ld Mbps\n"), self->_txRate);
  objc_msgSend(v3, "appendFormat:", CFSTR("CCA: %f%%\n"), self->_cca);
  objc_msgSend(v3, "appendFormat:", CFSTR("Timestamp: %f\n"), *(_QWORD *)&self->_timestamp);
  return (id)objc_msgSend(v3, "copy");
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5WiFiLinkQualityUpdate *v4;
  double v5;

  v4 = -[W5WiFiLinkQualityUpdate init](+[W5WiFiLinkQualityUpdate allocWithZone:](W5WiFiLinkQualityUpdate, "allocWithZone:", a3), "init");
  -[W5WiFiLinkQualityUpdate setRssi:](v4, "setRssi:", self->_rssi);
  -[W5WiFiLinkQualityUpdate setTxRate:](v4, "setTxRate:", self->_txRate);
  *(float *)&v5 = self->_cca;
  -[W5WiFiLinkQualityUpdate setCca:](v4, "setCca:", v5);
  -[W5WiFiLinkQualityUpdate setTimestamp:](v4, "setTimestamp:", self->_timestamp);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;

  objc_msgSend(a3, "encodeInteger:forKey:", self->_rssi, CFSTR("_rssi"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_txRate, CFSTR("_txRate"));
  *(float *)&v5 = self->_cca;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("_cca"), v5);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("_timestamp"), self->_timestamp);
}

- (W5WiFiLinkQualityUpdate)initWithCoder:(id)a3
{
  W5WiFiLinkQualityUpdate *v4;
  float v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)W5WiFiLinkQualityUpdate;
  v4 = -[W5WiFiLinkQualityUpdate init](&v8, sel_init);
  if (v4)
  {
    v4->_rssi = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_rssi"));
    v4->_txRate = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_txRate"));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("_cca"));
    v4->_cca = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("_timestamp"));
    v4->_timestamp = v6;
  }
  return v4;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (int64_t)txRate
{
  return self->_txRate;
}

- (void)setTxRate:(int64_t)a3
{
  self->_txRate = a3;
}

- (float)cca
{
  return self->_cca;
}

- (void)setCca:(float)a3
{
  self->_cca = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end
