@implementation SALocalSearchStartNavigation

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("StartNavigation");
}

+ (id)startNavigation
{
  return objc_alloc_init((Class)a1);
}

- (SALocation)destination
{
  return (SALocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("destination"));
}

- (void)setDestination:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("destination"), a3);
}

- (NSString)directionsType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("directionsType"));
}

- (void)setDirectionsType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("directionsType"), a3);
}

- (SALocation)origin
{
  return (SALocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("origin"));
}

- (void)setOrigin:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("origin"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
