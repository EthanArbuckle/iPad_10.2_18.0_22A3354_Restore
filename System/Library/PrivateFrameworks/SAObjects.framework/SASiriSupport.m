@implementation SASiriSupport

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SiriSupport");
}

+ (id)siriSupport
{
  return objc_alloc_init((Class)a1);
}

- (NSString)authToken
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("authToken"));
}

- (void)setAuthToken:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("authToken"), a3);
}

- (NSArray)endpoints
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("endpoints"), v3);
}

- (void)setEndpoints:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("endpoints"), (uint64_t)a3);
}

- (NSArray)useCases
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("useCases"));
}

- (void)setUseCases:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("useCases"), a3);
}

@end
