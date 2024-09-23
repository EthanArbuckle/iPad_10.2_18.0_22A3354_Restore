@implementation SAWebObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.websearch");
}

- (id)encodedClassName
{
  return CFSTR("Object");
}

+ (id)object
{
  return objc_alloc_init((Class)a1);
}

- (NSString)query
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("query"));
}

- (void)setQuery:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("query"), a3);
}

- (SAWebWebSearchResult)results
{
  return (SAWebWebSearchResult *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("results"));
}

- (void)setResults:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("results"), a3);
}

@end
