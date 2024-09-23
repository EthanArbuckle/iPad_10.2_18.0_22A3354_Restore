@implementation SAWristDetectionStatusClientState

+ (id)deliveryDeadline
{
  return CFSTR("BEFORE_FINISH_SPEECH");
}

+ (id)persistencePolicy
{
  return CFSTR("LIFE_OF_USER_DATA");
}

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("WristDetectionStatusClientState");
}

+ (id)wristDetectionStatusClientState
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)wristDetected
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("wristDetected"));
}

- (void)setWristDetected:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("wristDetected"), a3);
}

@end
