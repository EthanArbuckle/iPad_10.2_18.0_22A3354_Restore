@implementation PKSystemApertureIsAvailable

uint64_t __PKSystemApertureIsAvailable_block_invoke()
{
  uint64_t result;

  result = SBSIsSystemApertureAvailable();
  byte_1ECF21C82 = result;
  return result;
}

@end
