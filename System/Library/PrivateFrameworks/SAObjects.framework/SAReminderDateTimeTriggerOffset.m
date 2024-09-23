@implementation SAReminderDateTimeTriggerOffset

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.reminder");
}

- (id)encodedClassName
{
  return CFSTR("DateTimeTriggerOffset");
}

+ (id)dateTimeTriggerOffset
{
  return objc_alloc_init((Class)a1);
}

- (NSString)offsetTimeUnit
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("offsetTimeUnit"));
}

- (void)setOffsetTimeUnit:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("offsetTimeUnit"), a3);
}

- (NSNumber)offsetValue
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("offsetValue"));
}

- (void)setOffsetValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("offsetValue"), a3);
}

@end
