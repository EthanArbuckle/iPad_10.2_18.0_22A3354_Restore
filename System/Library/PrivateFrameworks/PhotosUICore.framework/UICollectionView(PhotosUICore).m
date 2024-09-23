@implementation UICollectionView(PhotosUICore)

- (double)_px_currentContentSize
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "collectionViewLayout");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "collectionViewContentSize");
  v3 = v2;

  return v3;
}

@end
