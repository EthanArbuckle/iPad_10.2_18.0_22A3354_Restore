@implementation SASStartVoiceSearchRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("StartVoiceSearchRequest");
}

+ (id)startVoiceSearchRequest
{
  return objc_alloc_init((Class)a1);
}

- (NSDictionary)headers
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("headers"));
}

- (void)setHeaders:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("headers"), a3);
}

- (NSDictionary)queryParameters
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("queryParameters"));
}

- (void)setQueryParameters:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("queryParameters"), a3);
}

- (NSArray)searchTypes
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("searchTypes"));
}

- (void)setSearchTypes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("searchTypes"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
