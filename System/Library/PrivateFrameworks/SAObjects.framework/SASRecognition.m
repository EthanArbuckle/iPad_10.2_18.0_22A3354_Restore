@implementation SASRecognition

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("Recognition");
}

+ (id)recognition
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)phrases
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("phrases"), v3);
}

- (void)setPhrases:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("phrases"), (uint64_t)a3);
}

- (int64_t)sentenceConfidence
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("sentenceConfidence"));
}

- (void)setSentenceConfidence:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("sentenceConfidence"), a3);
}

- (NSArray)utterances
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("utterances"), v3);
}

- (void)setUtterances:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("utterances"), (uint64_t)a3);
}

@end
