@implementation SMInitiatorLocation

- (SMInitiatorLocation)initWithIdentifier:(id)a3 latitude:(double)a4 longitude:(double)a5 hunc:(double)a6 altitude:(double)a7 vunc:(double)a8 date:(id)a9
{
  id v17;
  id v18;
  SMInitiatorLocation *v19;
  SMInitiatorLocation *v20;
  SMInitiatorLocation *v21;
  NSObject *v22;
  objc_super v24;
  uint8_t buf[16];

  v17 = a3;
  v18 = a9;
  if (v17)
  {
    v24.receiver = self;
    v24.super_class = (Class)SMInitiatorLocation;
    v19 = -[SMInitiatorLocation init](&v24, sel_init);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_identifier, a3);
      v20->_hunc = a6;
      v20->_altitude = a7;
      v20->_latitude = a4;
      v20->_longitude = a5;
      objc_storeStrong((id *)&v20->_date, a9);
      v20->_vunc = a8;
    }
    self = v20;
    v21 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v21 = 0;
  }

  return v21;
}

- (SMInitiatorLocation)initWithCLLocation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  SMInitiatorLocation *v17;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "coordinate");
  v7 = v6;
  objc_msgSend(v4, "coordinate");
  v9 = v8;
  objc_msgSend(v4, "horizontalAccuracy");
  v11 = v10;
  objc_msgSend(v4, "altitude");
  v13 = v12;
  objc_msgSend(v4, "verticalAccuracy");
  v15 = v14;
  objc_msgSend(v4, "timestamp");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[SMInitiatorLocation initWithIdentifier:latitude:longitude:hunc:altitude:vunc:date:](self, "initWithIdentifier:latitude:longitude:hunc:altitude:vunc:date:", v5, v16, v7, v9, v11, v13, v15);
  return v17;
}

+ (BOOL)isCLLocationValid:(id)a3
{
  id v3;
  SMInitiatorLocation *v4;

  v3 = a3;
  v4 = -[SMInitiatorLocation initWithCLLocation:]([SMInitiatorLocation alloc], "initWithCLLocation:", v3);

  LOBYTE(v3) = -[SMInitiatorLocation isValid](v4, "isValid");
  return (char)v3;
}

- (BOOL)isValid
{
  double v3;
  CLLocationDegrees v4;
  CLLocationDegrees v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  BOOL v10;
  CLLocationCoordinate2D v12;

  -[SMInitiatorLocation latitude](self, "latitude");
  v4 = v3;
  -[SMInitiatorLocation longitude](self, "longitude");
  v12 = CLLocationCoordinate2DMake(v4, v5);
  if (!CLLocationCoordinate2DIsValid(v12))
    return 0;
  -[SMInitiatorLocation latitude](self, "latitude");
  if (v6 == 0.0)
  {
    -[SMInitiatorLocation longitude](self, "longitude");
    if (v7 == 0.0)
      return 0;
  }
  -[SMInitiatorLocation hunc](self, "hunc");
  if (v8 <= 0.0)
    return 0;
  -[SMInitiatorLocation date](self, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 != 0;

  return v10;
}

- (SMInitiatorLocation)initWithDictionary:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  SMInitiatorLocation *v28;

  v4 = (objc_class *)MEMORY[0x24BDD1880];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "valueForKey:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);

  objc_msgSend(v5, "valueForKey:", CFSTR("latitude"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(v5, "valueForKey:", CFSTR("longitude"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(v5, "valueForKey:", CFSTR("hunc"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  objc_msgSend(v5, "valueForKey:", CFSTR("altitude"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  objc_msgSend(v5, "valueForKey:", CFSTR("vunc"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  v23 = v22;

  objc_msgSend(v5, "valueForKey:", CFSTR("date"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "doubleValue");
  v26 = v25;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[SMInitiatorLocation initWithIdentifier:latitude:longitude:hunc:altitude:vunc:date:](self, "initWithIdentifier:latitude:longitude:hunc:altitude:vunc:date:", v8, v27, v11, v14, v17, v20, v23);

  return v28;
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[SMInitiatorLocation identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("identifier"));

  v6 = (void *)MEMORY[0x24BDD16E0];
  -[SMInitiatorLocation latitude](self, "latitude");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("latitude"));

  v8 = (void *)MEMORY[0x24BDD16E0];
  -[SMInitiatorLocation longitude](self, "longitude");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("longitude"));

  v10 = (void *)MEMORY[0x24BDD16E0];
  -[SMInitiatorLocation hunc](self, "hunc");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("hunc"));

  v12 = (void *)MEMORY[0x24BDD16E0];
  -[SMInitiatorLocation altitude](self, "altitude");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("altitude"));

  v14 = (void *)MEMORY[0x24BDD16E0];
  -[SMInitiatorLocation vunc](self, "vunc");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("vunc"));

  v16 = (void *)MEMORY[0x24BDD16E0];
  -[SMInitiatorLocation date](self, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSince1970");
  objc_msgSend(v16, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("date"));

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMInitiatorLocation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  SMInitiatorLocation *v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
  v7 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
  v9 = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("hunc"));
  v11 = v10;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("altitude"));
  v13 = v12;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("vunc"));
  v15 = v14;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[SMInitiatorLocation initWithIdentifier:latitude:longitude:hunc:altitude:vunc:date:](self, "initWithIdentifier:latitude:longitude:hunc:altitude:vunc:date:", v5, v16, v7, v9, v11, v13, v15);
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SMInitiatorLocation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[SMInitiatorLocation latitude](self, "latitude");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("latitude"));
  -[SMInitiatorLocation longitude](self, "longitude");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("longitude"));
  -[SMInitiatorLocation hunc](self, "hunc");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("hunc"));
  -[SMInitiatorLocation altitude](self, "altitude");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("altitude"));
  -[SMInitiatorLocation vunc](self, "vunc");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("vunc"));
  -[SMInitiatorLocation date](self, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("date"));

}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SMInitiatorLocation identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorLocation latitude](self, "latitude");
  v6 = v5;
  -[SMInitiatorLocation longitude](self, "longitude");
  v8 = v7;
  -[SMInitiatorLocation hunc](self, "hunc");
  v10 = v9;
  -[SMInitiatorLocation altitude](self, "altitude");
  v12 = v11;
  -[SMInitiatorLocation vunc](self, "vunc");
  v14 = v13;
  -[SMInitiatorLocation date](self, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringFromDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("identifier, %@, latitude, %f, longitude, %f, hunc, %f, altitude, %f, vunc, %f, date, %@"), v4, v6, v8, v10, v12, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)hunc
{
  return self->_hunc;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)vunc
{
  return self->_vunc;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
