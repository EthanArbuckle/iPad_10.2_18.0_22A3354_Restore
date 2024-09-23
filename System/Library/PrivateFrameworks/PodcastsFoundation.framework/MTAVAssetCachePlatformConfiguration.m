@implementation MTAVAssetCachePlatformConfiguration

+ (MTAVAssetCacheConfiguration)platformConfiguration
{
  int64_t v2;
  int64_t v3;
  MTAVAssetCacheConfiguration result;

  v2 = 50331648;
  v3 = 0x8000000;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

@end
