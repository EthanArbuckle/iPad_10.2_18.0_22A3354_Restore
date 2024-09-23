@implementation SSVIMSharedUtilities

void *__SSVIMSharedUtilities_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/IMSharedUtilities.framework/IMSharedUtilities", 1);
  SSVIMSharedUtilities_sHandle = (uint64_t)result;
  return result;
}

@end
