@implementation TAAccessoryInformation

- (TAAccessoryInformation)initWithDeviceUUID:(id)a3 deviceType:(unint64_t)a4 productData:(id)a5 manufacturerName:(id)a6 modelName:(id)a7 firmwareVersion:(id)a8 accessoryCategory:(id)a9 accessoryCapabilities:(id)a10
{
  return -[TAAccessoryInformation initWithDeviceUUID:deviceType:productData:manufacturerName:modelName:firmwareVersion:accessoryCategory:accessoryCapabilities:serialNumber:protocolImplementation:networkID:batteryType:batteryLevel:](self, "initWithDeviceUUID:deviceType:productData:manufacturerName:modelName:firmwareVersion:accessoryCategory:accessoryCapabilities:serialNumber:protocolImplementation:networkID:batteryType:batteryLevel:", a3, a4, a5, a6, a7, a8, a9, a10, 0, 0, 0, 0, 0);
}

- (TAAccessoryInformation)initWithDeviceUUID:(id)a3 deviceType:(unint64_t)a4 productData:(id)a5 manufacturerName:(id)a6 modelName:(id)a7 firmwareVersion:(id)a8 accessoryCategory:(id)a9 accessoryCapabilities:(id)a10 serialNumber:(id)a11 protocolImplementation:(int64_t)a12 networkID:(int64_t)a13 batteryType:(int64_t)a14 batteryLevel:(int64_t)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  TAAccessoryInformation *v29;
  uint64_t v30;
  NSUUID *identifier;
  uint64_t v32;
  NSData *productData;
  uint64_t v34;
  NSString *manufacturerName;
  uint64_t v36;
  NSString *modelName;
  uint64_t v38;
  NSData *firmwareVersion;
  uint64_t v40;
  NSData *accessoryCategory;
  uint64_t v42;
  NSData *accessoryCapabilities;
  uint64_t v44;
  NSData *serialNumber;
  objc_super v47;

  v21 = a3;
  v22 = a5;
  v23 = a6;
  v24 = a7;
  v25 = a8;
  v26 = a9;
  v27 = a10;
  v28 = a11;
  v47.receiver = self;
  v47.super_class = (Class)TAAccessoryInformation;
  v29 = -[TAAccessoryInformation init](&v47, sel_init);
  if (v29)
  {
    v30 = objc_msgSend(v21, "copy");
    identifier = v29->_identifier;
    v29->_identifier = (NSUUID *)v30;

    v29->_deviceType = a4;
    v32 = objc_msgSend(v22, "copy");
    productData = v29->_productData;
    v29->_productData = (NSData *)v32;

    v34 = objc_msgSend(v23, "copy");
    manufacturerName = v29->_manufacturerName;
    v29->_manufacturerName = (NSString *)v34;

    v36 = objc_msgSend(v24, "copy");
    modelName = v29->_modelName;
    v29->_modelName = (NSString *)v36;

    v38 = objc_msgSend(v25, "copy");
    firmwareVersion = v29->_firmwareVersion;
    v29->_firmwareVersion = (NSData *)v38;

    v40 = objc_msgSend(v26, "copy");
    accessoryCategory = v29->_accessoryCategory;
    v29->_accessoryCategory = (NSData *)v40;

    v42 = objc_msgSend(v27, "copy");
    accessoryCapabilities = v29->_accessoryCapabilities;
    v29->_accessoryCapabilities = (NSData *)v42;

    v44 = objc_msgSend(v28, "copy");
    serialNumber = v29->_serialNumber;
    v29->_serialNumber = (NSData *)v44;

    v29->_protocolImplementation = a12;
    v29->_networkID = a13;
    v29->_batteryType = a14;
    v29->_batteryLevel = a15;
  }

  return v29;
}

- (BOOL)isCapableOfPrecisionFinding
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  unsigned int v7;
  _BOOL4 v8;

  -[TAAccessoryInformation accessoryCapabilities](self, "accessoryCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && (-[TAAccessoryInformation accessoryCapabilities](self, "accessoryCapabilities"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "length"),
        v4,
        v5 == 4)
    && -[TAAccessoryInformation deviceType](self, "deviceType") == 1)
  {
    -[TAAccessoryInformation accessoryCapabilities](self, "accessoryCapabilities");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = *(_DWORD *)objc_msgSend(v6, "bytes");

    return (v7 >> 7) & 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (unsigned)vendorId
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  unsigned int v8;

  -[TAAccessoryInformation productData](self, "productData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4 != 8)
    return 0;
  -[TAAccessoryInformation productData](self, "productData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subdataWithRange:", 0, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v6);
  v8 = *(_DWORD *)objc_msgSend(v7, "bytes");

  return v8;
}

- (unsigned)productId
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  unsigned int v8;

  -[TAAccessoryInformation productData](self, "productData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4 != 8)
    return 0;
  -[TAAccessoryInformation productData](self, "productData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subdataWithRange:", 4, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v6);
  v8 = *(_DWORD *)objc_msgSend(v7, "bytes");

  return v8;
}

- (BOOL)isHawkeyeAudioAccessory
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!-[TAAccessoryInformation productId](self, "productId") || !-[TAAccessoryInformation vendorId](self, "vendorId"))
    return 0;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", &unk_24D825090);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D8250A8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[TAAccessoryInformation productId](self, "productId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsObject:", v5))
    v6 = -[TAAccessoryInformation vendorId](self, "vendorId") == 76;
  else
    v6 = 0;

  return v6;
}

- (id)accessoryTypeNameWithAdvTypeString:(id)a3
{
  id v4;
  unint64_t v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  _QWORD v26[3];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[TAAccessoryInformation deviceType](self, "deviceType") - 1;
  if (v5 > 3)
  {
    v6 = CFSTR("Unknown");
    v7 = CFSTR("Unknown");
    v8 = CFSTR("Unknown");
  }
  else
  {
    v6 = off_24D815058[v5];
    v7 = off_24D815078[v5];
    v8 = off_24D815098[v5];
  }
  if (v4)
  {
    v27[0] = v8;
    v27[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(":"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  -[TAAccessoryInformation manufacturerName](self, "manufacturerName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    -[TAAccessoryInformation manufacturerName](self, "manufacturerName");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[TAAccessoryInformation modelName](self, "modelName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    -[TAAccessoryInformation modelName](self, "modelName");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[TAAccessoryInformation productData](self, "productData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15 == 8)
  {
    v16 = -[TAAccessoryInformation vendorId](self, "vendorId");
    v17 = -[TAAccessoryInformation productId](self, "productId");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%X:%X"), v16, v17);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = CFSTR("Unknown");
  }
  if (-[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("Unknown")))
  {
    v26[0] = v8;
    v26[1] = v6;
    v26[2] = v7;
    v19 = (void *)MEMORY[0x24BDBCE30];
    v20 = v26;
    v21 = 3;
  }
  else
  {
    v25[0] = v8;
    v25[1] = v6;
    v25[2] = v7;
    v25[3] = v18;
    v19 = (void *)MEMORY[0x24BDBCE30];
    v20 = v25;
    v21 = 4;
  }
  objc_msgSend(v19, "arrayWithObjects:count:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "componentsJoinedByString:", CFSTR(":"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  TAAccessoryInformation *v6;
  TAAccessoryInformation *v7;
  void *v8;
  void *v9;
  BOOL v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int64_t v35;
  int64_t v36;
  int64_t v37;
  int64_t v38;
  BOOL v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;

  v6 = (TAAccessoryInformation *)a3;
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
      -[TAAccessoryInformation identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAAccessoryInformation identifier](v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[TAAccessoryInformation identifier](self, "identifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAAccessoryInformation identifier](v7, "identifier");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_56;
        }
      }
      v11 = -[TAAccessoryInformation deviceType](self, "deviceType");
      if (v11 != -[TAAccessoryInformation deviceType](v7, "deviceType"))
      {
        v10 = 0;
        goto LABEL_55;
      }
      -[TAAccessoryInformation productData](self, "productData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAAccessoryInformation productData](v7, "productData");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 != v68)
      {
        -[TAAccessoryInformation productData](self, "productData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAAccessoryInformation productData](v7, "productData");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_53;
        }
        v67 = v13;
      }
      -[TAAccessoryInformation manufacturerName](self, "manufacturerName");
      v14 = objc_claimAutoreleasedReturnValue();
      -[TAAccessoryInformation manufacturerName](v7, "manufacturerName");
      v65 = objc_claimAutoreleasedReturnValue();
      v66 = (void *)v14;
      v64 = v12;
      if (v14 != v65)
      {
        -[TAAccessoryInformation manufacturerName](self, "manufacturerName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAAccessoryInformation manufacturerName](v7, "manufacturerName");
        v61 = v15;
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v15, "isEqual:"))
        {
          v10 = 0;
          v16 = (void *)v65;
          v17 = v66;
LABEL_51:

LABEL_52:
          v12 = v64;
          v13 = v67;
          if (v64 == v68)
          {
LABEL_54:

LABEL_55:
            if (v8 == v9)
            {
LABEL_57:

              goto LABEL_58;
            }
LABEL_56:

            goto LABEL_57;
          }
LABEL_53:

          goto LABEL_54;
        }
      }
      -[TAAccessoryInformation modelName](self, "modelName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAAccessoryInformation modelName](v7, "modelName");
      v62 = objc_claimAutoreleasedReturnValue();
      if (v18 == (void *)v62)
      {
        v59 = v18;
      }
      else
      {
        -[TAAccessoryInformation modelName](self, "modelName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAAccessoryInformation modelName](v7, "modelName");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v19;
        if (!objc_msgSend(v19, "isEqual:"))
        {
          v10 = 0;
          v22 = (void *)v62;
LABEL_49:

LABEL_50:
          v16 = (void *)v65;
          v17 = v66;
          if (v66 == (void *)v65)
            goto LABEL_52;
          goto LABEL_51;
        }
        v59 = v18;
      }
      -[TAAccessoryInformation firmwareVersion](self, "firmwareVersion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAAccessoryInformation firmwareVersion](v7, "firmwareVersion");
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = v20;
      if (v20 != (void *)v57)
      {
        -[TAAccessoryInformation firmwareVersion](self, "firmwareVersion");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAAccessoryInformation firmwareVersion](v7, "firmwareVersion");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v21;
        if (!objc_msgSend(v21, "isEqual:"))
        {
          v10 = 0;
          v22 = (void *)v62;
          v23 = (void *)v57;
LABEL_47:

LABEL_48:
          v18 = v59;
          if (v59 == v22)
            goto LABEL_50;
          goto LABEL_49;
        }
      }
      -[TAAccessoryInformation accessoryCategory](self, "accessoryCategory");
      v24 = objc_claimAutoreleasedReturnValue();
      -[TAAccessoryInformation accessoryCategory](v7, "accessoryCategory");
      v51 = (void *)v24;
      v52 = objc_claimAutoreleasedReturnValue();
      if (v24 != v52)
      {
        -[TAAccessoryInformation accessoryCategory](self, "accessoryCategory");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAAccessoryInformation accessoryCategory](v7, "accessoryCategory");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v25;
        if (!objc_msgSend(v25, "isEqual:"))
        {
          v10 = 0;
          v22 = (void *)v62;
          v26 = (void *)v24;
          v27 = (void *)v52;
LABEL_45:

LABEL_46:
          v23 = (void *)v57;
          v20 = v58;
          if (v58 == (void *)v57)
            goto LABEL_48;
          goto LABEL_47;
        }
      }
      -[TAAccessoryInformation accessoryCapabilities](self, "accessoryCapabilities");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAAccessoryInformation accessoryCapabilities](v7, "accessoryCapabilities");
      v48 = objc_claimAutoreleasedReturnValue();
      if (v28 != (void *)v48)
      {
        -[TAAccessoryInformation accessoryCapabilities](self, "accessoryCapabilities");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAAccessoryInformation accessoryCapabilities](v7, "accessoryCapabilities");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v29;
        if (!objc_msgSend(v29, "isEqual:"))
        {
          v10 = 0;
          v22 = (void *)v62;
          v30 = (void *)v48;
LABEL_43:

LABEL_44:
          v26 = v51;
          v27 = (void *)v52;
          if (v51 == (void *)v52)
            goto LABEL_46;
          goto LABEL_45;
        }
      }
      -[TAAccessoryInformation serialNumber](self, "serialNumber");
      v31 = objc_claimAutoreleasedReturnValue();
      -[TAAccessoryInformation serialNumber](v7, "serialNumber");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)v31;
      v45 = v28;
      if ((void *)v31 == v46
        || (-[TAAccessoryInformation serialNumber](self, "serialNumber"),
            v32 = (void *)objc_claimAutoreleasedReturnValue(),
            -[TAAccessoryInformation serialNumber](v7, "serialNumber"),
            v41 = (void *)objc_claimAutoreleasedReturnValue(),
            v42 = v32,
            objc_msgSend(v32, "isEqual:")))
      {
        v35 = -[TAAccessoryInformation protocolImplementation](self, "protocolImplementation");
        if (v35 == -[TAAccessoryInformation protocolImplementation](v7, "protocolImplementation")
          && (v36 = -[TAAccessoryInformation networkID](self, "networkID"),
              v36 == -[TAAccessoryInformation networkID](v7, "networkID"))
          && (v37 = -[TAAccessoryInformation batteryType](self, "batteryType"),
              v37 == -[TAAccessoryInformation batteryType](v7, "batteryType")))
        {
          v38 = -[TAAccessoryInformation batteryLevel](self, "batteryLevel");
          v10 = v38 == -[TAAccessoryInformation batteryLevel](v7, "batteryLevel");
          v39 = v10;
        }
        else
        {
          v10 = 0;
          v39 = 0;
        }
        v34 = v46;
        v33 = v47;
        if (v47 == v46)
        {

          v10 = v39;
LABEL_42:
          v28 = v45;
          v30 = (void *)v48;
          v22 = (void *)v62;
          if (v45 == (void *)v48)
            goto LABEL_44;
          goto LABEL_43;
        }
      }
      else
      {
        v10 = 0;
        v34 = v46;
        v33 = v47;
      }

      goto LABEL_42;
    }
    v10 = 0;
  }
LABEL_58:

  return v10;
}

- (id)descriptionDictionary
{
  const __CFString *v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  int64_t v16;
  const __CFString *v17;
  int64_t v18;
  __CFString *v19;
  int64_t v20;
  __CFString *v21;
  int64_t v22;
  __CFString *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  __CFString *v38;
  __CFString *v39;
  __CFString *v40;
  __CFString *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[13];
  _QWORD v51[15];

  v51[13] = *MEMORY[0x24BDAC8D0];
  v50[0] = CFSTR("identifier");
  -[TAAccessoryInformation identifier](self, "identifier");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    -[TAAccessoryInformation identifier](self, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "description");
    v3 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_24D815B48;
  }
  v42 = (__CFString *)v3;
  v51[0] = v3;
  v50[1] = CFSTR("deviceType");
  +[TASPAdvertisement TASPAdvertisementDeviceTypeToString:](TASPAdvertisement, "TASPAdvertisementDeviceTypeToString:", -[TAAccessoryInformation deviceType](self, "deviceType"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v48;
  v50[2] = CFSTR("productData");
  -[TAAccessoryInformation productData](self, "productData");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TAAccessoryInformation productData](self, "productData");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "description");
    v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_24D815B48;
  }
  v41 = (__CFString *)v5;
  v51[2] = v5;
  v50[3] = CFSTR("manufacturer");
  -[TAAccessoryInformation manufacturerName](self, "manufacturerName");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[TAAccessoryInformation manufacturerName](self, "manufacturerName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "description");
    v7 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_24D815B48;
  }
  v40 = (__CFString *)v7;
  v51[3] = v7;
  v50[4] = CFSTR("model");
  -[TAAccessoryInformation modelName](self, "modelName");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[TAAccessoryInformation modelName](self, "modelName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "description");
    v9 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_24D815B48;
  }
  v39 = (__CFString *)v9;
  v51[4] = v9;
  v50[5] = CFSTR("FV");
  -[TAAccessoryInformation firmwareVersion](self, "firmwareVersion");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    -[TAAccessoryInformation firmwareVersion](self, "firmwareVersion");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "description");
    v10 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_24D815B48;
  }
  v38 = (__CFString *)v10;
  v51[5] = v10;
  v50[6] = CFSTR("category");
  -[TAAccessoryInformation accessoryCategory](self, "accessoryCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[TAAccessoryInformation accessoryCategory](self, "accessoryCategory");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "description");
    v12 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = &stru_24D815B48;
  }
  v37 = (__CFString *)v12;
  v51[6] = v12;
  v50[7] = CFSTR("capabilities");
  -[TAAccessoryInformation accessoryCapabilities](self, "accessoryCapabilities");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    -[TAAccessoryInformation accessoryCapabilities](self, "accessoryCapabilities");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "description");
    v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = &stru_24D815B48;
  }
  v36 = (__CFString *)v13;
  v51[7] = v13;
  v50[8] = CFSTR("serialNumber");
  -[TAAccessoryInformation serialNumber](self, "serialNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[TAAccessoryInformation serialNumber](self, "serialNumber");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "description");
    v15 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = &stru_24D815B48;
  }
  v35 = (__CFString *)v15;
  v51[8] = v15;
  v50[9] = CFSTR("protocolImplementation");
  v16 = -[TAAccessoryInformation protocolImplementation](self, "protocolImplementation");
  v47 = (void *)v4;
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), -[TAAccessoryInformation protocolImplementation](self, "protocolImplementation"));
    v17 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = &stru_24D815B48;
  }
  v34 = (__CFString *)v17;
  v51[9] = v17;
  v50[10] = CFSTR("networkID");
  v18 = -[TAAccessoryInformation networkID](self, "networkID");
  v46 = (void *)v6;
  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), -[TAAccessoryInformation networkID](self, "networkID"));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = &stru_24D815B48;
  }
  v44 = (void *)v8;
  v51[10] = v19;
  v50[11] = CFSTR("batteryType");
  v20 = -[TAAccessoryInformation batteryType](self, "batteryType");
  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), -[TAAccessoryInformation batteryType](self, "batteryType"));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = &stru_24D815B48;
  }
  v51[11] = v21;
  v50[12] = CFSTR("batteryLevel");
  v22 = -[TAAccessoryInformation batteryLevel](self, "batteryLevel");
  if (v22)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), -[TAAccessoryInformation batteryLevel](self, "batteryLevel"));
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = &stru_24D815B48;
  }
  v51[12] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)

  if (v20)
  if (v18)

  if (v16)
  if (v14)
  {

  }
  if (v43)
  {

  }
  if (v11)
  {

  }
  if (v45)
  {

  }
  if (v44)
  {

  }
  if (v46)
  {

  }
  if (v47)
  {

  }
  if (v49)
  {

  }
  return v24;
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

  -[TAAccessoryInformation descriptionDictionary](self, "descriptionDictionary");
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TAAccessoryInformation *v10;
  void *v12;
  unint64_t v13;
  void *v14;
  TAAccessoryInformation *v15;

  v15 = +[TAAccessoryInformation allocWithZone:](TAAccessoryInformation, "allocWithZone:", a3);
  -[TAAccessoryInformation identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[TAAccessoryInformation deviceType](self, "deviceType");
  -[TAAccessoryInformation productData](self, "productData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TAAccessoryInformation manufacturerName](self, "manufacturerName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TAAccessoryInformation modelName](self, "modelName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TAAccessoryInformation firmwareVersion](self, "firmwareVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TAAccessoryInformation accessoryCategory](self, "accessoryCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TAAccessoryInformation accessoryCapabilities](self, "accessoryCapabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TAAccessoryInformation serialNumber](self, "serialNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TAAccessoryInformation initWithDeviceUUID:deviceType:productData:manufacturerName:modelName:firmwareVersion:accessoryCategory:accessoryCapabilities:serialNumber:protocolImplementation:networkID:batteryType:batteryLevel:](v15, "initWithDeviceUUID:deviceType:productData:manufacturerName:modelName:firmwareVersion:accessoryCategory:accessoryCapabilities:serialNumber:protocolImplementation:networkID:batteryType:batteryLevel:", v14, v13, v12, v4, v5, v6, v7, v8, v9, -[TAAccessoryInformation protocolImplementation](self, "protocolImplementation"), -[TAAccessoryInformation networkID](self, "networkID"), -[TAAccessoryInformation batteryType](self, "batteryType"), -[TAAccessoryInformation batteryLevel](self, "batteryLevel"));

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_deviceType, CFSTR("deviceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productData, CFSTR("productData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_manufacturerName, CFSTR("manufacturer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelName, CFSTR("model"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firmwareVersion, CFSTR("FV"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessoryCategory, CFSTR("category"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessoryCapabilities, CFSTR("capabilities"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serialNumber, CFSTR("serialNumber"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_protocolImplementation, CFSTR("protocolImplementation"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_networkID, CFSTR("networkID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_batteryType, CFSTR("batteryType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_batteryLevel, CFSTR("batteryLevel"));

}

- (TAAccessoryInformation)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *identifier;
  NSData *v7;
  NSData *productData;
  NSString *v9;
  NSString *manufacturerName;
  NSString *v11;
  NSString *modelName;
  NSData *v13;
  NSData *firmwareVersion;
  NSData *v15;
  NSData *accessoryCategory;
  NSData *v17;
  NSData *accessoryCapabilities;
  NSData *v19;
  NSData *serialNumber;
  int64_t v21;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v5;

  self->_deviceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("deviceType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productData"));
  v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  productData = self->_productData;
  self->_productData = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manufacturer"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  manufacturerName = self->_manufacturerName;
  self->_manufacturerName = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("model"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  modelName = self->_modelName;
  self->_modelName = v11;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FV"));
  v13 = (NSData *)objc_claimAutoreleasedReturnValue();
  firmwareVersion = self->_firmwareVersion;
  self->_firmwareVersion = v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
  v15 = (NSData *)objc_claimAutoreleasedReturnValue();
  accessoryCategory = self->_accessoryCategory;
  self->_accessoryCategory = v15;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("capabilities"));
  v17 = (NSData *)objc_claimAutoreleasedReturnValue();
  accessoryCapabilities = self->_accessoryCapabilities;
  self->_accessoryCapabilities = v17;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
  v19 = (NSData *)objc_claimAutoreleasedReturnValue();
  serialNumber = self->_serialNumber;
  self->_serialNumber = v19;

  self->_protocolImplementation = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("protocolImplementation"));
  self->_networkID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("networkID"));
  self->_batteryType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("batteryType"));
  v21 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("batteryLevel"));

  self->_batteryLevel = v21;
  return self;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (NSData)productData
{
  return self->_productData;
}

- (void)setProductData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)accessoryCategory
{
  return self->_accessoryCategory;
}

- (void)setAccessoryCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)accessoryCapabilities
{
  return self->_accessoryCapabilities;
}

- (void)setAccessoryCapabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSData)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)protocolImplementation
{
  return self->_protocolImplementation;
}

- (void)setProtocolImplementation:(int64_t)a3
{
  self->_protocolImplementation = a3;
}

- (int64_t)networkID
{
  return self->_networkID;
}

- (void)setNetworkID:(int64_t)a3
{
  self->_networkID = a3;
}

- (int64_t)batteryType
{
  return self->_batteryType;
}

- (void)setBatteryType:(int64_t)a3
{
  self->_batteryType = a3;
}

- (int64_t)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(int64_t)a3
{
  self->_batteryLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_accessoryCapabilities, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
