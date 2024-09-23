@implementation SACalendarEvent

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.calendar");
}

- (id)encodedClassName
{
  return CFSTR("Event");
}

+ (id)event
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)alerts
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("alerts"));
}

- (void)setAlerts:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("alerts"), a3);
}

- (BOOL)allDay
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("allDay"));
}

- (void)setAllDay:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("allDay"), a3);
}

- (NSArray)attendees
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("attendees"), v3);
}

- (void)setAttendees:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("attendees"), (uint64_t)a3);
}

- (NSURL)calendarId
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("calendarId"));
}

- (void)setCalendarId:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("calendarId"), a3);
}

- (NSURL)calendarPunchoutURI
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("calendarPunchoutURI"));
}

- (void)setCalendarPunchoutURI:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("calendarPunchoutURI"), a3);
}

- (NSDate)endDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("endDate"));
}

- (void)setEndDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("endDate"), a3);
}

- (NSNumber)includeRecurrences
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("includeRecurrences"));
}

- (void)setIncludeRecurrences:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("includeRecurrences"), a3);
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

- (NSNumber)readOnly
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("readOnly"));
}

- (void)setReadOnly:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("readOnly"), a3);
}

- (NSArray)recurrences
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("recurrences"), v3);
}

- (void)setRecurrences:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("recurrences"), (uint64_t)a3);
}

- (NSString)selfParticipantStatus
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("selfParticipantStatus"));
}

- (void)setSelfParticipantStatus:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("selfParticipantStatus"), a3);
}

- (NSDate)startDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("startDate"));
}

- (void)setStartDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("startDate"), a3);
}

- (NSString)status
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("status"));
}

- (void)setStatus:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("status"), a3);
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

@end
