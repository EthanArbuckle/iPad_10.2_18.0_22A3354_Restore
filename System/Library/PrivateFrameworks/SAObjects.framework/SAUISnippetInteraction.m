@implementation SAUISnippetInteraction

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("SnippetInteraction");
}

+ (id)snippetInteraction
{
  return objc_alloc_init((Class)a1);
}

- (NSString)requestId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("requestId"));
}

- (void)setRequestId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("requestId"), a3);
}

- (NSString)snippetId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("snippetId"));
}

- (void)setSnippetId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("snippetId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
