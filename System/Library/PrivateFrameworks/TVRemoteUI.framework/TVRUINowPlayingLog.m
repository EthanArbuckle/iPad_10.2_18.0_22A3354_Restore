@implementation TVRUINowPlayingLog

void ___TVRUINowPlayingLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteUI", "NowPlaying");
  v1 = (void *)_TVRUINowPlayingLog_log;
  _TVRUINowPlayingLog_log = (uint64_t)v0;

}

@end
