@implementation SALocalSearchSetGeoClientState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("SetGeoClientState");
}

+ (id)setGeoClientState
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
  return 0;
}

@end
