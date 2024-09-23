@implementation SASVoiceSearchResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("VoiceSearchResult");
}

+ (id)voiceSearchResult
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

- (NSData)result
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("result"));
}

- (void)setResult:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("result"), a3);
}

- (NSString)searchType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("searchType"));
}

- (void)setSearchType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("searchType"), a3);
}

- (NSNumber)statusCode
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("statusCode"));
}

- (void)setStatusCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("statusCode"), a3);
}

@end
