@implementation SASPhrase

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("Phrase");
}

+ (id)phrase
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)interpretations
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("interpretations"), v3);
}

- (void)setInterpretations:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("interpretations"), (uint64_t)a3);
}

- (BOOL)lowConfidence
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("lowConfidence"));
}

- (void)setLowConfidence:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("lowConfidence"), a3);
}

- (BOOL)speechRepairApplied
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("speechRepairApplied"));
}

- (void)setSpeechRepairApplied:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("speechRepairApplied"), a3);
}

@end
