@implementation SAMPGetStateResponseRemote

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("GetStateResponseRemote");
}

+ (id)getStateResponseRemote
{
  return objc_alloc_init((Class)a1);
}

- (SAMPGetState)getState
{
  return (SAMPGetState *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("getState"));
}

- (void)setGetState:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("getState"), a3);
}

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hashedRouteUIDs"));
}

- (void)setHashedRouteUIDs:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hashedRouteUIDs"), a3);
}

- (double)routeTimeout
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("routeTimeout"));
}

- (void)setRouteTimeout:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("routeTimeout"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
