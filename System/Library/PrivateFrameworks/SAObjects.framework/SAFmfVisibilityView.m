@implementation SAFmfVisibilityView

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.fmf");
}

- (id)encodedClassName
{
  return CFSTR("VisibilityView");
}

+ (id)visibilityView
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

- (BOOL)visible
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("visible"));
}

- (void)setVisible:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("visible"), a3);
}

@end
