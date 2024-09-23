@implementation SMLocation

- (SMLocation)initWithIdentifier:(id)a3 latitude:(double)a4 longitude:(double)a5 hunc:(double)a6 altitude:(double)a7 vunc:(double)a8 date:(id)a9
{
  id v17;
  id v18;
  SMLocation *v19;
  SMLocation *v20;
  SMLocation *v21;
  NSObject *v22;
  objc_super v24;
  uint8_t buf[16];

  v17 = a3;
  v18 = a9;
  if (v17)
  {
    v24.receiver = self;
    v24.super_class = (Class)SMLocation;
    v19 = -[SMLocation init](&v24, sel_init);
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
      v20->_referenceFrame = 1;
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

- (SMLocation)initWithCLLocation:(id)a3
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
  SMLocation *v17;

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

  v17 = -[SMLocation initWithIdentifier:latitude:longitude:hunc:altitude:vunc:date:](self, "initWithIdentifier:latitude:longitude:hunc:altitude:vunc:date:", v5, v16, v7, v9, v11, v13, v15);
  return v17;
}

+ (BOOL)isCLLocationValid:(id)a3
{
  id v3;
  SMLocation *v4;

  v3 = a3;
  v4 = -[SMLocation initWithCLLocation:]([SMLocation alloc], "initWithCLLocation:", v3);

  LOBYTE(v3) = -[SMLocation isValid](v4, "isValid");
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

  -[SMLocation latitude](self, "latitude");
  v4 = v3;
  -[SMLocation longitude](self, "longitude");
  v12 = CLLocationCoordinate2DMake(v4, v5);
  if (!CLLocationCoordinate2DIsValid(v12))
    return 0;
  -[SMLocation latitude](self, "latitude");
  if (v6 == 0.0)
  {
    -[SMLocation longitude](self, "longitude");
    if (v7 == 0.0)
      return 0;
  }
  -[SMLocation hunc](self, "hunc");
  if (v8 <= 0.0)
    return 0;
  -[SMLocation date](self, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 != 0;

  return v10;
}

- (SMLocation)initWithDictionary:(id)a3
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
  SMLocation *v28;

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
  v28 = -[SMLocation initWithIdentifier:latitude:longitude:hunc:altitude:vunc:date:](self, "initWithIdentifier:latitude:longitude:hunc:altitude:vunc:date:", v8, v27, v11, v14, v17, v20, v23);

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
  -[SMLocation identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("identifier"));

  v6 = (void *)MEMORY[0x24BDD16E0];
  -[SMLocation latitude](self, "latitude");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("latitude"));

  v8 = (void *)MEMORY[0x24BDD16E0];
  -[SMLocation longitude](self, "longitude");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("longitude"));

  v10 = (void *)MEMORY[0x24BDD16E0];
  -[SMLocation hunc](self, "hunc");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("hunc"));

  v12 = (void *)MEMORY[0x24BDD16E0];
  -[SMLocation altitude](self, "altitude");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("altitude"));

  v14 = (void *)MEMORY[0x24BDD16E0];
  -[SMLocation vunc](self, "vunc");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("vunc"));

  v16 = (void *)MEMORY[0x24BDD16E0];
  -[SMLocation date](self, "date");
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

- (SMLocation)initWithCoder:(id)a3
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
  SMLocation *v17;

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

  v17 = -[SMLocation initWithIdentifier:latitude:longitude:hunc:altitude:vunc:date:](self, "initWithIdentifier:latitude:longitude:hunc:altitude:vunc:date:", v5, v16, v7, v9, v11, v13, v15);
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SMLocation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[SMLocation latitude](self, "latitude");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("latitude"));
  -[SMLocation longitude](self, "longitude");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("longitude"));
  -[SMLocation hunc](self, "hunc");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("hunc"));
  -[SMLocation altitude](self, "altitude");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("altitude"));
  -[SMLocation vunc](self, "vunc");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("vunc"));
  -[SMLocation date](self, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("date"));

}

- (BOOL)isEquivalent:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  SMLocation *v7;
  SMLocation *v8;
  void *v9;
  void *v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  int v51;
  void *v53;

  v7 = (SMLocation *)a3;
  if (self == v7)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      -[SMLocation identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMLocation identifier](v8, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v10)
      {
        -[SMLocation identifier](self, "identifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMLocation identifier](v8, "identifier");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v11 = 0;
          goto LABEL_26;
        }
      }
      -[SMLocation latitude](self, "latitude");
      v13 = v12;
      -[SMLocation latitude](v8, "latitude");
      if (v13 != v14)
      {
        -[SMLocation latitude](self, "latitude");
        v16 = v15;
        -[SMLocation latitude](v8, "latitude");
        if (vabdd_f64(v16, v17) >= 2.22044605e-16)
          goto LABEL_21;
      }
      -[SMLocation longitude](self, "longitude");
      v19 = v18;
      -[SMLocation longitude](v8, "longitude");
      if (v19 != v20)
      {
        -[SMLocation longitude](self, "longitude");
        v22 = v21;
        -[SMLocation longitude](v8, "longitude");
        if (vabdd_f64(v22, v23) >= 2.22044605e-16)
          goto LABEL_21;
      }
      -[SMLocation hunc](self, "hunc");
      v25 = v24;
      -[SMLocation hunc](v8, "hunc");
      if (v25 != v26)
      {
        -[SMLocation hunc](self, "hunc");
        v28 = v27;
        -[SMLocation hunc](v8, "hunc");
        if (vabdd_f64(v28, v29) >= 2.22044605e-16)
          goto LABEL_21;
      }
      -[SMLocation altitude](self, "altitude");
      v31 = v30;
      -[SMLocation altitude](v8, "altitude");
      if (v31 != v32)
      {
        -[SMLocation altitude](self, "altitude");
        v34 = v33;
        -[SMLocation altitude](v8, "altitude");
        if (vabdd_f64(v34, v35) >= 2.22044605e-16)
          goto LABEL_21;
      }
      -[SMLocation vunc](self, "vunc");
      v37 = v36;
      -[SMLocation vunc](v8, "vunc");
      if (v37 != v38)
      {
        -[SMLocation vunc](self, "vunc");
        v40 = v39;
        -[SMLocation vunc](v8, "vunc");
        if (vabdd_f64(v40, v41) >= 2.22044605e-16)
        {
LABEL_21:
          v11 = 0;
          goto LABEL_25;
        }
      }
      -[SMLocation date](self, "date");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "timeIntervalSince1970");
      v44 = v43;
      -[SMLocation date](v8, "date");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "timeIntervalSince1970");
      v47 = v46;
      if (v44 == v46
        || (-[SMLocation date](self, "date"),
            v53 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v53, "timeIntervalSince1970"),
            v49 = v48,
            -[SMLocation date](v8, "date"),
            v5 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v5, "timeIntervalSince1970"),
            vabdd_f64(v49, v50) < 2.22044605e-16))
      {
        v51 = -[SMLocation referenceFrame](self, "referenceFrame");
        v11 = v51 == -[SMLocation referenceFrame](v8, "referenceFrame");
        if (v44 == v47)
        {
LABEL_24:

LABEL_25:
          if (v9 == v10)
          {
LABEL_27:

            goto LABEL_28;
          }
LABEL_26:

          goto LABEL_27;
        }
      }
      else
      {
        v11 = 0;
      }

      goto LABEL_24;
    }
    v11 = 0;
  }
LABEL_28:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v24;

  -[SMLocation identifier](self, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v24, "hash");
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[SMLocation latitude](self, "latitude");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v3;
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[SMLocation longitude](self, "longitude");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  v10 = (void *)MEMORY[0x24BDD16E0];
  -[SMLocation hunc](self, "hunc");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6 ^ v9 ^ objc_msgSend(v11, "hash");
  v13 = (void *)MEMORY[0x24BDD16E0];
  -[SMLocation altitude](self, "altitude");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  v16 = (void *)MEMORY[0x24BDD16E0];
  -[SMLocation vunc](self, "vunc");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v15 ^ objc_msgSend(v17, "hash");
  -[SMLocation date](self, "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v12 ^ v18 ^ objc_msgSend(v19, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[SMLocation referenceFrame](self, "referenceFrame"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SMLocation *v6;
  SMLocation *v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  int v29;

  v6 = (SMLocation *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[SMLocation identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMLocation identifier](v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[SMLocation identifier](self, "identifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMLocation identifier](v7, "identifier");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_18;
        }
      }
      -[SMLocation latitude](self, "latitude");
      v13 = v12;
      -[SMLocation latitude](v7, "latitude");
      if (v13 == v14)
      {
        -[SMLocation longitude](self, "longitude");
        v16 = v15;
        -[SMLocation longitude](v7, "longitude");
        if (v16 == v17)
        {
          -[SMLocation hunc](self, "hunc");
          v19 = v18;
          -[SMLocation hunc](v7, "hunc");
          if (v19 == v20)
          {
            -[SMLocation altitude](self, "altitude");
            v22 = v21;
            -[SMLocation altitude](v7, "altitude");
            if (v22 == v23)
            {
              -[SMLocation vunc](self, "vunc");
              v25 = v24;
              -[SMLocation vunc](v7, "vunc");
              if (v25 == v26)
              {
                -[SMLocation date](self, "date");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[SMLocation date](v7, "date");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v27, "isEqualToDate:", v28))
                {
                  v29 = -[SMLocation referenceFrame](self, "referenceFrame");
                  v10 = v29 == -[SMLocation referenceFrame](v7, "referenceFrame");

                  v11 = v10;
                  goto LABEL_17;
                }

              }
            }
          }
        }
      }
      v10 = 0;
      v11 = 0;
LABEL_17:
      if (v8 == v9)
      {
LABEL_19:

        goto LABEL_20;
      }
LABEL_18:

      v11 = v10;
      goto LABEL_19;
    }
    v11 = 0;
  }
LABEL_20:

  return v11;
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
  -[SMLocation identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMLocation latitude](self, "latitude");
  v6 = v5;
  -[SMLocation longitude](self, "longitude");
  v8 = v7;
  -[SMLocation hunc](self, "hunc");
  v10 = v9;
  -[SMLocation altitude](self, "altitude");
  v12 = v11;
  -[SMLocation vunc](self, "vunc");
  v14 = v13;
  -[SMLocation date](self, "date");
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

- (int)referenceFrame
{
  return self->_referenceFrame;
}

- (void)setReferenceFrame:(int)a3
{
  self->_referenceFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
