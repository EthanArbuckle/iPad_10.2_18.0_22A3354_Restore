@implementation SATimerShowAndPerformTimerAction

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.timer");
}

- (id)encodedClassName
{
  return CFSTR("ShowAndPerformTimerAction");
}

+ (id)showAndPerformTimerAction
{
  return objc_alloc_init((Class)a1);
}

- (SATimerTimerAction)timerAction
{
  return (SATimerTimerAction *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("timerAction"));
}

- (void)setTimerAction:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("timerAction"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
