@implementation SATTSSpeechSynthesisFailure

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("SpeechSynthesisFailure");
}

+ (id)speechSynthesisFailure
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)errorCode
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("errorCode"));
}

- (void)setErrorCode:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("errorCode"), a3);
}

- (NSString)reason
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("reason"));
}

- (void)setReason:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("reason"), a3);
}

- (NSString)reasonDescription
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("reasonDescription"));
}

- (void)setReasonDescription:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("reasonDescription"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
