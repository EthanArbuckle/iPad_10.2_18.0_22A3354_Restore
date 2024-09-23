@implementation GEOGetGeoResourceLibFontLog

os_log_t __GEOGetGeoResourceLibFontLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.VectorKit.GeoResourceLib", "Font");
  GEOGetGeoResourceLibFontLog::log = (uint64_t)result;
  return result;
}

@end
