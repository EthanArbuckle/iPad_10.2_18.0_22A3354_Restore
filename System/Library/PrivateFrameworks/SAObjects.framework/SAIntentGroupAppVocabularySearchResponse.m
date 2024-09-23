@implementation SAIntentGroupAppVocabularySearchResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("AppVocabularySearchResponse");
}

+ (id)appVocabularySearchResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)vocabularyStrings
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("vocabularyStrings"));
}

- (void)setVocabularyStrings:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("vocabularyStrings"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
