@implementation SAKnowledgeKeyValueStringEntry

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.knowledgeStore");
}

- (id)encodedClassName
{
  return CFSTR("KeyValueStringEntry");
}

+ (id)keyValueStringEntry
{
  return objc_alloc_init((Class)a1);
}

- (NSString)value
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("value"));
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
