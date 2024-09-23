@implementation CLTrackingAvoidanceAISFetchRecord

- (CLTrackingAvoidanceAISFetchRecord)initWithUUID:(id)a3 deviceType:(unint64_t)a4
{
  CLTrackingAvoidanceAISFetchRecord *v6;
  CLTrackingAvoidanceAISFetchRecord *v7;
  SEL v8;
  char v9;
  id v10;
  TAAccessoryInformation *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CLTrackingAvoidanceAISFetchRecord;
  v6 = -[CLTrackingAvoidanceAISFetchRecord init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    -[CLTrackingAvoidanceAISFetchRecord setIdentifier:](v6, "setIdentifier:", a3);
    v8 = NSSelectorFromString(&CFSTR("initWithDeviceUUID:deviceType:productData:manufacturerName: modelName:firmwareVersion:acc"
                                     "essoryCategory:accessoryCapabilities:serialNumber:protocolImplementation:networkID:"
                                     "batteryType:batteryLevel:").isa);
    v9 = objc_opt_respondsToSelector(TAAccessoryInformation, v8);
    v10 = objc_alloc((Class)TAAccessoryInformation);
    if ((v9 & 1) != 0)
      v11 = (TAAccessoryInformation *)objc_msgSend(v10, "initWithDeviceUUID:deviceType:productData:manufacturerName:modelName:firmwareVersion:accessoryCategory:accessoryCapabilities:serialNumber:protocolImplementation:networkID:batteryType:batteryLevel:", a3, a4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    else
      v11 = (TAAccessoryInformation *)objc_msgSend(v10, "initWithDeviceUUID:deviceType:productData:manufacturerName:modelName:firmwareVersion:accessoryCategory:accessoryCapabilities:", a3, a4, 0, 0, 0, 0, 0, 0);
    v7->_accessoryInfo = v11;
    v7->_fetchGroup = (OS_dispatch_group *)dispatch_group_create();
    v7->_allSuccess = 1;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_identifier = 0;
  self->_accessoryInfo = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLTrackingAvoidanceAISFetchRecord;
  -[CLTrackingAvoidanceAISFetchRecord dealloc](&v3, "dealloc");
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (TAAccessoryInformation)accessoryInfo
{
  return self->_accessoryInfo;
}

- (void)setAccessoryInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)timoutBlock
{
  return self->_timoutBlock;
}

- (void)setTimoutBlock:(id)a3
{
  self->_timoutBlock = a3;
}

- (OS_dispatch_group)fetchGroup
{
  return self->_fetchGroup;
}

- (BOOL)allSuccess
{
  return self->_allSuccess;
}

- (void)setAllSuccess:(BOOL)a3
{
  self->_allSuccess = a3;
}

@end
