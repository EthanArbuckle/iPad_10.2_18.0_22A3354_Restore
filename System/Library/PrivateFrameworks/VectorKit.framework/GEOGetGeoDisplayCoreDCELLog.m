@implementation GEOGetGeoDisplayCoreDCELLog

os_log_t __GEOGetGeoDisplayCoreDCELLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.VectorKit", "DCEL");
  GEOGetGeoDisplayCoreDCELLog::log = (uint64_t)result;
  return result;
}

@end
