@implementation SASmsPlayAudio

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sms");
}

- (id)encodedClassName
{
  return CFSTR("PlayAudio");
}

+ (id)playAudio
{
  return objc_alloc_init((Class)a1);
}

- (SASmsSms)message
{
  return (SASmsSms *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("message"));
}

- (void)setMessage:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("message"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
