@implementation TAUnknownBeacon

- (TAUnknownBeacon)initWithBeaconUUID:(id)a3 address:(id)a4 deviceType:(unint64_t)a5 withAccessoryInfo:(id)a6
{
  return -[TAUnknownBeacon initWithBeaconUUID:address:deviceType:withAccessoryInfo:isPoshAccessory:isFindMyNetwork:](self, "initWithBeaconUUID:address:deviceType:withAccessoryInfo:isPoshAccessory:isFindMyNetwork:", a3, a4, a5, a6, 0, 1);
}

- (TAUnknownBeacon)initWithBeaconUUID:(id)a3 address:(id)a4 deviceType:(unint64_t)a5 withAccessoryInfo:(id)a6 isPoshAccessory:(BOOL)a7 isFindMyNetwork:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  TAUnknownBeacon *v17;
  TAUnknownBeacon *v18;
  uint64_t v19;
  NSUUID *identifier;
  uint64_t v21;
  NSData *address;
  uint64_t v23;
  TAAccessoryInformation *accessoryInfo;
  objc_super v26;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v26.receiver = self;
  v26.super_class = (Class)TAUnknownBeacon;
  v17 = -[TAUnknownBeacon init](&v26, sel_init);
  if (!v17)
    goto LABEL_5;
  v18 = 0;
  if (v14 && v15)
  {
    v19 = objc_msgSend(v14, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (NSUUID *)v19;

    v21 = objc_msgSend(v15, "copy");
    address = v17->_address;
    v17->_address = (NSData *)v21;

    v17->_deviceType = a5;
    v23 = objc_msgSend(v16, "copy");
    accessoryInfo = v17->_accessoryInfo;
    v17->_accessoryInfo = (TAAccessoryInformation *)v23;

    v17->_isPoshAccessory = a7;
    v17->_isFindMyNetwork = a8;
LABEL_5:
    v18 = v17;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  TAUnknownBeacon *v6;
  TAUnknownBeacon *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v6 = (TAUnknownBeacon *)a3;
  if (self == v6)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[TAUnknownBeacon identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAUnknownBeacon identifier](v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[TAUnknownBeacon identifier](self, "identifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAUnknownBeacon identifier](v7, "identifier");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_21;
        }
      }
      -[TAUnknownBeacon address](self, "address");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAUnknownBeacon address](v7, "address");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[TAUnknownBeacon address](self, "address");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAUnknownBeacon address](v7, "address");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_19;
        }
        v24 = v13;
      }
      v14 = -[TAUnknownBeacon deviceType](self, "deviceType");
      if (v14 == -[TAUnknownBeacon deviceType](v7, "deviceType"))
      {
        v23 = v4;
        -[TAUnknownBeacon accessoryInfo](self, "accessoryInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAUnknownBeacon accessoryInfo](v7, "accessoryInfo");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v15 == (void *)v16)
        {

          v10 = 1;
        }
        else
        {
          v17 = (void *)v16;
          -[TAUnknownBeacon accessoryInfo](self, "accessoryInfo");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[TAUnknownBeacon accessoryInfo](v7, "accessoryInfo");
          v22 = v3;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v21, "isEqual:", v18);

          v3 = v22;
        }
        v19 = v11 == v12;
        v4 = v23;
      }
      else
      {
        v10 = 0;
        v19 = v11 == v12;
      }
      v13 = v24;
      if (v19)
      {
LABEL_20:

        if (v8 == v9)
        {
LABEL_22:

          goto LABEL_23;
        }
LABEL_21:

        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    v10 = 0;
  }
LABEL_23:

  return v10;
}

- (id)descriptionDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v2 = self;
  v13[4] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("TAUnknownBeaconIdentifier");
  -[TAUnknownBeacon identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("TAUnknownBeaconAddress");
  objc_msgSend(v2, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("TAUnknownBeaconType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v2, "deviceType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  v12[3] = CFSTR("TAUnknownBeaconAccessoryInfo");
  objc_msgSend(v2, "accessoryInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v2, "accessoryInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "descriptionDictionary");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_24D815B48;
  }
  v13[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  -[TAUnknownBeacon descriptionDictionary](self, "descriptionDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONStringFromNSDictionary:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TAOutgoingRequests description].cold.1(v6, (uint64_t)self, (uint64_t)v5);
    objc_msgSend(MEMORY[0x24BDD17C8], "string");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5;
  TAUnknownBeacon *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = +[TAUnknownBeacon instancesRespondToSelector:](TAUnknownBeacon, "instancesRespondToSelector:", NSSelectorFromString(CFSTR("initWithBeaconUUID:address:deviceType:withAccessoryInfo:isPoshAccessory:isFindMyNetwork:")));
  v6 = +[TAUnknownBeacon allocWithZone:](TAUnknownBeacon, "allocWithZone:", a3);
  -[TAUnknownBeacon identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TAUnknownBeacon address](self, "address");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TAUnknownBeacon deviceType](self, "deviceType");
  -[TAUnknownBeacon accessoryInfo](self, "accessoryInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v11 = -[TAUnknownBeacon initWithBeaconUUID:address:deviceType:withAccessoryInfo:isPoshAccessory:isFindMyNetwork:](v6, "initWithBeaconUUID:address:deviceType:withAccessoryInfo:isPoshAccessory:isFindMyNetwork:", v7, v8, v9, v10, -[TAUnknownBeacon isPoshAccessory](self, "isPoshAccessory"), -[TAUnknownBeacon isFindMyNetwork](self, "isFindMyNetwork"));
  else
    v11 = -[TAUnknownBeacon initWithBeaconUUID:address:deviceType:withAccessoryInfo:](v6, "initWithBeaconUUID:address:deviceType:withAccessoryInfo:", v7, v8, v9, v10);
  v12 = (void *)v11;

  return v12;
}

- (TAUnknownBeacon)initWithCoder:(id)a3
{
  id v4;
  TAUnknownBeacon *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSData *address;
  uint64_t v10;
  TAAccessoryInformation *accessoryInfo;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TAUnknownBeacon;
  v5 = -[TAUnknownBeacon init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("TAUnknownBeaconIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("TAUnknownBeaconAddress"));
    v8 = objc_claimAutoreleasedReturnValue();
    address = v5->_address;
    v5->_address = (NSData *)v8;

    v5->_deviceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("TAUnknownBeaconType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TAUnknownBeaconAccessoryInfo"));
    v10 = objc_claimAutoreleasedReturnValue();
    accessoryInfo = v5->_accessoryInfo;
    v5->_accessoryInfo = (TAAccessoryInformation *)v10;

    v5->_isPoshAccessory = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("TAUnknownBeaconIsPosh"));
    v5->_isFindMyNetwork = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("TAUnknownBeaconIsFindMyNetwork"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("TAUnknownBeaconIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_address, CFSTR("TAUnknownBeaconAddress"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_deviceType, CFSTR("TAUnknownBeaconType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessoryInfo, CFSTR("TAUnknownBeaconAccessoryInfo"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPoshAccessory, CFSTR("TAUnknownBeaconIsPosh"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isFindMyNetwork, CFSTR("TAUnknownBeaconIsFindMyNetwork"));

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSData)address
{
  return self->_address;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (BOOL)isPoshAccessory
{
  return self->_isPoshAccessory;
}

- (BOOL)isFindMyNetwork
{
  return self->_isFindMyNetwork;
}

- (TAAccessoryInformation)accessoryInfo
{
  return self->_accessoryInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryInfo, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
