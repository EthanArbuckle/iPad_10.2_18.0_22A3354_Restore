@implementation SAMacFileSearchView

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.mac");
}

- (id)encodedClassName
{
  return CFSTR("FileSearchView");
}

+ (id)fileSearchView
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)entities
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("entities"));
}

- (void)setEntities:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("entities"), a3);
}

- (int64_t)numResults
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("numResults"));
}

- (void)setNumResults:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("numResults"), a3);
}

- (NSString)query
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("query"));
}

- (void)setQuery:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("query"), a3);
}

- (NSString)searchTitle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("searchTitle"));
}

- (void)setSearchTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("searchTitle"), a3);
}

@end
