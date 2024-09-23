@implementation SALocalSearchGetNavigationStatusCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("GetNavigationStatusCompleted");
}

+ (id)getNavigationStatusCompleted
{
  return objc_alloc_init((Class)a1);
}

- (SALocalSearchMapItem)destination
{
  return (SALocalSearchMapItem *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("destination"));
}

- (void)setDestination:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("destination"), a3);
}

- (SALocalSearchAceNavigationEta)nextManeuverEta
{
  return (SALocalSearchAceNavigationEta *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("nextManeuverEta"));
}

- (void)setNextManeuverEta:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("nextManeuverEta"), a3);
}

- (SALocalSearchAceNavigationEta)overallEta
{
  return (SALocalSearchAceNavigationEta *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("overallEta"));
}

- (void)setOverallEta:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("overallEta"), a3);
}

- (SALocalSearchMapItemList)predictedDestinations
{
  return (SALocalSearchMapItemList *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("predictedDestinations"));
}

- (void)setPredictedDestinations:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("predictedDestinations"), a3);
}

- (SALocalSearchRoute)route
{
  return (SALocalSearchRoute *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("route"));
}

- (void)setRoute:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("route"), a3);
}

- (NSString)trafficIncidentAlertType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("trafficIncidentAlertType"));
}

- (void)setTrafficIncidentAlertType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("trafficIncidentAlertType"), a3);
}

- (NSString)volume
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("volume"));
}

- (void)setVolume:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("volume"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
