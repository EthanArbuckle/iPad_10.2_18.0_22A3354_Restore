@implementation SASUtterance

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("Utterance");
}

+ (id)utterance
{
  return objc_alloc_init((Class)a1);
}

- (double)confidenceScore
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("confidenceScore"));
}

- (void)setConfidenceScore:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("confidenceScore"), a3);
}

- (NSArray)interpretationIndices
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("interpretationIndices"));
}

- (void)setInterpretationIndices:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("interpretationIndices"), a3);
}

@end
