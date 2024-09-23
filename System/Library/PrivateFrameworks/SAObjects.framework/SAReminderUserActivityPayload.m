@implementation SAReminderUserActivityPayload

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.reminder");
}

- (id)encodedClassName
{
  return CFSTR("UserActivityPayload");
}

+ (id)userActivityPayload
{
  return objc_alloc_init((Class)a1);
}

- (SAUserActivity)userActivity
{
  return (SAUserActivity *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("userActivity"));
}

- (void)setUserActivity:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("userActivity"), a3);
}

@end
