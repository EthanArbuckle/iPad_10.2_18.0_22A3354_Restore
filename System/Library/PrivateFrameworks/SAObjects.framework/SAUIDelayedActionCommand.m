@implementation SAUIDelayedActionCommand

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("DelayedActionCommand");
}

+ (id)delayedActionCommand
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("commands"), &unk_1EE77C568);
}

- (void)setCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("commands"), (uint64_t)a3);
}

- (NSNumber)timerValue
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timerValue"));
}

- (void)setTimerValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timerValue"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
