@implementation LoadSharing

void *__LoadSharing_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
  qword_1EE1C55E8 = (uint64_t)result;
  return result;
}

void *__LoadSharing_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
  LoadSharing_frameworkLibrary = (uint64_t)result;
  return result;
}

@end
