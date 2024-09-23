@implementation SAUIUnlockApp

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("UnlockApp");
}

- (NSString)appBundleId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appBundleId"));
}

- (void)setAppBundleId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appBundleId"), a3);
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
