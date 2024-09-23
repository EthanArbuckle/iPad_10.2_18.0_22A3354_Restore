@implementation SARemotePlaybackDevice

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("RemotePlaybackDevice");
}

+ (id)remotePlaybackDevice
{
  return objc_alloc_init((Class)a1);
}

- (NSString)airPlayRouteId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("airPlayRouteId"));
}

- (void)setAirPlayRouteId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("airPlayRouteId"), a3);
}

- (NSString)entitlementKey
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("entitlementKey"));
}

- (void)setEntitlementKey:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("entitlementKey"), a3);
}

- (NSString)hashedRouteId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hashedRouteId"));
}

- (void)setHashedRouteId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hashedRouteId"), a3);
}

- (NSString)storefront
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("storefront"));
}

- (void)setStorefront:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("storefront"), a3);
}

- (NSString)userToken
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("userToken"));
}

- (void)setUserToken:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("userToken"), a3);
}

- (NSDictionary)utsRequiredRequestKeyValuePairs
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("utsRequiredRequestKeyValuePairs"));
}

- (void)setUtsRequiredRequestKeyValuePairs:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("utsRequiredRequestKeyValuePairs"), a3);
}

@end
