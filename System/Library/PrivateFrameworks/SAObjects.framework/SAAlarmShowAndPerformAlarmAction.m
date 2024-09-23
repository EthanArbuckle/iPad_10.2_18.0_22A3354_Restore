@implementation SAAlarmShowAndPerformAlarmAction

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.alarm");
}

- (id)encodedClassName
{
  return CFSTR("ShowAndPerformAlarmAction");
}

+ (id)showAndPerformAlarmAction
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

- (BOOL)requiresResponse
{
  return 0;
}

@end
