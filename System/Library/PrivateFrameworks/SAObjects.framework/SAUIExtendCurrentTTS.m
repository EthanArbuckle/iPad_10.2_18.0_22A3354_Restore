@implementation SAUIExtendCurrentTTS

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("ExtendCurrentTTS");
}

+ (id)extendCurrentTTS
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
