@implementation PXUIScrollViewController

- (CGRect)scrollViewVisibleRectOutsideBounds
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  CGRect result;

  -[PXUIScrollViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "clipsToBounds") & 1) == 0)
  {
    while (1)
    {
      objc_msgSend(v3, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        break;
      objc_msgSend(v3, "superview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v4;
      if (objc_msgSend(v4, "clipsToBounds"))
        goto LABEL_5;
    }
  }
  v4 = v3;
LABEL_5:
  -[PXUIScrollViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v6, "convertRect:fromView:", v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)self->_scrollView;
}

- (BOOL)deferContentOffsetUpdates
{
  return -[_PXUIScrollView deferContentOffsetUpdates](self->_scrollView, "deferContentOffsetUpdates");
}

- (void)setDeferContentOffsetUpdates:(BOOL)a3
{
  -[_PXUIScrollView setDeferContentOffsetUpdates:](self->_scrollView, "setDeferContentOffsetUpdates:", a3);
}

- (BOOL)isDragging
{
  return -[_PXUIScrollView isDragging](self->_scrollView, "isDragging");
}

- (BOOL)isTracking
{
  return -[_PXUIScrollView isTracking](self->_scrollView, "isTracking");
}

- (BOOL)isDecelerating
{
  return -[_PXUIScrollView isDecelerating](self->_scrollView, "isDecelerating");
}

- (CGRect)scrollViewVisibleRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[_PXUIScrollView bounds](self->_scrollView, "bounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)scrollViewConstrainedVisibleRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  -[_PXUIScrollView bounds](self->_scrollView, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIScrollView px_constrainedContentOffset:](self->_scrollView, "px_constrainedContentOffset:");
  v9 = v4;
  v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)scrollViewTargetRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGSize)scrollViewReferenceSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[_PXUIScrollView bounds](self->_scrollView, "bounds");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (CGRect)scrollViewContentBounds
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
  CGRect result;

  -[_PXUIScrollView contentInset](self->_scrollView, "contentInset");
  v4 = -v3;
  -[_PXUIScrollView contentInset](self->_scrollView, "contentInset");
  v6 = -v5;
  -[PXUIScrollViewController scrollViewContentSize](self, "scrollViewContentSize");
  -[_PXUIScrollView contentInset](self->_scrollView, "contentInset");
  sub_1A7AE3F38();
  PXEdgeInsetsInsetSize();
  v8 = v7;
  v10 = v9;
  v11 = v4;
  v12 = v6;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGSize)scrollViewContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[_PXUIScrollView contentSize](self->_scrollView, "contentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)isScrubbing
{
  return -[_PXUIScrollView _isScrubbing](self->_scrollView, "_isScrubbing");
}

- (void)setScrollViewNeedsLayout
{
  -[_PXUIScrollView setNeedsLayout](self->_scrollView, "setNeedsLayout");
}

- (void)setScrollViewContentBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXUIScrollViewController scrollViewContentBounds](self, "scrollViewContentBounds");
  v19.origin.x = v8;
  v19.origin.y = v9;
  v19.size.width = v10;
  v19.size.height = v11;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  if (!CGRectEqualToRect(v16, v19))
  {
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    v12 = -CGRectGetMinY(v17);
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v13 = -CGRectGetMinX(v18);
    -[_PXUIScrollView contentInset](self->_scrollView, "contentInset");
    v15 = v14;
    -[_PXUIScrollView contentInset](self->_scrollView, "contentInset");
    -[_PXUIScrollView setContentInset:](self->_scrollView, "setContentInset:", v12, v13, v15);
    -[_PXUIScrollView setContentSize:](self->_scrollView, "setContentSize:", width + x, height + y);
    -[PXScrollViewController scrollViewContentBoundsDidChange](self, "scrollViewContentBoundsDidChange");
  }
}

- (void)stopScrollingAndZoomingAnimations
{
  id v2;

  -[PXUIScrollViewController scrollView](self, "scrollView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_stopScrollingAndZoomingAnimations");

}

- (void)setFocusItemProvider:(id)a3
{
  id WeakRetained;
  PXUIScrollViewController *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_focusItemProvider);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_focusItemProvider, obj);
    if (obj)
      v5 = self;
    else
      v5 = 0;
    -[_PXUIScrollView setFocusItemProvider:](self->_scrollView, "setFocusItemProvider:", v5);
  }

}

- (void)addSubview:(id)a3
{
  -[_PXUIScrollView addSubview:](self->_scrollView, "addSubview:", a3);
}

- (void)setRespectsContentZOrder:(BOOL)a3
{
  -[_PXUIScrollView setRespectsContentZOrder:](self->_scrollView, "setRespectsContentZOrder:", a3);
}

- (PXUIScrollViewController)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PXUIScrollViewController *v7;
  _PXUIScrollView *v8;
  _PXUIScrollView *scrollView;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)PXUIScrollViewController;
  v7 = -[PXScrollViewController initWithFrame:](&v15, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[_PXUIScrollView initWithFrame:]([_PXUIScrollView alloc], "initWithFrame:", x, y, width, height);
    scrollView = v7->_scrollView;
    v7->_scrollView = v8;

    -[_PXUIScrollView _setIndicatorInsetAdjustmentBehavior:](v7->_scrollView, "_setIndicatorInsetAdjustmentBehavior:", 1);
    -[_PXUIScrollView px_setDelegate:](v7->_scrollView, "px_setDelegate:", v7);
    -[_PXUIScrollView setDelegate:](v7->_scrollView, "setDelegate:", v7);
    -[PXUIScrollViewController contentInsetAdjustmentBehaviorDidChange](v7, "contentInsetAdjustmentBehaviorDidChange");
    -[_PXUIScrollView _autoScrollTouchInsets](v7->_scrollView, "_autoScrollTouchInsets");
    v7->_defaultAutoScrollTouchInsets.top = v10;
    v7->_defaultAutoScrollTouchInsets.left = v11;
    v7->_defaultAutoScrollTouchInsets.bottom = v12;
    v7->_defaultAutoScrollTouchInsets.right = v13;
  }
  return v7;
}

- (void)contentInsetAdjustmentBehaviorDidChange
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[PXScrollViewController contentInsetAdjustmentBehavior](self, "contentInsetAdjustmentBehavior");
  v4 = v3;
  if (v3)
  {
    if (v3 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIScrollViewContentInsetAdjustmentBehavior UIScrollViewContentInsetAdjustmentBehaviorFromPXScrollViewContentInsetAdjustmentBehavior(PXScrollViewContentInsetAdjustmentBehavior)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXUIScrollViewController.m"), 103, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v4 = 2;
  }
  -[PXUIScrollViewController scrollView](self, "scrollView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentInsetAdjustmentBehavior:", v4);

}

- (void)setVisibleOrigin:(CGPoint)a3
{
  _QWORD v3[5];
  CGPoint v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__PXUIScrollViewController_setVisibleOrigin___block_invoke;
  v3[3] = &unk_1E5116F30;
  v3[4] = self;
  v4 = a3;
  -[PXScrollViewController performManualChange:](self, "performManualChange:", v3);
}

void __45__PXUIScrollViewController_setVisibleOrigin___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "scrollView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContentOffset:", *(double *)(a1 + 40), *(double *)(a1 + 48));

}

- (void)setIgnoresSafeAreaInsets:(BOOL)a3
{
  if (self->_ignoresSafeAreaInsets != a3)
  {
    self->_ignoresSafeAreaInsets = a3;
    -[_PXUIScrollView setIgnoresSafeAreaInsets:](self->_scrollView, "setIgnoresSafeAreaInsets:");
    -[_PXUIScrollView safeAreaInsetsDidChange](self->_scrollView, "safeAreaInsetsDidChange");
  }
}

- (BOOL)hasWindow
{
  void *v2;
  BOOL v3;

  -[_PXUIScrollView window](self->_scrollView, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isSubview:(id)a3
{
  _PXUIScrollView *v4;

  objc_msgSend(a3, "superview");
  v4 = (_PXUIScrollView *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v4 == self->_scrollView;

  return (char)self;
}

- (void)addSubviewToScrollView:(id)a3
{
  -[_PXUIScrollView px_addSubview:](self->_scrollView, "px_addSubview:", a3);
}

- (void)addFloatingSublayer:(id)a3 forAxis:(int64_t)a4
{
  _PXUIScrollView *scrollView;
  id v5;
  id v6;

  scrollView = self->_scrollView;
  v5 = a3;
  -[_PXUIScrollView layer](scrollView, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSublayer:", v5);

}

- (BOOL)isFloatingSublayer:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "superlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXUIScrollView layer](self->_scrollView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v4 == v5;

  return (char)self;
}

- (void)addGestureRecognizer:(id)a3
{
  -[_PXUIScrollView addGestureRecognizer:](self->_scrollView, "addGestureRecognizer:", a3);
}

- (void)removeGestureRecognizer:(id)a3
{
  -[_PXUIScrollView removeGestureRecognizer:](self->_scrollView, "removeGestureRecognizer:", a3);
}

- (void)setScrollingToTop:(BOOL)a3
{
  if (self->_isScrollingToTop != a3)
  {
    self->_isScrollingToTop = a3;
    if (a3)
      -[PXScrollViewController scrollViewWillBeginScrollingAnimationTowardsContentEdges:](self, "scrollViewWillBeginScrollingAnimationTowardsContentEdges:", 1);
    else
      -[PXScrollViewController scrollViewDidEndScrollingAnimation](self, "scrollViewDidEndScrollingAnimation");
  }
}

- (void)scrollToEdge:(unsigned int)a3 padding:(UIEdgeInsets)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  double right;
  double bottom;
  double left;
  double top;
  uint64_t v11;
  void *v13;
  id v14;

  v6 = a5;
  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v11 = *(_QWORD *)&a3;
  v14 = a6;
  -[UIScrollView px_contentOffsetForEdge:padding:](self->_scrollView, "px_contentOffsetForEdge:padding:", v11, top, left, bottom, right);
  -[UIScrollView px_scrollToContentOffset:animated:](self->_scrollView, "px_scrollToContentOffset:animated:", v6);
  v13 = v14;
  if (v14)
  {
    (*((void (**)(id))v14 + 2))(v14);
    v13 = v14;
  }

}

- (BOOL)isScrolledAtEdge:(unsigned int)a3 tolerance:(double)a4
{
  uint64_t v5;
  void *v6;

  v5 = *(_QWORD *)&a3;
  -[PXUIScrollViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v6, "px_isScrolledAtEdge:tolerance:", v5, a4);

  return v5;
}

- (void)scrollRectToVisible:(CGRect)a3 avoidingContentInsetEdges:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v5 = a5;
  -[PXScrollViewController contentInset](self, "contentInset");
  PXEdgeInsetsForEdges();
  sub_1A7AE3F38();
  PXEdgeInsetsInsetRect();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[PXUIScrollViewController scrollView](self, "scrollView");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  v29.origin.x = v8;
  v29.origin.y = v10;
  v29.size.width = v12;
  v29.size.height = v14;
  if (!CGRectContainsRect(v20, v29))
  {
    v21.origin.x = v8;
    v21.origin.y = v10;
    v21.size.width = v12;
    v21.size.height = v14;
    CGRectGetMaxX(v21);
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    CGRectGetMaxX(v22);
    v23.origin.x = v8;
    v23.origin.y = v10;
    v23.size.width = v12;
    v23.size.height = v14;
    CGRectGetMinX(v23);
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    CGRectGetMinX(v24);
    v25.origin.x = v8;
    v25.origin.y = v10;
    v25.size.width = v12;
    v25.size.height = v14;
    CGRectGetMaxY(v25);
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    CGRectGetMaxY(v26);
    v27.origin.x = v8;
    v27.origin.y = v10;
    v27.size.width = v12;
    v27.size.height = v14;
    CGRectGetMinY(v27);
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    CGRectGetMinY(v28);
    objc_msgSend(v19, "contentOffset", *(_QWORD *)&v14);
    PXPointAdd();
    objc_msgSend(v19, "px_scrollToContentOffset:animated:", v5);
  }

}

- (void)scrollViewLayoutIfNeeded
{
  -[_PXUIScrollView layoutIfNeeded](self->_scrollView, "layoutIfNeeded");
}

- (void)decelerationRateDidChange
{
  int64_t v3;
  double *v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[PXScrollViewController decelerationRate](self, "decelerationRate");
  if (v3)
  {
    if (v3 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIScrollViewDecelerationRate UIScrollViewDecelerationRateFromPXScrollViewDecelerationRate(PXScrollViewDecelerationRate)");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXUIScrollViewController.m"), 81, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v4 = (double *)MEMORY[0x1E0DC5360];
  }
  else
  {
    v4 = (double *)MEMORY[0x1E0DC5368];
  }
  v5 = *v4;
  -[PXUIScrollViewController scrollView](self, "scrollView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDecelerationRate:", v5);

}

- (void)indicatorStyleDidChange
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[PXScrollViewController indicatorStyle](self, "indicatorStyle");
  if (v3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIScrollViewIndicatorStyle _UIScrollViewIndicatorStyleFromPXScrollViewIndicatorStyle(PXScrollViewIndicatorStyle)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXUIScrollViewController.m"), 93, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v4 = v3;
  -[PXUIScrollViewController scrollView](self, "scrollView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIndicatorStyle:", v4);

}

- (void)transfersScrollToContainerDidChange
{
  _BOOL8 v3;
  id v4;

  v3 = -[PXScrollViewController transfersScrollToContainer](self, "transfersScrollToContainer");
  -[PXUIScrollViewController scrollView](self, "scrollView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setTransfersScrollToContainer:", v3);

}

- (CGRect)scrollViewActiveRect
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  double width;
  double v9;
  double height;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect result;

  -[_PXUIScrollView bounds](self->_scrollView, "bounds");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", self->_scrollView);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    v17 = CGRectInset(v16, width * -0.5, height * -0.5);
    x = v17.origin.x;
    y = v17.origin.y;
    width = v17.size.width;
    height = v17.size.height;
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)respectsContentZOrder
{
  return -[_PXUIScrollView respectsContentZOrder](self->_scrollView, "respectsContentZOrder");
}

- (BOOL)allowsKeyboardScrolling
{
  return -[_PXUIScrollView allowsKeyboardScrolling](self->_scrollView, "allowsKeyboardScrolling");
}

- (void)setAllowsKeyboardScrolling:(BOOL)a3
{
  -[_PXUIScrollView setAllowsKeyboardScrolling:](self->_scrollView, "setAllowsKeyboardScrolling:", a3);
}

- (BOOL)isScrollEnabled
{
  return -[_PXUIScrollView isScrollEnabled](self->_scrollView, "isScrollEnabled");
}

- (void)setIsScrollEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[PXUIScrollViewController isScrollEnabled](self, "isScrollEnabled") != a3)
    -[_PXUIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", v3);
}

- (BOOL)adjustsContentInsetWhenScrollDisabled
{
  return -[_PXUIScrollView _adjustsContentInsetWhenScrollDisabled](self->_scrollView, "_adjustsContentInsetWhenScrollDisabled");
}

- (void)setAdjustsContentInsetWhenScrollDisabled:(BOOL)a3
{
  -[_PXUIScrollView _setAdjustsContentInsetWhenScrollDisabled:](self->_scrollView, "_setAdjustsContentInsetWhenScrollDisabled:", a3);
}

- (BOOL)isBouncing
{
  _BOOL4 v3;

  v3 = -[UIScrollView px_isBouncing](self->_scrollView, "px_isBouncing");
  if (v3)
    LOBYTE(v3) = -[PXUIScrollViewController isDragging](self, "isDragging")
              || -[PXUIScrollViewController isDecelerating](self, "isDecelerating")
              || -[PXUIScrollViewController isTracking](self, "isTracking");
  return v3;
}

- (BOOL)clipsToBounds
{
  return -[_PXUIScrollView clipsToBounds](self->_scrollView, "clipsToBounds");
}

- (void)setClipsToBounds:(BOOL)a3
{
  -[_PXUIScrollView setClipsToBounds:](self->_scrollView, "setClipsToBounds:", a3);
}

- (BOOL)showsVerticalScrollIndicator
{
  return -[_PXUIScrollView showsVerticalScrollIndicator](self->_scrollView, "showsVerticalScrollIndicator");
}

- (BOOL)showsHorizontalScrollIndicator
{
  return -[_PXUIScrollView showsHorizontalScrollIndicator](self->_scrollView, "showsHorizontalScrollIndicator");
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  -[_PXUIScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", a3);
}

- (void)setShowsHorizontalScrollIndicator:(BOOL)a3
{
  -[_PXUIScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", a3);
}

- (void)setAlwaysBounceVertical:(BOOL)a3
{
  -[_PXUIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", a3);
}

- (BOOL)alwaysBounceVertical
{
  return -[_PXUIScrollView alwaysBounceVertical](self->_scrollView, "alwaysBounceVertical");
}

- (void)setAlwaysBounceHorizontal:(BOOL)a3
{
  -[_PXUIScrollView setAlwaysBounceHorizontal:](self->_scrollView, "setAlwaysBounceHorizontal:", a3);
}

- (BOOL)alwaysBounceHorizontal
{
  return -[_PXUIScrollView alwaysBounceHorizontal](self->_scrollView, "alwaysBounceHorizontal");
}

- (UIEdgeInsets)horizontalScrollIndicatorInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[_PXUIScrollView horizontalScrollIndicatorInsets](self->_scrollView, "horizontalScrollIndicatorInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)verticalScrollIndicatorInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[_PXUIScrollView verticalScrollIndicatorInsets](self->_scrollView, "verticalScrollIndicatorInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setHorizontalScrollIndicatorInsets:(UIEdgeInsets)a3
{
  -[_PXUIScrollView setHorizontalScrollIndicatorInsets:](self->_scrollView, "setHorizontalScrollIndicatorInsets:", a3.top, a3.left, a3.bottom, a3.right);
}

- (void)setVerticalScrollIndicatorInsets:(UIEdgeInsets)a3
{
  -[_PXUIScrollView setVerticalScrollIndicatorInsets:](self->_scrollView, "setVerticalScrollIndicatorInsets:", a3.top, a3.left, a3.bottom, a3.right);
}

- (void)setHitTestContentInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[_PXUIScrollView hitTestContentInsets](self->_scrollView, "hitTestContentInsets");
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    -[_PXUIScrollView setHitTestContentInsets:](self->_scrollView, "setHitTestContentInsets:", top, left, bottom, right);
    PXEdgeInsetsMake();
    -[_PXUIScrollView _setAutoScrollTouchInsets:](self->_scrollView, "_setAutoScrollTouchInsets:");
  }
}

- (double)horizontalInterPageSpacing
{
  double result;

  -[_PXUIScrollView _interpageSpacing](self->_scrollView, "_interpageSpacing");
  return result;
}

- (void)setHorizontalInterPageSpacing:(double)a3
{
  double v5;
  char v6;

  -[_PXUIScrollView _interpageSpacing](self->_scrollView, "_interpageSpacing");
  if (v5 != a3)
  {
    -[_PXUIScrollView _interpageSpacing](self->_scrollView, "_interpageSpacing");
    -[_PXUIScrollView _setInterpageSpacing:](self->_scrollView, "_setInterpageSpacing:", a3);
    v6 = -[_PXUIScrollView isPagingEnabled](self->_scrollView, "isPagingEnabled");
    if (a3 > 0.0 && (v6 & 1) == 0)
      -[_PXUIScrollView setPagingEnabled:](self->_scrollView, "setPagingEnabled:", 1);
  }
}

- (void)applyScrollInfo:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  _PXUIScrollView *scrollView;
  _PXUIScrollView *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "axis");
  v6 = (v5 >> 2) & 1;
  -[_PXUIScrollView setAlwaysBounceHorizontal:](self->_scrollView, "setAlwaysBounceHorizontal:", (v5 >> 1) & 1);
  -[_PXUIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", v6);
  -[_PXUIScrollView setPagingEnabled:](self->_scrollView, "setPagingEnabled:", objc_msgSend(v4, "isPagingEnabled"));
  scrollView = self->_scrollView;
  objc_msgSend(v4, "interpageSpacing");
  -[_PXUIScrollView _setInterpageSpacing:](scrollView, "_setInterpageSpacing:");
  v8 = self->_scrollView;
  objc_msgSend(v4, "pagingOrigin");
  v10 = v9;
  v12 = v11;

  -[_PXUIScrollView setPagingOriginOffset:](v8, "setPagingOriginOffset:", v10, v12);
}

- (id)contentCoordinateSpace
{
  return self->_scrollView;
}

- (CGRect)scrollIndicatorFrameForAxis:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_PXUIScrollView scrollIndicatorFrameForAxis:](self->_scrollView, "scrollIndicatorFrameForAxis:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)shouldScrollSimultaneouslyWithDescendantScrollView
{
  return -[_PXUIScrollView shouldScrollSimultaneouslyWithDescendantScrollView](self->_scrollView, "shouldScrollSimultaneouslyWithDescendantScrollView");
}

- (void)setShouldScrollSimultaneouslyWithDescendantScrollView:(BOOL)a3
{
  -[_PXUIScrollView setShouldScrollSimultaneouslyWithDescendantScrollView:](self->_scrollView, "setShouldScrollSimultaneouslyWithDescendantScrollView:", a3);
}

- (BOOL)isInterruptingScrollWithDirection:(CGPoint *)a3
{
  _BOOL4 isInterruptingDeceleration;

  isInterruptingDeceleration = self->_isInterruptingDeceleration;
  if (a3 && self->_isInterruptingDeceleration)
    *a3 = self->_interruptedDecelerationDirection;
  return isInterruptingDeceleration;
}

- (BOOL)scrollView:(id)a3 shouldBeginScrollingWithPanAtLocation:(CGPoint)a4 velocity:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  PXUIScrollViewController *v9;
  void *v10;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v9 = self;
  -[PXUIScrollViewController scrollView](self, "scrollView", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = -[PXScrollViewController scrollViewShouldBeginScrollingWithPanAtLocation:inCoordinateSpace:velocity:](v9, "scrollViewShouldBeginScrollingWithPanAtLocation:inCoordinateSpace:velocity:", v10, v8, v7, x, y);

  return (char)v9;
}

- (void)scrollView:(id)a3 willBeginScrollingAnimationTowardsContentEdges:(unint64_t)a4
{
  -[PXUIScrollViewController setScrollingToTop:](self, "setScrollingToTop:", 0);
  -[PXScrollViewController scrollViewWillBeginScrollingAnimationTowardsContentEdges:](self, "scrollViewWillBeginScrollingAnimationTowardsContentEdges:", a4);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_scrollViewWasDeceleratingWhenDragBegan = self->_isScrollViewDecelerating;
  self->_isScrollViewDecelerating = 0;
  -[PXScrollViewController scrollViewWillBeginScrolling](self, "scrollViewWillBeginScrolling", a3);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  BOOL v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  id v13;

  y = a4.y;
  x = a4.x;
  v13 = a3;
  v9 = x == *MEMORY[0x1E0C9D538] && y == *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v9 && self->_scrollViewWasDeceleratingWhenDragBegan)
  {
    self->_isInterruptingDeceleration = 1;
    PXFloatSign();
    v11 = v10;
    PXFloatSign();
    self->_interruptedDecelerationDirection.x = v11;
    self->_interruptedDecelerationDirection.y = v12;
  }
  -[PXScrollViewController willEndScrollingWithVelocity:targetContentOffset:](self, "willEndScrollingWithVelocity:targetContentOffset:", a5, x, y);
  self->_lastDragVelocity.x = x;
  self->_lastDragVelocity.y = y;

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (a4)
  {
    self->_isScrollViewDecelerating = 1;
    -[PXUIScrollViewController _scheduleScrollViewDecelerationCheck](self, "_scheduleScrollViewDecelerationCheck", a3);
  }
  else
  {
    -[PXScrollViewController scrollViewDidEndScrolling](self, "scrollViewDidEndScrolling", a3);
  }
  self->_isInterruptingDeceleration = 0;
}

- (void)_scheduleScrollViewDecelerationCheck
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = dispatch_time(0, 500000000);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__PXUIScrollViewController__scheduleScrollViewDecelerationCheck__block_invoke;
  v3[3] = &unk_1E5148D30;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_checkScrollViewDeceleration
{
  if (self->_isScrollViewDecelerating)
  {
    if ((-[_PXUIScrollView isDecelerating](self->_scrollView, "isDecelerating") & 1) != 0)
    {
      -[PXUIScrollViewController _scheduleScrollViewDecelerationCheck](self, "_scheduleScrollViewDecelerationCheck");
    }
    else
    {
      -[PXUIScrollViewController scrollViewDidEndDecelerating:](self, "scrollViewDidEndDecelerating:", self->_scrollView);
      if (_checkScrollViewDeceleration_onceToken != -1)
        dispatch_once(&_checkScrollViewDeceleration_onceToken, &__block_literal_global_4967);
    }
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (self->_isScrollViewDecelerating)
  {
    self->_isScrollViewDecelerating = 0;
    -[PXScrollViewController scrollViewDidEndScrolling](self, "scrollViewDidEndScrolling", a3);
  }
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  _BOOL4 v4;

  v4 = -[PXScrollViewController scrollViewShouldScrollToTop](self, "scrollViewShouldScrollToTop", a3);
  if (v4)
    -[PXUIScrollViewController setScrollingToTop:](self, "setScrollingToTop:", 1);
  return v4;
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  -[PXUIScrollViewController setScrollingToTop:](self, "setScrollingToTop:", 0);
}

- (id)focusItemsForScrollView:(id)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[PXUIScrollViewController focusItemProvider](self, "focusItemProvider", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "focusItemsForScrollViewController:inRect:", self, x, y, width, height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

- (PXUIScrollViewControllerFocusItemProvider)focusItemProvider
{
  return (PXUIScrollViewControllerFocusItemProvider *)objc_loadWeakRetained((id *)&self->_focusItemProvider);
}

- (BOOL)ignoresSafeAreaInsets
{
  return self->_ignoresSafeAreaInsets;
}

- (BOOL)isScrollingToTop
{
  return self->_isScrollingToTop;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusItemProvider);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

void __56__PXUIScrollViewController__checkScrollViewDeceleration__block_invoke()
{
  NSObject *v0;

  dispatch_get_global_queue(9, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v0, &__block_literal_global_3);

}

void __56__PXUIScrollViewController__checkScrollViewDeceleration__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  PFUIGetLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A6789000, v0, OS_LOG_TYPE_FAULT, "Working around rdar://78312989", v1, 2u);
  }

}

void __64__PXUIScrollViewController__scheduleScrollViewDecelerationCheck__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_checkScrollViewDeceleration");

}

@end
