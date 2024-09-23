@implementation SAGetDynamiteClientState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("GetDynamiteClientState");
}

+ (id)getDynamiteClientState
{
  return objc_alloc_init((Class)a1);
}

- (SADynamiteClientState)clientState
{
  return (SADynamiteClientState *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("clientState"));
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
