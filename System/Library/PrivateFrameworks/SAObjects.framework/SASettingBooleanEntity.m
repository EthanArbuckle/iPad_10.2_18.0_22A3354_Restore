@implementation SASettingBooleanEntity

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("BooleanEntity");
}

+ (id)BOOLeanEntity
{
  return objc_alloc_init((Class)a1);
}

+ (id)BOOLeanEntityWithValue:(BOOL)a3
{
  return -[SASettingBooleanEntity initWithValue:]([SASettingBooleanEntity alloc], "initWithValue:", a3);
}

- (SASettingBooleanEntity)initWithValue:(BOOL)a3
{
  _BOOL8 v3;
  SASettingBooleanEntity *v4;
  SASettingBooleanEntity *v5;

  v3 = a3;
  v4 = -[AceObject init](self, "init");
  v5 = v4;
  if (v4)
    -[SASettingBooleanEntity setValue:](v4, "setValue:", v3);
  return v5;
}

- (NSNumber)previousValue
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("previousValue"));
}

- (void)setPreviousValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("previousValue"), a3);
}

- (BOOL)value
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("value"));
}

- (void)setValue:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("value"), a3);
}

@end
