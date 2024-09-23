@implementation UIFont(PRAdditions_Private)

- (id)pui_cachedVariantWeight
{
  return objc_getAssociatedObject(a1, &PUICachedVariantWeightAssociationKey);
}

- (void)pui_setCachedVariantWeight:()PRAdditions_Private
{
  objc_setAssociatedObject(a1, &PUICachedVariantWeightAssociationKey, a3, (void *)1);
}

@end
