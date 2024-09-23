@implementation SAAlarmDelete

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.alarm");
}

- (id)encodedClassName
{
  return CFSTR("Delete");
}

- (NSArray)alarmIds
{
  return (NSArray *)AceObjectURLArrayForProperty(self, (uint64_t)CFSTR("alarmIds"));
}

- (void)setAlarmIds:(id)a3
{
  AceObjectSetURLArrayForProperty(self, CFSTR("alarmIds"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end
