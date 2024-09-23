@implementation UISearchBarUsesModernAppearance

uint64_t __UISearchBarUsesModernAppearance_block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  _MergedGlobals_19_0 = result;
  return result;
}

@end
