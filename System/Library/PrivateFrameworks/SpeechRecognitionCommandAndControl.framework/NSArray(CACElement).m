@implementation NSArray(CACElement)

- (uint64_t)isVisuallyEqualToArray:()CACElement
{
  return objc_msgSend(a1, "axIsEqualToOrderedArray:withPredicate:", a3, &__block_literal_global_497);
}

@end
