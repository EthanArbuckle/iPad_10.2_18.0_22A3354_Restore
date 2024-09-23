@implementation StepPagingCollectionViewFlowLayout

- (void)prepareLayout
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StepPagingCollectionViewFlowLayout collectionView](self, "collectionView"));
  objc_msgSend(v3, "bounds");
  -[StepPagingCollectionViewFlowLayout _updateAttributesForSize:](self, "_updateAttributesForSize:", v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)StepPagingCollectionViewFlowLayout;
  -[StepPagingCollectionViewFlowLayout prepareLayout](&v6, "prepareLayout");
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  _BOOL4 v9;

  height = a3.size.height;
  width = a3.size.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[StepPagingCollectionViewFlowLayout collectionView](self, "collectionView", a3.origin.x, a3.origin.y));
  objc_msgSend(v6, "bounds");
  v9 = height != v8 || width != v7;

  if (v9)
    -[StepPagingCollectionViewFlowLayout _updateAttributesForSize:](self, "_updateAttributesForSize:", width, height);
  return v9;
}

@end
