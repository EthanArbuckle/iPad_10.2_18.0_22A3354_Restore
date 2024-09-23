@implementation SAEmailSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.email");
}

- (id)encodedClassName
{
  return CFSTR("Snippet");
}

+ (id)snippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)emails
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("emails"), v3);
}

- (void)setEmails:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("emails"), (uint64_t)a3);
}

@end
