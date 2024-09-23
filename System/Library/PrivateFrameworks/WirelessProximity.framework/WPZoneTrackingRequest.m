@implementation WPZoneTrackingRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WPZoneTrackingRequest)init
{
  WPZoneTrackingRequest *result;
  __int128 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WPZoneTrackingRequest;
  result = -[WPZoneTrackingRequest init](&v4, sel_init);
  if (result)
  {
    *(_QWORD *)&v3 = 0xFFFFLL;
    *((_QWORD *)&v3 + 1) = 0xFFFFLL;
    *(_OWORD *)&result->_scanningRates.screenOnInterval = v3;
    result->_scanningRates.window = 0xFFFFLL;
    *(_WORD *)&result->_clientType = 27;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Zone tracking request with type %ld"), -[WPZoneTrackingRequest clientType](self, "clientType"));
}

- (WPZoneTrackingRequest)initWithCoder:(id)a3
{
  id v4;
  WPZoneTrackingRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableSet *zones;
  objc_super v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WPZoneTrackingRequest;
  v5 = -[WPZoneTrackingRequest init](&v12, sel_init);
  if (v5)
  {
    v5->_clientType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kClientType"));
    v5->_scanningRates.screenOffInterval = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kScanningRatesScreenOff"));
    v5->_scanningRates.screenOnInterval = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kScanningRatesScreenOn"));
    v5->_scanningRates.window = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kScanningRatesWindow"));
    v5->_scanWhenScreenOff = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kScanWhenScreenOff"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kZonesValue"));
    v9 = objc_claimAutoreleasedReturnValue();
    zones = v5->_zones;
    v5->_zones = (NSMutableSet *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[WPZoneTrackingRequest clientType](self, "clientType"), CFSTR("kClientType"));
  -[WPZoneTrackingRequest scanningRates](self, "scanningRates");
  objc_msgSend(v4, "encodeInteger:forKey:", v8, CFSTR("kScanningRatesScreenOn"));
  -[WPZoneTrackingRequest scanningRates](self, "scanningRates");
  objc_msgSend(v4, "encodeInteger:forKey:", v7, CFSTR("kScanningRatesScreenOff"));
  -[WPZoneTrackingRequest scanningRates](self, "scanningRates");
  objc_msgSend(v4, "encodeInteger:forKey:", v6, CFSTR("kScanningRatesWindow"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WPZoneTrackingRequest scanWhenScreenOff](self, "scanWhenScreenOff"), CFSTR("kScanWhenScreenOff"));
  -[WPZoneTrackingRequest zones](self, "zones");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kZonesValue"));

}

- (unsigned)clientType
{
  return self->_clientType;
}

- (void)setClientType:(unsigned __int8)a3
{
  self->_clientType = a3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)scanningRates
{
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;

  objc_copyStruct(retstr, &self->_scanningRates, 24, 1, 0);
  return result;
}

- (void)setScanningRates:(id *)a3
{
  objc_copyStruct(&self->_scanningRates, a3, 24, 1, 0);
}

- (BOOL)scanWhenScreenOff
{
  return self->_scanWhenScreenOff;
}

- (void)setScanWhenScreenOff:(BOOL)a3
{
  self->_scanWhenScreenOff = a3;
}

- (NSMutableSet)zones
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setZones:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zones, 0);
}

@end
