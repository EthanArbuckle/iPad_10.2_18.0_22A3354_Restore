@implementation SAGKWebSearchDomainObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.generalknowledge");
}

- (id)encodedClassName
{
  return CFSTR("WebSearchDomainObject");
}

+ (id)webSearchDomainObject
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)image
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("image"), v3);
}

- (void)setImage:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("image"), (uint64_t)a3);
}

- (NSArray)linkedAnswerGroups
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("linkedAnswerGroups"), v3);
}

- (void)setLinkedAnswerGroups:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("linkedAnswerGroups"), (uint64_t)a3);
}

- (NSString)query
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("query"));
}

- (void)setQuery:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("query"), a3);
}

@end
