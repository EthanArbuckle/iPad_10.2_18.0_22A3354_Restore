@implementation GEOGetVectorKitResourceLoadingLog

os_log_t __GEOGetVectorKitResourceLoadingLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.VectorKit", "ResourceLoading");
  GEOGetVectorKitResourceLoadingLog_log = (uint64_t)result;
  return result;
}

@end
