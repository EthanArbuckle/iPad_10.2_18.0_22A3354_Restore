@implementation BKPageScrollerViewController

- (BKPageScrollerViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5
{
  BKPageScrollerViewController *result;

  result = -[BKPageNavigationViewController init](self, "init", a3, a4, a5);
  if (result)
  {
    result->_navigationOrientation = a4;
    result->_maxZoomScale = 32.0;
    result->_maxResizeScale = 1.0;
    result->super._pageOffset = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[BKPageScrollerViewController releaseViews](self, "releaseViews");
  v3.receiver = self;
  v3.super_class = (Class)BKPageScrollerViewController;
  -[BKViewController dealloc](&v3, "dealloc");
}

- (void)releaseViews
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageScrollerViewController _allPageViews](self, "_allPageViews"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "teardown");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[BKPagingScrollView setDelegate:](self->_pageScroller, "setDelegate:", 0);
  -[UITapGestureRecognizer setDelegate:](self->_pageChangeTapRecognizer, "setDelegate:", 0);
  -[UITapGestureRecognizer removeTarget:action:](self->_pageChangeTapRecognizer, "removeTarget:action:", self, 0);
  -[UITapGestureRecognizer setDelegate:](self->_doubleTapRecognizer, "setDelegate:", 0);
  -[UITapGestureRecognizer removeTarget:action:](self->_doubleTapRecognizer, "removeTarget:action:", self, 0);
  -[UITapGestureRecognizer setDelegate:](self->_controlsTapRecognizer, "setDelegate:", 0);
  -[UITapGestureRecognizer removeTarget:action:](self->_controlsTapRecognizer, "removeTarget:action:", self, 0);
  v8.receiver = self;
  v8.super_class = (Class)BKPageScrollerViewController;
  -[BKViewController releaseViews](&v8, "releaseViews");
}

- (void)loadView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t v11;
  BKPagingScrollView *v12;
  BKPagingScrollView *pageScroller;
  UITapGestureRecognizer *v14;
  UITapGestureRecognizer *doubleTapRecognizer;
  UITapGestureRecognizer *v16;
  UITapGestureRecognizer *pageChangeTapRecognizer;
  UITapGestureRecognizer *v18;
  UITapGestureRecognizer *controlsTapRecognizer;
  id v20;

  v20 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 320.0, 460.0);
  objc_msgSend(v20, "setAutoresizingMask:", 18);
  objc_msgSend(v20, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[BKPageScrollerViewController navigationOrientation](self, "navigationOrientation");
  if (v11)
    v6 = v6 + -20.0;
  else
    v4 = v4 + -20.0;
  if (v11)
    v10 = v10 + 40.0;
  else
    v8 = v8 + 40.0;
  v12 = -[BKPagingScrollView initWithFrame:]([BKPagingScrollView alloc], "initWithFrame:", v4, v6, v8, v10);
  pageScroller = self->_pageScroller;
  self->_pageScroller = v12;

  -[BKPagingScrollView setNavigationOrientation:](self->_pageScroller, "setNavigationOrientation:", -[BKPageScrollerViewController navigationOrientation](self, "navigationOrientation"));
  -[BKPagingScrollView setLayoutDirection:](self->_pageScroller, "setLayoutDirection:", -[BKViewController layoutDirection](self, "layoutDirection"));
  -[BKPagingScrollView setAutoresizingMask:](self->_pageScroller, "setAutoresizingMask:", 18);
  -[BKPagingScrollView setDelegate:](self->_pageScroller, "setDelegate:", self);
  -[BKPagingScrollView setPageCacheDistance:](self->_pageScroller, "setPageCacheDistance:", 1);
  -[BKPagingScrollView setPageCount:](self->_pageScroller, "setPageCount:", -[BKPageNavigationViewController pageCount](self, "pageCount"));
  -[BKPagingScrollView setPageOffset:](self->_pageScroller, "setPageOffset:", -[BKPageNavigationViewController pageOffset](self, "pageOffset"));
  -[BKPagingScrollView setContentInsetAdjustmentBehavior:](self->_pageScroller, "setContentInsetAdjustmentBehavior:", 2);
  objc_msgSend(v20, "addSubview:", self->_pageScroller);
  v14 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleDoubleTap:");
  doubleTapRecognizer = self->_doubleTapRecognizer;
  self->_doubleTapRecognizer = v14;

  -[UITapGestureRecognizer setDelegate:](self->_doubleTapRecognizer, "setDelegate:", self);
  -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_doubleTapRecognizer, "setNumberOfTapsRequired:", 2);
  -[BKPagingScrollView addGestureRecognizer:](self->_pageScroller, "addGestureRecognizer:", self->_doubleTapRecognizer);
  v16 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handlePageChangeTap:");
  pageChangeTapRecognizer = self->_pageChangeTapRecognizer;
  self->_pageChangeTapRecognizer = v16;

  -[UITapGestureRecognizer setDelegate:](self->_pageChangeTapRecognizer, "setDelegate:", self);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_pageChangeTapRecognizer, "requireGestureRecognizerToFail:", self->_doubleTapRecognizer);
  -[BKPagingScrollView addGestureRecognizer:](self->_pageScroller, "addGestureRecognizer:", self->_pageChangeTapRecognizer);
  v18 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "toggleControls:");
  controlsTapRecognizer = self->_controlsTapRecognizer;
  self->_controlsTapRecognizer = v18;

  -[UITapGestureRecognizer setDelegate:](self->_controlsTapRecognizer, "setDelegate:", self);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_controlsTapRecognizer, "requireGestureRecognizerToFail:", self->_pageChangeTapRecognizer);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_controlsTapRecognizer, "requireGestureRecognizerToFail:", self->_doubleTapRecognizer);
  -[BKPagingScrollView addGestureRecognizer:](self->_pageScroller, "addGestureRecognizer:", self->_controlsTapRecognizer);
  -[BKPageScrollerViewController setView:](self, "setView:", v20);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKPageScrollerViewController;
  -[BKPageScrollerViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[BKPagingScrollView layoutIfNeeded](self->_pageScroller, "layoutIfNeeded");
}

- (void)adjustToNewSize:(CGSize)a3
{
  -[BKPageScrollerViewController zoomVisiblePageToFit:](self, "zoomVisiblePageToFit:", 0, a3.width, a3.height);
}

- (id)contentView
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView currentView](self->_pageScroller, "currentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageScrollerViewController _pageViewInZoomingScrollView:](self, "_pageViewInZoomingScrollView:", v3));

  return v4;
}

- (void)contentViewImage:(BOOL)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView currentView](self->_pageScroller, "currentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageScrollerViewController _pageViewInZoomingScrollView:](self, "_pageViewInZoomingScrollView:", v6));
  if (!a3)
    -[BKPageScrollerViewController resetZoomScaleForScrollView:](self, "resetZoomScaleForScrollView:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "im_snapshotInContext"));

  v9 = objc_retainBlock(v11);
  v10 = v9;
  if (v9)
    (*((void (**)(id, void *))v9 + 2))(v9, v8);

}

- (void)setPageOffset:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKPageScrollerViewController;
  -[BKPageNavigationViewController setPageOffset:](&v5, "setPageOffset:");
  -[BKPagingScrollView setPageOffset:](self->_pageScroller, "setPageOffset:", a3);
}

- (void)setPageCount:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKPageScrollerViewController;
  -[BKPageNavigationViewController setPageCount:](&v5, "setPageCount:");
  -[BKPagingScrollView setPageCount:](self->_pageScroller, "setPageCount:", a3);
}

- (_NSRange)visiblePages
{
  int64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v3 = -[BKPageNavigationViewController pageOffset](self, "pageOffset");
  v4 = -[BKPageNavigationViewController pageCount](self, "pageCount");
  if (v3 + 1 < v4)
    v5 = v3 + 1;
  else
    v5 = v4;
  if (v5 <= 1)
    v6 = 1;
  else
    v6 = v5;
  v7 = 1;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)turnToPageNumber:(int64_t)a3 animated:(BOOL)a4
{
  int64_t v4;
  _BOOL4 v5;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[6];

  v4 = a3 - 1;
  if (a3 >= 1)
  {
    v5 = a4;
    if (-[BKPageNavigationViewController pageCount](self, "pageCount") >= a3)
    {
      if (-[BKPageScrollerViewController isVisible](self, "isVisible") && v5)
      {
        self->_animatingPageOffset = 1;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
        objc_msgSend(v8, "postEvent:sender:", kBETestDriverPageTurnStart, self);
        objc_msgSend(v8, "postEvent:sender:", kBETestDriverPageTurnSetupStart, self);
        objc_msgSend(v8, "postEvent:sender:", kBETestDriverPageTurnSetupEnd, self);
        objc_msgSend(v8, "postEvent:sender:", kBETestDriverPageTurnAnimationStart, self);
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_6206C;
        v12[3] = &unk_1C03B0;
        v12[4] = self;
        v12[5] = a3;
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_62078;
        v10[3] = &unk_1BFD90;
        v10[4] = self;
        v11 = v8;
        v9 = v8;
        +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v12, v10, 0.2);

      }
      else
      {
        -[BKPageScrollerViewController setPageOffset:](self, "setPageOffset:", v4);
      }
    }
  }
}

- (BOOL)isZoomedOut
{
  void *v2;
  double v3;
  double v4;
  double v5;
  BOOL v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageScrollerViewController _currentZoomingScrollView](self, "_currentZoomingScrollView"));
  objc_msgSend(v2, "zoomScale");
  v4 = v3;
  objc_msgSend(v2, "minimumZoomScale");
  v6 = vabdd_f64(v4, v5) < 0.00999999978;

  return v6;
}

- (CGRect)_frameForPageNumber:(unint64_t)a3
{
  double v5;
  double y;
  double v7;
  double width;
  double v9;
  double height;
  double x;
  int64_t v12;
  double v13;
  double v14;
  char *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  if (self->_pageScroller)
  {
    if (-[BKPageScrollerViewController navigationOrientation](self, "navigationOrientation"))
    {
      -[BKPagingScrollView frame](self->_pageScroller, "frame");
      y = v5 * (double)(a3 - 1) + 20.0;
      -[BKPagingScrollView frame](self->_pageScroller, "frame");
      width = v7;
      -[BKPagingScrollView frame](self->_pageScroller, "frame");
      height = v9 + -40.0;
      x = 0.0;
    }
    else
    {
      v12 = -[BKViewController layoutDirection](self, "layoutDirection");
      -[BKPagingScrollView frame](self->_pageScroller, "frame");
      v14 = v13;
      if (v12 == 1)
        v15 = (char *)-[BKPageNavigationViewController pageCount](self, "pageCount") - a3;
      else
        v15 = (char *)(a3 - 1);
      x = v14 * (double)(unint64_t)v15 + 20.0;
      -[BKPagingScrollView frame](self->_pageScroller, "frame");
      width = v16 + -40.0;
      -[BKPagingScrollView frame](self->_pageScroller, "frame");
      y = 0.0;
    }
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v17 = x;
  v18 = y;
  v19 = width;
  result.size.height = height;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)viewForPageNumber:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BKZoomingScrollView *v13;
  BKPageScrollerPageView *v14;
  void *v15;
  void *v16;
  void *v17;
  BKPageScrollerPageView *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;

  -[BKPageScrollerViewController _frameForPageNumber:](self, "_frameForPageNumber:");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = -[BKZoomingScrollView initWithFrame:]([BKZoomingScrollView alloc], "initWithFrame:", v5, v7, v9, v11);
  v14 = [BKPageScrollerPageView alloc];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageScrollerViewController thumbnailingDelegate](self, "thumbnailingDelegate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageScrollerViewController imageResizerDelegate](self, "imageResizerDelegate"));
  v18 = -[BKPageScrollerPageView initWithFrame:pageNumber:navigationDelegate:thumbnailingDelegate:imageResizerDelegate:](v14, "initWithFrame:pageNumber:navigationDelegate:thumbnailingDelegate:imageResizerDelegate:", a3, v15, v16, v17, v6, v8, v10, v12);

  -[BKPageScrollerPageView sizeThatFits:](v18, "sizeThatFits:", v10, v12);
  -[BKPageScrollerPageView setFrame:](v18, "setFrame:", 0.0, 0.0, v19, v20);
  -[BKPageScrollerPageView setTag:](v18, "setTag:", 128);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageScrollerPageView layer](v18, "layer"));
  objc_msgSend(v21, "setShadowOffset:", 0.0, 1.0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageScrollerPageView layer](v18, "layer"));
  LODWORD(v23) = 1051931443;
  objc_msgSend(v22, "setShadowOpacity:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageScrollerPageView layer](v18, "layer"));
  objc_msgSend(v24, "setShadowRadius:", 3.0);

  -[BKPageScrollerPageView bounds](v18, "bounds");
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:")));
  v26 = objc_msgSend(v25, "CGPath");
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageScrollerPageView layer](v18, "layer"));
  objc_msgSend(v27, "setShadowPath:", v26);

  -[BKZoomingScrollView setAutoresizingMask:](v13, "setAutoresizingMask:", 18);
  -[BKZoomingScrollView setShowsHorizontalScrollIndicator:](v13, "setShowsHorizontalScrollIndicator:", 0);
  -[BKZoomingScrollView setShowsVerticalScrollIndicator:](v13, "setShowsVerticalScrollIndicator:", 0);
  -[BKZoomingScrollView addSubview:](v13, "addSubview:", v18);
  -[BKZoomingScrollView setDelegate:](v13, "setDelegate:", self);
  -[BKZoomingScrollView setMinimumZoomScale:](v13, "setMinimumZoomScale:", 1.0);
  -[BKZoomingScrollView setMaximumZoomScale:](v13, "setMaximumZoomScale:", self->_maxZoomScale);
  -[BKZoomingScrollView setMaxSimulatedZoomScale:](v13, "setMaxSimulatedZoomScale:", self->_maxResizeScale);
  -[BKZoomingScrollView setBouncesZoom:](v13, "setBouncesZoom:", 1);
  -[BKZoomingScrollView setDecelerationRate:](v13, "setDecelerationRate:", UIScrollViewDecelerationRateFast);
  -[BKZoomingScrollView setDirectionalLockEnabled:](v13, "setDirectionalLockEnabled:", 1);
  -[BKZoomingScrollView setContentInsetAdjustmentBehavior:](v13, "setContentInsetAdjustmentBehavior:", 2);
  -[BKZoomingScrollView setClipsToBounds:](v13, "setClipsToBounds:", 1);
  -[BKPageScrollerPageView bounds](v18, "bounds");
  -[BKZoomingScrollView configureForImageSize:](v13, "configureForImageSize:", v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageScrollerViewController _currentZoomingScrollView](self, "_currentZoomingScrollView"));
  v31 = v30;
  if (self->_maintainZoomScale && v30)
  {
    objc_msgSend(v30, "totalZoomScale");
    -[BKZoomingScrollView setTotalZoomScale:](v13, "setTotalZoomScale:");
  }
  else
  {
    -[BKZoomingScrollView minimumZoomScale](v13, "minimumZoomScale");
    -[BKZoomingScrollView setZoomScale:](v13, "setZoomScale:");
  }

  return v13;
}

- (void)zoomVisiblePageToFit:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  _QWORD v7[5];
  id v8;
  id location;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView viewAtIndex:](self->_pageScroller, "viewAtIndex:", -[BKPageNavigationViewController pageOffset](self, "pageOffset", a3)));
  self->_animatingZoomScale = 1;
  objc_initWeak(&location, v4);
  objc_msgSend(v4, "minimumZoomScale");
  v6 = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_62634;
  v7[3] = &unk_1BE930;
  v7[4] = self;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "setZoomScale:animated:completionBlock:", 1, v7, v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (id)viewForZoomingInScrollView:(id)a3
{
  void *v3;

  if (self->_pageScroller == a3)
    v3 = 0;
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageScrollerViewController _pageViewInZoomingScrollView:](self, "_pageViewInZoomingScrollView:"));
  return v3;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "pageNavigationDidBeginInteracting:", self);

}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate", a3, a4));
  objc_msgSend(v5, "pageNavigationDidBeginInteracting:", self);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[BKPageScrollerViewController _visibleAreaChangedInScrollView:](self, "_visibleAreaChangedInScrollView:", a3);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[BKPageScrollerViewController _visibleAreaChangedInScrollView:](self, "_visibleAreaChangedInScrollView:", a3);
  -[BKPagingScrollView updateCachedPages](self->_pageScroller, "updateCachedPages");
}

- (void)zoomingScrollView:(id)a3 didSimulateZoomScale:(double)a4 onView:(id)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a5;
  objc_msgSend(v6, "bounds");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:")));
  v8 = objc_msgSend(v7, "CGPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  objc_msgSend(v9, "setShadowPath:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  objc_msgSend(v10, "setShadowOffset:", a4 * 0.0, a4);

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  objc_msgSend(v11, "setShadowRadius:", a4 * 3.0);

}

- (id)pagingScrollView:(id)a3 viewAtIndex:(int64_t)a4
{
  return -[BKPageScrollerViewController viewForPageNumber:](self, "viewForPageNumber:", a4 + 1);
}

- (void)pagingScrollView:(id)a3 didRemoveView:(id)a4 atIndex:(int64_t)a5
{
  uint64_t v5;
  id v6;

  v6 = a4;
  objc_opt_class(BKZoomingScrollView);
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    objc_msgSend(v6, "setDelegate:", 0);

}

- (void)pagingScrollView:(id)a3 viewDidAppear:(id)a4 atIndex:(int64_t)a5
{
  void *v7;
  void *v8;
  id v9;

  self->super._pageOffset = -[BKPagingScrollView pageOffset](self->_pageScroller, "pageOffset", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
  objc_msgSend(v7, "pageNavigationDidChangeLocation:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "existingContentViewControllerForPageNumber:", a5 + 1));

  objc_msgSend(v9, "beginAppearanceTransition:animated:", 1, 0);
  objc_msgSend(v9, "endAppearanceTransition");

}

- (void)resetZoomScaleForScrollView:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "minimumZoomScale");
  objc_msgSend(v3, "setZoomScale:");

}

- (void)pagingScrollView:(id)a3 viewDidDisappear:(id)a4 atIndex:(int64_t)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_opt_class(UIScrollView);
  if ((objc_opt_isKindOfClass(v10, v7) & 1) != 0 && !self->_maintainZoomScale)
    -[BKPageScrollerViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "resetZoomScaleForScrollView:", v10, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "existingContentViewControllerForPageNumber:", a5 + 1));

  objc_msgSend(v9, "beginAppearanceTransition:animated:", 0, 0);
  objc_msgSend(v9, "endAppearanceTransition");

}

- (void)handleDoubleTap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double MidX;
  double v24;
  _QWORD v25[5];
  id v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "existingContentViewControllerForPageNumber:", (char *)-[BKPageNavigationViewController pageOffset](self, "pageOffset") + 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView viewAtIndex:](self->_pageScroller, "viewAtIndex:", -[BKPageNavigationViewController pageOffset](self, "pageOffset")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v4, "locationInView:", v8);
  v10 = v9;

  objc_msgSend(v7, "zoomScale");
  v12 = v11;
  objc_msgSend(v7, "minimumZoomScale");
  if (v12 <= v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v14, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    v27.origin.x = v16;
    v27.origin.y = v18;
    v27.size.width = v20;
    v27.size.height = v22;
    if (v10 >= CGRectGetMidX(v27))
    {
      v29.origin.x = v16;
      v29.origin.y = v18;
      v29.size.width = v20;
      v29.size.height = v22;
      MidX = CGRectGetMidX(v29);
    }
    else
    {
      v28.origin.x = v16;
      v28.origin.y = v18;
      v28.size.width = v20;
      v28.size.height = v22;
      MidX = CGRectGetMinX(v28);
    }
    v24 = MidX;
    self->_animatingZoomScale = 1;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_62C28;
    v25[3] = &unk_1BFDB8;
    v25[4] = self;
    v26 = v7;
    objc_msgSend(v26, "zoomToRect:animated:completionBlock:", 1, v25, v24, v18, v20 * 0.5, v22);

  }
  else
  {
    -[BKPageScrollerViewController zoomVisiblePageToFit:](self, "zoomVisiblePageToFit:", 1);
  }

}

- (void)handlePageChangeTap:(id)a3
{
  BKPagingScrollView *pageScroller;
  id v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  uint64_t v32;
  void *v33;
  unsigned __int8 v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  pageScroller = self->_pageScroller;
  v5 = a3;
  v37 = (id)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView viewAtIndex:](pageScroller, "viewAtIndex:", -[BKPageNavigationViewController pageOffset](self, "pageOffset")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;

  v11 = isPad(v9, v10);
  if ((_DWORD)v11)
  {
    if (isPortrait(v11))
      v12 = 110.0;
    else
      v12 = 82.0;
  }
  else
  {
    v12 = 80.0;
  }
  if (!self->_maintainZoomScale)
    goto LABEL_14;
  objc_msgSend(v37, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v6, "bounds");
  if (v8 <= CGRectGetMaxX(v38) - v12)
  {
    objc_msgSend(v6, "bounds");
    if (v8 < v12 + CGRectGetMinX(v40))
    {
      v41.origin.x = v14;
      v41.origin.y = v16;
      v41.size.width = v18;
      v41.size.height = v20;
      v29 = CGRectGetMinX(v41) + -1.0;
      objc_msgSend(v37, "contentInset");
      if (v29 > v30)
      {
        objc_msgSend(v37, "contentInset");
        v28 = v31;
        goto LABEL_13;
      }
    }
LABEL_14:
    objc_msgSend(v6, "bounds");
    if (v8 <= CGRectGetMaxX(v42) - v12)
    {
      objc_msgSend(v6, "bounds");
      if (v8 >= v12 + CGRectGetMinX(v43))
      {
        v32 = 0;
        goto LABEL_21;
      }
      v32 = -1;
    }
    else
    {
      v32 = 1;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v34 = objc_msgSend(v33, "BOOLForKey:", BKLeftTapTurnToNextDefault[0]);

    if ((v34 & 1) != 0)
    {
      v35 = 2;
LABEL_25:
      -[BKPageScrollerViewController turnToPageNumber:animated:](self, "turnToPageNumber:animated:", (char *)-[BKPageNavigationViewController pageOffset](self, "pageOffset") + v35, 1);
      goto LABEL_26;
    }
LABEL_21:
    if ((char *)-[BKViewController layoutDirection](self, "layoutDirection") == (char *)&dword_0 + 1)
      v36 = -v32;
    else
      v36 = v32;
    v35 = v36 + 1;
    goto LABEL_25;
  }
  v39.origin.x = v14;
  v39.origin.y = v16;
  v39.size.width = v18;
  v39.size.height = v20;
  v21 = CGRectGetMaxX(v39) + 1.0;
  objc_msgSend(v37, "contentSize");
  v23 = v22;
  objc_msgSend(v37, "contentInset");
  if (v21 >= v23 - v24)
    goto LABEL_14;
  objc_msgSend(v37, "contentSize");
  v26 = v25;
  objc_msgSend(v37, "contentInset");
  v28 = v26 - v27 - v18;
LABEL_13:
  objc_msgSend(v37, "setContentOffset:animated:", 1, v28, v16);
LABEL_26:

}

- (void)toggleControls:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "pageNavigationToggleControls:", self);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  BOOL v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  CGRect v13;
  CGRect v14;

  if (self->_pageChangeTapRecognizer != a3)
    return 1;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;

  v10 = isPad(v8, v9);
  if ((_DWORD)v10)
  {
    if (isPortrait(v10))
      v11 = 110.0;
    else
      v11 = 82.0;
  }
  else
  {
    v11 = 80.0;
  }
  objc_msgSend(v5, "bounds");
  v3 = 1;
  if (v7 < CGRectGetMaxX(v13) - v11)
  {
    objc_msgSend(v5, "bounds");
    if (v7 > v11 + CGRectGetMinX(v14))
      v3 = 0;
  }

  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  if (self->_pageChangeTapRecognizer == a3)
    return objc_msgSend(a4, "bk_isWKSyntheticTapGestureRecognizer");
  else
    return 0;
}

- (BOOL)gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  unsigned int v9;

  v6 = a4;
  if (self->_doubleTapRecognizer == a3
    && (objc_opt_class(UITapGestureRecognizer), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    v8 = v6;
    if (objc_msgSend(v8, "numberOfTapsRequired") == (char *)&dword_0 + 2)
      v9 = objc_msgSend(v8, "matchesTarget:andAction:", +[UIView be_wkContentViewClass](UIView, "be_wkContentViewClass"), "_nonBlockingDoubleTapRecognized:") ^ 1;
    else
      LOBYTE(v9) = 1;

  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (void)_visibleAreaChangedInScrollView:(id)a3
{
  BKPagingScrollView *v4;
  BKPagingScrollView *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  uint64_t v10;
  char isKindOfClass;
  BKPagingScrollView *v12;
  BKPagingScrollView *v13;
  BKPagingScrollView *v14;

  v4 = (BKPagingScrollView *)a3;
  v5 = v4;
  if (!self->_animatingZoomScale)
  {
    v13 = v4;
    v6 = -[BKPagingScrollView isDragging](v4, "isDragging");
    v5 = v13;
    if ((v6 & 1) == 0)
    {
      v7 = -[BKPagingScrollView isDecelerating](v13, "isDecelerating");
      v5 = v13;
      if ((v7 & 1) == 0)
      {
        v8 = -[BKPagingScrollView isZooming](v13, "isZooming");
        v5 = v13;
        if ((v8 & 1) == 0)
        {
          v9 = -[BKPagingScrollView isZoomBouncing](v13, "isZoomBouncing");
          v5 = v13;
          if ((v9 & 1) == 0)
          {
            if (self->_resizeViewsWhenZoomed)
            {
              objc_opt_class(BKZoomingScrollView);
              isKindOfClass = objc_opt_isKindOfClass(v13, v10);
              v5 = v13;
              if ((isKindOfClass & 1) != 0)
              {
                -[BKPagingScrollView simulateZoomScaleByResizingView](v13, "simulateZoomScaleByResizingView");
                v5 = v13;
              }
            }
            if (self->_maintainZoomScale)
            {
              v12 = (BKPagingScrollView *)objc_claimAutoreleasedReturnValue(-[BKPageScrollerViewController _currentZoomingScrollView](self, "_currentZoomingScrollView"));

              v5 = v13;
              if (v12 == v13)
              {
                -[BKPageScrollerViewController _updateSurroundingZoomScales](self, "_updateSurroundingZoomScales");
                v5 = v13;
              }
            }
          }
        }
      }
    }
  }
  if (self->_pageScroller == v5)
  {
    v14 = v5;
    -[BKPageScrollerViewController _updatePageViewScrollStates](self, "_updatePageViewScrollStates");
    v5 = v14;
  }

}

- (void)_updatePageViewScrollStates
{
  _BOOL4 animatingPageOffset;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  animatingPageOffset = 1;
  if ((-[BKPagingScrollView isDragging](self->_pageScroller, "isDragging") & 1) == 0
    && (-[BKPagingScrollView isDecelerating](self->_pageScroller, "isDecelerating") & 1) == 0)
  {
    animatingPageOffset = self->_animatingPageOffset;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView currentView](self->_pageScroller, "currentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageScrollerViewController _pageViewInZoomingScrollView:](self, "_pageViewInZoomingScrollView:", v4));

  if (animatingPageOffset)
    v6 = 1;
  else
    v6 = 2;
  objc_msgSend(v5, "setScrollState:", v6);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView surroundingViews](self->_pageScroller, "surroundingViews", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    if (animatingPageOffset)
      v11 = 1;
    else
      v11 = 3;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageScrollerViewController _pageViewInZoomingScrollView:](self, "_pageViewInZoomingScrollView:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i)));
        objc_msgSend(v13, "setScrollState:", v11);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (id)_allPageViews
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView allViews](self->_pageScroller, "allViews", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageScrollerViewController _pageViewInZoomingScrollView:](self, "_pageViewInZoomingScrollView:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8)));
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_pageViewInZoomingScrollView:(id)a3
{
  return objc_msgSend(a3, "viewWithTag:", 128);
}

- (id)_currentZoomingScrollView
{
  return -[BKPagingScrollView currentView](self->_pageScroller, "currentView");
}

- (void)_updateSurroundingZoomScales
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  CGRect v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageScrollerViewController _currentZoomingScrollView](self, "_currentZoomingScrollView"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView subviews](self->_pageScroller, "subviews", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (v9 != v3)
        {
          objc_opt_class(BKZoomingScrollView);
          if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
          {
            v11 = v9;
            v12 = objc_msgSend(v3, "tag");
            LODWORD(v12) = (uint64_t)v12 > (uint64_t)objc_msgSend(v11, "tag");
            if ((_DWORD)v12 == ((char *)-[BKViewController layoutDirection](self, "layoutDirection") == (char *)&dword_0 + 1))
            {
              objc_msgSend(v11, "contentInset");
              v17 = -v18;
            }
            else
            {
              objc_msgSend(v11, "contentSize");
              v14 = v13;
              objc_msgSend(v11, "bounds");
              v15 = v14 - CGRectGetWidth(v26);
              objc_msgSend(v11, "contentInset");
              v17 = v15 + v16;
            }
            objc_msgSend(v3, "contentOffset");
            v20 = v19;
            objc_msgSend(v3, "totalZoomScale");
            objc_msgSend(v11, "setTotalZoomScale:");
            objc_msgSend(v11, "setContentOffset:", v17, v20);

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

}

- (int64_t)navigationOrientation
{
  return self->_navigationOrientation;
}

- (BKPageScrollerThumbnailingDelegate)thumbnailingDelegate
{
  return (BKPageScrollerThumbnailingDelegate *)objc_loadWeakRetained((id *)&self->_thumbnailingDelegate);
}

- (void)setThumbnailingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_thumbnailingDelegate, a3);
}

- (BOOL)maintainZoomScale
{
  return self->_maintainZoomScale;
}

- (void)setMaintainZoomScale:(BOOL)a3
{
  self->_maintainZoomScale = a3;
}

- (double)maxZoomScale
{
  return self->_maxZoomScale;
}

- (void)setMaxZoomScale:(double)a3
{
  self->_maxZoomScale = a3;
}

- (BOOL)resizeViewsWhenZoomed
{
  return self->_resizeViewsWhenZoomed;
}

- (void)setResizeViewsWhenZoomed:(BOOL)a3
{
  self->_resizeViewsWhenZoomed = a3;
}

- (double)maxResizeScale
{
  return self->_maxResizeScale;
}

- (void)setMaxResizeScale:(double)a3
{
  self->_maxResizeScale = a3;
}

- (BKImageResizerDelegate)imageResizerDelegate
{
  return (BKImageResizerDelegate *)objc_loadWeakRetained((id *)&self->_imageResizerDelegate);
}

- (void)setImageResizerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_imageResizerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_imageResizerDelegate);
  objc_destroyWeak((id *)&self->_thumbnailingDelegate);
  objc_storeStrong((id *)&self->_doubleTapRecognizer, 0);
  objc_storeStrong((id *)&self->_pageChangeTapRecognizer, 0);
  objc_storeStrong((id *)&self->_controlsTapRecognizer, 0);
  objc_storeStrong((id *)&self->_pageScroller, 0);
}

@end
