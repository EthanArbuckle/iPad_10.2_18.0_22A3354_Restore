@implementation GEOGetGeoResourceLibEaselLog

os_log_t __GEOGetGeoResourceLibEaselLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.VectorKit.GeoResourceLib", "Easel");
  GEOGetGeoResourceLibEaselLog::log = (uint64_t)result;
  return result;
}

@end
