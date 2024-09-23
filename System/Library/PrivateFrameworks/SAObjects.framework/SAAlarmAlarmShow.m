@implementation SAAlarmAlarmShow

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.alarm");
}

- (id)encodedClassName
{
  return CFSTR("AlarmShow");
}

+ (id)alarmShow
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)alarmIds
{
  return (NSArray *)AceObjectURLArrayForProperty(self, (uint64_t)CFSTR("alarmIds"));
}

- (void)setAlarmIds:(id)a3
{
  AceObjectSetURLArrayForProperty(self, CFSTR("alarmIds"), a3);
}

@end
