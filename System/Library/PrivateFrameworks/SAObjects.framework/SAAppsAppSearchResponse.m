@implementation SAAppsAppSearchResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.apps");
}

- (id)encodedClassName
{
  return CFSTR("AppSearchResponse");
}

+ (id)appSearchResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)foundApps
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("foundApps"), v3);
}

- (void)setFoundApps:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("foundApps"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
