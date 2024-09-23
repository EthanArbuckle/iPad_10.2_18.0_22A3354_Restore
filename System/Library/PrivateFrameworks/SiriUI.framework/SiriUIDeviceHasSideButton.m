@implementation SiriUIDeviceHasSideButton

uint64_t __SiriUIDeviceHasSideButton_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  SiriUIDeviceHasSideButton_hasSideButton = (_DWORD)result == 2;
  return result;
}

@end
