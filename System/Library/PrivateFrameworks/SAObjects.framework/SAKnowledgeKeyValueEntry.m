@implementation SAKnowledgeKeyValueEntry

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.knowledgeStore");
}

- (id)encodedClassName
{
  return CFSTR("KeyValueEntry");
}

+ (id)keyValueEntry
{
  return objc_alloc_init((Class)a1);
}

- (NSString)key
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("key"));
}

- (void)setKey:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("key"), a3);
}

- (NSString)storeName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("storeName"));
}

- (void)setStoreName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("storeName"), a3);
}

- (NSString)storeType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("storeType"));
}

- (void)setStoreType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("storeType"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
