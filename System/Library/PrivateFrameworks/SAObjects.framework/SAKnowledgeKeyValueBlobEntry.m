@implementation SAKnowledgeKeyValueBlobEntry

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.knowledgeStore");
}

- (id)encodedClassName
{
  return CFSTR("KeyValueBlobEntry");
}

+ (id)keyValueBlobEntry
{
  return objc_alloc_init((Class)a1);
}

- (NSData)value
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("value"));
}

- (void)setValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("value"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
