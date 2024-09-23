@implementation SADevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SADevice)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  SADevice *v13;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("SADeviceIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("SADeviceGroupIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("SADevicePartIdentifier"));
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("SADeviceName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("SADeviceModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("SADeviceSystemVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("SADeviceVendorId"));
  v7 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("SADeviceProductId"));
  v8 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("SADeviceType"));
  v9 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("SADeviceNotifyEnabled"));
  v10 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("SADeviceIsAppleAudioAccessory"));
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("SADeviceDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("SADeviceMacAddress"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE1(v15) = v10;
  LOBYTE(v15) = v9;
  v13 = -[SADevice initWithDeviceUUID:groupIdentifier:macAddress:partIdentifier:name:model:systemVersion:vendorId:productId:deviceType:notifyEnabled:isAppleAudioAccessory:date:](self, "initWithDeviceUUID:groupIdentifier:macAddress:partIdentifier:name:model:systemVersion:vendorId:productId:deviceType:notifyEnabled:isAppleAudioAccessory:date:", v19, v18, v12, v17, v16, v4, v5, v6, v7, v8, v15, v11);

  return v13;
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
  id v11;

  v4 = a3;
  -[SADevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SADeviceIdentifier"));

  -[SADevice groupIdentifier](self, "groupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SADeviceGroupIdentifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SADevice partIdentifier](self, "partIdentifier"), CFSTR("SADevicePartIdentifier"));
  -[SADevice name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("SADeviceName"));

  -[SADevice model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("SADeviceModel"));

  -[SADevice systemVersion](self, "systemVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("SADeviceSystemVersion"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SADevice vendorId](self, "vendorId"), CFSTR("SADeviceVendorId"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SADevice productId](self, "productId"), CFSTR("SADeviceProductId"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SADevice deviceType](self, "deviceType"), CFSTR("SADeviceType"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SADevice notifyEnabled](self, "notifyEnabled"), CFSTR("SADeviceNotifyEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SADevice isAppleAudioAccessory](self, "isAppleAudioAccessory"), CFSTR("SADeviceIsAppleAudioAccessory"));
  -[SADevice date](self, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("SADeviceDate"));

  -[SADevice macAddress](self, "macAddress");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("SADeviceMacAddress"));

}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = (void *)MEMORY[0x1CAA49754]();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));

  objc_autoreleasePoolPop(v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  unint64_t v10;
  BOOL v11;
  BOOL v12;
  void *v13;
  SADevice *v14;
  uint64_t v16;
  int64_t v17;
  void *v18;
  void *v19;
  SADevice *v20;

  v20 = +[SADevice allocWithZone:](SADevice, "allocWithZone:", a3);
  -[SADevice identifier](self, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SADevice groupIdentifier](self, "groupIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SADevice macAddress](self, "macAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SADevice partIdentifier](self, "partIdentifier");
  -[SADevice name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SADevice model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SADevice systemVersion](self, "systemVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SADevice vendorId](self, "vendorId");
  v9 = -[SADevice productId](self, "productId");
  v10 = -[SADevice deviceType](self, "deviceType");
  v11 = -[SADevice notifyEnabled](self, "notifyEnabled");
  v12 = -[SADevice isAppleAudioAccessory](self, "isAppleAudioAccessory");
  -[SADevice date](self, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v16) = v12;
  LOBYTE(v16) = v11;
  v14 = -[SADevice initWithDeviceUUID:groupIdentifier:macAddress:partIdentifier:name:model:systemVersion:vendorId:productId:deviceType:notifyEnabled:isAppleAudioAccessory:date:](v20, "initWithDeviceUUID:groupIdentifier:macAddress:partIdentifier:name:model:systemVersion:vendorId:productId:deviceType:notifyEnabled:isAppleAudioAccessory:date:", v19, v18, v4, v17, v5, v6, v7, v8, v9, v10, v16, v13);

  return v14;
}

- (SADevice)initWithDeviceUUID:(id)a3 name:(id)a4 model:(id)a5 systemVersion:(id)a6 vendorId:(int64_t)a7 productId:(int64_t)a8 deviceType:(unint64_t)a9 notifyEnabled:(BOOL)a10 isAppleAudioAccessory:(BOOL)a11 date:(id)a12
{
  uint64_t v13;

  LOWORD(v13) = __PAIR16__(a11, a10);
  return -[SADevice initWithDeviceUUID:groupIdentifier:macAddress:name:model:systemVersion:vendorId:productId:deviceType:notifyEnabled:isAppleAudioAccessory:date:](self, "initWithDeviceUUID:groupIdentifier:macAddress:name:model:systemVersion:vendorId:productId:deviceType:notifyEnabled:isAppleAudioAccessory:date:", a3, 0, 0, a4, a5, a6, a7, a8, a9, v13, a12);
}

- (SADevice)initWithDeviceUUID:(id)a3 groupIdentifier:(id)a4 macAddress:(id)a5 name:(id)a6 model:(id)a7 systemVersion:(id)a8 vendorId:(int64_t)a9 productId:(int64_t)a10 deviceType:(unint64_t)a11 notifyEnabled:(BOOL)a12 isAppleAudioAccessory:(BOOL)a13 date:(id)a14
{
  uint64_t v15;

  LOWORD(v15) = __PAIR16__(a13, a12);
  return -[SADevice initWithDeviceUUID:groupIdentifier:macAddress:partIdentifier:name:model:systemVersion:vendorId:productId:deviceType:notifyEnabled:isAppleAudioAccessory:date:](self, "initWithDeviceUUID:groupIdentifier:macAddress:partIdentifier:name:model:systemVersion:vendorId:productId:deviceType:notifyEnabled:isAppleAudioAccessory:date:", a3, a4, a5, -1, a6, a7, a8, a9, a10, a11, v15, a14);
}

- (SADevice)initWithDeviceUUID:(id)a3 groupIdentifier:(id)a4 macAddress:(id)a5 partIdentifier:(int64_t)a6 name:(id)a7 model:(id)a8 systemVersion:(id)a9 vendorId:(int64_t)a10 productId:(int64_t)a11 deviceType:(unint64_t)a12 notifyEnabled:(BOOL)a13 isAppleAudioAccessory:(BOOL)a14 date:(id)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  SADevice *v28;
  SADevice *v29;
  uint64_t v30;
  NSUUID *identifier;
  uint64_t v32;
  NSUUID *groupIdentifier;
  uint64_t v34;
  NSString *macAddress;
  uint64_t v36;
  NSString *name;
  uint64_t v38;
  NSString *model;
  uint64_t v40;
  NSString *systemVersion;
  uint64_t v42;
  NSDate *date;
  objc_super v45;

  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a7;
  v25 = a8;
  v26 = a9;
  v27 = a15;
  v45.receiver = self;
  v45.super_class = (Class)SADevice;
  v28 = -[SADevice init](&v45, sel_init);
  if (!v28)
    goto LABEL_7;
  v29 = 0;
  if (v21 && v25 && v26 && v27)
  {
    v30 = objc_msgSend(v21, "copy");
    identifier = v28->_identifier;
    v28->_identifier = (NSUUID *)v30;

    v32 = objc_msgSend(v22, "copy");
    groupIdentifier = v28->_groupIdentifier;
    v28->_groupIdentifier = (NSUUID *)v32;

    v34 = objc_msgSend(v23, "copy");
    macAddress = v28->_macAddress;
    v28->_macAddress = (NSString *)v34;

    v28->_partIdentifier = a6;
    v36 = objc_msgSend(v24, "copy");
    name = v28->_name;
    v28->_name = (NSString *)v36;

    v38 = objc_msgSend(v25, "copy");
    model = v28->_model;
    v28->_model = (NSString *)v38;

    v40 = objc_msgSend(v26, "copy");
    systemVersion = v28->_systemVersion;
    v28->_systemVersion = (NSString *)v40;

    v28->_vendorId = a10;
    v28->_productId = a11;
    v28->_deviceType = a12;
    v28->_notifyEnabled = a13;
    v28->_isAppleAudioAccessory = a14;
    v42 = objc_msgSend(v27, "copy");
    date = v28->_date;
    v28->_date = (NSDate *)v42;

LABEL_7:
    v29 = v28;
  }

  return v29;
}

- (BOOL)isReallyEqual:(id)a3
{
  void *v3;
  void *v4;
  SADevice *v6;
  SADevice *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int64_t v23;
  int64_t v24;
  unint64_t v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  v6 = (SADevice *)a3;
  if (self == v6)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[SADevice identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SADevice identifier](v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[SADevice identifier](self, "identifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SADevice identifier](v7, "identifier");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          LOBYTE(v10) = 0;
          goto LABEL_35;
        }
      }
      -[SADevice groupIdentifier](self, "groupIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SADevice groupIdentifier](v7, "groupIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[SADevice groupIdentifier](self, "groupIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SADevice groupIdentifier](v7, "groupIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          LOBYTE(v10) = 0;
          goto LABEL_33;
        }
        v41 = v13;
      }
      v14 = -[SADevice partIdentifier](self, "partIdentifier");
      if (v14 == -[SADevice partIdentifier](v7, "partIdentifier"))
      {
        -[SADevice name](self, "name");
        v15 = objc_claimAutoreleasedReturnValue();
        -[SADevice name](v7, "name");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v15;
        v18 = v15 == v16;
        v13 = v41;
        v37 = (void *)v16;
        v38 = v17;
        v39 = v4;
        v40 = v3;
        if (v18)
        {
          v35 = v8;
          v36 = v12;
        }
        else
        {
          v31 = v11;
          -[SADevice name](self, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SADevice name](v7, "name");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v19;
          if (!objc_msgSend(v19, "isEqual:"))
          {
            LOBYTE(v10) = 0;
            v28 = v37;
            v27 = v38;
            v11 = v31;
            goto LABEL_32;
          }
          v35 = v8;
          v36 = v12;
          v11 = v31;
        }
        -[SADevice model](self, "model");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SADevice model](v7, "model");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "isEqualToString:", v21))
        {
          v32 = v21;
          -[SADevice systemVersion](self, "systemVersion");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SADevice systemVersion](v7, "systemVersion");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "isEqualToString:"))
          {
            v23 = -[SADevice vendorId](self, "vendorId");
            if (v23 == -[SADevice vendorId](v7, "vendorId")
              && (v24 = -[SADevice productId](self, "productId"), v24 == -[SADevice productId](v7, "productId"))
              && (v25 = -[SADevice deviceType](self, "deviceType"), v25 == -[SADevice deviceType](v7, "deviceType")))
            {
              v26 = -[SADevice notifyEnabled](self, "notifyEnabled");
              v10 = v26 ^ -[SADevice notifyEnabled](v7, "notifyEnabled") ^ 1;
            }
            else
            {
              LOBYTE(v10) = 0;
            }
            v13 = v41;
          }
          else
          {
            LOBYTE(v10) = 0;
          }

        }
        else
        {

          LOBYTE(v10) = 0;
        }
        v28 = v37;
        v27 = v38;
        v8 = v35;
        v12 = v36;
        if (v38 == v37)
        {

          if (v11 != v36)
          {

          }
          v4 = v39;
          v3 = v40;
          if (v35 == v9)
            goto LABEL_36;
          goto LABEL_35;
        }
LABEL_32:

        v4 = v39;
        v3 = v40;
        if (v11 == v12)
          goto LABEL_34;
        goto LABEL_33;
      }
      LOBYTE(v10) = 0;
      v13 = v41;
      if (v11 == v12)
      {
LABEL_34:

        if (v8 == v9)
        {
LABEL_36:

          goto LABEL_37;
        }
LABEL_35:

        goto LABEL_36;
      }
LABEL_33:

      goto LABEL_34;
    }
    LOBYTE(v10) = 0;
  }
LABEL_37:

  return v10;
}

- (BOOL)isAirPodsCase
{
  _BOOL4 v3;

  v3 = -[SADevice isAppleAudioAccessory](self, "isAppleAudioAccessory");
  if (v3)
    LOBYTE(v3) = -[SADevice productId](self, "productId") == 8213 || -[SADevice productId](self, "productId") == 8216;
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SADevice *v4;
  SADevice *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (SADevice *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SADevice identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SADevice identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
      }
      else
      {
        -[SADevice identifier](self, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SADevice identifier](v5, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)descriptionDictionary
{
  objc_class *v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[13];
  _QWORD v33[15];

  v33[13] = *MEMORY[0x1E0C80C00];
  v32[0] = CFSTR("EventType");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v31;
  v32[1] = CFSTR("SADeviceIdentifier");
  -[SADevice identifier](self, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "description");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v29;
  v32[2] = CFSTR("SADeviceGroupIdentifier");
  -[SADevice groupIdentifier](self, "groupIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SADevice groupIdentifier](self, "groupIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "description");
    v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1E83D18B8;
  }
  v23 = (__CFString *)v5;
  v33[2] = v5;
  v32[3] = CFSTR("SADeviceMacAddress");
  -[SADevice macAddress](self, "macAddress");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v4;
  if (v27)
  {
    -[SADevice macAddress](self, "macAddress");
    v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E83D18B8;
  }
  v22 = (__CFString *)v6;
  v33[3] = v6;
  v32[4] = CFSTR("SADevicePartIdentifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SADevice partIdentifier](self, "partIdentifier"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v26;
  v32[5] = CFSTR("SADeviceName");
  -[SADevice name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SADevice name](self, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "description");
    v8 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E83D18B8;
  }
  v21 = (__CFString *)v8;
  v33[5] = v8;
  v32[6] = CFSTR("SADeviceModel");
  -[SADevice model](self, "model");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[6] = v9;
  v32[7] = CFSTR("SADeviceSystemVersion");
  -[SADevice systemVersion](self, "systemVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[7] = v11;
  v32[8] = CFSTR("SADeviceVendorId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SADevice vendorId](self, "vendorId"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[8] = v12;
  v32[9] = CFSTR("SADeviceProductId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SADevice productId](self, "productId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[9] = v13;
  v32[10] = CFSTR("SADeviceType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SADevice deviceType](self, "deviceType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[10] = v14;
  v32[11] = CFSTR("SADeviceNotifyEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SADevice notifyEnabled](self, "notifyEnabled"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[11] = v15;
  v32[12] = CFSTR("SADeviceDate");
  -[SADevice date](self, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "getDateString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33[12] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 13);
  v24 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {

  }
  if (v27)

  if (v28)
  {

  }
  return v24;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  -[SADevice descriptionDictionary](self, "descriptionDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONStringFromNSDictionary:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    v6 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      -[SAConnectionEvent description].cold.1(v6, (uint64_t)self, (uint64_t)v5);
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return (NSString *)v8;
}

- (id)getDate
{
  return self->_date;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
  objc_storeStrong((id *)&self->_macAddress, a3);
}

- (int64_t)partIdentifier
{
  return self->_partIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (int64_t)vendorId
{
  return self->_vendorId;
}

- (int64_t)productId
{
  return self->_productId;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (BOOL)notifyEnabled
{
  return self->_notifyEnabled;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)isAppleAudioAccessory
{
  return self->_isAppleAudioAccessory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
