@implementation UIColor(ICAccessibility_Private)

- (id)_icaxCachedApproximateColorDescription
{
  return objc_getAssociatedObject(a1, &cachedColorDescriptionKey);
}

- (void)_icaxSetCachedApproximateColorDescription:()ICAccessibility_Private
{
  objc_setAssociatedObject(a1, &cachedColorDescriptionKey, a3, (void *)3);
}

@end
