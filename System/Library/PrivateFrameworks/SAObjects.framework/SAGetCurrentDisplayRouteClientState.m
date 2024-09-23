@implementation SAGetCurrentDisplayRouteClientState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("GetCurrentDisplayRouteClientState");
}

+ (id)getCurrentDisplayRouteClientState
{
  return objc_alloc_init((Class)a1);
}

- (SACurrentDisplayRouteClientState)clientState
{
  return (SACurrentDisplayRouteClientState *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("clientState"));
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
