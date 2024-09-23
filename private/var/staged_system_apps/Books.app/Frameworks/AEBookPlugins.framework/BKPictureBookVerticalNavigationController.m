@implementation BKPictureBookVerticalNavigationController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKPictureBookVerticalNavigationController;
  -[BKPictureBookVerticalNavigationController viewDidLoad](&v4, "viewDidLoad");
  -[BKPictureBookVerticalNavigationController setPageNumberBeforeTransition:](self, "setPageNumberBeforeTransition:", 0x7FFFFFFFFFFFFFFFLL);
  -[BKPictureBookVerticalNavigationController _setupScrollView](self, "_setupScrollView");
  -[BKPictureBookVerticalNavigationController _setupGestures](self, "_setupGestures");
  if (-[BKPageNavigationViewController pageOffset](self, "pageOffset") != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[BKPictureBookVerticalNavigationController _displayPagesForOffset:](self, "_displayPagesForOffset:", -[BKPageNavigationViewController pageOffset](self, "pageOffset"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate"));
    objc_msgSend(v3, "pageNavigationDidChangeLocation:", self);

  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  void *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  objc_super v15;
  uint8_t buf[4];
  char *v17;

  v15.receiver = self;
  v15.super_class = (Class)BKPictureBookVerticalNavigationController;
  -[BKPictureBookVerticalNavigationController viewIsAppearing:](&v15, "viewIsAppearing:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitionLocationForNavigationController"));

  v6 = -[BKPictureBookVerticalNavigationController currentPageNumber](self, "currentPageNumber");
  objc_opt_class(BKPageLocation);
  v8 = BUDynamicCast(v7, v5);
  v9 = (char *)objc_claimAutoreleasedReturnValue(v8);
  if (v9)
  {
    v10 = _AECaptureLocationLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "#PictureBookVerticalNVC viewWillAppear using location:%@", buf, 0xCu);
    }

    v12 = objc_msgSend(v9, "ordinal");
    v6 = (char *)objc_msgSend(v9, "pageOffset") + (_QWORD)v12 + 1;
  }
  v13 = _AECaptureLocationLog();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v17 = v6;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "#PictureBookVerticalNVC viewWillAppear transitioning to page number: %lu", buf, 0xCu);
  }

  -[BKPictureBookVerticalNavigationController setPageNumberBeforeTransition:](self, "setPageNumberBeforeTransition:", v6);
  -[BKPictureBookVerticalNavigationController _setupScrollView](self, "_setupScrollView");
  -[BKPictureBookVerticalNavigationController _displayPagesForOffset:](self, "_displayPagesForOffset:", (char *)-[BKPictureBookVerticalNavigationController pageNumberBeforeTransition](self, "pageNumberBeforeTransition")- 1);
  -[BKPictureBookVerticalNavigationController setPageNumberBeforeTransition:](self, "setPageNumberBeforeTransition:", 0x7FFFFFFFFFFFFFFFLL);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKPictureBookVerticalNavigationController;
  -[BKPictureBookVerticalNavigationController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[BKPictureBookVerticalNavigationController updateContentInsets](self, "updateContentInsets");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  id v18;
  void *v19;
  objc_super v20;
  _QWORD v21[5];
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate"));
  v9 = objc_msgSend(v8, "inLiveResize");

  if (v9)
    -[BKPictureBookVerticalNavigationController setPageNumberBeforeTransition:](self, "setPageNumberBeforeTransition:", -[BKPictureBookVerticalNavigationController currentPageNumber](self, "currentPageNumber"));
  if (-[BKPictureBookVerticalNavigationController isVisible](self, "isVisible"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate"));
    v11 = objc_msgSend(v10, "inLiveResize");

    if ((v11 & 1) == 0)
    {
      -[BKPictureBookVerticalNavigationController setAnimating:](self, "setAnimating:", 1);
      -[BKPictureBookVerticalNavigationController setPageNumberBeforeTransition:](self, "setPageNumberBeforeTransition:", -[BKPictureBookVerticalNavigationController currentPageNumber](self, "currentPageNumber"));
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController pageViews](self, "pageViews"));
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v24 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
            v18 = objc_msgSend(v17, "pageNumber");
            if (v18 == (id)-[BKPictureBookVerticalNavigationController pageNumberBeforeTransition](self, "pageNumberBeforeTransition"))
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "pageScrollerPageView"));
              objc_msgSend(v19, "setScrollState:", 3);

            }
            else
            {
              objc_msgSend(v17, "setAlpha:", 0.0);
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v14);
      }

      v21[4] = self;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_E9578;
      v22[3] = &unk_1BE8C8;
      v22[4] = self;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_E95B0;
      v21[3] = &unk_1BE8C8;
      objc_msgSend(v7, "animateAlongsideTransition:completion:", v22, v21);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)BKPictureBookVerticalNavigationController;
  -[BKPictureBookVerticalNavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v20, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKPictureBookVerticalNavigationController;
  -[BKPictureBookVerticalNavigationController viewSafeAreaInsetsDidChange](&v3, "viewSafeAreaInsetsDidChange");
  -[BKPictureBookVerticalNavigationController updateContentInsets](self, "updateContentInsets");
}

- (id)pageViews
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController pagesContainerView](self, "pagesContainerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "subviews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1C1C00));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v4));

  return v5;
}

- (void)updateContentInsets
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController view](self, "view"));
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController view](self, "view"));
  objc_msgSend(v6, "safeAreaInsets");
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", v5, 0.0);

  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v8 = v7;
  -[UIScrollView contentInset](self->_scrollView, "contentInset");
  if (v8 < v9)
  {
    -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
    v11 = v10;
    -[UIScrollView contentInset](self->_scrollView, "contentInset");
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v11, -v12);
  }
}

- (void)_setupGestures
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *doubleTapGesture;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "doubleTapGestureHandler:");
  doubleTapGesture = self->_doubleTapGesture;
  self->_doubleTapGesture = v3;

  -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_doubleTapGesture, "setNumberOfTapsRequired:", 2);
  -[UITapGestureRecognizer setDelegate:](self->_doubleTapGesture, "setDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController doubleTapGesture](self, "doubleTapGesture"));
  objc_msgSend(v5, "addGestureRecognizer:", v6);

  v8 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "tapGestureHandler:");
  if (self->_doubleTapGesture)
    objc_msgSend(v8, "requireGestureRecognizerToFail:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController view](self, "view"));
  objc_msgSend(v7, "addGestureRecognizer:", v8);

}

- (void)tapGestureHandler:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "contentView:unhandledClickAtPoint:");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate"));
    objc_msgSend(v6, "contentView:unhandledClickAtPoint:", 0, CGPointZero.x, CGPointZero.y);

  }
}

- (void)setAllowDoubleTapToZoom:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  if (self->_allowDoubleTapToZoom != a3)
    self->_allowDoubleTapToZoom = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController doubleTapGesture](self, "doubleTapGesture"));
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)doubleTapGestureHandler:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v18 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
  objc_msgSend(v4, "zoomScale");
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
  v8 = v7;
  if (v6 <= 1.0)
  {
    objc_msgSend(v18, "locationInView:", v7);
    v10 = v9;
    v12 = v11;

    -[BKPictureBookVerticalNavigationController pageSize](self, "pageSize");
    v14 = v13 * 0.5;
    -[BKPictureBookVerticalNavigationController pageSize](self, "pageSize");
    v16 = v15 * 0.5;
    v17 = v10 - v15 * 0.5 * 0.5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
    objc_msgSend(v8, "zoomToRect:animated:", 1, v17, v12 - v14 * 0.5, v16, v14);
  }
  else
  {
    objc_msgSend(v7, "setZoomScale:animated:", 1);
  }

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController doubleTapGesture](self, "doubleTapGesture"));

  return v5 == v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController doubleTapGesture](self, "doubleTapGesture"));

  if (v8 == v7)
  {
    v10 = 1;
  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController doubleTapGesture](self, "doubleTapGesture"));
    v10 = v9 == v6;

  }
  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  unsigned __int8 v9;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController doubleTapGesture](self, "doubleTapGesture"));

  if (v8 == v7)
    v9 = objc_msgSend(v6, "bk_isWKSyntheticTapGestureRecognizer");
  else
    v9 = 0;

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  unsigned int v10;
  uint64_t v12;
  char isKindOfClass;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController doubleTapGesture](self, "doubleTapGesture"));
  if ((id)v8 == v6)
  {
    objc_opt_class(UITapGestureRecognizer);
    isKindOfClass = objc_opt_isKindOfClass(v7, v12);

    if ((isKindOfClass & 1) == 0)
    {
      LOBYTE(v10) = 1;
      goto LABEL_5;
    }
    v9 = v7;
    if (objc_msgSend(v9, "numberOfTapsRequired") == (char *)&dword_0 + 2)
    {
      v10 = objc_msgSend(v9, "matchesTarget:andAction:", +[UIView be_wkContentViewClass](UIView, "be_wkContentViewClass"), "_nonBlockingDoubleTapRecognized:") ^ 1;
      goto LABEL_4;
    }
  }
  else
  {
    v9 = (id)v8;
  }
  LOBYTE(v10) = 1;
LABEL_4:

LABEL_5:
  return v10;
}

- (void)setZoomScale:(double)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (a3 < 1.0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
    objc_msgSend(v5, "setMinimumZoomScale:", a3);

  }
  if (a3 > 3.0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
    objc_msgSend(v6, "setMaximumZoomScale:", a3);

  }
  self->_scrollViewIsZooming = 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
  objc_msgSend(v7, "setZoomScale:", a3);

  self->_scrollViewIsZooming = 0;
}

- (void)resetZoomScale
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double y;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
  objc_msgSend(v3, "setMinimumZoomScale:", 1.0);

  if (-[BKPictureBookVerticalNavigationController _allowZoom](self, "_allowZoom"))
  {
    if (-[BKPictureBookVerticalNavigationController isViewLoaded](self, "isViewLoaded")
      && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController book](self, "book")),
          v4,
          v4))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController book](self, "book"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstDocument"));
      objc_msgSend(v6, "fixedLayoutSize");
      v8 = v7;

      -[BKPictureBookVerticalNavigationController pageSize](self, "pageSize");
      v10 = fmax(v8 / v9, 1.0) * 1.5;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
      v12 = v11;
      v13 = v10;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
      v12 = v11;
      v13 = 3.0;
    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
    v12 = v11;
    v13 = 1.0;
  }
  objc_msgSend(v11, "setMaximumZoomScale:", v13);

  self->_scrollViewIsZooming = 1;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
  objc_msgSend(v15, "minimumZoomScale");
  objc_msgSend(v14, "setZoomScale:");

  if ((unint64_t)-[BKPictureBookVerticalNavigationController currentPageNumber](self, "currentPageNumber") <= 1)
  {
    y = CGPointZero.y;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
    objc_msgSend(v17, "setContentOffset:", CGPointZero.x, y);

  }
  self->_scrollViewIsZooming = 0;
}

- (void)adjustToNewSize:(CGSize)a3
{
  -[BKPictureBookVerticalNavigationController _setupScrollView](self, "_setupScrollView", a3.width, a3.height);
  if (-[BKPictureBookVerticalNavigationController pageNumberBeforeTransition](self, "pageNumberBeforeTransition") == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[BKPictureBookVerticalNavigationController _updatePages](self, "_updatePages");
  }
  else
  {
    -[BKPictureBookVerticalNavigationController _displayPagesForOffset:](self, "_displayPagesForOffset:", (char *)-[BKPictureBookVerticalNavigationController pageNumberBeforeTransition](self, "pageNumberBeforeTransition")- 1);
    -[BKPictureBookVerticalNavigationController setPageNumberBeforeTransition:](self, "setPageNumberBeforeTransition:", 0x7FFFFFFFFFFFFFFFLL);
  }
}

- (void)_setupScrollView
{
  -[BKPictureBookVerticalNavigationController _setupScrollView:](self, "_setupScrollView:", 0);
}

- (void)_setupScrollView:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  void *v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  void *v36;
  id v37;
  void *v38;
  UIScrollView *v39;
  UIScrollView *scrollView;
  unsigned int v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  UIView *v47;
  UIView *pagesContainerView;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  double Width;
  void *v62;
  double Height;
  void *v64;
  _QWORD v65[6];
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate"));
    objc_msgSend(v7, "desiredBoundsForNavigationController");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController view](self, "view"));
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController view](self, "view"));
  objc_msgSend(v18, "setBackgroundColor:", v17);

  if (a3)
  {
    v19 = 1;
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController pagesContainerView](self, "pagesContainerView"));
      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController view](self, "view"));
        objc_msgSend(v22, "bounds");
        v24 = v23;
        v26 = v25;
        v28 = v27;
        v30 = v29;
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
        objc_msgSend(v31, "frame");
        v69.origin.x = v32;
        v69.origin.y = v33;
        v69.size.width = v34;
        v69.size.height = v35;
        v66.origin.x = v24;
        v66.origin.y = v26;
        v66.size.width = v28;
        v66.size.height = v30;
        v19 = !CGRectEqualToRect(v66, v69);

      }
      else
      {
        v19 = 1;
      }

    }
    else
    {
      v19 = 1;
    }

  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));

  if (v36)
  {
    -[BKPictureBookVerticalNavigationController resetZoomScale](self, "resetZoomScale");
  }
  else
  {
    v37 = objc_alloc((Class)UIScrollView);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController view](self, "view"));
    objc_msgSend(v38, "bounds");
    v39 = (UIScrollView *)objc_msgSend(v37, "initWithFrame:");
    scrollView = self->_scrollView;
    self->_scrollView = v39;

    -[UIScrollView setContentInsetAdjustmentBehavior:](self->_scrollView, "setContentInsetAdjustmentBehavior:", 2);
    -[UIScrollView setMinimumZoomScale:](self->_scrollView, "setMinimumZoomScale:", 1.0);
    v41 = -[BKPictureBookVerticalNavigationController _allowZoom](self, "_allowZoom");
    v42 = 3.0;
    if (!v41)
      v42 = 1.0;
    -[UIScrollView setMaximumZoomScale:](self->_scrollView, "setMaximumZoomScale:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIScrollView setBackgroundColor:](self->_scrollView, "setBackgroundColor:", v43);

    -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController view](self, "view"));
    objc_msgSend(v44, "addSubview:", self->_scrollView);

  }
  -[BKPictureBookVerticalNavigationController updateContentInsets](self, "updateContentInsets");
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController pagesContainerView](self, "pagesContainerView"));

  if (v45)
  {
    if (!v19)
      return;
  }
  else
  {
    v46 = objc_alloc((Class)UIView);
    -[UIScrollView bounds](self->_scrollView, "bounds");
    v47 = (UIView *)objc_msgSend(v46, "initWithFrame:");
    pagesContainerView = self->_pagesContainerView;
    self->_pagesContainerView = v47;

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIView setBackgroundColor:](self->_pagesContainerView, "setBackgroundColor:", v49);

    -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_pagesContainerView);
    if (!v19)
      return;
  }
  if (-[BKPageNavigationViewController pageCount](self, "pageCount") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController view](self, "view"));
    objc_msgSend(v50, "bounds");
    v52 = v51;
    v54 = v53;
    v56 = v55;
    v58 = v57;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
    objc_msgSend(v59, "setFrame:", v52, v54, v56, v58);

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
    objc_msgSend(v60, "bounds");
    Width = CGRectGetWidth(v67);
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
    objc_msgSend(v62, "bounds");
    Height = CGRectGetHeight(v68);
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController pagesContainerView](self, "pagesContainerView"));
    objc_msgSend(v64, "setFrame:", 0.0, 0.0, Width, Height);

    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_EA678;
    v65[3] = &unk_1C03B0;
    v65[4] = self;
    v65[5] = -[BKPageNavigationViewController pageCount](self, "pageCount");
    -[BKPictureBookVerticalNavigationController generatePositionForAllPages:](self, "generatePositionForAllPages:", v65);
  }
}

- (BOOL)shouldDisplaySpread
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double Width;
  void *v19;
  unsigned __int8 v20;
  CGRect v22;
  CGRect v23;

  if (!-[BKPictureBookVerticalNavigationController isViewLoaded](self, "isViewLoaded"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController book](self, "book"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstDocument"));
  objc_msgSend(v4, "fixedLayoutSize");
  v6 = v5;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController view](self, "view"));
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v22.origin.x = v11;
  v22.origin.y = v13;
  v22.size.width = v15;
  v22.size.height = v17;
  Width = CGRectGetWidth(v22);
  v23.origin.x = v11;
  v23.origin.y = v13;
  v23.size.width = v15;
  v23.size.height = v17;
  if (Width <= CGRectGetHeight(v23) || v6 > v8)
    return 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate"));
  v20 = objc_msgSend(v19, "supportsSpreadForVerticalLayout");

  return v20;
}

- (int64_t)currentPageNumber
{
  void *v3;
  int64_t v4;

  if (!self->_scrollView)
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
  objc_msgSend(v3, "contentOffset");
  v4 = -[BKPictureBookVerticalNavigationController pageNumberAtContentOffset:](self, "pageNumberAtContentOffset:");

  return v4;
}

- (int64_t)pageNumberAtContentOffset:(CGPoint)a3
{
  double v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  int64_t result;

  -[BKPictureBookVerticalNavigationController rawPageNumberForOffset:pageFraction:](self, "rawPageNumberForOffset:pageFraction:", a3.x, a3.y, 2.0);
  v5 = (uint64_t)v4;
  v6 = -[BKPictureBookVerticalNavigationController shouldDisplaySpread](self, "shouldDisplaySpread");
  v7 = 2 * v5;
  if (!v6)
    v7 = v5 + 1;
  if (v7 <= 1)
    v8 = 1;
  else
    v8 = v7;
  result = -[BKPageNavigationViewController pageCount](self, "pageCount");
  if (v8 < result)
    return v8;
  return result;
}

- (double)rawPageNumberForOffset:(CGPoint)a3 pageFraction:(double)a4
{
  double y;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  CGRect v22;

  y = a3.y;
  v7 = objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController book](self, "book", a3.x));
  v8 = 1.0;
  if (v7)
  {
    v9 = (void *)v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));

    if (v10)
    {
      -[BKPictureBookVerticalNavigationController pageSize](self, "pageSize");
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
      objc_msgSend(v13, "zoomScale");
      if (v14 == 0.0)
      {
        v17 = 1.0;
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
        objc_msgSend(v15, "zoomScale");
        v17 = v16;

      }
      -[BKPictureBookVerticalNavigationController _spaceBetweenPages](self, "_spaceBetweenPages");
      v19 = v12 + v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
      objc_msgSend(v20, "bounds");
      v8 = (y / v17 + CGRectGetHeight(v22) / a4) / v19;

    }
  }
  return v8;
}

- (BOOL)isPastEndOfBook:(CGPoint)a3
{
  double v4;
  double v5;
  unsigned int v6;
  uint64_t v7;
  double v8;

  -[BKPictureBookVerticalNavigationController rawPageNumberForOffset:pageFraction:](self, "rawPageNumberForOffset:pageFraction:", a3.x, a3.y, 1.0);
  v5 = v4;
  v6 = -[BKPictureBookVerticalNavigationController shouldDisplaySpread](self, "shouldDisplaySpread");
  v7 = -[BKPageNavigationViewController pageCount](self, "pageCount");
  if (v6)
    v8 = round((double)(v7 + 1) * 0.5);
  else
    v8 = (double)v7;
  return v5 - v8 > 0.1;
}

- (_NSRange)visiblePages
{
  int64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  if (self->_scrollView)
  {
    v3 = -[BKPictureBookVerticalNavigationController currentPageNumber](self, "currentPageNumber");
    if (-[BKPictureBookVerticalNavigationController shouldDisplaySpread](self, "shouldDisplaySpread") && v3 > 1)
      v4 = 2;
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (id)contentView
{
  return -[BKPictureBookVerticalNavigationController viewForPageNumber:](self, "viewForPageNumber:", -[BKPictureBookVerticalNavigationController currentPageNumber](self, "currentPageNumber"));
}

- (CGSize)pageSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize *p_pageSize;
  BOOL v9;
  double v10;
  double v11;
  BOOL v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double width;
  double height;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  p_pageSize = &self->_pageSize;
  v9 = self->_pageSize.width == CGSizeZero.width && self->_pageSize.height == CGSizeZero.height;
  if (!v9
    && ((-[BKPictureBookVerticalNavigationController _lastScrollViewSizeLayoutWasGeneratedFor](self, "_lastScrollViewSizeLayoutWasGeneratedFor"), v5 == v11)? (v12 = v7 == v10): (v12 = 0), v12))
  {
    width = p_pageSize->width;
    height = self->_pageSize.height;
  }
  else
  {
    -[BKPictureBookVerticalNavigationController set_lastScrollViewSizeLayoutWasGeneratedFor:](self, "set_lastScrollViewSizeLayoutWasGeneratedFor:", v5, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController book](self, "book"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstDocument"));
    objc_msgSend(v14, "fixedLayoutSize");
    v16 = v15;
    v18 = v17;

    if (-[BKPictureBookVerticalNavigationController shouldDisplaySpread](self, "shouldDisplaySpread"))
      v19 = v5 * 0.5;
    else
      v19 = v5;
    v20 = CGSizeScaledToFitInSize(v16, v18, v19, v7);
    v22 = v20 / v21;
    width = ceil(v20);
    height = floor(width / v22);
    p_pageSize->width = width;
    self->_pageSize.height = height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (id)viewForPageNumber:(int64_t)a3
{
  BKPictureBookPageContainerView *v3;
  int64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  id v20;
  NSObject *v21;
  _QWORD v23[6];
  uint8_t buf[4];
  int64_t v25;
  CGRect v26;
  CGRect v27;

  if ((unint64_t)a3 <= 0x7FFFFFFFFFFFFFFELL)
  {
    v6 = a3 + 5000;
    -[BKPictureBookVerticalNavigationController pageSize](self, "pageSize");
    v8 = v7;
    v10 = v9;
    -[BKPictureBookVerticalNavigationController originForPageNumber:](self, "originForPageNumber:", a3);
    v12 = v11;
    v14 = v13;
    v3 = (BKPictureBookPageContainerView *)objc_claimAutoreleasedReturnValue(-[UIView viewWithTag:](self->_pagesContainerView, "viewWithTag:", v6));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_EAEBC;
    v23[3] = &unk_1C1C28;
    v23[4] = self;
    v23[5] = a3;
    v15 = objc_retainBlock(v23);
    if (v3)
    {
      -[BKPictureBookPageContainerView frame](v3, "frame");
      v27.origin.x = v16;
      v27.origin.y = v17;
      v27.size.width = v18;
      v27.size.height = v19;
      v26.origin.x = v12;
      v26.origin.y = v14;
      v26.size.width = v8;
      v26.size.height = v10;
      if (CGRectEqualToRect(v26, v27))
      {
LABEL_10:

        return v3;
      }
      -[BKPictureBookPageContainerView setFrame:](v3, "setFrame:", v12, v14, v8, v10);
    }
    else
    {
      v20 = _AEWKPictureBookLog();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v25 = a3;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Creating View for page %lu", buf, 0xCu);
      }

      v3 = -[BKPictureBookPageContainerView initWithFrame:]([BKPictureBookPageContainerView alloc], "initWithFrame:", v12, v14, v8, v10);
      -[BKPictureBookPageContainerView setPageNumber:](v3, "setPageNumber:", a3);
      -[BKPictureBookPageContainerView setUseRoundedCornerRadius:](v3, "setUseRoundedCornerRadius:", -[BKPictureBookVerticalNavigationController _pageViewShouldHaveRoundedCorners](self, "_pageViewShouldHaveRoundedCorners"));
      -[BKPictureBookPageContainerView setAutoresizingMask:](v3, "setAutoresizingMask:", 0);
      -[BKPictureBookPageContainerView setTag:](v3, "setTag:", v6);
    }
    ((void (*)(_QWORD *, BKPictureBookPageContainerView *))v15[2])(v15, v3);
    goto LABEL_10;
  }
  v3 = 0;
  return v3;
}

- (CGRect)frameForPageNumber:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[BKPictureBookVerticalNavigationController pageSize](self, "pageSize");
  v6 = v5;
  v8 = v7;
  -[BKPictureBookVerticalNavigationController originForPageNumber:](self, "originForPageNumber:", a3);
  v11 = v6;
  v12 = v8;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)generatePositionForAllPages:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t v13;
  int64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL8 v20;
  int64_t v21;
  uint64_t v22;
  int64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;

  v27 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController _positionForPages](self, "_positionForPages"));
  if (!objc_msgSend(v4, "count"))
  {
    v14 = -[BKPageNavigationViewController pageCount](self, "pageCount");

    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  -[BKPictureBookVerticalNavigationController _lastScrollViewSizeLayoutWasGeneratedFor](self, "_lastScrollViewSizeLayoutWasGeneratedFor");
  if (v7 == v11 && v9 == v10)
  {

LABEL_14:
    goto LABEL_15;
  }
  v13 = -[BKPageNavigationViewController pageCount](self, "pageCount");

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_9:
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController pagesContainerView](self, "pagesContainerView"));
    objc_msgSend(v15, "bounds");
    v17 = v16;
    v19 = v18;

    v20 = -[BKPictureBookVerticalNavigationController shouldDisplaySpread](self, "shouldDisplaySpread");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[BKPageNavigationViewController pageCount](self, "pageCount")));
    v21 = -[BKPageNavigationViewController pageCount](self, "pageCount");
    if (v21 != -1)
    {
      v22 = 0;
      v23 = v21 + 1;
      do
      {
        -[BKPictureBookVerticalNavigationController originForPageNumber:pagesContainerSize:isSpread:](self, "originForPageNumber:pagesContainerSize:isSpread:", v22, v20, v17, v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPoint:](NSValue, "valueWithPoint:"));
        objc_msgSend(v4, "addObject:", v24);

        ++v22;
      }
      while (v23 != v22);
    }
    -[BKPictureBookVerticalNavigationController set_positionForPages:](self, "set_positionForPages:", v4);
    goto LABEL_14;
  }
LABEL_15:
  v25 = objc_retainBlock(v27);
  v26 = v25;
  if (v25)
    (*((void (**)(id))v25 + 2))(v25);

}

- (CGPoint)originForPageNumber:(int64_t)a3 pagesContainerSize:(CGSize)a4 isSpread:(BOOL)a5
{
  _BOOL4 v5;
  double width;
  void *v9;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int64_t v16;
  uint64_t v17;
  int64_t v18;
  double v19;
  double v20;
  CGPoint result;

  v5 = a5;
  width = a4.width;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController book](self, "book", a4.width, a4.height));
  v10 = objc_msgSend(v9, "bkPageProgressionDirection");

  -[BKPictureBookVerticalNavigationController pageSize](self, "pageSize");
  v13 = v12;
  if (v5)
  {
    if (((a3 ^ (v10 != 1)) & 1) == 0)
      v11 = 0.0;
    v14 = width * 0.5 - v11;
    -[BKPictureBookVerticalNavigationController _spaceBetweenPages](self, "_spaceBetweenPages");
    if (a3 >= 0)
      v16 = a3;
    else
      v16 = a3 + 1;
    v17 = v16 >> 1;
  }
  else
  {
    if (a3 <= 1)
      v18 = 1;
    else
      v18 = a3;
    v17 = v18 - 1;
    v14 = (width - v11) * 0.5;
    -[BKPictureBookVerticalNavigationController _spaceBetweenPages](self, "_spaceBetweenPages");
  }
  v19 = (v13 + v15) * (double)v17;
  v20 = v14;
  result.y = v19;
  result.x = v20;
  return result;
}

- (CGPoint)originForPageNumber:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  char *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _QWORD v27[2];
  CGPoint result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController _positionForPages](self, "_positionForPages"));
  v6 = objc_msgSend(v5, "count");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController _positionForPages](self, "_positionForPages"));
  if (v7 && (uint64_t)v6 > a3)
  {
    v8 = a3 & ~(a3 >> 63);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController _positionForPages](self, "_positionForPages"));
    v10 = (char *)objc_msgSend(v9, "count") - 1;

    if (v8 >= (unint64_t)v10)
      v11 = v10;
    else
      v11 = (char *)v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController _positionForPages](self, "_positionForPages"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v11));

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController pagesContainerView](self, "pagesContainerView"));
    objc_msgSend(v14, "bounds");
    v16 = v15;
    v18 = v17;

    -[BKPictureBookVerticalNavigationController originForPageNumber:pagesContainerSize:isSpread:](self, "originForPageNumber:pagesContainerSize:isSpread:", a3, -[BKPictureBookVerticalNavigationController shouldDisplaySpread](self, "shouldDisplaySpread"), v16, v18);
    v27[0] = v19;
    v27[1] = v20;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v27, "{CGPoint=dd}"));
  }
  objc_msgSend(v13, "CGPointValue");
  v22 = v21;
  v24 = v23;

  v25 = v22;
  v26 = v24;
  result.y = v26;
  result.x = v25;
  return result;
}

- (id)snapshotCurrentPageInContext
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController viewForPageNumber:](self, "viewForPageNumber:", -[BKPictureBookVerticalNavigationController currentPageNumber](self, "currentPageNumber")));
  objc_msgSend(v2, "bounds");
  if (v3 <= 0.0 || (v5 = v4, v4 <= 0.0))
  {
    v10 = _AEWKPictureBookLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "Snapshotting a CGSizeZero view", v13, 2u);
    }

    v9 = 0;
  }
  else
  {
    v6 = v3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat"));
    v8 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v7, v6, v5);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_EB4DC;
    v14[3] = &unk_1C1C50;
    v15 = v2;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageWithActions:", v14));

  }
  return v9;
}

- (void)contentViewImage:(BOOL)a3 completion:(id)a4
{
  -[BKPictureBookVerticalNavigationController contentViewImage:afterScreenUpdates:completion:](self, "contentViewImage:afterScreenUpdates:completion:", a3, 1, a4);
}

- (void)contentViewImage:(BOOL)a3 afterScreenUpdates:(BOOL)a4 completion:(id)a5
{
  BKPictureBookView *v6;
  BKPictureBookView *v7;
  id v8;
  double v9;
  double v10;
  char *v11;
  NSObject *v12;
  BKPictureBookView *v13;
  NSObject *v14;
  BKPictureBookView *v15;
  NSObject *v16;
  BKPictureBookView *v17;
  BKPictureBookView *v18;
  void *v19;
  int64_t v20;
  _QWORD v21[4];
  BKPictureBookView *v22;
  _QWORD block[4];
  BKPictureBookView *v24;
  BKPictureBookView *v25;
  _QWORD v26[4];
  BKPictureBookView *v27;
  BKPictureBookVerticalNavigationController *v28;
  NSObject *v29;
  _QWORD v30[4];
  BKPictureBookView *v31;
  BKPictureBookVerticalNavigationController *v32;
  NSObject *v33;

  v6 = (BKPictureBookView *)a5;
  if (-[BKPictureBookVerticalNavigationController shouldDisplaySpread](self, "shouldDisplaySpread"))
  {
    v7 = objc_alloc_init(BKPictureBookView);
    -[BKPictureBookVerticalNavigationController pageSize](self, "pageSize");
    -[BKPictureBookView setContentSize:](v7, "setContentSize:");
    -[BKPictureBookView setDrawsSpine:](v7, "setDrawsSpine:", 1);
    -[BKPictureBookVerticalNavigationController pageSize](self, "pageSize");
    v8 = +[BKPictureBookView actualSizeForContentSize:drawsSpine:](BKPictureBookView, "actualSizeForContentSize:drawsSpine:", 1);
    -[BKPictureBookView setFrame:](v7, "setFrame:", CGRectMakeWithSize(v8, v9, v10));
    v11 = (char *)-[BKPictureBookVerticalNavigationController currentPageNumber](self, "currentPageNumber") - 1;
    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_EB78C;
    v30[3] = &unk_1C1C78;
    v13 = v7;
    v31 = v13;
    v32 = self;
    v14 = v12;
    v33 = v14;
    -[BKPictureBookVerticalNavigationController _generateLeftPageImageAtPageOffset:completion:](self, "_generateLeftPageImageAtPageOffset:completion:", v11, v30);
    dispatch_group_enter(v14);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_EB7D0;
    v26[3] = &unk_1C1C78;
    v15 = v13;
    v27 = v15;
    v28 = self;
    v29 = v14;
    v16 = v14;
    -[BKPictureBookVerticalNavigationController _generateRightPageImageAtPageOffset:completion:](self, "_generateRightPageImageAtPageOffset:completion:", v11, v26);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_EB814;
    block[3] = &unk_1BF2A0;
    v24 = v15;
    v25 = v6;
    v17 = v6;
    v18 = v15;
    dispatch_group_notify(v16, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate"));
    v20 = -[BKPictureBookVerticalNavigationController currentPageNumber](self, "currentPageNumber");
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_EB95C;
    v21[3] = &unk_1BECB8;
    v22 = v6;
    v16 = v6;
    objc_msgSend(v19, "pageNavigationSnapshotForPageNumber:completion:", v20, v21);

    v18 = v22;
  }

}

- (void)_generateLeftPageImageAtPageOffset:(int64_t)a3 completion:(id)a4
{
  id v6;
  int64_t v7;
  id v8;

  v6 = a4;
  v7 = -[BKPageNavigationViewController leftPageNumberForSinglePageOffset:](self, "leftPageNumberForSinglePageOffset:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate"));
  objc_msgSend(v8, "pageNavigationSnapshotForPageNumber:completion:", v7, v6);

}

- (void)_generateRightPageImageAtPageOffset:(int64_t)a3 completion:(id)a4
{
  id v6;
  int64_t v7;
  id v8;

  v6 = a4;
  v7 = -[BKPageNavigationViewController rightPageNumberForSinglePageOffset:](self, "rightPageNumberForSinglePageOffset:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate"));
  objc_msgSend(v8, "pageNavigationSnapshotForPageNumber:completion:", v7, v6);

}

- (void)setPageCount:(int64_t)a3
{
  int64_t v5;
  objc_super v6;

  v5 = -[BKPageNavigationViewController pageCount](self, "pageCount");
  v6.receiver = self;
  v6.super_class = (Class)BKPictureBookVerticalNavigationController;
  -[BKPageNavigationViewController setPageCount:](&v6, "setPageCount:", a3);
  if (v5 != a3)
  {
    if (-[BKPictureBookVerticalNavigationController isViewLoaded](self, "isViewLoaded"))
    {
      -[BKPictureBookVerticalNavigationController _setupScrollView:](self, "_setupScrollView:", 1);
      -[BKPictureBookVerticalNavigationController _updatePages](self, "_updatePages");
    }
  }
}

- (void)setPageOffset:(int64_t)a3 completion:(id)a4
{
  id v6;
  int64_t v7;
  int64_t v8;
  id v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  unsigned __int8 v13;
  _QWORD v14[5];
  id v15;
  int64_t v16;

  v6 = a4;
  v7 = a3 & ~(a3 >> 63);
  v8 = -[BKPageNavigationViewController pageCount](self, "pageCount");
  if (v7 >= v8 - 1)
    v7 = v8 - 1;
  if (v7 == self->super._pageOffset)
  {
    v9 = objc_retainBlock(v6);
    v10 = v9;
    if (v9)
      (*((void (**)(id))v9 + 2))(v9);

  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_EBC2C;
    v14[3] = &unk_1C1CA0;
    v14[4] = self;
    v16 = v7;
    v15 = v6;
    v11 = objc_retainBlock(v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate"));
    v13 = objc_msgSend(v12, "pageNavigationController:shouldDelayChangeToPageOffset:completion:", self, v7, v11);

    if ((v13 & 1) == 0)
      ((void (*)(_QWORD *))v11[2])(v11);

  }
}

- (void)setPageOffset:(int64_t)a3
{
  -[BKPictureBookVerticalNavigationController setPageOffset:completion:](self, "setPageOffset:completion:", a3, 0);
}

- (void)_setPageOffsetUncheckedImmediate:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKPictureBookVerticalNavigationController;
  -[BKPageNavigationViewController setPageOffset:](&v6, "setPageOffset:");
  if (-[BKPictureBookVerticalNavigationController isViewLoaded](self, "isViewLoaded"))
  {
    -[BKPictureBookVerticalNavigationController _displayPagesForOffset:](self, "_displayPagesForOffset:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate"));
    objc_msgSend(v5, "pageNavigationDidChangeLocation:", self);

  }
}

- (void)turnToPageNumber:(int64_t)a3 animated:(BOOL)a4
{
  -[BKPictureBookVerticalNavigationController turnToPageNumber:animated:completion:](self, "turnToPageNumber:animated:completion:", a3, a4, 0);
}

- (void)turnToPageNumber:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  int64_t v7;
  id v8;
  void *v9;
  id v10;

  v10 = a5;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL
    || (v7 = -[BKPageNavigationViewController pageOffset](self, "pageOffset"), a3 < 1)
    || v7 + 1 == a3
    || -[BKPageNavigationViewController pageCount](self, "pageCount") < a3)
  {
    v8 = objc_retainBlock(v10);
    v9 = v8;
    if (v8)
      (*((void (**)(id))v8 + 2))(v8);

  }
  else
  {
    -[BKPictureBookVerticalNavigationController isVisible](self, "isVisible");
    -[BKPictureBookVerticalNavigationController setPageOffset:completion:](self, "setPageOffset:completion:", a3 - 1, v10);
  }

}

- (void)turnToNextPage
{
  uint64_t v3;
  unint64_t v4;

  if ((char *)-[BKPageNavigationViewController pageOffset](self, "pageOffset") == (char *)&dword_0 + 1)
  {
    v3 = 1;
  }
  else
  {
    -[BKPictureBookVerticalNavigationController visiblePages](self, "visiblePages");
    if (v4 <= 1)
      v3 = 1;
    else
      v3 = v4;
  }
  -[BKPageNavigationViewController turnToNextPageWithDelta:](self, "turnToNextPageWithDelta:", v3);
}

- (void)turnToPreviousPage
{
  unint64_t v3;
  uint64_t v4;

  -[BKPictureBookVerticalNavigationController visiblePages](self, "visiblePages");
  if (v3 <= 1)
    v4 = 1;
  else
    v4 = v3;
  -[BKPageNavigationViewController turnToPreviousPageWithDelta:](self, "turnToPreviousPageWithDelta:", v4);
}

- (BOOL)isZoomedOut
{
  return 0;
}

- (CGPoint)contentOffsetToScrollToForPageNumber:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double Height;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGPoint result;
  CGRect v23;

  -[BKPictureBookVerticalNavigationController originForPageNumber:](self, "originForPageNumber:", a3);
  v5 = v4;
  -[BKPictureBookVerticalNavigationController pageSize](self, "pageSize");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
  objc_msgSend(v8, "bounds");
  Height = CGRectGetHeight(v23);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
  objc_msgSend(v10, "zoomScale");
  v12 = v5 * v11;

  v13 = v12 + (Height - v7) * -0.5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
  objc_msgSend(v14, "contentInset");
  v16 = -v15;

  if (v13 >= v16)
    v16 = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
  objc_msgSend(v17, "contentSize");
  v19 = v18;

  if (v16 >= v19)
    v20 = v19;
  else
    v20 = v16;
  v21 = 0.0;
  result.y = v20;
  result.x = v21;
  return result;
}

- (void)_displayPagesForOffset:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  -[BKPictureBookVerticalNavigationController contentOffsetToScrollToForPageNumber:](self, "contentOffsetToScrollToForPageNumber:", a3 + 1);
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));
  objc_msgSend(v8, "setContentOffset:animated:", 0, v5, v7);

  self->_lastScrollSpeed = 0.0;
  -[BKPictureBookVerticalNavigationController _updatePages](self, "_updatePages");
}

- (id)_setupPageNumber:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  BKPageScrollerPageView *v13;
  BKPageScrollerPageView *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController viewForPageNumber:](self, "viewForPageNumber:"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController pagesContainerView](self, "pagesContainerView"));
      objc_msgSend(v8, "addSubview:", v6);

    }
    if (self->_lastScrollSpeed >= 0.5)
      v9 = 0;
    else
      v9 = !-[BKPictureBookVerticalNavigationController animating](self, "animating");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewWithTag:", 1306));
    if (v10)
    {
      objc_opt_class(BKPageScrollerPageView);
      v12 = BUDynamicCast(v11, v10);
      v13 = (BKPageScrollerPageView *)objc_claimAutoreleasedReturnValue(v12);
      if (!v13)
        goto LABEL_13;
    }
    else
    {
      v14 = [BKPageScrollerPageView alloc];
      objc_msgSend(v6, "bounds");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate"));
      v13 = -[BKPageScrollerPageView initWithFrame:pageNumber:navigationDelegate:thumbnailingDelegate:imageResizerDelegate:](v14, "initWithFrame:pageNumber:navigationDelegate:thumbnailingDelegate:imageResizerDelegate:", a3, v23, v24, v25, v16, v18, v20, v22);

      objc_msgSend(v6, "bounds");
      -[BKPageScrollerPageView setFrame:](v13, "setFrame:");
      -[BKPageScrollerPageView setAutoresizingMask:](v13, "setAutoresizingMask:", 18);
      -[BKPageScrollerPageView setTag:](v13, "setTag:", 1306);
      objc_msgSend(v6, "addSubview:", v13);
      if (!v13)
      {
LABEL_13:

        return v6;
      }
    }
    objc_msgSend(v6, "setPageScrollerPageView:", v13);
    if (v9)
    {
      -[BKPageScrollerPageView setScrollState:](v13, "setScrollState:", 2);
      *(_QWORD *)&v26 = objc_opt_class(BKPictureBookContentViewController).n128_u64[0];
      v28 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate", v26));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "contentViewControllerForPageNumber:", a3));
      v31 = BUDynamicCast(v28, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

      -[BKPictureBookVerticalNavigationController _applyAdditionalScale:](self, "_applyAdditionalScale:", v32);
    }
    goto LABEL_13;
  }
  return v6;
}

- (void)_applyAdditionalScale:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;
  NSObject *v11;
  void *v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform buf;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "loader"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "webView"));
    objc_msgSend(v6, "be_scale");
    v8 = v7;

    if (v8 < BEWebViewMinimumZoomScale)
    {
      v9 = v8 / BEWebViewMinimumZoomScale;
      v10 = _AEWKPictureBookLog();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf.a) = 134218240;
        *(double *)((char *)&buf.a + 4) = v9;
        WORD2(buf.b) = 2048;
        *(_QWORD *)((char *)&buf.b + 6) = objc_msgSend(v4, "ordinal");
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "{WebViewLifeCycle} Applying additional scale:%f for ordinal:%lu", (uint8_t *)&buf, 0x16u);
      }

      memset(&buf, 0, sizeof(buf));
      CGAffineTransformMakeScale(&buf, v9, v9);
      v14 = buf;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
      v13 = v14;
      objc_msgSend(v12, "setTransform:", &v13);

    }
  }

}

- (void)_teardownPageNumber:(int64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController viewForPageNumber:](self, "viewForPageNumber:", a3));
  if (v4)
  {
    v8 = v4;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController pagesContainerView](self, "pagesContainerView"));

    v4 = v8;
    if (v8 != v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pageScrollerPageView"));
      v7 = v6;
      if (v6)
        objc_msgSend(v6, "setScrollState:", 3);
      objc_msgSend(v7, "teardown");
      objc_msgSend(v7, "removeFromSuperview");
      objc_msgSend(v8, "removeFromSuperview");

      v4 = v8;
    }
  }

}

- (void)_updatePages
{
  _QWORD v3[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_EC450;
  v3[3] = &unk_1BF560;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  -[BKPictureBookVerticalNavigationController generatePositionForAllPages:](self, "generatePositionForAllPages:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)setPreferredPageNumberHUDVisibility:(BOOL)a3
{
  BKPictureBookNavigationDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  if (self->_preferredPageNumberHUDVisibility != a3)
  {
    self->_preferredPageNumberHUDVisibility = a3;
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector(WeakRetained, "pictureBookVerticalNavigationpreferredPageNumberHUDVisibilityChanged:");

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v7, "pictureBookVerticalNavigationpreferredPageNumberHUDVisibilityChanged:", self->_preferredPageNumberHUDVisibility);

    }
  }
}

- (double)_spaceBetweenPages
{
  unsigned int v2;
  double result;

  v2 = -[BKPictureBookVerticalNavigationController _bookRenditionFlowIsScrolledContinuous](self, "_bookRenditionFlowIsScrolledContinuous");
  result = 4.0;
  if (v2)
    return 0.0;
  return result;
}

- (BOOL)_pageViewShouldHaveRoundedCorners
{
  return !-[BKPictureBookVerticalNavigationController _bookRenditionFlowIsScrolledContinuous](self, "_bookRenditionFlowIsScrolledContinuous");
}

- (BOOL)_bookRenditionFlowIsScrolledContinuous
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController book](self, "book"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fixedLayoutFlow"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("scrolled-continuous"));

  return v4;
}

- (BOOL)_isRTL
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController book](self, "book"));
  v3 = objc_msgSend(v2, "bkPageProgressionDirection") == 1;

  return v3;
}

- (BOOL)_allowZoom
{
  return 1;
}

- (void)updateLocationIfNeeded
{
  char *v3;
  id v4;

  v3 = (char *)-[BKPictureBookVerticalNavigationController currentPageNumber](self, "currentPageNumber") - 1;
  if (v3 != (char *)-[BKPageNavigationViewController pageOffset](self, "pageOffset"))
  {
    self->super._pageOffset = -[BKPictureBookVerticalNavigationController currentPageNumber](self, "currentPageNumber")
                            - 1;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate"));
    objc_msgSend(v4, "pageNavigationDidChangeLocation:", self);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "contentOffset");
  v5 = v4;
  v7 = v6;
  if (!self->_scrollViewIsZooming
    && !-[BKPictureBookVerticalNavigationController animating](self, "animating")
    && -[BKPictureBookVerticalNavigationController isPastEndOfBook:](self, "isPastEndOfBook:", v5, v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate"));
    objc_msgSend(v8, "pageNavigationDidTryToSwipePastEndOfBook:", self);

  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v10 = v9;
  if (v9 - self->_lastOffsetCapture > 0.1)
  {
    v11 = fabs((v7 - self->_lastOffset.y) / 100.0);
    -[BKPictureBookVerticalNavigationController setPreferredPageNumberHUDVisibility:](self, "setPreferredPageNumberHUDVisibility:", v11 > 1.0);
    self->_lastScrollSpeed = v11;
    self->_lastOffset.x = v5;
    self->_lastOffset.y = v7;
    self->_lastOffsetCapture = v10;
  }
  if ((objc_msgSend(v12, "isZooming") & 1) == 0
    && !self->_scrollViewIsZooming
    && !-[BKPictureBookVerticalNavigationController animating](self, "animating")
    && vabdd_f64(self->_lastOffsetUsedForPageRefresh.y, v7) > 100.0)
  {
    -[BKPictureBookVerticalNavigationController _updatePages](self, "_updatePages");
    -[BKPictureBookVerticalNavigationController updateLocationIfNeeded](self, "updateLocationIfNeeded");
    self->_lastPageRefreshTime = v10;
    self->_lastOffsetUsedForPageRefresh.x = v5;
    self->_lastOffsetUsedForPageRefresh.y = v7;
  }

}

- (id)viewForZoomingInScrollView:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController scrollView](self, "scrollView"));

  if (v5 == v4)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController pagesContainerView](self, "pagesContainerView"));
  else
    v6 = 0;

  return v6;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v3, "pictureBookVerticalNavigationInteractionDidStart:") & 1) != 0)
    objc_msgSend(v3, "pictureBookVerticalNavigationInteractionDidStart:", 0);

}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  self->_scrollViewIsZooming = 1;
  v5 = objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate", a3, a4));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate"));
    v8 = objc_opt_respondsToSelector(v7, "pictureBookVerticalNavigationInteractionDidStart:");

    if ((v8 & 1) != 0)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookVerticalNavigationController delegate](self, "delegate"));
      objc_msgSend(v9, "pictureBookVerticalNavigationInteractionDidStart:", 1);

    }
  }
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  -[BKPictureBookVerticalNavigationController _updatePages](self, "_updatePages", a3, a4, a5);
  -[BKPictureBookVerticalNavigationController updateLocationIfNeeded](self, "updateLocationIfNeeded");
  self->_scrollViewIsZooming = 0;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[BKPictureBookVerticalNavigationController setPreferredPageNumberHUDVisibility:](self, "setPreferredPageNumberHUDVisibility:", 0);
  -[BKPictureBookVerticalNavigationController _updatePages](self, "_updatePages");
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    -[BKPictureBookVerticalNavigationController setPreferredPageNumberHUDVisibility:](self, "setPreferredPageNumberHUDVisibility:", 0);
    self->_lastScrollSpeed = 0.0;
    -[BKPictureBookVerticalNavigationController _updatePages](self, "_updatePages");
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;

  y = a4.y;
  if (fabs(a4.y) > 1.0)
  {
    v8 = a3;
    objc_msgSend(v8, "zoomScale");
    v10 = v9;
    objc_msgSend(v8, "minimumZoomScale");
    v12 = v11;

    if (v10 == v12)
    {
      if ((-[BKPictureBookVerticalNavigationController contentOffsetToScrollToForPageNumber:](self, "contentOffsetToScrollToForPageNumber:", -[BKPictureBookVerticalNavigationController pageNumberAtContentOffset:](self, "pageNumberAtContentOffset:", a5->x, a5->y)), v15 = v14 - a5->y, y > 0.0)&& v15 > 0.0|| y < 0.0 && v15 < 0.0)
      {
        a5->x = v13;
        a5->y = v14;
      }
    }
  }
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UIView)pagesContainerView
{
  return self->_pagesContainerView;
}

- (void)setPagesContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_pagesContainerView, a3);
}

- (BKPictureBookNavigationDelegate)delegate
{
  return (BKPictureBookNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITapGestureRecognizer)doubleTapGesture
{
  return self->_doubleTapGesture;
}

- (void)setDoubleTapGesture:(id)a3
{
  objc_storeStrong((id *)&self->_doubleTapGesture, a3);
}

- (AEBookInfo)book
{
  return self->_book;
}

- (void)setBook:(id)a3
{
  objc_storeStrong((id *)&self->_book, a3);
}

- (BOOL)preferredPageNumberHUDVisibility
{
  return self->_preferredPageNumberHUDVisibility;
}

- (BOOL)allowDoubleTapToZoom
{
  return self->_allowDoubleTapToZoom;
}

- (void)setPageSize:(CGSize)a3
{
  self->_pageSize = a3;
}

- (int64_t)pageNumberBeforeTransition
{
  return self->_pageNumberBeforeTransition;
}

- (void)setPageNumberBeforeTransition:(int64_t)a3
{
  self->_pageNumberBeforeTransition = a3;
}

- (CGSize)_lastScrollViewSizeLayoutWasGeneratedFor
{
  double width;
  double height;
  CGSize result;

  width = self->__lastScrollViewSizeLayoutWasGeneratedFor.width;
  height = self->__lastScrollViewSizeLayoutWasGeneratedFor.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)set_lastScrollViewSizeLayoutWasGeneratedFor:(CGSize)a3
{
  self->__lastScrollViewSizeLayoutWasGeneratedFor = a3;
}

- (NSArray)_positionForPages
{
  return self->__positionForPages;
}

- (void)set_positionForPages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__positionForPages, 0);
  objc_storeStrong((id *)&self->_book, 0);
  objc_storeStrong((id *)&self->_doubleTapGesture, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pagesContainerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
