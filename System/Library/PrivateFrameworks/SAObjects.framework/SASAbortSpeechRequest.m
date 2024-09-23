@implementation SASAbortSpeechRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("AbortSpeechRequest");
}

+ (id)abortSpeechRequest
{
  return objc_alloc_init((Class)a1);
}

- (NSString)reason
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("reason"));
}

- (void)setReason:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("reason"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
