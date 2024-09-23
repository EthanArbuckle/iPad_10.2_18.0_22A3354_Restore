@implementation SFIsDevicePhone

uint64_t __SFIsDevicePhone_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  SFIsDevicePhone_isPhone = (_DWORD)result == 1;
  return result;
}

@end
