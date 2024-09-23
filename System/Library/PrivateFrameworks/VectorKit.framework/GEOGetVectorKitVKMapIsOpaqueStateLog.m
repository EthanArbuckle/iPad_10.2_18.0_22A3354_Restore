@implementation GEOGetVectorKitVKMapIsOpaqueStateLog

void __GEOGetVectorKitVKMapIsOpaqueStateLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.VectorKit", "VKMapIsOpaqueState");
  v1 = (void *)GEOGetVectorKitVKMapIsOpaqueStateLog::log;
  GEOGetVectorKitVKMapIsOpaqueStateLog::log = (uint64_t)v0;

}

@end
