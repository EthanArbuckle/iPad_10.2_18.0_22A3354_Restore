@implementation UIKBTutorialMultipageView

- (UIKBTutorialMultipageView)initWithPageViews:(id)a3 pagingInterval:(double)a4
{
  id v7;
  _BOOL4 v8;
  double v9;
  double v10;
  UIKBTutorialMultipageView *v11;
  UIKBTutorialMultipageView *v12;
  id *p_pageViews;
  double v14;
  UIPageControl *v15;
  UIPageControl *pageControl;
  void *v17;
  void *v18;
  UIScrollView *v19;
  UIScrollView *pageScrollView;
  unint64_t v21;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  UIKBTutorialMultipageView *v47;
  uint64_t v49;
  uint64_t v50;
  objc_super v51;

  v7 = a3;
  v8 = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1;
  v9 = dbl_18667CC20[v8];
  v10 = dbl_18667CC30[v8];
  v51.receiver = self;
  v51.super_class = (Class)UIKBTutorialMultipageView;
  v11 = -[UIView initWithSize:](&v51, sel_initWithSize_, v9, v10);
  v12 = v11;
  if (v11)
  {
    p_pageViews = (id *)&v11->_pageViews;
    objc_storeStrong((id *)&v11->_pageViews, a3);
    v49 = 448;
    v12->_pagingInterval = a4;
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v14 = 11.0;
    else
      v14 = 5.0;
    v15 = -[UIView initWithSize:]([UIPageControl alloc], "initWithSize:", 59.0, v14);
    pageControl = v12->_pageControl;
    v12->_pageControl = v15;

    -[UIPageControl setNumberOfPages:](v12->_pageControl, "setNumberOfPages:", objc_msgSend(*p_pageViews, "count"));
    -[UIPageControl setCurrentPage:](v12->_pageControl, "setCurrentPage:", 0);
    -[UIPageControl setHidesForSinglePage:](v12->_pageControl, "setHidesForSinglePage:", 1);
    +[UIColor lightGrayColor](UIColor, "lightGrayColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageControl setPageIndicatorTintColor:](v12->_pageControl, "setPageIndicatorTintColor:", v17);

    +[UIColor darkGrayColor](UIColor, "darkGrayColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageControl setCurrentPageIndicatorTintColor:](v12->_pageControl, "setCurrentPageIndicatorTintColor:", v18);

    -[UIView addSubview:](v12, "addSubview:", v12->_pageControl);
    v19 = objc_alloc_init(UIScrollView);
    pageScrollView = v12->_pageScrollView;
    v12->_pageScrollView = v19;

    -[UIScrollView setDelegate:](v12->_pageScrollView, "setDelegate:", v12);
    -[UIScrollView setPagingEnabled:](v12->_pageScrollView, "setPagingEnabled:", 1);
    -[UIScrollView setShowsVerticalScrollIndicator:](v12->_pageScrollView, "setShowsVerticalScrollIndicator:", 0);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v12->_pageScrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIView addSubview:](v12, "addSubview:", v12->_pageScrollView);
    if (objc_msgSend(*p_pageViews, "count"))
    {
      v21 = 0;
      v22 = 0;
      do
      {
        objc_msgSend(*p_pageViews, "objectAtIndex:", v21, v49);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[UIView addSubview:](v12->_pageScrollView, "addSubview:", v23);
        objc_msgSend(v23, "leadingAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(v22, "trailingAnchor");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "constraintEqualToAnchor:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setActive:", 1);
        }
        else
        {
          -[UIScrollView contentLayoutGuide](v12->_pageScrollView, "contentLayoutGuide");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "leadingAnchor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "constraintEqualToAnchor:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setActive:", 1);

        }
        objc_msgSend(v23, "topAnchor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIScrollView contentLayoutGuide](v12->_pageScrollView, "contentLayoutGuide");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "topAnchor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "constraintEqualToAnchor:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setActive:", 1);

        objc_msgSend(v23, "bottomAnchor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIScrollView contentLayoutGuide](v12->_pageScrollView, "contentLayoutGuide");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "bottomAnchor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "constraintEqualToAnchor:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setActive:", 1);

        objc_msgSend(v23, "widthAnchor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIScrollView frameLayoutGuide](v12->_pageScrollView, "frameLayoutGuide");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "widthAnchor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "constraintEqualToAnchor:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setActive:", 1);

        objc_msgSend(v23, "heightAnchor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView heightAnchor](v12->_pageScrollView, "heightAnchor");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "constraintEqualToAnchor:multiplier:", v41, 0.99);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setActive:", 1);

        ++v21;
        v22 = v23;
      }
      while (v21 < objc_msgSend(*p_pageViews, "count"));
    }
    else
    {
      v23 = 0;
    }
    -[UIScrollView contentLayoutGuide](v12->_pageScrollView, "contentLayoutGuide", v49);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setActive:", 1);

    if ((unint64_t)objc_msgSend(*p_pageViews, "count") > 1
      && *(double *)((char *)&v12->super.super.super.isa + v50) > 0.0)
    {
      -[UIKBTutorialMultipageView scrollToNextPage](v12, "scrollToNextPage");
    }
    v47 = v12;

  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextPageScrollTimer, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_pageViews, 0);
  objc_storeStrong((id *)&self->_pageScrollView, 0);
}

- (void)configMediaView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  id v29;

  -[UIKBTutorialMultipageView pageControl](self, "pageControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIKBTutorialMultipageView pageControl](self, "pageControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self, "centerXAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[UIKBTutorialMultipageView pageControl](self, "pageControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[UIKBTutorialMultipageView pageScrollView](self, "pageScrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIKBTutorialMultipageView pageScrollView](self, "pageScrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[UIKBTutorialMultipageView pageScrollView](self, "pageScrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

  -[UIKBTutorialMultipageView pageScrollView](self, "pageScrollView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

  if (-[NSArray count](self->_pageViews, "count") > 1)
  {
    -[UIKBTutorialMultipageView pageControl](self, "pageControl");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "topAnchor");
    v29 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIView bottomAnchor](self, "bottomAnchor");
    v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[UIKBTutorialMultipageView pageScrollView](self, "pageScrollView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActive:", 1);

}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  id v8;
  CGRect v9;

  objc_msgSend(a3, "contentOffset");
  v5 = v4;
  -[UIKBTutorialMultipageView pageScrollView](self, "pageScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = v5 / CGRectGetWidth(v9);

  -[UIKBTutorialMultipageView pageControl](self, "pageControl");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCurrentPage:", llround(v7));

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;

  -[UIKBTutorialMultipageView nextPageScrollTimer](self, "nextPageScrollTimer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[UIKBTutorialMultipageView setNextPageScrollTimer:](self, "setNextPageScrollTimer:", 0);
}

- (void)scrollToNextPage
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];

  -[UIKBTutorialMultipageView pageControl](self, "pageControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentPage");

  -[UIKBTutorialMultipageView nextPageScrollTimer](self, "nextPageScrollTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v4 + 1;
    -[UIKBTutorialMultipageView pageControl](self, "pageControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfPages");

    if (v6 >= v8)
    {
      -[UIKBTutorialMultipageView nextPageScrollTimer](self, "nextPageScrollTimer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "invalidate");

      -[UIKBTutorialMultipageView setNextPageScrollTimer:](self, "setNextPageScrollTimer:", 0);
    }
    else
    {
      -[UIKBTutorialMultipageView pageScrollView](self, "pageScrollView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setNeedsLayout");

      -[UIKBTutorialMultipageView pageScrollView](self, "pageScrollView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBTutorialMultipageView pageScrollView](self, "pageScrollView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contentSize");
      v13 = v12;
      -[UIKBTutorialMultipageView pageControl](self, "pageControl");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setContentOffset:animated:", 1, v13 / (double)objc_msgSend(v14, "numberOfPages") * (double)v6, 0.0);

      -[UIKBTutorialMultipageView pageControl](self, "pageControl");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCurrentPage:", v6);

    }
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0C99E88]);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialMultipageView pagingInterval](self, "pagingInterval");
    objc_msgSend(v16, "dateByAddingTimeInterval:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialMultipageView pagingInterval](self, "pagingInterval");
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __45__UIKBTutorialMultipageView_scrollToNextPage__block_invoke;
    v23[3] = &unk_1E16C4358;
    v23[4] = self;
    v18 = (void *)objc_msgSend(v15, "initWithFireDate:interval:repeats:block:", v17, 1, v23);
    -[UIKBTutorialMultipageView setNextPageScrollTimer:](self, "setNextPageScrollTimer:", v18);

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialMultipageView nextPageScrollTimer](self, "nextPageScrollTimer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addTimer:forMode:", v20, *MEMORY[0x1E0C99748]);

  }
}

uint64_t __45__UIKBTutorialMultipageView_scrollToNextPage__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scrollToNextPage");
}

- (void)resetPageScrolling
{
  void *v3;
  void *v4;
  void *v5;

  -[UIKBTutorialMultipageView pageControl](self, "pageControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentPage:", 0);

  -[UIKBTutorialMultipageView nextPageScrollTimer](self, "nextPageScrollTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[UIKBTutorialMultipageView setNextPageScrollTimer:](self, "setNextPageScrollTimer:", 0);
  -[UIKBTutorialMultipageView pageScrollView](self, "pageScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentOffset:", 0.0, 0.0);

  -[UIKBTutorialMultipageView scrollToNextPage](self, "scrollToNextPage");
}

- (UIScrollView)pageScrollView
{
  return self->_pageScrollView;
}

- (void)setPageScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_pageScrollView, a3);
}

- (NSArray)pageViews
{
  return self->_pageViews;
}

- (void)setPageViews:(id)a3
{
  objc_storeStrong((id *)&self->_pageViews, a3);
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_pageControl, a3);
}

- (NSTimer)nextPageScrollTimer
{
  return self->_nextPageScrollTimer;
}

- (void)setNextPageScrollTimer:(id)a3
{
  objc_storeStrong((id *)&self->_nextPageScrollTimer, a3);
}

- (double)pagingInterval
{
  return self->_pagingInterval;
}

- (void)setPagingInterval:(double)a3
{
  self->_pagingInterval = a3;
}

@end
