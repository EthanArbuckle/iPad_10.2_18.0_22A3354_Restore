@implementation SACalendarEventSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.calendar");
}

- (id)encodedClassName
{
  return CFSTR("EventSnippet");
}

+ (id)eventSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)events
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("events"), v3);
}

- (void)setEvents:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("events"), (uint64_t)a3);
}

- (NSDate)snippetEndDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("snippetEndDate"));
}

- (void)setSnippetEndDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("snippetEndDate"), a3);
}

- (NSDate)snippetStartDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("snippetStartDate"));
}

- (void)setSnippetStartDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("snippetStartDate"), a3);
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
