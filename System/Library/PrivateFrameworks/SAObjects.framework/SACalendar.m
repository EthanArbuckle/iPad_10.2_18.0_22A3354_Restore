@implementation SACalendar

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("Calendar");
}

+ (id)calendar
{
  return objc_alloc_init((Class)a1);
}

- (NSDate)date
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("date"));
}

- (void)setDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("date"), a3);
}

- (NSString)timeZoneId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timeZoneId"));
}

- (void)setTimeZoneId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timeZoneId"), a3);
}

@end
