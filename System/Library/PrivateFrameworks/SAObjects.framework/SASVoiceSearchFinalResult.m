@implementation SASVoiceSearchFinalResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("VoiceSearchFinalResult");
}

+ (id)voiceSearchFinalResult
{
  return objc_alloc_init((Class)a1);
}

- (NSString)recognitionText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("recognitionText"));
}

- (void)setRecognitionText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("recognitionText"), a3);
}

- (NSArray)voiceSearchResults
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("voiceSearchResults"), v3);
}

- (void)setVoiceSearchResults:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("voiceSearchResults"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
