@implementation PXGScrollLayout

- (PXGScrollLayout)init
{
  PXGScrollLayout *v2;
  PXGScrollLayout *v3;
  PXGScrollViewModel *v4;
  PXGScrollViewModel *scrollViewModel;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXGScrollLayout;
  v2 = -[PXGLayout init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_wantsScrollView = 1;
    v2->_scrollViewSpriteZPosition = -1.0;
    v2->_transfersScrollToContainer = 1;
    v4 = objc_alloc_init(PXGScrollViewModel);
    scrollViewModel = v3->_scrollViewModel;
    v3->_scrollViewModel = v4;

    -[PXGScrollViewModel registerChangeObserver:context:](v3->_scrollViewModel, "registerChangeObserver:context:", v3, ScrollViewModelObservationContext_233689);
    -[PXGLayout setContentSource:](v3, "setContentSource:", v3);
    -[PXGScrollLayout setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[PXGScrollLayout setShowsVerticalScrollIndicator:](v3, "setShowsVerticalScrollIndicator:", 1);
    -[PXGScrollLayout setShowsHorizontalScrollIndicator:](v3, "setShowsHorizontalScrollIndicator:", 1);
    v3->_scrollViewSpriteIndex = 0;
    -[PXGLayout addSpritesInRange:initialState:](v3, "addSpritesInRange:initialState:", 0x100000000, 0);
  }
  return v3;
}

- (PXGScrollLayout)initWithContentLayout:(id)a3
{
  id v4;
  PXGScrollLayout *v5;

  v4 = a3;
  v5 = -[PXGScrollLayout init](self, "init");
  -[PXGScrollLayout setContentLayout:](v5, "setContentLayout:", v4);

  return v5;
}

- (PXGLayout)contentLayout
{
  void *v3;

  if (-[PXGLayout numberOfSublayouts](self, "numberOfSublayouts") < 1)
  {
    v3 = 0;
  }
  else
  {
    -[PXGLayout sublayoutAtIndex:loadIfNeeded:](self, "sublayoutAtIndex:loadIfNeeded:", 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PXGLayout *)v3;
}

- (void)setContentLayout:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[PXGScrollLayout contentLayout](self, "contentLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v5)
  {
    objc_msgSend(v4, "removeFromSuperlayout");
    if (v5)
      -[PXGScrollLayout insertSublayout:atIndex:](self, "insertSublayout:atIndex:", v5, 0);
    -[PXGScrollLayout contentLayoutDidChange](self, "contentLayoutDidChange");
  }

}

- (void)setDelegate:(id)a3
{
  PXGScrollLayoutDelegate **p_delegate;
  id WeakRetained;
  id v6;
  $43E13F0CD4CF7722F74E8D3D6FC84CEE *p_delegateRespondsTo;
  id v8;
  id v9;
  id v10;
  id obj;

  obj = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v6 = objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    self->_delegateRespondsTo.willBeginScrolling = objc_opt_respondsToSelector() & 1;

    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    p_delegateRespondsTo->didScroll = objc_opt_respondsToSelector() & 1;

    v9 = objc_loadWeakRetained((id *)p_delegate);
    p_delegateRespondsTo->willEndScrollingWithVelocityTargetContentOffsetCurrentContentOffset = objc_opt_respondsToSelector() & 1;

    v10 = objc_loadWeakRetained((id *)p_delegate);
    p_delegateRespondsTo->didEndScrolling = objc_opt_respondsToSelector() & 1;

  }
}

- (void)insertSublayout:(id)a3 atIndex:(int64_t)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXGScrollLayout;
  -[PXGLayout insertSublayout:atIndex:](&v6, sel_insertSublayout_atIndex_, a3);
  if (!a4)
    -[PXGScrollLayout _invalidateContentLayout](self, "_invalidateContentLayout");
}

- (void)setFixedWidth:(id)a3
{
  NSNumber *v5;
  char v6;
  NSNumber *v7;

  v7 = (NSNumber *)a3;
  v5 = self->_fixedWidth;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSNumber isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_fixedWidth, a3);
      -[PXGScrollLayout _invalidateContentLayout](self, "_invalidateContentLayout");
    }
  }

}

- (void)setFixedHeight:(id)a3
{
  NSNumber *v5;
  char v6;
  NSNumber *v7;

  v7 = (NSNumber *)a3;
  v5 = self->_fixedHeight;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSNumber isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_fixedHeight, a3);
      -[PXGScrollLayout _invalidateContentLayout](self, "_invalidateContentLayout");
    }
  }

}

- (void)setWantsScrollView:(BOOL)a3
{
  if (self->_wantsScrollView != a3)
  {
    self->_wantsScrollView = a3;
    -[PXGScrollLayout _invalidateLocalContent](self, "_invalidateLocalContent");
  }
}

- (void)setScrollViewSpriteZPosition:(float)a3
{
  if (self->_scrollViewSpriteZPosition != a3)
  {
    self->_scrollViewSpriteZPosition = a3;
    -[PXGScrollLayout _invalidateLocalContent](self, "_invalidateLocalContent");
  }
}

- (void)setClipsToBounds:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  if (self->_clipsToBounds != a3)
  {
    self->_clipsToBounds = a3;
    -[PXGScrollLayout scrollViewModel](self, "scrollViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __36__PXGScrollLayout_setClipsToBounds___block_invoke;
    v5[3] = &__block_descriptor_33_e37_v16__0___PXGMutableScrollViewModel__8l;
    v6 = a3;
    objc_msgSend(v4, "performChanges:", v5);

  }
}

- (void)setShowsHorizontalScrollIndicator:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  if (self->_showsHorizontalScrollIndicator != a3)
  {
    self->_showsHorizontalScrollIndicator = a3;
    -[PXGScrollLayout scrollViewModel](self, "scrollViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __53__PXGScrollLayout_setShowsHorizontalScrollIndicator___block_invoke;
    v5[3] = &__block_descriptor_33_e37_v16__0___PXGMutableScrollViewModel__8l;
    v6 = a3;
    objc_msgSend(v4, "performChanges:", v5);

  }
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  if (self->_showsVerticalScrollIndicator != a3)
  {
    self->_showsVerticalScrollIndicator = a3;
    -[PXGScrollLayout scrollViewModel](self, "scrollViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __51__PXGScrollLayout_setShowsVerticalScrollIndicator___block_invoke;
    v5[3] = &__block_descriptor_33_e37_v16__0___PXGMutableScrollViewModel__8l;
    v6 = a3;
    objc_msgSend(v4, "performChanges:", v5);

  }
}

- (void)setAlwaysBounceHorizontal:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  if (self->_alwaysBounceHorizontal != a3)
  {
    self->_alwaysBounceHorizontal = a3;
    -[PXGScrollLayout scrollViewModel](self, "scrollViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45__PXGScrollLayout_setAlwaysBounceHorizontal___block_invoke;
    v5[3] = &__block_descriptor_33_e37_v16__0___PXGMutableScrollViewModel__8l;
    v6 = a3;
    objc_msgSend(v4, "performChanges:", v5);

  }
}

- (void)setAlwaysBounceVertical:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  if (self->_alwaysBounceVertical != a3)
  {
    self->_alwaysBounceVertical = a3;
    -[PXGScrollLayout scrollViewModel](self, "scrollViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__PXGScrollLayout_setAlwaysBounceVertical___block_invoke;
    v5[3] = &__block_descriptor_33_e37_v16__0___PXGMutableScrollViewModel__8l;
    v6 = a3;
    objc_msgSend(v4, "performChanges:", v5);

  }
}

- (void)setHorizontalScrollIndicatorInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_horizontalScrollIndicatorInsets;
  void *v9;
  _QWORD v10[8];

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_horizontalScrollIndicatorInsets = &self->_horizontalScrollIndicatorInsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_horizontalScrollIndicatorInsets->top = top;
    p_horizontalScrollIndicatorInsets->left = left;
    p_horizontalScrollIndicatorInsets->bottom = bottom;
    p_horizontalScrollIndicatorInsets->right = right;
    -[PXGScrollLayout scrollViewModel](self, "scrollViewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__PXGScrollLayout_setHorizontalScrollIndicatorInsets___block_invoke;
    v10[3] = &__block_descriptor_64_e37_v16__0___PXGMutableScrollViewModel__8l;
    *(CGFloat *)&v10[4] = top;
    *(CGFloat *)&v10[5] = left;
    *(CGFloat *)&v10[6] = bottom;
    *(CGFloat *)&v10[7] = right;
    objc_msgSend(v9, "performChanges:", v10);

  }
}

- (void)setVerticalScrollIndicatorInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_verticalScrollIndicatorInsets;
  void *v9;
  _QWORD v10[8];

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_verticalScrollIndicatorInsets = &self->_verticalScrollIndicatorInsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_verticalScrollIndicatorInsets->top = top;
    p_verticalScrollIndicatorInsets->left = left;
    p_verticalScrollIndicatorInsets->bottom = bottom;
    p_verticalScrollIndicatorInsets->right = right;
    -[PXGScrollLayout scrollViewModel](self, "scrollViewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__PXGScrollLayout_setVerticalScrollIndicatorInsets___block_invoke;
    v10[3] = &__block_descriptor_64_e37_v16__0___PXGMutableScrollViewModel__8l;
    *(CGFloat *)&v10[4] = top;
    *(CGFloat *)&v10[5] = left;
    *(CGFloat *)&v10[6] = bottom;
    *(CGFloat *)&v10[7] = right;
    objc_msgSend(v9, "performChanges:", v10);

  }
}

- (void)setHitTestContentInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_hitTestContentInsets;
  void *v9;
  _QWORD v10[8];

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_hitTestContentInsets = &self->_hitTestContentInsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_hitTestContentInsets->top = top;
    p_hitTestContentInsets->left = left;
    p_hitTestContentInsets->bottom = bottom;
    p_hitTestContentInsets->right = right;
    -[PXGScrollLayout scrollViewModel](self, "scrollViewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__PXGScrollLayout_setHitTestContentInsets___block_invoke;
    v10[3] = &__block_descriptor_64_e37_v16__0___PXGMutableScrollViewModel__8l;
    *(CGFloat *)&v10[4] = top;
    *(CGFloat *)&v10[5] = left;
    *(CGFloat *)&v10[6] = bottom;
    *(CGFloat *)&v10[7] = right;
    objc_msgSend(v9, "performChanges:", v10);

  }
}

- (void)setHorizontalInterPageSpacing:(double)a3
{
  void *v4;
  _QWORD v5[5];

  if (self->_horizontalInterPageSpacing != a3)
  {
    self->_horizontalInterPageSpacing = a3;
    -[PXGScrollLayout scrollViewModel](self, "scrollViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __49__PXGScrollLayout_setHorizontalInterPageSpacing___block_invoke;
    v5[3] = &__block_descriptor_40_e37_v16__0___PXGMutableScrollViewModel__8l;
    *(double *)&v5[4] = a3;
    objc_msgSend(v4, "performChanges:", v5);

  }
}

- (void)setDraggingPerformsScroll:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  if (self->_draggingPerformsScroll != a3)
  {
    self->_draggingPerformsScroll = a3;
    -[PXGScrollLayout scrollViewModel](self, "scrollViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45__PXGScrollLayout_setDraggingPerformsScroll___block_invoke;
    v5[3] = &__block_descriptor_33_e37_v16__0___PXGMutableScrollViewModel__8l;
    v6 = a3;
    objc_msgSend(v4, "performChanges:", v5);

  }
}

- (void)setScrollDecelerationRate:(int64_t)a3
{
  void *v4;
  _QWORD v5[5];

  if (self->_scrollDecelerationRate != a3)
  {
    self->_scrollDecelerationRate = a3;
    -[PXGScrollLayout scrollViewModel](self, "scrollViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45__PXGScrollLayout_setScrollDecelerationRate___block_invoke;
    v5[3] = &__block_descriptor_40_e37_v16__0___PXGMutableScrollViewModel__8l;
    v5[4] = a3;
    objc_msgSend(v4, "performChanges:options:", v5, 1);

  }
}

- (void)setIsScrolling:(BOOL)a3
{
  if (self->_isScrolling != a3)
  {
    self->_isScrolling = a3;
    -[PXGScrollLayout isScrollingDidChange](self, "isScrollingDidChange");
  }
}

- (void)setTransfersScrollToContainer:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  if (self->_transfersScrollToContainer != a3)
  {
    self->_transfersScrollToContainer = a3;
    -[PXGScrollLayout scrollViewModel](self, "scrollViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __49__PXGScrollLayout_setTransfersScrollToContainer___block_invoke;
    v5[3] = &__block_descriptor_33_e37_v16__0___PXGMutableScrollViewModel__8l;
    v6 = a3;
    objc_msgSend(v4, "performChanges:", v5);

  }
}

- (void)stopScrolling
{
  id v2;

  -[PXGScrollLayout scrollViewModel](self, "scrollViewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performChanges:options:", &__block_literal_global_233731, 5);

}

- (void)visibleRectDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGScrollLayout;
  -[PXGLayout visibleRectDidChange](&v3, sel_visibleRectDidChange);
  -[PXGScrollLayout _invalidateContentLayout](self, "_invalidateContentLayout");
}

- (void)viewEnvironmentDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGScrollLayout;
  -[PXGLayout viewEnvironmentDidChange](&v3, sel_viewEnvironmentDidChange);
  -[PXGScrollLayout _invalidateContentLayout](self, "_invalidateContentLayout");
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGScrollLayout;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXGScrollLayout _invalidateContentLayout](self, "_invalidateContentLayout");
}

- (void)displayScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGScrollLayout;
  -[PXGLayout displayScaleDidChange](&v3, sel_displayScaleDidChange);
  -[PXGScrollLayout _invalidateContentLayout](self, "_invalidateContentLayout");
}

- (void)lastScrollDirectionDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGScrollLayout;
  -[PXGLayout lastScrollDirectionDidChange](&v3, sel_lastScrollDirectionDidChange);
  -[PXGScrollLayout _invalidateContentLayout](self, "_invalidateContentLayout");
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGScrollLayout;
  -[PXGLayout safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[PXGScrollLayout _invalidateContentLayout](self, "_invalidateContentLayout");
}

- (void)userInterfaceDirectionDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGScrollLayout;
  -[PXGLayout userInterfaceDirectionDidChange](&v3, sel_userInterfaceDirectionDidChange);
  -[PXGScrollLayout _invalidateContentLayout](self, "_invalidateContentLayout");
}

- (void)contentSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGScrollLayout;
  -[PXGLayout contentSizeDidChange](&v3, sel_contentSizeDidChange);
  -[PXGScrollLayout _invalidateLocalContent](self, "_invalidateLocalContent");
}

- (void)alphaDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGScrollLayout;
  -[PXGLayout alphaDidChange](&v3, sel_alphaDidChange);
  -[PXGScrollLayout _invalidateLocalContent](self, "_invalidateLocalContent");
}

- (void)sublayoutNeedsUpdate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXGScrollLayout;
  -[PXGLayout sublayoutNeedsUpdate:](&v4, sel_sublayoutNeedsUpdate_, a3);
  -[PXGScrollLayout _invalidateContentLayout](self, "_invalidateContentLayout");
}

- (int64_t)intrinsicScrollRegime
{
  void *v2;
  int64_t v3;

  -[PXGScrollLayout scrollViewModel](self, "scrollViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scrollRegime");

  return v3;
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  void *v6;
  int64_t v7;

  *a5 = objc_retainAutorelease(a3);
  -[PXGScrollLayout contentLayout](self, "contentLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[PXGLayout indexOfSublayout:](self, "indexOfSublayout:", v6);
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (id)createAnchorForVisibleAreaIgnoringEdges:(unint64_t)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXGScrollLayout;
  -[PXGLayout createAnchorForVisibleAreaIgnoringEdges:](&v6, sel_createAnchorForVisibleAreaIgnoringEdges_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);
  return v4;
}

- (int64_t)scrollableAxis
{
  void *v3;
  void *v4;
  id v5;
  int64_t v6;
  objc_super v8;

  -[PXGScrollLayout contentLayout](self, "contentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (id)objc_msgSend(v3, "scrollableAxis");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PXGScrollLayout;
    v5 = -[PXGLayout scrollableAxis](&v8, sel_scrollableAxis);
  }
  v6 = (int64_t)v5;

  return v6;
}

- (CGPoint)anchor:(id)a3 visibleRectOriginForProposedVisibleRect:(CGRect)a4 forLayout:(id)a5
{
  double y;
  double x;
  double height;
  double width;
  id v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  CGPoint result;

  y = a4.origin.y;
  x = a4.origin.x;
  if (self->_delegateRespondsTo.willEndScrollingWithVelocityTargetContentOffsetCurrentContentOffset)
  {
    height = a4.size.height;
    width = a4.size.width;
    v10 = a5;
    -[PXGScrollLayout contentLayout](self, "contentLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "convertRect:fromLayout:", v10, x, y, width, height);
    v12 = *MEMORY[0x1E0C9D538];
    v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    PXPointSubtract();
    -[PXGScrollLayout delegate](self, "delegate", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scrollLayoutWillEndScrolling:withVelocity:targetContentOffset:currentContentOffset:", self, &v21, v12, v13, *(double *)off_1E50B8580, *((double *)off_1E50B8580 + 1));

    PXPointSubtract();
    objc_msgSend(v10, "convertPoint:fromLayout:", v11);
    x = v17;
    y = v18;

  }
  v19 = x;
  v20 = y;
  result.y = v20;
  result.x = v19;
  return result;
}

- (id)layoutForItemChanges
{
  void *v2;
  void *v3;

  -[PXGScrollLayout contentLayout](self, "contentLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutForItemChanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGScrollLayout;
  -[PXGLayout willUpdate](&v5, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGScrollLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXGScrollLayout.m"), 384, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
}

- (void)update
{
  uint64_t v3;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 isPerformingUpdate;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v3 = -[PXGLayout numberOfDescendantAnchors](self, "numberOfDescendantAnchors");
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (v3 >= 1)
  {
    isPerformingUpdate = self->_updateFlags.isPerformingUpdate;
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGScrollLayout update]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXGScrollLayout.m"), 390, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    needsUpdate |= 1uLL;
    p_updateFlags->needsUpdate = needsUpdate;
    self->_updateFlags.willPerformUpdate = 0;
    if (!isPerformingUpdate)
      goto LABEL_5;
    goto LABEL_15;
  }
  self->_updateFlags.willPerformUpdate = 0;
  if (!needsUpdate)
    goto LABEL_12;
  if (self->_updateFlags.isPerformingUpdate)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGScrollLayout update]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXGScrollLayout.m"), 393, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

    needsUpdate = p_updateFlags->needsUpdate;
  }
LABEL_5:
  self->_updateFlags.isPerformingUpdate = 1;
  self->_updateFlags.updated = 1;
  if ((needsUpdate & 1) != 0)
  {
    p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
    -[PXGScrollLayout _updateContentLayout](self, "_updateContentLayout");
    if (!self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGScrollLayout update]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXGScrollLayout.m"), 397, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
  }
  v7 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 2uLL;
  if ((v7 & 2) != 0)
  {
    p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFFDLL;
    -[PXGScrollLayout _updateLocalContent](self, "_updateLocalContent");
    v7 = p_updateFlags->needsUpdate;
  }
  self->_updateFlags.isPerformingUpdate = 0;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGScrollLayout update]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXGScrollLayout.m"), 400, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

  }
LABEL_12:
  v16.receiver = self;
  v16.super_class = (Class)PXGScrollLayout;
  -[PXGLayout update](&v16, sel_update);
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGScrollLayout;
  -[PXGLayout didUpdate](&v5, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGScrollLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXGScrollLayout.m"), 406, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
}

- (void)_invalidateContentLayout
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  if (!self->_isUpdatingContentLayout)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGScrollLayout _invalidateContentLayout]");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGScrollLayout.m"), 411, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)_updateContentLayout
{
  BOOL isUpdatingContentLayout;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  uint64_t v56;
  double v57;
  double v58;
  _QWORD v59[8];
  _QWORD v60[11];

  isUpdatingContentLayout = self->_isUpdatingContentLayout;
  self->_isUpdatingContentLayout = 1;
  -[PXGScrollLayout contentLayout](self, "contentLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout referenceSize](self, "referenceSize");
  v7 = v6;
  v9 = v8;
  -[PXGScrollLayout fixedWidth](self, "fixedWidth");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGScrollLayout fixedHeight](self, "fixedHeight");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v10, "doubleValue");
    v7 = v12;
  }
  if (v11)
  {
    objc_msgSend(v11, "doubleValue");
    v9 = v13;
  }
  -[PXGLayout viewEnvironment](self, "viewEnvironment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setViewEnvironment:", v14);

  objc_msgSend(v5, "setReferenceSize:", v7, v9);
  -[PXGLayout referenceDepth](self, "referenceDepth");
  objc_msgSend(v5, "setReferenceDepth:");
  objc_msgSend(v5, "setReferenceOptions:", -[PXGLayout referenceOptions](self, "referenceOptions"));
  -[PXGLayout displayScale](self, "displayScale");
  objc_msgSend(v5, "setDisplayScale:");
  objc_msgSend(v5, "setLastScrollDirection:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  objc_msgSend(v5, "setSafeAreaInsets:");
  objc_msgSend(v5, "setUserInterfaceDirection:", -[PXGLayout userInterfaceDirection](self, "userInterfaceDirection"));
  -[PXGScrollLayout scrollViewModel](self, "scrollViewModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentOffset");
  -[PXGLayout visibleRect](self, "visibleRect");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  PXPointAdd();
  v57 = v23;
  v58 = v21;
  PXRectWithOriginAndSize();
  objc_msgSend(v5, "setVisibleRect:");
  objc_msgSend(v5, "createAnchorFromSuperlayoutWithSublayoutIndex:sublayoutPositionEdges:ignoringScrollingAnimationAnchors:", 0, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v24, "autoInvalidate");

  objc_msgSend(v5, "updateIfNeeded");
  objc_msgSend(v5, "visibleRect");
  v27 = v26;
  v29 = v28;
  objc_msgSend(v5, "contentSize");
  v31 = v30;
  v33 = v32;
  -[PXGLayout setContentSize:](self, "setContentSize:", v7, v9);
  if (PXFloatApproximatelyEqualToFloat())
    v19 = v29;
  if (PXFloatApproximatelyEqualToFloat())
    v17 = v27;
  PXPointSubtract();
  v35 = v34;
  v37 = v36;
  if (-[PXGScrollLayout isScrolling](self, "isScrolling")
    || (objc_msgSend(v15, "contentOffset"), v39 = v38, v41 = v40, objc_msgSend(v15, "contentSize"), v39 < 0.0))
  {
    v44 = v58;
LABEL_30:
    v47 = v57;
    goto LABEL_31;
  }
  v44 = v58;
  if (v41 < 0.0)
    goto LABEL_30;
  v45 = ceil(v42 - v58);
  v46 = 0.0;
  if (v45 < 0.0)
    v45 = 0.0;
  if (v39 > v45)
    goto LABEL_30;
  v47 = v57;
  v48 = ceil(v43 - v57);
  if (v48 >= 0.0)
    v46 = v48;
  if (v41 <= v46)
  {
    v49 = v31 - v58;
    if (v35 < v31 - v58)
      v49 = v35;
    if (v49 >= 0.0)
      v50 = v49;
    else
      v50 = 0.0;
    v51 = v33 - v57;
    if (v37 < v33 - v57)
      v51 = v37;
    if (v51 >= 0.0)
      v52 = v51;
    else
      v52 = 0.0;
    PXPointSubtract();
    PXPointAdd();
    v47 = v57;
    v44 = v58;
    v17 = v53;
    v19 = v54;
    v37 = v52;
    v35 = v50;
  }
LABEL_31:
  -[PXGLayout changeVisibleRectToProposedVisibleRect:](self, "changeVisibleRectToProposedVisibleRect:", v17, v19, v44, v47);
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = MEMORY[0x1E0C809B0];
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __39__PXGScrollLayout__updateContentLayout__block_invoke;
  v60[3] = &unk_1E513AEC8;
  v60[4] = self;
  v60[5] = a2;
  *(double *)&v60[6] = v31;
  *(double *)&v60[7] = v33;
  *(double *)&v60[8] = v35;
  *(double *)&v60[9] = v37;
  objc_msgSend(v55, "enumerateSublayoutGeometriesUsingBlock:", v60);

  v59[0] = v56;
  v59[1] = 3221225472;
  v59[2] = __39__PXGScrollLayout__updateContentLayout__block_invoke_2;
  v59[3] = &__block_descriptor_64_e37_v16__0___PXGMutableScrollViewModel__8l;
  *(double *)&v59[4] = v31;
  *(double *)&v59[5] = v33;
  *(double *)&v59[6] = v35;
  *(double *)&v59[7] = v37;
  objc_msgSend(v15, "performChanges:options:", v59, 1);
  self->_isUpdatingContentLayout = isUpdatingContentLayout;

}

- (void)_invalidateScrollView
{
  ++self->_scrollViewMediaVersion;
  -[PXGScrollLayout _invalidateLocalContent](self, "_invalidateLocalContent");
}

- (void)_invalidateLocalContent
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGScrollLayout _invalidateLocalContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGScrollLayout.m"), 491, CFSTR("invalidating %lu after it already has been updated"), 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 2;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateLocalContent
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[9];

  -[PXGLayout contentSize](self, "contentSize");
  PXRectWithOriginAndSize();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __38__PXGScrollLayout__updateLocalContent__block_invoke;
  v12[3] = &unk_1E513AEF0;
  v12[4] = self;
  v12[5] = v4;
  v12[6] = v6;
  v12[7] = v8;
  v12[8] = v10;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v11 << 32, v12);
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;

  v7 = a4;
  if (self->_scrollViewSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGScrollLayout.m"), 513, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  objc_opt_class();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v9;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  PXGScrollViewContainerConfiguration *v9;
  void *v10;
  void *v12;

  v7 = a4;
  if (self->_scrollViewSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGScrollLayout.m"), 524, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  v9 = objc_alloc_init(PXGScrollViewContainerConfiguration);
  -[PXGScrollLayout scrollViewModel](self, "scrollViewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGScrollViewContainerConfiguration setScrollViewModel:](v9, "setScrollViewModel:", v10);

  -[PXGScrollViewContainerConfiguration setDelegate:](v9, "setDelegate:", self);
  return v9;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v6 = a4;
  v9 = a3;
  if ((void *)ScrollViewModelObservationContext_233689 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGScrollLayout.m"), 544, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  if ((v6 & 2) != 0)
  {
    v13 = v9;
    v11 = objc_msgSend(v9, "changesOptions");
    v10 = v13;
    if ((v11 & 1) == 0)
    {
      -[PXGScrollLayout _invalidateContentLayout](self, "_invalidateContentLayout");
      v10 = v13;
    }
  }

}

- (void)scrollViewContainerWillBeginScrolling:(id)a3
{
  id v4;

  -[PXGScrollLayout setIsScrolling:](self, "setIsScrolling:", 1);
  if (self->_delegateRespondsTo.willBeginScrolling)
  {
    -[PXGScrollLayout delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scrollLayoutWillBeginScrolling:", self);

  }
}

- (void)scrollViewContainerDidScroll:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[PXGScrollLayout isScrolling](self, "isScrolling") && _PXPPTCurrentlyTestedScrollView)
    -[PXGScrollLayout scrollViewContainerWillBeginScrolling:](self, "scrollViewContainerWillBeginScrolling:", v5);
  if (-[PXGScrollLayout isScrolling](self, "isScrolling"))
    -[PXGLayout clearLastVisibleAreaAnchoringInformation](self, "clearLastVisibleAreaAnchoringInformation");
  if (self->_delegateRespondsTo.didScroll)
  {
    -[PXGScrollLayout delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scrollLayoutDidScroll:", self);

  }
}

- (void)scrollViewContainerWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6
{
  double y;
  double x;
  double v9;
  double v10;
  id v12;

  if (self->_delegateRespondsTo.willEndScrollingWithVelocityTargetContentOffsetCurrentContentOffset)
  {
    y = a6.y;
    x = a6.x;
    v9 = a4.y;
    v10 = a4.x;
    -[PXGScrollLayout delegate](self, "delegate", a3);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scrollLayoutWillEndScrolling:withVelocity:targetContentOffset:currentContentOffset:", self, a5, v10, v9, x, y);

  }
}

- (void)scrollViewContainerDidEndScrolling:(id)a3
{
  id v4;

  -[PXGScrollLayout setIsScrolling:](self, "setIsScrolling:", 0);
  if (self->_delegateRespondsTo.didEndScrolling)
  {
    -[PXGScrollLayout delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scrollLayoutDidEndScrolling:", self);

  }
}

- (id)focusItemsForScrollViewContainer:(id)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(a3, "scrollViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGScrollLayout contentLayout](self, "contentLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "axGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "focusItemsForScrollViewController:inRect:", v9, x, y, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)axShouldBeConsideredAsSubgroup
{
  return 0;
}

- (id)axSpriteIndexes
{
  return objc_alloc_init(MEMORY[0x1E0CB36B8]);
}

- (id)axContainingScrollViewForAXGroup:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PXGLayout rootLayout](self, "rootLayout", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForSpriteIndex:", objc_msgSend(v4, "convertSpriteIndex:fromDescendantLayout:", self->_scrollViewSpriteIndex, self));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PXGScrollLayoutDelegate)delegate
{
  return (PXGScrollLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSNumber)fixedWidth
{
  return self->_fixedWidth;
}

- (NSNumber)fixedHeight
{
  return self->_fixedHeight;
}

- (float)scrollViewSpriteZPosition
{
  return self->_scrollViewSpriteZPosition;
}

- (int64_t)scrollDecelerationRate
{
  return self->_scrollDecelerationRate;
}

- (BOOL)clipsToBounds
{
  return self->_clipsToBounds;
}

- (BOOL)showsHorizontalScrollIndicator
{
  return self->_showsHorizontalScrollIndicator;
}

- (BOOL)showsVerticalScrollIndicator
{
  return self->_showsVerticalScrollIndicator;
}

- (BOOL)alwaysBounceHorizontal
{
  return self->_alwaysBounceHorizontal;
}

- (BOOL)alwaysBounceVertical
{
  return self->_alwaysBounceVertical;
}

- (UIEdgeInsets)horizontalScrollIndicatorInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_horizontalScrollIndicatorInsets.top;
  left = self->_horizontalScrollIndicatorInsets.left;
  bottom = self->_horizontalScrollIndicatorInsets.bottom;
  right = self->_horizontalScrollIndicatorInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)verticalScrollIndicatorInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_verticalScrollIndicatorInsets.top;
  left = self->_verticalScrollIndicatorInsets.left;
  bottom = self->_verticalScrollIndicatorInsets.bottom;
  right = self->_verticalScrollIndicatorInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)hitTestContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitTestContentInsets.top;
  left = self->_hitTestContentInsets.left;
  bottom = self->_hitTestContentInsets.bottom;
  right = self->_hitTestContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)draggingPerformsScroll
{
  return self->_draggingPerformsScroll;
}

- (BOOL)transfersScrollToContainer
{
  return self->_transfersScrollToContainer;
}

- (double)horizontalInterPageSpacing
{
  return self->_horizontalInterPageSpacing;
}

- (PXGScrollViewModel)scrollViewModel
{
  return self->_scrollViewModel;
}

- (BOOL)wantsScrollView
{
  return self->_wantsScrollView;
}

- (BOOL)isScrolling
{
  return self->_isScrolling;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollViewModel, 0);
  objc_storeStrong((id *)&self->_fixedHeight, 0);
  objc_storeStrong((id *)&self->_fixedWidth, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __38__PXGScrollLayout__updateLocalContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int *v8;
  uint64_t v9;
  float v10;
  float v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t result;
  float v27;
  double v28;
  CGFloat Width;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v8 = *(unsigned int **)(a1 + 32);
  v9 = a3 + 32 * v8[218];
  objc_msgSend(v8, "scrollViewSpriteZPosition");
  v11 = v10;
  v12 = *(double *)(a1 + 40);
  v13 = *(double *)(a1 + 48);
  v14 = *(double *)(a1 + 56);
  v15 = *(double *)(a1 + 64);
  v30.origin.x = v12;
  v30.origin.y = v13;
  v30.size.width = v14;
  v30.size.height = v15;
  MidX = CGRectGetMidX(v30);
  v31.origin.x = v12;
  v31.origin.y = v13;
  v31.size.width = v14;
  v31.size.height = v15;
  MidY = CGRectGetMidY(v31);
  v32.origin.x = v12;
  v32.origin.y = v13;
  v32.size.width = v14;
  v32.size.height = v15;
  Width = CGRectGetWidth(v32);
  v33.origin.x = v12;
  v33.origin.y = v13;
  v33.size.width = v14;
  v33.size.height = v15;
  Height = CGRectGetHeight(v33);
  v19.f64[0] = Width;
  v19.f64[1] = Height;
  *(CGFloat *)v9 = MidX;
  *(CGFloat *)(v9 + 8) = MidY;
  *(double *)(v9 + 16) = v11;
  *(float32x2_t *)(v9 + 24) = vcvt_f32_f64(v19);
  v20 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872));
  v21 = *((_OWORD *)off_1E50B83A0 + 7);
  v20[6] = *((_OWORD *)off_1E50B83A0 + 6);
  v20[7] = v21;
  v22 = *((_OWORD *)off_1E50B83A0 + 9);
  v20[8] = *((_OWORD *)off_1E50B83A0 + 8);
  v20[9] = v22;
  v23 = *((_OWORD *)off_1E50B83A0 + 3);
  v20[2] = *((_OWORD *)off_1E50B83A0 + 2);
  v20[3] = v23;
  v24 = *((_OWORD *)off_1E50B83A0 + 5);
  v20[4] = *((_OWORD *)off_1E50B83A0 + 4);
  v20[5] = v24;
  v25 = *((_OWORD *)off_1E50B83A0 + 1);
  *v20 = *(_OWORD *)off_1E50B83A0;
  v20[1] = v25;
  result = objc_msgSend(*(id *)(a1 + 32), "alpha");
  v27 = 0.0;
  if (v28 > 0.0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "wantsScrollView");
    v27 = 1.0;
    if (!(_DWORD)result)
      v27 = 0.0;
  }
  *(float *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872)) = v27;
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872)) = 1;
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872) + 1) = 10;
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 876);
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872) + 34) = 2;
  return result;
}

uint64_t __39__PXGScrollLayout__updateContentLayout__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PXGScrollLayout.m"), 472, CFSTR("PXGScrollLayout only supports a single sublayout"));

  }
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(a1 + 48);
  result = PXPointSubtract();
  *(_QWORD *)(a3 + 48) = v6;
  *(_QWORD *)(a3 + 56) = v7;
  *(_QWORD *)(a3 + 64) = 0;
  return result;
}

void __39__PXGScrollLayout__updateContentLayout__block_invoke_2(double *a1, void *a2)
{
  double v3;
  double v4;
  id v5;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v5, "setContentSize:", v3, v4);
  objc_msgSend(v5, "setContentOffset:", a1[6], a1[7]);

}

uint64_t __32__PXGScrollLayout_stopScrolling__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stopScrolling");
}

uint64_t __49__PXGScrollLayout_setTransfersScrollToContainer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTransfersScrollToContainer:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __45__PXGScrollLayout_setScrollDecelerationRate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setScrollDecelerationRate:", *(_QWORD *)(a1 + 32));
}

uint64_t __45__PXGScrollLayout_setDraggingPerformsScroll___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDraggingPerformsScroll:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __49__PXGScrollLayout_setHorizontalInterPageSpacing___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHorizontalInterPageSpacing:", *(double *)(a1 + 32));
}

uint64_t __43__PXGScrollLayout_setHitTestContentInsets___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setHitTestContentInsets:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __52__PXGScrollLayout_setVerticalScrollIndicatorInsets___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setVerticalScrollIndicatorInsets:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __54__PXGScrollLayout_setHorizontalScrollIndicatorInsets___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setHorizontalScrollIndicatorInsets:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __43__PXGScrollLayout_setAlwaysBounceVertical___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlwaysBounceVertical:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __45__PXGScrollLayout_setAlwaysBounceHorizontal___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlwaysBounceHorizontal:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __51__PXGScrollLayout_setShowsVerticalScrollIndicator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShowsVerticalScrollIndicator:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __53__PXGScrollLayout_setShowsHorizontalScrollIndicator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShowsHorizontalScrollIndicator:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __36__PXGScrollLayout_setClipsToBounds___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setClipsToBounds:", *(unsigned __int8 *)(a1 + 32));
}

- (id)px_assetsSectionLayout
{
  void *v2;
  void *v3;

  -[PXGScrollLayout contentLayout](self, "contentLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_assetsSectionLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)px_modifyAssetsSectionLayoutGeometry:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__PXGScrollLayout_PXPhotosSectionedLayout__px_modifyAssetsSectionLayoutGeometry___block_invoke;
  v7[3] = &unk_1E513B9B8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateSublayoutGeometriesUsingBlock:", v7);

}

uint64_t __81__PXGScrollLayout_PXPhotosSectionedLayout__px_modifyAssetsSectionLayoutGeometry___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
