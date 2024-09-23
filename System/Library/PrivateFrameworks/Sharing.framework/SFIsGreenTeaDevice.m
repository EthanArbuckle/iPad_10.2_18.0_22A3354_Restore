@implementation SFIsGreenTeaDevice

uint64_t __SFIsGreenTeaDevice_block_invoke()
{
  uint64_t result;

  if ((MGGetBoolAnswer() & 1) != 0)
    result = 1;
  else
    result = MGGetBoolAnswer();
  SFIsGreenTeaDevice_result = result;
  return result;
}

@end
