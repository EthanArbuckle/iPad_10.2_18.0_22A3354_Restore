@implementation SASSpeechRecognitionComplete

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("SpeechRecognitionComplete");
}

+ (id)speechRecognitionComplete
{
  return objc_alloc_init((Class)a1);
}

- (NSString)sessionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sessionId"));
}

- (void)setSessionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sessionId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
