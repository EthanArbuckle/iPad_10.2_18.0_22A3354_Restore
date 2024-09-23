@implementation PKUserIntentIsAvailable

uint64_t __PKUserIntentIsAvailable_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_1ECF21C80 = result;
  return result;
}

@end
