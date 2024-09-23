@implementation SAReminderSnooze

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.reminder");
}

- (id)encodedClassName
{
  return CFSTR("Snooze");
}

+ (id)snooze
{
  return objc_alloc_init((Class)a1);
}

- (SAReminderDateTimeTriggerOffset)offset
{
  return (SAReminderDateTimeTriggerOffset *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("offset"));
}

- (void)setOffset:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("offset"), a3);
}

- (NSArray)reminderIdentifierList
{
  return (NSArray *)AceObjectURLArrayForProperty(self, (uint64_t)CFSTR("reminderIdentifierList"));
}

- (void)setReminderIdentifierList:(id)a3
{
  AceObjectSetURLArrayForProperty(self, CFSTR("reminderIdentifierList"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
