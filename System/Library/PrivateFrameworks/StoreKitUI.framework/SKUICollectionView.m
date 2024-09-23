@implementation SKUICollectionView

- (SKUICollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  SKUICollectionView *v10;
  SKUICollectionView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUICollectionView initWithFrame:collectionViewLayout:].cold.1();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUICollectionView;
  v10 = -[SKUICollectionView initWithFrame:collectionViewLayout:](&v13, sel_initWithFrame_collectionViewLayout_, v9, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v10->_externalShowsHorizontalScrollIndicator = -[SKUICollectionView showsHorizontalScrollIndicator](v10, "showsHorizontalScrollIndicator");
    v11->_externalShowsVerticalScrollIndicator = -[SKUICollectionView showsVerticalScrollIndicator](v11, "showsVerticalScrollIndicator");
    -[SKUICollectionView setPrefetchingEnabled:](v11, "setPrefetchingEnabled:", 0);
    -[SKUICollectionView _setContentInsetAdjustmentBehavior:](v11, "_setContentInsetAdjustmentBehavior:", 101);
  }

  return v11;
}

- (id)collectionViewLayout
{
  UICollectionViewLayout *pendingCollectionViewLayout;
  objc_super v4;

  pendingCollectionViewLayout = self->_pendingCollectionViewLayout;
  if (pendingCollectionViewLayout)
    return pendingCollectionViewLayout;
  v4.receiver = self;
  v4.super_class = (Class)SKUICollectionView;
  -[SKUICollectionView collectionViewLayout](&v4, sel_collectionViewLayout);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setCollectionViewLayout:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UICollectionViewLayout **p_pendingCollectionViewLayout;
  id v8;
  UICollectionViewLayout *v9;
  objc_super v10;

  v4 = a4;
  p_pendingCollectionViewLayout = &self->_pendingCollectionViewLayout;
  objc_storeStrong((id *)&self->_pendingCollectionViewLayout, a3);
  v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUICollectionView;
  -[SKUICollectionView setCollectionViewLayout:animated:](&v10, sel_setCollectionViewLayout_animated_, v8, v4);
  v9 = *p_pendingCollectionViewLayout;
  *p_pendingCollectionViewLayout = 0;

}

- (void)setDelegate:(id)a3
{
  id v4;
  char v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKUICollectionView;
  v4 = a3;
  -[SKUICollectionView setDelegate:](&v6, sel_setDelegate_, v4);
  v5 = objc_opt_respondsToSelector();

  self->_delegateWantsWillLayoutSubviews = v5 & 1;
}

- (CGRect)bounds
{
  double v3;
  double v4;
  double overrideBoundsWidth;
  double v6;
  objc_super v7;
  CGRect result;

  v7.receiver = self;
  v7.super_class = (Class)SKUICollectionView;
  -[SKUICollectionView bounds](&v7, sel_bounds);
  if (self->_overrideBoundsWidth > 0.00000011920929)
    overrideBoundsWidth = self->_overrideBoundsWidth;
  result.size.height = v6;
  result.size.width = overrideBoundsWidth;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  if (self->_delegateWantsWillLayoutSubviews)
  {
    -[SKUICollectionView delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "skuiCollectionViewWillLayoutSubviews:", self);

  }
  if (self->_refreshControl)
    -[SKUICollectionView sendSubviewToBack:](self, "sendSubviewToBack:");
  v4.receiver = self;
  v4.super_class = (Class)SKUICollectionView;
  -[SKUICollectionView layoutSubviews](&v4, sel_layoutSubviews);
  -[SKUICollectionView _updateIndexBarControlFrame](self, "_updateIndexBarControlFrame");
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUICollectionView;
  -[SKUICollectionView setContentOffset:animated:](&v5, sel_setContentOffset_animated_, a4, a3.x, a3.y);
  -[SKUICollectionView _updateIndexBarControlFrame](self, "_updateIndexBarControlFrame");
}

- (void)setShowsHorizontalScrollIndicator:(BOOL)a3
{
  if (self->_externalShowsHorizontalScrollIndicator != a3)
  {
    self->_externalShowsHorizontalScrollIndicator = a3;
    -[SKUICollectionView _updateShowsScrollIndicators](self, "_updateShowsScrollIndicators");
  }
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  if (self->_externalShowsVerticalScrollIndicator != a3)
  {
    self->_externalShowsVerticalScrollIndicator = a3;
    -[SKUICollectionView _updateShowsScrollIndicators](self, "_updateShowsScrollIndicators");
  }
}

- (void)setIndexBarControl:(id)a3
{
  SKUIIndexBarControl *v5;
  SKUIIndexBarControl **p_indexBarControl;
  SKUIIndexBarControl *indexBarControl;
  SKUIIndexBarControl *v8;

  v5 = (SKUIIndexBarControl *)a3;
  p_indexBarControl = &self->_indexBarControl;
  indexBarControl = self->_indexBarControl;
  v8 = v5;
  if (indexBarControl != v5)
  {
    if (-[SKUIIndexBarControl isDescendantOfView:](indexBarControl, "isDescendantOfView:", self))
      -[SKUIIndexBarControl removeFromSuperview](*p_indexBarControl, "removeFromSuperview");
    objc_storeStrong((id *)&self->_indexBarControl, a3);
    -[SKUICollectionView _updateShowsScrollIndicators](self, "_updateShowsScrollIndicators");
    -[SKUICollectionView setNeedsLayout](self, "setNeedsLayout");
    v5 = *p_indexBarControl;
  }
  if (v5 && (-[SKUIIndexBarControl isDescendantOfView:](v5, "isDescendantOfView:", self) & 1) == 0)
  {
    -[SKUICollectionView addSubview:](self, "addSubview:", *p_indexBarControl);
    -[SKUICollectionView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setRefreshControl:(id)a3
{
  UIRefreshControl *v5;
  UIRefreshControl *refreshControl;
  UIRefreshControl *v7;

  v5 = (UIRefreshControl *)a3;
  refreshControl = self->_refreshControl;
  if (refreshControl != v5)
  {
    v7 = v5;
    if (refreshControl)
      -[UIRefreshControl removeFromSuperview](refreshControl, "removeFromSuperview");
    objc_storeStrong((id *)&self->_refreshControl, a3);
    -[SKUICollectionView _addContentSubview:atBack:](self, "_addContentSubview:atBack:", self->_refreshControl, 1);
    v5 = v7;
  }

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKUICollectionView;
  -[SKUICollectionView setContentInset:](&v3, sel_setContentInset_, a3.top, a3.left, a3.bottom, a3.right);
}

- (void)_updateIndexBarControlFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  double Height;
  double v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double MaxX;
  CGFloat v30;
  CGFloat MinY;
  SKUIIndexBarControl *indexBarControl;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  CGFloat v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  -[SKUICollectionView bounds](self, "bounds");
  v4 = v3;
  rect_24 = v5;
  v37 = v3;
  v6 = v5;
  v8 = v7;
  rect_8 = v9;
  rect_16 = v7;
  v10 = v9;
  -[SKUICollectionView contentInset](self, "contentInset");
  v12 = v4 + v11;
  v14 = v6 + v13;
  v16 = v8 - (v11 + v15);
  v18 = v10 - (v13 + v17);
  -[SKUIIndexBarControl frame](self->_indexBarControl, "frame");
  v20 = v19;
  rect = v19;
  v22 = v21;
  v38.origin.x = v12;
  v38.origin.y = v14;
  v38.size.width = v16;
  v38.size.height = v18;
  v23 = CGRectGetWidth(v38) * 0.25;
  v39.origin.x = v12;
  v39.origin.y = v14;
  v39.size.width = v16;
  v39.size.height = v18;
  Height = CGRectGetHeight(v39);
  -[SKUIIndexBarControl sizeThatFits:](self->_indexBarControl, "sizeThatFits:", v23, Height);
  v26 = v25;
  v40.size.height = v27;
  v40.origin.x = v20;
  v40.origin.y = v22;
  v40.size.width = v26;
  v28 = CGRectGetHeight(v40);
  if (v28 >= Height)
    Height = v28;
  v41.origin.x = v12;
  v41.origin.y = v14;
  v41.size.width = v16;
  v41.size.height = v18;
  MaxX = CGRectGetMaxX(v41);
  v42.origin.x = rect;
  v42.origin.y = v22;
  v42.size.width = v26;
  v42.size.height = Height;
  v30 = MaxX - CGRectGetWidth(v42);
  v43.origin.x = v12;
  v43.origin.y = v14;
  v43.size.width = v16;
  v43.size.height = v18;
  MinY = CGRectGetMinY(v43);
  indexBarControl = self->_indexBarControl;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v30, MinY, v26, Height, v37, rect_24, rect_16, rect_8);
  -[SKUIIndexBarControl setFrame:](indexBarControl, "setFrame:");
}

- (void)_updateShowsScrollIndicators
{
  _BOOL8 externalShowsHorizontalScrollIndicator;
  objc_super v4;
  objc_super v5;
  objc_super v6;
  objc_super v7;

  if (self->_indexBarControl)
  {
    v7.receiver = self;
    v7.super_class = (Class)SKUICollectionView;
    -[SKUICollectionView setShowsHorizontalScrollIndicator:](&v7, sel_setShowsHorizontalScrollIndicator_, 0);
    v6.receiver = self;
    v6.super_class = (Class)SKUICollectionView;
    -[SKUICollectionView setShowsVerticalScrollIndicator:](&v6, sel_setShowsVerticalScrollIndicator_, 0, v4.receiver, v4.super_class);
  }
  else
  {
    externalShowsHorizontalScrollIndicator = self->_externalShowsHorizontalScrollIndicator;
    v5.receiver = self;
    v5.super_class = (Class)SKUICollectionView;
    -[SKUICollectionView setShowsHorizontalScrollIndicator:](&v5, sel_setShowsHorizontalScrollIndicator_, externalShowsHorizontalScrollIndicator);
    -[SKUICollectionView setShowsVerticalScrollIndicator:](&v4, sel_setShowsVerticalScrollIndicator_, self->_externalShowsVerticalScrollIndicator, self, SKUICollectionView);
  }
}

- (double)overrideBoundsWidth
{
  return self->_overrideBoundsWidth;
}

- (void)setOverrideBoundsWidth:(double)a3
{
  self->_overrideBoundsWidth = a3;
}

- (UIRefreshControl)refreshControl
{
  return self->_refreshControl;
}

- (SKUIIndexBarControl)indexBarControl
{
  return self->_indexBarControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexBarControl, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_storeStrong((id *)&self->_pendingCollectionViewLayout, 0);
}

- (void)initWithFrame:collectionViewLayout:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUICollectionView initWithFrame:collectionViewLayout:]";
}

@end
