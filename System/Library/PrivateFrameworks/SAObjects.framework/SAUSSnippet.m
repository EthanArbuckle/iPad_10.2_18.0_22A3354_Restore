@implementation SAUSSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.universalsearch");
}

- (id)encodedClassName
{
  return CFSTR("Snippet");
}

+ (id)snippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)sections
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("sections"), v3);
}

- (void)setSections:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("sections"), (uint64_t)a3);
}

@end
