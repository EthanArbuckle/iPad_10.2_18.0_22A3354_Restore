@implementation _UIQueuingScrollView

- (_UIQueuingScrollView)initWithFrame:(CGRect)a3 navigationOrientation:(int64_t)a4
{
  _UIQueuingScrollView *v5;
  _UIQueuingScrollView *v6;
  uint64_t v7;
  NSArray *views;
  NSMutableArray *v9;
  NSMutableArray *viewStateQueue;
  NSMutableArray *v11;
  NSMutableArray *completionStateQueue;
  NSArray *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  UIView *v19;
  NSArray *wrapperViews;
  double v21;
  double v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)_UIQueuingScrollView;
  v5 = -[UIScrollView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_navigationOrientation = a4;
    -[UIScrollView setPagingEnabled:](v5, "setPagingEnabled:", 1);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v6, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](v6, "setShowsVerticalScrollIndicator:", 0);
    if (v6->_navigationOrientation)
      -[UIScrollView setAlwaysBounceVertical:](v6, "setAlwaysBounceVertical:", 1);
    else
      -[UIScrollView setAlwaysBounceHorizontal:](v6, "setAlwaysBounceHorizontal:", 1);
    if (dyld_program_sdk_at_least())
      -[UIScrollView setContentInsetAdjustmentBehavior:](v6, "setContentInsetAdjustmentBehavior:", 2);
    -[UIScrollView setScrollsToTop:](v6, "setScrollsToTop:", 0);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("kUIFaultingViewSentinel"), CFSTR("kUIFaultingViewSentinel"), 0);
    views = v6->_views;
    v6->_views = (NSArray *)v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    viewStateQueue = v6->_viewStateQueue;
    v6->_viewStateQueue = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completionStateQueue = v6->_completionStateQueue;
    v6->_completionStateQueue = v11;

    v13 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = *MEMORY[0x1E0C9D648];
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v18 = 3;
    do
    {
      v19 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v14, v15, v16, v17);
      -[NSArray addObject:](v13, "addObject:", v19);
      -[UIView addSubview:](v6, "addSubview:", v19);

      --v18;
    }
    while (v18);
    wrapperViews = v6->_wrapperViews;
    v6->_wrapperViews = v13;

    -[UIView bounds](v6, "bounds");
    -[_UIQueuingScrollView _boundsDidChangeToSize:](v6, "_boundsDidChangeToSize:", v21, v22);
  }
  return v6;
}

- (void)setQDelegate:(id)a3
{
  id WeakRetained;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_qDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_qDelegate, obj);
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFD | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFB | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 8;
    else
      v7 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFF7 | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 16;
    else
      v8 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFEF | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 32;
    else
      v9 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFDF | v9;
  }

}

- (void)setQDataSource:(id)a3
{
  id WeakRetained;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_qDataSource);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_qDataSource, obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 128;
    else
      v5 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFF7F | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 64;
    else
      v6 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFBF | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 256;
    else
      v7 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFEFF | v7;
  }

}

- (void)_setFrameAndApplyPageSpacing:(CGRect)a3
{
  double pageSpacing;
  int64_t navigationOrientation;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  pageSpacing = self->_pageSpacing;
  navigationOrientation = self->_navigationOrientation;
  v5 = pageSpacing + pageSpacing;
  v6 = a3.origin.y - pageSpacing;
  v7 = a3.size.height + pageSpacing + pageSpacing;
  v8 = a3.origin.x - pageSpacing;
  v9 = a3.size.width + v5;
  if (navigationOrientation)
    a3.origin.y = v6;
  else
    a3.origin.x = v8;
  if (navigationOrientation)
    a3.size.height = v7;
  else
    a3.size.width = v9;
  -[_UIQueuingScrollView setFrame:](self, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, v8, v9);
}

- (void)setPageSpacing:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double pageSpacing;
  int64_t navigationOrientation;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  if (self->_pageSpacing != a3)
  {
    -[UIView frame](self, "frame");
    pageSpacing = self->_pageSpacing;
    navigationOrientation = self->_navigationOrientation;
    v11 = pageSpacing * -2.0;
    v12 = pageSpacing + v6;
    v13 = v8 + pageSpacing * -2.0;
    v14 = pageSpacing + v5;
    v15 = v7 + v11;
    if (navigationOrientation)
      v6 = v12;
    else
      v5 = v14;
    if (!navigationOrientation)
      v7 = v15;
    self->_pageSpacing = a3;
    if (navigationOrientation)
      v8 = v13;
    -[_UIQueuingScrollView _setFrameAndApplyPageSpacing:](self, "_setFrameAndApplyPageSpacing:", v5, v6, v7, v8, v14, v15);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)_UIQueuingScrollView;
  -[UIScrollView setBounds:](&v15, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    -[UIView bounds](self, "bounds");
    -[_UIQueuingScrollView _boundsDidChangeToSize:](self, "_boundsDidChangeToSize:", v13, v14);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)_UIQueuingScrollView;
  -[UIScrollView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    -[UIView bounds](self, "bounds");
    -[_UIQueuingScrollView _boundsDidChangeToSize:](self, "_boundsDidChangeToSize:", v13, v14);
  }
}

- (void)layoutSubviews
{
  id WeakRetained;
  int v4;
  _BOOL8 v5;
  objc_super v6;

  if ((*(_WORD *)&self->_delegateFlags & 0x20) == 0
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_qDelegate),
        v4 = objc_msgSend(WeakRetained, "queuingScrollViewShouldLayoutSubviews:", self),
        WeakRetained,
        v4))
  {
    v5 = -[UIScrollView isScrollAnimating](self, "isScrollAnimating");
    if (!-[_UIQueuingScrollView _isScrollInProgress:](self, "_isScrollInProgress:", v5)
      || -[_UIQueuingScrollView _navigationDirectionForActiveScroll:](self, "_navigationDirectionForActiveScroll:", v5) != -1)
    {
      -[_UIQueuingScrollView _didScrollWithAnimation:force:](self, "_didScrollWithAnimation:force:", v5, 0);
    }
    v6.receiver = self;
    v6.super_class = (Class)_UIQueuingScrollView;
    -[UIScrollView layoutSubviews](&v6, sel_layoutSubviews);
  }
}

- (void)_scrollViewDidEndDraggingWithDeceleration:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (a3)
  {
    -[_UIQueuingScrollView _didEndDraggingManualScroll](self, "_didEndDraggingManualScroll");
  }
  else
  {
    -[_UIQueuingScrollView _didScrollWithAnimation:force:](self, "_didScrollWithAnimation:force:", -[UIScrollView isScrollAnimating](self, "isScrollAnimating"), 0);
    -[_UIQueuingScrollView _didEndManualScroll](self, "_didEndManualScroll");
  }
  v5.receiver = self;
  v5.super_class = (Class)_UIQueuingScrollView;
  -[UIScrollView _scrollViewDidEndDraggingWithDeceleration:](&v5, sel__scrollViewDidEndDraggingWithDeceleration_, v3);
}

- (void)_scrollViewDidEndDecelerating
{
  objc_super v3;

  -[_UIQueuingScrollView _didScrollWithAnimation:force:](self, "_didScrollWithAnimation:force:", -[UIScrollView isScrollAnimating](self, "isScrollAnimating"), 1);
  -[_UIQueuingScrollView _didEndManualScroll](self, "_didEndManualScroll");
  v3.receiver = self;
  v3.super_class = (Class)_UIQueuingScrollView;
  -[UIScrollView _scrollViewDidEndDecelerating](&v3, sel__scrollViewDidEndDecelerating);
}

- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)_UIQueuingScrollView;
  -[UIScrollView _scrollViewAnimationEnded:finished:](&v6, sel__scrollViewAnimationEnded_finished_, a3);
  if (v4)
  {
    -[_UIQueuingScrollView _didScrollWithAnimation:force:](self, "_didScrollWithAnimation:force:", -[UIScrollView isScrollAnimating](self, "isScrollAnimating"), 1);
    -[_UIQueuingScrollView _didEndProgrammaticScroll](self, "_didEndProgrammaticScroll");
  }
}

- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  BOOL v11;
  CGFloat v12;
  CGFloat v13;
  objc_super v15;
  CGPoint v16;

  v6 = a3;
  v7 = a4;
  -[UIView gestureRecognizers](self, "gestureRecognizers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", v6);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL || CGRectIsEmpty(self->_disabledScrollingRegion))
  {
    v10 = 0;
    goto LABEL_4;
  }
  -[UIView superview](self, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", v8);
  v16.x = v12;
  v16.y = v13;
  if (!CGRectContainsPoint(self->_disabledScrollingRegion, v16))
  {
    v10 = 1;
LABEL_4:
    v15.receiver = self;
    v15.super_class = (Class)_UIQueuingScrollView;
    v11 = -[UIScrollView _gestureRecognizer:shouldReceiveTouch:](&v15, sel__gestureRecognizer_shouldReceiveTouch_, v6, v7);
    if (!v10)
      goto LABEL_9;
    goto LABEL_8;
  }
  v11 = 0;
LABEL_8:

LABEL_9:
  return v11;
}

- (unint64_t)_abuttedPagingEdges
{
  unint64_t v3;
  int64_t navigationOrientation;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  void *v20;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  int64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  objc_super v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  -[_UIQueuingScrollView _adjustContentInsets](self, "_adjustContentInsets");
  v34.receiver = self;
  v34.super_class = (Class)_UIQueuingScrollView;
  v3 = -[UIScrollView _abuttedPagingEdges](&v34, sel__abuttedPagingEdges);
  if (-[UIScrollView _isHorizontalBouncing](self, "_isHorizontalBouncing")
    || -[UIScrollView _isVerticalBouncing](self, "_isVerticalBouncing")
    || !-[_UIQueuingScrollView _dataSourceProvidesViews](self, "_dataSourceProvidesViews"))
  {
    return v3;
  }
  navigationOrientation = self->_navigationOrientation;
  -[UIScrollView _pageDecelerationTarget](self, "_pageDecelerationTarget");
  v6 = v5;
  v8 = v7;
  -[UIScrollView contentOffset](self, "contentOffset");
  v10 = v6 - v9;
  v12 = v8 - v11;
  v13 = navigationOrientation ? v12 : v10;
  if (!-[UIScrollView isDecelerating](self, "isDecelerating") || fabs(v13) < 2.22044605e-16)
    return v3;
  v14 = self->_navigationOrientation;
  if (!v14)
  {
    -[UIScrollView _pageDecelerationTarget](self, "_pageDecelerationTarget");
    v16 = v15;
    -[UIView bounds](self, "bounds");
    if (v16 < CGRectGetWidth(v35))
    {
LABEL_14:
      v19 = 1;
      -[_UIQueuingScrollView _viewAtIndex:loadingIfNecessary:updatingContents:animated:](self, "_viewAtIndex:loadingIfNecessary:updatingContents:animated:", 0, 1, 0, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        return v3;
      v21 = 0;
      goto LABEL_24;
    }
    v14 = self->_navigationOrientation;
  }
  if (v14 == 1)
  {
    -[UIScrollView _pageDecelerationTarget](self, "_pageDecelerationTarget");
    v18 = v17;
    -[UIView bounds](self, "bounds");
    if (v18 < CGRectGetHeight(v36))
      goto LABEL_14;
    v14 = self->_navigationOrientation;
  }
  if (v14)
    goto LABEL_20;
  -[UIScrollView _pageDecelerationTarget](self, "_pageDecelerationTarget");
  v23 = v22;
  -[UIView bounds](self, "bounds");
  if (v23 <= CGRectGetWidth(v37))
  {
    v14 = self->_navigationOrientation;
LABEL_20:
    if (v14 != 1)
      return v3;
    -[UIScrollView _pageDecelerationTarget](self, "_pageDecelerationTarget");
    v25 = v24;
    -[UIView bounds](self, "bounds");
    if (v25 <= CGRectGetHeight(v38))
      return v3;
  }
  v21 = 1;
  -[_UIQueuingScrollView _viewAtIndex:loadingIfNecessary:updatingContents:animated:](self, "_viewAtIndex:loadingIfNecessary:updatingContents:animated:", 2, 1, 0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
    return v3;
  v19 = 0;
LABEL_24:
  v27 = self->_navigationOrientation;
  if (v27)
  {
    if (v27 != 1)
      return v3;
    v28 = 4;
  }
  else
  {
    v27 = 2;
    v28 = 8;
  }
  v29 = v28 | v3;
  v30 = v3 & ~v28;
  if (v21)
    v30 = v29;
  v31 = v30 | v27;
  v32 = v30 & ~v27;
  if (v19)
    return v31;
  else
    return v32;
}

- (void)_handleDirectionalPageWithHorizontalVelocity:(double)a3 verticalVelocity:(double)a4
{
  double v4;
  _BOOL8 v7;
  id WeakRetained;

  v4 = fabs(a4);
  if (fabs(a3) >= 2.22044605e-16 || v4 >= 2.22044605e-16)
  {
    if (self->_navigationOrientation)
      a3 = a4;
    v7 = a3 <= 0.0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_qDelegate);
    objc_msgSend(WeakRetained, "queuingScrollView:attemptToPageInDirection:", self, v7);

  }
}

- (void)_setWrappedViewAtIndex:(int64_t)a3 withView:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a4;
  if (!v7)
    goto LABEL_9;
  v14 = v7;
  -[NSArray objectAtIndex:](self->_wrapperViews, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subviews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
    goto LABEL_5;
  objc_msgSend(v8, "subviews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_ui_onlyObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v12 = v14;
  if (v11 != v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIQueuingScrollView.m"), 354, CFSTR("Unexpected subviews"));
LABEL_5:

    v12 = v14;
  }
  objc_msgSend(v12, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v13)
  {
    objc_msgSend(v8, "bounds");
    objc_msgSend(v14, "setFrame:");
    objc_msgSend(v14, "setAutoresizingMask:", objc_msgSend(v14, "autoresizingMask") | 0x12);
    objc_msgSend(v8, "addSubview:", v14);
  }

  v7 = v14;
LABEL_9:

}

- (BOOL)_dataSourceProvidesViews
{
  id WeakRetained;
  $56B4B6F9EF274AA88B3D751FEF707A7A delegateFlags;
  _BOOL4 v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_qDataSource);
  if (WeakRetained)
  {
    delegateFlags = self->_delegateFlags;
    if ((*(_BYTE *)&delegateFlags & 0x80) != 0)
      v5 = (*(unsigned int *)&delegateFlags >> 6) & 1;
    else
      LOBYTE(v5) = 0;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)_viewBefore:(BOOL)a3 view:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;

  v6 = a4;
  if (-[_UIQueuingScrollView _dataSourceProvidesViews](self, "_dataSourceProvidesViews"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_qDataSource);
    v8 = WeakRetained;
    if (a3)
      objc_msgSend(WeakRetained, "queuingScrollView:viewBeforeView:", self, v6);
    else
      objc_msgSend(WeakRetained, "queuingScrollView:viewAfterView:", self, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_viewBeforeView:(id)a3
{
  return -[_UIQueuingScrollView _viewBefore:view:](self, "_viewBefore:view:", 1, a3);
}

- (id)_viewAfterView:(id)a3
{
  return -[_UIQueuingScrollView _viewBefore:view:](self, "_viewBefore:view:", 0, a3);
}

- (id)_visibleView
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v9;

  -[NSArray objectAtIndex:](self->_views, "objectAtIndex:", 1);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIQueuingScrollView.m"), 385, CFSTR("Visible view can't be 'NULL'"));

  }
  if (v4 == CFSTR("kUIFaultingViewSentinel"))
    v6 = 0;
  else
    v6 = v4;
  v7 = v6;

  return v7;
}

- (void)_flushView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UIView *v6;
  id WeakRetained;
  UIView *v8;
  UIView *v9;

  v4 = a4;
  v6 = (UIView *)a3;
  if (self->_pendingVisibleView == v6)
  {
    self->_pendingVisibleView = 0;
    v8 = v6;

    v6 = v8;
  }
  if ((*(_WORD *)&self->_delegateFlags & 0x100) != 0)
  {
    v9 = v6;
    WeakRetained = objc_loadWeakRetained((id *)&self->_qDataSource);
    objc_msgSend(WeakRetained, "queuingScrollView:didFlushView:animated:", self, v9, v4);

    v6 = v9;
  }

}

- (void)_replaceViews:(id)a3 updatingContents:(BOOL)a4 adjustContentInsets:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  NSArray *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t j;
  void *v18;
  NSArray *views;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v6 = a6;
  v27 = *MEMORY[0x1E0C80C00];
  v10 = (NSArray *)a3;
  if (-[NSArray count](v10, "count") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIQueuingScrollView.m"), 399, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[views count] == 3"));

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = self->_views;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v16, "removeFromSuperview");
          if (!-[NSArray containsObject:](v10, "containsObject:", v16))
            -[_UIQueuingScrollView _flushView:animated:](self, "_flushView:animated:", v16, v6);
        }
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }

  for (j = 0; j != 3; ++j)
  {
    -[NSArray objectAtIndex:](v10, "objectAtIndex:", j);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (a4 || -[NSArray containsObject:](self->_views, "containsObject:", v18)))
      -[_UIQueuingScrollView _setWrappedViewAtIndex:withView:](self, "_setWrappedViewAtIndex:withView:", j, v18);

  }
  views = self->_views;
  self->_views = v10;

  if (a5)
    -[_UIQueuingScrollView _adjustContentInsets](self, "_adjustContentInsets");
}

- (id)_requestViewForIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (a3)
  {
    if (a3 != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIQueuingScrollView.m"), 422, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("LEFT_VIEW_INDEX == index || index == RIGHT_VIEW_INDEX"));

    }
    -[_UIQueuingScrollView _visibleView](self, "_visibleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIQueuingScrollView _viewAfterView:](self, "_viewAfterView:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UIQueuingScrollView _visibleView](self, "_visibleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIQueuingScrollView _viewBeforeView:](self, "_viewBeforeView:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (id)_dequeueViewForIndex:(int64_t)a3
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  if ((a3 | 2) != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIQueuingScrollView.m"), 428, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("LEFT_VIEW_INDEX == index || index == RIGHT_VIEW_INDEX"));

  }
  if (!-[NSMutableArray count](self->_viewStateQueue, "count"))
    return 0;
  -[NSMutableArray _ui_peek](self->_viewStateQueue, "_ui_peek");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "transitionDirection");
  if (a3 != 2 || v8)
  {
    -[NSMutableArray _ui_peek](self->_viewStateQueue, "_ui_peek");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "transitionDirection");

    v12 = 0;
    if (a3 || v11 != 1)
      return v12;
  }
  else
  {

  }
  -[NSMutableArray _ui_dequeue](self->_viewStateQueue, "_ui_dequeue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_viewAtIndex:(int64_t)a3 loadingIfNecessary:(BOOL)a4 updatingContents:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL4 v8;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v24;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  if ((unint64_t)a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIQueuingScrollView.m"), 439, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("LEFT_VIEW_INDEX <= index && index <= RIGHT_VIEW_INDEX"));

  }
  -[NSArray objectAtIndex:](self->_views, "objectAtIndex:", a3);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 && v11 == CFSTR("kUIFaultingViewSentinel"))
  {
    -[_UIQueuingScrollView _dequeueViewForIndex:](self, "_dequeueViewForIndex:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v12 = v13;
    }
    else
    {
      -[_UIQueuingScrollView _requestViewForIndex:](self, "_requestViewForIndex:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v17 = v15;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v12 = v17;

    }
    if (v12 != CFSTR("kUIFaultingViewSentinel"))
    {
      v18 = v12;
      v19 = (void *)-[NSArray mutableCopy](self->_views, "mutableCopy");
      objc_msgSend(v19, "replaceObjectAtIndex:withObject:", a3, v18);
      -[_UIQueuingScrollView _replaceViews:updatingContents:adjustContentInsets:animated:](self, "_replaceViews:updatingContents:adjustContentInsets:animated:", v19, v7, 1, v6);

    }
  }
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_UIQueuingScrollView _setWrappedViewAtIndex:withView:](self, "_setWrappedViewAtIndex:withView:", a3, v12);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v12;
  else
    v20 = 0;
  v21 = v20;

  return v21;
}

- (void)_invalidateOffscreenViews
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99D20];
  -[_UIQueuingScrollView _visibleView](self, "_visibleView");
  v4 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v4;
  if (v4)
    v5 = (const __CFString *)v4;
  else
    v5 = CFSTR("kUIFaultingViewSentinel");
  objc_msgSend(v3, "arrayWithObjects:", v5, CFSTR("kUIFaultingViewSentinel"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIQueuingScrollView _replaceViews:updatingContents:adjustContentInsets:animated:](self, "_replaceViews:updatingContents:adjustContentInsets:animated:", v6, 1, 1, 0);

}

- (BOOL)isPreviousScrollCompatibleWithScrollInDirection:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[NSMutableArray lastObject](self->_viewStateQueue, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "isCompatibleWithTransitionInDirection:", a3);
  else
    v6 = 1;

  return v6;
}

- (BOOL)isManualScrollInProgress
{
  void *v3;
  char v4;

  if (self->_manualScrollInProgress)
    return 1;
  -[NSMutableArray lastObject](self->_completionStateQueue, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isManual");

  return v4;
}

- (int64_t)_navigationDirectionForActiveScroll:(BOOL)a3
{
  _BOOL4 v3;
  int64_t navigationOrientation;
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
  double v20;
  double v21;
  double v22;
  int64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;

  v3 = a3;
  if (-[UIScrollView _pagingRight](self, "_pagingRight") || -[UIScrollView _pagingDown](self, "_pagingDown"))
    return 0;
  if (-[UIScrollView _pagingLeft](self, "_pagingLeft") || -[UIScrollView _pagingUp](self, "_pagingUp"))
    return 1;
  navigationOrientation = self->_navigationOrientation;
  if (v3)
  {
    if (!navigationOrientation)
    {
      -[UIScrollView _animatedTargetOffset](self, "_animatedTargetOffset");
      v8 = v7;
      -[UIScrollView _animatedOriginalOffset](self, "_animatedOriginalOffset");
      if (v8 > v9)
        return 0;
      navigationOrientation = self->_navigationOrientation;
    }
    if (navigationOrientation != 1)
      goto LABEL_14;
    -[UIScrollView _animatedTargetOffset](self, "_animatedTargetOffset");
    v11 = v10;
    -[UIScrollView _animatedOriginalOffset](self, "_animatedOriginalOffset");
    if (v11 <= v12)
    {
      navigationOrientation = self->_navigationOrientation;
LABEL_14:
      if (!navigationOrientation)
      {
        -[UIScrollView _animatedTargetOffset](self, "_animatedTargetOffset");
        v14 = v13;
        -[UIScrollView _animatedOriginalOffset](self, "_animatedOriginalOffset");
        if (v14 < v15)
          return 1;
        navigationOrientation = self->_navigationOrientation;
      }
      if (navigationOrientation == 1)
      {
        -[UIScrollView _animatedTargetOffset](self, "_animatedTargetOffset");
        v17 = v16;
        -[UIScrollView _animatedOriginalOffset](self, "_animatedOriginalOffset");
        goto LABEL_19;
      }
      return -1;
    }
    return 0;
  }
  if (!navigationOrientation)
  {
    -[UIScrollView _horizontalVelocity](self, "_horizontalVelocity");
    if (v19 > 0.0)
      return 0;
    navigationOrientation = self->_navigationOrientation;
  }
  if (navigationOrientation == 1)
  {
    -[UIScrollView _verticalVelocity](self, "_verticalVelocity");
    if (v20 > 0.0)
      return 0;
    navigationOrientation = self->_navigationOrientation;
  }
  if (!navigationOrientation)
  {
    -[UIScrollView _horizontalVelocity](self, "_horizontalVelocity");
    if (v21 < 0.0)
      return 1;
    navigationOrientation = self->_navigationOrientation;
  }
  if (navigationOrientation == 1)
  {
    -[UIScrollView _verticalVelocity](self, "_verticalVelocity");
    if (v22 < 0.0)
      return 1;
  }
  if (!-[UIScrollView _isBouncing](self, "_isBouncing"))
    return -1;
  v23 = self->_navigationOrientation;
  if (!v23)
  {
    -[UIScrollView _pageDecelerationTarget](self, "_pageDecelerationTarget");
    v25 = v24;
    -[UIScrollView contentOffset](self, "contentOffset");
    if (v25 > v26)
      return 0;
    v23 = self->_navigationOrientation;
  }
  if (v23 == 1)
  {
    -[UIScrollView _pageDecelerationTarget](self, "_pageDecelerationTarget");
    v28 = v27;
    -[UIScrollView contentOffset](self, "contentOffset");
    if (v28 > v29)
      return 0;
    v23 = self->_navigationOrientation;
  }
  if (!v23)
  {
    -[UIScrollView _pageDecelerationTarget](self, "_pageDecelerationTarget");
    v31 = v30;
    -[UIScrollView contentOffset](self, "contentOffset");
    if (v31 < v32)
      return 1;
    v23 = self->_navigationOrientation;
  }
  if (v23 == 1)
  {
    -[UIScrollView _pageDecelerationTarget](self, "_pageDecelerationTarget");
    v17 = v33;
    -[UIScrollView contentOffset](self, "contentOffset");
LABEL_19:
    if (v17 >= v18)
      return -1;
    return 1;
  }
  return -1;
}

- (int64_t)_navigationDirectionFromCurrentOffset
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  int64_t navigationOrientation;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double Height;
  double v18;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  navigationOrientation = self->_navigationOrientation;
  -[UIScrollView contentOffset](self, "contentOffset");
  if (navigationOrientation)
  {
    v14 = v13;
    v21.origin.x = v4;
    v21.origin.y = v6;
    v21.size.width = v8;
    v21.size.height = v10;
    if (v14 >= CGRectGetHeight(v21))
    {
      -[UIScrollView contentOffset](self, "contentOffset");
      v16 = v15;
      v22.origin.x = v4;
      v22.origin.y = v6;
      v22.size.width = v8;
      v22.size.height = v10;
      Height = CGRectGetHeight(v22);
      goto LABEL_7;
    }
    return 1;
  }
  v18 = v12;
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  if (v18 < CGRectGetWidth(v23))
    return 1;
  -[UIScrollView contentOffset](self, "contentOffset");
  v16 = v20;
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  Height = CGRectGetWidth(v24);
LABEL_7:
  if (v16 > Height)
    return 0;
  else
    return -1;
}

- (void)_enqueueCompletionState:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIQueuingScrollView.m"), 511, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state"));

  }
  if (-[NSMutableArray count](self->_completionStateQueue, "count"))
  {
    -[NSMutableArray lastObject](self->_completionStateQueue, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 != v7)
    {

LABEL_8:
      goto LABEL_9;
    }
    -[NSMutableArray lastObject](self->_completionStateQueue, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "transitionDirection");
    v10 = objc_msgSend(v12, "transitionDirection");

    if (v9 == v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIQueuingScrollView.m"), 513, CFSTR("Duplicate states in queue"));
      goto LABEL_8;
    }
  }
LABEL_9:
  -[NSMutableArray _ui_enqueue:](self->_completionStateQueue, "_ui_enqueue:", v12);

}

- (void)_cleanUpCompletionState:(id)a3 didFinish:(BOOL)a4 didComplete:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  NSMutableArray *viewStateQueue;
  id v8;

  if (a3)
  {
    v5 = a5;
    v6 = a4;
    viewStateQueue = self->_viewStateQueue;
    v8 = a3;
    -[NSMutableArray removeObject:](viewStateQueue, "removeObject:", v8);
    objc_msgSend(v8, "cleanupWithFinishedState:completedState:", v6, v5);

  }
}

- (void)_enqueueAnimatedScrollInDirection:(int64_t)a3 withView:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int64_t navigationOrientation;
  uint64_t v18;
  double Height;
  double Width;
  void *v24;
  uint64_t v25;
  _UIQueuingScrollViewState *v26;
  _UIQueuingScrollViewState *v27;
  void *v28;
  _UIQueuingScrollViewState *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  uint64_t v33;
  NSMutableArray *completionStateQueue;
  void *v35;
  _UIQueuingScrollViewState *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  double v48;
  double v49;
  int64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  int64_t v56;
  uint64_t v57;
  double v61;
  __CFString *v62;
  void *v63;
  void *v64;
  void *v65;
  _UIQueuingScrollViewState *v66;
  uint64_t v67;
  id v68;
  id v69;
  void *v70;
  id v71;
  _QWORD v72[5];
  id v73;
  id v74;
  int64_t v75;
  _QWORD v76[5];
  id v77;
  id v78;
  int64_t v79;
  _QWORD v80[5];
  id v81;
  id v82;
  id v83;
  id v84;
  int64_t v85;
  SEL v86;
  _QWORD v87[5];
  id v88;
  id v89;
  int64_t v90;

  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIQueuingScrollView.m"), 529, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view"));

  }
  -[UIScrollView contentOffset](self, "contentOffset");
  v12 = v11;
  v14 = v13;
  if (-[UIScrollView _pagingLeft](self, "_pagingLeft")
    || -[UIScrollView _pagingRight](self, "_pagingRight")
    || -[UIScrollView _pagingUp](self, "_pagingUp")
    || -[UIScrollView _pagingDown](self, "_pagingDown"))
  {
    -[UIScrollView _pageDecelerationTarget](self, "_pageDecelerationTarget");
LABEL_8:
    v12 = v15;
    v14 = v16;
    goto LABEL_9;
  }
  if (-[UIScrollView isScrollAnimating](self, "isScrollAnimating"))
  {
    -[UIScrollView _animatedTargetOffset](self, "_animatedTargetOffset");
    goto LABEL_8;
  }
LABEL_9:
  navigationOrientation = self->_navigationOrientation;
  -[UIView bounds](self, "bounds");
  if (navigationOrientation)
  {
    Height = CGRectGetHeight(*(CGRect *)&v18);
    if (a3)
      Height = -Height;
    v14 = v14 + Height;
  }
  else
  {
    Width = CGRectGetWidth(*(CGRect *)&v18);
    if (a3)
      Width = -Width;
    v12 = v12 + Width;
  }
  if (!-[NSMutableArray count](self->_completionStateQueue, "count"))
  {
    v29 = [_UIQueuingScrollViewState alloc];
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __78___UIQueuingScrollView__enqueueAnimatedScrollInDirection_withView_completion___block_invoke_4;
    v72[3] = &unk_1E16C0F20;
    v72[4] = self;
    v73 = v9;
    v75 = a3;
    v74 = v10;
    v27 = -[_UIQueuingScrollViewState initWithTransitionDirection:view:manual:completion:](v29, "initWithTransitionDirection:view:manual:completion:", a3, v73, 0, v72);
    -[NSMutableArray _ui_enqueue:](self->_viewStateQueue, "_ui_enqueue:", v27);
    v30 = (void *)MEMORY[0x1E0C99D20];
    if (a3 == 1)
    {
      -[_UIQueuingScrollView _visibleView](self, "_visibleView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("kUIFaultingViewSentinel");
    }
    else
    {
      -[NSArray objectAtIndex:](self->_views, "objectAtIndex:", 0);
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[_UIQueuingScrollView _visibleView](self, "_visibleView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a3)
      {
        v62 = CFSTR("kUIFaultingViewSentinel");
LABEL_37:
        objc_msgSend(v30, "arrayWithObjects:", v32, v31, v62, 0);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIQueuingScrollView _replaceViews:updatingContents:adjustContentInsets:animated:](self, "_replaceViews:updatingContents:adjustContentInsets:animated:", v63, 1, 1, 1);

        if (a3)
        {

          if (a3 == 1)
            goto LABEL_43;
        }
        else
        {

        }
LABEL_43:
        -[_UIQueuingScrollView _enqueueCompletionState:](self, "_enqueueCompletionState:", v27);
        -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 1, v12, v14);

        v28 = v73;
        goto LABEL_44;
      }
    }
    -[NSArray objectAtIndex:](self->_views, "objectAtIndex:", 2);
    v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  -[NSMutableArray lastObject](self->_completionStateQueue, "lastObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "transitionDirection");

  if (v25 == a3)
  {
    v26 = [_UIQueuingScrollViewState alloc];
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __78___UIQueuingScrollView__enqueueAnimatedScrollInDirection_withView_completion___block_invoke_3;
    v76[3] = &unk_1E16C0F20;
    v76[4] = self;
    v77 = v9;
    v79 = a3;
    v78 = v10;
    v27 = -[_UIQueuingScrollViewState initWithTransitionDirection:view:manual:completion:](v26, "initWithTransitionDirection:view:manual:completion:", a3, v77, 0, v76);
    -[NSMutableArray _ui_enqueue:](self->_viewStateQueue, "_ui_enqueue:", v27);
    -[_UIQueuingScrollView _enqueueCompletionState:](self, "_enqueueCompletionState:", v27);
    -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 1, v12, v14);

    v28 = v77;
LABEL_44:

    goto LABEL_45;
  }
  v33 = -[NSMutableArray count](self->_completionStateQueue, "count");
  completionStateQueue = self->_completionStateQueue;
  if (v33 == 1)
  {
    -[NSMutableArray _ui_dequeue](completionStateQueue, "_ui_dequeue");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIQueuingScrollView _cleanUpCompletionState:didFinish:didComplete:](self, "_cleanUpCompletionState:didFinish:didComplete:", v35, 0, 0);

    v36 = [_UIQueuingScrollViewState alloc];
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __78___UIQueuingScrollView__enqueueAnimatedScrollInDirection_withView_completion___block_invoke;
    v87[3] = &unk_1E16C0F20;
    v87[4] = self;
    v37 = v9;
    v88 = v37;
    v90 = a3;
    v71 = v10;
    v89 = v10;
    v27 = -[_UIQueuingScrollViewState initWithTransitionDirection:view:manual:completion:](v36, "initWithTransitionDirection:view:manual:completion:", a3, v37, 0, v87);
    -[UIScrollView _stopScrollingAndZoomingAnimationsPinningToContentViewport:](self, "_stopScrollingAndZoomingAnimationsPinningToContentViewport:", 0);
    -[_UIQueuingScrollView _enqueueCompletionState:](self, "_enqueueCompletionState:", v27);
    -[_UIQueuingScrollView _visibleView](self, "_visibleView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIQueuingScrollView _notifyDelegateWillManuallyScroll:toRevealView:concealingView:animated:](self, "_notifyDelegateWillManuallyScroll:toRevealView:concealingView:animated:", 0, v37, v38, 1);

    -[_UIQueuingScrollView _visibleView](self, "_visibleView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIQueuingScrollView _notifyDelegateDidCommitManualScroll:toRevealView:concealView:direction:animated:canComplete:](self, "_notifyDelegateDidCommitManualScroll:toRevealView:concealView:direction:animated:canComplete:", 0, v37, v39, a3, 1, 1);

    v40 = (void *)MEMORY[0x1E0C99D20];
    -[_UIQueuingScrollView _viewAtIndex:loadingIfNecessary:updatingContents:animated:](self, "_viewAtIndex:loadingIfNecessary:updatingContents:animated:", 0, 0, 0, 1);
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v41;
    if (v41)
      v43 = (const __CFString *)v41;
    else
      v43 = CFSTR("kUIFaultingViewSentinel");
    -[_UIQueuingScrollView _viewAtIndex:loadingIfNecessary:updatingContents:animated:](self, "_viewAtIndex:loadingIfNecessary:updatingContents:animated:", 2, 0, 0, 1);
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v44;
    if (v44)
      v46 = (const __CFString *)v44;
    else
      v46 = CFSTR("kUIFaultingViewSentinel");
    objc_msgSend(v40, "arrayWithObjects:", v43, v37, v46, 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIQueuingScrollView _replaceViews:updatingContents:adjustContentInsets:animated:](self, "_replaceViews:updatingContents:adjustContentInsets:animated:", v47, 1, 1, 1);

    -[UIScrollView _contentOffsetAnimationDuration](self, "_contentOffsetAnimationDuration");
    v49 = v48;
    v50 = self->_navigationOrientation;
    -[UIScrollView contentOffset](self, "contentOffset");
    v52 = v12 - v51;
    v54 = v14 - v53;
    if (v50)
      v52 = v54;
    if (v52 >= 0.0)
      v55 = v52;
    else
      v55 = -v52;
    v56 = self->_navigationOrientation;
    -[UIView bounds](self, "bounds");
    if (v56)
      v61 = CGRectGetHeight(*(CGRect *)&v57);
    else
      v61 = CGRectGetWidth(*(CGRect *)&v57);
    -[UIScrollView _setContentOffsetAnimationDuration:](self, "_setContentOffsetAnimationDuration:", v49 * (v55 / v61));
    -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 1, v12, v14);
    -[UIScrollView _setContentOffsetAnimationDuration:](self, "_setContentOffsetAnimationDuration:", v49);

    v10 = v71;
  }
  else
  {
    -[NSMutableArray lastObject](completionStateQueue, "lastObject");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeLastObject](self->_completionStateQueue, "removeLastObject");
    -[NSMutableArray removeObject:](self->_viewStateQueue, "removeObject:", v64);
    -[NSMutableArray lastObject](self->_completionStateQueue, "lastObject");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeLastObject](self->_completionStateQueue, "removeLastObject");
    v66 = [_UIQueuingScrollViewState alloc];
    v67 = objc_msgSend(v65, "transitionDirection");
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __78___UIQueuingScrollView__enqueueAnimatedScrollInDirection_withView_completion___block_invoke_2;
    v80[3] = &unk_1E16C0F48;
    v80[4] = self;
    v81 = v65;
    v82 = v64;
    v83 = v9;
    v85 = a3;
    v84 = v10;
    v86 = a2;
    v68 = v64;
    v69 = v65;
    v27 = -[_UIQueuingScrollViewState initWithTransitionDirection:view:manual:completion:](v66, "initWithTransitionDirection:view:manual:completion:", v67, v83, 0, v80);
    -[_UIQueuingScrollView _enqueueCompletionState:](self, "_enqueueCompletionState:", v27);
    -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 1, v12, v14);

  }
LABEL_45:

}

- (void)_notifyDelegateWillManuallyScroll:(BOOL)a3 toRevealView:(id)a4 concealingView:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  id v10;
  id WeakRetained;
  id v12;

  v6 = a6;
  v8 = a3;
  v12 = a4;
  v10 = a5;
  if (v12 && (*(_WORD *)&self->_delegateFlags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_qDelegate);
    objc_msgSend(WeakRetained, "queuingScrollView:willManuallyScroll:toRevealView:concealView:animated:", self, v8, v12, v10, v6);

  }
}

- (void)_notifyDelegateDidCommitManualScroll:(BOOL)a3 toRevealView:(id)a4 concealView:(id)a5 direction:(int64_t)a6 animated:(BOOL)a7 canComplete:(BOOL)a8
{
  _BOOL8 v9;
  _BOOL8 v12;
  id v14;
  id WeakRetained;
  uint64_t v16;
  id v17;

  v9 = a7;
  v12 = a3;
  v17 = a4;
  v14 = a5;
  if (v17 && (*(_WORD *)&self->_delegateFlags & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_qDelegate);
    LOBYTE(v16) = a8;
    objc_msgSend(WeakRetained, "queuingScrollView:didCommitManualScroll:toRevealView:concealView:direction:animated:canComplete:", self, v12, v17, v14, a6, v9, v16);

  }
}

- (void)_notifyDelegateDidEndManualScroll:(BOOL)a3 toRevealView:(id)a4 direction:(int64_t)a5 animated:(BOOL)a6 didFinish:(BOOL)a7 didComplete:(BOOL)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v12;
  id v14;
  id WeakRetained;
  uint64_t v16;
  id v17;

  v9 = a7;
  v10 = a6;
  v12 = a3;
  v14 = a4;
  if (v14 && (*(_WORD *)&self->_delegateFlags & 4) != 0)
  {
    v17 = v14;
    WeakRetained = objc_loadWeakRetained((id *)&self->_qDelegate);
    LOBYTE(v16) = a8;
    objc_msgSend(WeakRetained, "queuingScrollView:didEndManualScroll:toRevealView:direction:animated:didFinish:didComplete:", self, v12, v17, a5, v10, v9, v16);

    v14 = v17;
  }

}

- (void)_notifyDelegateDidBailoutOfScrollAndRevealedView:(id)a3
{
  _UIQueuingScrollViewDelegate **p_qDelegate;
  id v5;
  id WeakRetained;

  if ((*(_WORD *)&self->_delegateFlags & 8) != 0)
  {
    p_qDelegate = &self->_qDelegate;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_qDelegate);
    objc_msgSend(WeakRetained, "queuingScrollView:didBailoutOfScrollAndRevealedView:", self, v5);

  }
}

- (void)_notifyDelegateDidFinishScrolling
{
  id WeakRetained;

  if ((*(_WORD *)&self->_delegateFlags & 0x10) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_qDelegate);
    objc_msgSend(WeakRetained, "queuingScrollViewDidFinishScrolling:", self);

  }
}

- (void)setView:(id)a3 direction:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  void (**v11)(id, uint64_t, uint64_t);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v11 = (void (**)(id, uint64_t, uint64_t))a6;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIQueuingScrollView.m"), 681, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view"));

  }
  if (!-[UIScrollView isTracking](self, "isTracking") || !-[UIScrollView isDragging](self, "isDragging"))
  {
    if (a5)
    {
      -[_UIQueuingScrollView _enqueueAnimatedScrollInDirection:withView:completion:](self, "_enqueueAnimatedScrollInDirection:withView:completion:", a4, v17, v11);
    }
    else
    {
      while (-[NSMutableArray count](self->_completionStateQueue, "count"))
      {
        -[NSMutableArray _ui_dequeue](self->_completionStateQueue, "_ui_dequeue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIQueuingScrollView _cleanUpCompletionState:didFinish:didComplete:](self, "_cleanUpCompletionState:didFinish:didComplete:", v12, 0, 0);

      }
      -[NSMutableArray removeAllObjects](self->_viewStateQueue, "removeAllObjects");
      -[_UIQueuingScrollView _visibleView](self, "_visibleView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIQueuingScrollView _notifyDelegateWillManuallyScroll:toRevealView:concealingView:animated:](self, "_notifyDelegateWillManuallyScroll:toRevealView:concealingView:animated:", 0, v17, v13, 0);

      -[_UIQueuingScrollView _visibleView](self, "_visibleView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIQueuingScrollView _notifyDelegateDidCommitManualScroll:toRevealView:concealView:direction:animated:canComplete:](self, "_notifyDelegateDidCommitManualScroll:toRevealView:concealView:direction:animated:canComplete:", 0, v17, v14, a4, 0, 1);

      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v17, CFSTR("kUIFaultingViewSentinel"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIQueuingScrollView _replaceViews:updatingContents:adjustContentInsets:animated:](self, "_replaceViews:updatingContents:adjustContentInsets:animated:", v15, 1, 1, 0);

      -[_UIQueuingScrollView _notifyDelegateDidEndManualScroll:toRevealView:direction:animated:didFinish:didComplete:](self, "_notifyDelegateDidEndManualScroll:toRevealView:direction:animated:didFinish:didComplete:", 0, v17, a4, 0, 1, 1);
      if (v11)
        v11[2](v11, 1, 1);
    }
  }

}

- (void)_adjustContentInsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int64_t navigationOrientation;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  int64_t v14;
  void *v15;

  -[_UIQueuingScrollView _visibleView](self, "_visibleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIView bounds](self, "bounds");
    v6 = v4;
    v7 = v5;
    navigationOrientation = self->_navigationOrientation;
    if (navigationOrientation)
      v9 = v5 * 100.0;
    else
      v9 = 0.0;
    if (navigationOrientation)
      v10 = 0.0;
    else
      v10 = v4 * 100.0;
    -[_UIQueuingScrollView _viewAtIndex:loadingIfNecessary:updatingContents:animated:](self, "_viewAtIndex:loadingIfNecessary:updatingContents:animated:", 0, 1, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v10;
    v13 = v9;
    if (!v11)
    {
      v14 = self->_navigationOrientation;
      if (v14)
        v12 = v10;
      else
        v12 = -v6;
      if (v14)
        v13 = -v7;
      else
        v13 = v9;
    }
    -[_UIQueuingScrollView _viewAtIndex:loadingIfNecessary:updatingContents:animated:](self, "_viewAtIndex:loadingIfNecessary:updatingContents:animated:", 2, 1, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      if (self->_navigationOrientation)
        v9 = -v7;
      else
        v10 = -v6;
    }
  }
  else
  {
    v10 = 0.0;
    v9 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
  }
  -[UIScrollView setContentInset:](self, "setContentInset:", v13, v12, v9, v10);
}

- (void)_boundsDidChangeToSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  int64_t navigationOrientation;
  double v8;
  double v9;
  void *v10;
  void *v11;
  int64_t v12;
  double pageSpacing;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  int64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  int64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;

  height = a3.height;
  width = a3.width;
  v6 = a3.height * 3.0;
  if (self->_navigationOrientation)
    a3.height = a3.height * 3.0;
  else
    a3.width = a3.width * 3.0;
  -[UIScrollView setContentSize:](self, "setContentSize:", a3.width, a3.height, v6);
  navigationOrientation = self->_navigationOrientation;
  if (navigationOrientation)
    v8 = 0.0;
  else
    v8 = width;
  if (navigationOrientation)
    v9 = height;
  else
    v9 = 0.0;
  -[UIScrollView setContentOffset:](self, "setContentOffset:", v8, v9);
  -[NSArray objectAtIndex:](self->_wrapperViews, "objectAtIndex:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = self->_navigationOrientation;
  pageSpacing = self->_pageSpacing;
  v14 = height - (pageSpacing + pageSpacing);
  v15 = width - (pageSpacing + pageSpacing);
  if (v12)
    v16 = 0.0;
  else
    v16 = self->_pageSpacing;
  if (v12)
  {
    v15 = width;
  }
  else
  {
    pageSpacing = 0.0;
    v14 = height;
  }
  objc_msgSend(v10, "setFrame:", v16, pageSpacing, v15, v14);

  -[NSArray objectAtIndex:](self->_wrapperViews, "objectAtIndex:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  v19 = self->_navigationOrientation;
  v20 = self->_pageSpacing;
  v21 = v20 + v20;
  v22 = height + v20;
  v23 = height - (v20 + v20);
  v24 = width + v20;
  v25 = width - v21;
  if (v19)
  {
    v24 = 0.0;
    v26 = v22;
  }
  else
  {
    v26 = 0.0;
  }
  if (v19)
    v27 = width;
  else
    v27 = v25;
  if (!v19)
    v23 = height;
  objc_msgSend(v17, "setFrame:", v24, v26, v27, v23, v25);

  -[NSArray objectAtIndex:](self->_wrapperViews, "objectAtIndex:", 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  v30 = self->_navigationOrientation;
  v31 = self->_pageSpacing;
  v32 = v31 + v31;
  v33 = height + height + v31;
  v34 = height - (v31 + v31);
  v35 = width + width + v31;
  v36 = width - v32;
  if (v30)
  {
    v35 = 0.0;
    v37 = v33;
  }
  else
  {
    v37 = 0.0;
  }
  if (v30)
    v38 = width;
  else
    v38 = v36;
  if (!v30)
    v34 = height;
  objc_msgSend(v28, "setFrame:", v35, v37, v38, v34, v36);

  -[_UIQueuingScrollView _adjustContentInsets](self, "_adjustContentInsets");
}

- (void)_commitGestureDrivenScrollRevealingView:(id)a3 concealingView:(id)a4 inDirection:(int64_t)a5 canComplete:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _UIQueuingScrollViewState *v16;
  _UIQueuingScrollViewState *v17;
  void *v18;
  uint64_t v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  int64_t v26;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v10 && v11)
  {
    -[NSMutableArray lastObject](self->_completionStateQueue, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isManual"))
    {
      objc_msgSend(v13, "view");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14 == v10)
      {
        v15 = objc_msgSend(v13, "transitionDirection");

        if (v15 == a5)
        {
          v16 = 0;
          goto LABEL_9;
        }
      }
      else
      {

      }
    }
    v17 = [_UIQueuingScrollViewState alloc];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __103___UIQueuingScrollView__commitGestureDrivenScrollRevealingView_concealingView_inDirection_canComplete___block_invoke;
    v24[3] = &unk_1E16C0F70;
    v24[4] = self;
    v25 = v10;
    v26 = a5;
    v16 = -[_UIQueuingScrollViewState initWithTransitionDirection:view:manual:completion:](v17, "initWithTransitionDirection:view:manual:completion:", a5, v25, 1, v24);

LABEL_9:
    if ((objc_msgSend(v13, "isManual") & 1) != 0)
    {
      objc_msgSend(v13, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18 == v12)
      {
        objc_msgSend(v13, "view");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIQueuingScrollView _visibleView](self, "_visibleView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v22 == v23;

LABEL_21:
        -[NSMutableArray removeLastObject](self->_completionStateQueue, "removeLastObject");
        -[_UIQueuingScrollView _cleanUpCompletionState:didFinish:didComplete:](self, "_cleanUpCompletionState:didFinish:didComplete:", v13, v20, v20);
        if (!v16)
          goto LABEL_18;
        goto LABEL_17;
      }
      v19 = objc_msgSend(v13, "transitionDirection");
      if (v19 != -[_UITransitionState transitionDirection](v16, "transitionDirection"))
      {
        v20 = 0;
        goto LABEL_21;
      }
    }
    else
    {
      while (-[NSMutableArray count](self->_completionStateQueue, "count"))
      {
        -[NSMutableArray _ui_dequeue](self->_completionStateQueue, "_ui_dequeue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIQueuingScrollView _cleanUpCompletionState:didFinish:didComplete:](self, "_cleanUpCompletionState:didFinish:didComplete:", v21, 0, 0);

      }
      -[NSMutableArray removeAllObjects](self->_viewStateQueue, "removeAllObjects");
    }
    if (!v16)
    {
LABEL_18:

      goto LABEL_19;
    }
LABEL_17:
    -[_UIQueuingScrollView _enqueueCompletionState:](self, "_enqueueCompletionState:", v16);
    -[_UIQueuingScrollView _notifyDelegateDidCommitManualScroll:toRevealView:concealView:direction:animated:canComplete:](self, "_notifyDelegateDidCommitManualScroll:toRevealView:concealView:direction:animated:canComplete:", 1, v10, v12, a5, 1, v6);
    goto LABEL_18;
  }
LABEL_19:

}

- (BOOL)_isDeceleratingInOppositionToNavigationDirection:(int64_t)a3
{
  _BOOL4 v5;
  int64_t navigationOrientation;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  double v11;
  double v12;
  void *v14;

  if (a3 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIQueuingScrollView.m"), 779, CFSTR("'Undetermined' is not a valid navigation direction for this method"));

  }
  v5 = -[UIScrollView isDecelerating](self, "isDecelerating");
  if (v5)
  {
    navigationOrientation = self->_navigationOrientation;
    -[UIScrollView contentOffset](self, "contentOffset");
    if (navigationOrientation)
      v9 = v8;
    else
      v9 = v7;
    v10 = self->_navigationOrientation;
    -[UIScrollView _pageDecelerationTarget](self, "_pageDecelerationTarget");
    if (v10)
      v11 = v12;
    if (a3)
      LOBYTE(v5) = v9 < v11;
    else
      LOBYTE(v5) = v11 < v9;
  }
  return v5;
}

- (BOOL)_isScrollInProgress:(BOOL)a3
{
  if (-[UIScrollView isTracking](self, "isTracking"))
    return 1;
  else
    return -[UIScrollView isDecelerating](self, "isDecelerating") || a3;
}

- (void)_didScrollWithAnimation:(BOOL)a3 force:(BOOL)a4
{
  _BOOL8 v5;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int64_t v19;
  void *v20;
  void *v21;
  int64_t navigationOrientation;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  _BOOL4 v29;
  BOOL v30;
  uint64_t v31;
  __CFString *v32;
  void *v33;
  int64_t v34;
  double v35;
  double v36;
  _QWORD v37[14];
  BOOL v38;
  BOOL v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[3];
  _QWORD v45[4];

  v5 = a3;
  v45[3] = *MEMORY[0x1E0C80C00];
  v8 = -[_UIQueuingScrollView _isScrollInProgress:](self, "_isScrollInProgress:");
  v9 = v8;
  if (a4
    || v8
    && !-[UIScrollView _isHorizontalBouncing](self, "_isHorizontalBouncing")
    && !-[UIScrollView _isVerticalBouncing](self, "_isVerticalBouncing"))
  {
    if (-[UIScrollView isTracking](self, "isTracking"))
      LOBYTE(v10) = 1;
    else
      v10 = -[UIScrollView isDecelerating](self, "isDecelerating") && !v5;
    self->_manualScrollInProgress = v10;
    -[UIView bounds](self, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    if (v9)
      v19 = -[_UIQueuingScrollView _navigationDirectionForActiveScroll:](self, "_navigationDirectionForActiveScroll:", v5);
    else
      v19 = -[_UIQueuingScrollView _navigationDirectionFromCurrentOffset](self, "_navigationDirectionFromCurrentOffset");
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = 0;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __54___UIQueuingScrollView__didScrollWithAnimation_force___block_invoke;
    v37[3] = &unk_1E16C0F98;
    v37[4] = self;
    v37[5] = &v40;
    v38 = v5;
    v39 = v9;
    v37[6] = v19;
    v37[7] = a2;
    *(double *)&v37[8] = v12;
    *(double *)&v37[9] = v14;
    *(double *)&v37[10] = v12;
    *(double *)&v37[11] = v14;
    *(double *)&v37[12] = v16;
    *(double *)&v37[13] = v18;
    v20 = _Block_copy(v37);
    v21 = v20;
    navigationOrientation = self->_navigationOrientation;
    if ((navigationOrientation || v12 >= v16) && (navigationOrientation != 1 || v14 >= v18))
    {
      v29 = v14 > v18 && navigationOrientation == 1;
      v30 = v12 > v16 && navigationOrientation == 0;
      v23 = 2;
      if (!v30 && !v29)
        goto LABEL_57;
    }
    else
    {
      v23 = 0;
    }
    if (!(*((unsigned int (**)(void *, uint64_t))v20 + 2))(v20, v23))
    {
LABEL_57:

      _Block_object_dispose(&v40, 8);
      return;
    }
    -[NSMutableArray _ui_dequeue](self->_completionStateQueue, "_ui_dequeue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIQueuingScrollView _cleanUpCompletionState:didFinish:didComplete:](self, "_cleanUpCompletionState:didFinish:didComplete:", v24, 1, 1);

    v25 = v41[3];
    if (v25 == -1)
    {
      -[_UIQueuingScrollView _viewAtIndex:loadingIfNecessary:updatingContents:animated:](self, "_viewAtIndex:loadingIfNecessary:updatingContents:animated:", 0, 0, 0, v5);
      v31 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v31;
      if (v31)
      {
        v32 = CFSTR("kUIFaultingViewSentinel");
        v44[0] = CFSTR("kUIFaultingViewSentinel");
        v44[1] = v31;
        if (!v5)
        {
          -[_UIQueuingScrollView _visibleView](self, "_visibleView");
          v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        v44[2] = v32;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v5)

      }
      else
      {
        v33 = 0;
      }
      v34 = self->_navigationOrientation;
      v35 = v12 + v16;
      v36 = v14 + v18;
    }
    else
    {
      if (v25 != 1)
      {
        v33 = 0;
LABEL_56:
        -[UIScrollView setContentOffset:](self, "setContentOffset:", v12, v14);
        -[_UIQueuingScrollView _adjustContentInsets](self, "_adjustContentInsets");

        goto LABEL_57;
      }
      -[_UIQueuingScrollView _viewAtIndex:loadingIfNecessary:updatingContents:animated:](self, "_viewAtIndex:loadingIfNecessary:updatingContents:animated:", 2, 0, 0, v5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        if (v5)
        {
          v27 = CFSTR("kUIFaultingViewSentinel");
        }
        else
        {
          -[_UIQueuingScrollView _visibleView](self, "_visibleView");
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        v45[0] = v27;
        v45[1] = v26;
        v45[2] = CFSTR("kUIFaultingViewSentinel");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v5)

      }
      else
      {
        v33 = 0;
      }
      v34 = self->_navigationOrientation;
      v35 = v12 - v16;
      v36 = v14 - v18;
    }
    if (v34)
      v12 = 0.0;
    else
      v12 = v35;
    if (v34)
      v14 = v36;
    else
      v14 = 0.0;

    if (v33)
      -[_UIQueuingScrollView _replaceViews:updatingContents:adjustContentInsets:animated:](self, "_replaceViews:updatingContents:adjustContentInsets:animated:", v33, 1, 1, v5);
    goto LABEL_56;
  }
}

- (void)_didEndDraggingManualScroll
{
  int64_t v3;
  int64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t navigationOrientation;
  BOOL v14;
  BOOL v15;
  _BOOL4 v17;
  UIView *v20;
  uint64_t v21;
  UIView *v22;
  _BOOL8 v23;
  uint64_t v24;
  UIView *v25;
  UIView *v26;
  UIView *v27;
  UIView *pendingVisibleView;
  UIView *v29;
  uint64_t v30;
  UIView *v31;
  UIView *v32;
  UIView *v33;
  id v34;

  v3 = -[_UIQueuingScrollView _navigationDirectionForActiveScroll:](self, "_navigationDirectionForActiveScroll:", 0);
  if (v3 != -1)
  {
    v4 = v3;
    -[UIView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[NSMutableArray lastObject](self->_completionStateQueue, "lastObject");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    navigationOrientation = self->_navigationOrientation;
    if (navigationOrientation)
      v14 = 0;
    else
      v14 = v6 < v10;
    if (v14 || (navigationOrientation == 1 ? (v15 = v8 < v12) : (v15 = 0), v15))
    {
      -[_UIQueuingScrollView _viewAtIndex:loadingIfNecessary:updatingContents:animated:](self, "_viewAtIndex:loadingIfNecessary:updatingContents:animated:", 0, 1, 1, 1);
      v20 = (UIView *)objc_claimAutoreleasedReturnValue();
      if (!v34
        || (v24 = objc_msgSend(v34, "transitionDirection"), v4)
        || v24 != 1
        || (objc_msgSend(v34, "view"), v25 = (UIView *)objc_claimAutoreleasedReturnValue(),
                                       v25,
                                       v25 != v20))
      {
        if (-[UIScrollView _pagingLeft](self, "_pagingLeft") || -[UIScrollView _pagingUp](self, "_pagingUp"))
          goto LABEL_37;
        if (v4)
        {
          pendingVisibleView = self->_pendingVisibleView;
          if (!pendingVisibleView)
            goto LABEL_37;
          -[_UIQueuingScrollView _visibleView](self, "_visibleView");
          v29 = (UIView *)objc_claimAutoreleasedReturnValue();

          v23 = 0;
          if (pendingVisibleView == v29)
            goto LABEL_37;
        }
        else
        {
          v23 = 1;
        }
        v31 = self->_pendingVisibleView;
LABEL_47:
        if (!v31)
          v31 = v20;
        v27 = v31;
        -[_UIQueuingScrollView _visibleView](self, "_visibleView");
        v26 = (UIView *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        goto LABEL_50;
      }
      -[_UIQueuingScrollView _visibleView](self, "_visibleView");
      v27 = (UIView *)objc_claimAutoreleasedReturnValue();
      v26 = v20;
      v23 = 0;
    }
    else
    {
      v17 = v8 > v12 && navigationOrientation == 1;
      if ((v6 <= v10 || navigationOrientation != 0) && !v17)
        goto LABEL_52;
      -[_UIQueuingScrollView _viewAtIndex:loadingIfNecessary:updatingContents:animated:](self, "_viewAtIndex:loadingIfNecessary:updatingContents:animated:", 2, 1, 1, 1);
      v20 = (UIView *)objc_claimAutoreleasedReturnValue();
      if (!v34
        || (v21 = objc_msgSend(v34, "transitionDirection"), v4 != 1)
        || v21
        || (objc_msgSend(v34, "view"), v22 = (UIView *)objc_claimAutoreleasedReturnValue(),
                                       v22,
                                       v22 != v20))
      {
        if (!-[UIScrollView _pagingRight](self, "_pagingRight") && !-[UIScrollView _pagingDown](self, "_pagingDown"))
        {
          if (v4 == 1)
          {
            v23 = 0;
LABEL_57:
            v31 = self->_pendingVisibleView;
            goto LABEL_47;
          }
          v32 = self->_pendingVisibleView;
          if (v32)
          {
            -[_UIQueuingScrollView _visibleView](self, "_visibleView");
            v33 = (UIView *)objc_claimAutoreleasedReturnValue();

            if (v32 != v33)
            {
              v23 = v4 == 0;
              goto LABEL_57;
            }
          }
        }
LABEL_37:
        v26 = 0;
        v27 = 0;
LABEL_51:

LABEL_52:
        return;
      }
      -[_UIQueuingScrollView _visibleView](self, "_visibleView");
      v27 = (UIView *)objc_claimAutoreleasedReturnValue();
      v26 = v20;
      v23 = 1;
    }
    v30 = 1;
LABEL_50:
    -[_UIQueuingScrollView _commitGestureDrivenScrollRevealingView:concealingView:inDirection:canComplete:](self, "_commitGestureDrivenScrollRevealingView:concealingView:inDirection:canComplete:", v27, v26, v23, v30);
    goto LABEL_51;
  }
}

- (void)_didEndScroll:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  UIView *pendingVisibleView;
  double v13;
  double v14;
  double v15;
  double v16;
  int64_t navigationOrientation;
  uint64_t v18;
  double Height;
  double Width;
  void *v24;
  id v25;
  CGRect v26;
  CGRect v27;

  v3 = a3;
  if (a3 || (unint64_t)-[NSMutableArray count](self->_completionStateQueue, "count") > 1)
  {
    v6 = 0;
  }
  else if (self->_manualScrollInProgress)
  {
    -[NSMutableArray _ui_peek](self->_completionStateQueue, "_ui_peek");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isManual");

  }
  else
  {
    v6 = 1;
  }
  v7 = -[_UIQueuingScrollView _navigationDirectionFromCurrentOffset](self, "_navigationDirectionFromCurrentOffset");
  v8 = -[_UIQueuingScrollView _navigationDirectionForActiveScroll:](self, "_navigationDirectionForActiveScroll:", v3);
  if (v6 && v7 == v8)
  {
    if (-[NSMutableArray count](self->_completionStateQueue, "count") == 1)
    {
      -[NSMutableArray _ui_dequeue](self->_completionStateQueue, "_ui_dequeue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIQueuingScrollView _visibleView](self, "_visibleView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIQueuingScrollView _cleanUpCompletionState:didFinish:didComplete:](self, "_cleanUpCompletionState:didFinish:didComplete:", v9, 1, v10 == v11);

      if (!-[UIScrollView isTracking](self, "isTracking"))
      {
        pendingVisibleView = self->_pendingVisibleView;
        self->_pendingVisibleView = 0;

      }
    }
    -[UIScrollView contentOffset](self, "contentOffset");
    v14 = v13;
    v16 = v15;
    navigationOrientation = self->_navigationOrientation;
    -[UIView bounds](self, "bounds");
    if (navigationOrientation)
    {
      if (v16 != CGRectGetHeight(*(CGRect *)&v18))
      {
        -[UIView bounds](self, "bounds");
        Height = CGRectGetHeight(v26);
LABEL_18:
        Width = v14;
        goto LABEL_19;
      }
    }
    else if (v14 != CGRectGetWidth(*(CGRect *)&v18))
    {
      -[UIView bounds](self, "bounds");
      Width = CGRectGetWidth(v27);
      Height = v16;
LABEL_19:
      if (v14 != Width || v16 != Height)
      {
        -[UIScrollView _stopScrollingAndZoomingAnimationsPinningToContentViewport:](self, "_stopScrollingAndZoomingAnimationsPinningToContentViewport:", 0);
        -[UIScrollView setContentOffset:](self, "setContentOffset:", Width, Height);
        while (-[NSMutableArray count](self->_completionStateQueue, "count"))
        {
          -[NSMutableArray _ui_dequeue](self->_completionStateQueue, "_ui_dequeue");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIQueuingScrollView _cleanUpCompletionState:didFinish:didComplete:](self, "_cleanUpCompletionState:didFinish:didComplete:", v24, 0, 0);

        }
        -[_UIQueuingScrollView _visibleView](self, "_visibleView");
        v25 = (id)objc_claimAutoreleasedReturnValue();
        -[_UIQueuingScrollView _notifyDelegateDidBailoutOfScrollAndRevealedView:](self, "_notifyDelegateDidBailoutOfScrollAndRevealedView:", v25);

      }
      return;
    }
    Height = v16;
    goto LABEL_18;
  }
}

- (void)_didEndManualScroll
{
  -[_UIQueuingScrollView _didEndScroll:](self, "_didEndScroll:", -[UIScrollView isScrollAnimating](self, "isScrollAnimating"));
  self->_manualScrollInProgress = 0;
  -[_UIQueuingScrollView _notifyDelegateDidFinishScrolling](self, "_notifyDelegateDidFinishScrolling");
}

- (void)_didEndProgrammaticScroll
{
  -[_UIQueuingScrollView _didEndScroll:](self, "_didEndScroll:", 0);
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (_UIQueuingScrollViewDelegate)qDelegate
{
  return (_UIQueuingScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_qDelegate);
}

- (_UIQueuingScrollViewDataSource)qDataSource
{
  return (_UIQueuingScrollViewDataSource *)objc_loadWeakRetained((id *)&self->_qDataSource);
}

- (double)pageSpacing
{
  return self->_pageSpacing;
}

- (CGRect)disabledScrollingRegion
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_disabledScrollingRegion.origin.x;
  y = self->_disabledScrollingRegion.origin.y;
  width = self->_disabledScrollingRegion.size.width;
  height = self->_disabledScrollingRegion.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setDisabledScrollingRegion:(CGRect)a3
{
  self->_disabledScrollingRegion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionStateQueue, 0);
  objc_storeStrong((id *)&self->_viewStateQueue, 0);
  objc_storeStrong((id *)&self->_pendingVisibleView, 0);
  objc_storeStrong((id *)&self->_wrapperViews, 0);
  objc_storeStrong((id *)&self->_views, 0);
  objc_destroyWeak((id *)&self->_qDataSource);
  objc_destroyWeak((id *)&self->_qDelegate);
}

@end
