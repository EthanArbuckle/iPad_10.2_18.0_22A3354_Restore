@implementation LoadMapKit

void *__LoadMapKit_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/MapKit.framework/MapKit", 2);
  LoadMapKit_frameworkLibrary = (uint64_t)result;
  return result;
}

@end
