@implementation TSKMoviePlaybackRegistry

+ (id)sharedMoviePlaybackRegistry
{
  if (sharedMoviePlaybackRegistry_createSharedMoviePlaybackRegistryOnce != -1)
    dispatch_once(&sharedMoviePlaybackRegistry_createSharedMoviePlaybackRegistryOnce, &__block_literal_global_14);
  return (id)sharedMoviePlaybackRegistry_sharedMoviePlaybackRegistry;
}

TSKMoviePlaybackRegistry *__55__TSKMoviePlaybackRegistry_sharedMoviePlaybackRegistry__block_invoke()
{
  TSKMoviePlaybackRegistry *result;

  result = objc_alloc_init(TSKMoviePlaybackRegistry);
  sharedMoviePlaybackRegistry_sharedMoviePlaybackRegistry = (uint64_t)result;
  return result;
}

- (void)objectWillBeginMoviePlayback:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3), "postNotificationName:object:userInfo:", CFSTR("TSKMoviePlaybackRegistryObjectWillBeginMoviePlaybackNotification"), self, 0);
}

@end
