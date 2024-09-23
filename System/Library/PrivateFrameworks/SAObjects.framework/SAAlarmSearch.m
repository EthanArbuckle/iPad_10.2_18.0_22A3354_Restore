@implementation SAAlarmSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.alarm");
}

- (id)encodedClassName
{
  return CFSTR("Search");
}

+ (id)search
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)enabled
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("enabled"));
}

- (void)setEnabled:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("enabled"), a3);
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

- (NSURL)identifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("identifier"));
}

- (void)setIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("identifier"), a3);
}

- (NSNumber)includesSleepAlarms
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("includesSleepAlarms"));
}

- (void)setIncludesSleepAlarms:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("includesSleepAlarms"), a3);
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

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
