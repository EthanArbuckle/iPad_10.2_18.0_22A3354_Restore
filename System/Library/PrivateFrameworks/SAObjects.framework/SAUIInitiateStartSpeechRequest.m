@implementation SAUIInitiateStartSpeechRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("InitiateStartSpeechRequest");
}

+ (id)initiateStartSpeechRequest
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
