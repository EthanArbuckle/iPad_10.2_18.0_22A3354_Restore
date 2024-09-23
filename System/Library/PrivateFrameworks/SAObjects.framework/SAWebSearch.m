@implementation SAWebSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.websearch");
}

- (id)encodedClassName
{
  return CFSTR("Search");
}

+ (id)search
{
  return objc_alloc_init((Class)a1);
}

- (NSString)provider
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("provider"));
}

- (void)setProvider:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("provider"), a3);
}

- (NSString)query
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("query"));
}

- (void)setQuery:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("query"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
