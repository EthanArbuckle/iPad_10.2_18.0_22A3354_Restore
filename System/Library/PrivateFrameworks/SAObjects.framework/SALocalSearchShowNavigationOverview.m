@implementation SALocalSearchShowNavigationOverview

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("ShowNavigationOverview");
}

+ (id)showNavigationOverview
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
