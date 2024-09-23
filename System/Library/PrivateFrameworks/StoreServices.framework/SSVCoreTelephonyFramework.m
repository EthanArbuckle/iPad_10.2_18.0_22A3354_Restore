@implementation SSVCoreTelephonyFramework

void *__SSVCoreTelephonyFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreTelephony.framework/CoreTelephony", 1);
  SSVCoreTelephonyFramework_sHandle = (uint64_t)result;
  return result;
}

@end
