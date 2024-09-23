@implementation PXAssetReference(PXPhotosDataSource)

- (uint64_t)simpleIndexPath
{
  *x8_0 = 0u;
  x8_0[1] = 0u;
  return objc_msgSend(a1, "indexPath");
}

@end
