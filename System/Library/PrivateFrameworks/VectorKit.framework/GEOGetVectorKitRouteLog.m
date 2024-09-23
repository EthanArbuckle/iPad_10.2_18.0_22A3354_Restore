@implementation GEOGetVectorKitRouteLog

os_log_t __GEOGetVectorKitRouteLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.VectorKit", "Route");
  GEOGetVectorKitRouteLog_log = (uint64_t)result;
  return result;
}

@end
