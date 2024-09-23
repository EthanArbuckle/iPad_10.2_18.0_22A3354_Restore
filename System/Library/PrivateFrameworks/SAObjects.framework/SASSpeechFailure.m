@implementation SASSpeechFailure

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("SpeechFailure");
}

+ (id)speechFailure
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

- (int)reason
{
  void *v2;
  int v3;

  -[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("reason"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SASSpeechFailureReasonForString(v2);

  return v3;
}

- (void)setReason:(int)a3
{
  id v4;

  stringForSASSpeechFailureReason(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  AceObjectSetCopyingObjectForProperty(self, CFSTR("reason"), v4);

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
