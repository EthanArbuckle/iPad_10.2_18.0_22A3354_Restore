@implementation GEOGetGeoResourceLibCoreFoundationLog

os_log_t __GEOGetGeoResourceLibCoreFoundationLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.VectorKit.GeoResourceLib", "CoreFoundation");
  GEOGetGeoResourceLibCoreFoundationLog::log = (uint64_t)result;
  return result;
}

@end
