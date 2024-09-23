@implementation SBRootFolderView

- (id)iconListViewAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  -[SBRootFolderView iconListViewForExtraIndex:](self, "iconListViewForExtraIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBRootFolderView;
    -[SBFolderView iconListViewAtIndex:](&v10, sel_iconListViewAtIndex_, a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)iconListViewForExtraIndex:(unint64_t)a3
{
  SBDockIconListView *v4;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3 == 10000)
  {
    v4 = self->_dockListView;
  }
  else
  {
    -[SBRootFolderView leadingCustomViewController](self, "leadingCustomViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[SBRootFolderView leadingCustomViewController](self, "leadingCustomViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "iconListViewQueryable");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB36B0], "sb_indexPathWithListIndex:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolderView folder](self, "folder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "iconListViewForListAtIndexPath:inFolder:", v10, v11);
      v4 = (SBDockIconListView *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (SBHRootFolderCustomViewPresenting)leadingCustomViewController
{
  return self->_leadingCustomViewController;
}

- (double)scrollableWidthForVisibleColumnRange
{
  double result;
  objc_super v4;
  CGRect v5;

  if (-[SBFolderView isVertical](self, "isVertical"))
  {
    v4.receiver = self;
    v4.super_class = (Class)SBRootFolderView;
    -[SBFolderView scrollableWidthForVisibleColumnRange](&v4, sel_scrollableWidthForVisibleColumnRange);
  }
  else
  {
    -[SBRootFolderView bounds](self, "bounds");
    return CGRectGetWidth(v5);
  }
  return result;
}

- (double)additionalScrollWidthToKeepVisibleInOneDirection
{
  double result;
  objc_super v4;

  if ((-[SBRootFolderView dockEdge](self, "dockEdge") & 0xA) != 0)
  {
    -[SBRootFolderView maxDockHeight](self, "maxDockHeight");
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBRootFolderView;
    -[SBFolderView additionalScrollWidthToKeepVisibleInOneDirection](&v4, sel_additionalScrollWidthToKeepVisibleInOneDirection);
  }
  return result;
}

- (unint64_t)dockEdge
{
  return self->_dockEdge;
}

- (id)additionalIconListViews
{
  void *v2;
  objc_super v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (self->_dockListView)
  {
    v5[0] = self->_dockListView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBRootFolderView;
    -[SBFolderView additionalIconListViews](&v4, sel_additionalIconListViews);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (BOOL)isOnLeadingCustomPage
{
  int64_t v3;

  v3 = -[SBFolderView currentPageIndex](self, "currentPageIndex");
  return v3 == -[SBRootFolderView leadingCustomViewPageIndex](self, "leadingCustomViewPageIndex");
}

- (void)_updateIconListIndexSearchableAndLeadingCustomViewsWithLayout:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  _BOOL4 v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _BOOL8 v13;
  _BOOL4 v14;
  double baseOffsetForDeterminingScrollToSearchThreshold;
  double v16;
  double v17;
  double v18;
  id v20;

  v3 = a3;
  -[SBFolderView scrollView](self, "scrollView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFolderView currentScrollOffset](self, "currentScrollOffset");
  v6 = v5;
  v7 = -[SBFolderView isScrolling](self, "isScrolling");
  if (v7)
  {
    -[SBFolderView scrollOffsetForPageIndexCalculation](self, "scrollOffsetForPageIndexCalculation");
    v8 = -[SBFolderView typeForPage:](self, "typeForPage:", -[SBFolderView _pageIndexForOffset:](self, "_pageIndexForOffset:"));
    if (objc_msgSend(v20, "isTracking") && v8 == 1)
    {
      -[SBRootFolderView scrollingPageDotsVisibilityAssertion](self, "scrollingPageDotsVisibilityAssertion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        -[SBRootFolderView requirePageDotsVisibilityForReason:](self, "requirePageDotsVisibilityForReason:", CFSTR("scrolling"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBRootFolderView setScrollingPageDotsVisibilityAssertion:](self, "setScrollingPageDotsVisibilityAssertion:", v10);

      }
      goto LABEL_8;
    }
  }
  else
  {
    v8 = -[SBFolderView typeForPage:](self, "typeForPage:", -[SBFolderView currentPageIndex](self, "currentPageIndex"));
  }
  -[SBRootFolderView scrollingPageDotsVisibilityAssertion](self, "scrollingPageDotsVisibilityAssertion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRootFolderView setScrollingPageDotsVisibilityAssertion:](self, "setScrollingPageDotsVisibilityAssertion:", 0);
  objc_msgSend(v11, "invalidate");

  if (v8)
  {
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  v14 = -[SBFolderView isRTL](self, "isRTL");
  baseOffsetForDeterminingScrollToSearchThreshold = self->_baseOffsetForDeterminingScrollToSearchThreshold;
  v16 = v6 - baseOffsetForDeterminingScrollToSearchThreshold;
  v17 = baseOffsetForDeterminingScrollToSearchThreshold - v6;
  if (v14)
    v18 = v16;
  else
    v18 = v17;
  -[SBRootFolderView leadingCustomViewVisibilityProgress](self, "leadingCustomViewVisibilityProgress");
  v12 = 1;
  if (BSFloatIsZero())
  {
    if (v18 > 0.0 && v3)
      -[SBRootFolderView layoutSearchableViews](self, "layoutSearchableViews");
  }
LABEL_9:
  if (!-[SBRootFolderView isLeadingCustomViewPageHidden](self, "isLeadingCustomViewPageHidden"))
  {
    v13 = ((v7 | v12) & 1) == 0
       && -[SBRootFolderView hidesOffscreenCustomPageViews](self, "hidesOffscreenCustomPageViews");
    -[_SBRootFolderLayoutWrapperView setHidden:](self->_searchableLeadingCustomWrapperView, "setHidden:", v13);
  }

}

- (void)setScrollingPageDotsVisibilityAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_scrollingPageDotsVisibilityAssertion, a3);
}

- (BSInvalidatable)scrollingPageDotsVisibilityAssertion
{
  return self->_scrollingPageDotsVisibilityAssertion;
}

- (CGPoint)_scrollOffsetForPageAtIndex:(int64_t)a3 pageWidth:(double)a4
{
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGPoint result;

  if (-[SBRootFolderView isPageIndexCustomAndRightmost:](self, "isPageIndexCustomAndRightmost:"))
  {
    v7 = -[SBRootFolderView dockEdge](self, "dockEdge");
    if (v7 == 2)
    {
      -[SBDockView dockHeight](self->_dockView, "dockHeight");
    }
    else
    {
      v8 = 0.0;
      if (v7 == 8)
      {
        -[SBDockView dockHeight](self->_dockView, "dockHeight", 0.0);
        v8 = -v9;
      }
    }
    v10 = 0.0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBRootFolderView;
    -[SBFolderView _scrollOffsetForPageAtIndex:pageWidth:](&v11, sel__scrollOffsetForPageAtIndex_pageWidth_, a3, a4);
  }
  result.y = v10;
  result.x = v8;
  return result;
}

- (BOOL)isPageIndexCustomAndRightmost:(int64_t)a3
{
  int64_t v5;
  int64_t v6;

  v5 = -[SBRootFolderView leadingCustomViewPageIndex](self, "leadingCustomViewPageIndex");
  if (-[SBFolderView isRTL](self, "isRTL"))
  {
    v6 = -[SBRootFolderView trailingCustomViewPageIndex](self, "trailingCustomViewPageIndex");
    return v6 == a3 && v6 != 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v5 == a3 && v5 != 0x7FFFFFFFFFFFFFFFLL)
    return 1;
  -[SBRootFolderView trailingCustomViewPageIndex](self, "trailingCustomViewPageIndex");
  return 0;
}

- (int64_t)leadingCustomViewPageIndex
{
  void *v3;

  if (-[SBRootFolderView isLeadingCustomViewPageHidden](self, "isLeadingCustomViewPageHidden"))
    return 0x7FFFFFFFFFFFFFFFLL;
  -[SBRootFolderView leadingCustomView](self, "leadingCustomView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return -[SBFolderView minimumPageIndex](self, "minimumPageIndex");
}

- (BOOL)isLeadingCustomViewPageHidden
{
  return self->_leadingCustomViewPageHidden;
}

- (int64_t)trailingCustomViewPageIndex
{
  void *v3;
  int64_t v4;

  -[SBRootFolderView trailingCustomView](self, "trailingCustomView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[SBFolderView maximumPageIndex](self, "maximumPageIndex");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (unint64_t)_trailingCustomPageCount
{
  unint64_t v3;
  void *v4;

  if (!-[SBFolderView iconListViewCount](self, "iconListViewCount")
    && -[SBFolderView automaticallyCreatesIconListViews](self, "automaticallyCreatesIconListViews"))
  {
    return 0;
  }
  -[SBRootFolderView trailingCustomView](self, "trailingCustomView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (unint64_t)_leadingCustomPageCount
{
  unint64_t result;
  void *v4;
  _BOOL4 v5;

  if (!-[SBFolderView iconListViewCount](self, "iconListViewCount")
    && -[SBFolderView automaticallyCreatesIconListViews](self, "automaticallyCreatesIconListViews"))
  {
    return 0;
  }
  -[SBRootFolderView leadingCustomView](self, "leadingCustomView");
  result = objc_claimAutoreleasedReturnValue();
  if (result)
  {
    v4 = (void *)result;
    v5 = -[SBRootFolderView isLeadingCustomViewPageHidden](self, "isLeadingCustomViewPageHidden");

    return !v5;
  }
  return result;
}

- (UIView)leadingCustomView
{
  return -[_SBRootFolderLayoutWrapperView wrappedView](self->_searchableLeadingCustomWrapperView, "wrappedView");
}

- (UIView)trailingCustomView
{
  return -[_SBRootFolderLayoutWrapperView wrappedView](self->_searchableTrailingCustomWrapperView, "wrappedView");
}

- (SBDockView)dockView
{
  return self->_dockView;
}

- (BOOL)isDockExternal
{
  return self->_dockExternal;
}

- (BOOL)_leadingCustomViewShouldBeIndicatedInPageControl
{
  void *v2;
  char v3;

  -[SBRootFolderView leadingCustomViewController](self, "leadingCustomViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "shouldBeIndicatedInPageControl");
  else
    v3 = 1;

  return v3;
}

- (void)_currentPageIndexDidChangeFromPageIndex:(int64_t)a3
{
  _OWORD v4[20];
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  -[SBFolderView _currentPageIndexDidChangeFromPageIndex:](&v6, sel__currentPageIndexDidChangeFromPageIndex_, a3);
  v5 = 0;
  memset(v4, 0, sizeof(v4));
  -[SBRootFolderView getMetrics:](self, "getMetrics:", v4);
  -[SBRootFolderView _animateViewsForScrollingToLeadingOrTrailingCustomViewWithMetrics:](self, "_animateViewsForScrollingToLeadingOrTrailingCustomViewWithMetrics:", v4);
  -[SBRootFolderView layoutSearchableViewsWithMetrics:](self, "layoutSearchableViewsWithMetrics:", v4);
}

- (void)layoutSearchableViewsWithMetrics:(const SBRootFolderViewMetrics *)a3
{
  id v5;

  -[SBRootFolderView _animateViewsForPullingToSearchWithMetrics:](self, "_animateViewsForPullingToSearchWithMetrics:");
  -[SBRootFolderView _animateViewsForScrollingToLeadingOrTrailingCustomViewWithMetrics:](self, "_animateViewsForScrollingToLeadingOrTrailingCustomViewWithMetrics:", a3);
  -[SBRootFolderView _layoutSubviewsForPulldownSearch](self, "_layoutSubviewsForPulldownSearch");
  -[SBRootFolderView _layoutSubviewsForLeadingCustomViewWithMetrics:](self, "_layoutSubviewsForLeadingCustomViewWithMetrics:", a3);
  -[SBRootFolderView _layoutSubviewsForTrailingCustomViewWithMetrics:](self, "_layoutSubviewsForTrailingCustomViewWithMetrics:", a3);
  -[SBRootFolderView _updateDockOffscreenFractionWithMetrics:](self, "_updateDockOffscreenFractionWithMetrics:", a3);
  if (!-[SBFolderView isRTL](self, "isRTL"))
  {
    -[SBFolderView scrollView](self, "scrollView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SBRootFolderView leadingCustomViewPageScrollOffset](self, "leadingCustomViewPageScrollOffset");
    objc_msgSend(v5, "_setFirstPageOffset:");

  }
}

- (void)getMetrics:(SBRootFolderViewMetrics *)a3
{
  -[SBRootFolderView getMetrics:dockEdge:](self, "getMetrics:dockEdge:", a3, -[SBRootFolderView dockEdge](self, "dockEdge"));
}

- (double)leadingCustomViewPageScrollOffset
{
  double result;

  -[SBFolderView _pageWidth](self, "_pageWidth");
  -[SBRootFolderView leadingCustomViewPageScrollOffsetUsingPageWidth:](self, "leadingCustomViewPageScrollOffsetUsingPageWidth:");
  return result;
}

- (double)leadingCustomViewPageScrollOffsetUsingPageWidth:(double)a3
{
  int64_t v5;
  double result;

  v5 = -[SBRootFolderView leadingCustomViewPageIndex](self, "leadingCustomViewPageIndex");
  result = 0.0;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    -[SBRootFolderView _scrollOffsetForPageAtIndex:pageWidth:](self, "_scrollOffsetForPageAtIndex:pageWidth:", v5, a3);
  return result;
}

- (void)_layoutSubviewsForTrailingCustomViewWithMetrics:(const SBRootFolderViewMetrics *)a3
{
  -[_SBRootFolderLayoutWrapperView setFrame:](self->_searchableTrailingCustomWrapperView, "setFrame:", a3->var9.origin.x, a3->var9.origin.y, a3->var9.size.width, a3->var9.size.height);
}

- (void)_layoutSubviewsForPulldownSearch
{
  SBSearchBackdropView *searchBackdropView;

  searchBackdropView = self->_searchBackdropView;
  -[SBRootFolderView _scaledBoundsForMinimumHomeScreenScale](self, "_scaledBoundsForMinimumHomeScreenScale");
  -[SBSearchBackdropView setFrame:](searchBackdropView, "setFrame:");
}

- (CGRect)_scaledBoundsForMinimumHomeScreenScale
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGAffineTransform v17;
  CGRect v18;
  CGRect result;

  -[SBRootFolderView _minimumHomeScreenScale](self, "_minimumHomeScreenScale");
  v4 = v3;
  -[SBRootFolderView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  UIRectGetCenter();
  CGAffineTransformMakeScale(&v17, 1.0 / v4, 1.0 / v4);
  v18.origin.x = v6;
  v18.origin.y = v8;
  v18.size.width = v10;
  v18.size.height = v12;
  CGRectApplyAffineTransform(v18, &v17);
  UIRectCenteredAboutPoint();
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (double)_minimumHomeScreenScale
{
  void *v3;
  double v4;
  double v5;

  -[SBFolderView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 1.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "minimumHomeScreenScaleForFolderView:", self);
    v4 = v5;
  }

  return v4;
}

- (void)_layoutSubviewsForLeadingCustomViewWithMetrics:(const SBRootFolderViewMetrics *)a3
{
  -[_SBRootFolderLayoutWrapperView setFrame:](self->_searchableLeadingCustomWrapperView, "setFrame:", a3->var8.origin.x, a3->var8.origin.y, a3->var8.size.width, a3->var8.size.height);
}

- (void)_animateViewsForPullingToSearchWithMetrics:(const SBRootFolderViewMetrics *)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double x;
  double y;
  double width;
  double height;
  void *v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _BOOL4 IsReduceMotionEnabled;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD aBlock[12];
  _BYTE __dst[328];
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  -[SBRootFolderView pullDownSearchVisibilityProgress](self, "pullDownSearchVisibilityProgress");
  v6 = v5;
  v7 = 0.0;
  if (-[SBRootFolderView isOnLeadingCustomPage](self, "isOnLeadingCustomPage"))
    v8 = 0.0;
  else
    v8 = v6;
  if (-[SBRootFolderView shiftsPullDownSearchForVisibility](self, "shiftsPullDownSearchForVisibility"))
    v9 = v6;
  else
    v9 = 1.0;
  -[SBRootFolderView searchPresenter](self, "searchPresenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRootFolderView bounds](self, "bounds");
  v52 = v12;
  v53 = v11;
  v51 = v13;
  v15 = v14;
  if (v6 > 0.0 || v8 > 0.0)
  {
    -[SBRootFolderView _spotlightFirstIconRowOffset](self, "_spotlightFirstIconRowOffset");
    v7 = v16;
  }
  v50 = v6;
  if (v10)
  {
    v17 = 0.0;
    v18 = v15;
    if (self->_pullToSearchTranslatesIcons != 0.0 && objc_msgSend(v10, "presentationState") == 1)
    {
      objc_msgSend(v10, "presentationOffset");
      v17 = v19;
    }
  }
  else
  {
    v18 = v15;
    v17 = v8 * v7;
  }
  v20 = v9 * v7;
  v21 = 0.0;
  if (v9 < 1.0)
    v21 = v7;
  v49 = v21;
  v56 = CGRectOffset(a3->var4, 0.0, v17);
  x = v56.origin.x;
  y = v56.origin.y;
  width = v56.size.width;
  height = v56.size.height;
  -[SBFolderView scrollView](self, "scrollView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "frame");
  v59.origin.x = v27;
  v59.origin.y = v28;
  v59.size.width = v29;
  v59.size.height = v30;
  v57.origin.x = x;
  v57.origin.y = y;
  v57.size.width = width;
  v57.size.height = height;
  if (!CGRectEqualToRect(v57, v59))
    objc_msgSend(v26, "setFrame:", x, y, width, height);
  v31 = v7 - v20;
  if (v10)
  {
    v32 = v18;
    if (self->_pullToSearchTranslatesIcons != 0.0)
    {
      memcpy(__dst, a3, sizeof(__dst));
      *(CGRect *)&__dst[192] = CGRectOffset(a3->var6, 0.0, v17);
      -[SBRootFolderView scrollAccessoryAuxiliaryView](self, "scrollAccessoryAuxiliaryView");
      v33 = objc_claimAutoreleasedReturnValue();
      if (!v33
        || (v34 = (void *)v33,
            IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled(),
            v34,
            IsReduceMotionEnabled))
      {
        v58 = CGRectOffset(a3->var5, 0.0, v17);
        v36 = v58.origin.x;
        v37 = v58.origin.y;
        v38 = v58.size.width;
        v39 = v58.size.height;
        *(CGRect *)&__dst[160] = v58;
        -[SBRootFolderView scrollAccessoryView](self, "scrollAccessoryView");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "sbf_setBoundsAndPositionFromFrame:", v36, v37, v38, v39);

      }
      -[SBRootFolderView layoutDockViewWithMetrics:](self, "layoutDockViewWithMetrics:", __dst, *(_QWORD *)&v49);
    }
    v41 = 0;
    v43 = v52;
    v42 = v53;
    v44 = v51;
  }
  else
  {
    -[SBRootFolderView _window](self, "_window");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v45, "isRotating") ^ 1;

    v43 = v52;
    v42 = v53;
    v44 = v51;
    v32 = v18;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__SBRootFolderView__animateViewsForPullingToSearchWithMetrics___block_invoke;
  aBlock[3] = &unk_1E8D87750;
  aBlock[4] = self;
  aBlock[5] = v42;
  aBlock[6] = v43;
  aBlock[7] = v44;
  aBlock[8] = v32;
  *(double *)&aBlock[9] = v31;
  aBlock[10] = 0;
  *(double *)&aBlock[11] = v49;
  v46 = _Block_copy(aBlock);
  v47 = v46;
  if (v41)
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v46);
  else
    (*((void (**)(void *))v46 + 2))(v46);
  -[SBRootFolderView pullDownSearchView](self, "pullDownSearchView", *(_QWORD *)&v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setAlpha:", fmin(fmax((v50 - self->_pullToSearchFadeInThreshold)/ (self->_pullToSearchActivationThreshold - self->_pullToSearchFadeInThreshold)+ 0.0, 0.0), 1.0));

}

uint64_t __63__SBRootFolderView__animateViewsForPullingToSearchWithMetrics___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 904), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 904), "setHeaderOffset:", *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 904), "setExtendedSize:", *(double *)(a1 + 80), *(double *)(a1 + 88));
}

- (BOOL)shiftsPullDownSearchForVisibility
{
  return self->_shiftsPullDownSearchForVisibility;
}

- (SBHSearchPresenting)searchPresenter
{
  return self->_searchPresenter;
}

- (double)pullDownSearchVisibilityProgress
{
  return self->_pullDownSearchVisibilityProgress;
}

- (UIView)pullDownSearchView
{
  return -[_SBRootFolderLayoutWrapperView wrappedView](self->_searchPulldownWrapperView, "wrappedView");
}

- (double)internalDockPageControlVerticalMargin
{
  double v3;
  void *v4;
  double v5;
  void *v6;
  double v7;

  v3 = 0.0;
  if (-[SBRootFolderView scrollViewHeightIncludesPageControlAndDock](self, "scrollViewHeightIncludesPageControlAndDock"))
  {
    -[SBRootFolderView rootFolderVisualConfiguration](self, "rootFolderVisualConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pageControlVerticalOffset");
    v3 = v5;
    -[SBRootFolderView scrollAccessoryAuxiliaryView](self, "scrollAccessoryAuxiliaryView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView");
      v3 = v3 + v7;
    }

  }
  return v3;
}

- (UIView)scrollAccessoryAuxiliaryView
{
  return self->_scrollAccessoryAuxiliaryView;
}

- (id)iconListViewForIconListModelIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  -[SBRootFolderView iconListViewForExtraIndex:](self, "iconListViewForExtraIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBRootFolderView;
    -[SBFolderView iconListViewForIconListModelIndex:](&v10, sel_iconListViewForIconListModelIndex_, a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)_updateScrollingState:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (!a3)
  {
    -[SBRootFolderView setScrollingAdjustment:](self, "setScrollingAdjustment:", 0.0);
    -[SBRootFolderView setAllowsFreeScrollingUntilScrollingEnds:](self, "setAllowsFreeScrollingUntilScrollingEnds:", 0);
    -[SBRootFolderView _cleanupAfterExtraScrollGesturesCompleted](self, "_cleanupAfterExtraScrollGesturesCompleted");
  }
  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderView;
  -[SBFolderView _updateScrollingState:](&v5, sel__updateScrollingState_, v3);
  -[SBRootFolderView leadingCustomViewVisibilityProgress](self, "leadingCustomViewVisibilityProgress");
  if (BSFloatIsOne())
    -[SBRootFolderView _captureInitialSearchScrollTrackingState](self, "_captureInitialSearchScrollTrackingState");
}

- (void)getMetrics:(SBRootFolderViewMetrics *)a3 dockEdge:(unint64_t)a4
{
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  void *v15;
  double Width;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRectEdge v26;
  unsigned int v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat rect;
  CGFloat v40;
  CGRect v41;
  CGRect slice;
  CGRect v43;
  CGRect v44;
  CGRect remainder;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  a3->var10.size.height = 0.0;
  *(_OWORD *)&a3->var9.size.height = 0u;
  *(_OWORD *)&a3->var10.origin.y = 0u;
  *(_OWORD *)&a3->var8.size.height = 0u;
  *(_OWORD *)&a3->var9.origin.y = 0u;
  *(_OWORD *)&a3->var7 = 0u;
  *(_OWORD *)&a3->var8.origin.y = 0u;
  a3->var6.origin = 0u;
  a3->var6.size = 0u;
  a3->var5.origin = 0u;
  a3->var5.size = 0u;
  a3->var4.origin = 0u;
  a3->var4.size = 0u;
  a3->var3.origin = 0u;
  a3->var3.size = 0u;
  a3->var2.origin = 0u;
  a3->var2.size = 0u;
  a3->var1.origin = 0u;
  a3->var1.size = 0u;
  a3->var0.origin = 0u;
  a3->var0.size = 0u;
  -[SBRootFolderView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[SBRootFolderView safeAreaInsets](self, "safeAreaInsets");
  -[SBRootFolderView traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayScale");

  remainder.origin.x = v8;
  remainder.origin.y = v10;
  remainder.size.width = v12;
  remainder.size.height = v14;
  v44.origin.x = v8;
  v44.origin.y = v10;
  v44.size.width = v12;
  v44.size.height = v14;
  v43.origin.x = v8;
  v43.origin.y = v10;
  v43.size.width = v12;
  v43.size.height = v14;
  v46.origin.x = v8;
  v46.origin.y = v10;
  v46.size.width = v12;
  v46.size.height = v14;
  Width = CGRectGetWidth(v46);
  v47.origin.x = v8;
  v47.origin.y = v10;
  v40 = v12;
  v47.size.width = v12;
  v47.size.height = v14;
  if (Width < CGRectGetHeight(v47))
  {
    v48.origin.x = v8;
    v48.origin.y = v10;
    v48.size.width = v12;
    v48.size.height = v14;
    v17 = CGRectGetWidth(v48);
    v49.origin.x = v8;
    v49.origin.y = v10;
    v49.size.width = v12;
    v49.size.height = v14;
    v43.size.width = CGRectGetHeight(v49);
    v43.size.height = v17;
  }
  -[SBRootFolderView leadingCustomViewVisibilityProgress](self, "leadingCustomViewVisibilityProgress");
  v19 = v18;
  -[SBRootFolderView trailingCustomViewVisibilityProgress](self, "trailingCustomViewVisibilityProgress");
  v21 = v20;
  -[SBRootFolderView rootFolderVisualConfiguration](self, "rootFolderVisualConfiguration");
  objc_claimAutoreleasedReturnValue();
  -[SBFolderView gridSizeClassDomain](self, "gridSizeClassDomain");
  objc_claimAutoreleasedReturnValue();
  -[SBRootFolderView dockHeight](self, "dockHeight");
  v23 = v22;
  -[SBRootFolderView currentDockOffscreenFraction](self, "currentDockOffscreenFraction");
  v25 = v24;
  v26 = CGRectMinYEdge;
  rect = v14;
  v27 = 2u;
  switch(a4)
  {
    case 0uLL:
    case 4uLL:
      goto LABEL_17;
    case 1uLL:
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_18;
    case 2uLL:
      v27 = 0u;
      goto LABEL_5;
    case 8uLL:
LABEL_5:
      -[SBRootFolderView isDockExternal](self, "isDockExternal");
      -[SBFolderView isRTL](self, "isRTL");
      v28 = 1.0;
      if (v25 > 0.0)
        v28 = 1.0 - v25;
      v29 = v23 * v28;
      if (v19 >= v21)
        v30 = v19;
      else
        v30 = v21;
      v50.origin.x = v8;
      v50.origin.y = v10;
      v50.size.width = v40;
      v50.size.height = rect;
      v31 = v30 * (CGRectGetWidth(v50) - v23);
      v14 = rect;
      v32 = fmax(v23 - v31, 0.0);
      if (v23 <= v32)
        v32 = v23;
      if (v29 <= v32)
        v33 = v29;
      else
        v33 = v32;
      v26 = v27;
      break;
    default:
      if (a4 == 15)
LABEL_17:
        v26 = CGRectMaxYEdge;
LABEL_18:
      -[SBRootFolderView isDockExternal](self, "isDockExternal");
      -[SBFolderView isRTL](self, "isRTL");
      v34 = 1.0;
      if (v25 > 0.0)
        v34 = 1.0 - v25;
      v33 = v23 * v34;
      break;
  }
  if (v33 >= 0.0)
  {
    v35 = v14;
  }
  else
  {
    v35 = v14 - v33;
    remainder.size.height = v14 - v33;
    v33 = 0.0;
  }
  v36 = v8;
  v37 = v10;
  v38 = v40;
  CGRectDivide(*(CGRect *)(&v35 - 3), &a3->var6, &remainder, v33, v26);
  memset(&slice, 0, sizeof(slice));
  CGRectDivide(v44, &slice, &v44, v23, v26);
  memset(&v41, 0, sizeof(v41));
  CGRectDivide(v43, &v41, &v43, v23, v26);
  CGRectGetWidth(v44);
  __asm { BR              X10 ; loc_1CFF20678 loc_1CFF20680 }
}

- (void)_animateViewsForScrollingToLeadingOrTrailingCustomViewWithMetrics:(const SBRootFolderViewMetrics *)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  _BOOL4 v12;
  double v13;
  _BOOL4 v14;
  double v15;
  SBHMinusPageStepper *customPageAnimationStepper;
  double v17;
  double v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  -[SBRootFolderView leadingCustomViewVisibilityProgress](self, "leadingCustomViewVisibilityProgress");
  v6 = v5;
  -[SBRootFolderView trailingCustomViewVisibilityProgress](self, "trailingCustomViewVisibilityProgress");
  v8 = v7;
  if (v7 <= 0.0)
    v7 = v6;
  -[SBFSteppedAnimationTimingFunctionCalculator setPercentComplete:](self->_customPageAnimationStepper, "setPercentComplete:", v7);
  -[SBHMinusPageStepper backgroundBlurAlpha](self->_customPageAnimationStepper, "backgroundBlurAlpha");
  v10 = v9;
  v11 = -[SBRootFolderView dockEdge](self, "dockEdge");
  -[SBRootFolderView dockView](self, "dockView");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v12 = -[SBRootFolderView shouldFadeDockOutDuringTransitionToLeadingCustomView](self, "shouldFadeDockOutDuringTransitionToLeadingCustomView");
  v13 = 1.0;
  if (v12 && v11 <= 0xF && ((1 << v11) & 0x8011) != 0)
    v13 = 1.0 - v10;
  objc_msgSend(v23, "setBackgroundAlpha:", v13);
  if (!-[SBRootFolderView isScrollAccessoryBorrowed](self, "isScrollAccessoryBorrowed"))
  {
    v14 = -[SBRootFolderView shouldFadePageControlOutDuringTransitionToLeadingCustomView](self, "shouldFadePageControlOutDuringTransitionToLeadingCustomView");
    v15 = 1.0;
    if (v14)
    {
      customPageAnimationStepper = self->_customPageAnimationStepper;
      if (customPageAnimationStepper)
        -[SBHMinusPageStepper pageControlAlpha](customPageAnimationStepper, "pageControlAlpha", 1.0);
    }
    -[SBRootFolderView setPageControlAlpha:](self, "setPageControlAlpha:", v15);
  }
  -[SBSearchBackdropView setHidden:](self->_trailingCustomBackdropView, "setHidden:", BSFloatIsZero());
  -[UIView setAlpha:](self->_trailingCustomSearchDimmingView, "setAlpha:", v8);
  -[SBRootFolderView layoutDockViewWithMetrics:](self, "layoutDockViewWithMetrics:", a3);
  -[SBRootFolderView leadingCustomViewVisibilityProgress](self, "leadingCustomViewVisibilityProgress");
  v19 = v17 > 0.0
     && (-[SBRootFolderView leadingCustomViewVisibilityProgress](self, "leadingCustomViewVisibilityProgress"), v18 != 1.0)
     && -[SBRootFolderView _leadingCustomViewShouldShowDoneButtonWhenEditing](self, "_leadingCustomViewShouldShowDoneButtonWhenEditing");
  if (!-[SBRootFolderView isPageManagementUIVisible](self, "isPageManagementUIVisible") && !v19)
  {
    -[SBRootFolderView doneButton](self, "doneButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sbf_setBoundsAndPositionFromFrame:", a3->var1.origin.x, a3->var1.origin.y, a3->var1.size.width, a3->var1.size.height);

    -[SBRootFolderView widgetButton](self, "widgetButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sbf_setBoundsAndPositionFromFrame:", a3->var2.origin.x, a3->var2.origin.y, a3->var2.size.width, a3->var2.size.height);

  }
  -[SBRootFolderView layoutPageControlWithMetrics:](self, "layoutPageControlWithMetrics:", a3);
  -[UILabel sbf_setBoundsAndPositionFromFrame:](self->_idleTextView, "sbf_setBoundsAndPositionFromFrame:", a3->var3.origin.x, a3->var3.origin.y, a3->var3.size.width, a3->var3.size.height);
  -[SBFolderView headerView](self, "headerView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sbf_setBoundsAndPositionFromFrame:", a3->var0.origin.x, a3->var0.origin.y, a3->var0.size.width, a3->var0.size.height);

}

- (double)leadingCustomViewVisibilityProgress
{
  return self->_leadingCustomViewVisibilityProgress;
}

- (BOOL)isScrollAccessoryBorrowed
{
  void *v2;
  BOOL v3;

  -[SBRootFolderView scrollAccessoryBorrowedAssertion](self, "scrollAccessoryBorrowedAssertion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (_SBRootFolderViewElementBorrowedAssertion)scrollAccessoryBorrowedAssertion
{
  return self->_scrollAccessoryBorrowedAssertion;
}

- (BOOL)shouldFadeDockOutDuringTransitionToLeadingCustomView
{
  void *v3;
  BOOL v4;

  -[SBRootFolderView dockView](self, "dockView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "isDockInset") & 1) == 0 && (-[SBRootFolderView dockEdge](self, "dockEdge") & 0xA) == 0;

  return v4;
}

- (BOOL)isPageManagementUIVisible
{
  void *v2;
  void *v3;
  char isKindOfClass;

  -[SBRootFolderView specialLayoutManager](self, "specialLayoutManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (SBRootFolderViewLayoutManager)specialLayoutManager
{
  return self->_specialLayoutManager;
}

- (double)trailingCustomViewVisibilityProgress
{
  return self->_trailingCustomViewVisibilityProgress;
}

- (SBTitledHomeScreenButton)widgetButton
{
  return self->_widgetButton;
}

- (SBTitledHomeScreenButton)doneButton
{
  return self->_doneButton;
}

- (void)layoutPageControlWithMetrics:(const SBRootFolderViewMetrics *)a3
{
  void *v5;
  void *v6;
  char v7;
  char v8;
  _BOOL4 v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD aBlock[4];
  id v15;
  id v16;
  const SBRootFolderViewMetrics *v17;

  if (!-[SBRootFolderView isScrollAccessoryBorrowed](self, "isScrollAccessoryBorrowed"))
  {
    -[SBRootFolderView scrollAccessoryView](self, "scrollAccessoryView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolderView pageControl](self, "pageControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(MEMORY[0x1E0DC3F10], "_isInRetargetableAnimationBlock");
    v8 = objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock");
    v9 = -[SBRootFolderView isModifyingDockOffscreenFraction](self, "isModifyingDockOffscreenFraction");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__SBRootFolderView_layoutPageControlWithMetrics___block_invoke;
    aBlock[3] = &unk_1E8D865D8;
    v10 = v5;
    v15 = v10;
    v17 = a3;
    v11 = v6;
    v16 = v11;
    v12 = _Block_copy(aBlock);
    v13 = v12;
    if (!v9 || (v7 & 1) != 0 || (v8 & 1) != 0)
      (*((void (**)(void *))v12 + 2))(v12);
    else
      objc_msgSend(MEMORY[0x1E0DC3F10], "_performWithoutRetargetingAnimations:", v12);

  }
}

- (void)layoutDockViewWithMetrics:(const SBRootFolderViewMetrics *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  CGRect *p_var6;
  CGSize size;
  double v12;
  char v13;
  char v14;
  _BOOL4 v15;
  char IsZero;
  id v17;
  void *v18;
  void *v19;
  _QWORD aBlock[4];
  id v21;
  id v22;
  CGPoint v23;
  CGSize v24;
  const SBRootFolderViewMetrics *v25;
  double v26;
  char v27;
  CGPoint origin;
  CGSize v29;
  CGRect v30;

  if (!-[SBRootFolderView isDockViewBorrowed](self, "isDockViewBorrowed"))
  {
    -[SBRootFolderView dockView](self, "dockView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[SBRootFolderView dockListView](self, "dockListView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolderView listLayoutProvider](self, "listLayoutProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "layoutForIconLocation:", CFSTR("SBIconLocationDock"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = -[SBRootFolderView isDockExternal](self, "isDockExternal");
      p_var6 = &a3->var6;
      if (v9)
        p_var6 = (CGRect *)MEMORY[0x1E0C9D648];
      size = p_var6->size;
      origin = p_var6->origin;
      v29 = size;
      v12 = SBHIconListLayoutListIconSpacingWithDefault(v8, 1, 20.0);
      v13 = objc_msgSend(MEMORY[0x1E0DC3F10], "_isInRetargetableAnimationBlock");
      v14 = objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock");
      v15 = -[SBRootFolderView isModifyingDockOffscreenFraction](self, "isModifyingDockOffscreenFraction");
      objc_msgSend(v5, "frame");
      CGRectGetWidth(v30);
      IsZero = BSFloatIsZero();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __46__SBRootFolderView_layoutDockViewWithMetrics___block_invoke;
      aBlock[3] = &unk_1E8D87610;
      v21 = v5;
      v23 = origin;
      v24 = v29;
      v25 = a3;
      v17 = v6;
      v22 = v17;
      v26 = v12;
      v27 = IsZero;
      v18 = _Block_copy(aBlock);
      v19 = v18;
      if (!v15 || (v13 & 1) != 0 || (v14 & 1) != 0)
        (*((void (**)(void *))v18 + 2))(v18);
      else
        objc_msgSend(MEMORY[0x1E0DC3F10], "_performWithoutRetargetingAnimations:", v18);

    }
  }
}

- (BOOL)isModifyingDockOffscreenFraction
{
  return -[NSHashTable count](self->_dockOffscreenProgressSettingClients, "count") != 0;
}

- (BOOL)isDockViewBorrowed
{
  void *v2;
  BOOL v3;

  -[SBRootFolderView dockBorrowedAssertion](self, "dockBorrowedAssertion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (_SBRootFolderViewElementBorrowedAssertion)dockBorrowedAssertion
{
  return self->_dockBorrowedAssertion;
}

uint64_t __46__SBRootFolderView_layoutDockViewWithMetrics___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "sbf_setBoundsAndPositionFromFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setDockListOffset:", *(double *)(*(_QWORD *)(a1 + 80) + 224));
  objc_msgSend(*(id *)(a1 + 40), "setIconSpacing:", *(double *)(a1 + 88), *(double *)(a1 + 88));
  result = objc_msgSend(*(id *)(a1 + 40), "layoutIconsIfNeeded");
  if (*(_BYTE *)(a1 + 96))
    return objc_msgSend(*(id *)(a1 + 32), "updateAccessibilityTintColor");
  return result;
}

- (SBDockIconListView)dockListView
{
  return self->_dockListView;
}

void __49__SBRootFolderView_layoutPageControlWithMetrics___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sbf_setBoundsAndPositionFromFrame:", *(double *)(*(_QWORD *)(a1 + 48) + 160), *(double *)(*(_QWORD *)(a1 + 48) + 168), *(double *)(*(_QWORD *)(a1 + 48) + 176), *(double *)(*(_QWORD *)(a1 + 48) + 184));
  v2 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", *(double *)(*(_QWORD *)(a1 + 48) + 296), *(double *)(*(_QWORD *)(a1 + 48) + 304), *(double *)(*(_QWORD *)(a1 + 48) + 312), *(double *)(*(_QWORD *)(a1 + 48) + 320));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTouchIgnoreRects:", v4);

}

- (void)setPageControlAlpha:(double)a3
{
  id v5;

  if (!-[SBRootFolderView isScrollAccessoryBorrowed](self, "isScrollAccessoryBorrowed"))
  {
    -[SBRootFolderView scrollAccessoryView](self, "scrollAccessoryView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", a3);

  }
}

- (SBFolderScrollAccessoryView)scrollAccessoryView
{
  return self->_scrollAccessoryView;
}

- (SBHRootFolderVisualConfiguration)rootFolderVisualConfiguration
{
  void *v2;
  SBHRootFolderVisualConfiguration *v3;
  SBHRootFolderVisualConfiguration *v4;

  -[SBRootFolderView rootListLayout](self, "rootListLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "rootFolderVisualConfiguration");
    v3 = (SBHRootFolderVisualConfiguration *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_alloc_init(SBHRootFolderVisualConfiguration);
  }
  v4 = v3;

  return v4;
}

- (id)rootListLayout
{
  void *v3;
  void *v4;
  void *v5;

  -[SBFolderView listLayoutProvider](self, "listLayoutProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderView iconLocation](self, "iconLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutForIconLocation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)scrollViewHeightIncludesPageControlAndDock
{
  void *v3;

  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SBRootFolderView isMemberOfClass:](self, "isMemberOfClass:", v3);

  return (char)self;
}

- (double)dockHeight
{
  void *v3;
  double v4;
  double v5;
  double result;

  if (-[SBRootFolderView isDockExternal](self, "isDockExternal"))
  {
    -[SBFolderView delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0.0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "externalDockHeightForRootFolderView:", self);
      v4 = v5;
    }

    return v4;
  }
  else
  {
    -[SBDockView dockHeight](self->_dockView, "dockHeight");
  }
  return result;
}

- (BOOL)isDockVisible
{
  double v3;
  double v4;
  double v5;

  -[SBRootFolderView currentDockOffscreenFraction](self, "currentDockOffscreenFraction");
  if (v3 >= 1.0)
    return 0;
  -[SBRootFolderView leadingCustomViewVisibilityProgress](self, "leadingCustomViewVisibilityProgress");
  if (v4 >= 1.0)
    return 0;
  -[SBRootFolderView trailingCustomViewVisibilityProgress](self, "trailingCustomViewVisibilityProgress");
  return v5 < 1.0;
}

- (double)currentDockOffscreenFraction
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  double result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_dockOffscreenProgressSettingClients;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = -1.79769313e308;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "desiredOffscreenFraction", (_QWORD)v10);
        if (v8 > v6)
          v6 = v8;
      }
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = -1.79769313e308;
  }

  result = 0.0;
  if (v6 != -1.79769313e308)
    return v6;
  return result;
}

- (BOOL)shouldScrollPageControlDuringTransitionToLeadingCustomView
{
  return 1;
}

- (BOOL)shouldScrollDockDuringTransitionToLeadingCustomView
{
  return 1;
}

- (void)updateIconListIndexAndVisibility:(BOOL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderView;
  -[SBFolderView updateIconListIndexAndVisibility:](&v5, sel_updateIconListIndexAndVisibility_);
  if (self->_scrollToSearchIsDraggingOrAnimating
    || a3
    || (-[SBRootFolderView leadingCustomViewVisibilityProgress](self, "leadingCustomViewVisibilityProgress"),
        (BSFloatIsZero() & 1) == 0))
  {
    -[SBRootFolderView _updateIconListIndexSearchableAndLeadingCustomViewsWithLayout:](self, "_updateIconListIndexSearchableAndLeadingCustomViewsWithLayout:", 1);
  }
}

+ (void)_editButtonLayoutFramesInBounds:(CGRect)a3 forVisualConfiguration:(id)a4 withTranslationOffset:(double)a5 inRTL:(BOOL)a6 doneButton:(id)a7 addWidgetButton:(id)a8 doneButtonFrame:(CGRect *)a9 addWidgetButtonFrame:(CGRect *)a10
{
  _BOOL8 v14;
  double height;
  double width;
  double y;
  double x;
  id v22;
  id v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  CGPoint *v30;
  CGPoint *v31;
  CGSize v32;
  CGSize v33;
  CGPoint v34;
  CGSize v35;
  CGPoint v36;
  CGSize v37;

  v14 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v36 = (CGPoint)0;
  v22 = a7;
  v23 = a4;
  objc_msgSend(a8, "sizeThatFits:", width, height);
  v37.width = v24;
  v37.height = v25;
  v34 = (CGPoint)0;
  objc_msgSend(v22, "sizeThatFits:", width, height);
  v27 = v26;
  v29 = v28;

  v35.width = v27;
  v35.height = v29;
  if (a7)
    v30 = &v36;
  else
    v30 = 0;
  if (a7)
    v31 = &v34;
  else
    v31 = &v36;
  objc_msgSend(a1, "_getTopLeadingButtonFrame:topTrailingButtonFrame:inBounds:forVisualConfiguration:includingContentEdgeInsets:withTranslationOffset:inRTL:", v30, v31, v23, 1, v14, x, y, width, height, a5);

  if (a9)
  {
    v32 = v35;
    a9->origin = v34;
    a9->size = v32;
  }
  if (a10)
  {
    v33 = v37;
    a10->origin = v36;
    a10->size = v33;
  }
}

+ (void)_getTopLeadingButtonFrame:(CGRect *)a3 topTrailingButtonFrame:(CGRect *)a4 inBounds:(CGRect)a5 forVisualConfiguration:(id)a6 includingContentEdgeInsets:(BOOL)a7 withTranslationOffset:(double)a8 inRTL:(BOOL)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  void *v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double y;
  CGFloat MinX;
  BOOL v40;
  CGRect *v41;
  CGRect *v42;
  double MaxX;
  CGFloat Width;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  double v53;
  id v56;

  v9 = a9;
  v10 = a7;
  v13 = a6;
  v56 = v13;
  if (v10)
  {
    objc_msgSend(v13, "editModeButtonContentEdgeInsets");
    SBHDirectionalEdgeInsetsGetEdgeInsets();
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
  }
  else
  {
    v15 = *MEMORY[0x1E0DC49E8];
    v17 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v19 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v21 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  v22 = SBHEdgeInsetsInvert(v15);
  v24 = v23;
  v52 = v26;
  v53 = v25;
  objc_msgSend(v56, "editModeButtonLayoutOffset");
  v28 = v27;
  v30 = v29;
  if (a3)
  {
    v31 = v15 + a3->origin.y;
    v32 = a3->size.width - (v21 + v17);
    v33 = a3->size.height - (v19 + v15);
    a3->origin.x = v17 + a3->origin.x;
    a3->origin.y = v31;
    a3->size.width = v32;
    a3->size.height = v33;
    a3->origin.y = v30 + CGRectGetMinY(a5);
  }
  v34 = v56;
  if (a4)
  {
    v35 = v15 + a4->origin.y;
    v36 = a4->size.width - (v21 + v17);
    v37 = a4->size.height - (v19 + v15);
    a4->origin.x = v17 + a4->origin.x;
    a4->origin.y = v35;
    a4->size.width = v36;
    a4->size.height = v37;
    if (a3)
    {
      y = a3->origin.y;
    }
    else
    {
      MinX = CGRectGetMinX(a5);
      v34 = v56;
      y = v30 + MinX;
    }
    a4->origin.y = y;
  }
  v40 = !v9;
  if (v9)
    v41 = a4;
  else
    v41 = a3;
  if (v40)
    v42 = a4;
  else
    v42 = a3;
  if (v42)
  {
    MaxX = CGRectGetMaxX(a5);
    Width = CGRectGetWidth(*v42);
    v34 = v56;
    v42->origin.x = MaxX - Width - v28 + a8;
  }
  if (v41)
  {
    v45 = CGRectGetMinX(a5);
    v34 = v56;
    v41->origin.x = v28 + v45 + a8;
  }
  if (a3)
  {
    v46 = v22 + a3->origin.y;
    v47 = a3->size.width - (v24 + v52);
    v48 = a3->size.height - (v22 + v53);
    a3->origin.x = v24 + a3->origin.x;
    a3->origin.y = v46;
    a3->size.width = v47;
    a3->size.height = v48;
  }
  if (a4)
  {
    v49 = v22 + a4->origin.y;
    v50 = a4->size.width - (v24 + v52);
    v51 = a4->size.height - (v22 + v53);
    a4->origin.x = v24 + a4->origin.x;
    a4->origin.y = v49;
    a4->size.width = v50;
    a4->size.height = v51;
  }

}

- (void)setScrollingAdjustment:(double)a3
{
  self->_scrollingAdjustment = a3;
}

- (void)layoutIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4
{
  _BOOL4 v4;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)SBRootFolderView;
  -[SBFolderView layoutIconListsWithAnimationType:forceRelayout:](&v7, sel_layoutIconListsWithAnimationType_forceRelayout_);
  if (v4)
    -[SBIconListView setIconsNeedLayout](self->_dockListView, "setIconsNeedLayout");
  -[SBIconListView layoutIconsIfNeededWithAnimationType:options:](self->_dockListView, "layoutIconsIfNeededWithAnimationType:options:", a3, 0);
}

- (void)_willScrollToPageIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  -[SBFolderView _willScrollToPageIndex:animated:](&v6, sel__willScrollToPageIndex_animated_, a3);
  -[SBRootFolderView setAllowsFreeScrollingUntilScrollingEnds:](self, "setAllowsFreeScrollingUntilScrollingEnds:", 1);
  if (v4 && !-[SBFolderView isScrolling](self, "isScrolling"))
    -[SBRootFolderView _captureInitialSearchScrollTrackingState](self, "_captureInitialSearchScrollTrackingState");
}

- (void)setAllowsFreeScrollingUntilScrollingEnds:(BOOL)a3
{
  self->_allowsFreeScrollingUntilScrollingEnds = a3;
}

- (void)_cleanupAfterExtraScrollGesturesCompleted
{
  void *v3;
  id v4;

  -[SBFolderView scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "panGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[SBRootFolderView _cleanUpAfterOverscrollScrollGestureEnded:](self, "_cleanUpAfterOverscrollScrollGestureEnded:", v4);
}

- (void)_cleanUpAfterOverscrollScrollGestureEnded:(id)a3
{
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  v4 = -[SBRootFolderView userAttemptedToOverscrollFirstPageDuringCurrentGesture](self, "userAttemptedToOverscrollFirstPageDuringCurrentGesture");
  v5 = -[SBRootFolderView userAttemptedToOverscrollLastPageDuringCurrentGesture](self, "userAttemptedToOverscrollLastPageDuringCurrentGesture");
  v6 = v5;
  if (v4 || v5)
  {
    -[SBFolderView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "velocityInView:", self);
    -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:");
    v9 = v8;
    objc_msgSend(v12, "translationInView:", self);
    -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:");
    v11 = v10;
    if (v4)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "rootFolderView:didEndOverscrollOnFirstPageWithVelocity:translation:", self, v9, v11);
      -[SBRootFolderView setUserAttemptedToOverscrollFirstPageDuringCurrentGesture:](self, "setUserAttemptedToOverscrollFirstPageDuringCurrentGesture:", 0);
    }
    if (v6)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "rootFolderView:didEndOverscrollOnLastPageWithVelocity:translation:", self, v9, v11);
      -[SBRootFolderView setUserAttemptedToOverscrollLastPageDuringCurrentGesture:](self, "setUserAttemptedToOverscrollLastPageDuringCurrentGesture:", 0);
    }

  }
  self->_lastEventWasAttemptingToOverscrollFirstPage = 0;
  self->_lastEventWasAttemptingToOverscrollLastPage = 0;

}

- (BOOL)userAttemptedToOverscrollLastPageDuringCurrentGesture
{
  return self->_userAttemptedToOverscrollLastPageDuringCurrentGesture;
}

- (BOOL)userAttemptedToOverscrollFirstPageDuringCurrentGesture
{
  return self->_userAttemptedToOverscrollFirstPageDuringCurrentGesture;
}

- (void)setLeadingCustomViewBouncing:(BOOL)a3
{
  if (self->_leadingCustomViewBouncing != a3)
  {
    self->_leadingCustomViewBouncing = a3;
    -[SBRootFolderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updatePageControlNumberOfPages
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  -[SBFolderView pageControl](self, "pageControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfPages");
  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  -[SBFolderView _updatePageControlNumberOfPages](&v6, sel__updatePageControlNumberOfPages);
  if (v4 != objc_msgSend(v3, "numberOfPages"))
  {
    -[SBRootFolderView scrollAccessoryAuxiliaryView](self, "scrollAccessoryAuxiliaryView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[SBRootFolderView _forceLayoutPageControl](self, "_forceLayoutPageControl");
    -[SBRootFolderView _applyPageDotsVisibilityAssertions](self, "_applyPageDotsVisibilityAssertions");
  }

}

- (int64_t)_pageCountForPageControl
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  int64_t v6;

  if (-[SBRootFolderView _leadingCustomViewShouldBeIndicatedInPageControl](self, "_leadingCustomViewShouldBeIndicatedInPageControl"))
  {
    v3 = -[SBRootFolderView _leadingCustomPageCount](self, "_leadingCustomPageCount");
  }
  else
  {
    v3 = 0;
  }
  if (-[SBRootFolderView _trailingCustomViewShouldBeIndicatedInPageControl](self, "_trailingCustomViewShouldBeIndicatedInPageControl"))
  {
    v4 = -[SBRootFolderView _trailingCustomPageCount](self, "_trailingCustomPageCount");
  }
  else
  {
    v4 = 0;
  }
  -[SBFolderView folder](self, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 + v3 + objc_msgSend(v5, "visibleListCount");

  return v6;
}

- (BOOL)_trailingCustomViewShouldBeIndicatedInPageControl
{
  void *v2;
  char v3;

  -[SBRootFolderView trailingCustomViewController](self, "trailingCustomViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "shouldBeIndicatedInPageControl");
  else
    v3 = 1;

  return v3;
}

- (SBHRootFolderCustomViewPresenting)trailingCustomViewController
{
  return self->_trailingCustomViewController;
}

- (void)_layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = 0;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  -[SBRootFolderView getMetrics:](self, "getMetrics:", &v6);
  -[SBFolderView headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFrame:", v6, v7);

  if (!-[SBFolderView isScalingViewBorrowed](self, "isScalingViewBorrowed"))
    -[SBRootFolderView layoutSearchableViewsWithMetrics:](self, "layoutSearchableViewsWithMetrics:", &v6);
  if (!-[SBRootFolderView isDockViewBorrowed](self, "isDockViewBorrowed"))
    -[SBRootFolderView layoutDockViewWithMetrics:](self, "layoutDockViewWithMetrics:", &v6);
  if (-[SBRootFolderView isLeadingCustomViewBouncing](self, "isLeadingCustomViewBouncing"))
  {
    -[SBRootFolderView _adjustLeadingCustomContentForEdgeBounce](self, "_adjustLeadingCustomContentForEdgeBounce");
    -[SBRootFolderView setLeadingCustomViewBouncing:](self, "setLeadingCustomViewBouncing:", 0);
  }
  -[SBRootFolderView searchGesture](self, "searchGesture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateForRotation");

  -[SBRootFolderView searchPresentableView](self, "searchPresentableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRootFolderView bounds](self, "bounds");
  objc_msgSend(v5, "setFrame:");

}

- (UIView)searchPresentableView
{
  return self->_searchPresentableView;
}

- (SBSearchGesture)searchGesture
{
  return self->_searchGesture;
}

- (BOOL)isLeadingCustomViewBouncing
{
  return self->_leadingCustomViewBouncing;
}

+ (NSString)dockIconLocation
{
  return (NSString *)CFSTR("SBIconLocationDock");
}

- (void)cleanUpAfterTransition
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBRootFolderView;
  -[SBFolderView cleanUpAfterTransition](&v3, sel_cleanUpAfterTransition);
  -[UILabel setHidden:](self->_idleTextView, "setHidden:", 0);
  self->_iconListFrameOrientationOverride = 0;
  -[SBRootFolderView _updatePageControlNumberOfPages](self, "_updatePageControlNumberOfPages");
  -[SBFolderView _updatePageControlToIndex:](self, "_updatePageControlToIndex:", -[SBFolderView currentPageIndex](self, "currentPageIndex"));
}

- (BOOL)iconScrollView:(id)a3 shouldSetContentOffset:(CGPoint *)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  BOOL v9;
  _BOOL4 v10;
  uint64_t v11;
  objc_super v13;

  v5 = a5;
  v8 = a3;
  if (-[SBRootFolderView allowsFreeScrollingUntilScrollingEnds](self, "allowsFreeScrollingUntilScrollingEnds")
    || !-[SBRootFolderView shouldPinScrollingToFirstOrLastPageScrollOffsetForProposedScrollOffset:](self, "shouldPinScrollingToFirstOrLastPageScrollOffsetForProposedScrollOffset:", a4))
  {
    v10 = -[SBFolderView isVertical](self, "isVertical");
    v11 = 8;
    if (!v10)
      v11 = 0;
    *(double *)((char *)&a4->x + v11) = self->_scrollingAdjustment + *(double *)((char *)&a4->x + v11);
    v13.receiver = self;
    v13.super_class = (Class)SBRootFolderView;
    v9 = -[SBFolderView iconScrollView:shouldSetContentOffset:animated:](&v13, sel_iconScrollView_shouldSetContentOffset_animated_, v8, a4, v5);
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)allowsFreeScrollingUntilScrollingEnds
{
  return self->_allowsFreeScrollingUntilScrollingEnds;
}

- (CGRect)enterEditingTouchRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  -[SBRootFolderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[SBFolderView orientation](self, "orientation");
  -[SBFolderView currentIconListView](self, "currentIconListView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[SBFolderView firstIconListView](self, "firstIconListView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "layoutInsetsForOrientation:", v11);
  v14 = v13;
  v16 = v15;
  -[SBRootFolderView rootFolderVisualConfiguration](self, "rootFolderVisualConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "editingEntryAreaHorizontalInset");
  v19 = v18;
  if (v18 == -10000.0)
  {
    objc_msgSend(v12, "layout");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolderView gridSizeClassDomain](self, "gridSizeClassDomain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = SBHIconListLayoutLargestExtraIconImageSizeInDomain(v20, v11, v21) + 40.0;

  }
  v22 = v4 + v14 - v19;
  v23 = v6 + 0.0;
  v24 = v8 - (v14 - v19 + v16 - v19);
  v25 = v10;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)prepareForTransition
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBRootFolderView;
  -[SBFolderView prepareForTransition](&v3, sel_prepareForTransition);
  -[UILabel setHidden:](self->_idleTextView, "setHidden:", 1);
}

- (void)setNeedsLayout
{
  objc_super v3;

  -[SBIconListView setIconsNeedLayout](self->_dockListView, "setIconsNeedLayout");
  v3.receiver = self;
  v3.super_class = (Class)SBRootFolderView;
  -[SBFolderView setNeedsLayout](&v3, sel_setNeedsLayout);
}

- (void)setSuppressesEditingStateForListViews:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (-[SBFolderView suppressesEditingStateForListViews](self, "suppressesEditingStateForListViews") != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SBRootFolderView;
    -[SBFolderView setSuppressesEditingStateForListViews:](&v6, sel_setSuppressesEditingStateForListViews_, v3);
    -[SBFolderView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "rootFolderViewDidChangeSuppressesEditingStateForListViews:", self);

  }
}

- (void)_updateEditingStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderView;
  -[SBFolderView _updateEditingStateAnimated:](&v5, sel__updateEditingStateAnimated_);
  -[SBIconListView setEditing:](self->_dockListView, "setEditing:", -[SBFolderView isEditing](self, "isEditing") & (-[SBFolderView suppressesEditingStateForListViews](self, "suppressesEditingStateForListViews") ^ 1));
  -[SBIconListView updateEditingStateAnimated:](self->_dockListView, "updateEditingStateAnimated:", v3);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  int IsZero;
  int *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v19;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SBRootFolderView;
  -[SBFolderView hitTest:withEvent:](&v19, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBFolderView isEditing](self, "isEditing"))
  {
    v9 = v8;
  }
  else
  {
    -[SBFolderView scrollView](self, "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRootFolderView leadingCustomViewVisibilityProgress](self, "leadingCustomViewVisibilityProgress");
    if (v11 > 0.0 && (objc_msgSend(v8, "isDescendantOfView:", v10) & 1) == 0 && self->_dockView)
    {
      -[SBRootFolderView pullDownSearchVisibilityProgress](self, "pullDownSearchVisibilityProgress");
      IsZero = BSFloatIsZero();
      v13 = &OBJC_IVAR___SBRootFolderView__searchPulldownWrapperView;
      if (IsZero)
        v13 = &OBJC_IVAR___SBRootFolderView__searchableLeadingCustomWrapperView;
      v14 = *(id *)((char *)&self->super.super.super.super.isa + *v13);
      -[SBRootFolderView convertPoint:toView:](self, "convertPoint:toView:", v14, x, y);
      objc_msgSend(v14, "hitTest:withEvent:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        v16 = v15;
      else
        v16 = v8;
      v17 = v16;

      v8 = v17;
    }
    v9 = v8;

  }
  return v9;
}

- (void)setContentVisibility:(unint64_t)a3
{
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  if (-[SBFolderView contentVisibility](&v6, sel_contentVisibility) != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBRootFolderView;
    -[SBFolderView setContentVisibility:](&v5, sel_setContentVisibility_, a3);
    -[SBRootFolderView _updateDockBackgroundViewForOcclusionByOverlay](self, "_updateDockBackgroundViewForOcclusionByOverlay");
  }
}

- (void)_updateDockBackgroundViewForOcclusionByOverlay
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v11;

  objc_opt_class();
  -[SBDockView backgroundView](self->_dockView, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBFSafeCast();
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v11;
  if (v11)
  {
    v5 = -[SBFolderView contentVisibility](self, "contentVisibility");
    -[SBRootFolderView superview](self, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[SBRootFolderView window](self, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 != 0;

    }
    else
    {
      v8 = 0;
    }

    v9 = -[SBRootFolderView isOccludedByOverlay](self, "isOccludedByOverlay");
    if (v5)
      v10 = v8;
    else
      v10 = 0;
    objc_msgSend(v11, "setContentReplacedWithSnapshot:", v10 & v9);
    v4 = v11;
  }

}

- (BOOL)isOccludedByOverlay
{
  return self->_occludedByOverlay;
}

- (SBRootFolderView)initWithConfiguration:(id)a3
{
  id v4;
  SBRootFolderView *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  int *v11;
  void *v12;
  void *v13;
  SBDockIconListView *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  SBDockIconListView *dockListView;
  SBDockIconListView *v20;
  void *v21;
  SBDockIconListView *v22;
  void *v23;
  SBDockView *v24;
  SBDockView *dockView;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  SBFolderScrollAccessoryView *v35;
  SBFolderScrollAccessoryView *scrollAccessoryView;
  uint64_t v37;
  UIView *scrollAccessoryAuxiliaryView;
  uint64_t v39;
  UIView *scrollAccessoryBackgroundView;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  SBHRootFolderCustomViewPresenting *leadingCustomViewController;
  uint64_t v49;
  uint64_t v50;
  _SBRootFolderLayoutWrapperView *v51;
  _SBRootFolderLayoutWrapperView *searchableLeadingCustomWrapperView;
  uint64_t v53;
  SBHRootFolderCustomViewPresenting *trailingCustomViewController;
  void *v55;
  _SBRootFolderLayoutWrapperView *v56;
  _SBRootFolderLayoutWrapperView *searchableTrailingCustomWrapperView;
  SBHMinusPageStepper *v58;
  SBHMinusPageStepper *customPageAnimationStepper;
  uint64_t v60;
  SBHSearchPresenting *searchPresenter;
  void *v62;
  uint64_t v63;
  UIView *searchPresentableView;
  UIView *v65;
  void *v66;
  void *v67;
  _SBRootFolderLayoutWrapperView *v68;
  _SBRootFolderLayoutWrapperView *searchPulldownWrapperView;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  NSHashTable *dockOffscreenProgressSettingClients;
  void *v75;
  uint64_t v76;
  SBFParallaxSettings *parallaxSettings;
  uint64_t v78;
  SBHHomePullToSearchSettings *pullToSearchSettings;
  uint64_t v80;
  SBHRootFolderSettings *folderSettings;
  void *v82;
  void *v83;
  id v84;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  objc_super v95;
  _QWORD v96[2];

  v96[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v95.receiver = self;
  v95.super_class = (Class)SBRootFolderView;
  v5 = -[SBFolderView initWithConfiguration:](&v95, sel_initWithConfiguration_, v4);
  if (!v5)
    goto LABEL_51;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v4;
  else
    v7 = 0;
  v8 = v7;

  -[SBFolderView folder](v5, "folder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isForSnapshot");
  v5->_dockEdge = 4;
  v11 = &OBJC_IVAR___SBDockView__dockEdge;
  v93 = v9;
  if (objc_msgSend(v8, "isDockExternal"))
  {
    v5->_dockExternal = 1;
  }
  else
  {
    objc_msgSend(v9, "dock");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRootFolderView dockIconLocation](v5, "dockIconLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = [SBDockIconListView alloc];
    -[SBFolderView listLayoutProvider](v5, "listLayoutProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SBFolderView orientation](v5, "orientation");
    -[SBFolderView iconViewProvider](v5, "iconViewProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[SBDockIconListView initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:](v14, "initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:", v12, v15, v13, v16, v17);
    dockListView = v5->_dockListView;
    v5->_dockListView = (SBDockIconListView *)v18;

    v11 = &OBJC_IVAR___SBDockView__dockEdge;
    -[SBIconListView setLayoutInsetsMode:](v5->_dockListView, "setLayoutInsetsMode:", 2);
    -[SBIconListView setAutomaticallyAdjustsLayoutMetricsToFit:](v5->_dockListView, "setAutomaticallyAdjustsLayoutMetricsToFit:", 0);
    -[SBIconListView setAdjustsColumnPositionsForFullScreenWidth:](v5->_dockListView, "setAdjustsColumnPositionsForFullScreenWidth:", 1);
    v20 = v5->_dockListView;
    -[SBFolderView folderIconImageCache](v5, "folderIconImageCache");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListView setFolderIconImageCache:](v20, "setFolderIconImageCache:", v21);

    v22 = v5->_dockListView;
    -[SBFolderView iconImageCache](v5, "iconImageCache");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListView setIconImageCache:](v22, "setIconImageCache:", v23);

    -[SBIconListView setDragDelegate:](v5->_dockListView, "setDragDelegate:", v5);
    v24 = -[SBDockView initWithDockListView:forSnapshot:]([SBDockView alloc], "initWithDockListView:forSnapshot:", v5->_dockListView, v10);
    dockView = v5->_dockView;
    v5->_dockView = v24;

    -[SBDockView setDelegate:](v5->_dockView, "setDelegate:", v5);
    v9 = v93;
  }
  -[SBFolderView scalingView](v5, "scalingView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderView headerView](v5, "headerView");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
    objc_msgSend(v26, "addSubview:", v27);
  -[SBFolderView scrollView](v5, "scrollView");
  v28 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v28);
  -[SBRootFolderView rootFolderVisualConfiguration](v5, "rootFolderVisualConfiguration");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "pageControlCustomPadding");
  v30 = v29;
  v32 = v31;
  -[SBFolderView pageControl](v5, "pageControl");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v30 > 0.0)
    objc_msgSend(v33, "_setCustomHorizontalPadding:", v30);
  v90 = (void *)v27;
  if (v32 > 0.0)
    objc_msgSend(v34, "_setCustomVerticalPadding:", v32);
  v35 = -[SBFolderScrollAccessoryView initWithFolder:pageControl:]([SBFolderScrollAccessoryView alloc], "initWithFolder:pageControl:", v9, v34);
  scrollAccessoryView = v5->_scrollAccessoryView;
  v5->_scrollAccessoryView = v35;

  objc_msgSend(v8, "scrollAccessoryAuxiliaryView");
  v37 = objc_claimAutoreleasedReturnValue();
  scrollAccessoryAuxiliaryView = v5->_scrollAccessoryAuxiliaryView;
  v5->_scrollAccessoryAuxiliaryView = (UIView *)v37;

  objc_msgSend(v8, "scrollAccessoryBackgroundView");
  v39 = objc_claimAutoreleasedReturnValue();
  scrollAccessoryBackgroundView = v5->_scrollAccessoryBackgroundView;
  v5->_scrollAccessoryBackgroundView = (UIView *)v39;

  objc_msgSend(v26, "addSubview:", v5->_scrollAccessoryView);
  -[SBRootFolderView updatePageControlConfiguration](v5, "updatePageControlConfiguration");
  if ((_DWORD)v10)
  {
    -[SBRootFolderView requirePageDotsVisibilityForReason:](v5, "requirePageDotsVisibilityForReason:", CFSTR("snapshot"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRootFolderView setConfiguredForSnapshotPageDotsVisibilityAssertion:](v5, "setConfiguredForSnapshotPageDotsVisibilityAssertion:", v41);

  }
  if (SBHHardwareSupportsHomeScreenSearchAffordance())
  {
    if (v5->_scrollAccessoryAuxiliaryView)
      goto LABEL_21;
    -[SBRootFolderView requirePageDotsVisibilityForReason:](v5, "requirePageDotsVisibilityForReason:", CFSTR("feature-disabled"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRootFolderView setSearchButtonDisabledPageDotsVisibilityAssertion:](v5, "setSearchButtonDisabledPageDotsVisibilityAssertion:", v42);
  }
  else
  {
    -[SBRootFolderView requirePageDotsVisibilityForReason:](v5, "requirePageDotsVisibilityForReason:", CFSTR("hardware-unsupported"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRootFolderView setSearchButtonUnsupportedHardwarePageDotsVisibilityAssertion:](v5, "setSearchButtonUnsupportedHardwarePageDotsVisibilityAssertion:", v42);
  }

LABEL_21:
  -[SBRootFolderView _applyPageDotsVisibilityAssertions](v5, "_applyPageDotsVisibilityAssertions");
  if (*(Class *)((char *)&v5->super.super.super.super.isa + v11[672]))
  {
    objc_msgSend(v26, "addSubview:");
    -[SBRootFolderView _updateDockViewZOrdering](v5, "_updateDockViewZOrdering");
  }
  -[SBRootFolderView traitCollection](v5, "traitCollection");
  v43 = objc_claimAutoreleasedReturnValue();
  -[SBFolderView overrideIconImageAppearance](v5, "overrideIconImageAppearance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v44;
  v87 = (void *)v43;
  v45 = (void *)v28;
  if (v44)
  {
    v46 = v44;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_iconImageAppearanceFromTraitCollection:", v43);
    v46 = (id)objc_claimAutoreleasedReturnValue();
  }
  v94 = v46;
  objc_msgSend(v8, "leadingCustomViewController");
  v47 = objc_claimAutoreleasedReturnValue();
  leadingCustomViewController = v5->_leadingCustomViewController;
  v5->_leadingCustomViewController = (SBHRootFolderCustomViewPresenting *)v47;

  -[SBHRootFolderCustomViewPresenting view](v5->_leadingCustomViewController, "view");
  v49 = objc_claimAutoreleasedReturnValue();
  v92 = (void *)v49;
  if (v49)
  {
    v50 = v49;
    v51 = objc_alloc_init(_SBRootFolderLayoutWrapperView);
    searchableLeadingCustomWrapperView = v5->_searchableLeadingCustomWrapperView;
    v5->_searchableLeadingCustomWrapperView = v51;

    -[_SBRootFolderLayoutWrapperView setWrappedView:](v5->_searchableLeadingCustomWrapperView, "setWrappedView:", v50);
    if (v94 && (objc_opt_respondsToSelector() & 1) != 0)
      -[SBHRootFolderCustomViewPresenting setOverrideIconImageAppearance:](v5->_leadingCustomViewController, "setOverrideIconImageAppearance:", v94);
    objc_msgSend(v45, "addSubview:", v5->_searchableLeadingCustomWrapperView);
  }
  else
  {
    v5->_leadingCustomViewPageHidden = 1;
  }
  v91 = v26;
  objc_msgSend(v8, "trailingCustomViewController");
  v53 = objc_claimAutoreleasedReturnValue();
  trailingCustomViewController = v5->_trailingCustomViewController;
  v5->_trailingCustomViewController = (SBHRootFolderCustomViewPresenting *)v53;

  -[SBHRootFolderCustomViewPresenting view](v5->_trailingCustomViewController, "view");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v34;
  if (v55)
  {
    v56 = objc_alloc_init(_SBRootFolderLayoutWrapperView);
    searchableTrailingCustomWrapperView = v5->_searchableTrailingCustomWrapperView;
    v5->_searchableTrailingCustomWrapperView = v56;

    -[_SBRootFolderLayoutWrapperView setWrappedView:](v5->_searchableTrailingCustomWrapperView, "setWrappedView:", v55);
    if (v94 && (objc_opt_respondsToSelector() & 1) != 0)
      -[SBHRootFolderCustomViewPresenting setOverrideIconImageAppearance:](v5->_trailingCustomViewController, "setOverrideIconImageAppearance:", v94);
    objc_msgSend(v45, "addSubview:", v5->_searchableTrailingCustomWrapperView);
    goto LABEL_38;
  }
  if (v92)
  {
LABEL_38:
    v58 = objc_alloc_init(SBHMinusPageStepper);
    customPageAnimationStepper = v5->_customPageAnimationStepper;
    v5->_customPageAnimationStepper = v58;

  }
  objc_msgSend(v8, "searchPresenter");
  v60 = objc_claimAutoreleasedReturnValue();
  searchPresenter = v5->_searchPresenter;
  v5->_searchPresenter = (SBHSearchPresenting *)v60;

  if (v5->_searchPresenter)
  {
    objc_msgSend(v8, "searchPresentableViewController");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "view");
    v63 = objc_claimAutoreleasedReturnValue();
    searchPresentableView = v5->_searchPresentableView;
    v5->_searchPresentableView = (UIView *)v63;

    v65 = v5->_searchPresentableView;
    -[SBRootFolderView bounds](v5, "bounds");
    -[UIView setFrame:](v65, "setFrame:");
    -[UIView setHidden:](v5->_searchPresentableView, "setHidden:", 1);
    -[SBRootFolderView addSubview:](v5, "addSubview:", v5->_searchPresentableView);
  }
  objc_msgSend(v8, "pullDownSearchViewController");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "view");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67 || v5->_searchPresenter)
  {
    v68 = objc_alloc_init(_SBRootFolderLayoutWrapperView);
    searchPulldownWrapperView = v5->_searchPulldownWrapperView;
    v5->_searchPulldownWrapperView = v68;

    if (v67)
      -[_SBRootFolderLayoutWrapperView setWrappedView:](v5->_searchPulldownWrapperView, "setWrappedView:", v67);
    -[_SBRootFolderLayoutWrapperView setHidden:](v5->_searchPulldownWrapperView, "setHidden:", 1);
    -[SBRootFolderView addSubview:](v5, "addSubview:", v5->_searchPulldownWrapperView);
  }
  +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_ignoresOverscrollOnFirstPageOrientations = objc_msgSend(v8, "ignoresOverscrollOnFirstPageOrientations");
  v71 = objc_msgSend(v8, "ignoresOverscrollOnLastPageOrientations");
  v5->_ignoresOverscrollOnLastPageOrientations = v71;
  if (v5->_ignoresOverscrollOnFirstPageOrientations | v71)
  {
    objc_msgSend(v45, "panGestureRecognizer");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "addTarget:action:", v5, sel__overscrollScrollPanGestureRecognizerDidUpdate_);

  }
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v73 = objc_claimAutoreleasedReturnValue();
  dockOffscreenProgressSettingClients = v5->_dockOffscreenProgressSettingClients;
  v5->_dockOffscreenProgressSettingClients = (NSHashTable *)v73;

  objc_msgSend(v70, "iconSettings");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "iconParallaxSettings");
  v76 = objc_claimAutoreleasedReturnValue();
  parallaxSettings = v5->_parallaxSettings;
  v5->_parallaxSettings = (SBFParallaxSettings *)v76;

  -[SBFParallaxSettings addKeyObserver:](v5->_parallaxSettings, "addKeyObserver:", v5);
  -[SBRootFolderView _updateParallaxSettings](v5, "_updateParallaxSettings");
  objc_msgSend(v70, "homeScreenPullToSearchSettings");
  v78 = objc_claimAutoreleasedReturnValue();
  pullToSearchSettings = v5->_pullToSearchSettings;
  v5->_pullToSearchSettings = (SBHHomePullToSearchSettings *)v78;

  -[PTSettings addKeyObserver:](v5->_pullToSearchSettings, "addKeyObserver:", v5);
  -[SBRootFolderView _updatePullToSearchSettings](v5, "_updatePullToSearchSettings");
  objc_msgSend(v70, "rootFolderSettings");
  v80 = objc_claimAutoreleasedReturnValue();
  folderSettings = v5->_folderSettings;
  v5->_folderSettings = (SBHRootFolderSettings *)v80;

  -[SBRootFolderView _resetSearchScrollTrackingState](v5, "_resetSearchScrollTrackingState");
  v5->_allowsAutoscrollToLeadingCustomView = 1;
  v5->_folderPageManagementAllowedOrientations = objc_msgSend(v8, "folderPageManagementAllowedOrientations");
  -[SBRootFolderView _setupIdleTextPrivacyDisclosures](v5, "_setupIdleTextPrivacyDisclosures");
  -[SBRootFolderView _setupStateDumper](v5, "_setupStateDumper");
  v5->_titledButtonsAlpha = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addObserver:selector:name:object:", v5, sel__reduceMotionStatusDidChange_, *MEMORY[0x1E0DC45B0], 0);

  if (v5->_scrollAccessoryAuxiliaryView)
  {
    v96[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 1);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = (id)-[SBRootFolderView registerForTraitChanges:withAction:](v5, "registerForTraitChanges:withAction:", v83, sel__forceLayoutPageControl);

  }
LABEL_51:

  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0DA9EC0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[SBFParallaxSettings removeKeyObserver:](self->_parallaxSettings, "removeKeyObserver:", self);
  -[BSInvalidatable invalidate](self->_dockStateDumpHandle, "invalidate");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SBRootFolderView pageDotsVisibilityAssertions](self, "pageDotsVisibilityAssertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "invalidate");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)SBRootFolderView;
  -[SBFolderView dealloc](&v10, sel_dealloc);
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBRootFolderView;
  -[SBFolderView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[SBRootFolderView _updateDockBackgroundViewForOcclusionByOverlay](self, "_updateDockBackgroundViewForOcclusionByOverlay");
}

- (void)setDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderView;
  -[SBFolderView setDelegate:](&v5, sel_setDelegate_, a3);
  if (self->_dockView && !-[SBRootFolderView isDockExternal](self, "isDockExternal"))
  {
    v4 = -[SBRootFolderView newDockBackgroundView](self, "newDockBackgroundView");
    if (v4)
    {
      -[SBDockView setBackgroundView:](self->_dockView, "setBackgroundView:", v4);
      -[SBRootFolderView _updateDockBackgroundViewForOcclusionByOverlay](self, "_updateDockBackgroundViewForOcclusionByOverlay");
    }

  }
}

- (UIView)leadingCustomViewWrapperView
{
  return (UIView *)self->_searchableLeadingCustomWrapperView;
}

- (void)setSearchGesture:(id)a3
{
  SBSearchGesture *v5;
  SBSearchGesture *searchGesture;
  SBSearchGesture *v7;
  void *v8;
  SBSearchGesture *v9;

  v5 = (SBSearchGesture *)a3;
  searchGesture = self->_searchGesture;
  if (searchGesture != v5)
  {
    v9 = v5;
    -[SBSearchGesture setTargetView:](searchGesture, "setTargetView:", 0);
    objc_storeStrong((id *)&self->_searchGesture, a3);
    v7 = self->_searchGesture;
    -[SBFolderView scrollView](self, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSearchGesture setTargetView:](v7, "setTargetView:", v8);

    v5 = v9;
  }

}

- (BOOL)isSearchHidden
{
  return -[_SBRootFolderLayoutWrapperView isHidden](self->_searchPulldownWrapperView, "isHidden");
}

- (void)setSearchHidden:(BOOL)a3
{
  -[_SBRootFolderLayoutWrapperView setHidden:](self->_searchPulldownWrapperView, "setHidden:", a3);
}

- (void)setLeadingCustomViewPageHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;

  if (self->_leadingCustomViewPageHidden != a3)
  {
    v3 = a3;
    -[SBRootFolderView leadingCustomView](self, "leadingCustomView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (-[SBRootFolderView isOnLeadingCustomPage](self, "isOnLeadingCustomPage") && v3)
        -[SBFolderView setCurrentPageIndex:animated:](self, "setCurrentPageIndex:animated:", -[SBFolderView firstIconPageIndex](self, "firstIconPageIndex"), 0);
      self->_leadingCustomViewPageHidden = v3;
      if (v3)
      {
        -[_SBRootFolderLayoutWrapperView removeFromSuperview](self->_searchableLeadingCustomWrapperView, "removeFromSuperview");
        v6 = -1;
      }
      else
      {
        -[SBFolderView scrollView](self, "scrollView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addSubview:", self->_searchableLeadingCustomWrapperView);

        v6 = 1;
      }
      -[SBFolderView _updateIconListFrames](self, "_updateIconListFrames");
      -[SBFolderView setCurrentPageIndex:animated:](self, "setCurrentPageIndex:animated:", -[SBFolderView currentPageIndex](self, "currentPageIndex") + v6, 0);
      -[SBRootFolderView setNeedsLayout](self, "setNeedsLayout");
      -[SBRootFolderView layoutIfNeeded](self, "layoutIfNeeded");
    }
  }
}

- (void)setOccludedByOverlay:(BOOL)a3
{
  if (self->_occludedByOverlay != a3)
  {
    self->_occludedByOverlay = a3;
    -[SBRootFolderView _updateDockBackgroundViewForOcclusionByOverlay](self, "_updateDockBackgroundViewForOcclusionByOverlay");
  }
}

- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;

  v4 = a4;
  v6 = a3;
  -[SBFolderView listLayoutProvider](self, "listLayoutProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)SBRootFolderView;
  -[SBFolderView setListLayoutProvider:animated:](&v10, sel_setListLayoutProvider_animated_, v6, v4);

  -[SBFolderView listLayoutProvider](self, "listLayoutProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__SBRootFolderView_setListLayoutProvider_animated___block_invoke;
    v9[3] = &unk_1E8D84C50;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v9, 0.3);
  }

}

uint64_t __51__SBRootFolderView_setListLayoutProvider_animated___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "dockView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listLayoutProviderDidChange");

  return objc_msgSend(*(id *)(a1 + 32), "_layoutSubviews");
}

- (void)_flashPageDotsForReason:(id)a3
{
  id v3;

  -[SBRootFolderView requirePageDotsVisibilityForReason:](self, "requirePageDotsVisibilityForReason:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

}

- (void)returnScalingView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBRootFolderView;
  -[SBFolderView returnScalingView](&v11, sel_returnScalingView);
  -[SBRootFolderView bringSubviewToFront:](self, "bringSubviewToFront:", self->_searchPulldownWrapperView);
  -[SBSearchBackdropView superview](self->_trailingCustomBackdropView, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendSubviewToBack:", self->_trailingCustomBackdropView);

  -[SBSearchBackdropView superview](self->_trailingCustomBackdropView, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertSubview:aboveSubview:", self->_trailingCustomSearchDimmingView, self->_trailingCustomBackdropView);

  -[SBRootFolderView doneButton](self, "doneButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bringSubviewToFront:", v6);

  }
  -[SBRootFolderView widgetButton](self, "widgetButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bringSubviewToFront:", v9);

  }
}

- (void)willMoveToWindow:(id)a3
{
  SBRootFolderView *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  BOOL v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  SBRootFolderView *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  objc_super v18;
  uint8_t buf[4];
  SBRootFolderView *v20;
  __int16 v21;
  SBRootFolderView *v22;
  __int16 v23;
  SBRootFolderView *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (SBRootFolderView *)a3;
  -[SBRootFolderView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = 0;
  else
    v6 = v4 != 0;

  -[SBRootFolderView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v4 != 0;
  else
    v8 = 1;
  if (v6 || !v8)
  {
    v9 = -[SBFolderView minimumPageIndex](self, "minimumPageIndex");
    v10 = -[SBFolderView maximumPageIndex](self, "maximumPageIndex");
    v11 = -[SBFolderView currentPageIndex](self, "currentPageIndex");
    v12 = v10 & ~(v10 >> 63);
    if (v11 <= v12)
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    if (v11 >= v9)
      v13 = (SBRootFolderView *)v12;
    else
      v13 = (SBRootFolderView *)v9;
    if (v13 != (SBRootFolderView *)0x7FFFFFFFFFFFFFFFLL)
    {
      SBLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = self;
        _os_log_impl(&dword_1CFEF3000, v14, OS_LOG_TYPE_DEFAULT, "SBRootFolderView current state: %{public}@", buf, 0xCu);
      }

      SBLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349056;
        v20 = v13;
        _os_log_impl(&dword_1CFEF3000, v15, OS_LOG_TYPE_DEFAULT, "SBRootFolderView is moving to page: %{public}lu", buf, 0xCu);
      }

      SBLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v4;
        _os_log_impl(&dword_1CFEF3000, v16, OS_LOG_TYPE_DEFAULT, "SBRootFolderView is moving to window: %{public}@", buf, 0xCu);
      }

      SBLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543874;
        v20 = v4;
        v21 = 2114;
        v22 = self;
        v23 = 2050;
        v24 = v13;
        _os_log_fault_impl(&dword_1CFEF3000, v17, OS_LOG_TYPE_FAULT, "SBRootFolderView is moving to window '%{public}@' state: %{public}@; will trigger setCurrentPageIndex:'%{publi"
          "c}lu' animated:NO",
          buf,
          0x20u);
      }

    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SBRootFolderView;
  -[SBFolderView willMoveToWindow:](&v18, sel_willMoveToWindow_, v4);

}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBRootFolderView;
  -[SBFolderView didMoveToWindow](&v11, sel_didMoveToWindow);
  -[SBRootFolderView leadingCustomViewController](self, "leadingCustomViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRootFolderView trailingCustomViewController](self, "trailingCustomViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0DC4730];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__SBRootFolderView_didMoveToWindow__block_invoke;
  v8[3] = &unk_1E8D84F18;
  v8[4] = self;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  objc_msgSend(v5, "_performBlockAfterCATransactionCommits:", v8);

}

void __35__SBRootFolderView_didMoveToWindow__block_invoke(id *a1)
{
  id v2;

  objc_msgSend(a1[4], "overrideIconImageAppearance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a1[5], "setOverrideIconImageAppearance:", v2);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a1[6], "setOverrideIconImageAppearance:", v2);

}

- (void)setOrientation:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderView;
  -[SBFolderView setOrientation:](&v5, sel_setOrientation_);
  if (!-[SBRootFolderView isDockViewBorrowed](self, "isDockViewBorrowed"))
  {
    -[SBIconListView setOrientation:](self->_dockListView, "setOrientation:", a3);
    -[SBIconListView layoutIconsNow](self->_dockListView, "layoutIconsNow");
  }
  -[SBRootFolderView setNeedsLayout](self, "setNeedsLayout");
  -[SBRootFolderView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)setLegibilitySettings:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderView;
  v4 = a3;
  -[SBFolderView setLegibilitySettings:](&v5, sel_setLegibilitySettings_, v4);
  -[SBDockView setLegibilitySettings:](self->_dockView, "setLegibilitySettings:", v4, v5.receiver, v5.super_class);

}

- (void)_updateIconListLegibilitySettings
{
  void *v3;
  UILabel *idleTextView;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBRootFolderView;
  -[SBFolderView _updateIconListLegibilitySettings](&v7, sel__updateIconListLegibilitySettings);
  -[SBFolderView legibilitySettingsForIconListViews](self, "legibilitySettingsForIconListViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView setLegibilitySettings:](self->_dockListView, "setLegibilitySettings:", v3);
  idleTextView = self->_idleTextView;
  objc_msgSend(v3, "primaryColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UILabel setTextColor:](idleTextView, "setTextColor:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](idleTextView, "setTextColor:", v6);

  }
}

- (NSString)dockIconLocation
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "dockIconLocation");
}

- (double)maxDockHeight
{
  void *v3;
  double v4;
  double v5;
  double result;

  if (-[SBRootFolderView isDockExternal](self, "isDockExternal"))
  {
    -[SBFolderView delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0.0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "maxExternalDockHeightForRootFolderView:", self);
      v4 = v5;
    }

    return v4;
  }
  else
  {
    -[SBDockView dockHeight](self->_dockView, "dockHeight");
  }
  return result;
}

- (id)rootWithWidgetsListLayout
{
  void *v3;
  void *v4;
  void *v5;

  -[SBFolderView listLayoutProvider](self, "listLayoutProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRootFolderView iconLocationForListsWithNonDefaultSizedIcons](self, "iconLocationForListsWithNonDefaultSizedIcons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutForIconLocation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)externalDockPageControlVerticalMargin
{
  void *v3;
  void *v4;
  uint64_t v5;
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
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double MaxY;
  double v29;
  double v30;
  double v31;
  CGFloat rect;
  double v34;
  double v35;
  CGRect v36;
  CGRect v37;

  -[SBRootFolderView rootWithWidgetsListLayout](self, "rootWithWidgetsListLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderView gridSizeClassDomain](self, "gridSizeClassDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBFolderView orientation](self, "orientation");
  objc_msgSend(v3, "layoutInsetsForOrientation:", v5);
  v7 = v6;
  v9 = v8;
  v34 = v10;
  v12 = v11;
  v13 = SBHIconListLayoutLargestExtraIconImageSizeInDomain(v3, v5, v4);
  v35 = v14;
  -[SBRootFolderView bounds](self, "bounds", v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = v9 + v15;
  rect = v7 + v17;
  v24 = v19 - (v9 + v12);
  v25 = v21 - (v7 + v34);
  -[SBRootFolderView dockHeight](self, "dockHeight");
  v27 = v26;
  v36.origin.x = v16;
  v36.origin.y = v18;
  v36.size.width = v20;
  v36.size.height = v22;
  MaxY = CGRectGetMaxY(v36);
  v37.origin.x = v23;
  v37.origin.y = rect;
  v37.size.width = v24;
  v37.size.height = v25;
  v29 = MaxY - CGRectGetMaxY(v37) - v27 - v35 * 0.5;
  -[SBFolderView pageControlAreaHeight](self, "pageControlAreaHeight");
  v31 = ceil(v29 * 0.5 - v30 * 0.5);

  return v31;
}

- (void)layoutSearchableViews
{
  _OWORD v3[20];
  uint64_t v4;

  v4 = 0;
  memset(v3, 0, sizeof(v3));
  -[SBRootFolderView getMetrics:](self, "getMetrics:", v3);
  -[SBRootFolderView layoutSearchableViewsWithMetrics:](self, "layoutSearchableViewsWithMetrics:", v3);
}

- (CGRect)_scrollViewFrameForDockEdge:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  _OWORD v7[8];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  CGRect result;

  v20 = 0;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  memset(v7, 0, sizeof(v7));
  -[SBRootFolderView getMetrics:dockEdge:](self, "getMetrics:dockEdge:", v7, a3);
  v4 = *((double *)&v8 + 1);
  v3 = *(double *)&v8;
  v6 = *((double *)&v9 + 1);
  v5 = *(double *)&v9;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)_spotlightFirstIconRowOffset
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  char v8;
  double v9;
  double v10;

  -[SBFolderView firstIconListView](self, "firstIconListView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutInsetsForOrientation:", objc_msgSend(v3, "orientation"));
  v6 = v5;

  -[SBFolderView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();
  v9 = 0.0;
  if ((v8 & 1) != 0)
    objc_msgSend(v7, "distanceToTopOfSpotlightIconsForRootFolderView:", self, 0.0);
  if (v9 - v6 <= 0.0)
    v10 = v9;
  else
    v10 = v9 - v6;

  return v10;
}

- (id)beginModifyingDockOffscreenFractionForReason:(id)a3
{
  id v4;
  NSObject *v5;
  _SBRootFolderDockOffscreenFractionClient *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "Begin modifying dock offscreen fraction for reason: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  v6 = -[_SBRootFolderDockOffscreenFractionClient initWithFolderView:reason:]([_SBRootFolderDockOffscreenFractionClient alloc], "initWithFolderView:reason:", self, v4);
  -[NSHashTable addObject:](self->_dockOffscreenProgressSettingClients, "addObject:", v6);

  return v6;
}

- (void)removeDockOffscreenFractionClient:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "reason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "End modifying dock offscreen fraction for reason: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  -[NSHashTable removeObject:](self->_dockOffscreenProgressSettingClients, "removeObject:", v4);
  -[SBRootFolderView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setDockEdge:(unint64_t)a3
{
  void *v5;

  if (self->_dockEdge != a3)
  {
    self->_dockEdge = a3;
    -[SBRootFolderView dockView](self, "dockView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDockEdge:", a3);

    -[SBRootFolderView _updateDockViewZOrdering](self, "_updateDockViewZOrdering");
    -[SBRootFolderView _updateIconListIndexSearchableAndLeadingCustomViewsWithLayout:](self, "_updateIconListIndexSearchableAndLeadingCustomViewsWithLayout:", 0);
    -[SBRootFolderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)updateDockViewOrientation
{
  -[SBIconListView setOrientation:](self->_dockListView, "setOrientation:", -[SBFolderView orientation](self, "orientation"));
  -[SBIconListView layoutIconsNow](self->_dockListView, "layoutIconsNow");
}

- (void)_updateDockViewZOrdering
{
  uint64_t v3;
  void *v4;
  int IsZero;
  id v6;
  id v7;

  v3 = -[SBRootFolderView dockEdge](self, "dockEdge");
  if (v3 > 7)
  {
    if (v3 == 15)
      goto LABEL_8;
    if (v3 != 8)
      goto LABEL_11;
LABEL_7:
    -[SBFolderView scalingView](self, "scalingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (v3 == 2)
    goto LABEL_7;
  if (v3 != 4)
    goto LABEL_11;
LABEL_8:
  -[SBRootFolderView leadingCustomViewVisibilityProgress](self, "leadingCustomViewVisibilityProgress");
  if ((BSFloatIsZero() & 1) != 0)
  {
    -[SBRootFolderView trailingCustomViewVisibilityProgress](self, "trailingCustomViewVisibilityProgress");
    IsZero = BSFloatIsZero();
    -[SBFolderView scalingView](self, "scalingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!IsZero)
      goto LABEL_12;
LABEL_10:
    v6 = v4;
    objc_msgSend(v4, "bringSubviewToFront:", self->_dockView);

    return;
  }
LABEL_11:
  -[SBFolderView scalingView](self, "scalingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v7 = v4;
  objc_msgSend(v4, "sendSubviewToBack:", self->_dockView);

}

- (void)setContentAlpha:(double)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  -[SBFolderView setContentAlpha:](&v6, sel_setContentAlpha_);
  -[SBRootFolderView dockView](self, "dockView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", a3);

}

- (id)borrowDockViewForReason:(id)a3
{
  id v4;
  void *v5;
  _SBRootFolderViewElementBorrowedAssertion *v6;

  v4 = a3;
  -[SBRootFolderView dockBorrowedAssertion](self, "dockBorrowedAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = -[_SBRootFolderViewElementBorrowedAssertion initWithFolderView:reason:]([_SBRootFolderViewElementBorrowedAssertion alloc], "initWithFolderView:reason:", self, v4);
    -[SBRootFolderView setDockBorrowedAssertion:](self, "setDockBorrowedAssertion:", v6);
  }

  return v6;
}

- (void)elementBorrowedAssertionDidInvalidate:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[SBRootFolderView dockBorrowedAssertion](self, "dockBorrowedAssertion");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[SBRootFolderView setDockBorrowedAssertion:](self, "setDockBorrowedAssertion:", 0);
    -[SBFolderView scalingView](self, "scalingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_dockView);
    -[SBDockView setAlpha:](self->_dockView, "setAlpha:", 1.0);
    -[SBDockView setHidden:](self->_dockView, "setHidden:", 0);
    -[SBRootFolderView updateDockViewOrientation](self, "updateDockViewOrientation");
    -[SBRootFolderView _updateDockViewZOrdering](self, "_updateDockViewZOrdering");
    -[SBRootFolderView setNeedsLayout](self, "setNeedsLayout");
LABEL_11:

    goto LABEL_12;
  }
  -[SBRootFolderView scrollAccessoryBorrowedAssertion](self, "scrollAccessoryBorrowedAssertion");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[SBRootFolderView setScrollAccessoryBorrowedAssertion:](self, "setScrollAccessoryBorrowedAssertion:", 0);
    -[SBFolderView scalingView](self, "scalingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRootFolderView scrollAccessoryView](self, "scrollAccessoryView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);
    -[SBFolderView pageControl](self, "pageControl");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "hidesForSinglePage") || objc_msgSend(v10, "numberOfPages") >= 2)
    {
      objc_msgSend(v10, "setAlpha:", 1.0);
      objc_msgSend(v10, "setHidden:", 0);
    }
    -[SBRootFolderView setNeedsLayout](self, "setNeedsLayout");

    goto LABEL_11;
  }
  SBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[SBRootFolderView elementBorrowedAssertionDidInvalidate:].cold.1(v4, v7);

LABEL_12:
}

- (id)borrowScrollAccessoryForReason:(id)a3
{
  id v4;
  void *v5;
  _SBRootFolderViewElementBorrowedAssertion *v6;

  v4 = a3;
  -[SBRootFolderView scrollAccessoryBorrowedAssertion](self, "scrollAccessoryBorrowedAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = -[_SBRootFolderViewElementBorrowedAssertion initWithFolderView:reason:]([_SBRootFolderViewElementBorrowedAssertion alloc], "initWithFolderView:reason:", self, v4);
    -[SBRootFolderView setScrollAccessoryBorrowedAssertion:](self, "setScrollAccessoryBorrowedAssertion:", v6);
  }

  return v6;
}

- (id)requirePageDotsVisibilityForReason:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0D01868]);
  v6 = MEMORY[0x1E0C80D38];
  v7 = MEMORY[0x1E0C80D38];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __55__SBRootFolderView_requirePageDotsVisibilityForReason___block_invoke;
  v15 = &unk_1E8D85A30;
  objc_copyWeak(&v16, &location);
  v8 = (void *)objc_msgSend(v5, "initWithIdentifier:forReason:queue:invalidationBlock:", CFSTR("RootFolderPageDotsVisibility"), v4, v6, &v12);

  -[SBRootFolderView pageDotsVisibilityAssertions](self, "pageDotsVisibilityAssertions", v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRootFolderView setPageDotsVisibilityAssertions:](self, "setPageDotsVisibilityAssertions:", v9);
  }
  v10 = objc_msgSend(v9, "count");
  objc_msgSend(v9, "addObject:", v8);
  if (!v10)
    -[SBRootFolderView _applyPageDotsVisibilityAssertions](self, "_applyPageDotsVisibilityAssertions");

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v8;
}

void __55__SBRootFolderView_requirePageDotsVisibilityForReason___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "pageDotsVisibilityAssertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v3);

  if (!objc_msgSend(v5, "count"))
  {
    v6 = (void *)MEMORY[0x1E0C99E88];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__SBRootFolderView_requirePageDotsVisibilityForReason___block_invoke_2;
    v9[3] = &unk_1E8D87638;
    v7 = WeakRetained;
    v10 = v7;
    objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 0, v9, 0.8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPageDotsVisibilityTimer:", v8);

  }
}

uint64_t __55__SBRootFolderView_requirePageDotsVisibilityForReason___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyPageDotsVisibilityAssertions");
}

- (void)_applyPageDotsVisibilityAssertions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[SBRootFolderView pageDotsVisibilityTimer](self, "pageDotsVisibilityTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SBRootFolderView setPageDotsVisibilityTimer:](self, "setPageDotsVisibilityTimer:", 0);
  -[SBRootFolderView pageDotsVisibilityAssertions](self, "pageDotsVisibilityAssertions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {

    goto LABEL_5;
  }
  -[SBFolderView pageControl](self, "pageControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfPages");

  if (v6 < 2)
  {
LABEL_5:
    -[SBRootFolderView scrollAccessoryView](self, "scrollAccessoryView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v8 = 1;
    goto LABEL_6;
  }
  -[SBRootFolderView scrollAccessoryView](self, "scrollAccessoryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v8 = 0;
LABEL_6:
  objc_msgSend(v7, "setMode:", v8);

}

- (BOOL)isPageControlHidden
{
  void *v2;
  char v3;

  -[SBRootFolderView scrollAccessoryView](self, "scrollAccessoryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setPageControlHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBRootFolderView scrollAccessoryView](self, "scrollAccessoryView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (double)pageControlAlpha
{
  void *v2;
  double v3;
  double v4;

  -[SBRootFolderView scrollAccessoryView](self, "scrollAccessoryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3;

  return v4;
}

- (BOOL)_leadingCustomViewShouldShowDoneButtonWhenEditing
{
  void *v2;
  char v3;

  -[SBRootFolderView leadingCustomViewController](self, "leadingCustomViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "shouldShowDoneButtonWhenEditing");
  else
    v3 = 0;

  return v3;
}

- (int64_t)_adjustPageIndexForPageControl:(int64_t)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  v4 = -[SBFolderView _adjustPageIndexForPageControl:](&v6, sel__adjustPageIndexForPageControl_, a3);
  return (int64_t)v4
       - (-[SBRootFolderView _leadingCustomViewShouldBeIndicatedInPageControl](self, "_leadingCustomViewShouldBeIndicatedInPageControl") ^ 1);
}

- (int64_t)_adjustPageIndexFromPageControl:(int64_t)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  v4 = -[SBFolderView _adjustPageIndexForPageControl:](&v6, sel__adjustPageIndexForPageControl_, a3);
  return (int64_t)v4
       + (-[SBRootFolderView _leadingCustomViewShouldBeIndicatedInPageControl](self, "_leadingCustomViewShouldBeIndicatedInPageControl") ^ 1);
}

- (void)_forceLayoutPageControl
{
  void *v3;
  _OWORD v4[20];
  uint64_t v5;

  v5 = 0;
  memset(v4, 0, sizeof(v4));
  -[SBRootFolderView getMetrics:](self, "getMetrics:", v4);
  -[SBRootFolderView layoutPageControlWithMetrics:](self, "layoutPageControlWithMetrics:", v4);
  -[SBRootFolderView scrollAccessoryView](self, "scrollAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");
  objc_msgSend(v3, "layoutIfNeeded");

}

- (UIEdgeInsets)statusBarInsetsForDockEdge:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  -[SBRootFolderView currentDockOffscreenFraction](self, "currentDockOffscreenFraction");
  -[SBRootFolderView _statusBarInsetsForDockEdge:dockOffscreenPercentage:](self, "_statusBarInsetsForDockEdge:dockOffscreenPercentage:", a3);
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (_SBRootFolderLayoutWrapperView)searchableLeadingCustomWrapperView
{
  -[SBRootFolderView _setupSearchBackdropViewIfNecessary](self, "_setupSearchBackdropViewIfNecessary");
  return self->_searchableLeadingCustomWrapperView;
}

- (SBSearchBackdropView)searchBackdropView
{
  -[SBRootFolderView _setupSearchBackdropViewIfNecessary](self, "_setupSearchBackdropViewIfNecessary");
  return self->_searchBackdropView;
}

- (SBSearchBackdropView)trailingCustomBackdropView
{
  -[SBRootFolderView _setupTrailingCustomBackdropViewIfNecessary](self, "_setupTrailingCustomBackdropViewIfNecessary");
  return self->_trailingCustomBackdropView;
}

- (UIView)trailingCustomSearchDimmingView
{
  -[SBRootFolderView _setupTrailingCustomDimmingViewIfNecessary](self, "_setupTrailingCustomDimmingViewIfNecessary");
  return self->_trailingCustomSearchDimmingView;
}

- (id)newDockBackgroundView
{
  void *v3;
  id v4;

  -[SBFolderView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v3, "backgroundViewForDockForRootFolderView:", self),
        (v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v4 = -[SBRootFolderView newDockBackgroundMaterialViewWithInitialWeighting:](self, "newDockBackgroundMaterialViewWithInitialWeighting:", 1.0);
  }

  return v4;
}

- (id)newDockBackgroundMaterialViewWithInitialWeighting:(double)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:options:initialWeighting:", 19, 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGroupNameBase:", 0);
  objc_msgSend(v3, "setGroupName:", CFSTR("WallpaperCaptureGroup"));
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "setGroupNamespace:", *MEMORY[0x1E0CD2958]);
  return v3;
}

- (id)newHomeScreenButtonBackgroundView
{
  void *v3;
  void *v4;

  -[SBFolderView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v3, "backgroundViewForEditingDoneButtonForRootFolderView:", self),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[SBIconView componentBackgroundView](SBIconView, "componentBackgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)makeTitledButtonOfClass:(Class)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[SBRootFolderView rootFolderVisualConfiguration](self, "rootFolderVisualConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBRootFolderView newHomeScreenButtonBackgroundView](self, "newHomeScreenButtonBackgroundView");
  v7 = [a3 alloc];
  v8 = (void *)objc_msgSend(v7, "initWithFrame:backgroundView:", v6, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v8, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editModeButtonContentEdgeInsets");
  objc_msgSend(v9, "setContentInsets:");
  objc_msgSend(v8, "setConfiguration:", v9);
  objc_msgSend(v5, "editModeButtonSize");
  objc_msgSend(v8, "setPreferredContentFittingSize:");
  objc_msgSend(v8, "materialView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderView legibilitySettings](self, "legibilitySettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLegibilityStyle:", objc_msgSend(v11, "style"));

  return v8;
}

+ (void)_getTopLeadingButtonFrame:(CGRect *)a3 topTrailingButtonFrame:(CGRect *)a4 inBounds:(CGRect)a5 forListLayout:(id)a6 withTranslationOffset:(double)a7 inRTL:(BOOL)a8
{
  _BOOL8 v8;
  double height;
  double width;
  double y;
  double x;
  id v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  CGSize v23;
  CGSize v24;
  CGPoint v25;
  CGSize v26;
  CGPoint v27;
  CGSize v28;

  v8 = a8;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v17 = a6;
  v18 = 28.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v17, "rootFolderVisualConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "editModeButtonSize");
      v18 = v22;
      goto LABEL_6;
    }
  }
  else
  {
    v20 = 0;
  }
  v21 = 0x4051000000000000;
LABEL_6:
  v27 = (CGPoint)0;
  v28.width = v18;
  *(_QWORD *)&v28.height = v21;
  v25 = (CGPoint)0;
  v26.width = v18;
  *(_QWORD *)&v26.height = v21;
  objc_msgSend(a1, "_getTopLeadingButtonFrame:topTrailingButtonFrame:inBounds:forVisualConfiguration:includingContentEdgeInsets:withTranslationOffset:inRTL:", &v27, &v25, v20, 0, v8, x, y, width, height, a7);
  if (a3)
  {
    v23 = v28;
    a3->origin = v27;
    a3->size = v23;
  }
  if (a4)
  {
    v24 = v26;
    a4->origin = v25;
    a4->size = v24;
  }

}

- (void)setShowsDoneButton:(BOOL)a3
{
  -[SBRootFolderView setShowsDoneButton:animated:](self, "setShowsDoneButton:animated:", a3, 0);
}

- (void)setShowsDoneButton:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  SBRootFolderView *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  SBRootFolderView *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  SBRootFolderView *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  if (self->_showsDoneButton != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_showsDoneButton = a3;
    -[SBRootFolderView doneButton](self, "doneButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (v7)
      {
        if (!v4)
          goto LABEL_12;
        goto LABEL_10;
      }
      -[SBRootFolderView makeTitledButtonOfClass:](self, "makeTitledButtonOfClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel_doneButtonTriggered_, 0x2000);
      -[SBRootFolderView setDoneButton:](self, "setDoneButton:", v12);
      v37 = 0;
      v38 = 0;
      -[SBRootFolderView bounds](self, "bounds");
      objc_msgSend(v12, "sizeThatFits:", v13, v14);
      v16 = v15;
      v18 = v17;
      v19 = (void *)MEMORY[0x1E0DC3F10];
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __48__SBRootFolderView_setShowsDoneButton_animated___block_invoke;
      v34[3] = &unk_1E8D87660;
      v8 = v12;
      v39 = v16;
      v40 = v18;
      v35 = v8;
      v36 = self;
      objc_msgSend(v19, "performWithoutAnimation:", v34);

      if (v4)
      {
LABEL_10:
        v20 = (void *)MEMORY[0x1E0DC3F10];
        v21 = MEMORY[0x1E0C809B0];
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __48__SBRootFolderView_setShowsDoneButton_animated___block_invoke_2;
        v32[3] = &unk_1E8D84C50;
        v22 = v8;
        v33 = v22;
        objc_msgSend(v20, "performWithoutAnimation:", v32);
        v23 = (void *)MEMORY[0x1E0DC3F10];
        v29[0] = v21;
        v29[1] = 3221225472;
        v29[2] = __48__SBRootFolderView_setShowsDoneButton_animated___block_invoke_3;
        v29[3] = &unk_1E8D84EF0;
        v8 = v22;
        v30 = v8;
        v31 = self;
        objc_msgSend(v23, "animateWithDuration:animations:", v29, 0.2);

        v11 = v33;
        goto LABEL_11;
      }
    }
    else
    {
      if (v4)
      {
        v9 = (void *)MEMORY[0x1E0DC3F10];
        v10 = MEMORY[0x1E0C809B0];
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __48__SBRootFolderView_setShowsDoneButton_animated___block_invoke_4;
        v27[3] = &unk_1E8D84C50;
        v28 = v7;
        v24[0] = v10;
        v24[1] = 3221225472;
        v24[2] = __48__SBRootFolderView_setShowsDoneButton_animated___block_invoke_5;
        v24[3] = &unk_1E8D853D8;
        v8 = v28;
        v25 = v8;
        v26 = self;
        objc_msgSend(v9, "animateWithDuration:animations:completion:", v27, v24, 0.2);

        v11 = v28;
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(v7, "removeFromSuperview");
      -[SBRootFolderView setDoneButton:](self, "setDoneButton:", 0);
    }
LABEL_12:

  }
}

uint64_t __48__SBRootFolderView_setShowsDoneButton_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

uint64_t __48__SBRootFolderView_setShowsDoneButton_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __48__SBRootFolderView_setShowsDoneButton_animated___block_invoke_3(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(*(_QWORD *)(a1 + 40) + 1048));
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v2, "setTransform:", v5);
}

uint64_t __48__SBRootFolderView_setShowsDoneButton_animated___block_invoke_4(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __48__SBRootFolderView_setShowsDoneButton_animated___block_invoke_5(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "removeFromSuperview");
    return objc_msgSend(*(id *)(v2 + 40), "setDoneButton:", 0);
  }
  return result;
}

- (void)setShowsAddWidgetButton:(BOOL)a3
{
  -[SBRootFolderView setShowsAddWidgetButton:animated:](self, "setShowsAddWidgetButton:animated:", a3, 0);
}

- (void)setShowsAddWidgetButton:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  SBRootFolderView *v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  SBRootFolderView *v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  SBRootFolderView *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  id location;
  _QWORD v72[5];

  v72[3] = *MEMORY[0x1E0C80C00];
  if (self->_showsAddWidgetButton != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_showsAddWidgetButton = a3;
    -[SBRootFolderView widgetButton](self, "widgetButton");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("avocado-widget-add-button"));
    if (v5)
    {
      if (!v7)
      {
        -[SBRootFolderView makeTitledButtonOfClass:](self, "makeTitledButtonOfClass:", objc_opt_class());
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, self);
        v9 = (void *)MEMORY[0x1E0DC3428];
        SBHBundle();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("EDIT_MENU_ADD_WIDGET"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("widget.small.badge.plus"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v69[0] = MEMORY[0x1E0C809B0];
        v69[1] = 3221225472;
        v69[2] = __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke;
        v69[3] = &unk_1E8D87688;
        objc_copyWeak(&v70, &location);
        objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v11, v12, CFSTR("addwidget"), v69);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = -[SBFolderView isRTL](self, "isRTL");
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "userInterfaceIdiom");

        if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        {
          if ((unint64_t)(-[SBFolderView orientation](self, "orientation") - 3) > 1)
          {
            v16 = CFSTR("apps.ipad.badge.paintbrush");
            v17 = CFSTR("apps.ipad.badge.paintbrush.rtl");
          }
          else
          {
            v16 = CFSTR("apps.ipad.landscape.badge.paintbrush");
            v17 = CFSTR("apps.ipad.landscape.badge.paintbrush.rtl");
          }
        }
        else
        {
          v16 = CFSTR("apps.iphone.badge.paintbrush");
          v17 = CFSTR("apps.iphone.badge.paintbrush.rtl");
        }
        if (v13)
          v16 = (__CFString *)v17;
        v45 = v16;
        objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("paintbrush"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v21 = (void *)MEMORY[0x1E0DC3428];
        SBHBundle();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("EDIT_MENU_CUSTOMIZE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = MEMORY[0x1E0C809B0];
        v67[1] = 3221225472;
        v67[2] = __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_2;
        v67[3] = &unk_1E8D87688;
        objc_copyWeak(&v68, &location);
        objc_msgSend(v21, "actionWithTitle:image:identifier:handler:", v23, v20, CFSTR("customize"), v67);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = (void *)MEMORY[0x1E0DC3428];
        SBHBundle();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("EDIT_MENU_EDIT_PAGES"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)MEMORY[0x1E0DC3870];
        SBHBundle();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "imageNamed:inBundle:", CFSTR("EditPages"), v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_3;
        v65[3] = &unk_1E8D87688;
        objc_copyWeak(&v66, &location);
        objc_msgSend(v24, "actionWithTitle:image:identifier:handler:", v26, v29, CFSTR("pageManagement"), v65);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = (void *)MEMORY[0x1E0DC39D0];
        v72[0] = v47;
        v72[1] = v46;
        v72[2] = v30;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 3);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "menuWithChildren:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "setMenu:", v33);
        objc_msgSend(v8, "setShowsMenuAsPrimaryAction:", 1);
        -[SBRootFolderView setWidgetButton:](self, "setWidgetButton:", v8);
        -[SBRootFolderView bounds](self, "bounds");
        objc_msgSend(v8, "sizeThatFits:", v34, v35);
        v37 = v36;
        v39 = v38;
        v40 = (void *)MEMORY[0x1E0DC3F10];
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_4;
        v58[3] = &unk_1E8D87660;
        v7 = v8;
        v61 = 0;
        v62 = 0;
        v63 = v37;
        v64 = v39;
        v59 = v7;
        v60 = self;
        objc_msgSend(v40, "performWithoutAnimation:", v58);

        objc_destroyWeak(&v66);
        objc_destroyWeak(&v68);

        objc_destroyWeak(&v70);
        objc_destroyWeak(&location);
      }
      if (v4)
      {
        v41 = MEMORY[0x1E0C809B0];
        v42 = (void *)MEMORY[0x1E0DC3F10];
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_5;
        v56[3] = &unk_1E8D84C50;
        v43 = v7;
        v57 = v43;
        objc_msgSend(v42, "performWithoutAnimation:", v56);
        v44 = (void *)MEMORY[0x1E0DC3F10];
        v53[0] = v41;
        v53[1] = 3221225472;
        v53[2] = __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_6;
        v53[3] = &unk_1E8D84EF0;
        v7 = v43;
        v54 = v7;
        v55 = self;
        objc_msgSend(v44, "animateWithDuration:animations:", v53, 0.2);

      }
    }
    else if (v4)
    {
      v18 = MEMORY[0x1E0C809B0];
      v19 = (void *)MEMORY[0x1E0DC3F10];
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_7;
      v51[3] = &unk_1E8D84C50;
      v52 = v7;
      v48[0] = v18;
      v48[1] = 3221225472;
      v48[2] = __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_8;
      v48[3] = &unk_1E8D853D8;
      v7 = v52;
      v49 = v7;
      v50 = self;
      objc_msgSend(v19, "animateWithDuration:animations:completion:", v51, v48, 0.2);

    }
    else
    {
      objc_msgSend(v7, "removeFromSuperview");
      -[SBRootFolderView setWidgetButton:](self, "setWidgetButton:", 0);
    }

  }
}

void __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "widgetButtonTriggered:", v4);
}

void __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "iconTintButtonTriggered:", v4);
}

void __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "enterPageManagementUIWithCompletionHandler:", 0);

}

uint64_t __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

uint64_t __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_5(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_6(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(*(_QWORD *)(a1 + 40) + 1048));
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v2, "setTransform:", v5);
}

uint64_t __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_7(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __53__SBRootFolderView_setShowsAddWidgetButton_animated___block_invoke_8(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "removeFromSuperview");
    return objc_msgSend(*(id *)(v2 + 40), "setWidgetButton:", 0);
  }
  return result;
}

- (void)setTitledButtonsAlpha:(double)a3
{
  NSObject *v5;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_titledButtonsAlpha != a3)
  {
    self->_titledButtonsAlpha = a3;
    SBLogRootController();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134349056;
      v7 = a3;
      _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "SBRootFolderView setTitledButtonsAlpha: %{public}f", (uint8_t *)&v6, 0xCu);
    }

    -[SBTitledHomeScreenButton setAlpha:](self->_doneButton, "setAlpha:", a3);
    -[SBTitledHomeScreenButton setAlpha:](self->_widgetButton, "setAlpha:", a3);
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  objc_super v12;

  v4 = a4;
  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBRootFolderView;
  -[SBFolderView setEditing:animated:](&v12, sel_setEditing_animated_);
  if (-[SBRootFolderView folderPageManagementAllowedOrientations](self, "folderPageManagementAllowedOrientations"))
  {
    v7 = 0.3;
    if (!v4)
      v7 = 0.0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__SBRootFolderView_setEditing_animated___block_invoke;
    v11[3] = &unk_1E8D84C50;
    v11[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v11, v7);
    -[SBRootFolderView setNeedsLayout](self, "setNeedsLayout");
    -[SBRootFolderView layoutIfNeeded](self, "layoutIfNeeded");
  }
  if (v5)
  {
    -[SBRootFolderView requirePageDotsVisibilityForReason:](self, "requirePageDotsVisibilityForReason:", CFSTR("editing"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRootFolderView setEditingPageDotsVisibilityAssertion:](self, "setEditingPageDotsVisibilityAssertion:", v8);
    -[SBRootFolderView scrollAccessoryAuxiliaryView](self, "scrollAccessoryAuxiliaryView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SBFolderView pageControl](self, "pageControl");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cancelTapGesture");

    }
  }
  else
  {
    -[SBRootFolderView editingPageDotsVisibilityAssertion](self, "editingPageDotsVisibilityAssertion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRootFolderView setEditingPageDotsVisibilityAssertion:](self, "setEditingPageDotsVisibilityAssertion:", 0);
    objc_msgSend(v8, "invalidate");
    -[SBRootFolderView exitPageManagementUIWithCompletionHandler:](self, "exitPageManagementUIWithCompletionHandler:", 0);
  }

}

uint64_t __40__SBRootFolderView_setEditing_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePageControlConfiguration");
}

- (void)doneButtonTriggered:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__SBRootFolderView_doneButtonTriggered___block_invoke;
  v3[3] = &unk_1E8D84C50;
  v3[4] = self;
  -[SBRootFolderView exitPageManagementUIWithCompletionHandler:](self, "exitPageManagementUIWithCompletionHandler:", v3);
}

void __40__SBRootFolderView_doneButtonTriggered___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "rootFolderViewWantsToEndEditing:", *(_QWORD *)(a1 + 32));

}

- (void)widgetButtonTriggered:(id)a3
{
  id v4;

  -[SBFolderView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "rootFolderViewWantsWidgetEditingViewControllerPresented:", self);

}

- (void)iconTintButtonTriggered:(id)a3
{
  id v4;

  -[SBFolderView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "rootFolderViewWantsIconTintViewControllerPresented:", self);

}

- (BOOL)isPageManagementUITransitioningOutOfVisible
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[SBRootFolderView transitioningNewSpecialLayoutManager](self, "transitioningNewSpecialLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRootFolderView transitioningOldSpecialLayoutManager](self, "transitioningOldSpecialLayoutManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_isKindOfClass() & (v3 == 0);

  return v6;
}

- (void)enterPageManagementUIWithCompletionHandler:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  char isKindOfClass;
  SBRootFolderViewPageManagementLayoutManager *v8;
  void *v9;
  void (**v10)(void);

  v10 = (void (**)(void))a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
  -[SBRootFolderView transitioningNewSpecialLayoutManager](self, "transitioningNewSpecialLayoutManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBRootFolderView isPageManagementUIVisible](self, "isPageManagementUIVisible");
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if (v5 || (isKindOfClass & 1) != 0)
  {
    if (v10)
      v10[2]();
  }
  else
  {
    v8 = objc_alloc_init(SBRootFolderViewPageManagementLayoutManager);
    -[SBRootFolderViewPageManagementLayoutManager setAllowsEditing:](v8, "setAllowsEditing:", 1);
    -[SBRootFolderView setSpecialLayoutManager:completionHandler:](self, "setSpecialLayoutManager:completionHandler:", v8, v10);

  }
  objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "emitEvent:", 54);

}

- (void)exitPageManagementUIWithCompletionHandler:(id)a3
{
  _BOOL4 v4;
  BOOL v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
  v4 = -[SBRootFolderView isPageManagementUIVisible](self, "isPageManagementUIVisible");
  v5 = -[SBRootFolderView isPageManagementUITransitioningOutOfVisible](self, "isPageManagementUITransitioningOutOfVisible");
  if (v4 && !v5)
  {
    -[SBRootFolderView setSpecialLayoutManager:completionHandler:](self, "setSpecialLayoutManager:completionHandler:", 0, v7);
LABEL_6:
    v6 = v7;
    goto LABEL_7;
  }
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    goto LABEL_6;
  }
LABEL_7:

}

- (void)updatePageControlConfiguration
{
  int v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  -[SBRootFolderView folderPageManagementAllowedOrientations](self, "folderPageManagementAllowedOrientations");
  -[SBFolderView orientation](self, "orientation");
  v3 = SBFInterfaceOrientationMaskContainsInterfaceOrientation();
  v4 = v3 & -[SBFolderView isEditing](self, "isEditing");
  -[SBRootFolderView scrollAccessoryAuxiliaryView](self, "scrollAccessoryAuxiliaryView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
    v5 = 1;
  else
    v5 = v4;
  -[SBFolderView pageControl](self, "pageControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRootFolderView scrollAccessoryView](self, "scrollAccessoryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidesForSinglePage:", v5 ^ 1);
  objc_msgSend(v6, "setActsAsButton:", v5);
  if (v15)
  {
    objc_msgSend(v7, "auxiliaryView");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8
      || (v9 = (void *)v8,
          objc_msgSend(v7, "backgroundView"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          !v10))
    {
      objc_msgSend(v7, "setAuxiliaryView:", v15);
      -[SBRootFolderView scrollAccessoryBackgroundView](self, "scrollAccessoryBackgroundView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBackgroundView:", v11);

    }
    v12 = objc_alloc(MEMORY[0x1E0DC4270]);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithContentColor:", v13);

  }
  else
  {
    objc_msgSend(v7, "setBackgroundView:", 0);
    -[SBFolderView legibilitySettings](self, "legibilitySettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "setLegibilitySettings:", v14);

}

- (void)updateAccessibilityTintColors
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBRootFolderView;
  -[SBFolderView updateAccessibilityTintColors](&v3, sel_updateAccessibilityTintColors);
  -[SBDockView updateAccessibilityTintColor](self->_dockView, "updateAccessibilityTintColor");
}

- (void)folderDidChange
{
  void *v3;
  SBDockIconListView *dockListView;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  -[SBFolderView folderDidChange](&v6, sel_folderDidChange);
  -[SBFolderView folder](self, "folder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dockListView = self->_dockListView;
  objc_msgSend(v3, "dock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView setModel:](dockListView, "setModel:", v5);

}

- (void)setPullDownSearchVisibilityProgress:(double)a3
{
  void *v5;

  if (self->_pullDownSearchVisibilityProgress != a3
    || BSFloatGreaterThanOrEqualToFloat()
    && (-[SBRootFolderView searchPresenter](self, "searchPresenter"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    self->_pullDownSearchVisibilityProgress = a3;
    -[SBRootFolderView _layoutSubviewsForPulldownSearch](self, "_layoutSubviewsForPulldownSearch");
    -[SBRootFolderView _animateViewsForPullingToSearch](self, "_animateViewsForPullingToSearch");
  }
}

- (void)setLeadingCustomViewVisibilityProgress:(double)a3
{
  if (self->_leadingCustomViewVisibilityProgress != a3)
  {
    self->_leadingCustomViewVisibilityProgress = a3;
    -[SBRootFolderView _animateViewsForScrollingToLeadingOrTrailingCustomView](self, "_animateViewsForScrollingToLeadingOrTrailingCustomView");
  }
}

- (void)setTrailingCustomViewVisibilityProgress:(double)a3
{
  if (self->_trailingCustomViewVisibilityProgress != a3)
  {
    self->_trailingCustomViewVisibilityProgress = a3;
    -[SBRootFolderView _animateViewsForScrollingToLeadingOrTrailingCustomView](self, "_animateViewsForScrollingToLeadingOrTrailingCustomView");
    -[SBRootFolderView _updateDockViewZOrdering](self, "_updateDockViewZOrdering");
  }
}

- (void)setSpecialLayoutManager:(id)a3
{
  -[SBRootFolderView setSpecialLayoutManager:completionHandler:](self, "setSpecialLayoutManager:completionHandler:", a3, 0);
}

- (void)setSpecialLayoutManager:(id)a3 completionHandler:(id)a4
{
  SBRootFolderViewLayoutManager *v6;
  id v7;
  void *v8;
  SBRootFolderViewLayoutManager *specialLayoutManager;
  SBRootFolderViewLayoutManager *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  int v21;
  void *v22;
  char v23;
  void *v24;
  id v25;
  uint64_t v26;
  SBRootFolderViewLayoutManager *v27;
  SBRootFolderViewLayoutManager *v28;
  void *v29;
  void *v30;
  id v31;
  SBRootFolderViewLayoutManager *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  SBRootFolderViewLayoutManager **p_specialLayoutManager;
  void *v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  SBRootFolderViewLayoutManager *v45;
  SBRootFolderView *v46;
  char v47;
  char v48;
  _QWORD v49[4];
  id v50;
  _QWORD aBlock[4];
  SBRootFolderViewLayoutManager *v52;
  SBRootFolderView *v53;
  SBRootFolderViewLayoutManager *v54;
  id v55;

  v6 = (SBRootFolderViewLayoutManager *)a3;
  v7 = a4;
  v8 = v7;
  p_specialLayoutManager = &self->_specialLayoutManager;
  specialLayoutManager = self->_specialLayoutManager;
  if (specialLayoutManager == v6)
  {
    if (v7)
      (*((void (**)(id))v7 + 2))(v7);
  }
  else
  {
    v10 = specialLayoutManager;
    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "iconEditingSettings");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v11, "defaultSpringDuration");
    v13 = v12;
    v36 = (void *)v11;
    objc_msgSend((id)v11, "defaultSpringDampingRatio");
    v15 = v14;
    LOBYTE(v11) = UIAccessibilityIsReduceMotionEnabled();
    v16 = -[SBRootFolderViewLayoutManager isTrackingActiveOrDroppingIconDrags](v10, "isTrackingActiveOrDroppingIconDrags");
    v17 = 0;
    v40 = v8;
    if ((v11 & 1) == 0 && (v16 & 1) == 0)
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F38]), "initWithDuration:dampingRatio:animations:", 0, v13, v15);
    -[SBFolderView delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    v21 = isKindOfClass & 1;
    objc_opt_self();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_isKindOfClass();

    if ((v23 & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SBRootFolderViewLayoutManager userInfo](v10, "userInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "rootFolderView:willDismissPageManagementUsingAnimator:context:", self, v17, v24);

    }
    v35 = v23 & 1;
    if (v21 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v18, "rootFolderView:willPresentPageManagementWithLayoutManager:animator:context:", self, v6, v17, v25);
      -[SBRootFolderViewLayoutManager setUserInfo:](v6, "setUserInfo:", v25);

    }
    v26 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__SBRootFolderView_setSpecialLayoutManager_completionHandler___block_invoke;
    aBlock[3] = &unk_1E8D876B0;
    v27 = v10;
    v52 = v27;
    v53 = self;
    v28 = v6;
    v54 = v28;
    v55 = v40;
    v49[0] = v26;
    v49[1] = 3221225472;
    v49[2] = __62__SBRootFolderView_setSpecialLayoutManager_completionHandler___block_invoke_2;
    v49[3] = &unk_1E8D876D8;
    v29 = _Block_copy(aBlock);
    v50 = v29;
    objc_msgSend(v17, "addCompletion:", v49);
    -[SBRootFolderViewLayoutManager setRootFolderView:](v28, "setRootFolderView:", self);
    -[SBRootFolderView layoutManager](self, "layoutManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      objc_storeStrong((id *)p_specialLayoutManager, a3);
    -[SBRootFolderView setTransitioningNewSpecialLayoutManager:](self, "setTransitioningNewSpecialLayoutManager:", v28);
    -[SBRootFolderView setTransitioningOldSpecialLayoutManager:](self, "setTransitioningOldSpecialLayoutManager:", v27);
    objc_msgSend(v30, "transitionToActive:inFolderView:usingAnimator:", 0, self, v17);
    -[SBRootFolderViewLayoutManager transitionToActive:inFolderView:usingAnimator:](v28, "transitionToActive:inFolderView:usingAnimator:", 1, self, v17);
    v43[0] = v26;
    v43[1] = 3221225472;
    v43[2] = __62__SBRootFolderView_setSpecialLayoutManager_completionHandler___block_invoke_3;
    v43[3] = &unk_1E8D87700;
    v47 = v35;
    v48 = v21;
    v31 = v18;
    v44 = v31;
    v32 = v27;
    v45 = v32;
    v46 = self;
    v33 = _Block_copy(v43);
    v34 = v33;
    if (v17)
    {
      v41[0] = v26;
      v41[1] = 3221225472;
      v41[2] = __62__SBRootFolderView_setSpecialLayoutManager_completionHandler___block_invoke_4;
      v41[3] = &unk_1E8D876D8;
      v42 = v33;
      objc_msgSend(v17, "addCompletion:", v41);
      objc_msgSend(v17, "startAnimation");

    }
    else
    {
      (*((void (**)(void *, uint64_t))v33 + 2))(v33, 1);
      -[SBRootFolderViewLayoutManager setRootFolderView:](v32, "setRootFolderView:", 0);
      objc_storeStrong((id *)p_specialLayoutManager, a3);
      objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", self, 5242880, &__block_literal_global_22, v29, 0.3);
    }
    v8 = v40;

  }
}

uint64_t __62__SBRootFolderView_setSpecialLayoutManager_completionHandler___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t result;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRootFolderView:", 0);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1360), *(id *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "transitioningOldSpecialLayoutManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);

    if (v3 == v4)
      objc_msgSend(*(id *)(a1 + 40), "setTransitioningOldSpecialLayoutManager:", 0);
    objc_msgSend(*(id *)(a1 + 40), "transitioningNewSpecialLayoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 48);

    if (v5 == v6)
      objc_msgSend(*(id *)(a1 + 40), "setTransitioningNewSpecialLayoutManager:", 0);
  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __62__SBRootFolderView_setSpecialLayoutManager_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0);
}

uint64_t __62__SBRootFolderView_setSpecialLayoutManager_completionHandler___block_invoke_3(uint64_t result, int a2)
{
  uint64_t v2;
  void *v3;

  if (a2)
  {
    v2 = result;
    if (*(_BYTE *)(result + 56))
    {
      if (!*(_BYTE *)(result + 57))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(*(id *)(v2 + 40), "userInfo");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v2 + 32), "rootFolderView:didDismissPageManagementWithLayoutManager:context:", *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 40), v3);

        }
        return objc_msgSend(*(id *)(v2 + 40), "setUserInfo:", 0);
      }
    }
  }
  return result;
}

uint64_t __62__SBRootFolderView_setSpecialLayoutManager_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0);
}

- (void)pageControlDidReceiveButtonTap:(id)a3
{
  id v4;

  if (-[SBFolderView isEditing](self, "isEditing", a3))
  {
    -[SBRootFolderView enterPageManagementUIWithCompletionHandler:](self, "enterPageManagementUIWithCompletionHandler:", 0);
  }
  else
  {
    -[SBFolderView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "rootFolderViewWantsSearchPresented:", self);

  }
}

- (void)pageControlDidBeginScrubbing:(id)a3
{
  void *v4;
  id v5;

  -[SBRootFolderView scrubbingPageDotsVisibilityAssertion](self, "scrubbingPageDotsVisibilityAssertion", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SBRootFolderView requirePageDotsVisibilityForReason:](self, "requirePageDotsVisibilityForReason:", CFSTR("scrubbing"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SBRootFolderView setScrubbingPageDotsVisibilityAssertion:](self, "setScrubbingPageDotsVisibilityAssertion:", v5);

  }
}

- (void)pageControlDidEndScrubbing:(id)a3
{
  id v4;

  -[SBRootFolderView scrubbingPageDotsVisibilityAssertion](self, "scrubbingPageDotsVisibilityAssertion", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBRootFolderView setScrubbingPageDotsVisibilityAssertion:](self, "setScrubbingPageDotsVisibilityAssertion:", 0);
  objc_msgSend(v4, "invalidate");

}

- (void)minimumHomeScreenScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBRootFolderView;
  -[SBFolderView minimumHomeScreenScaleDidChange](&v3, sel_minimumHomeScreenScaleDidChange);
  -[SBDockView minimumHomeScreenScaleDidChange](self->_dockView, "minimumHomeScreenScaleDidChange");
}

- (id)_createIconListViewForList:(id)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderView;
  -[SBFolderView _createIconListViewForList:](&v5, sel__createIconListViewForList_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAdjustsColumnPositionsForFullScreenWidth:", 1);
  return v3;
}

- (id)iconListViewAtPoint:(CGPoint)a3
{
  double y;
  double x;
  SBDockIconListView *v6;
  SBDockIconListView *dockListView;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_super v18;
  CGPoint v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  v18.receiver = self;
  v18.super_class = (Class)SBRootFolderView;
  -[SBFolderView iconListViewAtPoint:](&v18, sel_iconListViewAtPoint_);
  v6 = (SBDockIconListView *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    dockListView = self->_dockListView;
    -[SBDockIconListView bounds](dockListView, "bounds");
    -[SBDockIconListView convertRect:toView:](dockListView, "convertRect:toView:", self);
    v19.x = x;
    v19.y = y;
    if (CGRectContainsPoint(v20, v19))
    {
      v6 = self->_dockListView;
    }
    else
    {
      -[SBRootFolderView leadingCustomViewController](self, "leadingCustomViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        -[SBRootFolderView leadingCustomViewController](self, "leadingCustomViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "convertPoint:fromView:", self, x, y);
        v13 = v12;
        v15 = v14;

        objc_msgSend(v10, "iconListViewQueryable");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "iconListViewAtPoint:", v13, v15);
        v6 = (SBDockIconListView *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v6 = 0;
      }
    }
  }
  return v6;
}

- (void)resetIconListViews
{
  SBDockIconListView *dockListView;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  -[SBFolderView resetIconListViews](&v6, sel_resetIconListViews);
  dockListView = self->_dockListView;
  -[SBFolderView folder](self, "folder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView setModel:](dockListView, "setModel:", v5);

  -[SBIconListView showAllIcons](self->_dockListView, "showAllIcons");
  -[SBIconListView layoutIconsNow](self->_dockListView, "layoutIconsNow");
}

- (void)tearDownListViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBRootFolderView;
  -[SBFolderView tearDownListViews](&v3, sel_tearDownListViews);
  -[SBIconListView setModel:](self->_dockListView, "setModel:", 0);
}

+ (id)defaultIconLocation
{
  return CFSTR("SBIconLocationRoot");
}

- (id)iconLocationForListsWithNonDefaultSizedIcons
{
  void *v3;
  void *v4;

  -[SBFolderView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "iconLocationForListsWithNonDefaultSizedIconsForRootFolderView:", self);
  else
    objc_msgSend((id)objc_opt_class(), "defaultIconLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)visibleIconListViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBRootFolderView;
  -[SBFolderView visibleIconListViews](&v7, sel_visibleIconListViews);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRootFolderView dockListView](self, "dockListView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && -[SBRootFolderView isDockVisible](self, "isDockVisible"))
  {
    objc_msgSend(v3, "arrayByAddingObject:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }

  return v3;
}

- (void)enumerateScrollViewPageViewsUsingBlock:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  _SBRootFolderLayoutWrapperView *searchableLeadingCustomWrapperView;
  _SBRootFolderLayoutWrapperView *searchableTrailingCustomWrapperView;
  objc_super v8;
  char v9;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  searchableLeadingCustomWrapperView = self->_searchableLeadingCustomWrapperView;
  if (!searchableLeadingCustomWrapperView
    || (v9 = 0,
        (*((void (**)(id, _SBRootFolderLayoutWrapperView *, char *))v4 + 2))(v4, searchableLeadingCustomWrapperView, &v9), !v9))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBRootFolderView;
    -[SBFolderView enumerateScrollViewPageViewsUsingBlock:](&v8, sel_enumerateScrollViewPageViewsUsingBlock_, v5);
    searchableTrailingCustomWrapperView = self->_searchableTrailingCustomWrapperView;
    if (searchableTrailingCustomWrapperView)
    {
      v9 = 0;
      ((void (**)(_QWORD, _SBRootFolderLayoutWrapperView *, char *))v5)[2](v5, searchableTrailingCustomWrapperView, &v9);
    }
  }

}

- (void)setIdleText:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  UILabel *v12;
  UILabel *idleTextView;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  void *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  UILabel *v24;
  void *v25;
  uint64_t v26;
  UILabel *v27;
  _QWORD v28[4];
  id v29;
  UILabel *v30;
  SBRootFolderView *v31;
  _QWORD v32[4];
  UILabel *v33;
  id v34;
  SBRootFolderView *v35;

  v4 = (void *)MEMORY[0x1E0CB3500];
  v5 = a3;
  objc_msgSend(v4, "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend((id)v7, "length"))
  {

    v7 = 0;
  }
  -[UILabel text](self->_idleTextView, "text");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8 | v7;

  if (v9)
  {
    -[UILabel text](self->_idleTextView, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = BSEqualStrings();

    if ((v11 & 1) == 0)
    {
      if (!self->_idleTextView)
      {
        v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        idleTextView = self->_idleTextView;
        self->_idleTextView = v12;

        -[UILabel setTextAlignment:](self->_idleTextView, "setTextAlignment:", 1);
        v14 = self->_idleTextView;
        objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 13.0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v14, "setFont:", v15);

        v16 = self->_idleTextView;
        -[SBFolderView legibilitySettingsForIconListViews](self, "legibilitySettingsForIconListViews");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "primaryColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          -[UILabel setTextColor:](v16, "setTextColor:", v18);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v16, "setTextColor:", v19);

        }
        v20 = self->_idleTextView;
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v20, "setBackgroundColor:", v21);

        -[SBFolderView scalingView](self, "scalingView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addSubview:", self->_idleTextView);

        -[UILabel setAlpha:](self->_idleTextView, "setAlpha:", 0.0);
      }
      if (v7)
        v23 = v7;
      else
        v23 = 0;
      -[UILabel setText:](self->_idleTextView, "setText:", v23);
      -[UILabel setMarqueeEnabled:](self->_idleTextView, "setMarqueeEnabled:", v7 != 0);
      -[UILabel setMarqueeRunning:](self->_idleTextView, "setMarqueeRunning:", v7 != 0);
      v24 = self->_idleTextView;
      v25 = (void *)MEMORY[0x1E0DC3F10];
      v26 = MEMORY[0x1E0C809B0];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __32__SBRootFolderView_setIdleText___block_invoke;
      v32[3] = &unk_1E8D84F18;
      v33 = v24;
      v34 = (id)v7;
      v35 = self;
      v28[0] = v26;
      v28[1] = 3221225472;
      v28[2] = __32__SBRootFolderView_setIdleText___block_invoke_2;
      v28[3] = &unk_1E8D87728;
      v29 = v34;
      v30 = v33;
      v31 = self;
      v27 = v33;
      objc_msgSend(v25, "animateWithDuration:animations:completion:", v32, v28, 0.3);

    }
  }

}

uint64_t __32__SBRootFolderView_setIdleText___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;

  v2 = *(void **)(a1 + 32);
  v3 = 1.0;
  if (!*(_QWORD *)(a1 + 40))
    v3 = 0.0;
  objc_msgSend(v2, "setAlpha:", v3);
  objc_msgSend(*(id *)(a1 + 48), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 48), "layoutIfNeeded");
}

void __32__SBRootFolderView_setIdleText___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
    v2 = *(void **)(a1 + 40);
    v3 = *(_QWORD *)(a1 + 48);
    if (v2 == *(void **)(v3 + 1232))
    {
      *(_QWORD *)(v3 + 1232) = 0;

    }
  }
}

- (void)transitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)SBRootFolderView;
  -[SBFolderView transitionToSize:withTransitionCoordinator:](&v9, sel_transitionToSize_withTransitionCoordinator_, v7, width, height);
  if (-[SBRootFolderView folderPageManagementAllowedOrientations](self, "folderPageManagementAllowedOrientations"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__SBRootFolderView_transitionToSize_withTransitionCoordinator___block_invoke;
    v8[3] = &unk_1E8D85400;
    v8[4] = self;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);
  }

}

uint64_t __63__SBRootFolderView_transitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePageControlConfiguration");
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderView;
  -[SBFolderView scrollViewWillBeginDragging:](&v5, sel_scrollViewWillBeginDragging_, v4);
  if (objc_msgSend(v4, "isScrollAnimating"))
    objc_msgSend(v4, "stopScrollingAndZooming");
  -[SBRootFolderView _captureInitialSearchScrollTrackingState](self, "_captureInitialSearchScrollTrackingState");

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;
  objc_super v10;

  y = a4.y;
  x = a4.x;
  a5->x = self->_scrollingAdjustment + a5->x;
  v9 = a3;
  -[SBRootFolderView setScrollingAdjustment:](self, "setScrollingAdjustment:", 0.0);
  v10.receiver = self;
  v10.super_class = (Class)SBRootFolderView;
  -[SBFolderView scrollViewWillEndDragging:withVelocity:targetContentOffset:](&v10, sel_scrollViewWillEndDragging_withVelocity_targetContentOffset_, v9, a5, x, y);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  -[SBFolderView scrollViewDidEndDragging:willDecelerate:](&v6, sel_scrollViewDidEndDragging_willDecelerate_, a3);
  if (!a4)
    -[SBRootFolderView _cleanUpAfterScrolling](self, "_cleanUpAfterScrolling");
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  void *v4;
  char v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  -[SBFolderView scrollViewDidEndDecelerating:](&v6, sel_scrollViewDidEndDecelerating_, a3);
  -[SBFolderView scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTracking");

  if ((v5 & 1) == 0)
    -[SBRootFolderView _cleanUpAfterScrolling](self, "_cleanUpAfterScrolling");
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  void *v4;
  BOOL v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderView;
  -[SBFolderView scrollViewDidEndScrollingAnimation:](&v6, sel_scrollViewDidEndScrollingAnimation_, a3);
  -[SBFolderView scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isTracking") & 1) != 0)
  {

  }
  else
  {
    v5 = -[SBFolderView _shouldIgnoreScrollingDidEndNotifications](self, "_shouldIgnoreScrollingDidEndNotifications");

    if (!v5)
      -[SBRootFolderView _cleanUpAfterScrolling](self, "_cleanUpAfterScrolling");
  }
}

- (void)iconScrollViewDidCancelTouchTracking:(id)a3
{
  double v4;
  double v5;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SBRootFolderView;
  -[SBFolderView iconScrollViewDidCancelTouchTracking:](&v8, sel_iconScrollViewDidCancelTouchTracking_, a3);
  -[SBRootFolderView leadingCustomViewVisibilityProgress](self, "leadingCustomViewVisibilityProgress");
  v5 = v4;
  if (-[SBFolderView currentPageIndex](self, "currentPageIndex") < 0 && v5 <= 0.0)
  {
    SBLogIcon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      _SBFLoggingMethodProem();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_INFO, "%{public}@ Home Screen page mismatch, forcing page zero", buf, 0xCu);

    }
    -[SBFolderView setCurrentPageIndex:animated:](self, "setCurrentPageIndex:animated:", -[SBFolderView defaultPageIndex](self, "defaultPageIndex"), 1);
  }
}

- (BOOL)shouldPinScrollingToFirstOrLastPageScrollOffsetForProposedScrollOffset:(CGPoint *)a3
{
  -[SBFolderView isRotating](self, "isRotating", a3);
  return 0;
}

- (BOOL)iconScrollView:(id)a3 shouldSetAutoscrollContentOffset:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  int64_t v11;
  BOOL v12;
  objc_super v14;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[SBRootFolderView window](self, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:", x, y);
  v10 = v9;
  if (((objc_msgSend(v8, "isRotating") & 1) != 0
     || -[SBRootFolderView allowsAutoscrollToLeadingCustomView](self, "allowsAutoscrollToLeadingCustomView")
     || (v11 = -[SBFolderView _pageIndexForOffset:](self, "_pageIndexForOffset:", v10),
         v11 != -[SBRootFolderView leadingCustomViewPageIndex](self, "leadingCustomViewPageIndex")))
    && (v14.receiver = self,
        v14.super_class = (Class)SBRootFolderView,
        -[SBFolderView iconScrollView:shouldSetAutoscrollContentOffset:](&v14, sel_iconScrollView_shouldSetAutoscrollContentOffset_, v7, x, y)))
  {
    v12 = 1;
    -[SBRootFolderView setAllowsFreeScrollingUntilScrollingEnds:](self, "setAllowsFreeScrollingUntilScrollingEnds:", 1);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (CGPoint)_scrollView:(id)a3 adjustedOffsetForOffset:(CGPoint)a4 translation:(CGPoint)a5 startPoint:(CGPoint)a6 locationInView:(CGPoint)a7 horizontalVelocity:(double *)a8 verticalVelocity:(double *)a9
{
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  int v19;
  int v20;
  _BOOL4 v21;
  int v22;
  double v23;
  double v24;
  double v25;
  CGPoint result;

  -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:", a3, a8, a9, a4.x, a4.y, a5.x, a5.y, a6.x, a6.y, a7.x, a7.y);
  v12 = v11;
  if (a8)
    v13 = *a8;
  else
    v13 = 0.0;
  -[SBRootFolderView _firstPageScrollOffsetForOverscroll](self, "_firstPageScrollOffsetForOverscroll");
  v15 = v14;
  -[SBRootFolderView _lastPageScrollOffsetForOverscroll](self, "_lastPageScrollOffsetForOverscroll");
  v17 = v16;
  v18 = -[SBFolderView isRTL](self, "isRTL");
  v19 = !v18 && v12 < v15 || v12 > v15 && v18;
  v20 = v12 <= v17 || v18;
  v21 = v12 < v17 && v18;
  v22 = v20 != 1 || v21;
  if ((v19 & -[SBRootFolderView _shouldIgnoreOverscrollOnFirstPageForCurrentOrientation](self, "_shouldIgnoreOverscrollOnFirstPageForCurrentOrientation")) != 0)
  {
    v12 = v15;
    v23 = 0.0;
  }
  else
  {
    v23 = v13;
  }
  if (v22
    && -[SBRootFolderView _shouldIgnoreOverscrollOnLastPageForCurrentOrientation](self, "_shouldIgnoreOverscrollOnLastPageForCurrentOrientation"))
  {
    v12 = v17;
    v23 = 0.0;
  }
  if (a8)
    *a8 = v23;
  -[SBFolderView pointForScrollingDimension:](self, "pointForScrollingDimension:", v12);
  result.y = v25;
  result.x = v24;
  return result;
}

- (void)updateIconListViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBRootFolderView;
  -[SBFolderView updateIconListViews](&v3, sel_updateIconListViews);
  -[SBRootFolderView layoutSearchableViews](self, "layoutSearchableViews");
}

- (void)scrollUsingDecelerationAnimationToPageIndex:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  objc_super v7;

  v6 = a4;
  if (-[SBFolderView currentPageIndex](self, "currentPageIndex") != a3
    || -[SBFolderView isScrolling](self, "isScrolling"))
  {
    -[SBRootFolderView _flashPageDotsForReason:](self, "_flashPageDotsForReason:", CFSTR("animated scroll"));
  }
  v7.receiver = self;
  v7.super_class = (Class)SBRootFolderView;
  -[SBFolderView scrollUsingDecelerationAnimationToPageIndex:withCompletionHandler:](&v7, sel_scrollUsingDecelerationAnimationToPageIndex_withCompletionHandler_, a3, v6);

}

- (double)trailingCustomViewPageScrollOffset
{
  double result;

  -[SBFolderView _pageWidth](self, "_pageWidth");
  -[SBRootFolderView trailingCustomViewPageScrollOffsetUsingPageWidth:](self, "trailingCustomViewPageScrollOffsetUsingPageWidth:");
  return result;
}

- (double)trailingCustomViewPageScrollOffsetUsingPageWidth:(double)a3
{
  double result;

  -[SBRootFolderView _scrollOffsetForPageAtIndex:pageWidth:](self, "_scrollOffsetForPageAtIndex:pageWidth:", -[SBRootFolderView trailingCustomViewPageIndex](self, "trailingCustomViewPageIndex"), a3);
  return result;
}

- (BOOL)hidesOffscreenCustomPageViews
{
  return 1;
}

- (UIEdgeInsets)_statusBarInsetsForDockEdge:(unint64_t)a3 dockOffscreenPercentage:(double)a4
{
  uint64_t v7;
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
  UIEdgeInsets result;

  v7 = MEMORY[0x1E0DC49E8];
  v8 = *MEMORY[0x1E0DC49E8];
  v9 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v10 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  -[SBDockView dockHeight](self->_dockView, "dockHeight");
  v12 = v11;
  -[SBDockView dockHeightPadding](self->_dockView, "dockHeightPadding");
  v13 = 1.0 - a4;
  v15 = -(v14 - v12 * v13);
  if (a3 == 8)
  {
    v16 = -(v14 - v12 * v13);
LABEL_5:
    v15 = v9;
    goto LABEL_6;
  }
  v16 = *(double *)(v7 + 24);
  if (a3 != 2)
    goto LABEL_5;
LABEL_6:
  v17 = v8;
  v18 = v10;
  result.right = v16;
  result.bottom = v18;
  result.left = v15;
  result.top = v17;
  return result;
}

- (void)_cleanUpAfterScrolling
{
  if (!-[SBFolderView isScrolling](self, "isScrolling"))
  {
    self->_isLeadingCustomViewBouncing = 0;
    -[SBRootFolderView _resetSearchScrollTrackingState](self, "_resetSearchScrollTrackingState");
  }
}

- (void)_captureInitialSearchScrollTrackingState
{
  double v3;
  double pageWidthWhenScrollToSearchBeganDragging;
  double v5;
  id v6;

  self->_scrollToSearchIsDraggingOrAnimating = 1;
  -[SBFolderView _pageWidth](self, "_pageWidth");
  self->_pageWidthWhenScrollToSearchBeganDragging = v3;
  if (-[SBFolderView isRTL](self, "isRTL"))
  {
    -[SBFolderView _scrollOffsetForFirstListView](self, "_scrollOffsetForFirstListView");
    -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:");
  }
  else
  {
    pageWidthWhenScrollToSearchBeganDragging = self->_pageWidthWhenScrollToSearchBeganDragging;
  }
  self->_baseOffsetForDeterminingScrollToSearchThreshold = pageWidthWhenScrollToSearchBeganDragging;
  -[SBFolderView scrollView](self, "scrollView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentOffset");
  -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:");
  self->_scrollOffsetWhenScrollingBegan = v5;

}

- (void)_resetSearchScrollTrackingState
{
  self->_scrollToSearchIsDraggingOrAnimating = 0;
  self->_pageWidthWhenScrollToSearchBeganDragging = 1.79769313e308;
  self->_baseOffsetForDeterminingScrollToSearchThreshold = 1.79769313e308;
  self->_scrollOffsetWhenScrollingBegan = 1.79769313e308;
}

- (BOOL)_useParallaxOnPageControl
{
  return 0;
}

- (void)_updateParallaxSettings
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBRootFolderView;
  -[SBFolderView _updateParallaxSettings](&v8, sel__updateParallaxSettings);
  v3 = -[SBFolderView isParallaxEnabled](self, "isParallaxEnabled");
  -[SBRootFolderView scrollAccessoryView](self, "scrollAccessoryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = (double *)MEMORY[0x1E0DC5AD8];
  if (!v3)
    v6 = (double *)MEMORY[0x1E0DC5AD0];
  objc_msgSend(v4, "_setVisualAltitude:", *v6);

  -[SBFolderView scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBFApplyParallaxSettingsToViewWithFactor();

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  SBHHomePullToSearchSettings *v7;
  SBFParallaxSettings *v8;

  v8 = (SBFParallaxSettings *)a3;
  v6 = a4;
  v7 = (SBHHomePullToSearchSettings *)v8;
  if (self->_parallaxSettings == v8)
  {
    -[SBRootFolderView _updateParallaxSettings](self, "_updateParallaxSettings");
    v7 = (SBHHomePullToSearchSettings *)v8;
  }
  if (self->_pullToSearchSettings == v7)
    -[SBRootFolderView _updatePullToSearchSettings](self, "_updatePullToSearchSettings");

}

- (void)_updatePullToSearchSettings
{
  -[SBHHomePullToSearchSettings searchContentFadeInStartThreshold](self->_pullToSearchSettings, "searchContentFadeInStartThreshold");
  -[SBRootFolderView setPullToSearchFadeInThreshold:](self, "setPullToSearchFadeInThreshold:");
  -[SBHHomePullToSearchSettings pullTransitionActivationThreshold](self->_pullToSearchSettings, "pullTransitionActivationThreshold");
  -[SBRootFolderView setPullToSearchActivationThreshold:](self, "setPullToSearchActivationThreshold:");
  -[SBRootFolderView setPullToSearchTranslatesIcons:](self, "setPullToSearchTranslatesIcons:", (double)-[SBHHomePullToSearchSettings appIconsFollowTranslation](self->_pullToSearchSettings, "appIconsFollowTranslation"));
}

- (void)_animateViewsForPullingToSearch
{
  _OWORD v3[20];
  uint64_t v4;

  v4 = 0;
  memset(v3, 0, sizeof(v3));
  -[SBRootFolderView getMetrics:](self, "getMetrics:", v3);
  -[SBRootFolderView _animateViewsForPullingToSearchWithMetrics:](self, "_animateViewsForPullingToSearchWithMetrics:", v3);
}

- (void)_animateViewsForScrollingToLeadingOrTrailingCustomView
{
  _OWORD v3[20];
  uint64_t v4;

  v4 = 0;
  memset(v3, 0, sizeof(v3));
  -[SBRootFolderView getMetrics:](self, "getMetrics:", v3);
  -[SBRootFolderView _animateViewsForScrollingToLeadingOrTrailingCustomViewWithMetrics:](self, "_animateViewsForScrollingToLeadingOrTrailingCustomViewWithMetrics:", v3);
}

- (BOOL)isOnTrailingCustomPage
{
  int64_t v3;

  v3 = -[SBFolderView currentPageIndex](self, "currentPageIndex");
  return v3 == -[SBRootFolderView trailingCustomViewPageIndex](self, "trailingCustomViewPageIndex");
}

- (void)_adjustLeadingCustomContentForEdgeBounce
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  -[SBFolderView scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v7 = v6;

  -[SBFolderView delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "rootFolderView:wantsToAdjustLeadingCustomContentForEdgeBounceForScrollOffset:", self, v5, v7);

}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBRootFolderView;
  -[SBFolderView descriptionBuilderWithMultilinePrefix:](&v16, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSHashTable count](self->_dockOffscreenProgressSettingClients, "count"))
    v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_dockOffscreenProgressSettingClients, CFSTR("dockOffscreenProgressSettingClients"));
  v6 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_dockExternal, CFSTR("isDockExternal"), 1);
  v7 = (id)objc_msgSend(v4, "appendFloat:withName:decimalPrecision:", CFSTR("leadingCustomViewVisibilityProgress"), 2, self->_leadingCustomViewVisibilityProgress);
  v8 = (id)objc_msgSend(v4, "appendFloat:withName:decimalPrecision:", CFSTR("pullDownSearchVisibilityProgress"), 2, self->_pullDownSearchVisibilityProgress);
  v9 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_userAttemptedToOverscrollFirstPageDuringCurrentGesture, CFSTR("userAttemptedToOverscrollFirstPageDuringCurrentGesture"), 1);
  v10 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_userAttemptedToOverscrollLastPageDuringCurrentGesture, CFSTR("userAttemptedToOverscrollLastPageDuringCurrentGesture"), 1);
  v11 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_allowsFreeScrollingUntilScrollingEnds, CFSTR("allowsFreeScrollingUntilScrollingEnds"), 1);
  if ((BSFloatIsZero() & 1) == 0)
    v12 = (id)objc_msgSend(v4, "appendFloat:withName:decimalPrecision:", CFSTR("scrollingAdjustment"), 2, self->_scrollingAdjustment);
  v13 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_dockBorrowedAssertion, CFSTR("dockBorrowedAssertion"), 1);
  v14 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_scrollAccessoryBorrowedAssertion, CFSTR("scrollAccessoryBorrowedAssertion"), 1);
  return v4;
}

- (id)accessibilityTintColorForDockView:(id)a3
{
  -[SBDockView frame](self->_dockView, "frame", a3);
  return -[SBFolderView accessibilityTintColorForRect:tintStyle:](self, "accessibilityTintColorForRect:tintStyle:", 3);
}

- (void)remoteBasebandLogCollectionStateDidChange:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = (const __CFString *)*MEMORY[0x1E0DAA1B0];
  else
    v3 = &stru_1E8D8E958;
  -[SBRootFolderView setIdleText:](self, "setIdleText:", v3);
}

- (void)_setupIdleTextPrivacyDisclosures
{
  void *v3;
  const __CFString *v4;
  void *v5;
  int v6;

  objc_msgSend(MEMORY[0x1E0DA9EC0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

  if (ct_green_tea_logging_enabled())
  {
    v4 = CFSTR("Regulatory Logging Enabled");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA9EC0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isLogCollectionEnabled");

    if (!v6)
      return;
    v4 = (const __CFString *)*MEMORY[0x1E0DAA1B0];
  }
  -[SBRootFolderView setIdleText:](self, "setIdleText:", v4);
}

- (void)_reduceMotionStatusDidChange:(id)a3
{
  SBSearchBackdropView *searchBackdropView;
  SBSearchBackdropView *v5;
  SBSearchBackdropView *trailingCustomBackdropView;
  SBSearchBackdropView *v7;
  id v8;

  v8 = a3;
  searchBackdropView = self->_searchBackdropView;
  if (searchBackdropView)
  {
    -[SBSearchBackdropView removeFromSuperview](searchBackdropView, "removeFromSuperview");
    v5 = self->_searchBackdropView;
    self->_searchBackdropView = 0;

    -[SBRootFolderView _setupSearchBackdropViewIfNecessary](self, "_setupSearchBackdropViewIfNecessary");
  }
  trailingCustomBackdropView = self->_trailingCustomBackdropView;
  if (trailingCustomBackdropView)
  {
    -[SBSearchBackdropView removeFromSuperview](trailingCustomBackdropView, "removeFromSuperview");
    v7 = self->_trailingCustomBackdropView;
    self->_trailingCustomBackdropView = 0;

    -[SBRootFolderView _setupTrailingCustomBackdropViewIfNecessary](self, "_setupTrailingCustomBackdropViewIfNecessary");
  }

}

- (void)_setupSearchBackdropViewIfNecessary
{
  SBSearchBackdropView *v3;
  SBSearchBackdropView *v4;
  SBSearchBackdropView *searchBackdropView;
  _SBRootFolderLayoutWrapperView *v6;

  if (!self->_searchBackdropView)
  {
    v6 = self->_searchPulldownWrapperView;
    v3 = [SBSearchBackdropView alloc];
    -[_SBRootFolderLayoutWrapperView bounds](v6, "bounds");
    v4 = -[SBSearchBackdropView initWithFrame:style:](v3, "initWithFrame:style:", 0);
    searchBackdropView = self->_searchBackdropView;
    self->_searchBackdropView = v4;

    -[SBSearchBackdropView setAutoresizingMask:](self->_searchBackdropView, "setAutoresizingMask:", 18);
    -[SBSearchBackdropView setAlpha:](self->_searchBackdropView, "setAlpha:", 1.0);
    -[_SBRootFolderLayoutWrapperView insertSubview:atIndex:](v6, "insertSubview:atIndex:", self->_searchBackdropView, 0);

  }
}

- (void)_setupTrailingCustomBackdropViewIfNecessary
{
  SBSearchBackdropView *v3;
  SBSearchBackdropView *v4;
  SBSearchBackdropView *trailingCustomBackdropView;
  SBRootFolderView *v6;

  if (self->_searchableTrailingCustomWrapperView)
  {
    if (!self->_trailingCustomBackdropView)
    {
      v6 = self;
      v3 = [SBSearchBackdropView alloc];
      -[SBRootFolderView _scaledBoundsForMinimumHomeScreenScale](v6, "_scaledBoundsForMinimumHomeScreenScale");
      v4 = -[SBSearchBackdropView initWithFrame:style:](v3, "initWithFrame:style:", 1);
      trailingCustomBackdropView = self->_trailingCustomBackdropView;
      self->_trailingCustomBackdropView = v4;

      -[SBSearchBackdropView setAutoresizingMask:](self->_trailingCustomBackdropView, "setAutoresizingMask:", 18);
      -[SBSearchBackdropView setAlpha:](self->_trailingCustomBackdropView, "setAlpha:", 1.0);
      -[SBSearchBackdropView prepareForTransitionToBlurred:](self->_trailingCustomBackdropView, "prepareForTransitionToBlurred:", 0);
      -[SBSearchBackdropView completeTransitionSuccessfully:](self->_trailingCustomBackdropView, "completeTransitionSuccessfully:", 1);
      -[SBRootFolderView insertSubview:atIndex:](v6, "insertSubview:atIndex:", self->_trailingCustomBackdropView, 0);

    }
  }
}

- (void)_setupTrailingCustomDimmingViewIfNecessary
{
  objc_class *v3;
  SBRootFolderView *v4;
  id v5;
  UIView *v6;
  UIView *trailingCustomSearchDimmingView;
  UIView *v8;
  id v9;

  if (self->_searchableTrailingCustomWrapperView)
  {
    if (!self->_trailingCustomSearchDimmingView)
    {
      v3 = (objc_class *)MEMORY[0x1E0DC3F10];
      v4 = self;
      v5 = [v3 alloc];
      -[SBRootFolderView _scaledBoundsForMinimumHomeScreenScale](v4, "_scaledBoundsForMinimumHomeScreenScale");
      v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
      trailingCustomSearchDimmingView = self->_trailingCustomSearchDimmingView;
      self->_trailingCustomSearchDimmingView = v6;

      -[UIView setAutoresizingMask:](self->_trailingCustomSearchDimmingView, "setAutoresizingMask:", 18);
      -[UIView setAlpha:](self->_trailingCustomSearchDimmingView, "setAlpha:", 0.0);
      -[UIView setUserInteractionEnabled:](self->_trailingCustomSearchDimmingView, "setUserInteractionEnabled:", 0);
      v8 = self->_trailingCustomSearchDimmingView;
      -[SBRootFolderView trailingCustomBackdropView](v4, "trailingCustomBackdropView");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[SBRootFolderView insertSubview:aboveSubview:](v4, "insertSubview:aboveSubview:", v8, v9);

    }
  }
}

- (void)_doPageManagementEducation
{
  -[SBRootFolderView enterPageManagementUIWithCompletionHandler:](self, "enterPageManagementUIWithCompletionHandler:", 0);
}

- (void)_setupStateDumper
{
  id v3;
  BSInvalidatable *v4;
  BSInvalidatable *dockStateDumpHandle;
  id v6;
  id location;

  if (!self->_dockStateDumpHandle)
  {
    if (self->_dockView)
    {
      objc_initWeak(&location, self);
      v3 = MEMORY[0x1E0C80D38];
      objc_copyWeak(&v6, &location);
      BSLogAddStateCaptureBlockWithTitle();
      v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      dockStateDumpHandle = self->_dockStateDumpHandle;
      self->_dockStateDumpHandle = v4;

      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
}

id __37__SBRootFolderView__setupStateDumper__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_stateCaptureString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_stateCaptureString
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  CGAffineTransform transform;
  CGRect v40[7];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  _QWORD v48[12];
  _QWORD v49[14];
  CGRect v50;

  v49[12] = *MEMORY[0x1E0C80C00];
  -[SBRootFolderView dockView](self, "dockView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  memset(v40, 0, sizeof(v40));
  -[SBRootFolderView getMetrics:](self, "getMetrics:", v40);
  v48[0] = CFSTR("hidden");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isHidden"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v38;
  v48[1] = CFSTR("alpha");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "alpha");
  objc_msgSend(v5, "numberWithDouble:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v37;
  v48[2] = CFSTR("leadingCustomViewVisibilityProgress");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[SBRootFolderView leadingCustomViewVisibilityProgress](self, "leadingCustomViewVisibilityProgress");
  objc_msgSend(v6, "numberWithDouble:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v36;
  v48[3] = CFSTR("pullDownSearchVisibilityProgress");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[SBRootFolderView pullDownSearchVisibilityProgress](self, "pullDownSearchVisibilityProgress");
  objc_msgSend(v7, "numberWithDouble:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v35;
  v48[4] = CFSTR("currentDockOffscreenFraction");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[SBRootFolderView currentDockOffscreenFraction](self, "currentDockOffscreenFraction");
  objc_msgSend(v8, "numberWithDouble:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v34;
  v48[5] = CFSTR("transform");
  if (v4)
    objc_msgSend(v4, "transform");
  else
    memset(&transform, 0, sizeof(transform));
  NSStringFromCGAffineTransform(&transform);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = &stru_1E8D8E958;
  v33 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_1E8D8E958;
  v49[5] = v11;
  v48[6] = CFSTR("dockFrame");
  objc_msgSend(v4, "frame");
  NSStringFromCGRect(v50);
  v12 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v12;
  if (v12)
    v13 = (const __CFString *)v12;
  else
    v13 = &stru_1E8D8E958;
  v49[6] = v13;
  v48[7] = CFSTR("effectiveDockFrame");
  NSStringFromCGRect(v40[6]);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = &stru_1E8D8E958;
  v49[7] = v16;
  v48[8] = CFSTR("dockView");
  objc_msgSend(v4, "description");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = &stru_1E8D8E958;
  v49[8] = v19;
  v48[9] = CFSTR("dockViewSuperview");
  objc_msgSend(v4, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "description");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
    v23 = (const __CFString *)v21;
  else
    v23 = &stru_1E8D8E958;
  v49[9] = v23;
  v48[10] = CFSTR("dockWindow");
  objc_msgSend(v4, "window");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v26 = (const __CFString *)v24;
  else
    v26 = &stru_1E8D8E958;
  v49[10] = v26;
  v48[11] = CFSTR("dockWindowLevel");
  objc_msgSend(v4, "window");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "window");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "windowLevel");
    objc_msgSend(v28, "numberWithDouble:");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v49[11] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 12);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {

  }
  objc_msgSend(v29, "description");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (double)_firstPageScrollOffsetForOverscroll
{
  double result;

  -[SBFolderView _scrollOffsetForPageAtIndex:](self, "_scrollOffsetForPageAtIndex:", -[SBFolderView minimumPageIndex](self, "minimumPageIndex"));
  -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:");
  return result;
}

- (double)_lastPageScrollOffsetForOverscroll
{
  double result;

  -[SBFolderView _scrollOffsetForPageAtIndex:](self, "_scrollOffsetForPageAtIndex:", -[SBFolderView maximumPageIndex](self, "maximumPageIndex"));
  -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:");
  return result;
}

- (void)_overscrollScrollPanGestureRecognizerDidUpdate:(id)a3
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  _BOOL4 v16;
  int v17;
  _BOOL4 v18;
  void *v19;
  double v20;
  char v21;
  char v22;
  id v23;

  v23 = a3;
  v4 = objc_msgSend(v23, "state");
  -[SBRootFolderView _firstPageScrollOffsetForOverscroll](self, "_firstPageScrollOffsetForOverscroll");
  v6 = v5;
  -[SBRootFolderView _lastPageScrollOffsetForOverscroll](self, "_lastPageScrollOffsetForOverscroll");
  v8 = v7;
  v9 = -[SBRootFolderView _shouldIgnoreOverscrollOnFirstPageForCurrentOrientation](self, "_shouldIgnoreOverscrollOnFirstPageForCurrentOrientation");
  v10 = -[SBRootFolderView _shouldIgnoreOverscrollOnLastPageForCurrentOrientation](self, "_shouldIgnoreOverscrollOnLastPageForCurrentOrientation");
  v11 = v10;
  if (!v9 && !v10)
    goto LABEL_33;
  if ((unint64_t)(v4 - 3) < 3)
  {
    -[SBRootFolderView _cleanUpAfterOverscrollScrollGestureEnded:](self, "_cleanUpAfterOverscrollScrollGestureEnded:", v23);
    goto LABEL_33;
  }
  if (v4 != 2)
    goto LABEL_33;
  objc_msgSend(v23, "translationInView:", self);
  -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:");
  v13 = v12;
  v14 = self->_scrollOffsetWhenScrollingBegan - v12;
  v15 = -[SBFolderView isRTL](self, "isRTL");
  v16 = !v15 && v14 < v6 || v14 > v6 && v15;
  v17 = v14 <= v8 || v15;
  v18 = v17 != 1 || v14 < v8 && v15;
  -[SBFolderView delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16 || !v9)
  {
    if (!self->_lastEventWasAttemptingToOverscrollFirstPage)
      goto LABEL_27;
    if (v16)
      goto LABEL_27;
    -[SBRootFolderView setUserAttemptedToOverscrollFirstPageDuringCurrentGesture:](self, "setUserAttemptedToOverscrollFirstPageDuringCurrentGesture:", 1);
    v22 = objc_opt_respondsToSelector();
    v20 = 0.0;
    if ((v22 & 1) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
  -[SBRootFolderView setUserAttemptedToOverscrollFirstPageDuringCurrentGesture:](self, "setUserAttemptedToOverscrollFirstPageDuringCurrentGesture:", 1);
  v21 = objc_opt_respondsToSelector();
  v20 = v13;
  if ((v21 & 1) != 0)
LABEL_26:
    objc_msgSend(v19, "rootFolderView:didOverscrollOnFirstPageByAmount:", self, v20);
LABEL_27:
  if (v18 && v11 || self->_lastEventWasAttemptingToOverscrollLastPage && !v18)
  {
    -[SBRootFolderView setUserAttemptedToOverscrollLastPageDuringCurrentGesture:](self, "setUserAttemptedToOverscrollLastPageDuringCurrentGesture:", 1, v20);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v19, "rootFolderView:didOverscrollOnLastPageByAmount:", self, v13);
  }
  self->_lastEventWasAttemptingToOverscrollFirstPage = v16;
  self->_lastEventWasAttemptingToOverscrollLastPage = v18;

LABEL_33:
}

- (BOOL)_shouldIgnoreOverscrollOnFirstPageForCurrentOrientation
{
  return -[SBRootFolderView _shouldIgnoreOverscrollOnFirstPageForOrientation:](self, "_shouldIgnoreOverscrollOnFirstPageForOrientation:", -[SBFolderView orientation](self, "orientation"));
}

- (BOOL)_shouldIgnoreOverscrollOnFirstPageForOrientation:(int64_t)a3
{
  return (-[SBRootFolderView ignoresOverscrollOnFirstPageOrientations](self, "ignoresOverscrollOnFirstPageOrientations") & (1 << a3)) != 0;
}

- (BOOL)_shouldIgnoreOverscrollOnLastPageForCurrentOrientation
{
  return -[SBRootFolderView _shouldIgnoreOverscrollOnLastPageForOrientation:](self, "_shouldIgnoreOverscrollOnLastPageForOrientation:", -[SBFolderView orientation](self, "orientation"));
}

- (BOOL)_shouldIgnoreOverscrollOnLastPageForOrientation:(int64_t)a3
{
  return (-[SBRootFolderView ignoresOverscrollOnLastPageOrientations](self, "ignoresOverscrollOnLastPageOrientations") & (1 << a3)) != 0;
}

- (id)iconListView:(id)a3 alternateIconLocationForListWithNonDefaultSizedIcons:(BOOL)a4
{
  if (a4)
    -[SBRootFolderView iconLocationForListsWithNonDefaultSizedIcons](self, "iconLocationForListsWithNonDefaultSizedIcons", a3);
  else
    -[SBFolderView iconLocation](self, "iconLocation", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SBFParallaxSettings)parallaxSettings
{
  return self->_parallaxSettings;
}

- (BOOL)allowsAutoscrollToLeadingCustomView
{
  return self->_allowsAutoscrollToLeadingCustomView;
}

- (void)setAllowsAutoscrollToLeadingCustomView:(BOOL)a3
{
  self->_allowsAutoscrollToLeadingCustomView = a3;
}

- (BOOL)showsDoneButton
{
  return self->_showsDoneButton;
}

- (BOOL)showsAddWidgetButton
{
  return self->_showsAddWidgetButton;
}

- (double)titledButtonsAlpha
{
  return self->_titledButtonsAlpha;
}

- (void)setShiftsPullDownSearchForVisibility:(BOOL)a3
{
  self->_shiftsPullDownSearchForVisibility = a3;
}

- (void)setTodayViewVisibilityProgress:(double)a3
{
  self->_todayViewVisibilityProgress = a3;
}

- (void)setDockBorrowedAssertion:(id)a3
{
  self->_dockBorrowedAssertion = (_SBRootFolderViewElementBorrowedAssertion *)a3;
}

- (void)setScrollAccessoryBorrowedAssertion:(id)a3
{
  self->_scrollAccessoryBorrowedAssertion = (_SBRootFolderViewElementBorrowedAssertion *)a3;
}

- (NSMutableArray)pageDotsVisibilityAssertions
{
  return self->_pageDotsVisibilityAssertions;
}

- (void)setPageDotsVisibilityAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_pageDotsVisibilityAssertions, a3);
}

- (BSInvalidatable)scrubbingPageDotsVisibilityAssertion
{
  return self->_scrubbingPageDotsVisibilityAssertion;
}

- (void)setScrubbingPageDotsVisibilityAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_scrubbingPageDotsVisibilityAssertion, a3);
}

- (BSInvalidatable)editingPageDotsVisibilityAssertion
{
  return self->_editingPageDotsVisibilityAssertion;
}

- (void)setEditingPageDotsVisibilityAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_editingPageDotsVisibilityAssertion, a3);
}

- (BSInvalidatable)searchButtonDisabledPageDotsVisibilityAssertion
{
  return self->_searchButtonDisabledPageDotsVisibilityAssertion;
}

- (void)setSearchButtonDisabledPageDotsVisibilityAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_searchButtonDisabledPageDotsVisibilityAssertion, a3);
}

- (BSInvalidatable)searchButtonUnsupportedHardwarePageDotsVisibilityAssertion
{
  return self->_searchButtonUnsupportedHardwarePageDotsVisibilityAssertion;
}

- (void)setSearchButtonUnsupportedHardwarePageDotsVisibilityAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_searchButtonUnsupportedHardwarePageDotsVisibilityAssertion, a3);
}

- (BSInvalidatable)configuredForSnapshotPageDotsVisibilityAssertion
{
  return self->_configuredForSnapshotPageDotsVisibilityAssertion;
}

- (void)setConfiguredForSnapshotPageDotsVisibilityAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_configuredForSnapshotPageDotsVisibilityAssertion, a3);
}

- (NSTimer)pageDotsVisibilityTimer
{
  return self->_pageDotsVisibilityTimer;
}

- (void)setPageDotsVisibilityTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pageDotsVisibilityTimer, a3);
}

- (SBHTouchPassThroughView)titledButtonsContainerView
{
  return self->_titledButtonsContainerView;
}

- (void)setTitledButtonsContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_titledButtonsContainerView, a3);
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (void)setWidgetButton:(id)a3
{
  objc_storeStrong((id *)&self->_widgetButton, a3);
}

- (SBIconListViewIconLocationTransitioning)firstListViewIconLocationTransitionHandler
{
  return self->_firstListViewIconLocationTransitionHandler;
}

- (void)setFirstListViewIconLocationTransitionHandler:(id)a3
{
  objc_storeStrong((id *)&self->_firstListViewIconLocationTransitionHandler, a3);
}

- (double)scrollingAdjustment
{
  return self->_scrollingAdjustment;
}

- (SBHRootFolderSettings)folderSettings
{
  return self->_folderSettings;
}

- (void)setFolderSettings:(id)a3
{
  objc_storeStrong((id *)&self->_folderSettings, a3);
}

- (unint64_t)ignoresOverscrollOnFirstPageOrientations
{
  return self->_ignoresOverscrollOnFirstPageOrientations;
}

- (unint64_t)ignoresOverscrollOnLastPageOrientations
{
  return self->_ignoresOverscrollOnLastPageOrientations;
}

- (void)setUserAttemptedToOverscrollFirstPageDuringCurrentGesture:(BOOL)a3
{
  self->_userAttemptedToOverscrollFirstPageDuringCurrentGesture = a3;
}

- (void)setUserAttemptedToOverscrollLastPageDuringCurrentGesture:(BOOL)a3
{
  self->_userAttemptedToOverscrollLastPageDuringCurrentGesture = a3;
}

- (UILabel)idleTextView
{
  return self->_idleTextView;
}

- (_SBRootFolderLayoutWrapperView)searchPulldownWrapperView
{
  return self->_searchPulldownWrapperView;
}

- (_SBRootFolderLayoutWrapperView)searchableTrailingCustomWrapperView
{
  return self->_searchableTrailingCustomWrapperView;
}

- (SBHMinusPageStepper)customPageAnimationStepper
{
  return self->_customPageAnimationStepper;
}

- (SBRootFolderViewLayoutManager)transitioningNewSpecialLayoutManager
{
  return self->_transitioningNewSpecialLayoutManager;
}

- (void)setTransitioningNewSpecialLayoutManager:(id)a3
{
  objc_storeStrong((id *)&self->_transitioningNewSpecialLayoutManager, a3);
}

- (SBRootFolderViewLayoutManager)transitioningOldSpecialLayoutManager
{
  return self->_transitioningOldSpecialLayoutManager;
}

- (void)setTransitioningOldSpecialLayoutManager:(id)a3
{
  objc_storeStrong((id *)&self->_transitioningOldSpecialLayoutManager, a3);
}

- (unint64_t)folderPageManagementAllowedOrientations
{
  return self->_folderPageManagementAllowedOrientations;
}

- (UIView)scrollAccessoryBackgroundView
{
  return self->_scrollAccessoryBackgroundView;
}

- (SBHHomePullToSearchSettings)pullToSearchSettings
{
  return self->_pullToSearchSettings;
}

- (double)pullToSearchFadeInThreshold
{
  return self->_pullToSearchFadeInThreshold;
}

- (void)setPullToSearchFadeInThreshold:(double)a3
{
  self->_pullToSearchFadeInThreshold = a3;
}

- (double)pullToSearchActivationThreshold
{
  return self->_pullToSearchActivationThreshold;
}

- (void)setPullToSearchActivationThreshold:(double)a3
{
  self->_pullToSearchActivationThreshold = a3;
}

- (double)pullToSearchTranslatesIcons
{
  return self->_pullToSearchTranslatesIcons;
}

- (void)setPullToSearchTranslatesIcons:(double)a3
{
  self->_pullToSearchTranslatesIcons = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specialLayoutManager, 0);
  objc_storeStrong((id *)&self->_scrollAccessoryView, 0);
  objc_storeStrong((id *)&self->_pullToSearchSettings, 0);
  objc_storeStrong((id *)&self->_searchPresentableView, 0);
  objc_storeStrong((id *)&self->_searchPresenter, 0);
  objc_storeStrong((id *)&self->_scrollAccessoryBackgroundView, 0);
  objc_storeStrong((id *)&self->_scrollAccessoryAuxiliaryView, 0);
  objc_storeStrong((id *)&self->_transitioningOldSpecialLayoutManager, 0);
  objc_storeStrong((id *)&self->_transitioningNewSpecialLayoutManager, 0);
  objc_storeStrong((id *)&self->_customPageAnimationStepper, 0);
  objc_storeStrong((id *)&self->_trailingCustomViewController, 0);
  objc_storeStrong((id *)&self->_leadingCustomViewController, 0);
  objc_storeStrong((id *)&self->_idleTextView, 0);
  objc_storeStrong((id *)&self->_folderSettings, 0);
  objc_storeStrong((id *)&self->_firstListViewIconLocationTransitionHandler, 0);
  objc_storeStrong((id *)&self->_widgetButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_titledButtonsContainerView, 0);
  objc_storeStrong((id *)&self->_pageDotsVisibilityTimer, 0);
  objc_storeStrong((id *)&self->_configuredForSnapshotPageDotsVisibilityAssertion, 0);
  objc_storeStrong((id *)&self->_searchButtonUnsupportedHardwarePageDotsVisibilityAssertion, 0);
  objc_storeStrong((id *)&self->_searchButtonDisabledPageDotsVisibilityAssertion, 0);
  objc_storeStrong((id *)&self->_editingPageDotsVisibilityAssertion, 0);
  objc_storeStrong((id *)&self->_scrubbingPageDotsVisibilityAssertion, 0);
  objc_storeStrong((id *)&self->_scrollingPageDotsVisibilityAssertion, 0);
  objc_storeStrong((id *)&self->_pageDotsVisibilityAssertions, 0);
  objc_storeStrong((id *)&self->_searchGesture, 0);
  objc_storeStrong((id *)&self->_dockStateDumpHandle, 0);
  objc_storeStrong((id *)&self->_dockOffscreenProgressSettingClients, 0);
  objc_storeStrong((id *)&self->_trailingCustomSearchDimmingView, 0);
  objc_storeStrong((id *)&self->_trailingCustomBackdropView, 0);
  objc_storeStrong((id *)&self->_searchBackdropView, 0);
  objc_storeStrong((id *)&self->_searchableTrailingCustomWrapperView, 0);
  objc_storeStrong((id *)&self->_searchableLeadingCustomWrapperView, 0);
  objc_storeStrong((id *)&self->_searchPulldownWrapperView, 0);
  objc_storeStrong((id *)&self->_parallaxSettings, 0);
  objc_storeStrong((id *)&self->_dockListView, 0);
  objc_storeStrong((id *)&self->_dockView, 0);
}

- (void)elementBorrowedAssertionDidInvalidate:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "reason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = a1;
  v7 = 2114;
  v8 = v4;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "Unknown borrowed element assertion invalidated: %@ (reason: %{public}@", (uint8_t *)&v5, 0x16u);

}

@end
