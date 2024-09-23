@implementation SAFmfSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.fmf");
}

- (id)encodedClassName
{
  return CFSTR("Search");
}

+ (id)search
{
  return objc_alloc_init((Class)a1);
}

- (SALocation)currentLocation
{
  return (SALocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("currentLocation"));
}

- (void)setCurrentLocation:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("currentLocation"), a3);
}

- (NSArray)friends
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("friends"), v3);
}

- (void)setFriends:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("friends"), (uint64_t)a3);
}

- (NSString)proximity
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("proximity"));
}

- (void)setProximity:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("proximity"), a3);
}

- (SALocation)requestedLocation
{
  return (SALocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("requestedLocation"));
}

- (void)setRequestedLocation:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("requestedLocation"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
