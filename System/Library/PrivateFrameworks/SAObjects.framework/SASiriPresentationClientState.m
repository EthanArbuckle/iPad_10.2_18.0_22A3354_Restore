@implementation SASiriPresentationClientState

+ (id)deliveryDeadline
{
  return CFSTR("BEFORE_FINISH_SPEECH");
}

+ (id)persistencePolicy
{
  return CFSTR("UNDEFINED");
}

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SiriPresentationClientState");
}

+ (id)siriPresentationClientState
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)isFullScreen
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isFullScreen"));
}

- (void)setIsFullScreen:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isFullScreen"), a3);
}

@end
