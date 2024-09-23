@implementation SAIntentGroupUnsupportedIntentResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("UnsupportedIntentResponse");
}

+ (id)unsupportedIntentResponse
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
