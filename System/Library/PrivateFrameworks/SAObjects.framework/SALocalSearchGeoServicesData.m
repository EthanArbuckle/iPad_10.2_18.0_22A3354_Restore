@implementation SALocalSearchGeoServicesData

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("GeoServicesData");
}

+ (id)geoServicesData
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

- (NSData)clientMetadata
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("clientMetadata"));
}

- (void)setClientMetadata:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("clientMetadata"), a3);
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
