@implementation WLKPlaybackTrackingLogObject

void __WLKPlaybackTrackingLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WatchListKit", "PlaybackTracking");
  v1 = (void *)WLKPlaybackTrackingLogObject_logger;
  WLKPlaybackTrackingLogObject_logger = (uint64_t)v0;

}

@end
