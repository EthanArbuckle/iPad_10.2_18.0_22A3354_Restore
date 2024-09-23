@implementation MTAStopwatchPagingViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  UIScrollView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTAStopwatchPagingViewController;
  -[MTAStopwatchPagingViewController loadView](&v11, "loadView");
  v3 = objc_opt_new(UIScrollView);
  -[MTAStopwatchPagingViewController setScrollView:](self, "setScrollView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController scrollView](self, "scrollView"));
  objc_msgSend(v4, "setPagingEnabled:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController scrollView](self, "scrollView"));
  objc_msgSend(v5, "setShowsHorizontalScrollIndicator:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController scrollView](self, "scrollView"));
  objc_msgSend(v6, "setAutoresizesSubviews:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController scrollView](self, "scrollView"));
  objc_msgSend(v7, "setDelegate:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController view](self, "view"));
  objc_msgSend(v8, "setAutoresizesSubviews:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController scrollView](self, "scrollView"));
  objc_msgSend(v9, "addSubview:", v10);

}

- (void)setPages:(id)a3
{
  NSArray *v5;
  NSArray *pages;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  NSArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v5 = (NSArray *)a3;
  pages = self->_pages;
  if (pages != v5)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = pages;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "removeFromSuperview");
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v9);
    }

    objc_storeStrong((id *)&self->_pages, a3);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = self->_pages;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j);
          objc_msgSend(v17, "setAutoresizesSubviews:", 0, (_QWORD)v20);
          objc_msgSend(v17, "setAutoresizingMask:", 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController scrollView](self, "scrollView"));
          objc_msgSend(v18, "addSubview:", v17);

        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v14);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController view](self, "view"));
    objc_msgSend(v19, "setNeedsLayout");

  }
}

- (void)setCurrentPage:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v4 = a4;
  self->_currentPage = a3;
  v6 = (double)a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController scrollView](self, "scrollView"));
  objc_msgSend(v7, "bounds");
  v9 = v8 * v6;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController scrollView](self, "scrollView"));
  objc_msgSend(v10, "setContentOffset:animated:", v4, v9, 0.0);

}

- (void)setCurrentPage:(unint64_t)a3
{
  -[MTAStopwatchPagingViewController setCurrentPage:animated:](self, "setCurrentPage:animated:", a3, 0);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTAStopwatchPagingViewController;
  -[MTAStopwatchPagingViewController viewWillLayoutSubviews](&v13, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController scrollView](self, "scrollView"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  double x;
  double y;
  uint64_t v19;
  void *i;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  unint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];

  v32.receiver = self;
  v32.super_class = (Class)MTAStopwatchPagingViewController;
  -[MTAStopwatchPagingViewController viewDidLayoutSubviews](&v32, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController view](self, "view"));
  v4 = objc_msgSend(v3, "mtui_isRTL");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController scrollView](self, "scrollView"));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController pages](self, "pages"));
  v11 = v10;
  if ((v4 & 1) != 0)
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "reverseObjectEnumerator"));
  else
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectEnumerator"));
  v13 = (void *)v12;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v15)
  {
    v16 = v15;
    x = CGPointZero.x;
    y = CGPointZero.y;
    v19 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "setFrame:", x, y, v7, v9, (_QWORD)v28);
        x = v7 + x;
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v16);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController pages](self, "pages"));
  v22 = v7 * (double)(unint64_t)objc_msgSend(v21, "count");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController scrollView](self, "scrollView"));
  objc_msgSend(v23, "setContentSize:", v22, v9);

  if ((v4 & 1) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController pages](self, "pages"));
    v25 = objc_msgSend(v24, "count");
    v26 = (unint64_t)v25 + ~-[MTAStopwatchPagingViewController currentPage](self, "currentPage");

  }
  else
  {
    v26 = -[MTAStopwatchPagingViewController currentPage](self, "currentPage");
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController scrollView](self, "scrollView", (_QWORD)v28));
  objc_msgSend(v27, "setContentOffset:", v7 * (double)v26, 0.0);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)MTAStopwatchPagingViewController;
  v7 = a4;
  -[MTAStopwatchPagingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100046050;
  v8[3] = &unk_1000992F8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7;
  void *v8;
  unsigned int v9;
  double x;
  double v11;
  double v12;
  unint64_t v13;
  void *v14;
  id v15;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController view](self, "view"));
  v9 = objc_msgSend(v8, "mtui_isRTL");

  x = a5->x;
  objc_msgSend(v7, "bounds");
  v12 = v11;

  v13 = vcvtad_u64_f64(x / v12);
  if (v9)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController pages](self, "pages"));
    v13 = (unint64_t)objc_msgSend(v14, "count") + ~v13;

  }
  if (v13 != self->_currentPage)
  {
    self->_currentPage = v13;
    v15 = (id)objc_claimAutoreleasedReturnValue(-[MTAStopwatchPagingViewController delegate](self, "delegate"));
    objc_msgSend(v15, "stopwatchPagingViewController:didPage:", self, self->_currentPage);

  }
}

- (MTAStopwatchPagingViewControllerDelegate)delegate
{
  return (MTAStopwatchPagingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)pages
{
  return self->_pages;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (unint64_t)currentPage
{
  return self->_currentPage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_pages, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
