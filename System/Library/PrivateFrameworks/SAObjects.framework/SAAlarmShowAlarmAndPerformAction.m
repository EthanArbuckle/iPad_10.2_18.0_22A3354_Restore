@implementation SAAlarmShowAlarmAndPerformAction

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.alarm");
}

- (id)encodedClassName
{
  return CFSTR("ShowAlarmAndPerformAction");
}

+ (id)showAlarmAndPerformAction
{
  return objc_alloc_init((Class)a1);
}

- (SAAlarmAlarmAction)alarmAction
{
  return (SAAlarmAlarmAction *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("alarmAction"));
}

- (void)setAlarmAction:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("alarmAction"), a3);
}

@end
