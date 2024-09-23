@implementation SALocalSearchShowMapPoints

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("ShowMapPoints");
}

+ (id)showMapPoints
{
  return objc_alloc_init((Class)a1);
}

- (NSDate)arrivalDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("arrivalDate"));
}

- (void)setArrivalDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("arrivalDate"), a3);
}

- (SALocalSearchCarRouteOptions)carRouteOptions
{
  return (SALocalSearchCarRouteOptions *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("carRouteOptions"));
}

- (void)setCarRouteOptions:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("carRouteOptions"), a3);
}

- (BOOL)chainResultSet
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("chainResultSet"));
}

- (void)setChainResultSet:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("chainResultSet"), a3);
}

- (NSDate)departureDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("departureDate"));
}

- (void)setDepartureDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("departureDate"), a3);
}

- (NSString)directionsType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("directionsType"));
}

- (void)setDirectionsType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("directionsType"), a3);
}

- (SALocalSearchMapItem)itemDestination
{
  return (SALocalSearchMapItem *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("itemDestination"));
}

- (void)setItemDestination:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("itemDestination"), a3);
}

- (SALocalSearchMapItem)itemSource
{
  return (SALocalSearchMapItem *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("itemSource"));
}

- (void)setItemSource:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("itemSource"), a3);
}

- (NSString)language
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("language"));
}

- (void)setLanguage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("language"), a3);
}

- (NSString)preferredDirectionsMode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("preferredDirectionsMode"));
}

- (void)setPreferredDirectionsMode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("preferredDirectionsMode"), a3);
}

- (NSNumber)regionOfInterestRadiusInMiles
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("regionOfInterestRadiusInMiles"));
}

- (void)setRegionOfInterestRadiusInMiles:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("regionOfInterestRadiusInMiles"), a3);
}

- (BOOL)searchAlongRoute
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("searchAlongRoute"));
}

- (void)setSearchAlongRoute:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("searchAlongRoute"), a3);
}

- (SALocalSearchMapItemList)searchItems
{
  return (SALocalSearchMapItemList *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("searchItems"));
}

- (void)setSearchItems:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("searchItems"), a3);
}

- (BOOL)showDirections
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("showDirections"));
}

- (void)setShowDirections:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("showDirections"), a3);
}

- (BOOL)showTraffic
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("showTraffic"));
}

- (void)setShowTraffic:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("showTraffic"), a3);
}

- (BOOL)suppressNavigation
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("suppressNavigation"));
}

- (void)setSuppressNavigation:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("suppressNavigation"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
