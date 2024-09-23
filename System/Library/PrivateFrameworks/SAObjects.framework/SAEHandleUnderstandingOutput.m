@implementation SAEHandleUnderstandingOutput

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.execution");
}

- (id)encodedClassName
{
  return CFSTR("HandleUnderstandingOutput");
}

- (NSArray)policyActionList
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("policyActionList"), v3);
}

- (void)setPolicyActionList:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("policyActionList"), (uint64_t)a3);
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
