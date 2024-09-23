@implementation SAAlarmUpdate

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.alarm");
}

- (id)encodedClassName
{
  return CFSTR("Update");
}

+ (id)update
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)addedFrequency
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("addedFrequency"));
}

- (void)setAddedFrequency:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("addedFrequency"), a3);
}

- (NSURL)alarmId
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("alarmId"));
}

- (void)setAlarmId:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("alarmId"), a3);
}

- (NSNumber)enabled
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("enabled"));
}

- (void)setEnabled:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("enabled"), a3);
}

- (NSNumber)hour
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hour"));
}

- (void)setHour:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hour"), a3);
}

- (NSString)label
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("label"));
}

- (void)setLabel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("label"), a3);
}

- (NSNumber)minute
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("minute"));
}

- (void)setMinute:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("minute"), a3);
}

- (NSArray)modifications
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("modifications"), v3);
}

- (void)setModifications:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("modifications"), (uint64_t)a3);
}

- (NSArray)removedFrequency
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("removedFrequency"));
}

- (void)setRemovedFrequency:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("removedFrequency"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
