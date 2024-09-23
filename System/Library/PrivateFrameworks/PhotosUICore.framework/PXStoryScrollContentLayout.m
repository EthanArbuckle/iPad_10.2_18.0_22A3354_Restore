@implementation PXStoryScrollContentLayout

- (PXStoryScrollContentLayout)init
{
  PXStoryScrollContentLayout *v2;
  PXStoryScrollContentLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryScrollContentLayout;
  v2 = -[PXGLayout init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PXGLayout addSpriteWithInitialState:](v2, "addSpriteWithInitialState:", 0);
  return v3;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.scrollOffsetDidChange = objc_opt_respondsToSelector() & 1;

  }
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrollContentLayout;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXStoryScrollContentLayout _invalidateContentSize](self, "_invalidateContentSize");
}

- (void)visibleRectDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrollContentLayout;
  -[PXGLayout visibleRectDidChange](&v3, sel_visibleRectDidChange);
  -[PXStoryScrollContentLayout _scrollOffsetFromVisibleRect](self, "_scrollOffsetFromVisibleRect");
  -[PXStoryScrollContentLayout _setScrollOffset:updateScrollPosition:](self, "_setScrollOffset:updateScrollPosition:", 0);
}

- (CGPoint)_scrollOffsetFromVisibleRect
{
  double v3;
  double v4;
  CGPoint result;

  -[PXGLayout visibleRect](self, "visibleRect");
  -[PXStoryScrollContentLayout _scrollOffsetForVisibleRectOrigin:](self, "_scrollOffsetForVisibleRectOrigin:");
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setScrollableOutsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_scrollableOutsets;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_scrollableOutsets = &self->_scrollableOutsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_scrollableOutsets->top = top;
    p_scrollableOutsets->left = left;
    p_scrollableOutsets->bottom = bottom;
    p_scrollableOutsets->right = right;
    -[PXStoryScrollContentLayout _invalidateContentSize](self, "_invalidateContentSize");
  }
}

- (void)setScrollOffset:(CGPoint)a3
{
  -[PXStoryScrollContentLayout _setScrollOffset:updateScrollPosition:](self, "_setScrollOffset:updateScrollPosition:", 1, a3.x, a3.y);
}

- (void)_setScrollOffset:(CGPoint)a3 updateScrollPosition:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  void *v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  uint64_t v18;
  _BOOL8 v19;
  void *v20;
  id v21;
  _QWORD v22[7];

  v4 = a4;
  y = a3.y;
  x = a3.x;
  if (a3.x != self->_scrollOffset.x || a3.y != self->_scrollOffset.y)
  {
    self->_scrollOffset = a3;
    if (self->_delegateRespondsTo.scrollOffsetDidChange)
    {
      -[PXStoryScrollContentLayout delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scrollContentLayoutScrollOffsetDidChange:", self);

    }
  }
  if (v4)
  {
    -[PXStoryScrollContentLayout _scrollOffsetFromVisibleRect](self, "_scrollOffsetFromVisibleRect");
    if (x != v11 || y != v10)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __68__PXStoryScrollContentLayout__setScrollOffset_updateScrollPosition___block_invoke;
      v22[3] = &unk_1E5125040;
      v22[4] = self;
      *(double *)&v22[5] = x;
      *(double *)&v22[6] = y;
      -[PXGLayout modifySpritesInRange:fullState:](self, "modifySpritesInRange:fullState:", 0x100000000, v22);
      -[PXStoryScrollContentLayout scrollableOutsets](self, "scrollableOutsets");
      v17 = v16 <= 0.0 && v14 <= 0.0;
      v18 = 8;
      if (v17)
        v18 = 0;
      v19 = v15 > 0.0 || v13 > 0.0;
      -[PXGLayout createAnchorForScrollingSpriteAtIndex:toScrollPosition:padding:](self, "createAnchorForScrollingSpriteAtIndex:toScrollPosition:padding:", 0, v18 | v19, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (id)objc_msgSend(v20, "autoInvalidate");

    }
  }
}

- (CGPoint)_visibleRectOriginForScrollOffset:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[PXStoryScrollContentLayout scrollableOutsets](self, "scrollableOutsets");
  v6 = x + v5;
  v7 = y + v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)_scrollOffsetForVisibleRectOrigin:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[PXStoryScrollContentLayout scrollableOutsets](self, "scrollableOutsets");
  v6 = x - v5;
  v7 = y - v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollContentLayout update]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrollContentLayout.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXStoryScrollContentLayout _updateContentSize](self, "_updateContentSize");
      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollContentLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXStoryScrollContentLayout.m"), 123, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXStoryScrollContentLayout;
  -[PXGLayout update](&v9, sel_update);
}

- (void)_invalidateContentSize
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
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollContentLayout _invalidateContentSize]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrollContentLayout.m"), 128, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[PXGLayout referenceSize](self, "referenceSize");
  v4 = v3;
  v6 = v5;
  -[PXStoryScrollContentLayout scrollableOutsets](self, "scrollableOutsets");
  -[PXGLayout setContentSize:](self, "setContentSize:", v4 + v7 + v8, v6 + v9 + v10);
}

- (UIEdgeInsets)scrollableOutsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_scrollableOutsets.top;
  left = self->_scrollableOutsets.left;
  bottom = self->_scrollableOutsets.bottom;
  right = self->_scrollableOutsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGPoint)scrollOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_scrollOffset.x;
  y = self->_scrollOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (PXStoryScrollContentLayoutDelegate)delegate
{
  return (PXStoryScrollContentLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

float32x2_t __68__PXStoryScrollContentLayout__setScrollOffset_updateScrollPosition___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float32x2_t *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat v10;
  float64x2_t v11;
  float32x2_t result;
  CGFloat v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v3 = *(float32x2_t **)(a3 + 16);
  objc_msgSend(*(id *)(a1 + 32), "_visibleRectOriginForScrollOffset:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  PXRectWithOriginAndSize();
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  MidX = CGRectGetMidX(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  MidY = CGRectGetMidY(v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v13 = CGRectGetWidth(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v10 = CGRectGetHeight(v17);
  v11.f64[0] = v13;
  v11.f64[1] = v10;
  result = vcvt_f32_f64(v11);
  *(CGFloat *)v3 = MidX;
  *(CGFloat *)&v3[1] = MidY;
  v3[2] = 0;
  v3[3] = result;
  return result;
}

@end
