@implementation SISupportANE

uint64_t __SISupportANE_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  s_deviceSupportsANE = result;
  return result;
}

@end
