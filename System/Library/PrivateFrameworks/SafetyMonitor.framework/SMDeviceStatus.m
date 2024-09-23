@implementation SMDeviceStatus

- (SMDeviceStatus)init
{
  void *v3;
  void *v4;
  SMDeviceStatus *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SMDeviceStatus initWithIdentifier:batteryRemaining:cellularStrength:date:wifiStrength:](self, "initWithIdentifier:batteryRemaining:cellularStrength:date:wifiStrength:", v3, 0, 0, v4, 0);

  return v5;
}

- (SMDeviceStatus)initWithIdentifier:(id)a3 batteryRemaining:(int64_t)a4 cellularStrength:(unint64_t)a5 date:(id)a6 wifiStrength:(unint64_t)a7
{
  id v13;
  id v14;
  SMDeviceStatus *v15;
  SMDeviceStatus *v16;
  SMDeviceStatus *v17;
  NSObject *v18;
  objc_super v20;
  uint8_t buf[16];

  v13 = a3;
  v14 = a6;
  if (v13)
  {
    v20.receiver = self;
    v20.super_class = (Class)SMDeviceStatus;
    v15 = -[SMDeviceStatus init](&v20, sel_init);
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_identifier, a3);
      v16->_batteryRemaining = a4;
      v16->_cellularStrength = a5;
      objc_storeStrong((id *)&v16->_date, a6);
      v16->_wifiStrength = a7;
    }
    self = v16;
    v17 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v17 = 0;
  }

  return v17;
}

- (SMDeviceStatus)initWithDictionary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  SMDeviceStatus *v19;

  v4 = (void *)MEMORY[0x24BDD1880];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);

  objc_msgSend(v5, "valueForKey:", CFSTR("batteryRemaining"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v5, "valueForKey:", CFSTR("cellularStrength"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  objc_msgSend(v5, "valueForKey:", CFSTR("timeOfCollection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("wifiStrength"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "integerValue");
  v19 = -[SMDeviceStatus initWithIdentifier:batteryRemaining:cellularStrength:date:wifiStrength:](self, "initWithIdentifier:batteryRemaining:cellularStrength:date:wifiStrength:", v8, v10, v12, v16, v18);

  return v19;
}

- (id)outputToDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[SMDeviceStatus identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SMDeviceStatus batteryRemaining](self, "batteryRemaining"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("batteryRemaining"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[SMDeviceStatus cellularStrength](self, "cellularStrength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("cellularStrength"));

  v8 = (void *)MEMORY[0x24BDD16E0];
  -[SMDeviceStatus date](self, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("timeOfCollection"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[SMDeviceStatus wifiStrength](self, "wifiStrength"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("wifiStrength"));

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMDeviceStatus)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  SMDeviceStatus *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("batteryRemaining"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cellularStrength"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeOfCollection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("wifiStrength"));

  v10 = -[SMDeviceStatus initWithIdentifier:batteryRemaining:cellularStrength:date:wifiStrength:](self, "initWithIdentifier:batteryRemaining:cellularStrength:date:wifiStrength:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SMDeviceStatus identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("identifier"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[SMDeviceStatus batteryRemaining](self, "batteryRemaining"), CFSTR("batteryRemaining"));
  objc_msgSend(v6, "encodeInteger:forKey:", (int)-[SMDeviceStatus cellularStrength](self, "cellularStrength"), CFSTR("cellularStrength"));
  -[SMDeviceStatus date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("timeOfCollection"));

  objc_msgSend(v6, "encodeInteger:forKey:", (int)-[SMDeviceStatus wifiStrength](self, "wifiStrength"), CFSTR("wifiStrength"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIdentifier:batteryRemaining:cellularStrength:date:wifiStrength:", self->_identifier, self->_batteryRemaining, self->_cellularStrength, self->_date, self->_wifiStrength);
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SMDeviceStatus identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SMDeviceStatus batteryRemaining](self, "batteryRemaining");
  v6 = -[SMDeviceStatus cellularStrength](self, "cellularStrength");
  -[SMDeviceStatus date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("identifier, %@, batteryRemaining, %d, cellularStrength, %d, date, %@, wifiStrength, %d"), v4, v5, v6, v7, -[SMDeviceStatus wifiStrength](self, "wifiStrength"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (int64_t)batteryRemaining
{
  return self->_batteryRemaining;
}

- (void)setBatteryRemaining:(int64_t)a3
{
  self->_batteryRemaining = a3;
}

- (unint64_t)cellularStrength
{
  return self->_cellularStrength;
}

- (void)setCellularStrength:(unint64_t)a3
{
  self->_cellularStrength = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)wifiStrength
{
  return self->_wifiStrength;
}

- (void)setWifiStrength:(unint64_t)a3
{
  self->_wifiStrength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
