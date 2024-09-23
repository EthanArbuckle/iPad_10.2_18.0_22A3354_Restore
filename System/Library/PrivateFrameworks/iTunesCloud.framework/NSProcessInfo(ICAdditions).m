@implementation NSProcessInfo(ICAdditions)

- (uint64_t)ic_isCloudDaemon
{
  if (ic_isCloudDaemon_sOnceToken != -1)
    dispatch_once(&ic_isCloudDaemon_sOnceToken, &__block_literal_global_11769);
  return ic_isCloudDaemon_sIsCloudDaemon;
}

@end
