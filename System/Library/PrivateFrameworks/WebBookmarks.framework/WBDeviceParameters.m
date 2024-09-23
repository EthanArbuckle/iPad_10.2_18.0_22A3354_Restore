@implementation WBDeviceParameters

+ (id)remoteDeviceWithTitle:(id)a3 deviceIdentifier:(id)a4
{
  id v5;
  id v6;
  WBDeviceParameters *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(WBDeviceParameters);
  -[WBDeviceParameters setRemoteDevice:](v7, "setRemoteDevice:", 1);
  -[WBDeviceParameters setTitle:](v7, "setTitle:", v6);

  -[WBDeviceParameters setDeviceIdentifier:](v7, "setDeviceIdentifier:", v5);
  return v7;
}

+ (id)localDeviceWithTitle:(id)a3 creationDeviceIdentifier:(id)a4 deviceIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  WBDeviceParameters *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(WBDeviceParameters);
  -[WBDeviceParameters setTitle:](v10, "setTitle:", v9);

  -[WBDeviceParameters setDeviceIdentifier:](v10, "setDeviceIdentifier:", v7);
  -[WBDeviceParameters setCreationDeviceIdentifier:](v10, "setCreationDeviceIdentifier:", v8);

  return v10;
}

- (NSString)creationDeviceIdentifier
{
  return self->_creationDeviceIdentifier;
}

- (void)setCreationDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)deviceTypeIdentifier
{
  return self->_deviceTypeIdentifier;
}

- (void)setDeviceTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isRemoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(BOOL)a3
{
  self->_remoteDevice = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_deviceTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDeviceIdentifier, 0);
}

@end
