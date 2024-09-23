@implementation SKUIAudioToolboxFramework

void *__SKUIAudioToolboxFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/AudioToolbox.framework/AudioToolbox", 1);
  SKUIAudioToolboxFramework_sHandle = (uint64_t)result;
  return result;
}

@end
