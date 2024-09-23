@implementation PCDeviceIdentifier

- (PCDeviceIdentifier)initWithDeviceName:(id)a3
{
  id v5;
  PCDeviceIdentifier *v6;
  PCDeviceIdentifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PCDeviceIdentifier;
  v6 = -[PCDeviceIdentifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_deviceName, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t assetType;
  NSString *deviceName;
  id v7;

  v4 = a3;
  assetType = self->_assetType;
  v7 = v4;
  if (assetType)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", assetType, CFSTR("at"));
    v4 = v7;
  }
  deviceName = self->_deviceName;
  if (deviceName)
  {
    objc_msgSend(v7, "encodeObject:forKey:", deviceName, CFSTR("dname"));
    v4 = v7;
  }

}

- (PCDeviceIdentifier)initWithCoder:(id)a3
{
  id v4;
  PCDeviceIdentifier *v5;
  id v6;
  PCDeviceIdentifier *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PCDeviceIdentifier;
  v5 = -[PCDeviceIdentifier init](&v9, sel_init);
  if (v5)
  {
    v6 = v4;
    if (objc_msgSend(v6, "containsValueForKey:", CFSTR("at")))
      v5->_assetType = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("at"));

    objc_opt_class();
    NSDecodeObjectIfPresent();
    v7 = v5;
  }

  return v5;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (int64_t)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(int64_t)a3
{
  self->_assetType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
