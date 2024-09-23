@implementation SASettingSetAirPlayRoute

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("SetAirPlayRoute");
}

+ (id)setAirPlayRoute
{
  return objc_alloc_init((Class)a1);
}

- (NSString)hashedRouteId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hashedRouteId"));
}

- (void)setHashedRouteId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hashedRouteId"), a3);
}

- (NSString)routeType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("routeType"));
}

- (void)setRouteType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("routeType"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
