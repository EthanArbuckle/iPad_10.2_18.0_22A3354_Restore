@implementation FMDInternalLocalFindableAccessory

- (FMDInternalLocalFindableAccessory)initWithLocalFindableAccessory:(id)a3
{
  id v5;
  FMDInternalLocalFindableAccessory *v6;
  FMDInternalLocalFindableAccessory *v7;
  uint64_t v8;
  NSString *name;
  id v10;
  void *v11;
  void *v12;
  FMDAccessoryIdentifier *v13;
  FMDAccessoryIdentifier *accessoryIdentifier;
  uint64_t v15;
  NSUUID *baUUID;
  uint64_t v17;
  NSString *serialNumber;
  uint64_t v19;
  NSString *alternateSerialNumber;
  uint64_t v21;
  NSData *irkData;
  uint64_t v23;
  NSString *btAddress;
  uint64_t v25;
  NSString *firmwareVersion;
  uint64_t v27;
  NSString *vendorId;
  uint64_t v29;
  NSString *productId;
  NSString *bluetoothColorCode;
  objc_super v33;

  v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)FMDInternalLocalFindableAccessory;
  v6 = -[FMDInternalLocalFindableAccessory init](&v33, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_localFindableAccessory, a3);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v10 = objc_alloc((Class)FMDAccessoryIdentifier);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "baUUID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
    v13 = (FMDAccessoryIdentifier *)objc_msgSend(v10, "initWithString:", v12);
    accessoryIdentifier = v7->_accessoryIdentifier;
    v7->_accessoryIdentifier = v13;

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "baUUID"));
    baUUID = v7->_baUUID;
    v7->_baUUID = (NSUUID *)v15;

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serialNumber"));
    serialNumber = v7->_serialNumber;
    v7->_serialNumber = (NSString *)v17;

    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alternateSerialNumber"));
    alternateSerialNumber = v7->_alternateSerialNumber;
    v7->_alternateSerialNumber = (NSString *)v19;

    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "irkData"));
    irkData = v7->_irkData;
    v7->_irkData = (NSData *)v21;

    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "btAddress"));
    btAddress = v7->_btAddress;
    v7->_btAddress = (NSString *)v23;

    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firmwareVersion"));
    firmwareVersion = v7->_firmwareVersion;
    v7->_firmwareVersion = (NSString *)v25;

    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vendorId"));
    vendorId = v7->_vendorId;
    v7->_vendorId = (NSString *)v27;

    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "productId"));
    productId = v7->_productId;
    v7->_productId = (NSString *)v29;

    bluetoothColorCode = v7->_bluetoothColorCode;
    v7->_bluetoothColorCode = (NSString *)CFSTR("0_0");

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)category
{
  return 0;
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
  NSString *v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  NSString *v20;
  void *v21;
  void *v22;
  NSString *v23;
  void *v24;
  void *v25;
  NSString *v26;
  void *v27;
  void *v28;
  NSString *v29;
  void *v30;
  void *v31;
  NSString *v32;
  void *v33;
  void *v34;
  NSString *v35;
  void *v36;
  void *v37;
  NSString *v38;
  void *v39;
  id v40;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory name](self, "name"));
  v6 = NSStringFromSelector("name");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v4, "encodeObject:forKey:", v5, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory address](self, "address"));
  v9 = NSStringFromSelector("address");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v4, "encodeObject:forKey:", v8, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory vendorId](self, "vendorId"));
  v12 = NSStringFromSelector("vendorId");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v4, "encodeObject:forKey:", v11, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory productId](self, "productId"));
  v15 = NSStringFromSelector("productId");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v4, "encodeObject:forKey:", v14, v16);

  v40 = (id)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory currentLastActiveTime](self, "currentLastActiveTime"));
  v17 = NSStringFromSelector("lastActiveTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v4, "encodeObject:forKey:", v40, v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory serialNumber](self, "serialNumber"));
  v20 = NSStringFromSelector("serialNumber");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  objc_msgSend(v4, "encodeObject:forKey:", v19, v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory alternateSerialNumber](self, "alternateSerialNumber"));
  v23 = NSStringFromSelector("alternateSerialNumber");
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  objc_msgSend(v4, "encodeObject:forKey:", v22, v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory firmwareVersion](self, "firmwareVersion"));
  v26 = NSStringFromSelector("firmwareVersion");
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  objc_msgSend(v4, "encodeObject:forKey:", v25, v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory bluetoothColorCode](self, "bluetoothColorCode"));
  v29 = NSStringFromSelector("bluetoothColorCode");
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  objc_msgSend(v4, "encodeObject:forKey:", v28, v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory irkData](self, "irkData"));
  v32 = NSStringFromSelector("irkData");
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  objc_msgSend(v4, "encodeObject:forKey:", v31, v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory btAddress](self, "btAddress"));
  v35 = NSStringFromSelector("btAddress");
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  objc_msgSend(v4, "encodeObject:forKey:", v34, v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory baUUID](self, "baUUID"));
  v38 = NSStringFromSelector("baUUID");
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  objc_msgSend(v4, "encodeObject:forKey:", v37, v39);

}

- (FMDInternalLocalFindableAccessory)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDInternalLocalFindableAccessory *v6;
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
  uint64_t v17;
  NSString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSString *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSString *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  NSString *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  NSString *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  NSString *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  NSString *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  NSString *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;

  v4 = a3;
  v6 = -[FMDInternalLocalFindableAccessory init](self, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSString, v5);
    v8 = NSStringFromSelector("name");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v9));
    -[FMDInternalLocalFindableAccessory setName:](v6, "setName:", v10);

    v12 = objc_opt_class(NSString, v11);
    v13 = NSStringFromSelector("address");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v14));
    -[FMDInternalLocalFindableAccessory setAddress:](v6, "setAddress:", v15);

    v17 = objc_opt_class(NSString, v16);
    v18 = NSStringFromSelector("vendorId");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v19));
    -[FMDInternalLocalFindableAccessory setVendorId:](v6, "setVendorId:", v20);

    v22 = objc_opt_class(NSNumber, v21);
    v23 = NSStringFromSelector("productId");
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v24));
    -[FMDInternalLocalFindableAccessory setProductId:](v6, "setProductId:", v25);

    v27 = objc_opt_class(NSDate, v26);
    v28 = NSStringFromSelector("lastActiveTime");
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v27, v29));
    -[FMDInternalLocalFindableAccessory setLastActiveTime:](v6, "setLastActiveTime:", v30);

    v32 = objc_opt_class(NSString, v31);
    v33 = NSStringFromSelector("serialNumber");
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v32, v34));
    -[FMDInternalLocalFindableAccessory setSerialNumber:](v6, "setSerialNumber:", v35);

    v37 = objc_opt_class(NSString, v36);
    v38 = NSStringFromSelector("alternateSerialNumber");
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v37, v39));
    -[FMDInternalLocalFindableAccessory setAlternateSerialNumber:](v6, "setAlternateSerialNumber:", v40);

    v42 = objc_opt_class(NSString, v41);
    v43 = NSStringFromSelector("firmwareVersion");
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v42, v44));
    -[FMDInternalLocalFindableAccessory setFirmwareVersion:](v6, "setFirmwareVersion:", v45);

    v47 = objc_opt_class(NSData, v46);
    v48 = NSStringFromSelector("irkData");
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v47, v49));
    -[FMDInternalLocalFindableAccessory setIrkData:](v6, "setIrkData:", v50);

    v52 = objc_opt_class(NSString, v51);
    v53 = NSStringFromSelector("btAddress");
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v52, v54));
    -[FMDInternalLocalFindableAccessory setBtAddress:](v6, "setBtAddress:", v55);

    v57 = objc_opt_class(NSNumber, v56);
    v58 = NSStringFromSelector("bluetoothColorCode");
    v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v57, v59));
    -[FMDInternalLocalFindableAccessory setBluetoothColorCode:](v6, "setBluetoothColorCode:", v60);

    v61 = objc_alloc((Class)FMDAccessoryIdentifier);
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory serialNumber](v6, "serialNumber"));
    v63 = objc_msgSend(v61, "initWithString:", v62);
    -[FMDInternalLocalFindableAccessory setAccessoryIdentifier:](v6, "setAccessoryIdentifier:", v63);

  }
  return v6;
}

- (id)deviceInfo
{
  void *v3;
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
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned int v39;
  unsigned int v40;
  uint8_t buf[4];
  unsigned int v42;
  __int16 v43;
  unsigned int v44;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory name](self, "name"));
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("deviceName"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory accessoryIdentifier](self, "accessoryIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("udid"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory address](self, "address"));
  objc_msgSend(v3, "setValue:forKey:", v7, CFSTR("deviceDiscoveryId"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory connectionStatusString](self, "connectionStatusString"));
  objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("connectionStatus"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory currentLastActiveTime](self, "currentLastActiveTime"));
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v9, "fm_epoch")));
    objc_msgSend(v3, "setValue:forKey:", v11, CFSTR("lastActiveTime"));

  }
  else
  {
    objc_msgSend(v3, "setValue:forKey:", &off_1002D8128, CFSTR("lastActiveTime"));
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory localFindableAccessory](self, "localFindableAccessory"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "btAddress"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v13, CFSTR("btAddress"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("locationServicesEnabled"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("findMyiPhone"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("activationLock"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory localFindableAccessory](self, "localFindableAccessory"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firmwareVersion"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v15, CFSTR("firmwareVersion"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "productVersion"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("productVersion"), v17);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Accessory"), CFSTR("deviceClass"));
  v40 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory vendorId](self, "vendorId"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v18));

  objc_msgSend(v19, "scanHexInt:", &v40);
  v39 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory productId](self, "productId"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v20));

  objc_msgSend(v21, "scanHexInt:", &v39);
  v22 = sub_1000031B8();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v42 = v40;
    v43 = 1024;
    v44 = v39;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "vendorId = %u productId = %u", buf, 0xEu);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory _deviceTypeFromVendorId:productId:](self, "_deviceTypeFromVendorId:productId:", v40, v39));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtConfigurationRegistry sharedInstance](FMDExtConfigurationRegistry, "sharedInstance"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "configForAccessoryType:", v24));

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "version"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("cachedConfigVersion"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("productType"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "platform"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_proxy"), v29));

  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("platform"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory localFindableAccessory](self, "localFindableAccessory"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "serialNumber"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v32, CFSTR("serialNumber"));

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory localFindableAccessory](self, "localFindableAccessory"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "alternateSerialNumber"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v34, CFSTR("alternateSerialNumber"));

  objc_msgSend(v3, "fm_safeSetObject:forKey:", CFSTR("0_0"), CFSTR("colorCode"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory localFindableAccessory](self, "localFindableAccessory"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "baUUID"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "UUIDString"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("baUUID"), v37);

  return v3;
}

- (id)lastDiscoveryDate
{
  return +[NSDate date](NSDate, "date");
}

- (id)lastKnownLocationDeviceInfo
{
  void *v3;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory name](self, "name"));
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("deviceName"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory accessoryIdentifier](self, "accessoryIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("udid"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory currentLastActiveTime](self, "currentLastActiveTime"));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v7, "fm_epoch")));
    objc_msgSend(v3, "setValue:forKey:", v9, CFSTR("lastActiveTime"));

  }
  else
  {
    objc_msgSend(v3, "setValue:forKey:", &off_1002D8128, CFSTR("lastActiveTime"));
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory localFindableAccessory](self, "localFindableAccessory"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "irkData"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v11, CFSTR("irkData"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory localFindableAccessory](self, "localFindableAccessory"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "btAddress"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v13, CFSTR("btAddress"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("locationServicesEnabled"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("findMyiPhone"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("activationLock"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory localFindableAccessory](self, "localFindableAccessory"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firmwareVersion"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v15, CFSTR("firmwareVersion"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "productVersion"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("productVersion"), v17);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Accessory"), CFSTR("deviceClass"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory localFindableAccessory](self, "localFindableAccessory"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "vendorId"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory localFindableAccessory](self, "localFindableAccessory"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "productId"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v19, v21));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("productType"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "platform"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_proxy"), v24));

  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("platform"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory localFindableAccessory](self, "localFindableAccessory"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "serialNumber"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v27, CFSTR("serialNumber"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory localFindableAccessory](self, "localFindableAccessory"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "alternateSerialNumber"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v29, CFSTR("alternateSerialNumber"));

  objc_msgSend(v3, "fm_safeSetObject:forKey:", CFSTR("0_0"), CFSTR("colorCode"));
  return v3;
}

- (BOOL)updateWithBeaconingIdentifier:(id)a3
{
  return 1;
}

+ (id)volatileKeysToExcludeFromRegisterDigest
{
  const __CFString *v3;

  v3 = CFSTR("irkData");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (int64_t)connectionState
{
  void *v2;
  int64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory localFindableAccessory](self, "localFindableAccessory"));
  v3 = objc_msgSend(v2, "isConnected");

  return v3;
}

- (id)connectionStatusString
{
  unint64_t v2;

  v2 = -[FMDInternalLocalFindableAccessory connectionState](self, "connectionState");
  if (v2 > 2)
    return 0;
  else
    return off_1002C3590[v2];
}

- (id)currentLastActiveTime
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  int v11;
  FMDInternalLocalFindableAccessory *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory localFindableAccessory](self, "localFindableAccessory"));
  v4 = objc_msgSend(v3, "isConnected");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[FMDInternalLocalFindableAccessory setLastActiveTime:](self, "setLastActiveTime:", v5);
    v6 = sub_1000031B8();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMDBluetoothAccessory(0x%lX) updated lastActiveTime", (uint8_t *)&v11, 0xCu);
    }

  }
  else
  {
    v8 = sub_1000031B8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMDBluetoothAccessory(0x%lX) fetching cached lastActiveTime", (uint8_t *)&v11, 0xCu);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory lastActiveTime](self, "lastActiveTime"));
  }
  return v5;
}

- (id)_deviceTypeFromVendorId:(unsigned int)a3 productId:(unsigned int)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BT_%u_%u"), *(_QWORD *)&a3, *(_QWORD *)&a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalLocalFindableAccessory _computehash:](self, "_computehash:", v5));

  return v6;
}

- (id)_computehash:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fm_sha256Hash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fm_hexString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lowercaseString"));

  return v6;
}

- (FMDCommandContext)commandContext
{
  return self->commandContext;
}

- (BOOL)nearby
{
  return self->nearby;
}

- (FMDLocalFindableAccessory)localFindableAccessory
{
  return self->_localFindableAccessory;
}

- (void)setLocalFindableAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_localFindableAccessory, a3);
}

- (NSDate)lastActiveTime
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastActiveTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (FMDAccessoryIdentifier)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, a3);
}

- (NSUUID)identifier
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

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)alternateSerialNumber
{
  return self->_alternateSerialNumber;
}

- (void)setAlternateSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSData)irkData
{
  return self->_irkData;
}

- (void)setIrkData:(id)a3
{
  objc_storeStrong((id *)&self->_irkData, a3);
}

- (NSString)btAddress
{
  return self->_btAddress;
}

- (void)setBtAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)vendorId
{
  return self->_vendorId;
}

- (void)setVendorId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)productId
{
  return self->_productId;
}

- (void)setProductId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (NSUUID)baUUID
{
  return self->_baUUID;
}

- (void)setBaUUID:(id)a3
{
  objc_storeStrong((id *)&self->_baUUID, a3);
}

- (NSString)bluetoothColorCode
{
  return self->_bluetoothColorCode;
}

- (void)setBluetoothColorCode:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothColorCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothColorCode, 0);
  objc_storeStrong((id *)&self->_baUUID, 0);
  objc_storeStrong((id *)&self->_productId, 0);
  objc_storeStrong((id *)&self->_vendorId, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_btAddress, 0);
  objc_storeStrong((id *)&self->_irkData, 0);
  objc_storeStrong((id *)&self->_alternateSerialNumber, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_lastActiveTime, 0);
  objc_storeStrong((id *)&self->_localFindableAccessory, 0);
  objc_storeStrong((id *)&self->commandContext, 0);
}

@end
