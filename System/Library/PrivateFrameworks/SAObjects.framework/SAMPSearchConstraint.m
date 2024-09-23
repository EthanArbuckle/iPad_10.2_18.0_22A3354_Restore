@implementation SAMPSearchConstraint

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("SearchConstraint");
}

+ (id)searchConstraint
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)mediaPlayerOrderingTerms
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("mediaPlayerOrderingTerms"), v3);
}

- (void)setMediaPlayerOrderingTerms:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("mediaPlayerOrderingTerms"), (uint64_t)a3);
}

- (NSString)query
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("query"));
}

- (void)setQuery:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("query"), a3);
}

- (NSArray)searchProperties
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("searchProperties"));
}

- (void)setSearchProperties:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("searchProperties"), a3);
}

@end
