@implementation GEOGetGeoResourceLibCodecLog

os_log_t __GEOGetGeoResourceLibCodecLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.VectorKit.GeoResourceLib", "Codec");
  GEOGetGeoResourceLibCodecLog::log = (uint64_t)result;
  return result;
}

@end
