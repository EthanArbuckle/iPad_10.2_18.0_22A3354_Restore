@implementation TASPAdvertisement

- (BOOL)isPosh
{
  return self->_detailsBitmask & 1;
}

- (BOOL)isNearOwner
{
  return (LOBYTE(self->_detailsBitmask) >> 2) & 1;
}

- (BOOL)isApple
{
  return (LOBYTE(self->_detailsBitmask) >> 1) & 1;
}

- (TASPAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8 detailsBitmask:(unsigned int)a9 uuid:(id)a10 protocolID:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  TASPAdvertisement *v23;
  TASPAdvertisement *v24;
  uint64_t v25;
  NSData *address;
  uint64_t v27;
  NSData *advertisementData;
  uint64_t v29;
  NSData *reserved;
  uint64_t v31;
  NSDate *scanDate;
  uint64_t v33;
  NSUUID *uuid;
  uint64_t v35;
  NSNumber *protocolID;
  char v38;
  objc_super v39;

  v17 = a3;
  v18 = a4;
  v19 = a6;
  v20 = a8;
  v21 = a10;
  v22 = a11;
  v39.receiver = self;
  v39.super_class = (Class)TASPAdvertisement;
  v23 = -[TASPAdvertisement init](&v39, sel_init);
  if (!v23)
  {
LABEL_15:
    v24 = v23;
    goto LABEL_16;
  }
  v24 = 0;
  if (v17 && v18 && v19 && v20)
  {
    v25 = objc_msgSend(v17, "copy");
    address = v23->_address;
    v23->_address = (NSData *)v25;

    v27 = objc_msgSend(v18, "copy");
    advertisementData = v23->_advertisementData;
    v23->_advertisementData = (NSData *)v27;

    v23->_status = a5;
    v29 = objc_msgSend(v19, "copy");
    reserved = v23->_reserved;
    v23->_reserved = (NSData *)v29;

    v23->_rssi = a7;
    v31 = objc_msgSend(v20, "copy");
    scanDate = v23->_scanDate;
    v23->_scanDate = (NSDate *)v31;

    if (v21)
    {
      v33 = objc_msgSend(v21, "copy");
      uuid = v23->_uuid;
      v23->_uuid = (NSUUID *)v33;
    }
    else
    {
      uuid = v23->_uuid;
      v23->_uuid = 0;
    }

    if (v22)
    {
      v35 = objc_msgSend(v22, "copy");
      protocolID = v23->_protocolID;
      v23->_protocolID = (NSNumber *)v35;
    }
    else
    {
      protocolID = v23->_protocolID;
      v23->_protocolID = 0;
    }

    v23->_detailsBitmask = a9;
    if (-[NSData length](v23->_reserved, "length") && -[TASPAdvertisement isApple](v23, "isApple"))
    {
      v38 = 0;
      -[NSData getBytes:length:](v23->_reserved, "getBytes:length:", &v38, 1);
      v23->_beepOnMoveHigh = (v38 & 4) != 0;
    }
    goto LABEL_15;
  }
LABEL_16:

  return v24;
}

- (unint64_t)getType
{
  if (-[TASPAdvertisement isNearOwner](self, "isNearOwner"))
    return 1;
  else
    return 2;
}

- (unint64_t)getDeviceType
{
  int v2;

  v2 = self->_status & 0x30;
  switch(v2)
  {
    case 16:
      return 1;
    case 48:
      return 3;
    case 32:
      return 2;
  }
  if (-[TASPAdvertisement isPosh](self, "isPosh") && !-[TASPAdvertisement isApple](self, "isApple"))
    return 4;
  return 0;
}

- (id)getDate
{
  return self->_scanDate;
}

- (NSData)address
{
  return self->_address;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_scanDate, 0);
  objc_storeStrong((id *)&self->_reserved, 0);
  objc_storeStrong((id *)&self->_advertisementData, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

- (TASPAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8
{
  return -[TASPAdvertisement initWithAddress:advertisementData:status:reserved:rssi:scanDate:uuid:](self, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:uuid:", a3, a4, a5, a6, a7, a8, 0);
}

- (TASPAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8 uuid:(id)a9
{
  uint64_t v12;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  int v21;
  TASPAdvertisement *v22;
  uint64_t v24;

  v12 = a5;
  v16 = a9;
  v17 = a8;
  v18 = a6;
  v19 = a4;
  v20 = a3;
  if (objc_msgSend(v19, "length"))
    v21 = 2;
  else
    v21 = 6;
  LODWORD(v24) = v21;
  v22 = -[TASPAdvertisement initWithAddress:advertisementData:status:reserved:rssi:scanDate:detailsBitmask:uuid:protocolID:](self, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:detailsBitmask:uuid:protocolID:", v20, v19, v12, v18, a7, v17, v24, v16, 0);

  return v22;
}

+ (id)TASPAdvertisementTypeToString:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("Invalid");
  else
    return off_24D8152A8[a3];
}

+ (id)TASPAdvertisementDeviceTypeToString:(unint64_t)a3
{
  if (a3 > 4)
    return CFSTR("Invalid");
  else
    return off_24D8152C0[a3];
}

- (id)getLatestAdvTypeToString:(id)a3
{
  id v4;
  const __CFString *v5;
  _BOOL4 v6;
  __CFString *v7;

  v4 = a3;
  if (-[TASPAdvertisement isPosh](self, "isPosh") && -[TASPAdvertisement isApple](self, "isApple"))
  {
    if (!v4)
    {
      v7 = CFSTR("AP");
      return v7;
    }
    v5 = CFSTR(":AP");
    goto LABEL_17;
  }
  if (-[TASPAdvertisement isPosh](self, "isPosh") && !-[TASPAdvertisement isApple](self, "isApple"))
  {
    if (!v4)
    {
      v7 = CFSTR("P");
      return v7;
    }
    v5 = CFSTR(":P");
    goto LABEL_17;
  }
  v6 = -[TASPAdvertisement isApple](self, "isApple");
  if (v6)
    v7 = CFSTR("A");
  else
    v7 = CFSTR("NA");
  if (v6)
    v5 = CFSTR(":A");
  else
    v5 = CFSTR(":NA");
  if (v4)
  {
LABEL_17:
    objc_msgSend(v4, "stringByAppendingString:", v5);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (int64_t)getBatteryState
{
  unsigned int status;
  int64_t v3;

  status = self->_status;
  v3 = 2;
  if ((status & 0xC0) != 0x80)
    v3 = (status & 0xC0) == 64;
  if (status <= 0xBF)
    return v3;
  else
    return 3;
}

+ (id)TASPAdvertisementBatteryStateToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Invalid");
  else
    return off_24D8152E8[a3];
}

- (BOOL)isEqual:(id)a3
{
  TASPAdvertisement *v4;
  TASPAdvertisement *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  BOOL v19;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;

  v4 = (TASPAdvertisement *)a3;
  if (v4 == self)
  {
    v19 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[TASPAdvertisement scanDate](self, "scanDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TASPAdvertisement scanDate](v5, "scanDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToDate:", v7))
      {
        -[TASPAdvertisement advertisementData](self, "advertisementData");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[TASPAdvertisement advertisementData](v5, "advertisementData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToData:", v9)
          && (v10 = -[TASPAdvertisement status](self, "status"), v10 == -[TASPAdvertisement status](v5, "status")))
        {
          -[TASPAdvertisement reserved](self, "reserved");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[TASPAdvertisement reserved](v5, "reserved");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqualToData:", v12)
            && (v13 = -[TASPAdvertisement rssi](self, "rssi"), v13 == -[TASPAdvertisement rssi](v5, "rssi")))
          {
            -[TASPAdvertisement address](self, "address");
            v14 = objc_claimAutoreleasedReturnValue();
            -[TASPAdvertisement address](v5, "address");
            v15 = objc_claimAutoreleasedReturnValue();
            v24 = (void *)v14;
            v16 = (void *)v14;
            v17 = (void *)v15;
            if (objc_msgSend(v16, "isEqualToData:", v15)
              && (v22 = -[TASPAdvertisement detailsBitmask](self, "detailsBitmask"),
                  v22 == -[TASPAdvertisement detailsBitmask](v5, "detailsBitmask")))
            {
              -[TASPAdvertisement protocolID](self, "protocolID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v23, "intValue");
              -[TASPAdvertisement protocolID](v5, "protocolID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v18 == objc_msgSend(v21, "intValue");

            }
            else
            {
              v19 = 0;
            }

          }
          else
          {
            v19 = 0;
          }

        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v3 = -[TASPAdvertisement rssi](self, "rssi");
  if (v3 >= 0)
    v4 = v3;
  else
    v4 = -v3;
  v18 = v4;
  -[TASPAdvertisement scanDate](self, "scanDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v5, "hash");
  -[TASPAdvertisement advertisementData](self, "advertisementData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v8 = -[TASPAdvertisement status](self, "status");
  -[TASPAdvertisement reserved](self, "reserved");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  -[TASPAdvertisement address](self, "address");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v13 = -[TASPAdvertisement detailsBitmask](self, "detailsBitmask");
  -[TASPAdvertisement protocolID](self, "protocolID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v17 ^ v7 ^ v18 ^ v8 ^ v10 ^ v12 ^ v13 ^ (int)objc_msgSend(v14, "intValue");

  return v15;
}

- (id)descriptionDictionary
{
  objc_class *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[14];
  _QWORD v32[16];

  v32[14] = *MEMORY[0x24BDAC8D0];
  v31[0] = CFSTR("EventType");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v30;
  v31[1] = CFSTR("Address");
  -[TASPAdvertisement address](self, "address");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "hexString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v28;
  v31[2] = CFSTR("Data");
  -[TASPAdvertisement advertisementData](self, "advertisementData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "hexString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v26;
  v31[3] = CFSTR("Status");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[TASPAdvertisement status](self, "status"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v25;
  v31[4] = CFSTR("Reserved");
  -[TASPAdvertisement reserved](self, "reserved");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hexString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v23;
  v31[5] = CFSTR("RSSI");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[TASPAdvertisement rssi](self, "rssi"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v22;
  v31[6] = CFSTR("Date");
  -[TASPAdvertisement scanDate](self, "scanDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "getDateString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v20;
  v31[7] = CFSTR("Type");
  +[TASPAdvertisement TASPAdvertisementTypeToString:](TASPAdvertisement, "TASPAdvertisementTypeToString:", -[TASPAdvertisement getType](self, "getType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[7] = v19;
  v31[8] = CFSTR("DeviceType");
  +[TASPAdvertisement TASPAdvertisementDeviceTypeToString:](TASPAdvertisement, "TASPAdvertisementDeviceTypeToString:", -[TASPAdvertisement getDeviceType](self, "getDeviceType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[8] = v18;
  v31[9] = CFSTR("UUID");
  -[TASPAdvertisement uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TASPAdvertisement uuid](self, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_24D815B48;
  }
  v32[9] = v5;
  v31[10] = CFSTR("BatteryState");
  +[TASPAdvertisement TASPAdvertisementBatteryStateToString:](TASPAdvertisement, "TASPAdvertisementBatteryStateToString:", -[TASPAdvertisement getBatteryState](self, "getBatteryState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[10] = v6;
  v31[11] = CFSTR("DetailsBitmask");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[TASPAdvertisement detailsBitmask](self, "detailsBitmask"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32[11] = v7;
  v31[12] = CFSTR("DetailsBitmaskString");
  v8 = (void *)MEMORY[0x24BDD17C8];
  if (-[TASPAdvertisement isPosh](self, "isPosh"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[TASPAdvertisement isApple](self, "isApple"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (-[TASPAdvertisement isNearOwner](self, "isNearOwner"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v8, "stringWithFormat:", CFSTR("isPosh, %@, isApple, %@, isNearOwner, %@"), v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[12] = v12;
  v31[13] = CFSTR("ProtocolIDString");
  -[TASPAdvertisement protocolID](self, "protocolID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[TASPAdvertisement protocolID](self, "protocolID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = CFSTR("0");
  }
  v32[13] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

  }
  if (v4)
  {

  }
  return v15;
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

  -[TASPAdvertisement descriptionDictionary](self, "descriptionDictionary");
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

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  -[TASPAdvertisement address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Address"));

  -[TASPAdvertisement advertisementData](self, "advertisementData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Data"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[TASPAdvertisement status](self, "status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("Status"));

  -[TASPAdvertisement reserved](self, "reserved");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("Reserved"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[TASPAdvertisement rssi](self, "rssi"), CFSTR("RSSI"));
  -[TASPAdvertisement scanDate](self, "scanDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("Date"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[TASPAdvertisement detailsBitmask](self, "detailsBitmask"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("DetailsBitmask"));

  -[TASPAdvertisement uuid](self, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("UUID"));

  -[TASPAdvertisement protocolID](self, "protocolID");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt:forKey:", objc_msgSend(v12, "intValue"), CFSTR("ProtocolIDString"));

}

- (TASPAdvertisement)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  TASPAdvertisement *v14;
  uint64_t v16;
  unsigned int v17;
  void *v18;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Address"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Data"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v4, "unsignedCharValue");
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Reserved"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("RSSI"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DetailsBitmask"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedCharValue");
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD16E0];
  v12 = objc_msgSend(v3, "decodeIntForKey:", CFSTR("ProtocolIDString"));

  objc_msgSend(v11, "numberWithInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = v9;
  v14 = -[TASPAdvertisement initWithAddress:advertisementData:status:reserved:rssi:scanDate:detailsBitmask:uuid:protocolID:](self, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:detailsBitmask:uuid:protocolID:", v19, v18, v17, v5, v6, v7, v16, v10, v13);

  return v14;
}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = (void *)MEMORY[0x219A13570]();
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));

  objc_autoreleasePoolPop(v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  TASPAdvertisement *v4;
  uint64_t v6;

  v4 = [TASPAdvertisement alloc];
  LODWORD(v6) = self->_detailsBitmask;
  return -[TASPAdvertisement initWithAddress:advertisementData:status:reserved:rssi:scanDate:detailsBitmask:uuid:protocolID:](v4, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:detailsBitmask:uuid:protocolID:", self->_address, self->_advertisementData, self->_status, self->_reserved, self->_rssi, self->_scanDate, v6, self->_uuid, self->_protocolID);
}

- (NSData)advertisementData
{
  return self->_advertisementData;
}

- (unsigned)status
{
  return self->_status;
}

- (NSData)reserved
{
  return self->_reserved;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (NSDate)scanDate
{
  return self->_scanDate;
}

- (unsigned)detailsBitmask
{
  return self->_detailsBitmask;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)beepOnMoveHigh
{
  return self->_beepOnMoveHigh;
}

- (NSNumber)protocolID
{
  return self->_protocolID;
}

- (BOOL)hasHawkeyeAdvertisementPolicy
{
  unint64_t v3;

  v3 = -[TASPAdvertisement getDeviceType](self, "getDeviceType");
  if (v3 != 1)
    LOBYTE(v3) = -[TASPAdvertisement getDeviceType](self, "getDeviceType") == 2
              || -[TASPAdvertisement getDeviceType](self, "getDeviceType") == 4;
  return v3;
}

- (BOOL)hasHawkeyeLowEnergyAdvertisementPolicy
{
  return -[TASPAdvertisement getDeviceType](self, "getDeviceType") == 3;
}

@end
