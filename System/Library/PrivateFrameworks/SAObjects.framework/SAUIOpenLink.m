@implementation SAUIOpenLink

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("OpenLink");
}

+ (id)openLink
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)ref
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("ref"));
}

- (void)setRef:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("ref"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
