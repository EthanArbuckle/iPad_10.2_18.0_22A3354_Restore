@implementation VUIShelfView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  double v6;
  double v7;
  UIView *headerView;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;
  CGRect v18;

  width = a3.width;
  v5 = (void *)MEMORY[0x1E0DC3F98];
  -[VUIShelfView bounds](self, "bounds", a3.width, a3.height);
  objc_msgSend(v5, "vui_paddingForWindowWidth:", CGRectGetWidth(v18));
  headerView = self->_headerView;
  if (headerView)
  {
    -[UIView sizeThatFits:](headerView, "sizeThatFits:", width - (v6 + v7), 1.79769313e308);
    v10 = v9 + 0.0;
  }
  else
  {
    v10 = 0.0;
  }
  -[VUIShelfView collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "collectionViewLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "computedContentHeight");
  v14 = v10 + v13;

  v15 = width;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)setHeaderView:(id)a3
{
  UIView *v5;
  UIView *headerView;
  UIView *v7;

  v5 = (UIView *)a3;
  headerView = self->_headerView;
  if (headerView != v5)
  {
    v7 = v5;
    if (headerView)
      -[UIView removeFromSuperview](headerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_headerView, a3);
    if (self->_headerView)
      -[VUIShelfView addSubview:](self, "addSubview:");
    -[VUIShelfView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  UIView *headerView;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double MaxY;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;

  v21.receiver = self;
  v21.super_class = (Class)VUIShelfView;
  -[VUIShelfView layoutSubviews](&v21, sel_layoutSubviews);
  v3 = (void *)MEMORY[0x1E0DC3F98];
  -[VUIShelfView bounds](self, "bounds");
  objc_msgSend(v3, "vui_paddingForWindowWidth:", CGRectGetWidth(v22));
  headerView = self->_headerView;
  if (headerView)
  {
    v7 = v4;
    v8 = v5;
    -[VUIShelfView bounds](self, "bounds");
    -[UIView sizeThatFits:](headerView, "sizeThatFits:", v9 - (v7 + v8), 1.79769313e308);
    v11 = v10;
    v13 = v12;
    -[VUIShelfView headerView](self, "headerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v7, 0.0, v11, v13);

    -[VUIShelfView collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIShelfView headerView](self, "headerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    MaxY = CGRectGetMaxY(v23);
    -[VUIShelfView bounds](self, "bounds");
    v19 = v18;
    -[VUIShelfView bounds](self, "bounds");
    objc_msgSend(v15, "setFrame:", 0.0, MaxY, v19, v20 - v13);

  }
  else
  {
    -[VUIShelfView collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIShelfView bounds](self, "bounds");
    objc_msgSend(v15, "setFrame:");
  }

}

- (UIView)headerView
{
  return self->_headerView;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
