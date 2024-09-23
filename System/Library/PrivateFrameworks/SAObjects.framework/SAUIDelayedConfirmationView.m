@implementation SAUIDelayedConfirmationView

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("DelayedConfirmationView");
}

+ (id)delayedConfirmationView
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)autoConfirmDelay
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("autoConfirmDelay"));
}

- (void)setAutoConfirmDelay:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("autoConfirmDelay"), a3);
}

@end
