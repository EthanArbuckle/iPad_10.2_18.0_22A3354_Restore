@implementation SALocalSearchMapItemSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("MapItemSnippet");
}

- (BOOL)chainResultSet
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("chainResultSet"));
}

- (void)setChainResultSet:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("chainResultSet"), a3);
}

- (NSArray)items
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("items"), v3);
}

- (void)setItems:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("items"), (uint64_t)a3);
}

- (NSArray)providerCommand
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("providerCommand"), &unk_1EE77C568);
}

- (void)setProviderCommand:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("providerCommand"), (uint64_t)a3);
}

- (NSNumber)regionOfInterestRadiusInMiles
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("regionOfInterestRadiusInMiles"));
}

- (void)setRegionOfInterestRadiusInMiles:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("regionOfInterestRadiusInMiles"), a3);
}

- (NSString)responseViewId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("responseViewId"));
}

- (void)setResponseViewId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("responseViewId"), a3);
}

- (BOOL)searchAlongRoute
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("searchAlongRoute"));
}

- (void)setSearchAlongRoute:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("searchAlongRoute"), a3);
}

- (SALocation)searchRegionCenter
{
  return (SALocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("searchRegionCenter"));
}

- (void)setSearchRegionCenter:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("searchRegionCenter"), a3);
}

- (NSNumber)userCurrentLocation
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("userCurrentLocation"));
}

- (void)setUserCurrentLocation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("userCurrentLocation"), a3);
}

@end
