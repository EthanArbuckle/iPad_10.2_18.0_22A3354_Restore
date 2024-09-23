@implementation SAWLWatchListSearchResults

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.watchlist");
}

- (id)encodedClassName
{
  return CFSTR("WatchListSearchResults");
}

+ (id)watchListSearchResults
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)matchedResults
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("matchedResults"), v3);
}

- (void)setMatchedResults:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("matchedResults"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
