@implementation SASetWristDetectionStatusClientState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SetWristDetectionStatusClientState");
}

+ (id)setWristDetectionStatusClientState
{
  return objc_alloc_init((Class)a1);
}

- (SAWristDetectionStatusClientState)clientState
{
  return (SAWristDetectionStatusClientState *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("clientState"));
}

- (void)setClientState:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("clientState"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
