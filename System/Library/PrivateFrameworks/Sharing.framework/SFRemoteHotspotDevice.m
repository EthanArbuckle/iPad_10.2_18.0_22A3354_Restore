@implementation SFRemoteHotspotDevice

- (SFRemoteHotspotDevice)initWithName:(id)a3 identifier:(id)a4 advertisement:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  SFRemoteHotspotDevice *v10;
  uint64_t v11;
  NSString *deviceName;
  uint64_t v13;
  NSString *deviceIdentifier;
  uint64_t v15;
  NSNumber *batteryLife;
  uint64_t v17;
  NSNumber *signalStrength;
  uint64_t v19;
  NSData *advertisementData;
  objc_super v22;
  $34BA6F790EA54A0199CFC09125C567C5 v23;

  v5 = *(_QWORD *)&a5.var0;
  v23 = a5;
  v8 = a3;
  v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SFRemoteHotspotDevice;
  v10 = -[SFRemoteHotspotDevice init](&v22, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    deviceName = v10->_deviceName;
    v10->_deviceName = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    deviceIdentifier = v10->_deviceIdentifier;
    v10->_deviceIdentifier = (NSString *)v13;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", BYTE2(v5));
    v15 = objc_claimAutoreleasedReturnValue();
    batteryLife = v10->_batteryLife;
    v10->_batteryLife = (NSNumber *)v15;

    v10->_networkType = -[SFRemoteHotspotDevice networkTypeForIncomingType:](v10, "networkTypeForIncomingType:", BYTE4(v5));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", BYTE5(v5));
    v17 = objc_claimAutoreleasedReturnValue();
    signalStrength = v10->_signalStrength;
    v10->_signalStrength = (NSNumber *)v17;

    v10->_hasDuplicates = (v5 & 0x8000) != 0;
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v23, 6);
    advertisementData = v10->_advertisementData;
    v10->_advertisementData = (NSData *)v19;

  }
  return v10;
}

- (id)description
{
  int64_t group;
  void *v4;
  objc_class *v5;
  void *v6;
  NSString *deviceName;
  NSString *deviceIdentifier;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  const char *v14;
  void *v15;

  group = self->_group;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  deviceName = self->_deviceName;
  deviceIdentifier = self->_deviceIdentifier;
  v9 = -[NSNumber intValue](self->_batteryLife, "intValue");
  SFHotspotNetworkTypeString(self->_networkType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NSNumber intValue](self->_signalStrength, "intValue");
  v12 = "yes";
  if (self->_hasDuplicates)
    v13 = "yes";
  else
    v13 = "no";
  if (self->_supportsCompanionLink)
    v14 = "yes";
  else
    v14 = "no";
  if (!self->_osSupportsAutoHotspot)
    v12 = "no";
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, name: %@, identifier: %@, battery life: %d, network type: %@, signal strength: %d, group: %ld, model %@, has duplicates: %s, supports companion link: %s, os supports auto hotspot %s>"), v6, self, deviceName, deviceIdentifier, v9, v10, v11, group, self->_model, v13, v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  SFRemoteHotspotDevice *v4;
  NSString *deviceIdentifier;
  void *v6;
  char v7;

  v4 = (SFRemoteHotspotDevice *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      deviceIdentifier = self->_deviceIdentifier;
      -[SFRemoteHotspotDevice deviceIdentifier](v4, "deviceIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSString isEqual:](deviceIdentifier, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_deviceIdentifier, "hash");
}

- (BOOL)componentsAreEqualTo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "batteryLife");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", self->_batteryLife);

    if (!v7)
      goto LABEL_8;
    objc_msgSend(v5, "deviceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", self->_deviceName);

    if (!v9)
      goto LABEL_8;
    objc_msgSend(v5, "deviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", self->_deviceIdentifier);

    if (v11 && objc_msgSend(v5, "networkType") == self->_networkType)
    {
      objc_msgSend(v5, "signalStrength");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqual:", self->_signalStrength);

    }
    else
    {
LABEL_8:
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)updateWithHotspotInfo:(unsigned int)a3
{
  uint64_t v3;
  NSNumber *v5;
  NSNumber *batteryLife;
  NSNumber *v7;
  NSNumber *signalStrength;

  v3 = *(_QWORD *)&a3;
  -[SFRemoteHotspotDevice batteryLifeFromInfo:](self, "batteryLifeFromInfo:");
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  batteryLife = self->_batteryLife;
  self->_batteryLife = v5;

  self->_networkType = -[SFRemoteHotspotDevice networkTypeFromInfo:](self, "networkTypeFromInfo:", v3);
  -[SFRemoteHotspotDevice signalStrengthFromInfo:](self, "signalStrengthFromInfo:", v3);
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  signalStrength = self->_signalStrength;
  self->_signalStrength = v7;

}

- (SFRemoteHotspotDevice)initWithCoder:(id)a3
{
  id v4;
  SFRemoteHotspotDevice *v5;
  void *v6;
  uint64_t v7;
  NSString *deviceName;
  void *v9;
  uint64_t v10;
  NSString *deviceIdentifier;
  uint64_t v12;
  NSNumber *batteryLife;
  uint64_t v14;
  NSNumber *signalStrength;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *model;
  void *v20;
  NSData *advertisementData;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SFRemoteHotspotDevice;
  v5 = -[SFRemoteHotspotDevice init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BatteryLife"));
    v12 = objc_claimAutoreleasedReturnValue();
    batteryLife = v5->_batteryLife;
    v5->_batteryLife = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SignalStrength"));
    v14 = objc_claimAutoreleasedReturnValue();
    signalStrength = v5->_signalStrength;
    v5->_signalStrength = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NetworkType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_networkType = objc_msgSend(v16, "intValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ModelIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    model = v5->_model;
    v5->_model = (NSString *)v18;

    v5->_hasDuplicates = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HasDuplicates"));
    v5->_supportsCompanionLink = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SupportsCompanionLink"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceGroup"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_group = (int)objc_msgSend(v20, "intValue");

    v5->_osSupportsAutoHotspot = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("OSSupportAutoHotspot"));
    advertisementData = v5->_advertisementData;
    v5->_advertisementData = 0;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *deviceName;
  void *v5;
  void *v6;
  id v7;

  deviceName = self->_deviceName;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", deviceName, CFSTR("DeviceName"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_deviceIdentifier, CFSTR("DeviceIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_batteryLife, CFSTR("BatteryLife"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_signalStrength, CFSTR("SignalStrength"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_networkType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("NetworkType"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_model, CFSTR("ModelIdentifier"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_hasDuplicates, CFSTR("HasDuplicates"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_supportsCompanionLink, CFSTR("SupportsCompanionLink"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_group);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("DeviceGroup"));

  objc_msgSend(v7, "encodeBool:forKey:", self->_osSupportsAutoHotspot, CFSTR("OSSupportAutoHotspot"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)batteryLifeFromInfo:(unsigned int)a3
{
  return (id)qword_1E482F4B0[a3 & 3];
}

- (id)signalStrengthFromInfo:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((a3 & 0x70) == 0)
    return &unk_1E4890790;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", ((a3 >> 2) & 3) + 1, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)networkTypeFromInfo:(unsigned int)a3
{
  return (0x807060403020100uLL >> ((a3 >> 1) & 0x38)) & 0xF;
}

- (unsigned)networkTypeForIncomingType:(unsigned __int8)a3
{
  if (a3 == 5)
    return 4;
  else
    return a3;
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)deviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSNumber)batteryLife
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBatteryLife:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unsigned)networkType
{
  return self->_networkType;
}

- (void)setNetworkType:(unsigned __int8)a3
{
  self->_networkType = a3;
}

- (NSNumber)signalStrength
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSignalStrength:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)osSupportsAutoHotspot
{
  return self->_osSupportsAutoHotspot;
}

- (void)setOsSupportsAutoHotspot:(BOOL)a3
{
  self->_osSupportsAutoHotspot = a3;
}

- (int64_t)group
{
  return self->_group;
}

- (void)setGroup:(int64_t)a3
{
  self->_group = a3;
}

- (BOOL)cellularSlicingIsEnabled
{
  return self->_cellularSlicingIsEnabled;
}

- (void)setCellularSlicingIsEnabled:(BOOL)a3
{
  self->_cellularSlicingIsEnabled = a3;
}

- (BOOL)supportsCompanionLink
{
  return self->_supportsCompanionLink;
}

- (void)setSupportsCompanionLink:(BOOL)a3
{
  self->_supportsCompanionLink = a3;
}

- (BOOL)hasDuplicates
{
  return self->_hasDuplicates;
}

- (void)setHasDuplicates:(BOOL)a3
{
  self->_hasDuplicates = a3;
}

- (NSData)advertisementData
{
  return self->_advertisementData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisementData, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_signalStrength, 0);
  objc_storeStrong((id *)&self->_batteryLife, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
