@implementation GEOGetGeoResourceLibMathLog

os_log_t __GEOGetGeoResourceLibMathLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.VectorKit.GeoResourceLib", "Math");
  GEOGetGeoResourceLibMathLog::log = (uint64_t)result;
  return result;
}

@end
