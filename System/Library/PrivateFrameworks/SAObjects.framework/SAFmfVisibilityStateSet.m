@implementation SAFmfVisibilityStateSet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.fmf");
}

- (id)encodedClassName
{
  return CFSTR("VisibilityStateSet");
}

+ (id)visibilityStateSet
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)visible
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("visible"));
}

- (void)setVisible:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("visible"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
