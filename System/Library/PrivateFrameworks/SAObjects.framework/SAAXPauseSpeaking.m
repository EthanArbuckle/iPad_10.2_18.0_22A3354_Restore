@implementation SAAXPauseSpeaking

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.accessibility");
}

- (id)encodedClassName
{
  return CFSTR("PauseSpeaking");
}

+ (id)pauseSpeaking
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
