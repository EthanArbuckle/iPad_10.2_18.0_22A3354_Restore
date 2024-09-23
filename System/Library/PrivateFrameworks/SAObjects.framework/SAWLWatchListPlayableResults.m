@implementation SAWLWatchListPlayableResults

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.watchlist");
}

- (id)encodedClassName
{
  return CFSTR("WatchListPlayableResults");
}

+ (id)watchListPlayableResults
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)playables
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("playables"), v3);
}

- (void)setPlayables:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("playables"), (uint64_t)a3);
}

@end
