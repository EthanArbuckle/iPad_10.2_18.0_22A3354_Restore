@implementation ATXBluetoothDisconnectedTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 16;
}

- (ATXBluetoothDisconnectedTrigger)initWithDeviceIdentifier:(id)a3 deviceName:(id)a4
{
  id v7;
  id v8;
  ATXBluetoothDisconnectedTrigger *v9;
  ATXBluetoothDisconnectedTrigger *v10;
  ATXBluetoothDisconnectedTrigger *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ATXBluetoothDisconnectedTrigger;
  v9 = -[ATXBluetoothDisconnectedTrigger init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deviceIdentifier, a3);
    objc_storeStrong((id *)&v10->_deviceName, a4);
    v11 = v10;
  }

  return v10;
}

- (ATXBluetoothDisconnectedTrigger)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ATXBluetoothDisconnectedTrigger *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bluetoothDeviceIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bluetoothDeviceName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ATXBluetoothDisconnectedTrigger initWithDeviceIdentifier:deviceName:](self, "initWithDeviceIdentifier:deviceName:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *deviceIdentifier;
  id v5;

  deviceIdentifier = self->_deviceIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", deviceIdentifier, CFSTR("bluetoothDeviceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceName, CFSTR("bluetoothDeviceName"));

}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
