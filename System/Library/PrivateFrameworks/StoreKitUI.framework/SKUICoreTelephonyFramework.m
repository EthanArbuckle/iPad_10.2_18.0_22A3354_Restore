@implementation SKUICoreTelephonyFramework

void *__SKUICoreTelephonyFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreTelephony.framework/CoreTelephony", 1);
  SKUICoreTelephonyFramework_sHandle = (uint64_t)result;
  return result;
}

@end
