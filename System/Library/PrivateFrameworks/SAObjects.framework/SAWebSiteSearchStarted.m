@implementation SAWebSiteSearchStarted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.websearch");
}

- (id)encodedClassName
{
  return CFSTR("SiteSearchStarted");
}

+ (id)siteSearchStarted
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
