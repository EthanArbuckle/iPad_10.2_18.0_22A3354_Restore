@implementation GEOGetGeoResourceLibIconManagerLog

os_log_t __GEOGetGeoResourceLibIconManagerLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.VectorKit.GeoResourceLib", "IconManager");
  GEOGetGeoResourceLibIconManagerLog::log = (uint64_t)result;
  return result;
}

@end
