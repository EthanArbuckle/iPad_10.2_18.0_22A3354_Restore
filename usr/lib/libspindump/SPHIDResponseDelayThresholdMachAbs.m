@implementation SPHIDResponseDelayThresholdMachAbs

uint64_t __SPHIDResponseDelayThresholdMachAbs_block_invoke()
{
  CFIndex AppIntegerValue;
  uint64_t v1;
  uint64_t result;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("HIDResponseDelayReportThresholdMs"), (CFStringRef)*MEMORY[0x24BDBD580], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    if (AppIntegerValue < 0)
    {
      result = -1;
      goto LABEL_7;
    }
    v1 = 1000000 * AppIntegerValue;
  }
  else
  {
    v1 = 500000000;
  }
  result = NanoToMach(v1);
LABEL_7:
  SPHIDResponseDelayThresholdMachAbs_thresholdMachAbs = result;
  return result;
}

@end
