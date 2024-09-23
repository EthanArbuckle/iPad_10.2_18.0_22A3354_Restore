@implementation SAAICancelSession

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.acousticid");
}

- (id)encodedClassName
{
  return CFSTR("CancelSession");
}

+ (id)cancelSession
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
