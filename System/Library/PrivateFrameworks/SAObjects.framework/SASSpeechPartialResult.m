@implementation SASSpeechPartialResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("SpeechPartialResult");
}

+ (id)speechPartialResult
{
  return objc_alloc_init((Class)a1);
}

- (NSString)language
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("language"));
}

- (void)setLanguage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("language"), a3);
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

- (BOOL)requiresResponse
{
  return 0;
}

@end
