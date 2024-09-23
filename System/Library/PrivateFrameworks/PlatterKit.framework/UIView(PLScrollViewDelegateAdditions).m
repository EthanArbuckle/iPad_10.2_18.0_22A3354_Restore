@implementation UIView(PLScrollViewDelegateAdditions)

- (uint64_t)pl_isScrollViewDelegateMethod:()PLScrollViewDelegateAdditions
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (pl_isScrollViewDelegateMethod__onceToken != -1)
    dispatch_once(&pl_isScrollViewDelegateMethod__onceToken, &__block_literal_global_2);
  v4 = (void *)pl_isScrollViewDelegateMethod____scrollViewDelegateSelectors;
  NSStringFromSelector(aSelector);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

@end
