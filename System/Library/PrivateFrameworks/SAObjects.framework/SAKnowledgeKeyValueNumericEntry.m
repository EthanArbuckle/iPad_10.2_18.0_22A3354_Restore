@implementation SAKnowledgeKeyValueNumericEntry

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.knowledgeStore");
}

- (id)encodedClassName
{
  return CFSTR("KeyValueNumericEntry");
}

+ (id)keyValueNumericEntry
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)value
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("value"));
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
