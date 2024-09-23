@implementation CRLiOSInsertPageViewController

- (void)scribbleInteractionWillBeginWriting:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (self->_shouldIgnoreCancelBecauseOfWriting)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123AC50);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFDFE4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123AC70);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSInsertPageViewController scribbleInteractionWillBeginWriting:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSInsertPageViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 391, 0, "bad state on _shouldIgnoreCancelBecauseOfWriting");

  }
  self->_shouldIgnoreCancelBecauseOfWriting = 1;
}

- (void)scribbleInteractionDidFinishWriting:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (!self->_shouldIgnoreCancelBecauseOfWriting)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123AC90);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFE068();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123ACB0);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSInsertPageViewController scribbleInteractionDidFinishWriting:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSInsertPageViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 397, 0, "bad state on _shouldIgnoreCancelBecauseOfWriting");

  }
  self->_shouldIgnoreCancelBecauseOfWriting = 0;
}

- (CRLiOSInsertPageViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5
{
  id v7;
  CRLiOSInsertPageViewController *v8;
  UIPageViewController *v9;
  UIPageViewController *pageViewController;
  objc_super v12;

  v7 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSInsertPageViewController;
  v8 = -[CRLiOSInsertPageViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);
  if (v8)
  {
    v9 = (UIPageViewController *)objc_msgSend(objc_alloc((Class)UIPageViewController), "initWithTransitionStyle:navigationOrientation:options:", 1, a4, v7);
    pageViewController = v8->_pageViewController;
    v8->_pageViewController = v9;

  }
  return v8;
}

- (CRLiOSInsertPageViewController)initWithCoder:(id)a3
{
  id v4;
  CRLiOSInsertPageViewController *v5;
  UIPageViewController *v6;
  UIPageViewController *pageViewController;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSInsertPageViewController;
  v5 = -[CRLiOSInsertPageViewController initWithCoder:](&v9, "initWithCoder:", v4);
  if (v5)
  {
    v6 = (UIPageViewController *)objc_msgSend(objc_alloc((Class)UIPageViewController), "initWithCoder:", v4);
    pageViewController = v5->_pageViewController;
    v5->_pageViewController = v6;

  }
  return v5;
}

- (CRLiOSInsertPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  CRLiOSInsertPageViewController *v8;
  UIPageViewController *v9;
  UIPageViewController *pageViewController;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSInsertPageViewController;
  v8 = -[CRLiOSInsertPageViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", v6, v7);
  if (v8)
  {
    v9 = (UIPageViewController *)objc_msgSend(objc_alloc((Class)UIPageViewController), "initWithNibName:bundle:", v6, v7);
    pageViewController = v8->_pageViewController;
    v8->_pageViewController = v9;

  }
  return v8;
}

- (void)willMoveToParentViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLiOSInsertPageViewController;
  -[CRLiOSInsertPageViewController willMoveToParentViewController:](&v5, "willMoveToParentViewController:");
  if (!a3)
    -[CRLiOSInsertPageViewController p_removeKeyboardObservation](self, "p_removeKeyboardObservation");
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLiOSInsertPageViewController;
  -[CRLiOSInsertPageViewController didMoveToParentViewController:](&v5, "didMoveToParentViewController:");
  if (a3)
    -[CRLiOSInsertPageViewController p_updatePageSelectionForViewAppearance](self, "p_updatePageSelectionForViewAppearance");
}

- (void)p_updatePageSelectionForViewAppearance
{
  if (!-[CRLiOSInsertPageViewController p_isShowingSearchBar](self, "p_isShowingSearchBar"))
    -[CRLiOSInsertPageViewController p_selectPageAtIndex:animated:scrollToBottom:](self, "p_selectPageAtIndex:animated:scrollToBottom:", -[CRLiOSInsertPageViewController p_currentPageNumber](self, "p_currentPageNumber"), 0, -[CRLiOSInsertPageViewController p_shouldScrollToBottomOfPage](self, "p_shouldScrollToBottomOfPage"));
}

- (void)loadView
{
  CRLiOSInspectorPaneView *v3;

  v3 = -[CRLiOSInspectorPaneView initWithFrame:]([CRLiOSInspectorPaneView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[CRLiOSInsertPageViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLiOSInsertPageViewController;
  -[CRLiOSInsertPageViewController viewDidLoad](&v3, "viewDidLoad");
  -[CRLiOSInsertPageViewController p_setupViews](self, "p_setupViews");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  -[CRLiOSInsertPageViewController p_restoreViewState](self, "p_restoreViewState");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_pageViewController](self, "p_pageViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController viewControllers](self, "viewControllers"));
  objc_msgSend(v5, "setViewControllers:direction:animated:completion:", v6, 0, 0, 0);

  v7.receiver = self;
  v7.super_class = (Class)CRLiOSInsertPageViewController;
  -[CRLiOSInsertPageViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  -[CRLiOSInsertPageViewController p_addKeyboardObservation](self, "p_addKeyboardObservation");
  -[CRLiOSInsertPageViewController p_updateBottomConstraintsIfNeeded](self, "p_updateBottomConstraintsIfNeeded");
  -[CRLiOSInsertPageViewController p_updateTitlesPageControlAndBottomViewColorsInDarkUI:](self, "p_updateTitlesPageControlAndBottomViewColorsInDarkUI:", -[CRLiOSInsertPageViewController crl_isInDarkMode](self, "crl_isInDarkMode"));
  self->_shouldUpdatePageSelectionOnNextLayoutSubviews = 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLiOSInsertPageViewController;
  -[CRLiOSInsertPageViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  -[CRLiOSInsertPageViewController setP_isInViewHierarchy:](self, "setP_isInViewHierarchy:", 1);
  -[CRLiOSInsertPageViewController p_updatePageSelectionForViewAppearance](self, "p_updatePageSelectionForViewAppearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_searchButton](self, "p_searchButton"));
  CRLAccessibilityPostLayoutChangedNotification(v4);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLiOSInsertPageViewController;
  -[CRLiOSInsertPageViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  -[CRLiOSInsertPageViewController p_removeKeyboardObservation](self, "p_removeKeyboardObservation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerDelegate](self, "insertPageViewControllerDelegate"));
  objc_msgSend(v4, "insertPageViewControllerWillDisappear:", self);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLiOSInsertPageViewController;
  -[CRLiOSInsertPageViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[CRLiOSInsertPageViewController p_setSearchOverlayViewHidden:animated:](self, "p_setSearchOverlayViewHidden:animated:", 1, 0);
  -[CRLiOSInsertPageViewController setP_isInViewHierarchy:](self, "setP_isInViewHierarchy:", 0);
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
  v9.super_class = (Class)CRLiOSInsertPageViewController;
  v7 = a4;
  -[CRLiOSInsertPageViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100138D48;
  v8[3] = &unk_10123ACD8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLiOSInsertPageViewController;
  -[CRLiOSInsertPageViewController viewDidLayoutSubviews](&v6, "viewDidLayoutSubviews");
  if (!-[CRLiOSInsertPageViewController p_pageControlType](self, "p_pageControlType"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController view](self, "view"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tintColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_dotsPageControl](self, "p_dotsPageControl"));
    objc_msgSend(v5, "setCurrentPageIndicatorTintColor:", v4);

  }
  if (self->_shouldUpdatePageSelectionOnNextLayoutSubviews)
  {
    self->_shouldUpdatePageSelectionOnNextLayoutSubviews = 0;
    -[CRLiOSInsertPageViewController p_updatePageSelectionForViewAppearance](self, "p_updatePageSelectionForViewAppearance");
  }
}

- (void)updateViewConstraints
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
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CRLiOSInsertPageViewController;
  -[CRLiOSInsertPageViewController updateViewConstraints](&v18, "updateViewConstraints");
  if (!-[CRLiOSInsertPageViewController p_pageControlType](self, "p_pageControlType"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_bottomFadeBar](self, "p_bottomFadeBar"));
    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));

    if (v4)
      objc_msgSend(v3, "removeFromSuperview");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController view](self, "view"));
    objc_msgSend(v5, "addSubview:", v3);
    objc_msgSend(v5, "bringSubviewToFront:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
    objc_msgSend(v8, "setActive:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
    objc_msgSend(v11, "setActive:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_dotsPageControl](self, "p_dotsPageControl"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
    objc_msgSend(v15, "setActive:", 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "heightAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToConstant:", 6.0));
    objc_msgSend(v17, "setActive:", 1);

  }
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLiOSInsertPageViewController;
  -[CRLiOSInsertPageViewController viewSafeAreaInsetsDidChange](&v3, "viewSafeAreaInsetsDidChange");
  -[CRLiOSInsertPageViewController p_updateBottomConstraintsIfNeeded](self, "p_updateBottomConstraintsIfNeeded");
}

- (void)setViewControllers:(id)a3
{
  -[CRLiOSInsertPageViewController setViewControllers:animated:](self, "setViewControllers:animated:", a3, 0);
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  -[CRLiOSInsertPageViewController p_setViewControllers:shouldUpdatePageViewController:animated:](self, "p_setViewControllers:shouldUpdatePageViewController:animated:", a3, 1, a4);
}

- (void)p_recursivelySetExclusiveTouchOnView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  objc_msgSend(v4, "setExclusiveTouch:", 1);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subviews", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[CRLiOSInsertPageViewController p_recursivelySetExclusiveTouchOnView:](self, "p_recursivelySetExclusiveTouchOnView:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)p_setViewControllers:(id)a3 shouldUpdatePageViewController:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  NSArray *v13;
  NSArray *viewControllers;
  NSArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _BYTE v31[128];

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (-[CRLiOSInsertPageViewController p_isInViewHierarchy](self, "p_isInViewHierarchy") && v6)
  {
    if (v5)
      v9 = 0.300000012;
    else
      v9 = 0.0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_pageViewController](self, "p_pageViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1001393E8;
    v28[3] = &unk_10122D3D8;
    v29 = v10;
    v30 = v8;
    v12 = v10;
    +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v11, 5242880, v28, 0, v9);

  }
  v13 = (NSArray *)objc_msgSend(v8, "copy");
  viewControllers = self->_viewControllers;
  self->_viewControllers = v13;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = self->_viewControllers;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "view", (_QWORD)v24));
        -[CRLiOSInsertPageViewController p_recursivelySetExclusiveTouchOnView:](self, "p_recursivelySetExclusiveTouchOnView:", v20);

      }
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v17);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_searchOverlayView](self, "p_searchOverlayView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_selectedViewController](self, "p_selectedViewController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "view"));
  -[CRLiOSInsertPageViewController p_moveOverlayView:toSelectedViewControllerView:](self, "p_moveOverlayView:toSelectedViewControllerView:", v21, v23);

}

- (CGSize)contentSize
{
  unint64_t v3;
  void *v4;
  double Height;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
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
  CGSize result;
  CGRect v29;

  v3 = -[CRLiOSInsertPageViewController p_pageControlType](self, "p_pageControlType");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerNavigationDataSource](self, "insertPageViewControllerNavigationDataSource"));
  Height = 0.0;
  if (objc_msgSend(v4, "showsSubpageNavigator"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_subpageNavigator](self, "p_subpageNavigator"));
    objc_msgSend(v6, "bounds");
    Height = CGRectGetHeight(v29);

  }
  if (v3 == 1)
    v7 = 44.0;
  else
    v7 = 0.0;

  -[CRLiOSInsertPageViewController p_dotsPageControlHeight](self, "p_dotsPageControlHeight");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController view](self, "view"));
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;

  -[CRLiOSInsertPageViewController preferredContentSize](self, "preferredContentSize");
  v16 = fmax(v14, v15) - (v7 + Height + v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController view](self, "view"));
  objc_msgSend(v17, "safeAreaInsets");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = v12 - v21 - v25;
  v27 = v16 - v19 - v23;
  result.height = v27;
  result.width = v26;
  return result;
}

- (BOOL)supportsSearch
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerNavigationDataSource](self, "insertPageViewControllerNavigationDataSource"));
  v3 = objc_msgSend(v2, "supportsSearch");

  return v3;
}

- (void)resignFirstResponderIfNeeded
{
  void *v3;
  unsigned int v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_searchBar](self, "p_searchBar"));
  v4 = objc_msgSend(v3, "isFirstResponder");

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_searchBar](self, "p_searchBar"));
    objc_msgSend(v5, "resignFirstResponder");

  }
}

- (void)updateBottomViewVisibilityIfNeeded
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController view](self, "view"));
  objc_msgSend(v3, "layoutIfNeeded");

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10013963C;
  v4[3] = &unk_10122D110;
  v4[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, 0.300000012);
}

- (void)selectPageAtIndex:(unint64_t)a3 animated:(BOOL)a4 scrollToBottom:(BOOL)a5
{
  -[CRLiOSInsertPageViewController p_selectPageAtIndex:animated:scrollToBottom:](self, "p_selectPageAtIndex:animated:scrollToBottom:", a3, a4, a5);
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerDataSource](self, "insertPageViewControllerDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "insertPageViewController:viewControllerBeforeViewController:", self, v5));

  return v7;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerDataSource](self, "insertPageViewControllerDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "insertPageViewController:viewControllerAfterViewController:", self, v5));

  return v7;
}

- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  unsigned int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  __int16 v24;
  CRLiOSInsertPageViewController *v25;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count") != (id)1)
  {
    v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123ACF8);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110402;
      v15 = v8;
      v16 = 2082;
      v17 = "-[CRLiOSInsertPageViewController pageViewController:willTransitionToViewControllers:]";
      v18 = 2082;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSInsertPageViewController.m";
      v20 = 1024;
      v21 = 651;
      v22 = 2112;
      v23 = v7;
      v24 = 2112;
      v25 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Incorrectly transitioning to more than one view controller (%@) in %@.", buf, 0x36u);
    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123AD18);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSInsertPageViewController pageViewController:willTransitionToViewControllers:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSInsertPageViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 651, 0, "Incorrectly transitioning to more than one view controller (%@) in %@.", v7, self);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  -[CRLiOSInsertPageViewController p_recursivelySetExclusiveTouchOnView:](self, "p_recursivelySetExclusiveTouchOnView:", v13);

}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  UIAccessibilityNotifications v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  char *v24;
  BOOL v25;

  v6 = a6;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerDataSource](self, "insertPageViewControllerDataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewControllers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  v12 = (char *)objc_msgSend(v9, "insertPageViewController:presentationIndexForViewController:", self, v11);

  -[CRLiOSInsertPageViewController setP_currentPageNumber:](self, "setP_currentPageNumber:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("AX_INSERT_PANEL_PAGE_SCROLLED"), CFSTR("Page %1$lu of %2$lu"), 0));

  v15 = -[CRLiOSInsertPageViewController p_pageControlType](self, "p_pageControlType");
  if (v15 == 1)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100139BE0;
    v22[3] = &unk_10123AD40;
    v22[4] = self;
    v23 = v8;
    v24 = v12;
    v25 = v6;
    -[CRLiOSInsertPageViewController p_updateUIForChangeToPageNumber:animated:completion:](self, "p_updateUIForChangeToPageNumber:animated:completion:", v12, 1, v22);

  }
  else if (!v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_dotsPageControl](self, "p_dotsPageControl"));
    objc_msgSend(v16, "setCurrentPage:", v12);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerDelegate](self, "insertPageViewControllerDelegate"));
    objc_msgSend(v17, "insertPageViewController:didSelectPageNumber:", self, v12);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewControllers"));
    -[CRLiOSInsertPageViewController p_setViewControllers:shouldUpdatePageViewController:animated:](self, "p_setViewControllers:shouldUpdatePageViewController:animated:", v18, 0, 0);

    if (v6)
    {
      v19 = UIAccessibilityPageScrolledNotification;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_dotsPageControl](self, "p_dotsPageControl"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v12 + 1, objc_msgSend(v20, "numberOfPages")));
      UIAccessibilityPostNotification(v19, v21);

    }
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  CGRect v5;

  v4 = a3;
  if (-[CRLiOSInsertPageViewController p_isShowingSearchBar](self, "p_isShowingSearchBar"))
  {
    objc_msgSend(v4, "bounds");
    objc_msgSend(v4, "setContentOffset:", CGRectGetWidth(v5), 0.0);
  }

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v6;
  CGRect v7;

  v6 = a3;
  if (-[CRLiOSInsertPageViewController p_isShowingSearchBar](self, "p_isShowingSearchBar"))
  {
    objc_msgSend(v6, "bounds");
    objc_msgSend(v6, "setContentOffset:", CGRectGetWidth(v7), 0.0);
  }

}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  v5 = objc_msgSend(v4, "length");

  if (!v5)
    -[CRLiOSInsertPageViewController p_setSearchOverlayViewHidden:animated:](self, "p_setSearchOverlayViewHidden:animated:", 0, 1);
  return 1;
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  __CFRunLoop *Main;
  _QWORD v8[4];
  id v9;
  CRLiOSInsertPageViewController *v10;

  v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100139E84;
  v8[3] = &unk_10122D3D8;
  v9 = v4;
  v10 = self;
  v5 = v8;
  v6 = v4;
  Main = CFRunLoopGetMain();
  CFRunLoopPerformBlock(Main, kCFRunLoopDefaultMode, v5);
  CFRunLoopWakeUp(Main);

}

- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  CRLiOSInsertPageViewController *v5;
  void *v6;

  v5 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerDelegate](self, "insertPageViewControllerDelegate", a3, a4.location, a4.length, a5));
  LOBYTE(v5) = objc_msgSend(v6, "insertPageViewControllerShouldChangeSearchText:", v5);

  return (char)v5;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_searchViewController](self, "p_searchViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerDelegate](self, "insertPageViewControllerDelegate"));
  objc_msgSend(v7, "insertPageViewController:willSearchWithText:inViewController:searchViewController:", self, v5, v6, v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_selectedViewController](self, "p_selectedViewController"));
  v9 = objc_msgSend(v5, "length");

  v10 = v6;
  if (v8 == v6)
  {
    if (!v9)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerDataSource](self, "insertPageViewControllerDataSource"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "insertPageViewController:viewControllerForPageAtIndex:", self, -[CRLiOSInsertPageViewController p_currentPageNumber](self, "p_currentPageNumber")));

      if (v10)
      {
        v14 = v10;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
        -[CRLiOSInsertPageViewController setViewControllers:animated:](self, "setViewControllers:animated:", v13, 0);

      }
      -[CRLiOSInsertPageViewController p_setSearchOverlayViewHidden:animated:](self, "p_setSearchOverlayViewHidden:animated:", 0, 1);
    }
  }
  else if (v9)
  {
    v10 = v6;
    if (v6)
    {
      -[CRLiOSInsertPageViewController p_setSearchOverlayViewHidden:animated:](self, "p_setSearchOverlayViewHidden:animated:", 1, 1);
      v15 = v6;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
      -[CRLiOSInsertPageViewController setViewControllers:animated:](self, "setViewControllers:animated:", v11, 0);

      v10 = v6;
    }
  }

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  if (!self->_shouldIgnoreCancelBecauseOfWriting)
  {
    -[CRLiOSInsertPageViewController setP_didExplicitlyCancelSearch:](self, "setP_didExplicitlyCancelSearch:", 1);
    -[CRLiOSInsertPageViewController p_endSearching](self, "p_endSearching");
    -[CRLiOSInsertPageViewController setP_didExplicitlyCancelSearch:](self, "setP_didExplicitlyCancelSearch:", 0);
  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
}

- (void)p_searchButtonTapped:(id)a3
{
  -[CRLiOSInsertPageViewController p_beginSearchingAnimated:](self, "p_beginSearchingAnimated:", 1);
}

- (void)p_setSearchOverlayViewHidden:(BOOL)a3 animated:(BOOL)a4
{
  -[CRLiOSInsertPageViewController p_setSearchOverlayViewHidden:animated:completion:](self, "p_setSearchOverlayViewHidden:animated:completion:", a3, a4, 0);
}

- (void)p_setSearchOverlayViewHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  id (*v10)(uint64_t);
  void ***v11;
  double v12;
  void **v13;
  void **v14;
  void **v15;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_searchOverlayView](self, "p_searchOverlayView"));
  if (v6)
  {
    v15 = _NSConcreteStackBlock;
    v10 = sub_10013A220;
    v11 = &v15;
  }
  else
  {
    v14 = _NSConcreteStackBlock;
    v10 = sub_10013A22C;
    v11 = &v14;
  }
  if (v5)
    v12 = 0.150000006;
  else
    v12 = 0.0;
  v11[1] = (void **)3221225472;
  v11[2] = (void **)v10;
  v11[3] = (void **)&unk_10122D110;
  v13 = v9;
  v11[4] = v13;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v11, v8, v12);

}

- (void)p_setSearchBarHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  double v11;
  id v12;
  _QWORD v13[4];
  id v14;
  CRLiOSInsertPageViewController *v15;
  id v16;
  BOOL v17;
  _QWORD v18[5];
  BOOL v19;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if (-[CRLiOSInsertPageViewController supportsSearch](self, "supportsSearch"))
  {
    -[CRLiOSInsertPageViewController setP_isShowingSearchBar:](self, "setP_isShowingSearchBar:", !v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_searchBar](self, "p_searchBar"));
    if (!v6)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController view](self, "view"));
      objc_msgSend(v10, "bringSubviewToFront:", v9);

    }
    if (v5)
      v11 = 0.300000012;
    else
      v11 = 0.0;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10013A398;
    v18[3] = &unk_10122E8D8;
    v18[4] = self;
    v19 = v6;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10013A44C;
    v13[3] = &unk_10123AD68;
    v17 = v6;
    v14 = v9;
    v15 = self;
    v16 = v8;
    v12 = v9;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v18, v13, v11);

  }
  else if (v8)
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

}

- (void)p_beginSearchingAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerDelegate](self, "insertPageViewControllerDelegate"));
  objc_msgSend(v5, "insertPageViewControllerWillBeginSearch:", self);

  -[CRLiOSInsertPageViewController p_setSearchBarHidden:animated:completion:](self, "p_setSearchBarHidden:animated:completion:", 0, v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerDataSource](self, "insertPageViewControllerDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "insertPageViewControllerViewControllerForSearch:", self));
  -[CRLiOSInsertPageViewController setP_searchViewController:](self, "setP_searchViewController:", v7);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerDelegate](self, "insertPageViewControllerDelegate"));
  objc_msgSend(v8, "insertPageViewControllerDidBeginSearch:", self);

}

- (void)p_endSearching
{
  -[CRLiOSInsertPageViewController p_clearSearching](self, "p_clearSearching");
  -[CRLiOSInsertPageViewController p_selectPageAtIndex:](self, "p_selectPageAtIndex:", -[CRLiOSInsertPageViewController p_currentPageNumber](self, "p_currentPageNumber"));
}

- (void)p_clearSearching
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  v3 = -[CRLiOSInsertPageViewController p_didExplicitlyCancelSearch](self, "p_didExplicitlyCancelSearch");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerDelegate](self, "insertPageViewControllerDelegate"));
  objc_msgSend(v4, "insertPageViewControllerWillEndSearch:cancelledExplicitly:", self, v3);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10013A6D4;
  v6[3] = &unk_10123AD90;
  v6[4] = self;
  v7 = v3;
  -[CRLiOSInsertPageViewController p_setSearchOverlayViewHidden:animated:completion:](self, "p_setSearchOverlayViewHidden:animated:completion:", 1, 1, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_searchBar](self, "p_searchBar"));
  objc_msgSend(v5, "setText:", &stru_1012A72B0);

}

- (void)p_addKeyboardObservation
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "p_keyboardWillShow:", UIKeyboardWillShowNotification, 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "p_keyboardWillHide:", UIKeyboardWillHideNotification, 0);

}

- (void)p_removeKeyboardObservation
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIKeyboardWillShowNotification, 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, UIKeyboardWillHideNotification, 0);

}

- (void)p_keyboardWillShow:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController view](self, "view"));
  objc_msgSend(v5, "layoutIfNeeded");

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10013A8CC;
  v6[3] = &unk_10122D110;
  v6[4] = self;
  +[UIView crl_animateWithKeyboardNotification:animations:](UIView, "crl_animateWithKeyboardNotification:animations:", v4, v6);

}

- (void)p_keyboardWillHide:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController view](self, "view"));
  objc_msgSend(v5, "layoutIfNeeded");

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10013A9A4;
  v6[3] = &unk_10122D110;
  v6[4] = self;
  +[UIView crl_animateWithKeyboardNotification:animations:](UIView, "crl_animateWithKeyboardNotification:animations:", v4, v6);

}

- (void)p_updateBottomConstraintsIfNeeded
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;

  -[CRLiOSInsertPageViewController p_dotsPageControlHeight](self, "p_dotsPageControlHeight");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController presentingViewController](self, "presentingViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));
  v7 = objc_msgSend(v6, "crl_isCompactWidth");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLiOSKeyboardMonitor sharedKeyboardMonitor](CRLiOSKeyboardMonitor, "sharedKeyboardMonitor"));
    objc_msgSend(v8, "onScreenHeight");
    v10 = -v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_bottomLayoutConstraintAboveKeyboard](self, "p_bottomLayoutConstraintAboveKeyboard"));
    objc_msgSend(v11, "setConstant:", v10);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_bottomLayoutConstraintAboveKeyboard](self, "p_bottomLayoutConstraintAboveKeyboard"));
    objc_msgSend(v8, "setConstant:", 0.0);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController view](self, "view"));
  objc_msgSend(v12, "safeAreaInsets");
  v14 = v4 + v13;

  v15 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_dotsPageControlHeightConstraint](self, "p_dotsPageControlHeightConstraint"));
  objc_msgSend(v15, "setConstant:", v14);

}

- (void)p_setupViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  CRLiOSInsertPageViewControllerSearchBar *v19;
  double y;
  double width;
  double height;
  unsigned int v23;
  CRLiOSInsertPageViewControllerSearchBar *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  CRLiOSMultipaneSegmentedControl *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  unint64_t v46;
  void *v47;
  void *v48;
  CRLiOSInsertPageViewControllerTitlesPageControl *v49;
  CRLiOSTitlesPageControlScrollView *v50;
  double x;
  double v52;
  double v53;
  double v54;
  CRLiOSTitlesPageControlScrollView *v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  CRLiOSInsertPageViewControllerFadeView *v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  CRLiOSInsertPageViewControllerFadeView *v93;
  void *v94;
  CRLiOSInsertPageViewControllerSearchBar *v95;
  id v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  id v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  id v169;
  void *v170;
  CRLiOSInsertPageViewControllerOverlayGestureRecognizer *v171;
  void *v172;
  void *v173;
  CRLiOSInsertPageViewControllerTitlesPageControl *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  id v179;
  CRLiOSInsertPageViewControllerSearchBar *v180;
  CRLiOSInsertPageViewControllerFadeView *v181;
  CRLiOSMultipaneSegmentedControl *v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  _BYTE v187[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_pageViewController](self, "p_pageViewController"));
  v183 = 0u;
  v184 = 0u;
  v185 = 0u;
  v186 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subviews"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v183, v187, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v184;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v184 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * (_QWORD)i);
        v13 = objc_opt_class(UIScrollView, v8);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          v14 = v12;
          objc_msgSend(v14, "setDelaysContentTouches:", 0);
          objc_msgSend(v14, "setDelegate:", self);

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v183, v187, 16);
    }
    while (v9);
  }

  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "setDelegate:", self);
  -[CRLiOSInsertPageViewController addChildViewController:](self, "addChildViewController:", v4);
  objc_msgSend(v4, "didMoveToParentViewController:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v3, "addSubview:", v15);

  v16 = -[CRLiOSInsertPageViewController supportsSearch](self, "supportsSearch");
  v177 = v4;
  v178 = v3;
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Search"), 0, 0));

    v19 = [CRLiOSInsertPageViewControllerSearchBar alloc];
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v23 = v16;
    v24 = -[CRLiOSInsertPageViewControllerSearchBar initWithFrame:](v19, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[CRLiOSInsertPageViewControllerSearchBar setDelegate:](v24, "setDelegate:", self);
    -[CRLiOSInsertPageViewControllerSearchBar setSearchBarStyle:](v24, "setSearchBarStyle:", 2);
    -[CRLiOSInsertPageViewControllerSearchBar setShowsCancelButton:](v24, "setShowsCancelButton:", 1);
    -[CRLiOSInsertPageViewControllerSearchBar setPlaceholder:](v24, "setPlaceholder:", v18);
    -[CRLiOSInsertPageViewControllerSearchBar setAlpha:](v24, "setAlpha:", 0.0);
    objc_msgSend(v3, "addSubview:", v24);
    v180 = v24;
    -[CRLiOSInsertPageViewController setP_searchBar:](self, "setP_searchBar:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("magnifyingglass")));
    v26 = objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    objc_msgSend(v26, "setIsAccessibilityElement:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("AX_INSERT_PANEL_SEARCH_BUTTON"), CFSTR("Search"), 0));
    objc_msgSend(v26, "setAccessibilityLabel:", v28);

    v4 = v177;
    objc_msgSend(v26, "setImage:forState:", v25, 0);
    v29 = sub_1003A91F4();
    if (v29)
      v30 = 0.0;
    else
      v30 = 2.0;
    if (v29)
      v31 = 2.0;
    else
      v31 = 0.0;
    objc_msgSend(v26, "setImageEdgeInsets:", 0.0, v30, 0.0, v31);
    objc_msgSend(v26, "addTarget:action:forControlEvents:", self, "p_searchButtonTapped:", 64);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v26, "setBackgroundColor:", v32);

    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v26, "setShowsLargeContentViewer:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Search"), 0, 0));
    objc_msgSend(v26, "setLargeContentTitle:", v34);

    v3 = v178;
    v16 = v23;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("magnifyingglass")));
    objc_msgSend(v26, "setLargeContentImage:", v35);

    v36 = objc_alloc_init((Class)UILargeContentViewerInteraction);
    objc_msgSend(v26, "addInteraction:", v36);

    objc_msgSend(v178, "addSubview:", v26);
    -[CRLiOSInsertPageViewController setP_searchButton:](self, "setP_searchButton:", v26);

  }
  else
  {
    v26 = 0;
    v180 = 0;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerNavigationDataSource](self, "insertPageViewControllerNavigationDataSource"));
  v38 = objc_msgSend(v37, "showsSubpageNavigator");

  if (v38)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerNavigationDataSource](self, "insertPageViewControllerNavigationDataSource"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "subpageNavigatorItems"));

    v41 = -[CRLiOSMultipaneSegmentedControl initWithItems:]([CRLiOSMultipaneSegmentedControl alloc], "initWithItems:", v40);
    -[CRLiOSMultipaneSegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CRLiOSMultipaneSegmentedControl setBackdropHidden:](v41, "setBackdropHidden:", 1);
    -[CRLiOSMultipaneSegmentedControl setSegmentHuggingEnabled:](v41, "setSegmentHuggingEnabled:", 1);
    -[CRLiOSMultipaneSegmentedControl setAllEdgeInsets:](v41, "setAllEdgeInsets:", 0.0, 16.0, 0.0, 16.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerDataSource](self, "insertPageViewControllerDataSource"));
    -[CRLiOSMultipaneSegmentedControl setSelectedSegmentIndex:](v41, "setSelectedSegmentIndex:", objc_msgSend(v42, "selectedSubpageIndexForInsertPageViewController:", self));

    -[CRLiOSMultipaneSegmentedControl setExclusiveTouch:](v41, "setExclusiveTouch:", 1);
    -[CRLiOSMultipaneSegmentedControl addTarget:action:forControlEvents:](v41, "addTarget:action:forControlEvents:", self, "p_subpageNavigatorDidChangeSelectedSegment:", 4096);
    -[CRLiOSInsertPageViewController setP_subpageNavigator:](self, "setP_subpageNavigator:", v41);

  }
  else
  {
    v41 = 0;
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerDataSource](self, "insertPageViewControllerDataSource"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_selectedViewController](self, "p_selectedViewController"));
  v45 = objc_msgSend(v43, "insertPageViewController:presentationIndexForViewController:", self, v44);

  -[CRLiOSInsertPageViewController setP_currentPageNumber:](self, "setP_currentPageNumber:", v45);
  v46 = -[CRLiOSInsertPageViewController p_pageControlType](self, "p_pageControlType");
  if (!v46)
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v77 = objc_alloc((Class)UIView);
    x = CGRectZero.origin.x;
    v52 = CGRectZero.origin.y;
    v53 = CGRectZero.size.width;
    v54 = CGRectZero.size.height;
    v78 = objc_msgSend(v77, "initWithFrame:", CGRectZero.origin.x, v52, v53, v54);
    objc_msgSend(v78, "setBackgroundColor:", v76);
    objc_msgSend(v3, "addSubview:", v78);
    v79 = objc_msgSend(objc_alloc((Class)UIPageControl), "initWithFrame:", CGRectZero.origin.x, v52, v53, v54);
    objc_msgSend(v78, "addSubview:", v79);
    objc_msgSend(v79, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "topAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "topAnchor"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:", v81));
    objc_msgSend(v82, "setActive:", 1);

    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "leadingAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "leadingAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:", v84));
    objc_msgSend(v85, "setActive:", 1);

    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "trailingAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "trailingAnchor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:", v87));
    objc_msgSend(v88, "setActive:", 1);

    v4 = v177;
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "heightAnchor"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintEqualToConstant:", 44.0));
    objc_msgSend(v90, "setActive:", 1);

    v3 = v178;
    v91 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.5, 1.0));
    objc_msgSend(v79, "setPageIndicatorTintColor:", v91);

    v92 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerDataSource](self, "insertPageViewControllerDataSource"));
    objc_msgSend(v79, "setNumberOfPages:", objc_msgSend(v92, "presentationCountForInsertPageViewController:", self));

    objc_msgSend(v79, "setCurrentPage:", v45);
    objc_msgSend(v79, "setBackgroundColor:", v76);
    objc_msgSend(v79, "setAllowsContinuousInteraction:", 0);
    objc_msgSend(v79, "addTarget:action:forControlEvents:", self, "p_dotPageControlValueChanged", 4096);
    -[CRLiOSInsertPageViewController setP_dotsPageControl:](self, "setP_dotsPageControl:", v79);
    v93 = -[CRLiOSInsertPageViewControllerFadeView initWithStartPoint:endPoint:shouldAddDividerView:]([CRLiOSInsertPageViewControllerFadeView alloc], "initWithStartPoint:endPoint:shouldAddDividerView:", 1, 0.5, 0.0, 0.5, 1.0);
    -[CRLiOSInsertPageViewControllerFadeView setBackgroundColor:](v93, "setBackgroundColor:", v76);
    -[CRLiOSInsertPageViewController setP_bottomFadeBar:](self, "setP_bottomFadeBar:", v93);

    v94 = v78;
    v181 = 0;
    v179 = 0;
    v174 = 0;
    v55 = 0;
LABEL_29:
    v95 = v180;
    goto LABEL_34;
  }
  if (v46 != 1)
  {
    v181 = 0;
    v179 = 0;
    v174 = 0;
    v55 = 0;
    v94 = 0;
    x = CGRectZero.origin.x;
    v52 = CGRectZero.origin.y;
    v53 = CGRectZero.size.width;
    v54 = CGRectZero.size.height;
    goto LABEL_29;
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerNavigationDataSource](self, "insertPageViewControllerNavigationDataSource"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "pageControlTitles"));

  v49 = -[CRLiOSInsertPageViewControllerTitlesPageControl initWithTitles:]([CRLiOSInsertPageViewControllerTitlesPageControl alloc], "initWithTitles:", v48);
  -[CRLiOSInsertPageViewControllerTitlesPageControl setTranslatesAutoresizingMaskIntoConstraints:](v49, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CRLiOSInsertPageViewControllerTitlesPageControl addTarget:action:forControlEvents:](v49, "addTarget:action:forControlEvents:", self, "p_titlesPageControlValueChanged:", 4096);
  v50 = [CRLiOSTitlesPageControlScrollView alloc];
  x = CGRectZero.origin.x;
  v52 = CGRectZero.origin.y;
  v53 = CGRectZero.size.width;
  v54 = CGRectZero.size.height;
  v55 = -[CRLiOSTitlesPageControlScrollView initWithFrame:](v50, "initWithFrame:", CGRectZero.origin.x, v52, v53, v54);
  -[CRLiOSTitlesPageControlScrollView setShowsVerticalScrollIndicator:](v55, "setShowsVerticalScrollIndicator:", 0);
  -[CRLiOSTitlesPageControlScrollView setShowsHorizontalScrollIndicator:](v55, "setShowsHorizontalScrollIndicator:", 0);
  -[CRLiOSInsertPageViewControllerTitlesPageControl frame](v49, "frame");
  -[CRLiOSTitlesPageControlScrollView setContentSize:](v55, "setContentSize:", v56, v57);
  -[CRLiOSTitlesPageControlScrollView setAccessibilityIdentifier:](v55, "setAccessibilityIdentifier:", CFSTR("presetScrollView"));
  -[CRLiOSTitlesPageControlScrollView addSubview:](v55, "addSubview:", v49);
  -[CRLiOSTitlesPageControlScrollView setTranslatesAutoresizingMaskIntoConstraints:](v55, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSTitlesPageControlScrollView heightAnchor](v55, "heightAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToConstant:", 44.0));
  objc_msgSend(v59, "setActive:", 1);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerTitlesPageControl topAnchor](v49, "topAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSTitlesPageControlScrollView topAnchor](v55, "topAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v61));
  objc_msgSend(v62, "setActive:", 1);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerTitlesPageControl leadingAnchor](v49, "leadingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSTitlesPageControlScrollView leadingAnchor](v55, "leadingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v64));
  objc_msgSend(v65, "setActive:", 1);

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerTitlesPageControl trailingAnchor](v49, "trailingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSTitlesPageControlScrollView trailingAnchor](v55, "trailingAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v67));
  objc_msgSend(v68, "setActive:", 1);

  v174 = v49;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerTitlesPageControl heightAnchor](v49, "heightAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToConstant:", 44.0));
  objc_msgSend(v70, "setActive:", 1);

  v3 = v178;
  v179 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, v52, v53, v54);
  objc_msgSend(v178, "addSubview:");
  if (v16)
  {
    v71 = sub_1003A91F4();
    v72 = [CRLiOSInsertPageViewControllerFadeView alloc];
    if (v71)
    {
      v73 = 0.0;
      v74 = 0.5;
      v75 = 1.0;
    }
    else
    {
      v73 = 1.0;
      v74 = 0.5;
      v75 = 0.0;
    }
    v4 = v177;
    v95 = v180;
    v181 = -[CRLiOSInsertPageViewControllerFadeView initWithStartPoint:endPoint:shouldAddDividerView:](v72, "initWithStartPoint:endPoint:shouldAddDividerView:", 0, v73, v74, v75, 0.5);
    -[CRLiOSInsertPageViewControllerFadeView setTranslatesAutoresizingMaskIntoConstraints:](v181, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  else
  {
    v181 = 0;
    v4 = v177;
    v95 = v180;
  }
  -[CRLiOSInsertPageViewController setP_titlesPageControl:](self, "setP_titlesPageControl:", v174);
  -[CRLiOSInsertPageViewController setP_titlesPageControlBottomBorder:](self, "setP_titlesPageControlBottomBorder:", v179);
  -[CRLiOSInsertPageViewController setP_titlesPageControlScrollView:](self, "setP_titlesPageControlScrollView:", v55);

  v94 = 0;
LABEL_34:
  v96 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", x, v52, v53, v54);
  objc_msgSend(v96, "setAxis:", 1);
  objc_msgSend(v3, "addSubview:", v96);
  v182 = v41;
  v176 = v94;
  if (v55)
  {
    v97 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", x, v52, v53, v54);
    objc_msgSend(v97, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (v26)
    {
      objc_msgSend(v97, "addSubview:", v26);
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
      v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "topAnchor"));
      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:", v99));
      objc_msgSend(v100, "setActive:", 1);

      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
      v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "safeAreaLayoutGuide"));
      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "leadingAnchor"));
      v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "constraintEqualToAnchor:", v103));
      objc_msgSend(v104, "setActive:", 1);

      v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
      v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "bottomAnchor"));
      v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToAnchor:", v106));
      objc_msgSend(v107, "setActive:", 1);

      v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "widthAnchor"));
      v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "constraintEqualToConstant:", 40.0));
      objc_msgSend(v109, "setActive:", 1);

      objc_msgSend(v97, "addSubview:", v181);
      v110 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", x, v52, v53, v54);
      objc_msgSend(v110, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v111 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      objc_msgSend(v110, "setBackgroundColor:", v111);

      objc_msgSend(v97, "addSubview:", v110);
      v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "topAnchor"));
      v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "topAnchor"));
      v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToAnchor:", v113));
      objc_msgSend(v114, "setActive:", 1);

      v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "leadingAnchor"));
      v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "leadingAnchor"));
      v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "constraintEqualToAnchor:", v116));
      objc_msgSend(v117, "setActive:", 1);

      v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "bottomAnchor"));
      v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "bottomAnchor"));
      v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "constraintEqualToAnchor:", v119));
      objc_msgSend(v120, "setActive:", 1);

      v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "trailingAnchor"));
      v122 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerFadeView leadingAnchor](v181, "leadingAnchor"));
      v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "constraintEqualToAnchor:", v122));
      objc_msgSend(v123, "setActive:", 1);

      v124 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerFadeView topAnchor](v181, "topAnchor"));
      v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "topAnchor"));
      v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "constraintEqualToAnchor:", v125));
      objc_msgSend(v126, "setActive:", 1);

      v127 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerFadeView trailingAnchor](v181, "trailingAnchor"));
      v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
      v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "constraintEqualToAnchor:", v128));
      objc_msgSend(v129, "setActive:", 1);

      v130 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerFadeView bottomAnchor](v181, "bottomAnchor"));
      v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "bottomAnchor"));
      v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "constraintEqualToAnchor:", v131));
      objc_msgSend(v132, "setActive:", 1);

      v133 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerFadeView widthAnchor](v181, "widthAnchor"));
      v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "constraintEqualToConstant:", 8.0));
      objc_msgSend(v134, "setActive:", 1);

      -[CRLiOSInsertPageViewController setP_searchButtonSpacerView:](self, "setP_searchButtonSpacerView:", v110);
    }
    else
    {
      v110 = 0;
    }
    objc_msgSend(v97, "addSubview:", v55, v174);
    v135 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSTitlesPageControlScrollView topAnchor](v55, "topAnchor"));
    v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "topAnchor"));
    v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "constraintEqualToAnchor:", v136));
    objc_msgSend(v137, "setActive:", 1);

    v138 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSTitlesPageControlScrollView bottomAnchor](v55, "bottomAnchor"));
    v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "bottomAnchor"));
    v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "constraintEqualToAnchor:", v139));
    objc_msgSend(v140, "setActive:", 1);

    v141 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSTitlesPageControlScrollView trailingAnchor](v55, "trailingAnchor"));
    v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "trailingAnchor"));
    v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "constraintEqualToAnchor:", v142));
    objc_msgSend(v143, "setActive:", 1);

    v144 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSTitlesPageControlScrollView leadingAnchor](v55, "leadingAnchor"));
    if (v26)
    {
      v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
      v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "constraintEqualToAnchor:", v145));
      objc_msgSend(v146, "setActive:", 1);

      objc_msgSend(v97, "bringSubviewToFront:", v110);
      objc_msgSend(v97, "bringSubviewToFront:", v181);
      objc_msgSend(v97, "bringSubviewToFront:", v26);
    }
    else
    {
      v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "safeAreaLayoutGuide"));
      v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "leadingAnchor"));
      v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "constraintEqualToAnchor:", v148));
      objc_msgSend(v149, "setActive:", 1);

      v41 = v182;
    }
    objc_msgSend(v96, "addArrangedSubview:", v97);
    objc_msgSend(v96, "addArrangedSubview:", v179);

    v4 = v177;
    v3 = v178;
    v95 = v180;
    v94 = v176;
  }
  else if (v26)
  {
    objc_msgSend(v96, "addArrangedSubview:", v26);
  }
  if (v41)
  {
    v150 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", x, v52, v53, v54);
    objc_msgSend(v150, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v150, "addSubview:", v41);
    v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "heightAnchor"));
    v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "constraintEqualToConstant:", 44.0));
    objc_msgSend(v152, "setActive:", 1);

    v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "topAnchor"));
    v154 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl topAnchor](v182, "topAnchor"));
    v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "constraintEqualToAnchor:constant:", v154, -8.0));
    objc_msgSend(v155, "setActive:", 1);

    v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "bottomAnchor"));
    v157 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl bottomAnchor](v182, "bottomAnchor"));
    v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "constraintEqualToAnchor:constant:", v157, 8.0));
    objc_msgSend(v158, "setActive:", 1);

    v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "widthAnchor"));
    v160 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl widthAnchor](v182, "widthAnchor"));
    v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "constraintLessThanOrEqualToAnchor:constant:", v160, 64.0));
    objc_msgSend(v161, "setActive:", 1);

    v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "widthAnchor"));
    v163 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl widthAnchor](v182, "widthAnchor"));
    v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "constraintGreaterThanOrEqualToAnchor:constant:", v163, 24.0));
    objc_msgSend(v164, "setActive:", 1);

    v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "centerXAnchor"));
    v166 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl centerXAnchor](v182, "centerXAnchor"));
    v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v165, "constraintEqualToAnchor:", v166));
    objc_msgSend(v167, "setActive:", 1);

    v94 = v176;
    v41 = v182;

    v95 = v180;
    objc_msgSend(v96, "addArrangedSubview:", v150);

  }
  if (v181)
    objc_msgSend(v3, "bringSubviewToFront:");
  v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view", v174));
  -[CRLiOSInsertPageViewController p_setupConstraintsWithTopLevelView:searchBar:navigatorStackView:pageViewControllerView:dotsPageControlWrapper:](self, "p_setupConstraintsWithTopLevelView:searchBar:navigatorStackView:pageViewControllerView:dotsPageControlWrapper:", v3, v95, v96, v168, v94);

  -[CRLiOSInsertPageViewController p_updateTitlesPageControlAndBottomViewColorsInDarkUI:](self, "p_updateTitlesPageControlAndBottomViewColorsInDarkUI:", -[CRLiOSInsertPageViewController crl_isInDarkMode](self, "crl_isInDarkMode"));
  v169 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_searchOverlayView](self, "p_searchOverlayView"));
  if (!v169)
  {
    v169 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", x, v52, v53, v54);
    v170 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 1.0));
    objc_msgSend(v169, "setBackgroundColor:", v170);

    objc_msgSend(v169, "setAlpha:", 0.0);
    objc_msgSend(v169, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v171 = -[CRLiOSInsertPageViewControllerOverlayGestureRecognizer initWithTarget:action:]([CRLiOSInsertPageViewControllerOverlayGestureRecognizer alloc], "initWithTarget:action:", self, "p_searchOverlayTapped:");
    objc_msgSend(v169, "addGestureRecognizer:", v171);
    -[CRLiOSInsertPageViewController setP_searchOverlayView:](self, "setP_searchOverlayView:", v169);
    v172 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_selectedViewController](self, "p_selectedViewController"));
    v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "view"));
    -[CRLiOSInsertPageViewController p_moveOverlayView:toSelectedViewControllerView:](self, "p_moveOverlayView:toSelectedViewControllerView:", v169, v173);

    v94 = v176;
    v41 = v182;

    v95 = v180;
  }

}

- (void)p_moveOverlayView:(id)a3 toSelectedViewControllerView:(id)a4
{
  id v5;
  id v6;
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
  id v18;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "removeFromSuperview");
  objc_msgSend(v5, "addSubview:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
  objc_msgSend(v9, "setActive:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  objc_msgSend(v12, "setActive:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  objc_msgSend(v15, "setActive:", 1);

  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v16));
  objc_msgSend(v17, "setActive:", 1);

}

- (void)p_dotPageControlValueChanged
{
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  void *v11;

  v3 = -[CRLiOSInsertPageViewController p_currentPageNumber](self, "p_currentPageNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_dotsPageControl](self, "p_dotsPageControl"));
  v5 = objc_msgSend(v4, "currentPage");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerDataSource](self, "insertPageViewControllerDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "insertPageViewController:viewControllerForPageAtIndex:", self, v5));

  v11 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_pageViewController](self, "p_pageViewController"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10013C2F0;
  v10[3] = &unk_10123ADB8;
  v10[4] = self;
  v10[5] = v5;
  objc_msgSend(v9, "setViewControllers:direction:animated:completion:", v8, (unint64_t)v5 < v3, 1, v10);
  -[CRLiOSInsertPageViewController p_setViewControllers:shouldUpdatePageViewController:animated:](self, "p_setViewControllers:shouldUpdatePageViewController:animated:", v8, 0, 0);

}

- (void)p_setupConstraintsWithTopLevelView:(id)a3 searchBar:(id)a4 navigatorStackView:(id)a5 pageViewControllerView:(id)a6 dotsPageControlWrapper:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
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
  id v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;

  v65 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v12)
  {
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "leadingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
    objc_msgSend(v18, "setActive:", 1);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
    objc_msgSend(v21, "setActive:", 1);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "heightAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:", 44.0));
    objc_msgSend(v23, "setActive:", 1);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
    objc_msgSend(v26, "setActive:", 1);

  }
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
  objc_msgSend(v29, "setActive:", 1);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v31));
  objc_msgSend(v32, "setActive:", 1);

  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v34));
  objc_msgSend(v35, "setActive:", 1);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v37));
  objc_msgSend(v38, "setActive:", 1);

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "trailingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v40));
  objc_msgSend(v41, "setActive:", 1);

  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v43));
  objc_msgSend(v44, "setActive:", 1);

  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "arrangedSubviews"));
  v46 = objc_msgSend(v45, "count");

  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "heightAnchor"));
  v48 = v47;
  v49 = 44.0;
  if (!v46)
    v49 = 0.0;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToConstant:", v49));
  objc_msgSend(v50, "setActive:", 1);

  if (v15)
  {
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "leadingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v52));
    objc_msgSend(v53, "setActive:", 1);

    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "trailingAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v55));
    objc_msgSend(v56, "setActive:", 1);

    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "heightAnchor"));
    -[CRLiOSInsertPageViewController p_dotsPageControlHeight](self, "p_dotsPageControlHeight");
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToConstant:"));

    objc_msgSend(v58, "setActive:", 1);
    -[CRLiOSInsertPageViewController setP_dotsPageControlHeightConstraint:](self, "setP_dotsPageControlHeightConstraint:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "bottomAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v60));

    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v63));
    objc_msgSend(v64, "setActive:", 1);

  }
  else
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "bottomAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v62));
  }

  objc_msgSend(v61, "setActive:", 1);
  -[CRLiOSInsertPageViewController setP_bottomLayoutConstraintAboveKeyboard:](self, "setP_bottomLayoutConstraintAboveKeyboard:", v61);
  if (v15)
    -[CRLiOSInsertPageViewController p_updateBottomConstraintsIfNeeded](self, "p_updateBottomConstraintsIfNeeded");

}

- (void)p_subpageNavigatorDidChangeSelectedSegment:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerDelegate](self, "insertPageViewControllerDelegate"));
  v5 = objc_msgSend(v4, "selectedSegmentIndex");

  objc_msgSend(v6, "insertPageViewController:didSelectSubpageAtIndex:", self, v5);
}

- (unint64_t)p_pageControlType
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerNavigationDataSource](self, "insertPageViewControllerNavigationDataSource"));
  v3 = objc_msgSend(v2, "pageControlType");

  return (unint64_t)v3;
}

- (double)p_dotsPageControlHeight
{
  unint64_t v2;
  double result;

  v2 = -[CRLiOSInsertPageViewController p_pageControlType](self, "p_pageControlType");
  result = 0.0;
  if (!v2)
  {
    if (+[UIScreen crl_deviceIsLandscape](UIScreen, "crl_deviceIsLandscape", 0.0)
      && +[UIScreen crl_screenClassPhoneUIRegularOrLarge](UIScreen, "crl_screenClassPhoneUIRegularOrLarge"))
    {
      return 39.0;
    }
    else
    {
      return 44.0;
    }
  }
  return result;
}

- (void)p_titlesPageControlValueChanged:(id)a3
{
  -[CRLiOSInsertPageViewController p_selectPageAtIndex:](self, "p_selectPageAtIndex:", objc_msgSend(a3, "selectedTitleIndex"));
}

- (void)p_selectPageAtIndex:(unint64_t)a3
{
  -[CRLiOSInsertPageViewController p_selectPageAtIndex:animated:scrollToBottom:](self, "p_selectPageAtIndex:animated:scrollToBottom:", a3, 1, 0);
}

- (void)p_selectPageAtIndex:(unint64_t)a3 animated:(BOOL)a4 scrollToBottom:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[4];
  _QWORD *v15;
  _QWORD v16[5];
  id v17;
  unint64_t v18;
  BOOL v19;
  void *v20;

  v5 = a5;
  v6 = a4;
  -[CRLiOSInsertPageViewController setP_currentPageNumber:](self, "setP_currentPageNumber:");
  -[CRLiOSInsertPageViewController setP_shouldScrollToBottomOfPage:](self, "setP_shouldScrollToBottomOfPage:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerDataSource](self, "insertPageViewControllerDataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "insertPageViewController:viewControllerForPageAtIndex:", self, a3));

  if (v10)
  {
    v20 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    -[CRLiOSInsertPageViewController setViewControllers:](self, "setViewControllers:", v11);

  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10013CB58;
  v16[3] = &unk_10123AE08;
  v16[4] = self;
  v18 = a3;
  v19 = v6;
  v12 = v10;
  v17 = v12;
  v13 = objc_retainBlock(v16);
  if (-[CRLiOSInsertPageViewController p_isShowingSearchBar](self, "p_isShowingSearchBar"))
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10013CC68;
    v14[3] = &unk_10122F678;
    v15 = v13;
    -[CRLiOSInsertPageViewController p_setSearchBarHidden:animated:completion:](self, "p_setSearchBarHidden:animated:completion:", 1, v6, v14);

  }
  else
  {
    ((void (*)(_QWORD *))v13[2])(v13);
  }

}

- (void)p_updateUIForChangeToPageNumber:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  void *v10;
  double Width;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  int v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void (**v32)(id, uint64_t);
  CGRect v33;
  CGRect v34;

  v5 = a4;
  v32 = (void (**)(id, uint64_t))a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController view](self, "view"));
  objc_msgSend(v8, "layoutIfNeeded");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_titlesPageControlScrollView](self, "p_titlesPageControlScrollView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_titlesPageControl](self, "p_titlesPageControl"));
  objc_msgSend(v10, "setSelectedTitleIndex:", a3);
  objc_msgSend(v9, "frame");
  Width = CGRectGetWidth(v33);
  if (Width != 0.0)
  {
    v12 = Width;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectedButton"));
    objc_msgSend(v13, "frame");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    v34.origin.x = v15;
    v34.origin.y = v17;
    v34.size.width = v19;
    v34.size.height = v21;
    v22 = CGRectGetMidX(v34) + v12 * -0.5;
    objc_msgSend(v9, "contentSize");
    v24 = v23;
    v25 = sub_1003A91F4();
    v26 = v24 - v12;
    v27 = 0.0;
    v28 = 14.0;
    if (a3 != 1)
      v28 = 0.0;
    v29 = fmin(fmax(v22, v28), v26);
    v30 = fmax(v22, 0.0);
    if (a3 == 1)
      v27 = -14.0;
    v31 = fmin(v30, v27 + v26);
    if (!v25)
      v31 = v29;
    objc_msgSend(v9, "setContentOffset:animated:", v5, v31, 0.0);
    if (v32)
      v32[2](v32, 1);
  }

}

- (id)p_selectedViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController viewControllers](self, "viewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return v3;
}

- (void)p_restoreViewState
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerDelegate](self, "insertPageViewControllerDelegate"));
  v4 = objc_msgSend(v3, "insertPageViewControllerShouldAppearInSearchMode:", self);

  if (v4)
  {
    -[CRLiOSInsertPageViewController p_beginSearchingAnimated:](self, "p_beginSearchingAnimated:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController insertPageViewControllerDelegate](self, "insertPageViewControllerDelegate"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "insertPageViewControllerDefaultSearchTerm:", self));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_searchBar](self, "p_searchBar"));
    objc_msgSend(v6, "setText:", v8);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_searchBar](self, "p_searchBar"));
    -[CRLiOSInsertPageViewController searchBar:textDidChange:](self, "searchBar:textDidChange:", v7, v8);

  }
}

- (BOOL)crl_isInDarkMode
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "traitCollection"));
  v4 = objc_msgSend(v3, "crl_isUserInterfaceStyleDark");

  return v4;
}

- (void)p_updateTitlesPageControlAndBottomViewColorsInDarkUI:(BOOL)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = -[CRLiOSInsertPageViewController p_searchBarStyleInDarkUI:](self, "p_searchBarStyleInDarkUI:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_searchBar](self, "p_searchBar"));
  objc_msgSend(v5, "setBarStyle:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_searchBar](self, "p_searchBar"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_searchButton](self, "p_searchButton"));
  objc_msgSend(v9, "setBackgroundColor:", v8);

  v11 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewController p_searchButtonSpacerView](self, "p_searchButtonSpacerView"));
  objc_msgSend(v10, "setBackgroundColor:", v11);

}

- (int64_t)p_searchBarStyleInDarkUI:(BOOL)a3
{
  return a3;
}

- (CRLiOSInsertPageViewControllerDataSource)insertPageViewControllerDataSource
{
  return (CRLiOSInsertPageViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_insertPageViewControllerDataSource);
}

- (void)setInsertPageViewControllerDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_insertPageViewControllerDataSource, a3);
}

- (CRLiOSInsertPageViewControllerDelegate)insertPageViewControllerDelegate
{
  return (CRLiOSInsertPageViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_insertPageViewControllerDelegate);
}

- (void)setInsertPageViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_insertPageViewControllerDelegate, a3);
}

- (CRLiOSInsertPageViewControllerNavigationDataSource)insertPageViewControllerNavigationDataSource
{
  return (CRLiOSInsertPageViewControllerNavigationDataSource *)objc_loadWeakRetained((id *)&self->_insertPageViewControllerNavigationDataSource);
}

- (void)setInsertPageViewControllerNavigationDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_insertPageViewControllerNavigationDataSource, a3);
}

- (NSString)selectedPageNumberAutosaveName
{
  return self->_selectedPageNumberAutosaveName;
}

- (void)setSelectedPageNumberAutosaveName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)selectedSubpageAutosaveName
{
  return self->_selectedSubpageAutosaveName;
}

- (void)setSelectedSubpageAutosaveName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (unint64_t)p_currentPageNumber
{
  return self->_currentPageNumber;
}

- (void)setP_currentPageNumber:(unint64_t)a3
{
  self->_currentPageNumber = a3;
}

- (UIPageControl)p_dotsPageControl
{
  return self->_dotsPageControl;
}

- (void)setP_dotsPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_dotsPageControl, a3);
}

- (UIView)p_bottomFadeBar
{
  return self->_bottomFadeBar;
}

- (void)setP_bottomFadeBar:(id)a3
{
  objc_storeStrong((id *)&self->_bottomFadeBar, a3);
}

- (BOOL)p_isInViewHierarchy
{
  return self->_isInViewHierarchy;
}

- (void)setP_isInViewHierarchy:(BOOL)a3
{
  self->_isInViewHierarchy = a3;
}

- (BOOL)p_isShowingSearchBar
{
  return self->_isShowingSearchBar;
}

- (void)setP_isShowingSearchBar:(BOOL)a3
{
  self->_isShowingSearchBar = a3;
}

- (NSLayoutConstraint)p_bottomLayoutConstraintAboveKeyboard
{
  return self->_bottomLayoutConstraintAboveKeyboard;
}

- (void)setP_bottomLayoutConstraintAboveKeyboard:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLayoutConstraintAboveKeyboard, a3);
}

- (UIPageViewController)p_pageViewController
{
  return self->_pageViewController;
}

- (void)setP_pageViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pageViewController, a3);
}

- (UISearchBar)p_searchBar
{
  return self->_searchBar;
}

- (void)setP_searchBar:(id)a3
{
  objc_storeStrong((id *)&self->_searchBar, a3);
}

- (UIButton)p_searchButton
{
  return self->_searchButton;
}

- (void)setP_searchButton:(id)a3
{
  objc_storeStrong((id *)&self->_searchButton, a3);
}

- (UIView)p_searchButtonSpacerView
{
  return self->_searchButtonSpacerView;
}

- (void)setP_searchButtonSpacerView:(id)a3
{
  objc_storeStrong((id *)&self->_searchButtonSpacerView, a3);
}

- (UIView)p_searchOverlayView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_searchOverlayView);
}

- (void)setP_searchOverlayView:(id)a3
{
  objc_storeWeak((id *)&self->_searchOverlayView, a3);
}

- (UIViewController)p_searchViewController
{
  return self->_searchViewController;
}

- (void)setP_searchViewController:(id)a3
{
  objc_storeStrong((id *)&self->_searchViewController, a3);
}

- (CRLiOSMultipaneSegmentedControl)p_subpageNavigator
{
  return self->_subpageNavigator;
}

- (void)setP_subpageNavigator:(id)a3
{
  objc_storeStrong((id *)&self->_subpageNavigator, a3);
}

- (CRLiOSInsertPageViewControllerTitlesPageControl)p_titlesPageControl
{
  return self->_titlesPageControl;
}

- (void)setP_titlesPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_titlesPageControl, a3);
}

- (UIView)p_titlesPageControlBottomBorder
{
  return self->_titlesPageControlBottomBorder;
}

- (void)setP_titlesPageControlBottomBorder:(id)a3
{
  objc_storeStrong((id *)&self->_titlesPageControlBottomBorder, a3);
}

- (NSLayoutConstraint)p_dotsPageControlHeightConstraint
{
  return self->_dotsPageControlHeightConstraint;
}

- (void)setP_dotsPageControlHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_dotsPageControlHeightConstraint, a3);
}

- (UIScrollView)p_titlesPageControlScrollView
{
  return self->_titlesPageControlScrollView;
}

- (void)setP_titlesPageControlScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_titlesPageControlScrollView, a3);
}

- (BOOL)p_shouldUpdatePageSelectionOnNextLayoutSubviews
{
  return self->_shouldUpdatePageSelectionOnNextLayoutSubviews;
}

- (void)setP_shouldUpdatePageSelectionOnNextLayoutSubviews:(BOOL)a3
{
  self->_shouldUpdatePageSelectionOnNextLayoutSubviews = a3;
}

- (BOOL)p_didExplicitlyCancelSearch
{
  return self->_didExplicitlyCancelSearch;
}

- (void)setP_didExplicitlyCancelSearch:(BOOL)a3
{
  self->_didExplicitlyCancelSearch = a3;
}

- (BOOL)p_shouldIgnoreCancelBecauseOfWriting
{
  return self->_shouldIgnoreCancelBecauseOfWriting;
}

- (void)setP_shouldIgnoreCancelBecauseOfWriting:(BOOL)a3
{
  self->_shouldIgnoreCancelBecauseOfWriting = a3;
}

- (BOOL)p_shouldScrollToBottomOfPage
{
  return self->_p_shouldScrollToBottomOfPage;
}

- (void)setP_shouldScrollToBottomOfPage:(BOOL)a3
{
  self->_p_shouldScrollToBottomOfPage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titlesPageControlScrollView, 0);
  objc_storeStrong((id *)&self->_dotsPageControlHeightConstraint, 0);
  objc_storeStrong((id *)&self->_titlesPageControlBottomBorder, 0);
  objc_storeStrong((id *)&self->_titlesPageControl, 0);
  objc_storeStrong((id *)&self->_subpageNavigator, 0);
  objc_storeStrong((id *)&self->_searchViewController, 0);
  objc_destroyWeak((id *)&self->_searchOverlayView);
  objc_storeStrong((id *)&self->_searchButtonSpacerView, 0);
  objc_storeStrong((id *)&self->_searchButton, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);
  objc_storeStrong((id *)&self->_bottomLayoutConstraintAboveKeyboard, 0);
  objc_storeStrong((id *)&self->_bottomFadeBar, 0);
  objc_storeStrong((id *)&self->_dotsPageControl, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_selectedSubpageAutosaveName, 0);
  objc_storeStrong((id *)&self->_selectedPageNumberAutosaveName, 0);
  objc_destroyWeak((id *)&self->_insertPageViewControllerNavigationDataSource);
  objc_destroyWeak((id *)&self->_insertPageViewControllerDelegate);
  objc_destroyWeak((id *)&self->_insertPageViewControllerDataSource);
}

@end
