@implementation GEOGetGeoGLPerformanceDetailLog

os_log_t __GEOGetGeoGLPerformanceDetailLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.VectorKit.GeoGL", "PerformanceDetail");
  GEOGetGeoGLPerformanceDetailLog_log = (uint64_t)result;
  return result;
}

@end
