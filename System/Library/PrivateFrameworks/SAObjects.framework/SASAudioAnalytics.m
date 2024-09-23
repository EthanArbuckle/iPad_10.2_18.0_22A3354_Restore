@implementation SASAudioAnalytics

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("AudioAnalytics");
}

+ (id)audioAnalytics
{
  return objc_alloc_init((Class)a1);
}

- (NSDictionary)acousticFeatures
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, (uint64_t)CFSTR("acousticFeatures"), v3);
}

- (void)setAcousticFeatures:(id)a3
{
  AceObjectSetAceObjectDictionaryForProperty(self, CFSTR("acousticFeatures"), (uint64_t)a3);
}

- (NSDictionary)speechRecognitionFeatures
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speechRecognitionFeatures"));
}

- (void)setSpeechRecognitionFeatures:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speechRecognitionFeatures"), a3);
}

@end
