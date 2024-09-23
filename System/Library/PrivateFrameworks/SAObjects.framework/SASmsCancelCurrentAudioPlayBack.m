@implementation SASmsCancelCurrentAudioPlayBack

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sms");
}

- (id)encodedClassName
{
  return CFSTR("CancelCurrentAudioPlayBack");
}

+ (id)cancelCurrentAudioPlayBack
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
