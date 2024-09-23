@implementation SKUIMediaPlayerFramework

void *__SKUIMediaPlayerFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/MediaPlayer.framework/MediaPlayer", 1);
  SKUIMediaPlayerFramework_sHandle = (uint64_t)result;
  return result;
}

@end
