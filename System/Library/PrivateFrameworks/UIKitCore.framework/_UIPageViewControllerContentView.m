@implementation _UIPageViewControllerContentView

- (BOOL)canBecomeFocused
{
  return 1;
}

- (id)preferredFocusedView
{
  return self->_scrollView;
}

- (_UIPageViewControllerContentView)initWithFrame:(CGRect)a3 andPageViewController:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _UIPageViewControllerContentView *v10;
  _UIPageViewControllerContentView *v11;
  id WeakRetained;
  uint64_t v13;
  id v14;
  int v15;
  UIPageControl *v16;
  uint64_t v17;
  UIPageControl *pageControl;
  _UIQueuingScrollView *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  uint64_t v29;
  _UIQueuingScrollView *scrollView;
  _UIQueuingScrollView *v31;
  id v32;
  _UIQueuingScrollView *v33;
  id v34;
  objc_super v36;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)_UIPageViewControllerContentView;
  v10 = -[UIView initWithFrame:](&v36, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_pageViewController, v9);
    -[UIView setAutoresizingMask:](v11, "setAutoresizingMask:", 18);
    WeakRetained = objc_loadWeakRetained((id *)&v11->_pageViewController);
    v13 = objc_msgSend(WeakRetained, "_transitionStyle");

    if (v13 == 1)
    {
      -[UIView setClipsToBounds:](v11, "setClipsToBounds:", 1);
      v14 = objc_loadWeakRetained((id *)&v11->_pageViewController);
      v15 = objc_msgSend(v14, "_isPageControlVisible");

      if (v15)
      {
        v16 = [UIPageControl alloc];
        v17 = -[UIPageControl initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        pageControl = v11->_pageControl;
        v11->_pageControl = (UIPageControl *)v17;

        -[_UIPageViewControllerContentView _setupPageControl:](v11, "_setupPageControl:", v11->_pageControl);
      }
      v19 = [_UIQueuingScrollView alloc];
      -[UIView bounds](v11, "bounds");
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v28 = objc_loadWeakRetained((id *)&v11->_pageViewController);
      v29 = -[_UIQueuingScrollView initWithFrame:navigationOrientation:](v19, "initWithFrame:navigationOrientation:", objc_msgSend(v28, "navigationOrientation"), v21, v23, v25, v27);
      scrollView = v11->_scrollView;
      v11->_scrollView = (_UIQueuingScrollView *)v29;

      v31 = v11->_scrollView;
      v32 = objc_loadWeakRetained((id *)&v11->_pageViewController);
      -[_UIQueuingScrollView setQDelegate:](v31, "setQDelegate:", v32);

      v33 = v11->_scrollView;
      v34 = objc_loadWeakRetained((id *)&v11->_pageViewController);
      -[_UIQueuingScrollView setQDataSource:](v33, "setQDataSource:", v34);

      -[UIScrollView _setResetsBoundingPathForSubtree:](v11->_scrollView, "_setResetsBoundingPathForSubtree:", 0);
      -[UIView addSubview:](v11, "addSubview:", v11->_scrollView);
    }
  }

  return v11;
}

- (void)invalidatePageViewController
{
  -[_UIQueuingScrollView setQDelegate:](self->_scrollView, "setQDelegate:", 0);
  -[_UIQueuingScrollView setQDataSource:](self->_scrollView, "setQDataSource:", 0);
  objc_storeWeak((id *)&self->_pageViewController, 0);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  UIPageViewController **p_pageViewController;
  id WeakRetained;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  BOOL v23;
  id v24;
  objc_super v25;
  CGRect v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v25.receiver = self;
  v25.super_class = (Class)_UIPageViewControllerContentView;
  -[UIView setBounds:](&v25, sel_setBounds_, x, y, width, height);
  p_pageViewController = &self->_pageViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pageViewController);
  if (WeakRetained)
  {
    v18 = WeakRetained;
    -[UIView bounds](self, "bounds");
    v27.origin.x = v19;
    v27.origin.y = v20;
    v27.size.width = v21;
    v27.size.height = v22;
    v26.origin.x = v9;
    v26.origin.y = v11;
    v26.size.width = v13;
    v26.size.height = v15;
    v23 = CGRectEqualToRect(v26, v27);

    if (!v23)
    {
      v24 = objc_loadWeakRetained((id *)p_pageViewController);
      objc_msgSend(v24, "_contentViewFrameOrBoundsDidChange");

    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  UIPageViewController **p_pageViewController;
  id WeakRetained;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  BOOL v23;
  id v24;
  objc_super v25;
  CGRect v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v25.receiver = self;
  v25.super_class = (Class)_UIPageViewControllerContentView;
  -[UIView setFrame:](&v25, sel_setFrame_, x, y, width, height);
  p_pageViewController = &self->_pageViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pageViewController);
  if (WeakRetained)
  {
    v18 = WeakRetained;
    -[UIView frame](self, "frame");
    v27.origin.x = v19;
    v27.origin.y = v20;
    v27.size.width = v21;
    v27.size.height = v22;
    v26.origin.x = v9;
    v26.origin.y = v11;
    v26.size.width = v13;
    v26.size.height = v15;
    v23 = CGRectEqualToRect(v26, v27);

    if (!v23)
    {
      v24 = objc_loadWeakRetained((id *)p_pageViewController);
      objc_msgSend(v24, "_contentViewFrameOrBoundsDidChange");

    }
  }
}

- (double)_pageSpacing
{
  id WeakRetained;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pageViewController);
  objc_msgSend(WeakRetained, "_pageSpacing");
  v4 = v3;

  return v4;
}

- (CGRect)_scrollViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIPageControl *pageControl;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect result;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  pageControl = self->_pageControl;
  if (pageControl)
  {
    -[UIView frame](pageControl, "frame");
    v10 = v10 - CGRectGetHeight(v17);
    if (dyld_program_sdk_at_least())
    {
      -[UIView safeAreaInsets](self, "safeAreaInsets");
      v10 = v10 - v12;
    }
  }
  v13 = v4;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_setupPageControl:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "_setFlickToEndGestureEnabled:", 0);
  objc_msgSend(v5, "setAutoresizingMask:", 10);
  WeakRetained = objc_loadWeakRetained((id *)&self->_pageViewController);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", WeakRetained, sel__pageControlValueChanged_, 4096);

  -[UIView addSubview:](self, "addSubview:", v5);
}

- (void)layoutSubviews
{
  id WeakRetained;
  int v4;
  UIPageControl *pageControl;
  UIPageControl *v6;
  UIPageControl *v7;
  UIPageControl *v8;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double Height;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  UIPageControl *v29;
  _UIQueuingScrollView *scrollView;
  _UIQueuingScrollView *v31;
  double v32;
  objc_super v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v33.receiver = self;
  v33.super_class = (Class)_UIPageViewControllerContentView;
  -[UIView layoutSubviews](&v33, sel_layoutSubviews);
  WeakRetained = objc_loadWeakRetained((id *)&self->_pageViewController);
  v4 = objc_msgSend(WeakRetained, "_isPageControlVisible");

  pageControl = self->_pageControl;
  if (v4)
  {
    if (!pageControl)
    {
      v6 = [UIPageControl alloc];
      v7 = -[UIPageControl initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v8 = self->_pageControl;
      self->_pageControl = v7;

      -[_UIPageViewControllerContentView _setupPageControl:](self, "_setupPageControl:", self->_pageControl);
      pageControl = self->_pageControl;
    }
    if (!-[UIPageControl numberOfPages](pageControl, "numberOfPages"))
    {
      v9 = objc_loadWeakRetained((id *)&self->_pageViewController);
      objc_msgSend(v9, "_updatePageControlViaDataSourceIfNecessary");

    }
    -[UIView sizeToFit](self->_pageControl, "sizeToFit");
    -[UIView frame](self->_pageControl, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[UIView bounds](self, "bounds");
    Height = CGRectGetHeight(v34);
    if (dyld_program_sdk_at_least())
    {
      -[UIView safeAreaInsets](self, "safeAreaInsets");
      Height = Height - v19;
    }
    v35.origin.x = v11;
    v35.origin.y = v13;
    v35.size.width = v15;
    v35.size.height = v17;
    v20 = Height - CGRectGetHeight(v35);
    -[UIView center](self, "center");
    v22 = v21;
    v24 = v23;
    -[UIView superview](self, "superview");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v25, v22, v24);
    v27 = v26;
    v36.origin.x = v11;
    v36.origin.y = v20;
    v36.size.width = v15;
    v36.size.height = v17;
    v28 = v27 + CGRectGetWidth(v36) * -0.5;

    -[UIView setFrame:](self->_pageControl, "setFrame:", v28, v20, v15, v17);
  }
  else
  {
    -[UIView removeFromSuperview](pageControl, "removeFromSuperview");
    v29 = self->_pageControl;
    self->_pageControl = 0;

  }
  scrollView = self->_scrollView;
  -[_UIPageViewControllerContentView _scrollViewFrame](self, "_scrollViewFrame");
  -[_UIQueuingScrollView _setFrameAndApplyPageSpacing:](scrollView, "_setFrameAndApplyPageSpacing:");
  v31 = self->_scrollView;
  -[_UIPageViewControllerContentView _pageSpacing](self, "_pageSpacing");
  -[_UIQueuingScrollView setPageSpacing:](v31, "setPageSpacing:", v32 * 0.5);
}

- (_UIQueuingScrollView)scrollView
{
  return self->_scrollView;
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_destroyWeak((id *)&self->_pageViewController);
}

@end
