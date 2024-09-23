@implementation SAUISnippetObjectInteraction

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("SnippetObjectInteraction");
}

+ (id)snippetObjectInteraction
{
  return objc_alloc_init((Class)a1);
}

- (SADomainObject)object
{
  return (SADomainObject *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("object"));
}

- (void)setObject:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("object"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
