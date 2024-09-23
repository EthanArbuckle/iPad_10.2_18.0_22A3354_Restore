@implementation TIImageCacheOSLogFacility

void __TIImageCacheOSLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInput", "KBDTIImageCache");
  v1 = (void *)TIImageCacheOSLogFacility_logFacility;
  TIImageCacheOSLogFacility_logFacility = (uint64_t)v0;

}

@end
