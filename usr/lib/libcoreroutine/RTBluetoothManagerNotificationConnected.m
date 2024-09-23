@implementation RTBluetoothManagerNotificationConnected

- (RTBluetoothManagerNotificationConnected)initWithDeviceName:(id)a3 andDeviceAddress:(id)a4
{
  id v7;
  id v8;
  RTBluetoothManagerNotificationConnected *v9;
  RTBluetoothManagerNotificationConnected *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RTBluetoothManagerNotificationConnected;
  v9 = -[RTNotification init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deviceName, a3);
    objc_storeStrong((id *)&v10->_deviceAddress, a4);
  }

  return v10;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)deviceAddress
{
  return self->_deviceAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAddress, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
