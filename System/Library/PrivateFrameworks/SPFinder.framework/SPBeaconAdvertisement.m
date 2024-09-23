@implementation SPBeaconAdvertisement

- (SPBeaconAdvertisement)initWithAddress:(id)a3 publicKey:(id)a4 deviceType:(id)a5 batteryState:(id)a6 rawStatus:(unsigned __int8)a7 rssi:(int64_t)a8 scanDate:(id)a9 recordIdentifier:(id)a10
{
  uint64_t v11;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  SPBeaconAdvertisement *v22;
  SPBeaconAdvertisement *v23;
  objc_super v25;

  v11 = a7;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a9;
  v21 = a10;
  v25.receiver = self;
  v25.super_class = (Class)SPBeaconAdvertisement;
  v22 = -[SPBeaconAdvertisement init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    -[SPBeaconAdvertisement setAddress:](v22, "setAddress:", v16);
    -[SPBeaconAdvertisement setPublicKey:](v23, "setPublicKey:", v17);
    -[SPBeaconAdvertisement setDeviceType:](v23, "setDeviceType:", v18);
    -[SPBeaconAdvertisement setBatteryState:](v23, "setBatteryState:", v19);
    -[SPBeaconAdvertisement setRawStatus:](v23, "setRawStatus:", v11);
    -[SPBeaconAdvertisement setRssi:](v23, "setRssi:", a8);
    -[SPBeaconAdvertisement setScanDate:](v23, "setScanDate:", v20);
    -[SPBeaconAdvertisement setRecordIdentifier:](v23, "setRecordIdentifier:", v21);
  }

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPBeaconAdvertisement)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("address"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconAdvertisement setAddress:](self, "setAddress:", v5);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconAdvertisement setPublicKey:](self, "setPublicKey:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconAdvertisement setDeviceType:](self, "setDeviceType:", v7);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("batteryState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconAdvertisement setBatteryState:](self, "setBatteryState:", v8);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconAdvertisement setRawStatus:](self, "setRawStatus:", objc_msgSend(v9, "unsignedIntegerValue"));

  -[SPBeaconAdvertisement setRssi:](self, "setRssi:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rssi")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scanDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconAdvertisement setScanDate:](self, "setScanDate:", v10);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconAdvertisement setRecordIdentifier:](self, "setRecordIdentifier:", v11);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPBeaconAdvertisement setLocation:](self, "setLocation:", v12);
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[SPBeaconAdvertisement address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("address"));

  -[SPBeaconAdvertisement publicKey](self, "publicKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("publicKey"));

  -[SPBeaconAdvertisement deviceType](self, "deviceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("deviceType"));

  -[SPBeaconAdvertisement batteryState](self, "batteryState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("batteryState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[SPBeaconAdvertisement rawStatus](self, "rawStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("rawStatus"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SPBeaconAdvertisement rssi](self, "rssi"), CFSTR("rssi"));
  -[SPBeaconAdvertisement scanDate](self, "scanDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("scanDate"));

  -[SPBeaconAdvertisement recordIdentifier](self, "recordIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("recordIdentifier"));

  -[SPBeaconAdvertisement location](self, "location");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("location"));

}

- (NSData)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)batteryState
{
  return self->_batteryState;
}

- (void)setBatteryState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unsigned)rawStatus
{
  return self->_rawStatus;
}

- (void)setRawStatus:(unsigned __int8)a3
{
  self->_rawStatus = a3;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (NSDate)scanDate
{
  return self->_scanDate;
}

- (void)setScanDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (SPEstimatedLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSUUID)recordIdentifier
{
  return self->_recordIdentifier;
}

- (void)setRecordIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_scanDate, 0);
  objc_storeStrong((id *)&self->_batteryState, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
