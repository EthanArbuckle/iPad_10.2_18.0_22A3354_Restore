@implementation SAAXStartSpeaking

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.accessibility");
}

- (id)encodedClassName
{
  return CFSTR("StartSpeaking");
}

+ (id)startSpeaking
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
