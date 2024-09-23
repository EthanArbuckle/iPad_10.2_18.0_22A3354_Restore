@implementation RCTestBlockForClass

uint64_t __RCTestBlockForClass_block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end
