@implementation SAUITemplateEdgeInsets

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("EdgeInsets");
}

+ (id)edgeInsets
{
  return objc_alloc_init((Class)a1);
}

- (float)bottom
{
  return AceObjectFloatForProperty(self, (uint64_t)CFSTR("bottom"));
}

- (void)setBottom:(float)a3
{
  AceObjectSetFloatForProperty(self, CFSTR("bottom"), a3);
}

- (float)left
{
  return AceObjectFloatForProperty(self, (uint64_t)CFSTR("left"));
}

- (void)setLeft:(float)a3
{
  AceObjectSetFloatForProperty(self, CFSTR("left"), a3);
}

- (float)right
{
  return AceObjectFloatForProperty(self, (uint64_t)CFSTR("right"));
}

- (void)setRight:(float)a3
{
  AceObjectSetFloatForProperty(self, CFSTR("right"), a3);
}

- (float)top
{
  return AceObjectFloatForProperty(self, (uint64_t)CFSTR("top"));
}

- (void)setTop:(float)a3
{
  AceObjectSetFloatForProperty(self, CFSTR("top"), a3);
}

@end
