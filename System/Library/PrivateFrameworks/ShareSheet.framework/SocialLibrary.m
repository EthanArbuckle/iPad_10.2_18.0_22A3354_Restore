@implementation SocialLibrary

void *__SocialLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/Social.framework/Social", 2);
  SocialLibrary_sLib = (uint64_t)result;
  return result;
}

@end
