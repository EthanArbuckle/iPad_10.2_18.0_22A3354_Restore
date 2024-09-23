@implementation BKBagOfflineCacheProvider

- (BOOL)runFromCache
{
  return +[JSAOfflineCache runFromCache](JSAOfflineCache, "runFromCache");
}

- (id)loadCache
{
  return +[JSAProfileBagManager valuesFromOfflineCache](JSAProfileBagManager, "valuesFromOfflineCache");
}

@end
