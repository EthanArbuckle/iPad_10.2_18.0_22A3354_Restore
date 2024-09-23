@implementation PRRemoteDevice

- (PRRemoteDevice)initWithBTAdvAddress:(id)a3
{
  id v6;
  PRRemoteDevice *v7;
  PRRemoteDevice *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (objc_msgSend(v6, "length") != 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRRemoteDevice.mm"), 22, CFSTR("btAdvAddress must be kBtAdvAddressByteLength bytes long."));

  }
  v11.receiver = self;
  v11.super_class = (Class)PRRemoteDevice;
  v7 = -[PRRemoteDevice init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_btAdvAddress, a3);
    v8->_deviceType = 4;
  }

  return v8;
}

- (PRRemoteDevice)initWithTestCompanionBtAdvAddress:(id)a3
{
  id v6;
  PRRemoteDevice *v7;
  PRRemoteDevice *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (objc_msgSend(v6, "length") != 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRRemoteDevice.mm"), 34, CFSTR("btAdvAddress must be kBtAdvAddressByteLength bytes long."));

  }
  v11.receiver = self;
  v11.super_class = (Class)PRRemoteDevice;
  v7 = -[PRRemoteDevice init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_btAdvAddress, a3);
    v8->_deviceType = 2;
  }

  return v8;
}

- (PRRemoteDevice)initWithCompanionUUID:(id)a3
{
  id v6;
  PRRemoteDevice *v7;
  PRRemoteDevice *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRRemoteDevice.mm"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PRRemoteDevice;
  v7 = -[PRRemoteDevice init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_UUID, a3);
    v8->_deviceType = 3;
  }

  return v8;
}

- (PRRemoteDevice)initWithBeaconUUID:(id)a3
{
  id v6;
  PRRemoteDevice *v7;
  PRRemoteDevice *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRRemoteDevice.mm"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PRRemoteDevice;
  v7 = -[PRRemoteDevice init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_UUID, a3);
    v8->_deviceType = 5;
  }

  return v8;
}

- (PRRemoteDevice)initWithRoseMACAddress:(id)a3
{
  id v6;
  PRRemoteDevice *v7;
  PRRemoteDevice *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (objc_msgSend(v6, "length") != 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRRemoteDevice.mm"), 70, CFSTR("roseMACAddress must be kRoseMacAddressLen bytes long."));

  }
  v11.receiver = self;
  v11.super_class = (Class)PRRemoteDevice;
  v7 = -[PRRemoteDevice init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_roseMACAddress, a3);
    v8->_deviceType = 1;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRRemoteDevice)initWithCoder:(id)a3
{
  id v4;
  PRRemoteDevice *v5;
  uint64_t v6;
  NSData *btAdvAddress;
  uint64_t v8;
  NSData *roseMACAddress;
  uint64_t v10;
  NSUUID *UUID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PRRemoteDevice;
  v5 = -[PRRemoteDevice init](&v13, sel_init);
  if (v5)
  {
    v5->_deviceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("deviceTypeKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("btAdvAddressKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    btAdvAddress = v5->_btAdvAddress;
    v5->_btAdvAddress = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("roseMACAddressKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    roseMACAddress = v5->_roseMACAddress;
    v5->_roseMACAddress = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUIDKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_deviceType, CFSTR("deviceTypeKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_btAdvAddress, CFSTR("btAdvAddressKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_roseMACAddress, CFSTR("roseMACAddressKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_UUID, CFSTR("UUIDKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PRRemoteDevice *v4;

  v4 = +[PRRemoteDevice allocWithZone:](PRRemoteDevice, "allocWithZone:", a3);
  -[PRRemoteDevice setDeviceType:](v4, "setDeviceType:", self->_deviceType);
  -[PRRemoteDevice setBtAdvAddress:](v4, "setBtAdvAddress:", self->_btAdvAddress);
  -[PRRemoteDevice setRoseMACAddress:](v4, "setRoseMACAddress:", self->_roseMACAddress);
  -[PRRemoteDevice setUUID:](v4, "setUUID:", self->_UUID);
  return v4;
}

- (id)description
{
  unint64_t deviceType;
  __CFString *v3;

  deviceType = self->_deviceType;
  if (deviceType > 5)
    v3 = 0;
  else
    v3 = off_1E3D04770[deviceType];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RemoteDevice. Type: %@, BT Adv Address: %@, Rose MAC Address: %@, Companion UUID: %@"), v3, self->_btAdvAddress, self->_roseMACAddress, self->_UUID);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)compareField:(id)a3 to:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  char v8;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 && v6)
    v8 = objc_msgSend((id)v6, "isEqual:", v5);
  else
    v8 = (v5 | v6) == 0;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "deviceType");
    v7 = -[PRRemoteDevice deviceType](self, "deviceType");
    objc_msgSend(v5, "btAdvAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRRemoteDevice btAdvAddress](self, "btAdvAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PRRemoteDevice compareField:to:](self, "compareField:to:", v8, v9);

    objc_msgSend(v5, "roseMACAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRRemoteDevice roseMACAddress](self, "roseMACAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PRRemoteDevice compareField:to:](self, "compareField:to:", v11, v12);

    objc_msgSend(v5, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRRemoteDevice UUID](self, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PRRemoteDevice compareField:to:](self, "compareField:to:", v14, v15);

    v17 = v6 == v7 && v10;
    v18 = v17 && v13 && v16;

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (NSData)btAdvAddress
{
  return self->_btAdvAddress;
}

- (void)setBtAdvAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)roseMACAddress
{
  return self->_roseMACAddress;
}

- (void)setRoseMACAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_roseMACAddress, 0);
  objc_storeStrong((id *)&self->_btAdvAddress, 0);
}

@end
