@implementation ZL17isInMainlandChinav

const __CFString *___ZL17isInMainlandChinav_block_invoke()
{
  const __CFString *result;

  result = (const __CFString *)CPGetDeviceRegionCode();
  if (result)
  {
    result = (const __CFString *)CFStringCompare(result, CFSTR("CH"), 0);
    isInMainlandChina(void)::isInMainlandChina = result == 0;
  }
  return result;
}

@end
