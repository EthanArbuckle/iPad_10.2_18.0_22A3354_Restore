@implementation SAEndpoint

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("Endpoint");
}

+ (id)endpoint
{
  return objc_alloc_init((Class)a1);
}

- (NSDictionary)operations
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, (uint64_t)CFSTR("operations"), v3);
}

- (void)setOperations:(id)a3
{
  AceObjectSetAceObjectDictionaryForProperty(self, CFSTR("operations"), (uint64_t)a3);
}

- (NSString)providerId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("providerId"));
}

- (void)setProviderId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("providerId"), a3);
}

- (BOOL)supportsAuthentication
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("supportsAuthentication"));
}

- (void)setSupportsAuthentication:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("supportsAuthentication"), a3);
}

@end
