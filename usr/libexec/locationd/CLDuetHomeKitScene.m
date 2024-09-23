@implementation CLDuetHomeKitScene

- (CLDuetHomeKitScene)initWithHomeUUID:(id)a3 actionSetUUID:(id)a4 actionSetName:(id)a5 actionSetType:(id)a6 clientName:(id)a7 source:(id)a8 triggerLocalizationScan:(id)a9 triggerRecordingScan:(id)a10
{
  CLDuetHomeKitScene *v16;
  CLDuetHomeKitScene *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CLDuetHomeKitScene;
  v16 = -[CLDuetHomeKitScene init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    -[CLDuetHomeKitScene setHomeUUID:](v16, "setHomeUUID:", a3);
    -[CLDuetHomeKitScene setActionSetUUID:](v17, "setActionSetUUID:", a4);
    -[CLDuetHomeKitScene setActionSetName:](v17, "setActionSetName:", a5);
    -[CLDuetHomeKitScene setActionSetType:](v17, "setActionSetType:", a6);
    -[CLDuetHomeKitScene setClientName:](v17, "setClientName:", a7);
    -[CLDuetHomeKitScene setSource:](v17, "setSource:", a8);
    -[CLDuetHomeKitScene setTriggerLocalizationScan:](v17, "setTriggerLocalizationScan:", a9);
    -[CLDuetHomeKitScene setTriggerRecordingScan:](v17, "setTriggerRecordingScan:", a10);
  }
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[CLDuetHomeKitScene setHomeUUID:](self, "setHomeUUID:", 0);
  -[CLDuetHomeKitScene setActionSetUUID:](self, "setActionSetUUID:", 0);
  -[CLDuetHomeKitScene setActionSetName:](self, "setActionSetName:", 0);
  -[CLDuetHomeKitScene setActionSetType:](self, "setActionSetType:", 0);
  -[CLDuetHomeKitScene setClientName:](self, "setClientName:", 0);
  -[CLDuetHomeKitScene setSource:](self, "setSource:", 0);
  -[CLDuetHomeKitScene setTriggerLocalizationScan:](self, "setTriggerLocalizationScan:", 0);
  -[CLDuetHomeKitScene setTriggerRecordingScan:](self, "setTriggerRecordingScan:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CLDuetHomeKitScene;
  -[CLDuetHomeKitScene dealloc](&v3, "dealloc");
}

- (NSString)homeUUID
{
  return self->_homeUUID;
}

- (void)setHomeUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)actionSetUUID
{
  return self->_actionSetUUID;
}

- (void)setActionSetUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)actionSetName
{
  return self->_actionSetName;
}

- (void)setActionSetName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)actionSetType
{
  return self->_actionSetType;
}

- (void)setActionSetType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSNumber)triggerLocalizationScan
{
  return self->_triggerLocalizationScan;
}

- (void)setTriggerLocalizationScan:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSNumber)triggerRecordingScan
{
  return self->_triggerRecordingScan;
}

- (void)setTriggerRecordingScan:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
