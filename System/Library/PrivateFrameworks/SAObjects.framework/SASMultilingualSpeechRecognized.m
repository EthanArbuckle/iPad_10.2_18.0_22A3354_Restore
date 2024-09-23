@implementation SASMultilingualSpeechRecognized

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("MultilingualSpeechRecognized");
}

+ (id)multilingualSpeechRecognized
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)multilingualDisabled
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("multilingualDisabled"));
}

- (void)setMultilingualDisabled:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("multilingualDisabled"), a3);
}

- (NSDictionary)speechRecognizedByLanguage
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, (uint64_t)CFSTR("speechRecognizedByLanguage"), v3);
}

- (void)setSpeechRecognizedByLanguage:(id)a3
{
  AceObjectSetAceObjectDictionaryForProperty(self, CFSTR("speechRecognizedByLanguage"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
