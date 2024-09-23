@implementation SAUIAlternateProviderSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("AlternateProviderSnippet");
}

+ (id)alternateProviderSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)alternateProviderResults
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("alternateProviderResults"), v3);
}

- (void)setAlternateProviderResults:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("alternateProviderResults"), (uint64_t)a3);
}

@end
