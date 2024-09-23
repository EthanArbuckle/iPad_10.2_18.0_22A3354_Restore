@implementation _PXUIScrollView

- (UIEdgeInsets)safeAreaInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIEdgeInsets result;

  if (-[_PXUIScrollView ignoresSafeAreaInsets](self, "ignoresSafeAreaInsets"))
  {
    v3 = *MEMORY[0x1E0DC49E8];
    v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_PXUIScrollView;
    -[_PXUIScrollView safeAreaInsets](&v7, sel_safeAreaInsets);
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)ignoresSafeAreaInsets
{
  return self->_ignoresSafeAreaInsets;
}

- (BOOL)deferContentOffsetUpdates
{
  return self->_deferContentOffsetUpdates;
}

- (void)setDeferContentOffsetUpdates:(BOOL)a3
{
  if (self->_deferContentOffsetUpdates != a3)
  {
    self->_deferContentOffsetUpdates = a3;
    kdebug_trace();
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  -[_PXUIScrollView px_delegate](self, "px_delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollViewWillLayoutSubviews:", self);

  v5.receiver = self;
  v5.super_class = (Class)_PXUIScrollView;
  -[_PXUIScrollView layoutSubviews](&v5, sel_layoutSubviews);
  -[_PXUIScrollView px_delegate](self, "px_delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollViewDidLayoutSubviews:", self);

}

- (PXUIScrollViewDelegate)px_delegate
{
  return (PXUIScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_px_delegate);
}

- (void)setFocusItemProvider:(id)a3
{
  objc_storeWeak((id *)&self->_focusItemProvider, a3);
}

- (void)addSubview:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[NSMutableArray addObject:](self->_scrollIndicatorViews, "addObject:", v4);
  v5.receiver = self;
  v5.super_class = (Class)_PXUIScrollView;
  -[_PXUIScrollView addSubview:](&v5, sel_addSubview_, v4);

}

- (void)setRespectsContentZOrder:(BOOL)a3
{
  self->_respectsContentZOrder = a3;
}

- (void)px_setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_px_delegate, a3);
}

- (_PXUIScrollView)initWithFrame:(CGRect)a3
{
  _PXUIScrollView *v3;
  NSMutableArray *v4;
  NSMutableArray *scrollIndicatorViews;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PXUIScrollView;
  v3 = -[_PXUIScrollView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    scrollIndicatorViews = v3->_scrollIndicatorViews;
    v3->_scrollIndicatorViews = v4;

  }
  return v3;
}

- (void)willRemoveSubview:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[NSMutableArray removeObject:](self->_scrollIndicatorViews, "removeObject:", v4);
  v5.receiver = self;
  v5.super_class = (Class)_PXUIScrollView;
  -[_PXUIScrollView willRemoveSubview:](&v5, sel_willRemoveSubview_, v4);

}

- (void)px_addSubview:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PXUIScrollView;
  -[_PXUIScrollView addSubview:](&v3, sel_addSubview_, a3);
}

- (void)setPagingOriginOffset:(CGPoint)a3
{
  if (a3.x != self->_pagingOriginOffset.x || a3.y != self->_pagingOriginOffset.y)
  {
    self->_pagingOriginOffset = a3;
    -[_PXUIScrollView _updatePagingOrigin](self, "_updatePagingOrigin");
  }
}

- (void)_updatePagingOrigin
{
  -[_PXUIScrollView contentInset](self, "contentInset");
  -[_PXUIScrollView pagingOriginOffset](self, "pagingOriginOffset");
  PXPointAdd();
  -[_PXUIScrollView _setPagingOrigin:](self, "_setPagingOrigin:");
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v16;
  void *v17;
  objc_super v18;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[_PXUIScrollView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");

  if (v4)
  {
    PXPointRoundToPixel();
    v10 = v9;
    v12 = v11;
    -[_PXUIScrollView contentOffset](self, "contentOffset");
    PXPointRoundToPixel();
    if (v10 != v14 || v12 != v13)
    {
      -[UIScrollView px_contentOffsetForEdge:](self, "px_contentOffsetForEdge:", 1);
      -[UIScrollView px_contentOffsetForEdge:](self, "px_contentOffsetForEdge:", 3);
      if ((PXFloatApproximatelyEqualToFloat() & 1) != 0)
      {
        v16 = 0;
      }
      else if ((PXFloatApproximatelyEqualToFloat() & 1) != 0)
      {
        v16 = 1;
      }
      else if (PXFloatApproximatelyEqualToFloat())
      {
        v16 = 4;
      }
      else
      {
        v16 = 0;
      }
      -[UIScrollView px_contentOffsetForEdge:](self, "px_contentOffsetForEdge:", 0);
      -[UIScrollView px_contentOffsetForEdge:](self, "px_contentOffsetForEdge:", 2);
      if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
      {
        if (PXFloatApproximatelyEqualToFloat())
        {
          v16 |= 2uLL;
        }
        else if (PXFloatApproximatelyEqualToFloat())
        {
          v16 |= 8uLL;
        }
      }
      -[_PXUIScrollView px_delegate](self, "px_delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scrollView:willBeginScrollingAnimationTowardsContentEdges:", self, v16);

    }
  }
  v18.receiver = self;
  v18.super_class = (Class)_PXUIScrollView;
  -[_PXUIScrollView setContentOffset:animated:](&v18, sel_setContentOffset_animated_, v4, x, y);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  objc_super v16;
  objc_super v17;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  double v22;
  double v23;
  _QWORD v24[4];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__5027;
  v29 = __Block_byref_object_dispose__5028;
  v30 = 0;
  if (-[_PXUIScrollView respectsContentZOrder](self, "respectsContentZOrder")
    && (!objc_msgSend(v7, "type") || objc_msgSend(v7, "type") == 11))
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v24[3] = 0xFFEFFFFFFFFFFFFFLL;
    -[_PXUIScrollView subviews](self, "subviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __37___PXUIScrollView_hitTest_withEvent___block_invoke;
    v18[3] = &unk_1E5116F98;
    v22 = x;
    v23 = y;
    v20 = v24;
    v18[4] = self;
    v9 = v7;
    v19 = v9;
    v21 = &v25;
    objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", 2, v18);

    if (!v26[5])
    {
      v17.receiver = self;
      v17.super_class = (Class)_PXUIScrollView;
      -[_PXUIScrollView hitTest:withEvent:](&v17, sel_hitTest_withEvent_, v9, x, y);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v26[5];
      v26[5] = v10;

    }
    _Block_object_dispose(v24, 8);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)_PXUIScrollView;
    -[_PXUIScrollView hitTest:withEvent:](&v16, sel_hitTest_withEvent_, v7, x, y);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v26[5];
    v26[5] = v12;

  }
  v14 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  -[_PXUIScrollView bounds](self, "bounds", a4);
  -[_PXUIScrollView hitTestContentInsets](self, "hitTestContentInsets");
  PXEdgeInsetsInsetRect();
  v8.x = x;
  v8.y = y;
  return CGRectContainsPoint(v9, v8);
}

- (CGRect)scrollIndicatorFrameForAxis:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGRect v35;
  CGRect v36;
  CGRect result;

  v34 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[_PXUIScrollView scrollIndicatorViews](self, "scrollIndicatorViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
        if (a3 == 2)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v9), "frame");
          v15 = v14;
          objc_msgSend(v10, "frame");
          if (v15 > v16)
            goto LABEL_14;
        }
        else if (a3 == 1)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v9), "frame");
          v12 = v11;
          objc_msgSend(v10, "frame");
          if (v12 > v13)
          {
LABEL_14:
            -[_PXUIScrollView _scrollIndicatorContainerRect](self, "_scrollIndicatorContainerRect");
            v22 = v21;
            v24 = v23;
            objc_msgSend(v10, "frame");
            v36 = CGRectOffset(v35, -v22, -v24);
            x = v36.origin.x;
            y = v36.origin.y;
            width = v36.size.width;
            height = v36.size.height;

            goto LABEL_15;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v7)
        continue;
      break;
    }
  }

  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_15:
  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (id)focusItemsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)_PXUIScrollView;
  -[_PXUIScrollView focusItemsInRect:](&v14, sel_focusItemsInRect_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXUIScrollView focusItemProvider](self, "focusItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "focusItemsForScrollView:inRect:", self, x, y, width, height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }

  return v8;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PXUIScrollView;
  -[_PXUIScrollView didUpdateFocusInContext:withAnimationCoordinator:](&v6, sel_didUpdateFocusInContext_withAnimationCoordinator_, a3, a4);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68___PXUIScrollView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
  v5[3] = &unk_1E5149198;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0CD28B0], "addCommitHandler:forPhase:", v5, 0);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;

  v4 = a3;
  -[_PXUIScrollView panGestureRecognizer](self, "panGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v4)
  {
LABEL_12:
    v17 = 1;
    goto LABEL_13;
  }
  objc_msgSend(v4, "velocityInView:", self);
  v7 = v6;
  v9 = v8;
  if (-[_PXUIScrollView shouldScrollSimultaneouslyWithDescendantScrollView](self, "shouldScrollSimultaneouslyWithDescendantScrollView"))
  {
    v10 = -[UIScrollView px_scrollableAxis](self, "px_scrollableAxis");
    MEMORY[0x1A85CCC64](v9, v7);
    PXRadiansToDegrees();
    if (v10 == 2)
    {
      +[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "upGesturesAngularToleranceInDegrees");
      v19 = PXFloatEqualToFloatWithTolerance();

      if ((v19 & 1) == 0)
      {
        +[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "downGesturesAngularToleranceInDegrees");
        v21 = PXFloatEqualToFloatWithTolerance();

        if ((v21 & 1) == 0)
          goto LABEL_14;
      }
    }
    else if (v10 == 1)
    {
      +[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "horizontalGesturesAngularToleranceInDegrees");

      if ((PXFloatEqualToFloatWithTolerance() & 1) == 0 && !PXFloatEqualToFloatWithTolerance())
      {
LABEL_14:
        v17 = 0;
        goto LABEL_13;
      }
    }
    -[_PXUIScrollView px_enumerateDescendantSubviewsUsingBlock:](self, "px_enumerateDescendantSubviewsUsingBlock:", &__block_literal_global_228);
    goto LABEL_12;
  }
  objc_msgSend(v4, "locationInView:", self);
  v13 = v12;
  v15 = v14;
  -[_PXUIScrollView px_delegate](self, "px_delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "scrollView:shouldBeginScrollingWithPanAtLocation:velocity:", self, v13, v15, v7, v9);

LABEL_13:
  return v17;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  int v11;
  id v12;
  uint64_t v13;
  id v15;

  v6 = a3;
  v7 = a4;
  if (-[_PXUIScrollView shouldScrollSimultaneouslyWithDescendantScrollView](self, "shouldScrollSimultaneouslyWithDescendantScrollView"))
  {
    -[_PXUIScrollView panGestureRecognizer](self, "panGestureRecognizer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8 == v6)
    {
      v15 = 0;
      v11 = objc_msgSend(v7, "px_isPanGestureRecognizerOfScrollView:", &v15);
      v12 = v15;
      v9 = v12;
      if (v11)
      {
        v13 = objc_msgSend(v12, "px_scrollableAxis");
        if (v13 != -[UIScrollView px_scrollableAxis](self, "px_scrollableAxis"))
        {
          v10 = objc_msgSend(v9, "isDescendantOfView:", self);
          goto LABEL_8;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    v10 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (void)setIsFocusFastScrolling:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_isFocusFastScrolling != a3)
  {
    v3 = a3;
    self->_isFocusFastScrolling = a3;
    -[_PXUIScrollView px_delegate](self, "px_delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "scrollViewDidBeginFocusFastScrolling:", self);
    else
      objc_msgSend(v5, "scrollViewDidEndFocusFastScrolling:", self);

  }
}

- (_PXUIScrollViewFocusItemProvider)focusItemProvider
{
  return (_PXUIScrollViewFocusItemProvider *)objc_loadWeakRetained((id *)&self->_focusItemProvider);
}

- (CGPoint)pagingOriginOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_pagingOriginOffset.x;
  y = self->_pagingOriginOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)respectsContentZOrder
{
  return self->_respectsContentZOrder;
}

- (void)setIgnoresSafeAreaInsets:(BOOL)a3
{
  self->_ignoresSafeAreaInsets = a3;
}

- (BOOL)isFocusFastScrolling
{
  return self->_isFocusFastScrolling;
}

- (BOOL)shouldScrollSimultaneouslyWithDescendantScrollView
{
  return self->_shouldScrollSimultaneouslyWithDescendantScrollView;
}

- (void)setShouldScrollSimultaneouslyWithDescendantScrollView:(BOOL)a3
{
  self->_shouldScrollSimultaneouslyWithDescendantScrollView = a3;
}

- (NSMutableArray)scrollIndicatorViews
{
  return self->_scrollIndicatorViews;
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

- (void)setHitTestContentInsets:(UIEdgeInsets)a3
{
  self->_hitTestContentInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollIndicatorViews, 0);
  objc_destroyWeak((id *)&self->_focusItemProvider);
  objc_destroyWeak((id *)&self->_px_delegate);
}

@end
