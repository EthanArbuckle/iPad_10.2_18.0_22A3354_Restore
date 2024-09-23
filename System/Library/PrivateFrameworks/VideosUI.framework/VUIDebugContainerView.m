@implementation VUIDebugContainerView

- (void)setCollectionView:(id)a3
{
  UICollectionView *v5;
  UICollectionView *collectionView;
  UICollectionView *v7;

  v5 = (UICollectionView *)a3;
  collectionView = self->_collectionView;
  v7 = v5;
  if (collectionView != v5)
  {
    -[UICollectionView removeFromSuperview](collectionView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_collectionView, a3);
    if (self->_collectionView)
      -[VUIDebugContainerView addSubview:](self, "addSubview:");
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIDebugContainerView;
  -[VUIDebugContainerView layoutSubviews](&v3, sel_layoutSubviews);
  -[VUIDebugContainerView bounds](self, "bounds");
  -[UICollectionView setFrame:](self->_collectionView, "setFrame:");
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
