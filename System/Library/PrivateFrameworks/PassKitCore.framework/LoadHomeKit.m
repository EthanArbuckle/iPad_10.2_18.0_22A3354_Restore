@implementation LoadHomeKit

void *__LoadHomeKit_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/HomeKit.framework/HomeKit", 2);
  qword_1EE1C5678 = (uint64_t)result;
  return result;
}

@end
