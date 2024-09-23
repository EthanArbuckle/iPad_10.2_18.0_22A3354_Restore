@implementation MTDownloadsCollectionViewFlowLayout

- (CGSize)collectionViewContentSize
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  objc_super v13;
  objc_super v14;
  CGSize result;
  CGRect v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewFlowLayout collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollection"));
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  if (v5 == (id)2)
  {
    v14.receiver = self;
    v14.super_class = (Class)MTDownloadsCollectionViewFlowLayout;
    -[MTDownloadsCollectionViewFlowLayout collectionViewContentSize](&v14, "collectionViewContentSize");
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewFlowLayout collectionView](self, "collectionView"));
    objc_msgSend(v8, "contentInset");
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewFlowLayout collectionView](self, "collectionView"));
    objc_msgSend(v11, "bounds");
    v12 = CGRectGetHeight(v16) - v10 + -20.0;

    v13.receiver = self;
    v13.super_class = (Class)MTDownloadsCollectionViewFlowLayout;
    -[MTDownloadsCollectionViewFlowLayout collectionViewContentSize](&v13, "collectionViewContentSize");
    if (v12 >= v7)
      v7 = v12;
  }
  result.height = v7;
  result.width = v6;
  return result;
}

@end
