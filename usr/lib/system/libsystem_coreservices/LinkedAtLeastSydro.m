@implementation LinkedAtLeastSydro

uint64_t __LinkedAtLeastSydro_block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  LinkedAtLeastSydro_result = result;
  return result;
}

@end
