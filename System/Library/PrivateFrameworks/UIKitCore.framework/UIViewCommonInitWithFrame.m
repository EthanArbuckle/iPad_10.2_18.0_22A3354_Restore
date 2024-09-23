@implementation UIViewCommonInitWithFrame

uint64_t __UIViewCommonInitWithFrame_block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  if ((result & 1) == 0)
  {
    objc_opt_class();
    return _class_setCustomDeallocInitiation();
  }
  return result;
}

@end
