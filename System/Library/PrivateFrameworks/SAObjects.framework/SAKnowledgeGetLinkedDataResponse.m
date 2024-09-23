@implementation SAKnowledgeGetLinkedDataResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.knowledgeStore");
}

- (id)encodedClassName
{
  return CFSTR("GetLinkedDataResponse");
}

+ (id)getLinkedDataResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)result
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("result"));
}

- (void)setResult:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("result"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
