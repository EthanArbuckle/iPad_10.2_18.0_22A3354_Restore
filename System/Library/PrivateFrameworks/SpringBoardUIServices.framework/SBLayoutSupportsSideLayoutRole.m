@implementation SBLayoutSupportsSideLayoutRole

uint64_t __SBLayoutSupportsSideLayoutRole_block_invoke()
{
  uint64_t result;

  if ((MGGetBoolAnswer() & 1) != 0)
    result = 1;
  else
    result = MGGetBoolAnswer();
  SBLayoutSupportsSideLayoutRole_sSBLayoutSupportsSideLayoutRole = result;
  return result;
}

@end
