@implementation SAAlarmSleepAlarm

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.alarm");
}

- (id)encodedClassName
{
  return CFSTR("SleepAlarm");
}

- (NSNumber)bedtimeHour
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bedtimeHour"));
}

- (void)setBedtimeHour:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bedtimeHour"), a3);
}

- (NSNumber)bedtimeMinute
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bedtimeMinute"));
}

- (void)setBedtimeMinute:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bedtimeMinute"), a3);
}

- (NSNumber)isFiringNext
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("isFiringNext"));
}

- (void)setIsFiringNext:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("isFiringNext"), a3);
}

- (NSNumber)isOverride
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("isOverride"));
}

- (void)setIsOverride:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("isOverride"), a3);
}

@end
