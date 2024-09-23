@implementation UIPageControllerScrollView

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
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UIPageControllerScrollView;
  -[UIScrollView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11)
    -[UIPageController _scrollView:boundsDidChangeToSize:](self->_pageController, "_scrollView:boundsDidChangeToSize:", self, width, height);
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
  UIPageController *pageController;
  double v14;
  double v15;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v16.receiver = self;
  v16.super_class = (Class)UIPageControllerScrollView;
  -[UIScrollView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    pageController = self->_pageController;
    -[UIView bounds](self, "bounds");
    -[UIPageController _scrollView:boundsDidChangeToSize:](pageController, "_scrollView:boundsDidChangeToSize:", self, v14, v15);
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  if (!-[UIWindow isRotating](-[UIView window](self, "window"), "isRotating"))
  {
    -[UIPageController _scrollViewDidScroll:forceUpdate:](self->_pageController, "_scrollViewDidScroll:forceUpdate:", self, 0);
    v3.receiver = self;
    v3.super_class = (Class)UIPageControllerScrollView;
    -[UIScrollView layoutSubviews](&v3, sel_layoutSubviews);
  }
}

- (void)_scrollViewWillBeginDragging
{
  objc_super v3;

  -[UIPageController _scrollViewWillBeginPaging](self->_pageController, "_scrollViewWillBeginPaging");
  v3.receiver = self;
  v3.super_class = (Class)UIPageControllerScrollView;
  -[UIScrollView _scrollViewWillBeginDragging](&v3, sel__scrollViewWillBeginDragging);
}

- (void)_scrollViewDidEndDraggingWithDeceleration:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (!a3)
  {
    -[UIPageController _scrollViewDidScroll:forceUpdate:](self->_pageController, "_scrollViewDidScroll:forceUpdate:", self, 1);
    -[UIPageController _scrollViewDidEndPaging](self->_pageController, "_scrollViewDidEndPaging");
  }
  v5.receiver = self;
  v5.super_class = (Class)UIPageControllerScrollView;
  -[UIScrollView _scrollViewDidEndDraggingWithDeceleration:](&v5, sel__scrollViewDidEndDraggingWithDeceleration_, v3);
}

- (void)_scrollViewDidEndDecelerating
{
  objc_super v3;

  -[UIPageController _scrollViewDidScroll:forceUpdate:](self->_pageController, "_scrollViewDidScroll:forceUpdate:", self, 1);
  -[UIPageController _scrollViewDidEndPaging](self->_pageController, "_scrollViewDidEndPaging");
  v3.receiver = self;
  v3.super_class = (Class)UIPageControllerScrollView;
  -[UIScrollView _scrollViewDidEndDecelerating](&v3, sel__scrollViewDidEndDecelerating);
}

- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v7;

  v4 = a4;
  -[UIPageController _scrollViewDidScroll:forceUpdate:](self->_pageController, "_scrollViewDidScroll:forceUpdate:", self, 1);
  -[UIPageController _scrollViewDidEndPaging](self->_pageController, "_scrollViewDidEndPaging");
  v7.receiver = self;
  v7.super_class = (Class)UIPageControllerScrollView;
  -[UIScrollView _scrollViewAnimationEnded:finished:](&v7, sel__scrollViewAnimationEnded_finished_, a3, v4);
}

- (unint64_t)_abuttedPagingEdges
{
  unint64_t v3;
  int64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  float v13;
  float v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)UIPageControllerScrollView;
  v3 = -[UIScrollView _abuttedPagingEdges](&v16, sel__abuttedPagingEdges);
  if (!-[UIScrollView _isHorizontalBouncing](self, "_isHorizontalBouncing"))
  {
    -[UIPageController delegate](self->_pageController, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = -[UIPageController visibleIndex](self->_pageController, "visibleIndex");
      -[UIScrollView _pageDecelerationTarget](self, "_pageDecelerationTarget");
      v6 = v5;
      -[UIScrollView contentOffset](self, "contentOffset");
      v8 = v7;
      if (-[UIScrollView isDecelerating](self, "isDecelerating"))
      {
        v9 = v6 - v8;
        v10 = fabs(v6 - v8);
        if (v10 >= 2.22044605e-16)
        {
          v11 = *(_QWORD *)&v9;
          -[UIView bounds](self, "bounds");
          v13 = v10 / v12;
          v14 = ceilf(v13);
          if (v11 < 0)
            v14 = -v14;
          v4 = (uint64_t)(float)(v14 + (float)v4);
        }
      }
      return v3 & 0xFFFFFFFFFFFFFFF5 | (2 * (v4 < 1)) | (8
                                                           * (v4 >= -[UIPageController pageCount](self->_pageController, "pageCount")- 1));
    }
  }
  return v3;
}

- (UIPageController)pageController
{
  return self->_pageController;
}

- (void)setPageController:(id)a3
{
  self->_pageController = (UIPageController *)a3;
}

@end
