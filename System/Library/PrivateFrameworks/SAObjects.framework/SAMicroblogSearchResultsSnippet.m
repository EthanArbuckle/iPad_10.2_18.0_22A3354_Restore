@implementation SAMicroblogSearchResultsSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.microblog");
}

- (id)encodedClassName
{
  return CFSTR("SearchResultsSnippet");
}

+ (id)searchResultsSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)searches
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("searches"), v3);
}

- (void)setSearches:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("searches"), (uint64_t)a3);
}

@end
