@implementation UIViewGetDefaultLayoutMargins

uint64_t ___UIViewGetDefaultLayoutMargins_block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  if ((result & 1) == 0)
  {
    _MergedGlobals_329 = 0x4020000000000000;
    unk_1EDD83128 = 0x4020000000000000;
    qword_1EDD83130 = 0x4020000000000000;
    unk_1EDD83138 = 0x4020000000000000;
  }
  return result;
}

@end
