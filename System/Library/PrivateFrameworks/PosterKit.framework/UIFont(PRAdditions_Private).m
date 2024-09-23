@implementation UIFont(PRAdditions_Private)

- (id)pr_cachedVariantWeight
{
  return objc_getAssociatedObject(a1, &PRCachedVariantWeightAssociationKey);
}

- (void)pr_setCachedVariantWeight:()PRAdditions_Private
{
  objc_setAssociatedObject(a1, &PRCachedVariantWeightAssociationKey, a3, (void *)1);
}

@end
