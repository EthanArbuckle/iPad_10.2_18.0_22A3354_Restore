@implementation PKNearFieldRadioIsAvailable

uint64_t __PKNearFieldRadioIsAvailable_block_invoke()
{
  uint64_t result;
  BOOL v1;

  result = MGGetBoolAnswer();
  if ((_DWORD)result)
  {
    result = (uint64_t)PKGetClassNFHardwareManager();
    v1 = result != 0;
  }
  else
  {
    v1 = 0;
  }
  byte_1ECF21C7C = v1;
  return result;
}

@end
