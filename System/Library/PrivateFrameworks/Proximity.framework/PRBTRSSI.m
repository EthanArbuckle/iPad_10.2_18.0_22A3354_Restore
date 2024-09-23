@implementation PRBTRSSI

- (PRBTRSSI)initWithTimeStamp:(double)a3 rssi_dbm:(int)a4 channel:(int)a5
{
  PRBTRSSI *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PRBTRSSI;
  result = -[PRBTRSSI init](&v9, sel_init);
  if (result)
  {
    result->_timestamp = a3;
    result->_rssi_dbm = a4;
    result->_channel = a5;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRBTRSSI: timestamp: %.6f, rssi_dbm: %4.2d, channel: %d"), *(_QWORD *)&self->_timestamp, self->_rssi_dbm, self->_channel);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  int v9;
  int v10;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PRBTRSSI timestamp](self, "timestamp");
    v7 = v6;
    objc_msgSend(v5, "timestamp");
    if (v7 == v8 && (v9 = -[PRBTRSSI rssi_dbm](self, "rssi_dbm"), v9 == objc_msgSend(v5, "rssi_dbm")))
    {
      v10 = -[PRBTRSSI channel](self, "channel");
      v11 = v10 == objc_msgSend(v5, "channel");
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRBTRSSI)initWithCoder:(id)a3
{
  id v4;
  double v5;
  PRBTRSSI *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
  v6 = -[PRBTRSSI initWithTimeStamp:rssi_dbm:channel:](self, "initWithTimeStamp:rssi_dbm:channel:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("rssi")), objc_msgSend(v4, "decodeIntForKey:", CFSTR("channel")), v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timestamp"), self->_timestamp);
  objc_msgSend(v4, "encodeInt:forKey:", self->_rssi_dbm, CFSTR("rssi"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_channel, CFSTR("channel"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PRBTRSSI initWithTimeStamp:rssi_dbm:channel:]([PRBTRSSI alloc], "initWithTimeStamp:rssi_dbm:channel:", self->_rssi_dbm, self->_channel, self->_timestamp);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int)rssi_dbm
{
  return self->_rssi_dbm;
}

- (int)channel
{
  return self->_channel;
}

@end
