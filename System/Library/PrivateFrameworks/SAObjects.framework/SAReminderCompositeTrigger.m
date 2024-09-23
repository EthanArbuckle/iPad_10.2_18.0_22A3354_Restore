@implementation SAReminderCompositeTrigger

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.reminder");
}

- (id)encodedClassName
{
  return CFSTR("CompositeTrigger");
}

+ (id)compositeTrigger
{
  return objc_alloc_init((Class)a1);
}

- (SAReminderDateTimeTrigger)dateTimeTrigger
{
  return (SAReminderDateTimeTrigger *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("dateTimeTrigger"));
}

- (void)setDateTimeTrigger:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("dateTimeTrigger"), a3);
}

- (SAReminderLocationTrigger)locationTrigger
{
  return (SAReminderLocationTrigger *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("locationTrigger"));
}

- (void)setLocationTrigger:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("locationTrigger"), a3);
}

@end
