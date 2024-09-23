@implementation PLIsChinaSKU

uint64_t __PLIsChinaSKU_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  PLIsChinaSKU_isChinaSKU = result;
  return result;
}

@end
