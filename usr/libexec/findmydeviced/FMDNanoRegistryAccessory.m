@implementation FMDNanoRegistryAccessory

- (FMDNanoRegistryAccessory)initWithNRDevice:(id)a3
{
  id v4;
  FMDNanoRegistryAccessory *v5;
  FMDNanoRegistryAccessory *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FMDNanoRegistryAccessory;
  v5 = -[FMDNanoRegistryAccessory init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    -[FMDNanoRegistryAccessory setMigrationPossible:](v5, "setMigrationPossible:", 0);
    -[FMDNanoRegistryAccessory setDevice:](v6, "setDevice:", v4);
    v7 = objc_alloc((Class)FMDAccessoryIdentifier);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory pairingId](v6, "pairingId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    v10 = objc_msgSend(v7, "initWithString:", v9);
    -[FMDNanoRegistryAccessory setAccessoryIdentifier:](v6, "setAccessoryIdentifier:", v10);

  }
  return v6;
}

- (NSString)udid
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory device](self, "device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", NRDevicePropertyUDID));

  return (NSString *)v3;
}

- (NSUUID)pairingId
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory device](self, "device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", NRDevicePropertyPairingID));

  return (NSUUID *)v3;
}

- (NSString)serialNumber
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory device](self, "device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", NRDevicePropertySerialNumber));

  return (NSString *)v3;
}

- (NSString)productType
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory device](self, "device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", NRDevicePropertyProductType));

  return (NSString *)v3;
}

- (NSString)productVersion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory device](self, "device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", NRDevicePropertySystemVersion));

  return (NSString *)v3;
}

- (NSString)buildVersion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory device](self, "device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", NRDevicePropertySystemBuildVersion));

  return (NSString *)v3;
}

- (BOOL)paired
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory device](self, "device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", NRDevicePropertyIsPaired));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)tinkerCapable
{
  void *v2;
  id v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory device](self, "device"));
  v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("7275F1C6-7EB4-4406-B552-DC910FBFD07C"));
  v4 = objc_msgSend(v2, "supportsCapability:", v3);

  return v4;
}

- (BOOL)tinkerPaired
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = -[FMDNanoRegistryAccessory tinkerCapable](self, "tinkerCapable");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry activePairedDeviceSelectorBlock](NRPairedDeviceRegistry, "activePairedDeviceSelectorBlock"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForProperty:", NRDevicePropertyIsAltAccount));
    LOBYTE(v4) = objc_msgSend(v7, "BOOLValue");

    LOBYTE(v2) = (_BYTE)v4;
  }
  return v2;
}

- (unint64_t)category
{
  return 2;
}

- (NSString)name
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory device](self, "device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", NRDevicePropertyName));

  return (NSString *)v3;
}

- (id)completeDeviceInfo
{
  void *v3;
  void *v4;
  void *v5;
  _UNKNOWN **v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory lastDiscoveryDate](self, "lastDiscoveryDate"));
  v5 = v4;
  if (v4)
    v6 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v4, "fm_epoch")));
  else
    v6 = &off_1002D7F90;
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("lastActiveTime"), v6);
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("deviceClass"), CFSTR("Watch"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("platform"), CFSTR("watchos"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory pairingId](self, "pairingId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("pairingId"), v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory udid](self, "udid"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("udid"), v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory productType](self, "productType"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("productType"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory name](self, "name"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("deviceName"), v11);

  return v3;
}

- (id)deviceInfoForHostRegister
{
  void *v3;

  if (-[FMDNanoRegistryAccessory paired](self, "paired"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory completeDeviceInfo](self, "completeDeviceInfo"));
  else
    v3 = 0;
  return v3;
}

+ (id)volatileKeysToExcludeFromRegisterDigest
{
  const __CFString *v3;

  v3 = CFSTR("lastActiveTime");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (id)lastDiscoveryDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory device](self, "device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", NRDevicePropertyLastActiveDate));

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  FMDNanoRegistryAccessory *v5;
  uint64_t v6;
  id v7;
  BOOL v8;

  v5 = (FMDNanoRegistryAccessory *)a3;
  if (v5 == self)
  {
    v8 = 1;
  }
  else
  {
    v6 = objc_opt_class(self, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = -[FMDNanoRegistryAccessory hash](v5, "hash");
      v8 = v7 == (id)-[FMDNanoRegistryAccessory hash](self, "hash");
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
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory accessoryIdentifier](self, "accessoryIdentifier"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (FMDNanoRegistryAccessory)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDNanoRegistryAccessory *v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FMDNanoRegistryAccessory;
  v6 = -[FMDNanoRegistryAccessory init](&v12, "init");
  if (v6)
  {
    v7 = objc_opt_class(FMDAccessoryIdentifier, v5);
    v8 = NSStringFromSelector("accessoryIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v9));
    -[FMDNanoRegistryAccessory setAccessoryIdentifier:](v6, "setAccessoryIdentifier:", v10);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory accessoryIdentifier](self, "accessoryIdentifier"));
  v5 = NSStringFromSelector("accessoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "encodeObject:forKey:", v7, v6);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)connectionState
{
  return 0;
}

- (FMDCommandContext)commandContext
{
  return 0;
}

- (NSString)address
{
  return 0;
}

- (BOOL)nearby
{
  return 0;
}

- (NSUUID)baUUID
{
  return 0;
}

- (BOOL)updateWithBeaconingIdentifier:(id)a3
{
  return 0;
}

- (NSString)description
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory pairingId](self, "pairingId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("pairing ID: %@"), v4));
  objc_msgSend(v3, "addObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory udid](self, "udid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UDID: %@"), v6));
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory serialNumber](self, "serialNumber"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Serial Number: %@"), v8));
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory productType](self, "productType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Product Type: %@"), v10));
  objc_msgSend(v3, "addObject:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory productType](self, "productType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Product Type: %@"), v12));
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory productVersion](self, "productVersion"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Product Version: %@"), v14));
  objc_msgSend(v3, "addObject:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistryAccessory buildVersion](self, "buildVersion"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Build Version: %@"), v16));
  objc_msgSend(v3, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FMDNanoRegistryAccessory paired](self, "paired")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Paired: %@"), v18));
  objc_msgSend(v3, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FMDNanoRegistryAccessory migrationPossible](self, "migrationPossible")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Migration Possible: %@"), v20));
  objc_msgSend(v3, "addObject:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));
  return (NSString *)v22;
}

- (BOOL)migrationPossible
{
  return self->_migrationPossible;
}

- (void)setMigrationPossible:(BOOL)a3
{
  self->_migrationPossible = a3;
}

- (NRDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (FMDAccessoryIdentifier)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
