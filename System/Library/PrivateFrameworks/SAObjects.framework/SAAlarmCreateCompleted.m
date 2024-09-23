@implementation SAAlarmCreateCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.alarm");
}

- (id)encodedClassName
{
  return CFSTR("CreateCompleted");
}

+ (id)createCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)alarmId
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("alarmId"));
}

- (void)setAlarmId:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("alarmId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
