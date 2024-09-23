@implementation PXIsOLEDDevice

uint64_t __PXIsOLEDDevice_block_invoke()
{
  uint64_t result;

  result = MGIsQuestionValid();
  if ((_DWORD)result)
    result = MGGetBoolAnswer();
  PXIsOLEDDevice_isOLEDDevice = result;
  return result;
}

@end
