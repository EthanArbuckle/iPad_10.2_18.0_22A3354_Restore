@implementation SAReminderDateTimeTrigger

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.reminder");
}

- (id)encodedClassName
{
  return CFSTR("DateTimeTrigger");
}

+ (id)dateTimeTrigger
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

- (SAReminderDateTimeTriggerOffset)offset
{
  return (SAReminderDateTimeTriggerOffset *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("offset"));
}

- (void)setOffset:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("offset"), a3);
}

- (SAReminderDateTimeTriggerOffset)relativeTimeOffset
{
  return (SAReminderDateTimeTriggerOffset *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("relativeTimeOffset"));
}

- (void)setRelativeTimeOffset:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("relativeTimeOffset"), a3);
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
