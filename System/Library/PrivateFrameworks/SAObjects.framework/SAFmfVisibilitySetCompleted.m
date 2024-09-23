@implementation SAFmfVisibilitySetCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.fmf");
}

- (id)encodedClassName
{
  return CFSTR("VisibilitySetCompleted");
}

+ (id)visibilitySetCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)searchContext
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("searchContext"));
}

- (void)setSearchContext:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("searchContext"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
