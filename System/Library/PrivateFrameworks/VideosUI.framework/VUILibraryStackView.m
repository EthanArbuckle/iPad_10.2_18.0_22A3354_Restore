@implementation VUILibraryStackView

- (void)setCollectionView:(id)a3
{
  UICollectionView *v5;
  UICollectionView *collectionView;
  UICollectionView *v7;

  v5 = (UICollectionView *)a3;
  collectionView = self->_collectionView;
  if (collectionView != v5)
  {
    v7 = v5;
    -[UICollectionView removeFromSuperview](collectionView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_collectionView, a3);
    if (self->_collectionView)
      -[VUILibraryStackView addSubview:](self, "addSubview:");
    -[VUILibraryStackView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)layoutSubviews
{
  -[VUILibraryStackView bounds](self, "bounds");
  -[UICollectionView setFrame:](self->_collectionView, "setFrame:");
}

- (VUILibraryStackView)initWithFrame:(CGRect)a3
{
  VUILibraryStackView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUILibraryStackView;
  v3 = -[VUILibraryStackView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILibraryStackView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
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
