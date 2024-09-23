@implementation SARestaurantRestaurantsSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.restaurant");
}

- (id)encodedClassName
{
  return CFSTR("RestaurantsSnippet");
}

+ (id)restaurantsSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)attributionOrder
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("attributionOrder"));
}

- (void)setAttributionOrder:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("attributionOrder"), a3);
}

- (NSArray)contributingProviderIds
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("contributingProviderIds"));
}

- (void)setContributingProviderIds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("contributingProviderIds"), a3);
}

- (NSDictionary)providerPunchOutMap
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, (uint64_t)CFSTR("providerPunchOutMap"), v3);
}

- (void)setProviderPunchOutMap:(id)a3
{
  AceObjectSetAceObjectDictionaryForProperty(self, CFSTR("providerPunchOutMap"), (uint64_t)a3);
}

- (NSArray)restaurants
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("restaurants"), v3);
}

- (void)setRestaurants:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("restaurants"), (uint64_t)a3);
}

@end
