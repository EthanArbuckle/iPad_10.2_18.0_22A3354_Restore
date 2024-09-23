@implementation FMDBLEBeacon

- (FMDBLEBeacon)initWithConfiguration:(id)a3
{
  id v4;
  FMDBLEBeacon *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FMDBLEBeacon;
  v5 = -[FMDBLEBeacon init](&v13, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[FMDBLEBeacon setUpdateDate:](v5, "setUpdateDate:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    -[FMDBLEBeacon setName:](v5, "setName:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rssi"));
    -[FMDBLEBeacon setRssi:](v5, "setRssi:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "beaconIdentifier"));
    -[FMDBLEBeacon setIdentifier:](v5, "setIdentifier:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorCode"));
    -[FMDBLEBeacon setColorCode:](v5, "setColorCode:", v10);

    -[FMDBLEBeacon setPrimary:](v5, "setPrimary:", objc_msgSend(v4, "primary"));
    -[FMDBLEBeacon setUtpConnected:](v5, "setUtpConnected:", objc_msgSend(v4, "utpConnected"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "styleDescriptor"));
    -[FMDBLEBeacon setStyleDescriptor:](v5, "setStyleDescriptor:", v11);

  }
  return v5;
}

- (FMDBLEBeacon)initWithDictionary:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMDBLEBeacon;
  return -[FMDBLEBeacon init](&v4, "init", a3);
}

- (FMDBLEBeacon)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDBLEBeacon *v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSString *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)FMDBLEBeacon;
  v6 = -[FMDBLEBeacon init](&v38, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSNumber, v5);
    v8 = NSStringFromSelector("rssi");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v9));
    -[FMDBLEBeacon setRssi:](v6, "setRssi:", v10);

    v12 = objc_opt_class(NSDate, v11);
    v13 = NSStringFromSelector("updateDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v14));
    -[FMDBLEBeacon setUpdateDate:](v6, "setUpdateDate:", v15);

    v17 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(FMDBLEBeaconIdentifier, v16), CFSTR("beaconIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[FMDBLEBeacon setIdentifier:](v6, "setIdentifier:", v18);

    v20 = objc_opt_class(NSString, v19);
    v21 = NSStringFromSelector("name");
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v20, v22));
    -[FMDBLEBeacon setName:](v6, "setName:", v23);

    v25 = objc_opt_class(NSNumber, v24);
    v26 = NSStringFromSelector("colorCode");
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, v27));
    -[FMDBLEBeacon setColorCode:](v6, "setColorCode:", v28);

    v30 = objc_opt_class(NSNumber, v29);
    v31 = NSStringFromSelector("primary");
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v30, v32));
    -[FMDBLEBeacon setPrimary:](v6, "setPrimary:", objc_msgSend(v33, "BOOLValue"));

    v35 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(FMDAccessoryStyleDescriptor, v34), CFSTR("styleDescriptor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    -[FMDBLEBeacon setStyleDescriptor:](v6, "setStyleDescriptor:", v36);

  }
  return v6;
}

- (FMDBLEBeacon)init
{
  FMDBLEBeacon *v2;
  FMDBLEBeacon *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMDBLEBeacon;
  v2 = -[FMDBLEBeacon init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[FMDBLEBeacon setPrimary:](v2, "setPrimary:", 0);
    -[FMDBLEBeacon setUtpConnected:](v3, "setUtpConnected:", 0);
  }
  return v3;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBLEBeacon rssi](self, "rssi"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v4, CFSTR("rssi"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBLEBeacon name](self, "name"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v5, CFSTR("name"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBLEBeacon updateDate](self, "updateDate"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBLEBeacon updateDate](self, "updateDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v7, "fm_epoch")));
    objc_msgSend(v3, "fm_safeSetObject:forKey:", v8, CFSTR("updateTimestamp"));

  }
  else
  {
    objc_msgSend(v3, "fm_safeSetObject:forKey:", &off_1002D81D0, CFSTR("updateTimestamp"));
  }

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;
  NSString *v19;
  void *v20;
  NSString *v21;
  void *v22;
  id v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBLEBeacon rssi](self, "rssi"));
  v6 = NSStringFromSelector("rssi");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v4, "encodeObject:forKey:", v5, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBLEBeacon updateDate](self, "updateDate"));
  v9 = NSStringFromSelector("updateDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v4, "encodeObject:forKey:", v8, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBLEBeacon identifier](self, "identifier"));
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("beaconIdentifier"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBLEBeacon name](self, "name"));
  v13 = NSStringFromSelector("name");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v4, "encodeObject:forKey:", v12, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBLEBeacon colorCode](self, "colorCode"));
  v16 = NSStringFromSelector("colorCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v4, "encodeObject:forKey:", v15, v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FMDBLEBeacon primary](self, "primary")));
  v19 = NSStringFromSelector("primary");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  objc_msgSend(v4, "encodeObject:forKey:", v18, v20);

  v23 = (id)objc_claimAutoreleasedReturnValue(-[FMDBLEBeacon styleDescriptor](self, "styleDescriptor"));
  v21 = NSStringFromSelector("styleDescriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v4, "encodeObject:forKey:", v23, v22);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  FMDBLEBeacon *v5;
  uint64_t v6;
  id v7;
  BOOL v8;

  v5 = (FMDBLEBeacon *)a3;
  if (v5 == self)
  {
    v8 = 1;
  }
  else
  {
    v6 = objc_opt_class(FMDBLEBeacon, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = -[FMDBLEBeacon hash](v5, "hash");
      v8 = v7 == (id)-[FMDBLEBeacon hash](self, "hash");
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBLEBeacon identifier](self, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringValue"));
  v4 = objc_msgSend(v3, "hash");

  return (unint64_t)v4;
}

- (BOOL)active
{
  return self->_active;
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (void)setRssi:(id)a3
{
  objc_storeStrong((id *)&self->_rssi, a3);
}

- (NSDate)updateDate
{
  return self->_updateDate;
}

- (void)setUpdateDate:(id)a3
{
  objc_storeStrong((id *)&self->_updateDate, a3);
}

- (FMDBLEBeaconIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSNumber)colorCode
{
  return self->_colorCode;
}

- (void)setColorCode:(id)a3
{
  objc_storeStrong((id *)&self->_colorCode, a3);
}

- (BOOL)primary
{
  return self->_primary;
}

- (void)setPrimary:(BOOL)a3
{
  self->_primary = a3;
}

- (BOOL)utpConnected
{
  return self->_utpConnected;
}

- (void)setUtpConnected:(BOOL)a3
{
  self->_utpConnected = a3;
}

- (FMDAccessoryStyleDescriptor)styleDescriptor
{
  return self->_styleDescriptor;
}

- (void)setStyleDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_styleDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleDescriptor, 0);
  objc_storeStrong((id *)&self->_colorCode, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_updateDate, 0);
  objc_storeStrong((id *)&self->_rssi, 0);
}

@end
