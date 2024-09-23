@implementation CLDuetHomeKitAccessory

- (CLDuetHomeKitAccessory)initWithHomeUUID:(id)a3 accessoryUUID:(id)a4 accessoryName:(id)a5 serviceName:(id)a6 serviceType:(id)a7 characteristicType:(id)a8 clientName:(id)a9 source:(id)a10 serviceUUID:(id)a11 triggerLocalizationScan:(id)a12 triggerRecordingScan:(id)a13
{
  CLDuetHomeKitAccessory *v19;
  CLDuetHomeKitAccessory *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CLDuetHomeKitAccessory;
  v19 = -[CLDuetHomeKitAccessory init](&v22, "init");
  v20 = v19;
  if (v19)
  {
    -[CLDuetHomeKitAccessory setHomeUUID:](v19, "setHomeUUID:", a3);
    -[CLDuetHomeKitAccessory setAccessoryUUID:](v20, "setAccessoryUUID:", a4);
    -[CLDuetHomeKitAccessory setAccessoryName:](v20, "setAccessoryName:", a5);
    -[CLDuetHomeKitAccessory setServiceName:](v20, "setServiceName:", a6);
    -[CLDuetHomeKitAccessory setServiceType:](v20, "setServiceType:", a7);
    -[CLDuetHomeKitAccessory setCharacteristicType:](v20, "setCharacteristicType:", a8);
    -[CLDuetHomeKitAccessory setClientName:](v20, "setClientName:", a9);
    -[CLDuetHomeKitAccessory setSource:](v20, "setSource:", a10);
    -[CLDuetHomeKitAccessory setServiceUUID:](v20, "setServiceUUID:", a11);
    -[CLDuetHomeKitAccessory setTriggerLocalizationScan:](v20, "setTriggerLocalizationScan:", a12);
    -[CLDuetHomeKitAccessory setTriggerRecordingScan:](v20, "setTriggerRecordingScan:", a13);
  }
  return v20;
}

- (void)dealloc
{
  objc_super v3;

  -[CLDuetHomeKitAccessory setHomeUUID:](self, "setHomeUUID:", 0);
  -[CLDuetHomeKitAccessory setAccessoryUUID:](self, "setAccessoryUUID:", 0);
  -[CLDuetHomeKitAccessory setAccessoryName:](self, "setAccessoryName:", 0);
  -[CLDuetHomeKitAccessory setServiceName:](self, "setServiceName:", 0);
  -[CLDuetHomeKitAccessory setServiceType:](self, "setServiceType:", 0);
  -[CLDuetHomeKitAccessory setCharacteristicType:](self, "setCharacteristicType:", 0);
  -[CLDuetHomeKitAccessory setClientName:](self, "setClientName:", 0);
  -[CLDuetHomeKitAccessory setSource:](self, "setSource:", 0);
  -[CLDuetHomeKitAccessory setServiceUUID:](self, "setServiceUUID:", 0);
  -[CLDuetHomeKitAccessory setTriggerLocalizationScan:](self, "setTriggerLocalizationScan:", 0);
  -[CLDuetHomeKitAccessory setTriggerRecordingScan:](self, "setTriggerRecordingScan:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CLDuetHomeKitAccessory;
  -[CLDuetHomeKitAccessory dealloc](&v3, "dealloc");
}

- (NSString)homeUUID
{
  return self->_homeUUID;
}

- (void)setHomeUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)accessoryUUID
{
  return self->_accessoryUUID;
}

- (void)setAccessoryUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (void)setCharacteristicType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSString)serviceUUID
{
  return self->_serviceUUID;
}

- (void)setServiceUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSNumber)triggerLocalizationScan
{
  return self->_triggerLocalizationScan;
}

- (void)setTriggerLocalizationScan:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)triggerRecordingScan
{
  return self->_triggerRecordingScan;
}

- (void)setTriggerRecordingScan:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
