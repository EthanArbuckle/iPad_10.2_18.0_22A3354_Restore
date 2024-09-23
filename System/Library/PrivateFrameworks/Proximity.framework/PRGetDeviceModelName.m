@implementation PRGetDeviceModelName

void __PRGetDeviceModelName_block_invoke()
{
  const void *v0;
  uint64_t v1;
  CFTypeID v2;
  void *v3;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = (uint64_t)v0;
    v2 = CFGetTypeID(v0);
    if (v2 != CFStringGetTypeID())
      __PRGetDeviceModelName_block_invoke_cold_1();
    v3 = (void *)PRGetDeviceModelName::result;
    PRGetDeviceModelName::result = v1;

  }
}

void __PRGetDeviceModelName_block_invoke_cold_1()
{
  __assert_rtn("PRGetDeviceModelName_block_invoke", "PRUtilities.m", 40, "CFGetTypeID(answer) == CFStringGetTypeID()");
}

@end
