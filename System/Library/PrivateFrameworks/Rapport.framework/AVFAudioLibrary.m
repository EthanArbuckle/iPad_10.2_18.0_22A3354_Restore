@implementation AVFAudioLibrary

void *__AVFAudioLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/AVFAudio.framework/AVFAudio", 2);
  AVFAudioLibrary_sLib = (uint64_t)result;
  return result;
}

@end
