@implementation W5BluetoothDevice

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)W5BluetoothDevice;
  -[W5BluetoothDevice dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const char *v7;
  const char *v8;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  objc_msgSend(v3, "appendFormat:", CFSTR("Name: %@\n"), self->_name);
  objc_msgSend(v3, "appendFormat:", CFSTR("Address %@\n"), self->_address);
  if (self->_isPaired)
    v4 = CFSTR("Yes");
  else
    v4 = CFSTR("No");
  objc_msgSend(v3, "appendFormat:", CFSTR("isPaired %@\n"), v4);
  if (self->_isConnected)
    v5 = CFSTR("Yes");
  else
    v5 = CFSTR("No");
  objc_msgSend(v3, "appendFormat:", CFSTR("isConnected %@\n"), v5);
  if (self->_isCloudPaired)
    v6 = CFSTR("Yes");
  else
    v6 = CFSTR("No");
  objc_msgSend(v3, "appendFormat:", CFSTR("isCloudPaired %@\n"), v6);
  if (self->_isConnected)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("Type %@\n"), W5DescriptionForBluetoothDeviceType(self->_majorClass, self->_minorClass));
    objc_msgSend(v3, "appendFormat:", CFSTR("RSSI: %ld dBm\n"), self->_rssi);
    objc_msgSend(v3, "appendFormat:", CFSTR("Manufacturer: %@ (0x%lx, 0x%02lx)\n"), W5DescriptionForBluetoothDeviceManufacturer(self->_manufacturer), self->_lmpVersion, self->_lmpSubversion);
    objc_msgSend(v3, "appendFormat:", CFSTR("Role: %@\n"), W5DescriptionForBluetoothDeviceRole(self->_role));
    objc_msgSend(v3, "appendFormat:", CFSTR("Conn Mode: %@\n"), W5DescriptionForBluetoothDeviceConnectionMode(self->_connectionMode));
    objc_msgSend(v3, "appendFormat:", CFSTR("Conn Interval: %ld\n"), self->_connectionModeInterval);
    objc_msgSend(v3, "appendFormat:", CFSTR("AFH Map: %@\n"), self->_afhMap);
    if (self->_isLowEnergy)
      v7 = "Yes";
    else
      v7 = "No";
    objc_msgSend(v3, "appendFormat:", CFSTR("LE: %s\n"), v7);
    if (self->_isAppleDevice)
      v8 = "Yes";
    else
      v8 = "No";
    objc_msgSend(v3, "appendFormat:", CFSTR("Apple: %s\n\n"), v8);
  }
  return (id)objc_msgSend(v3, "copy");
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5BluetoothDevice;
  if (-[W5BluetoothDevice conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || (objc_msgSend(a3, "isEqual:", &unk_2545B0870) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isEqual:", &unk_2545B06D8);
  }
}

- (BOOL)isEqualToBluetoothDevice:(id)a3
{
  NSString *name;
  int v6;
  NSString *address;
  int isPaired;
  int isConnected;
  int isCloudPaired;
  unint64_t majorClass;
  unint64_t minorClass;
  int64_t rssi;
  NSString *afhMap;
  int64_t connectionMode;
  unint64_t connectionModeInterval;
  int64_t manufacturer;
  unint64_t lmpVersion;
  unint64_t lmpSubversion;
  int64_t role;
  int isLowEnergy;
  int isAppleDevice;

  name = self->_name;
  if (!name)
  {
    if (!objc_msgSend(a3, "name"))
      goto LABEL_5;
    name = self->_name;
  }
  v6 = -[NSString isEqual:](name, "isEqual:", objc_msgSend(a3, "name"));
  if (!v6)
    return v6;
LABEL_5:
  address = self->_address;
  if (address)
    goto LABEL_8;
  if (objc_msgSend(a3, "address"))
  {
    address = self->_address;
LABEL_8:
    v6 = -[NSString isEqual:](address, "isEqual:", objc_msgSend(a3, "address"));
    if (!v6)
      return v6;
  }
  isPaired = self->_isPaired;
  if (isPaired != objc_msgSend(a3, "isPaired"))
    goto LABEL_27;
  isConnected = self->_isConnected;
  if (isConnected != objc_msgSend(a3, "isConnected"))
    goto LABEL_27;
  isCloudPaired = self->_isCloudPaired;
  if (isCloudPaired != objc_msgSend(a3, "isCloudPaired"))
    goto LABEL_27;
  majorClass = self->_majorClass;
  if (majorClass != objc_msgSend(a3, "majorClass"))
    goto LABEL_27;
  minorClass = self->_minorClass;
  if (minorClass != objc_msgSend(a3, "minorClass"))
    goto LABEL_27;
  rssi = self->_rssi;
  if (rssi != objc_msgSend(a3, "rssi"))
    goto LABEL_27;
  afhMap = self->_afhMap;
  if (!afhMap)
  {
    if (!objc_msgSend(a3, "afhMap"))
    {
LABEL_19:
      connectionMode = self->_connectionMode;
      if (connectionMode == objc_msgSend(a3, "connectionMode"))
      {
        connectionModeInterval = self->_connectionModeInterval;
        if (connectionModeInterval == objc_msgSend(a3, "connectionModeInterval"))
        {
          manufacturer = self->_manufacturer;
          if (manufacturer == objc_msgSend(a3, "manufacturer"))
          {
            lmpVersion = self->_lmpVersion;
            if (lmpVersion == objc_msgSend(a3, "lmpVersion"))
            {
              lmpSubversion = self->_lmpSubversion;
              if (lmpSubversion == objc_msgSend(a3, "lmpSubversion"))
              {
                role = self->_role;
                if (role == objc_msgSend(a3, "role"))
                {
                  isLowEnergy = self->_isLowEnergy;
                  if (isLowEnergy == objc_msgSend(a3, "isLowEnergy"))
                  {
                    isAppleDevice = self->_isAppleDevice;
                    LOBYTE(v6) = isAppleDevice == objc_msgSend(a3, "isAppleDevice");
                    return v6;
                  }
                }
              }
            }
          }
        }
      }
LABEL_27:
      LOBYTE(v6) = 0;
      return v6;
    }
    afhMap = self->_afhMap;
  }
  v6 = -[NSString isEqual:](afhMap, "isEqual:", objc_msgSend(a3, "afhMap"));
  if (v6)
    goto LABEL_19;
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
      return -[W5BluetoothDevice isEqualToBluetoothDevice:](self, "isEqualToBluetoothDevice:", a3);
  }
  return 0;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  _BOOL8 isPaired;
  BOOL isConnected;
  BOOL isCloudPaired;
  uint64_t v8;
  NSUInteger v9;
  int8x16_t v10;
  int8x16_t v12;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_address, "hash");
  isPaired = self->_isPaired;
  isConnected = self->_isConnected;
  isCloudPaired = self->_isCloudPaired;
  v12 = *(int8x16_t *)&self->_majorClass;
  v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_rssi), "hash");
  v9 = -[NSString hash](self->_afhMap, "hash");
  v10 = veorq_s8(v12, veorq_s8(*(int8x16_t *)&self->_manufacturer, veorq_s8(*(int8x16_t *)&self->_connectionMode, *(int8x16_t *)&self->_lmpSubversion)));
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v10.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL)) ^ isPaired ^ isConnected ^ isCloudPaired ^ v9 ^ self->_isLowEnergy ^ self->_isAppleDevice ^ v8 ^ v4 ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5BluetoothDevice *v4;

  v4 = -[W5BluetoothDevice init](+[W5BluetoothDevice allocWithZone:](W5BluetoothDevice, "allocWithZone:", a3), "init");
  -[W5BluetoothDevice setName:](v4, "setName:", self->_name);
  -[W5BluetoothDevice setAddress:](v4, "setAddress:", self->_address);
  -[W5BluetoothDevice setIsPaired:](v4, "setIsPaired:", self->_isPaired);
  -[W5BluetoothDevice setIsConnected:](v4, "setIsConnected:", self->_isConnected);
  -[W5BluetoothDevice setIsCloudPaired:](v4, "setIsCloudPaired:", self->_isCloudPaired);
  -[W5BluetoothDevice setMajorClass:](v4, "setMajorClass:", self->_majorClass);
  -[W5BluetoothDevice setMinorClass:](v4, "setMinorClass:", self->_minorClass);
  -[W5BluetoothDevice setRssi:](v4, "setRssi:", self->_rssi);
  -[W5BluetoothDevice setAfhMap:](v4, "setAfhMap:", self->_afhMap);
  -[W5BluetoothDevice setConnectionMode:](v4, "setConnectionMode:", self->_connectionMode);
  -[W5BluetoothDevice setConnectionModeInterval:](v4, "setConnectionModeInterval:", self->_connectionModeInterval);
  -[W5BluetoothDevice setManufacturer:](v4, "setManufacturer:", self->_manufacturer);
  -[W5BluetoothDevice setLmpVersion:](v4, "setLmpVersion:", self->_lmpVersion);
  -[W5BluetoothDevice setLmpSubversion:](v4, "setLmpSubversion:", self->_lmpSubversion);
  -[W5BluetoothDevice setRole:](v4, "setRole:", self->_role);
  -[W5BluetoothDevice setIsLowEnergy:](v4, "setIsLowEnergy:", self->_isLowEnergy);
  -[W5BluetoothDevice setIsAppleDevice:](v4, "setIsAppleDevice:", self->_isAppleDevice);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_name, CFSTR("_name"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_address, CFSTR("_address"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isPaired, CFSTR("_isPaired"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isConnected, CFSTR("_isConnected"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isCloudPaired, CFSTR("_isCloudPaired"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_majorClass, CFSTR("_majorClass"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_minorClass, CFSTR("_minorClass"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_rssi, CFSTR("_rssi"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_afhMap, CFSTR("_afhMap"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_connectionMode, CFSTR("_connectionMode"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_connectionModeInterval, CFSTR("_connectionModeInterval"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_manufacturer, CFSTR("_manufacturer"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_lmpVersion, CFSTR("_lmpVersion"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_lmpSubversion, CFSTR("_lmpSubversion"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_role, CFSTR("_role"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isLowEnergy, CFSTR("_isLowEnergy"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isAppleDevice, CFSTR("_isAppleDevice"));
}

- (W5BluetoothDevice)initWithCoder:(id)a3
{
  W5BluetoothDevice *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)W5BluetoothDevice;
  v4 = -[W5BluetoothDevice init](&v6, sel_init);
  if (v4)
  {
    v4->_name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name")), "copy");
    v4->_address = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_address")), "copy");
    v4->_isPaired = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_isPaired"));
    v4->_isConnected = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_isConnected"));
    v4->_isCloudPaired = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_isCloudPaired"));
    v4->_majorClass = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_majorClass"));
    v4->_minorClass = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_minorClass"));
    v4->_rssi = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_rssi"));
    v4->_afhMap = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_afhMap")), "copy");
    v4->_connectionMode = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_connectionMode"));
    v4->_connectionModeInterval = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_connectionModeInterval"));
    v4->_manufacturer = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_manufacturer"));
    v4->_lmpVersion = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_lmpVersion"));
    v4->_lmpSubversion = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_lmpSubversion"));
    v4->_role = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_role"));
    v4->_isLowEnergy = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_isLowEnergy"));
    v4->_isAppleDevice = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_isAppleDevice"));
  }
  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isPaired
{
  return self->_isPaired;
}

- (void)setIsPaired:(BOOL)a3
{
  self->_isPaired = a3;
}

- (BOOL)isCloudPaired
{
  return self->_isCloudPaired;
}

- (void)setIsCloudPaired:(BOOL)a3
{
  self->_isCloudPaired = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (unint64_t)majorClass
{
  return self->_majorClass;
}

- (void)setMajorClass:(unint64_t)a3
{
  self->_majorClass = a3;
}

- (unint64_t)minorClass
{
  return self->_minorClass;
}

- (void)setMinorClass:(unint64_t)a3
{
  self->_minorClass = a3;
}

- (BOOL)isLowEnergy
{
  return self->_isLowEnergy;
}

- (void)setIsLowEnergy:(BOOL)a3
{
  self->_isLowEnergy = a3;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (NSString)afhMap
{
  return self->_afhMap;
}

- (void)setAfhMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)connectionMode
{
  return self->_connectionMode;
}

- (void)setConnectionMode:(int64_t)a3
{
  self->_connectionMode = a3;
}

- (unint64_t)connectionModeInterval
{
  return self->_connectionModeInterval;
}

- (void)setConnectionModeInterval:(unint64_t)a3
{
  self->_connectionModeInterval = a3;
}

- (int64_t)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(int64_t)a3
{
  self->_manufacturer = a3;
}

- (unint64_t)lmpVersion
{
  return self->_lmpVersion;
}

- (void)setLmpVersion:(unint64_t)a3
{
  self->_lmpVersion = a3;
}

- (unint64_t)lmpSubversion
{
  return self->_lmpSubversion;
}

- (void)setLmpSubversion:(unint64_t)a3
{
  self->_lmpSubversion = a3;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (BOOL)isAppleDevice
{
  return self->_isAppleDevice;
}

- (void)setIsAppleDevice:(BOOL)a3
{
  self->_isAppleDevice = a3;
}

@end
