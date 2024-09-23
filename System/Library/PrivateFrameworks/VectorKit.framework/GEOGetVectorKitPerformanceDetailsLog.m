@implementation GEOGetVectorKitPerformanceDetailsLog

os_log_t __GEOGetVectorKitPerformanceDetailsLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.VectorKit", "PerformanceDetails");
  GEOGetVectorKitPerformanceDetailsLog_log = (uint64_t)result;
  return result;
}

@end
