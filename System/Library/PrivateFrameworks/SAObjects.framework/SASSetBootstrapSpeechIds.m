@implementation SASSetBootstrapSpeechIds

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("SetBootstrapSpeechIds");
}

+ (id)setBootstrapSpeechIds
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)bootstrapSpeechIdMetadata
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("bootstrapSpeechIdMetadata"), v3);
}

- (void)setBootstrapSpeechIdMetadata:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("bootstrapSpeechIdMetadata"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
