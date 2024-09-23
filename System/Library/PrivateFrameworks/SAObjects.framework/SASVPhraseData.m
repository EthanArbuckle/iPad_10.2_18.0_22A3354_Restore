@implementation SASVPhraseData

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.vector");
}

- (id)encodedClassName
{
  return CFSTR("PhraseData");
}

+ (id)phraseData
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)interpretationDataList
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("interpretationDataList"), v3);
}

- (void)setInterpretationDataList:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("interpretationDataList"), (uint64_t)a3);
}

@end
