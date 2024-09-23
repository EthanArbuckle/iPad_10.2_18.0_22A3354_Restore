@implementation SAGetClientFlowState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("GetClientFlowState");
}

+ (id)getClientFlowState
{
  return objc_alloc_init((Class)a1);
}

- (SAClientFlowState)clientState
{
  return (SAClientFlowState *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("clientState"));
}

- (void)setClientState:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("clientState"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
