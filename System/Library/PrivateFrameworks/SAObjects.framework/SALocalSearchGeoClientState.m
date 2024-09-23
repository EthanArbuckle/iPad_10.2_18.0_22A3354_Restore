@implementation SALocalSearchGeoClientState

+ (id)deliveryDeadline
{
  return CFSTR("SYNC");
}

+ (id)persistencePolicy
{
  return CFSTR("LIFE_OF_USER_DATA");
}

+ (id)syncKey
{
  return CFSTR("com.apple.siri.client.state.GeoClientState");
}

+ (id)uniqueObjectIdentifier
{
  return CFSTR("ClientState://GeoClientState");
}

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("GeoClientState");
}

+ (id)geoClientState
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)additionalEnabledTransitMarkets
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("additionalEnabledTransitMarkets"));
}

- (void)setAdditionalEnabledTransitMarkets:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("additionalEnabledTransitMarkets"), a3);
}

- (NSString)environment
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("environment"));
}

- (void)setEnvironment:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("environment"), a3);
}

@end
