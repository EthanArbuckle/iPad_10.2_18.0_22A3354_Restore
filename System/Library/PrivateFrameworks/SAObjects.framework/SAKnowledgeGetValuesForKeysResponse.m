@implementation SAKnowledgeGetValuesForKeysResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.knowledgeStore");
}

- (id)encodedClassName
{
  return CFSTR("GetValuesForKeysResponse");
}

+ (id)getValuesForKeysResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)entries
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("entries"), v3);
}

- (void)setEntries:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("entries"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
