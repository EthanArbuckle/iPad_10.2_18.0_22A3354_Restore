@implementation SFIsDeviceAudioAccessory

uint64_t __SFIsDeviceAudioAccessory_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  SFIsDeviceAudioAccessory_result = (_DWORD)result == 7;
  return result;
}

@end
