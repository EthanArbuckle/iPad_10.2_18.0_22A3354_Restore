@implementation CLHarvestDataAccessPoint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLHarvestDataAccessPoint)initWithAccessPoint:(AccessPoint *)a3
{
  CLHarvestDataAccessPoint *v4;
  id v5;
  void **v6;
  void *__p[2];
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLHarvestDataAccessPoint;
  v4 = -[CLHarvestDataAccessPoint init](&v10, "init");
  if (v4)
  {
    __p[0] = (void *)a3->var0.var0;
    v4->_macAddress = sub_100129380((uint64_t)__p);
    v5 = objc_alloc((Class)NSString);
    if (*((char *)&a3->var1.__r_.__value_.var0.var1 + 23) < 0)
    {
      sub_100115CE4(__p, a3->var1.__r_.__value_.var0.var1.__data_, a3->var1.__r_.__value_.var0.var1.__size_);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)a3->var1.__r_.__value_.var0.var0.__data_;
      v9 = *((_QWORD *)&a3->var1.__r_.__value_.var0.var1 + 2);
    }
    if (v9 >= 0)
      v6 = __p;
    else
      v6 = (void **)__p[0];
    v4->_ssid = (NSString *)objc_msgSend(v5, "initWithUTF8String:", v6, __p[0], __p[1], v9);
    if (SHIBYTE(v9) < 0)
      operator delete(__p[0]);
    v4->_rssi = a3->var1.__r_.var0;
    v4->_mode = *(_DWORD *)&a3->var1.__r_.var1;
    v4->_channel = a3->var1.var0;
    *(_QWORD *)&v4->_age = a3[1].var0.var0;
    *(_QWORD *)&v4->_timestamp = a3[1].var1.__r_.__value_.var0.var1.__data_;
    v4->_isApplePersonalHotspot = a3[1].var1.__r_.__value_.var0.var0.__data_[8];
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLHarvestDataAccessPoint;
  -[CLHarvestDataAccessPoint dealloc](&v3, "dealloc");
}

- (CLHarvestDataAccessPoint)initWithCoder:(id)a3
{
  CLHarvestDataAccessPoint *v4;
  uint64_t v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLHarvestDataAccessPoint;
  v4 = -[CLHarvestDataAccessPoint init](&v9, "init");
  if (v4)
  {
    v4->_macAddress = (unint64_t)objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("MacAddressKey"));
    v4->_ssid = (NSString *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("SsidKey"));
    v4->_rssi = objc_msgSend(a3, "decodeIntForKey:", CFSTR("RssiKey"));
    v4->_channel = objc_msgSend(a3, "decodeIntForKey:", CFSTR("ChannelKey"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("AgeKey"));
    v4->_age = v6;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("ScanTimestampKey"));
    v4->_timestamp = v7;
    v4->_isApplePersonalHotspot = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("ApplePersonalHotspotKey"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_macAddress, CFSTR("MacAddressKey"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_ssid, CFSTR("SsidKey"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_rssi, CFSTR("RssiKey"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_mode, CFSTR("ModeKey"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_channel, CFSTR("ChannelKey"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("AgeKey"), self->_age);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("ScanTimestampKey"), self->_timestamp);
  objc_msgSend(a3, "encodeBool:forKey:", self->_isApplePersonalHotspot, CFSTR("ApplePersonalHotspotKey"));
}

- (id)jsonObject
{
  _QWORD v4[8];
  _QWORD v5[8];

  v4[0] = CFSTR("macAddress");
  v5[0] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[CLHarvestDataAccessPoint macAddress](self, "macAddress"));
  v4[1] = CFSTR("ssid");
  v5[1] = -[CLHarvestDataAccessPoint ssid](self, "ssid");
  v4[2] = CFSTR("rssi");
  v5[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLHarvestDataAccessPoint rssi](self, "rssi"));
  v4[3] = CFSTR("mode");
  v5[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLHarvestDataAccessPoint mode](self, "mode"));
  v4[4] = CFSTR("channel");
  v5[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CLHarvestDataAccessPoint channel](self, "channel"));
  v4[5] = CFSTR("age");
  -[CLHarvestDataAccessPoint age](self, "age");
  v5[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v4[6] = CFSTR("scanTimestamp");
  -[CLHarvestDataAccessPoint timestamp](self, "timestamp");
  v5[6] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v4[7] = CFSTR("isApplePersonalHotspot");
  v5[7] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLHarvestDataAccessPoint isApplePersonalHotspot](self, "isApplePersonalHotspot"));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 8);
}

- (id)description
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", +[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", -[CLHarvestDataAccessPoint jsonObject](self, "jsonObject"), 0, 0), 4);
}

- (unint64_t)macAddress
{
  return self->_macAddress;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (int)rssi
{
  return self->_rssi;
}

- (int)mode
{
  return self->_mode;
}

- (int)channel
{
  return self->_channel;
}

- (double)age
{
  return self->_age;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)isApplePersonalHotspot
{
  return self->_isApplePersonalHotspot;
}

@end
