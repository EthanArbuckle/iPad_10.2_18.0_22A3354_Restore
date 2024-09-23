@implementation GEOGetGeoResourceLibCoreGraphicsLog

os_log_t __GEOGetGeoResourceLibCoreGraphicsLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.VectorKit.GeoResourceLib", "CoreGraphics");
  GEOGetGeoResourceLibCoreGraphicsLog::log = (uint64_t)result;
  return result;
}

@end
