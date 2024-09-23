@implementation SASMultilingualDictationLanguageSelected

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("MultilingualDictationLanguageSelected");
}

+ (id)multilingualDictationLanguageSelected
{
  return objc_alloc_init((Class)a1);
}

- (NSDictionary)confidenceScoresByLanguage
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("confidenceScoresByLanguage"));
}

- (void)setConfidenceScoresByLanguage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("confidenceScoresByLanguage"), a3);
}

- (NSString)languageDetected
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("languageDetected"));
}

- (void)setLanguageDetected:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("languageDetected"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
