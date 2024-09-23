@implementation SALocalSearchGetGeoClientState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("GetGeoClientState");
}

+ (id)getGeoClientState
{
  return objc_alloc_init((Class)a1);
}

- (SALocalSearchGeoClientState)clientState
{
  return (SALocalSearchGeoClientState *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("clientState"));
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
