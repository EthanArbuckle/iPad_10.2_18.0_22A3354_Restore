@implementation NSObject(PXReusableObject)

- (id)_px_reuseIdentifier
{
  return objc_getAssociatedObject(a1, (const void *)PXReuseIdentifierAssociationKey);
}

- (void)_px_setReuseIdentifier:()PXReusableObject
{
  objc_setAssociatedObject(a1, (const void *)PXReuseIdentifierAssociationKey, a3, 0);
}

@end
