@implementation SATimerGetCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.timer");
}

- (id)encodedClassName
{
  return CFSTR("GetCompleted");
}

+ (id)getCompleted
{
  return objc_alloc_init((Class)a1);
}

- (SATimerObject)timer
{
  return (SATimerObject *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("timer"));
}

- (void)setTimer:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("timer"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
