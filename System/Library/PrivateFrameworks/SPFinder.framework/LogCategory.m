@implementation LogCategory

void __LogCategory_Unspecified_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.SPFinder", "_");
  v1 = (void *)LogCategory_Unspecified_log;
  LogCategory_Unspecified_log = (uint64_t)v0;

}

void __LogCategory_AdvertisementCache_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.SPFinder", "advertisementCache");
  v1 = (void *)LogCategory_AdvertisementCache_log;
  LogCategory_AdvertisementCache_log = (uint64_t)v0;

}

@end
