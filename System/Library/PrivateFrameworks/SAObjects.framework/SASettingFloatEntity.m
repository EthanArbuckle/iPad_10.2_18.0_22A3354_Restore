@implementation SASettingFloatEntity

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("FloatEntity");
}

+ (id)floatEntity
{
  return objc_alloc_init((Class)a1);
}

+ (id)floatEntityWithValue:(float)a3
{
  SASettingFloatEntity *v4;
  double v5;

  v4 = [SASettingFloatEntity alloc];
  *(float *)&v5 = a3;
  return -[SASettingFloatEntity initWithValue:](v4, "initWithValue:", v5);
}

- (SASettingFloatEntity)initWithValue:(float)a3
{
  SASettingFloatEntity *v4;
  double v5;
  SASettingFloatEntity *v6;

  v4 = -[AceObject init](self, "init");
  v6 = v4;
  if (v4)
  {
    *(float *)&v5 = a3;
    -[SASettingFloatEntity setValue:](v4, "setValue:", v5);
  }
  return v6;
}

- (NSNumber)previousValue
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("previousValue"));
}

- (void)setPreviousValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("previousValue"), a3);
}

- (float)value
{
  return AceObjectFloatForProperty(self, (uint64_t)CFSTR("value"));
}

- (void)setValue:(float)a3
{
  AceObjectSetFloatForProperty(self, CFSTR("value"), a3);
}

@end
