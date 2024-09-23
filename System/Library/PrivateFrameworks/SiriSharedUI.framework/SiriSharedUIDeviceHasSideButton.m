@implementation SiriSharedUIDeviceHasSideButton

uint64_t __SiriSharedUIDeviceHasSideButton_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  SiriSharedUIDeviceHasSideButton_hasSideButton = (_DWORD)result == 2;
  return result;
}

@end
