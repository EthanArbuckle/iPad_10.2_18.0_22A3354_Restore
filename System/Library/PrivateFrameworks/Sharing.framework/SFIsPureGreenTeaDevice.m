@implementation SFIsPureGreenTeaDevice

uint64_t __SFIsPureGreenTeaDevice_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  SFIsPureGreenTeaDevice_result = result;
  return result;
}

@end
