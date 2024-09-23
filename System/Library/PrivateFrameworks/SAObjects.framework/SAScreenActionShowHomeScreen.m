@implementation SAScreenActionShowHomeScreen

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.onscreenaction");
}

- (id)encodedClassName
{
  return CFSTR("ShowHomeScreen");
}

+ (id)showHomeScreen
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
