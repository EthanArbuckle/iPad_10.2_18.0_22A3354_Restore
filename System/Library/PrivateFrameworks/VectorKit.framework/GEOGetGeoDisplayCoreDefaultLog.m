@implementation GEOGetGeoDisplayCoreDefaultLog

os_log_t __GEOGetGeoDisplayCoreDefaultLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.VectorKit", "Default");
  GEOGetGeoDisplayCoreDefaultLog::log = (uint64_t)result;
  return result;
}

@end
