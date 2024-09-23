@implementation SASyncSiriKitAppVocabulary

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("SiriKitAppVocabulary");
}

- (NSString)bundleId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bundleId"));
}

- (void)setBundleId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bundleId"), a3);
}

- (NSDictionary)customVocabularyMap
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassArrayDictionaryForProperty(self, (uint64_t)CFSTR("customVocabularyMap"), v3);
}

- (void)setCustomVocabularyMap:(id)a3
{
  AceObjectSetAceObjectArrayDictionaryForProperty(self, CFSTR("customVocabularyMap"), a3);
}

@end
