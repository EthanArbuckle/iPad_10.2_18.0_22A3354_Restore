@implementation LoadMapsSupport

void *__LoadMapsSupport_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MapsSupport.framework/MapsSupport", 2);
  _MergedGlobals_13_1 = (uint64_t)result;
  return result;
}

@end
