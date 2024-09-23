@implementation GEOGetGeoDisplayCoreResourceLoadingLog

os_log_t __GEOGetGeoDisplayCoreResourceLoadingLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.VectorKit", "ResourceLoading");
  GEOGetGeoDisplayCoreResourceLoadingLog::log = (uint64_t)result;
  return result;
}

@end
