@implementation STUIDevice

- (STUIDevice)initWithName:(id)a3 identifier:(id)a4 coreDuetIdentifier:(id)a5 platform:(signed __int16)a6 hasDeviceActivity:(BOOL)a7 isLocalDevice:(BOOL)a8 lastFamilyCheckinDate:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  STUIDevice *v19;
  uint64_t v20;
  NSString *name;
  uint64_t v22;
  NSString *identifier;
  uint64_t v24;
  NSString *coreDuetIdentifier;
  objc_super v27;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)STUIDevice;
  v19 = -[STUIDevice init](&v27, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v15, "copy");
    name = v19->_name;
    v19->_name = (NSString *)v20;

    v22 = objc_msgSend(v16, "copy");
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v22;

    v24 = objc_msgSend(v17, "copy");
    coreDuetIdentifier = v19->_coreDuetIdentifier;
    v19->_coreDuetIdentifier = (NSString *)v24;

    v19->_platform = a6;
    objc_storeStrong((id *)&v19->_lastFamilyCheckinDate, a9);
    v19->_hasDeviceActivity = a7;
    v19->_isLocalDevice = a8;
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:identifier:coreDuetIdentifier:platform:hasDeviceActivity:isLocalDevice:lastFamilyCheckinDate:", self->_name, self->_identifier, self->_coreDuetIdentifier, self->_platform, self->_hasDeviceActivity, self->_isLocalDevice, self->_lastFamilyCheckinDate);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)coreDuetIdentifier
{
  return self->_coreDuetIdentifier;
}

- (signed)platform
{
  return self->_platform;
}

- (BOOL)isLocalDevice
{
  return self->_isLocalDevice;
}

- (BOOL)hasDeviceActivity
{
  return self->_hasDeviceActivity;
}

- (NSDate)lastFamilyCheckinDate
{
  return self->_lastFamilyCheckinDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFamilyCheckinDate, 0);
  objc_storeStrong((id *)&self->_coreDuetIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
