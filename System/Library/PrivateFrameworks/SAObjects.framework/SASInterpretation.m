@implementation SASInterpretation

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("Interpretation");
}

+ (id)interpretation
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)doNotDedup
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("doNotDedup"));
}

- (void)setDoNotDedup:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("doNotDedup"), a3);
}

- (NSArray)tokens
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("tokens"), v3);
}

- (void)setTokens:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("tokens"), (uint64_t)a3);
}

@end
