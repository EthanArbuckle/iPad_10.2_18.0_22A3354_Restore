@implementation SACFSpokenNotificationProvideContext

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clientflow");
}

- (id)encodedClassName
{
  return CFSTR("SpokenNotificationProvideContext");
}

+ (id)spokenNotificationProvideContext
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
