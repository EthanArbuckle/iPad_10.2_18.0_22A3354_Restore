@implementation SASStartStructuredDictationSpeechRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("StartStructuredDictationSpeechRequest");
}

+ (id)startStructuredDictationSpeechRequest
{
  return objc_alloc_init((Class)a1);
}

- (NSString)structuredDictationType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("structuredDictationType"));
}

- (void)setStructuredDictationType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("structuredDictationType"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
