@implementation SAAlarmCreate

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.alarm");
}

- (id)encodedClassName
{
  return CFSTR("Create");
}

+ (id)create
{
  return objc_alloc_init((Class)a1);
}

- (SAAlarmObject)alarmToCreate
{
  return (SAAlarmObject *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("alarmToCreate"));
}

- (void)setAlarmToCreate:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("alarmToCreate"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
