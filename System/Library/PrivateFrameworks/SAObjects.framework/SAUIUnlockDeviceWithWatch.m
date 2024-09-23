@implementation SAUIUnlockDeviceWithWatch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("UnlockDeviceWithWatch");
}

- (NSArray)failureCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("failureCommands"), &unk_1EE77C568);
}

- (void)setFailureCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("failureCommands"), (uint64_t)a3);
}

- (NSArray)successCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("successCommands"), &unk_1EE77C568);
}

- (void)setSuccessCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("successCommands"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
