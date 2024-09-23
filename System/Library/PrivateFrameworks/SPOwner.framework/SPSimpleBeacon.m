@implementation SPSimpleBeacon

- (SPSimpleBeacon)initWithInternalSimpleBeacon:(id)a3
{
  id v4;
  SPSimpleBeacon *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSString *type;
  uint64_t v10;
  NSUUID *groupIdentifier;
  double v12;
  uint64_t v13;
  NSUUID *productUUID;
  uint64_t v15;
  NSString *modelName;
  uint64_t v17;
  NSString *manufacturerName;
  uint64_t v19;
  NSString *serialNumber;
  uint64_t v21;
  NSString *systemVersion;
  uint64_t v23;
  NSString *name;
  uint64_t v25;
  SPKeySyncRecord *keySyncRecord;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SPSimpleBeacon;
  v5 = -[SPSimpleBeacon init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    objc_msgSend(v4, "type");
    v8 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v8;

    objc_msgSend(v4, "groupIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSUUID *)v10;

    v5->_partIdentifier = objc_msgSend(v4, "partIdentifier");
    v5->_connectionAllowed = objc_msgSend(v4, "connectionAllowed");
    objc_msgSend(v4, "txPower");
    v5->_txPower = v12;
    objc_msgSend(v4, "productUUID");
    v13 = objc_claimAutoreleasedReturnValue();
    productUUID = v5->_productUUID;
    v5->_productUUID = (NSUUID *)v13;

    v5->_vendorId = objc_msgSend(v4, "vendorId");
    v5->_productId = objc_msgSend(v4, "productId");
    objc_msgSend(v4, "modelName");
    v15 = objc_claimAutoreleasedReturnValue();
    modelName = v5->_modelName;
    v5->_modelName = (NSString *)v15;

    objc_msgSend(v4, "manufacturerName");
    v17 = objc_claimAutoreleasedReturnValue();
    manufacturerName = v5->_manufacturerName;
    v5->_manufacturerName = (NSString *)v17;

    objc_msgSend(v4, "serialNumber");
    v19 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v19;

    objc_msgSend(v4, "systemVersion");
    v21 = objc_claimAutoreleasedReturnValue();
    systemVersion = v5->_systemVersion;
    v5->_systemVersion = (NSString *)v21;

    objc_msgSend(v4, "name");
    v23 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v23;

    v5->_batteryLevel = objc_msgSend(v4, "batteryLevel");
    v5->_connectableDeviceCount = objc_msgSend(v4, "connectableDeviceCount");
    objc_msgSend(v4, "keySyncRecord");
    v25 = objc_claimAutoreleasedReturnValue();
    keySyncRecord = v5->_keySyncRecord;
    v5->_keySyncRecord = (SPKeySyncRecord *)v25;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SPSimpleBeacon *v4;
  SPSimpleBeacon *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  _BOOL4 v11;
  int v12;
  char v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  int64_t v43;
  int64_t v44;
  int64_t v45;
  int64_t v46;
  int64_t v47;
  void *v48;
  void *v49;

  v4 = (SPSimpleBeacon *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SPSimpleBeacon identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPSimpleBeacon identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[SPSimpleBeacon type](self, "type");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPSimpleBeacon type](v5, "type");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToString:", v9)
          && (v10 = -[SPSimpleBeacon partIdentifier](self, "partIdentifier"),
              v10 == -[SPSimpleBeacon partIdentifier](v5, "partIdentifier"))
          && (v11 = -[SPSimpleBeacon connectionAllowed](self, "connectionAllowed"),
              v11 == -[SPSimpleBeacon connectionAllowed](v5, "connectionAllowed")))
        {
          -[SPSimpleBeacon systemVersion](self, "systemVersion");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[SPSimpleBeacon systemVersion](v5, "systemVersion");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v38, "isEqualToString:", v39))
            goto LABEL_58;
          -[SPSimpleBeacon txPower](self, "txPower");
          v41 = v40;
          -[SPSimpleBeacon txPower](v5, "txPower");
          if (v41 != v42)
            goto LABEL_58;
          v43 = -[SPSimpleBeacon vendorId](self, "vendorId");
          if (v43 == -[SPSimpleBeacon vendorId](v5, "vendorId")
            && (v44 = -[SPSimpleBeacon productId](self, "productId"), v44 == -[SPSimpleBeacon productId](v5, "productId"))&& (v45 = -[SPSimpleBeacon batteryLevel](self, "batteryLevel"), v45 == -[SPSimpleBeacon batteryLevel](v5, "batteryLevel"))&& (v46 = -[SPSimpleBeacon connectableDeviceCount](self, "connectableDeviceCount"), v46 == -[SPSimpleBeacon connectableDeviceCount](v5, "connectableDeviceCount"))&& (v47 = -[SPSimpleBeacon partIdentifier](self, "partIdentifier"), v47 == -[SPSimpleBeacon partIdentifier](v5, "partIdentifier")))
          {
            -[SPSimpleBeacon productUUID](self, "productUUID");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[SPSimpleBeacon productUUID](v5, "productUUID");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v49, "isEqual:", v48);

          }
          else
          {
LABEL_58:
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

      -[SPSimpleBeacon name](self, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        v15 = 0;
      else
        v15 = v12;
      if (v14 && v12)
      {
        -[SPSimpleBeacon name](self, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPSimpleBeacon name](v5, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v16, "isEqual:", v17);

      }
      -[SPSimpleBeacon groupIdentifier](self, "groupIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        v19 = 0;
      else
        v19 = v15;
      if (v18 && v15)
      {
        -[SPSimpleBeacon groupIdentifier](self, "groupIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPSimpleBeacon groupIdentifier](v5, "groupIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v20, "isEqual:", v21);

      }
      -[SPSimpleBeacon modelName](self, "modelName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
        v23 = 0;
      else
        v23 = v19;
      if (v22 && v19)
      {
        -[SPSimpleBeacon modelName](self, "modelName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPSimpleBeacon modelName](v5, "modelName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v24, "isEqualToString:", v25);

      }
      -[SPSimpleBeacon manufacturerName](self, "manufacturerName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
        v27 = 0;
      else
        v27 = v23;
      if (v26 && v23)
      {
        -[SPSimpleBeacon manufacturerName](self, "manufacturerName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPSimpleBeacon manufacturerName](v5, "manufacturerName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v28, "isEqualToString:", v29);

      }
      -[SPSimpleBeacon serialNumber](self, "serialNumber");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
        v31 = 0;
      else
        v31 = v27;
      if (v30 && v27)
      {
        -[SPSimpleBeacon serialNumber](self, "serialNumber");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPSimpleBeacon serialNumber](v5, "serialNumber");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v32, "isEqualToString:", v33);

      }
      -[SPSimpleBeacon keySyncRecord](self, "keySyncRecord");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
        v13 = 0;
      else
        v13 = v31;
      if (v34 && v31)
      {
        -[SPSimpleBeacon keySyncRecord](self, "keySyncRecord");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPSimpleBeacon keySyncRecord](v5, "keySyncRecord");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v35, "isEqual:", v36);

      }
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  _BOOL8 connectionAllowed;
  int64_t partIdentifier;
  NSUInteger v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  int8x16_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int8x16_t v26;
  int8x16_t v27;

  v3 = -[NSUUID hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_type, "hash");
  connectionAllowed = self->_connectionAllowed;
  partIdentifier = self->_partIdentifier;
  v7 = -[NSString hash](self->_systemVersion, "hash");
  v8 = (unint64_t)(self->_txPower * 100.0);
  v26 = *(int8x16_t *)&self->_vendorId;
  v27 = *(int8x16_t *)&self->_batteryLevel;
  v9 = self->_partIdentifier;
  v10 = -[NSUUID hash](self->_productUUID, "hash");
  v11 = veorq_s8(v26, v27);
  v12 = *(_QWORD *)&veor_s8(*(int8x8_t *)v11.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL)) ^ partIdentifier ^ v9 ^ v10 ^ v3 ^ v7 ^ v4 ^ connectionAllowed ^ v8;
  -[SPSimpleBeacon name](self, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SPSimpleBeacon name](self, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 ^= objc_msgSend(v14, "hash");

  }
  -[SPSimpleBeacon groupIdentifier](self, "groupIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SPSimpleBeacon groupIdentifier](self, "groupIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 ^= objc_msgSend(v16, "hash");

  }
  -[SPSimpleBeacon modelName](self, "modelName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[SPSimpleBeacon modelName](self, "modelName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v12 ^= objc_msgSend(v18, "hash");

  }
  -[SPSimpleBeacon manufacturerName](self, "manufacturerName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[SPSimpleBeacon manufacturerName](self, "manufacturerName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v12 ^= objc_msgSend(v20, "hash");

  }
  -[SPSimpleBeacon serialNumber](self, "serialNumber");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[SPSimpleBeacon serialNumber](self, "serialNumber");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v12 ^= objc_msgSend(v22, "hash");

  }
  -[SPSimpleBeacon keySyncRecord](self, "keySyncRecord");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[SPSimpleBeacon keySyncRecord](self, "keySyncRecord");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v12 ^= objc_msgSend(v24, "hash");

  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = (void *)objc_opt_new();
  -[SPSimpleBeacon identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setIdentifier:", v6);

  -[SPSimpleBeacon type](self, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setType:", v8);

  -[SPSimpleBeacon groupIdentifier](self, "groupIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setGroupIdentifier:", v10);

  objc_msgSend(v4, "setPartIdentifier:", -[SPSimpleBeacon partIdentifier](self, "partIdentifier"));
  objc_msgSend(v4, "setConnectionAllowed:", -[SPSimpleBeacon connectionAllowed](self, "connectionAllowed"));
  -[SPSimpleBeacon txPower](self, "txPower");
  objc_msgSend(v4, "setTxPower:");
  -[SPSimpleBeacon productUUID](self, "productUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProductUUID:", v11);

  objc_msgSend(v4, "setVendorId:", -[SPSimpleBeacon vendorId](self, "vendorId"));
  objc_msgSend(v4, "setProductId:", -[SPSimpleBeacon productId](self, "productId"));
  -[SPSimpleBeacon modelName](self, "modelName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v4, "setModelName:", v13);

  -[SPSimpleBeacon manufacturerName](self, "manufacturerName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v4, "setManufacturerName:", v15);

  -[SPSimpleBeacon serialNumber](self, "serialNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v4, "setSerialNumber:", v17);

  -[SPSimpleBeacon systemVersion](self, "systemVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");
  objc_msgSend(v4, "setSystemVersion:", v19);

  -[SPSimpleBeacon name](self, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");
  objc_msgSend(v4, "setName:", v21);

  objc_msgSend(v4, "setBatteryLevel:", -[SPSimpleBeacon batteryLevel](self, "batteryLevel"));
  objc_msgSend(v4, "setConnectableDeviceCount:", -[SPSimpleBeacon connectableDeviceCount](self, "connectableDeviceCount"));
  -[SPSimpleBeacon keySyncRecord](self, "keySyncRecord");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copy");
  objc_msgSend(v4, "setKeySyncRecord:", v23);

  return v4;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[SPSimpleBeacon groupIdentifier](self, "groupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  if (v3)
  {
    -[SPSimpleBeacon groupIdentifier](self, "groupIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSimpleBeacon identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p (%@) %@>"), v5, self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SPSimpleBeacon identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p %@>"), v5, self, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)partIdentifier
{
  return self->_partIdentifier;
}

- (void)setPartIdentifier:(int64_t)a3
{
  self->_partIdentifier = a3;
}

- (BOOL)connectionAllowed
{
  return self->_connectionAllowed;
}

- (void)setConnectionAllowed:(BOOL)a3
{
  self->_connectionAllowed = a3;
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (double)txPower
{
  return self->_txPower;
}

- (void)setTxPower:(double)a3
{
  self->_txPower = a3;
}

- (NSUUID)productUUID
{
  return self->_productUUID;
}

- (void)setProductUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)vendorId
{
  return self->_vendorId;
}

- (void)setVendorId:(int64_t)a3
{
  self->_vendorId = a3;
}

- (int64_t)productId
{
  return self->_productId;
}

- (void)setProductId:(int64_t)a3
{
  self->_productId = a3;
}

- (int64_t)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(int64_t)a3
{
  self->_batteryLevel = a3;
}

- (int64_t)connectableDeviceCount
{
  return self->_connectableDeviceCount;
}

- (void)setConnectableDeviceCount:(int64_t)a3
{
  self->_connectableDeviceCount = a3;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (SPKeySyncRecord)keySyncRecord
{
  return self->_keySyncRecord;
}

- (void)setKeySyncRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keySyncRecord, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
