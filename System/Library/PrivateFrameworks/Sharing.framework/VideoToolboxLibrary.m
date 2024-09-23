@implementation VideoToolboxLibrary

void *__VideoToolboxLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/VideoToolbox.framework/VideoToolbox", 2);
  VideoToolboxLibrary_sLib = (uint64_t)result;
  return result;
}

@end
