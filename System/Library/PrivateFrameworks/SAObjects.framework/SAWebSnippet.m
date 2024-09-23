@implementation SAWebSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.websearch");
}

- (id)encodedClassName
{
  return CFSTR("Snippet");
}

+ (id)snippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)webSearch
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("webSearch"), v3);
}

- (void)setWebSearch:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("webSearch"), (uint64_t)a3);
}

@end
