@implementation BKTUIOfflineCacheProvider

- (BOOL)runFromCache
{
  return +[JSAOfflineCache runFromCache](JSAOfflineCache, "runFromCache");
}

- (BOOL)generateCache
{
  return +[JSAOfflineCache generateCache](JSAOfflineCache, "generateCache");
}

- (NSArray)cacheFileCandidatesForPreLaunch
{
  return (NSArray *)+[JSAOfflineCache cacheFileCandidatesForTUIPreLaunch](JSAOfflineCache, "cacheFileCandidatesForTUIPreLaunch");
}

- (NSArray)cacheDirCandidatesForPostLaunch
{
  return (NSArray *)+[JSAOfflineCache cacheDirCandidatesForTUIPostLaunch](JSAOfflineCache, "cacheDirCandidatesForTUIPostLaunch");
}

@end
