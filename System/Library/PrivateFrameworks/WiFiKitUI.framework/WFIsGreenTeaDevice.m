@implementation WFIsGreenTeaDevice

uint64_t __WFIsGreenTeaDevice_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  WFIsGreenTeaDevice___greenTea = result;
  return result;
}

@end
