@implementation GetCULibHandle

void *___GetCULibHandle_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreUtils.framework/CoreUtils", 2);
  _GetCULibHandle_sHandle = (uint64_t)result;
  return result;
}

@end
