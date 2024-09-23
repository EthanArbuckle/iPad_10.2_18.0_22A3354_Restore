@implementation SAIntentGroupAppVocabularySearchRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("AppVocabularySearchRequest");
}

+ (id)appVocabularySearchRequest
{
  return objc_alloc_init((Class)a1);
}

- (NSString)appBundleId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appBundleId"));
}

- (void)setAppBundleId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appBundleId"), a3);
}

- (NSString)appVocabularyType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appVocabularyType"));
}

- (void)setAppVocabularyType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appVocabularyType"), a3);
}

- (NSString)query
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("query"));
}

- (void)setQuery:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("query"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
