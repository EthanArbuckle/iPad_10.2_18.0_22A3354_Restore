@implementation GEOGetGeoGLPerformanceLog

os_log_t __GEOGetGeoGLPerformanceLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.VectorKit.GeoGL", "Performance");
  GEOGetGeoGLPerformanceLog_log = (uint64_t)result;
  return result;
}

@end
