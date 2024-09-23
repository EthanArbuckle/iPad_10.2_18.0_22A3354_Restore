@implementation WKUIPagingTransitionController

- (WKUIPagingTransitionController)initWithScrollView:(id)a3 pageSize:(CGSize)a4 numberOfPages:(int64_t)a5 startingPage:(int64_t)a6 pagingAxis:(int64_t)a7 delegate:(id)a8
{
  double height;
  double width;
  id v16;
  id v17;
  WKUIPagingTransitionController *v18;
  WKUIPagingTransitionController *v19;
  objc_super v21;

  height = a4.height;
  width = a4.width;
  v16 = a3;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)WKUIPagingTransitionController;
  v18 = -[WKUIPagingTransitionController init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_delegate, v17);
    objc_storeStrong((id *)&v19->_scrollView, a3);
    -[UIScrollView setDelegate:](v19->_scrollView, "setDelegate:", v19);
    -[UIScrollView setPagingEnabled:](v19->_scrollView, "setPagingEnabled:", 1);
    -[UIScrollView setClipsToBounds:](v19->_scrollView, "setClipsToBounds:", 0);
    v19->_actualPageNumber = a6;
    v19->_currentPage = a6;
    v19->_numberOfPages = a5;
    v19->_pagingAxis = a7;
    -[WKUIPagingTransitionController setPageSize:](v19, "setPageSize:", width, height);
  }

  return v19;
}

- (void)setAnimationDelegate:(id)a3
{
  id obj;

  obj = a3;
  self->_animationDelegateCache.supportsTransitioningView = objc_opt_respondsToSelector() & 1;
  self->_animationDelegateCache.supportsTransitioningPage = objc_opt_respondsToSelector() & 1;
  self->_animationDelegateCache.supportsDidFinishTransitionForView = objc_opt_respondsToSelector() & 1;
  objc_storeWeak((id *)&self->_animationDelegate, obj);

}

- (int64_t)dominantPage
{
  return self->_actualPageNumber;
}

- (void)setPageControl:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_pageControl, a3);
  v5 = a3;
  -[UIPageControl setNumberOfPages:](self->_pageControl, "setNumberOfPages:", self->_numberOfPages);
  -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", self->_currentPage);

}

- (void)setCurrentPage:(int64_t)a3
{
  self->_currentPage = a3;
  -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:");
}

- (void)setCurrentPage:(int64_t)a3 animated:(BOOL)a4
{
  UIScrollView *scrollView;
  UIView **p_currentPageView;
  void *v8;
  UIView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  UIView *v19;

  if (a4)
  {
    scrollView = self->_scrollView;
    -[WKUIPagingTransitionController contentFrameForPage:](self, "contentFrameForPage:", a3);
    -[UIScrollView scrollRectToVisible:animated:](scrollView, "scrollRectToVisible:animated:", 1);
  }
  else
  {
    p_currentPageView = &self->_currentPageView;
    v19 = self->_currentPageView;
    -[WKUIPagingTransitionController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pagingTransitionController:viewForPage:", self, a3);
    v9 = (UIView *)objc_claimAutoreleasedReturnValue();

    if (v9 != *p_currentPageView)
    {
      -[UIView removeFromSuperview](*p_currentPageView, "removeFromSuperview");
      -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v9);
      objc_storeStrong((id *)&self->_currentPageView, v9);
    }
    -[WKUIPagingTransitionController contentFrameForPage:](self, "contentFrameForPage:", a3);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[UIView setFrame:](v9, "setFrame:");
    -[UIScrollView scrollRectToVisible:animated:](self->_scrollView, "scrollRectToVisible:animated:", 0, v11, v13, v15, v17);
    -[WKUIPagingTransitionController setCurrentPage:](self, "setCurrentPage:", a3);
    -[WKUIPagingTransitionController _setActualPageNumber:](self, "_setActualPageNumber:", a3);
    self->_lastVisibleRange.location = a3;
    self->_lastVisibleRange.length = 1;
    -[WKUIPagingTransitionController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pagingTransitionController:didFinishTransitionFromView:toView:page:animated:", self, v19, v9, a3, 0);

  }
}

- (void)setPageSize:(CGSize)a3
{
  int64_t pagingAxis;
  double numberOfPages;
  double v6;
  double v7;

  self->_pageSize = a3;
  pagingAxis = self->_pagingAxis;
  numberOfPages = (double)self->_numberOfPages;
  if (pagingAxis)
    v6 = 1.0;
  else
    v6 = (double)self->_numberOfPages;
  v7 = a3.width * v6;
  if (!pagingAxis)
    numberOfPages = 1.0;
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v7, a3.height * numberOfPages);
  -[WKUIPagingTransitionController setCurrentPage:animated:](self, "setCurrentPage:animated:", self->_currentPage, 0);
}

- (void)_setActualPageNumber:(int64_t)a3
{
  void *v5;

  if ((a3 & 0x8000000000000000) == 0 && self->_numberOfPages > a3 && self->_actualPageNumber != a3)
  {
    self->_actualPageNumber = a3;
    -[WKUIPagingTransitionController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pagingTransitionController:didTransitionToPage:", self, self->_actualPageNumber);

    -[WKUIPagingTransitionController setCurrentPage:](self, "setCurrentPage:", a3);
  }
}

- (CGRect)contentFrameForPage:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t numberOfPages;
  void *v10;
  int64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[UIScrollView bounds](self->_scrollView, "bounds");
  v6 = v5;
  v8 = v7;
  numberOfPages = self->_numberOfPages;
  -[WKUIPagingTransitionController scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "_shouldReverseLayoutDirection") & (self->_pagingAxis == 0)) != 0)
    v11 = numberOfPages + ~a3;
  else
    v11 = a3;

  v12 = (double)v11;
  if (self->_pagingAxis)
  {
    v13 = self->_pageSize.height * v12;
    v14 = 0.0;
  }
  else
  {
    v14 = self->_pageSize.width * v12;
    v13 = 0.0;
  }
  if (self->_musicControlPageIndex == a3)
    v8 = v8 + self->_increaseMusicControlBottomOffset;
  v15 = v6;
  v16 = v8;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v13;
  result.origin.x = v14;
  return result;
}

- (BOOL)_isValidPage:(int64_t)a3
{
  return (a3 & 0x8000000000000000) == 0 && self->_numberOfPages > a3;
}

- (void)_prepareViewForPage:(unint64_t)a3 pagingDirection:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  if (-[WKUIPagingTransitionController _isValidPage:](self, "_isValidPage:"))
  {
    -[WKUIPagingTransitionController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pagingTransitionController:viewForPage:", self, a3);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v16);
    -[WKUIPagingTransitionController contentFrameForPage:](self, "contentFrameForPage:", a3);
    objc_msgSend(v16, "setFrame:");
    -[WKUIPagingTransitionController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pagingTransitionController:willDisplayPageView:", self, v16);

    if (a4 == 1)
      v10 = a3 - 1;
    else
      v10 = a3 + 1;
    if (-[WKUIPagingTransitionController _isValidPage:](self, "_isValidPage:", v10))
    {
      -[WKUIPagingTransitionController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        -[WKUIPagingTransitionController delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "pagingTransitionController:viewForPage:", self, v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[WKUIPagingTransitionController delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pagingTransitionController:willTransitionFromView:toView:", self, v14, v16);

      }
    }

  }
}

- (id)_pageViewForPage:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[WKUIPagingTransitionController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pagingTransitionController:viewForPage:", self, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)_currentPage
{
  double v3;
  double v4;

  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  if (self->_pagingAxis)
    v3 = v4;
  return -[WKUIPagingTransitionController _pageForOffset:](self, "_pageForOffset:", v3);
}

- (int64_t)_pageForOffset:(double)a3
{
  CGSize *p_pageSize;
  uint64_t v5;
  int64_t numberOfPages;
  void *v7;
  int64_t v8;

  p_pageSize = &self->_pageSize;
  if (self->_pagingAxis)
    p_pageSize = (CGSize *)&self->_pageSize.height;
  v5 = (uint64_t)(a3 / p_pageSize->width);
  numberOfPages = self->_numberOfPages;
  -[WKUIPagingTransitionController scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "_shouldReverseLayoutDirection") & (self->_pagingAxis == 0)) != 0)
    v8 = numberOfPages + ~v5;
  else
    v8 = v5;

  return v8;
}

- (void)resetCurrentView
{
  void *v3;
  void *v4;
  UIView *currentPageView;
  id v6;

  -[WKUIPagingTransitionController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pagingTransitionController:viewForPage:", self, self->_currentPage);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[WKUIPagingTransitionController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pagingTransitionController:willDisplayPageView:", self, v6);

  currentPageView = self->_currentPageView;
  self->_currentPageView = 0;

  -[WKUIPagingTransitionController setCurrentPage:animated:](self, "setCurrentPage:animated:", self->_currentPage, 0);
}

- (void)reanimateCurrentView
{
  -[WKUIPagingTransitionController _endAnimatedTransitionToPage:](self, "_endAnimatedTransitionToPage:", -[WKUIPagingTransitionController currentPage](self, "currentPage"));
}

- (void)_endAnimatedTransitionToPage:(int64_t)a3
{
  UIView *v5;
  UIView *v6;
  UIView *currentPageView;
  id v8;

  v5 = self->_currentPageView;
  -[WKUIPagingTransitionController _pageViewForPage:](self, "_pageViewForPage:", a3);
  v6 = (UIView *)objc_claimAutoreleasedReturnValue();
  currentPageView = self->_currentPageView;
  self->_currentPageView = v6;

  -[WKUIPagingTransitionController delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pagingTransitionController:didFinishTransitionFromView:toView:page:animated:", self, v5, self->_currentPageView, a3, 1);

}

- (void)_cancelAnimatedTransitionFromPage:(int64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  -[WKUIPagingTransitionController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WKUIPagingTransitionController delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[WKUIPagingTransitionController _pageViewForPage:](self, "_pageViewForPage:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pagingTransitionController:didCancelTransitionFromView:", self, v7);

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[WKUIPagingTransitionController _handleScrollViewScrollEnd](self, "_handleScrollViewScrollEnd", a3);
}

- (void)_handleScrollViewScrollEnd
{
  int64_t v3;

  v3 = -[WKUIPagingTransitionController _currentPage](self, "_currentPage");
  -[WKUIPagingTransitionController _setActualPageNumber:](self, "_setActualPageNumber:", v3);
  if (v3 == -[WKUIPagingTransitionController currentPage](self, "currentPage"))
  {
    -[WKUIPagingTransitionController _cancelAnimatedTransitionFromPage:](self, "_cancelAnimatedTransitionFromPage:", v3);
  }
  else
  {
    -[WKUIPagingTransitionController _endAnimatedTransitionToPage:](self, "_endAnimatedTransitionToPage:", v3);
    -[WKUIPagingTransitionController setCurrentPage:](self, "setCurrentPage:", v3);
  }
  -[WKUIPagingTransitionController _endTransitionAnimationForPage:visible:](self, "_endTransitionAnimationForPage:visible:", v3, 1);
}

- (void)_endTransitionAnimationForPage:(int64_t)a3 visible:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  -[WKUIPagingTransitionController _pageViewForPage:](self, "_pageViewForPage:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_animationDelegateCache.supportsDidFinishTransitionForView)
  {
    -[WKUIPagingTransitionController animationDelegate](self, "animationDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pagingTransitionController:didFinishTransitionForView:visible:", self, v7, v4);

  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  -[WKUIPagingTransitionController _endAnimatedTransitionToPage:](self, "_endAnimatedTransitionToPage:", -[WKUIPagingTransitionController _currentPage](self, "_currentPage", a3));
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  int v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  int64_t numberOfPages;
  uint64_t v16;
  uint64_t v17;
  CGSize *p_pageSize;
  _BOOL4 v19;
  uint64_t v20;
  NSUInteger v21;
  NSUInteger v22;
  double v23;
  _BOOL8 v24;
  NSRange lastVisibleRange;
  BOOL v26;
  NSRange v27;
  NSRange v28;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v31;
  unint64_t v32;
  void *v33;
  void *v34;
  CGSize *p_height;
  double v36;
  double v37;
  _BOOL4 v38;
  _BOOL4 v39;
  uint64_t v40;
  void *v41;
  void *v42;
  CGSize *v43;
  int64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSRange v48;
  NSRange v49;

  -[WKUIPagingTransitionController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WKUIPagingTransitionController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pagingTransitionControllerDidScroll:", self);

  }
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  if (self->_pagingAxis)
    v9 = v8;
  else
    v9 = v7;
  v10 = -[UIScrollView _shouldReverseLayoutDirection](self->_scrollView, "_shouldReverseLayoutDirection");
  v11 = v9;
  if (v10)
  {
    -[UIScrollView contentSize](self->_scrollView, "contentSize");
    v11 = v12 - v9 - self->_pageSize.width;
  }
  if (v11 != self->_lastContentOffset)
  {
    v13 = -[WKUIPagingTransitionController _pageForOffset:](self, "_pageForOffset:", v9);
    v14 = v13 & ~(v13 >> 63);
    numberOfPages = self->_numberOfPages;
    v16 = numberOfPages - 1;
    if (v14 >= numberOfPages - 1)
      v17 = numberOfPages - 1;
    else
      v17 = v13 & ~(v13 >> 63);
    p_pageSize = &self->_pageSize;
    if (self->_pagingAxis)
      p_pageSize = (CGSize *)&self->_pageSize.height;
    v19 = fmod(v11, p_pageSize->width) != 0.0 && v16 > v14;
    v26 = !v19;
    v20 = v10 & v19;
    if (v26)
      v21 = 1;
    else
      v21 = 2;
    v22 = v17 - v20;
    v23 = v9 - self->_lastContentOffset;
    v24 = v23 > 0.0;
    lastVisibleRange = self->_lastVisibleRange;
    v26 = lastVisibleRange.location == v17 - v20 && lastVisibleRange.length == v21;
    if (!v26)
    {
      v48.location = v17 - v20;
      v48.length = v21;
      v27 = NSIntersectionRange(lastVisibleRange, v48);
      v49.location = v22;
      v49.length = v21;
      v28 = NSUnionRange(self->_lastVisibleRange, v49);
      if (v28.location < v28.location + v28.length)
      {
        location = v28.location;
        length = v28.length;
        do
        {
          if (v27.location > location || location - v27.location >= v27.length)
          {
            if (v22 > location || location - v22 >= v21)
              -[WKUIPagingTransitionController _endTransitionAnimationForPage:visible:](self, "_endTransitionAnimationForPage:visible:", location, 0);
            else
              -[WKUIPagingTransitionController _prepareViewForPage:pagingDirection:](self, "_prepareViewForPage:pagingDirection:", location, v24);
          }
          ++location;
          --length;
        }
        while (length);
      }
    }
    if (v22 < v22 + v21)
    {
      v31 = v21;
      v32 = v22;
      do
      {
        -[WKUIPagingTransitionController _pageViewForPage:](self, "_pageViewForPage:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[WKUIPagingTransitionController animationDelegate](self, "animationDelegate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          if (self->_pagingAxis)
            p_height = (CGSize *)&self->_pageSize.height;
          else
            p_height = &self->_pageSize;
          v36 = (v11 - (double)v32 * p_height->width) / p_height->width;
          if ((v32 || v36 > 0.0) && (v32 != self->_numberOfPages - 1 || v36 <= 0.0))
            v37 = (1.0 - fabs(v36)) * 100.0;
          else
            v37 = 100.0;
          v38 = v36 >= 0.0;
          v39 = v36 < 0.0;
          if (v23 > 0.0)
            v39 = 1;
          else
            v38 = 1;
          v40 = v38 & v39;
          if (self->_animationDelegateCache.supportsTransitioningView)
          {
            -[WKUIPagingTransitionController animationDelegate](self, "animationDelegate");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "pagingTransitionController:transitioningView:percentageComplete:isTransitioningOut:", self, v33, v40, v37);

          }
          if (self->_animationDelegateCache.supportsTransitioningPage)
          {
            -[WKUIPagingTransitionController animationDelegate](self, "animationDelegate");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "pagingTransitionController:transitioningPage:percentageComplete:pagingDirection:isTransitioningOut:", self, v32, v24, v40, v37);

          }
        }

        ++v32;
        --v31;
      }
      while (v31);
    }
    if (self->_pagingAxis)
      v43 = (CGSize *)&self->_pageSize.height;
    else
      v43 = &self->_pageSize;
    v44 = self->_numberOfPages;
    v45 = (uint64_t)((v9 + v43->width * 0.5) / (v43->width * (double)v44) * (double)v44);
    -[WKUIPagingTransitionController scrollView](self, "scrollView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v46, "_shouldReverseLayoutDirection") & (self->_pagingAxis == 0)) != 0)
      v47 = v44 + ~v45;
    else
      v47 = v45;

    if (self->_actualPageNumber != v47)
      -[WKUIPagingTransitionController _setActualPageNumber:](self, "_setActualPageNumber:", v47);
    self->_lastContentOffset = v11;
    self->_lastVisibleRange.location = v22;
    self->_lastVisibleRange.length = v21;
  }
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (CGSize)pageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pageSize.width;
  height = self->_pageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)topPadding
{
  return self->_topPadding;
}

- (void)setTopPadding:(double)a3
{
  self->_topPadding = a3;
}

- (WKUIPagingTransitionControllerDelegate)delegate
{
  return (WKUIPagingTransitionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WKUIPagingTransitionControllerAnimationDelegate)animationDelegate
{
  return (WKUIPagingTransitionControllerAnimationDelegate *)objc_loadWeakRetained((id *)&self->_animationDelegate);
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (int64_t)numberOfPages
{
  return self->_numberOfPages;
}

- (double)increaseMusicControlBottomOffset
{
  return self->_increaseMusicControlBottomOffset;
}

- (void)setIncreaseMusicControlBottomOffset:(double)a3
{
  self->_increaseMusicControlBottomOffset = a3;
}

- (int64_t)musicControlPageIndex
{
  return self->_musicControlPageIndex;
}

- (void)setMusicControlPageIndex:(int64_t)a3
{
  self->_musicControlPageIndex = a3;
}

- (int64_t)currentPage
{
  return self->_currentPage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_destroyWeak((id *)&self->_animationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_currentPageView, 0);
}

@end
