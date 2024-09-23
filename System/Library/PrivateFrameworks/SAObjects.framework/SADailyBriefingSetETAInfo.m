@implementation SADailyBriefingSetETAInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.dailybriefing");
}

- (id)encodedClassName
{
  return CFSTR("SetETAInfo");
}

- (NSString)destination
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("destination"));
}

- (void)setDestination:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("destination"), a3);
}

- (double)eta
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("eta"));
}

- (void)setEta:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("eta"), a3);
}

- (NSString)transportType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("transportType"));
}

- (void)setTransportType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("transportType"), a3);
}

- (NSString)viaRoute
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("viaRoute"));
}

- (void)setViaRoute:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("viaRoute"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
