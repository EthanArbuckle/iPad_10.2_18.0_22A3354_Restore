@implementation SKUIMediaPlayerUIFramework

void *__SKUIMediaPlayerUIFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MediaPlayerUI.framework/MediaPlayerUI", 1);
  SKUIMediaPlayerUIFramework_sHandle = (uint64_t)result;
  return result;
}

@end
