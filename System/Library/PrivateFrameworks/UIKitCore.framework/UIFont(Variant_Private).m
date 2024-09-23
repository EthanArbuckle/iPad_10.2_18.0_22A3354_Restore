@implementation UIFont(Variant_Private)

- (id)_cachedVariantWeight
{
  return objc_getAssociatedObject(a1, &kUILabelCachedVariantWeight);
}

- (void)_setCachedVariantWeight:()Variant_Private
{
  objc_setAssociatedObject(a1, &kUILabelCachedVariantWeight, a3, (void *)1);
}

@end
