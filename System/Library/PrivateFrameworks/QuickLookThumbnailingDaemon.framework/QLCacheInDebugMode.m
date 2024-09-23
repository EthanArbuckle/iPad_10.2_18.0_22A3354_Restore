@implementation QLCacheInDebugMode

uint64_t __QLCacheInDebugMode_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  QLCacheInDebugMode__cacheIsInDebugMode = result;
  return result;
}

@end
