@implementation GEOGetGeoGLDefaultLog

os_log_t __GEOGetGeoGLDefaultLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.VectorKit.GeoGL", "Default");
  GEOGetGeoGLDefaultLog_log = (uint64_t)result;
  return result;
}

@end
