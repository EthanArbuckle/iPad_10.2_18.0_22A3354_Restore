@implementation PKPlacesKitGetLog

void __PKPlacesKitGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PlacesKit", "PlacesKit");
  v1 = (void *)PKPlacesKitGetLog_log;
  PKPlacesKitGetLog_log = (uint64_t)v0;

}

@end
