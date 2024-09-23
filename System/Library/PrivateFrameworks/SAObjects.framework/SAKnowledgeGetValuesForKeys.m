@implementation SAKnowledgeGetValuesForKeys

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.knowledgeStore");
}

- (id)encodedClassName
{
  return CFSTR("GetValuesForKeys");
}

+ (id)getValuesForKeys
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)keys
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("keys"));
}

- (void)setKeys:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("keys"), a3);
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
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
