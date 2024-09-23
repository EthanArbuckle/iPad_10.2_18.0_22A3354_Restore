@implementation SUViewContainsViewOfClass

uint64_t __SUViewContainsViewOfClass_block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end
