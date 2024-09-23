@implementation W5BluetoothStatus

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)W5BluetoothStatus;
  -[W5BluetoothStatus dealloc](&v3, sel_dealloc);
}

- (void)setDevices:(id)a3
{
  NSArray *devices;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  devices = self->_devices;
  if (devices != a3)
  {

    self->_devices = 0;
    if (a3)
    {
      v6 = objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
      if (v6)
      {
        v7 = v6;
        v8 = (void *)MEMORY[0x24BDD1620];
        v9 = (void *)MEMORY[0x24BDBCF20];
        v10 = objc_opt_class();
        self->_devices = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  const __CFString *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t j;
  void *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  W5BluetoothStatus *v43;
  void *v44;
  NSArray *obj;
  NSArray *obja;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  v4 = v3;
  if (self->_powerOn)
    v5 = "On";
  else
    v5 = "Off";
  objc_msgSend(v3, "appendFormat:", CFSTR("Power: %s\n"), v5);
  objc_msgSend(v4, "appendFormat:", CFSTR("Address: %@\n"), self->_address);
  v6 = "Yes";
  v7 = "No";
  if (self->_isDiscoverable)
    v8 = "Yes";
  else
    v8 = "No";
  objc_msgSend(v4, "appendFormat:", CFSTR("Discoverable: %s\n"), v8);
  if (self->_isConnectable)
    v9 = "Yes";
  else
    v9 = "No";
  objc_msgSend(v4, "appendFormat:", CFSTR("Connectable: %s\n"), v9);
  if (self->_isScanning)
    v10 = "Yes";
  else
    v10 = "No";
  objc_msgSend(v4, "appendFormat:", CFSTR("Scanning: %s\n"), v10);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v43 = self;
  obj = self->_devices;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v52 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        v13 += objc_msgSend(v18, "isPaired");
        v14 += objc_msgSend(v18, "isCloudPaired");
        v15 += objc_msgSend(v18, "isConnected");
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
  }
  objc_msgSend(v4, "appendFormat:", CFSTR("Device Count: %lu (paired=%lu cloud=%lu connected=%lu)\n\n"), -[NSArray count](v43->_devices, "count"), v13, v14, v15);
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obja = v43->_devices;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v19)
  {
    v20 = v19;
    v21 = CFSTR("    %s\n");
    v22 = CFSTR("    Address          : %s\n");
    v23 = *(_QWORD *)v48;
    v24 = CFSTR("    Paired           : %s\n");
    v44 = v4;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v48 != v23)
          objc_enumerationMutation(obja);
        v26 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
        objc_msgSend(v4, "appendFormat:", v21, objc_msgSend((id)objc_msgSend(v26, "name"), "UTF8String"));
        objc_msgSend(v4, "appendFormat:", v22, objc_msgSend((id)objc_msgSend(v26, "address"), "UTF8String"));
        if (objc_msgSend(v26, "isPaired"))
          v27 = v6;
        else
          v27 = v7;
        objc_msgSend(v4, "appendFormat:", v24, v27);
        if (objc_msgSend(v26, "isCloudPaired"))
          v28 = v6;
        else
          v28 = v7;
        objc_msgSend(v4, "appendFormat:", CFSTR("    CloudPaired      : %s\n"), v28);
        if (objc_msgSend(v26, "isConnected"))
          v29 = v6;
        else
          v29 = v7;
        objc_msgSend(v4, "appendFormat:", CFSTR("    Connected        : %s\n"), v29);
        if (objc_msgSend(v26, "isConnected"))
        {
          v30 = v20;
          v31 = v7;
          v32 = v6;
          v33 = v23;
          v34 = v24;
          v35 = v22;
          v36 = v21;
          v37 = objc_msgSend(v26, "majorClass");
          v38 = objc_msgSend(v26, "minorClass");
          v39 = v37;
          v21 = v36;
          v22 = v35;
          v24 = v34;
          v23 = v33;
          v6 = v32;
          v7 = v31;
          v20 = v30;
          v4 = v44;
          objc_msgSend(v44, "appendFormat:", CFSTR("    Type             : %s\n"), objc_msgSend((id)W5DescriptionForBluetoothDeviceType(v39, v38), "UTF8String"));
          if (objc_msgSend(v26, "isLowEnergy"))
            v40 = v6;
          else
            v40 = v7;
          objc_msgSend(v44, "appendFormat:", CFSTR("    LE               : %s\n"), v40);
          if (objc_msgSend(v26, "isAppleDevice"))
            v41 = v6;
          else
            v41 = v7;
          objc_msgSend(v44, "appendFormat:", CFSTR("    Apple            : %s\n"), v41);
        }
        objc_msgSend(v4, "appendFormat:", CFSTR("\n"));
      }
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v20);
  }
  return (id)objc_msgSend(v4, "copy");
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5BluetoothStatus;
  if (-[W5BluetoothStatus conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || (objc_msgSend(a3, "isEqual:", &unk_2545B0870) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isEqual:", &unk_2545B06D8);
  }
}

- (BOOL)isEqualToBluetoothStatus:(id)a3
{
  NSString *address;
  int v6;
  int powerOn;
  int isDiscoverable;
  int isConnectable;
  int isScanning;
  NSArray *devices;

  address = self->_address;
  if (!address)
  {
    if (!objc_msgSend(a3, "address"))
      goto LABEL_5;
    address = self->_address;
  }
  v6 = -[NSString isEqual:](address, "isEqual:", objc_msgSend(a3, "address"));
  if (!v6)
    return v6;
LABEL_5:
  powerOn = self->_powerOn;
  if (powerOn != objc_msgSend(a3, "powerOn")
    || (isDiscoverable = self->_isDiscoverable, isDiscoverable != objc_msgSend(a3, "isDiscoverable"))
    || (isConnectable = self->_isConnectable, isConnectable != objc_msgSend(a3, "isConnectable"))
    || (isScanning = self->_isScanning, isScanning != objc_msgSend(a3, "isScanning")))
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  devices = self->_devices;
  if (!devices)
  {
    if (!objc_msgSend(a3, "devices"))
    {
      LOBYTE(v6) = 1;
      return v6;
    }
    devices = self->_devices;
  }
  LOBYTE(v6) = -[NSArray isEqual:](devices, "isEqual:", objc_msgSend(a3, "devices"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -[W5BluetoothStatus isEqualToBluetoothStatus:](self, "isEqualToBluetoothStatus:", a3);
  }
  return 0;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_address, "hash") ^ self->_powerOn ^ (unint64_t)self->_isDiscoverable;
  v4 = self->_isConnectable ^ (unint64_t)self->_isScanning;
  return v3 ^ v4 ^ -[NSArray hash](self->_devices, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5BluetoothStatus *v4;

  v4 = -[W5BluetoothStatus init](+[W5BluetoothStatus allocWithZone:](W5BluetoothStatus, "allocWithZone:", a3), "init");
  -[W5BluetoothStatus setPowerOn:](v4, "setPowerOn:", self->_powerOn);
  -[W5BluetoothStatus setAddress:](v4, "setAddress:", self->_address);
  -[W5BluetoothStatus setIsDiscoverable:](v4, "setIsDiscoverable:", self->_isDiscoverable);
  -[W5BluetoothStatus setIsConnectable:](v4, "setIsConnectable:", self->_isConnectable);
  -[W5BluetoothStatus setIsScanning:](v4, "setIsScanning:", self->_isScanning);
  -[W5BluetoothStatus setDevices:](v4, "setDevices:", self->_devices);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_address, CFSTR("_address"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_powerOn, CFSTR("_powerOn"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isDiscoverable, CFSTR("_isDiscoverable"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isConnectable, CFSTR("_isConnectable"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isScanning, CFSTR("_isScanning"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_devices, CFSTR("_devices"));
}

- (W5BluetoothStatus)initWithCoder:(id)a3
{
  W5BluetoothStatus *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)W5BluetoothStatus;
  v4 = -[W5BluetoothStatus init](&v8, sel_init);
  if (v4)
  {
    v4->_address = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_address")), "copy");
    v4->_powerOn = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_powerOn"));
    v4->_isDiscoverable = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_isDiscoverable"));
    v4->_isConnectable = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_isConnectable"));
    v4->_isScanning = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_isScanning"));
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    v4->_devices = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("_devices")), "copy");
  }
  return v4;
}

- (BOOL)powerOn
{
  return self->_powerOn;
}

- (void)setPowerOn:(BOOL)a3
{
  self->_powerOn = a3;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isDiscoverable
{
  return self->_isDiscoverable;
}

- (void)setIsDiscoverable:(BOOL)a3
{
  self->_isDiscoverable = a3;
}

- (BOOL)isConnectable
{
  return self->_isConnectable;
}

- (void)setIsConnectable:(BOOL)a3
{
  self->_isConnectable = a3;
}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (void)setIsScanning:(BOOL)a3
{
  self->_isScanning = a3;
}

- (NSArray)devices
{
  return self->_devices;
}

@end
