@implementation SAKnowledgeSetLinkedData

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.knowledgeStore");
}

- (id)encodedClassName
{
  return CFSTR("SetLinkedData");
}

+ (id)setLinkedData
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)linkedData
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("linkedData"), v3);
}

- (void)setLinkedData:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("linkedData"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
