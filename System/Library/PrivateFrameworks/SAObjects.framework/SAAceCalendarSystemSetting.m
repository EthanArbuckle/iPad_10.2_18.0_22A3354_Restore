@implementation SAAceCalendarSystemSetting

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("AceCalendarSystemSetting");
}

+ (id)aceCalendarSystemSetting
{
  return objc_alloc_init((Class)a1);
}

- (NSString)calendarType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("calendarType"));
}

- (void)setCalendarType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("calendarType"), a3);
}

@end
