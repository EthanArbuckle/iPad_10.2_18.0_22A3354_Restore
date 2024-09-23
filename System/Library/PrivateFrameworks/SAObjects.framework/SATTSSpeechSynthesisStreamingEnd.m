@implementation SATTSSpeechSynthesisStreamingEnd

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("SpeechSynthesisStreamingEnd");
}

+ (id)speechSynthesisStreamingEnd
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)count
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("count"));
}

- (void)setCount:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("count"), a3);
}

- (int64_t)errorCode
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("errorCode"));
}

- (void)setErrorCode:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("errorCode"), a3);
}

- (NSString)errorMessage
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("errorMessage"));
}

- (void)setErrorMessage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("errorMessage"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
