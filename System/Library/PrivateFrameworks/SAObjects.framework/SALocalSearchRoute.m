@implementation SALocalSearchRoute

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("Route");
}

+ (id)route
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)routeIncidentOffsets
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("routeIncidentOffsets"));
}

- (void)setRouteIncidentOffsets:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("routeIncidentOffsets"), a3);
}

- (NSArray)routeIncidents
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("routeIncidents"));
}

- (void)setRouteIncidents:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("routeIncidents"), a3);
}

- (NSData)routeTrafficIncident
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("routeTrafficIncident"));
}

- (void)setRouteTrafficIncident:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("routeTrafficIncident"), a3);
}

- (NSData)etaFilter
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("etaFilter"));
}

- (void)setEtaFilter:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("etaFilter"), a3);
}

- (NSData)evChargingMetadata
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("evChargingMetadata"));
}

- (void)setEvChargingMetadata:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("evChargingMetadata"), a3);
}

- (NSData)originalWaypointRoute
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("originalWaypointRoute"));
}

- (void)setOriginalWaypointRoute:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("originalWaypointRoute"), a3);
}

- (NSData)routeAsZilchBinary
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("routeAsZilchBinary"));
}

- (void)setRouteAsZilchBinary:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("routeAsZilchBinary"), a3);
}

- (NSData)routeId
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("routeId"));
}

- (void)setRouteId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("routeId"), a3);
}

- (NSData)sessionState
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sessionState"));
}

- (void)setSessionState:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sessionState"), a3);
}

@end
