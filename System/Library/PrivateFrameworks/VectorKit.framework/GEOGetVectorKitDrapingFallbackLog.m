@implementation GEOGetVectorKitDrapingFallbackLog

os_log_t __GEOGetVectorKitDrapingFallbackLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.VectorKit", "DrapingFallback");
  GEOGetVectorKitDrapingFallbackLog_log = (uint64_t)result;
  return result;
}

@end
