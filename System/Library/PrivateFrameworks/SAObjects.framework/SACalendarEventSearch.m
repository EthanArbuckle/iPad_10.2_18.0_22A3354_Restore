@implementation SACalendarEventSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.calendar");
}

- (id)encodedClassName
{
  return CFSTR("EventSearch");
}

+ (id)eventSearch
{
  return objc_alloc_init((Class)a1);
}

- (NSDate)endDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("endDate"));
}

- (void)setEndDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("endDate"), a3);
}

- (NSNumber)limit
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("limit"));
}

- (void)setLimit:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("limit"), a3);
}

- (NSString)location
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("location"));
}

- (void)setLocation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("location"), a3);
}

- (NSString)notes
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("notes"));
}

- (void)setNotes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("notes"), a3);
}

- (NSArray)participants
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("participants"));
}

- (void)setParticipants:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("participants"), a3);
}

- (NSDate)startDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("startDate"));
}

- (void)setStartDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("startDate"), a3);
}

- (NSString)timeZoneId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timeZoneId"));
}

- (void)setTimeZoneId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timeZoneId"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
