@implementation SAAlarmObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.alarm");
}

- (id)encodedClassName
{
  return CFSTR("Object");
}

+ (id)object
{
  return objc_alloc_init((Class)a1);
}

- (SADataSourceInfo)dataSourceInfo
{
  return (SADataSourceInfo *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("dataSourceInfo"));
}

- (void)setDataSourceInfo:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("dataSourceInfo"), a3);
}

- (NSNumber)enabled
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("enabled"));
}

- (void)setEnabled:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("enabled"), a3);
}

- (NSNumber)firing
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("firing"));
}

- (void)setFiring:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("firing"), a3);
}

- (NSArray)frequency
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("frequency"));
}

- (void)setFrequency:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("frequency"), a3);
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

- (NSNumber)relativeOffsetMinutes
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("relativeOffsetMinutes"));
}

- (void)setRelativeOffsetMinutes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("relativeOffsetMinutes"), a3);
}

@end
