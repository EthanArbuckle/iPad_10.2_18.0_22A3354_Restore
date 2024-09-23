@implementation SATTSFetchSpeechSynthesisVoiceRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("FetchSpeechSynthesisVoiceRequest");
}

+ (id)fetchSpeechSynthesisVoiceRequest
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)clientVoiceKeyList
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("clientVoiceKeyList"), v3);
}

- (void)setClientVoiceKeyList:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("clientVoiceKeyList"), (uint64_t)a3);
}

- (SATTSSpeechSynthesisVoice)filteredVoiceKey
{
  return (SATTSSpeechSynthesisVoice *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("filteredVoiceKey"));
}

- (void)setFilteredVoiceKey:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("filteredVoiceKey"), a3);
}

- (NSString)gender
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("gender"));
}

- (void)setGender:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("gender"), a3);
}

- (NSString)languageCode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("languageCode"));
}

- (void)setLanguageCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("languageCode"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
