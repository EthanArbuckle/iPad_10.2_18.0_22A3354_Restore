@implementation SATimerDismiss

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.timer");
}

- (id)encodedClassName
{
  return CFSTR("Dismiss");
}

+ (id)dismiss
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)timerIds
{
  return (NSArray *)AceObjectURLArrayForProperty(self, (uint64_t)CFSTR("timerIds"));
}

- (void)setTimerIds:(id)a3
{
  AceObjectSetURLArrayForProperty(self, CFSTR("timerIds"), a3);
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
