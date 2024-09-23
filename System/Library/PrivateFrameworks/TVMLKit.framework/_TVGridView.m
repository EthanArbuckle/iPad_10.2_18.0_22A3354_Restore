@implementation _TVGridView

- (_TVGridView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TVCollectionViewFlowLayout *v8;
  _TVGridView *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc_init(_TVCollectionViewFlowLayout);
  -[UICollectionViewFlowLayout setScrollDirection:](v8, "setScrollDirection:", 0);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v8, "setMinimumInteritemSpacing:", 0.0);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v8, "setMinimumLineSpacing:", 0.0);
  v9 = -[_TVGridView initWithFrame:collectionViewLayout:](self, "initWithFrame:collectionViewLayout:", v8, x, y, width, height);

  return v9;
}

- (_TVGridView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  _TVGridView *v4;
  _TVGridView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVGridView;
  v4 = -[_TVCollectionView initWithFrame:collectionViewLayout:](&v7, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[_TVCollectionView setScrollEnabled:](v4, "setScrollEnabled:", 0);
    -[_TVGridView _setShouldDeriveVisibleBoundsFromContainingScrollView:](v5, "_setShouldDeriveVisibleBoundsFromContainingScrollView:", 1);
    -[_TVGridView _setNeedsLayoutOnVisibleBoundsChange:](v5, "_setNeedsLayoutOnVisibleBoundsChange:", 1);
    -[_TVGridView setOpaque:](v5, "setOpaque:", 0);
    -[_TVGridView setBackgroundColor:](v5, "setBackgroundColor:", 0);
    -[_TVGridView setClipsToBounds:](v5, "setClipsToBounds:", 0);
  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  id v4;
  char v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVGridView;
  v4 = a3;
  -[_TVCollectionView setDelegate:](&v6, sel_setDelegate_, v4);
  v5 = objc_opt_respondsToSelector();

  self->_delegateRespondsToIndexPathForPreferredFocusedView = v5 & 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_TVGridView contentInset](self, "contentInset");
  -[_TVGridView tv_sizeThatFits:withContentInset:](self, "tv_sizeThatFits:withContentInset:", width, height, v6, v7, v8, v9);
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)tv_sizeThatFits:(CGSize)a3 withContentInset:(UIEdgeInsets)a4
{
  double bottom;
  double top;
  CGFloat width;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  bottom = a4.bottom;
  top = a4.top;
  width = a3.width;
  v7 = a3.width - a4.left - a4.right;
  if (v7 >= 0.0)
    v8 = v7;
  else
    v8 = 0.0;
  -[_TVGridView gridFlowLayout](self, "gridFlowLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentHeightThatFitsItemCount:expectedWidth:", 0, v8);
  v11 = bottom + top + v10;

  v12 = width;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)setGridFlowLayout:(id)a3
{
  objc_storeStrong((id *)&self->_gridFlowLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridFlowLayout, 0);
}

@end
