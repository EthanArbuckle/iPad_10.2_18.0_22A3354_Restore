@implementation BKPictureBookNavigationController

- (BKPictureBookNavigationController)init
{
  BKPictureBookNavigationController *v2;
  BKPictureBookNavigationController *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKPictureBookNavigationController;
  v2 = -[BKPageNavigationViewController init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->_contentSize = (CGSize)vdupq_n_s64(0x4059000000000000uLL);
    *(_QWORD *)&v2->_canFitToWidth = 0x7FFFFFFFFFFFFFFFLL;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    HIBYTE(v3->_lastCompletedTransition) = objc_msgSend(v4, "BOOLForKey:", CFSTR("BKUseLegacyCurlAnimation"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, "onAppWillEnterForeground:", UIApplicationWillEnterForegroundNotification, 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v7 = -[BKPictureBookNavigationController registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v6, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BKPictureBookNavigationController releaseViews](self, "releaseViews");
  -[BKPageSlide teardown](self->_pageSlideAnimation, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)BKPictureBookNavigationController;
  -[BKViewController dealloc](&v3, "dealloc");
}

- (void)releaseViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIApplicationWillEnterForegroundNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, BKContentReadyNotification, self->_rightContentViewController);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, BKContentFAILNotification, self->_rightContentViewController);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, BKContentReadyNotification, self->_pendingLoads);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "removeObserver:name:object:", self, BKContentFAILNotification, self->_pendingLoads);

  -[UITapGestureRecognizer setDelegate:](self->_pageChangeTapRecognizer, "setDelegate:", 0);
  -[UITapGestureRecognizer removeTarget:action:](self->_pageChangeTapRecognizer, "removeTarget:action:", 0, 0);
  -[UITapGestureRecognizer setDelegate:](self->_controlsTapRecognizer, "setDelegate:", 0);
  -[UITapGestureRecognizer removeTarget:action:](self->_controlsTapRecognizer, "removeTarget:action:", 0, 0);
  -[UITapGestureRecognizer setDelegate:](self->_doubleTapGestureRecognizer, "setDelegate:", 0);
  -[UITapGestureRecognizer removeTarget:action:](self->_doubleTapGestureRecognizer, "removeTarget:action:", 0, 0);
  -[UISwipeGestureRecognizer setDelegate:](self->_leftSwipeGestureRecognizer, "setDelegate:", 0);
  -[UISwipeGestureRecognizer removeTarget:action:](self->_leftSwipeGestureRecognizer, "removeTarget:action:", 0, 0);
  -[UISwipeGestureRecognizer setDelegate:](self->_rightSwipeGestureRecognizer, "setDelegate:", 0);
  -[UISwipeGestureRecognizer removeTarget:action:](self->_rightSwipeGestureRecognizer, "removeTarget:action:", 0, 0);
  -[BKLongPressGestureRecognizer setDelegate:](self->_manualCurlGestureRecognizer, "setDelegate:", 0);
  -[BKLongPressGestureRecognizer removeTarget:action:](self->_manualCurlGestureRecognizer, "removeTarget:action:", 0, 0);
  -[UIPanGestureRecognizer setDelegate:](self->_panManualCurlGestureRecognizer, "setDelegate:", 0);
  -[UIPanGestureRecognizer removeTarget:action:](self->_panManualCurlGestureRecognizer, "removeTarget:action:", 0, 0);
  -[BKPictureBookScrollView setDelegate:](self->_scrollView, "setDelegate:", 0);
  -[BKPictureBookCurlState setDelegate:](self->_curlState, "setDelegate:", 0);
  v8.receiver = self;
  v8.super_class = (Class)BKPictureBookNavigationController;
  -[BKViewController releaseViews](&v8, "releaseViews");
}

- (void)viewDidLoad
{
  void *v3;
  BKPictureBookScrollView *v4;
  BKPictureBookScrollView *scrollView;
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *doubleTapGestureRecognizer;
  UITapGestureRecognizer *v8;
  UITapGestureRecognizer *pageChangeTapRecognizer;
  UITapGestureRecognizer *v10;
  UITapGestureRecognizer *controlsTapRecognizer;
  BKLongPressGestureRecognizer *v12;
  BKLongPressGestureRecognizer *manualCurlGestureRecognizer;
  UISwipeGestureRecognizer *v14;
  UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
  UISwipeGestureRecognizer *v16;
  UISwipeGestureRecognizer *rightSwipeGestureRecognizer;
  BKPictureBookView *v18;
  BKPictureBookView *bookView;
  id v20;
  id v21;
  id v22;
  void *needsTurnToPageNumber;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)BKPictureBookNavigationController;
  -[BKPictureBookNavigationController viewDidLoad](&v24, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController view](self, "view"));
  objc_msgSend(v3, "setOpaque:", 0);
  v4 = (BKPictureBookScrollView *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController _createZoomingScrollView](self, "_createZoomingScrollView"));
  scrollView = self->_scrollView;
  self->_scrollView = v4;

  IMActionSafeRectForRect(objc_msgSend(v3, "bounds"));
  -[BKPictureBookScrollView setFrame:](self->_scrollView, "setFrame:");
  objc_msgSend(v3, "addSubview:", self->_scrollView);
  v6 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleDoubleTap:");
  doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
  self->_doubleTapGestureRecognizer = v6;

  -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_doubleTapGestureRecognizer, "setNumberOfTapsRequired:", 2);
  -[UITapGestureRecognizer setDelegate:](self->_doubleTapGestureRecognizer, "setDelegate:", self);
  objc_msgSend(v3, "addGestureRecognizer:", self->_doubleTapGestureRecognizer);
  v8 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handlePageChangeTap:");
  pageChangeTapRecognizer = self->_pageChangeTapRecognizer;
  self->_pageChangeTapRecognizer = v8;

  -[UITapGestureRecognizer setDelegate:](self->_pageChangeTapRecognizer, "setDelegate:", self);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_pageChangeTapRecognizer, "requireGestureRecognizerToFail:", self->_doubleTapGestureRecognizer);
  objc_msgSend(v3, "addGestureRecognizer:", self->_pageChangeTapRecognizer);
  v10 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "toggleControls:");
  controlsTapRecognizer = self->_controlsTapRecognizer;
  self->_controlsTapRecognizer = v10;

  -[UITapGestureRecognizer setDelegate:](self->_controlsTapRecognizer, "setDelegate:", self);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_controlsTapRecognizer, "requireGestureRecognizerToFail:", self->_pageChangeTapRecognizer);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_controlsTapRecognizer, "requireGestureRecognizerToFail:", self->_doubleTapGestureRecognizer);
  objc_msgSend(v3, "addGestureRecognizer:", self->_controlsTapRecognizer);
  v12 = -[BKLongPressGestureRecognizer initWithTarget:action:]([BKLongPressGestureRecognizer alloc], "initWithTarget:action:", self, "manualCurlGesture:");
  manualCurlGestureRecognizer = self->_manualCurlGestureRecognizer;
  self->_manualCurlGestureRecognizer = v12;

  -[BKLongPressGestureRecognizer setDelegate:](self->_manualCurlGestureRecognizer, "setDelegate:", self);
  -[BKLongPressGestureRecognizer setMinimumPressDuration:](self->_manualCurlGestureRecognizer, "setMinimumPressDuration:", 0.0500000007);
  -[BKLongPressGestureRecognizer setCancelsTouchesInView:](self->_manualCurlGestureRecognizer, "setCancelsTouchesInView:", 1);
  -[BKLongPressGestureRecognizer requireGestureRecognizerToFail:](self->_manualCurlGestureRecognizer, "requireGestureRecognizerToFail:", self->_pageChangeTapRecognizer);
  objc_msgSend(v3, "addGestureRecognizer:", self->_manualCurlGestureRecognizer);
  v14 = (UISwipeGestureRecognizer *)objc_msgSend(objc_alloc((Class)UISwipeGestureRecognizer), "initWithTarget:action:", self, "leftSwipe:");
  leftSwipeGestureRecognizer = self->_leftSwipeGestureRecognizer;
  self->_leftSwipeGestureRecognizer = v14;

  -[UISwipeGestureRecognizer setDelegate:](self->_leftSwipeGestureRecognizer, "setDelegate:", self);
  -[UISwipeGestureRecognizer setDirection:](self->_leftSwipeGestureRecognizer, "setDirection:", 2);
  -[UISwipeGestureRecognizer setCancelsTouchesInView:](self->_leftSwipeGestureRecognizer, "setCancelsTouchesInView:", 1);
  -[UISwipeGestureRecognizer requireGestureRecognizerToFail:](self->_leftSwipeGestureRecognizer, "requireGestureRecognizerToFail:", self->_manualCurlGestureRecognizer);
  -[UISwipeGestureRecognizer requireGestureRecognizerToFail:](self->_leftSwipeGestureRecognizer, "requireGestureRecognizerToFail:", self->_panManualCurlGestureRecognizer);
  objc_msgSend(v3, "addGestureRecognizer:", self->_leftSwipeGestureRecognizer);
  v16 = (UISwipeGestureRecognizer *)objc_msgSend(objc_alloc((Class)UISwipeGestureRecognizer), "initWithTarget:action:", self, "rightSwipe:");
  rightSwipeGestureRecognizer = self->_rightSwipeGestureRecognizer;
  self->_rightSwipeGestureRecognizer = v16;

  -[UISwipeGestureRecognizer setDelegate:](self->_rightSwipeGestureRecognizer, "setDelegate:", self);
  -[UISwipeGestureRecognizer setDirection:](self->_rightSwipeGestureRecognizer, "setDirection:", 1);
  -[UISwipeGestureRecognizer requireGestureRecognizerToFail:](self->_rightSwipeGestureRecognizer, "requireGestureRecognizerToFail:", self->_manualCurlGestureRecognizer);
  -[UISwipeGestureRecognizer requireGestureRecognizerToFail:](self->_rightSwipeGestureRecognizer, "requireGestureRecognizerToFail:", self->_panManualCurlGestureRecognizer);
  objc_msgSend(v3, "addGestureRecognizer:", self->_rightSwipeGestureRecognizer);
  v18 = objc_alloc_init(BKPictureBookView);
  bookView = self->_bookView;
  self->_bookView = v18;

  -[BKPictureBookNavigationController contentSize](self, "contentSize");
  -[BKPictureBookView setContentSize:](self->_bookView, "setContentSize:");
  -[BKPictureBookView setDrawsShadow:](self->_bookView, "setDrawsShadow:", 1);
  -[BKPictureBookView setDrawsSpine:](self->_bookView, "setDrawsSpine:", -[BKPictureBookNavigationController drawsSpine](self, "drawsSpine"));
  -[BKPictureBookView sizeToFit](self->_bookView, "sizeToFit");
  v20 = -[BKPictureBookNavigationController curlContainer](self, "curlContainer");
  v21 = -[BKPictureBookNavigationController singlePageCurlContainer](self, "singlePageCurlContainer");
  -[BKPictureBookScrollView addSubview:](self->_scrollView, "addSubview:", self->_bookView);
  if (!self->_needsTurnToPageNumber)
  {
    v22 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 2);
    needsTurnToPageNumber = (void *)self->_needsTurnToPageNumber;
    self->_needsTurnToPageNumber = (unint64_t)v22;

  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKPictureBookNavigationController;
  -[BKPictureBookNavigationController viewIsAppearing:](&v4, "viewIsAppearing:", a3);
  -[BKPictureBookNavigationController _setupView](self, "_setupView");
}

- (void)_setupView
{
  void *v3;
  BKPictureBookScrollView *scrollView;
  double v5;
  double v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController view](self, "view"));
  IMActionSafeRectForRect(objc_msgSend(v3, "bounds"));
  -[BKPictureBookScrollView setFrame:](self->_scrollView, "setFrame:");

  LOBYTE(self->_lastCompletedTransition) = -[BKPictureBookNavigationController singlePageAspectFits](self, "singlePageAspectFits");
  scrollView = self->_scrollView;
  -[BKPictureBookView bounds](self->_bookView, "bounds");
  -[BKZoomingScrollView configureForImageSize:](scrollView, "configureForImageSize:", v5, v6);
  -[BKPictureBookScrollView minimumZoomScale](self->_scrollView, "minimumZoomScale");
  -[BKPictureBookScrollView setZoomScale:](self->_scrollView, "setZoomScale:");
  v7 = -[BKPictureBookNavigationController openToSpread](self, "openToSpread");
  if (-[BKPictureBookNavigationController lastCompletedTransition](self, "lastCompletedTransition") == 1
    || v7 && (v7 != 0x7FFFFFFFFFFFFFFFLL || !isPortrait()))
  {
    -[BKPictureBookScrollView minimumZoomScale](self->_scrollView, "minimumZoomScale");
    -[BKPictureBookScrollView setZoomScale:](self->_scrollView, "setZoomScale:");
  }
  else
  {
    -[BKPictureBookNavigationController zoomToPage:animated:](self, "zoomToPage:animated:", (char *)-[BKPageNavigationViewController pageOffset](self, "pageOffset") + 1, 0);
  }
  -[BKPictureBookNavigationController _updateBookScale](self, "_updateBookScale");
  -[BKPictureBookNavigationController _displayPagesForOffset:](self, "_displayPagesForOffset:", -[BKPageNavigationViewController pageOffset](self, "pageOffset"));
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKPictureBookNavigationController;
  -[BKPictureBookNavigationController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[BKPictureBookCurlState killAllCurls](self->_curlState, "killAllCurls");
  -[BKPageCurlManager reset](self->_pageCurlManager, "reset");
  -[BKPictureBookNavigationController _resetSinglePageCurlContainer](self, "_resetSinglePageCurlContainer");
}

- (void)adjustToNewSize:(CGSize)a3
{
  -[BKPictureBookNavigationController _adjustToNewSize:withOptionalTransitionCoordinator:](self, "_adjustToNewSize:withOptionalTransitionCoordinator:", 0, a3.width, a3.height);
}

- (id)viewForLiveResize
{
  return self->_bookView;
}

- (void)_adjustToNewSize:(CGSize)a3 withOptionalTransitionCoordinator:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  CGFloat x;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD v11[4];
  _QWORD *v12;
  _QWORD v13[4];
  _QWORD *v14;
  _QWORD v15[5];
  _QWORD v16[7];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[BKPageCurlManager setHidden:](self->_pageCurlManager, "setHidden:", 1);
  -[BKPictureBookNavigationController _resetSinglePageCurlContainer](self, "_resetSinglePageCurlContainer");
  x = self->_manualCurlStartPosition.x;
  if (x != 0.0)
    objc_msgSend(*(id *)&x, "cancelManualCurl");
  if (self->_leftContentViewController)
    -[BKPictureBookNavigationController _killSpreadManualCurl](self, "_killSpreadManualCurl");
  else
    -[BKPageCurlManager reset](self->_pageCurlManager, "reset");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_640C;
  v16[3] = &unk_1BE998;
  v16[4] = self;
  *(CGFloat *)&v16[5] = width;
  *(CGFloat *)&v16[6] = height;
  v9 = objc_retainBlock(v16);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_67E0;
  v15[3] = &unk_1BE8C8;
  v15[4] = self;
  v10 = objc_retainBlock(v15);
  if (v7)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_67E8;
    v13[3] = &unk_1BE9C0;
    v14 = v9;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_67F4;
    v11[3] = &unk_1BE9C0;
    v12 = v10;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v13, v11);

  }
  else
  {
    ((void (*)(_QWORD *, _QWORD))v9[2])(v9, 0);
    ((void (*)(_QWORD *, _QWORD))v10[2])(v10, 0);
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  unsigned __int8 v9;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  if (-[BKPictureBookNavigationController isVisible](self, "isVisible"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
    v9 = objc_msgSend(v8, "inLiveResize");

    if ((v9 & 1) == 0)
      -[BKPictureBookNavigationController _adjustToNewSize:withOptionalTransitionCoordinator:](self, "_adjustToNewSize:withOptionalTransitionCoordinator:", v7, width, height);
  }
  v10.receiver = self;
  v10.super_class = (Class)BKPictureBookNavigationController;
  -[BKPictureBookNavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  LOBYTE(self->_lastCompletedTransition) = -[BKPictureBookNavigationController singlePageAspectFits](self, "singlePageAspectFits", a3, a4);
  if (!-[BKPictureBookNavigationController supportsSinglePageMode](self, "supportsSinglePageMode"))
    -[BKPictureBookNavigationController exitSinglePageMode](self, "exitSinglePageMode");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKPictureBookNavigationController;
  -[BKPictureBookNavigationController viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3, a4);
  if (a3)
    -[BKPictureBookNavigationController _setupView](self, "_setupView");
}

- (id)viewControllers
{
  void *rightContentViewController;
  NSMutableSet *pendingLoads;
  void *v4;

  rightContentViewController = self->_rightContentViewController;
  pendingLoads = self->_pendingLoads;
  if (!rightContentViewController)
  {
    if (!pendingLoads)
    {
      v4 = 0;
      return v4;
    }
    rightContentViewController = self->_pendingLoads;
    goto LABEL_6;
  }
  if (!pendingLoads)
  {
LABEL_6:
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", rightContentViewController));
    return v4;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", pendingLoads, 0));
  return v4;
}

- (IMPerformSelectorProxy)performSelectorProxy
{
  BKPageSlide *pageSlideAnimation;
  BKPageSlide *v4;
  BKPageSlide *v5;

  pageSlideAnimation = self->_pageSlideAnimation;
  if (!pageSlideAnimation)
  {
    v4 = (BKPageSlide *)objc_msgSend(objc_alloc((Class)IMPerformSelectorProxy), "initWithTarget:", self);
    v5 = self->_pageSlideAnimation;
    self->_pageSlideAnimation = v4;

    pageSlideAnimation = self->_pageSlideAnimation;
  }
  return (IMPerformSelectorProxy *)pageSlideAnimation;
}

- (id)_createZoomingScrollView
{
  BKPictureBookScrollView *v3;
  void *v4;

  v3 = -[BKZoomingScrollView initWithFrame:]([BKPictureBookScrollView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[BKPictureBookScrollView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
  -[BKPictureBookScrollView setShowsHorizontalScrollIndicator:](v3, "setShowsHorizontalScrollIndicator:", 0);
  -[BKPictureBookScrollView setShowsVerticalScrollIndicator:](v3, "setShowsVerticalScrollIndicator:", 0);
  -[BKPictureBookScrollView setDelegate:](v3, "setDelegate:", self);
  -[BKPictureBookScrollView setMinimumZoomScale:](v3, "setMinimumZoomScale:", 0.5);
  -[BKPictureBookScrollView setMaximumZoomScale:](v3, "setMaximumZoomScale:", 2.0);
  -[BKPictureBookScrollView setBouncesZoom:](v3, "setBouncesZoom:", 1);
  -[BKPictureBookScrollView setDecelerationRate:](v3, "setDecelerationRate:", UIScrollViewDecelerationRateFast);
  -[BKPictureBookScrollView setBounces:](v3, "setBounces:", 0);
  -[BKPictureBookScrollView setAlwaysBounceVertical:](v3, "setAlwaysBounceVertical:", 0);
  -[BKPictureBookScrollView setAlwaysBounceHorizontal:](v3, "setAlwaysBounceHorizontal:", 0);
  -[BKPictureBookScrollView setDirectionalLockEnabled:](v3, "setDirectionalLockEnabled:", 0);
  -[BKPictureBookScrollView setOpaque:](v3, "setOpaque:", 0);
  -[BKPictureBookScrollView setContentInsetAdjustmentBehavior:](v3, "setContentInsetAdjustmentBehavior:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[BKPictureBookScrollView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  return v3;
}

- (id)viewForPageNumber:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentViewControllerForPageNumber:", a3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  return v6;
}

- (void)_applyAdditionalScale:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  CGAffineTransform *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform buf;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "loader"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "webView"));
    objc_msgSend(v7, "be_scale");
    v9 = v8;

    if (v9 >= BEWebViewMinimumZoomScale
      || (v10 = *(double *)self[1].super.super.IMViewController_opaque, v9 >= v10)
      || v10 <= 0.0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
      v15 = v14;
      v17 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v18 = *(_OWORD *)&CGAffineTransformIdentity.a;
      v19 = v17;
      v20 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      v16 = (CGAffineTransform *)&v18;
    }
    else
    {
      v11 = v9 / v10;
      v12 = _AEWKPictureBookLog();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf.a) = 134218240;
        *(double *)((char *)&buf.a + 4) = v11;
        WORD2(buf.b) = 2048;
        *(_QWORD *)((char *)&buf.b + 6) = objc_msgSend(v5, "ordinal");
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "{WebViewLifeCycle} applying additional scale:%f for ordinal:%lu", (uint8_t *)&buf, 0x16u);
      }

      memset(&buf, 0, sizeof(buf));
      CGAffineTransformMakeScale(&buf, v11, v11);
      v22 = buf;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
      v15 = v14;
      v21 = v22;
      v16 = &v21;
    }
    objc_msgSend(v14, "setTransform:", v16, v18, v19, v20, *(_OWORD *)&v21.a, *(_OWORD *)&v21.c, *(_OWORD *)&v21.tx);

  }
}

- (void)_displayPagesForOffset:(int64_t)a3
{
  unsigned int v5;
  int64_t v6;
  void *v7;
  BKContentViewController *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  NSMutableSet *v16;
  NSMutableSet *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  BKContentViewController *obj;

  v5 = -[BKPictureBookNavigationController isViewLoaded](self, "isViewLoaded");
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && v5)
  {
    v6 = -[BKPageNavigationViewController leftPageNumberForSinglePageOffset:](self, "leftPageNumberForSinglePageOffset:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
    obj = (BKContentViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentViewControllerForPageNumber:", v6));

    v8 = self->_rightContentViewController;
    if (obj != v8)
    {
      -[BKPictureBookNavigationController addPendingContent:](self, "addPendingContent:", obj);
      -[BKPictureBookNavigationController removePendingContent:](self, "removePendingContent:", v8);
      -[BKPictureBookView setLeftContentView:](self->_bookView, "setLeftContentView:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](obj, "view"));
      -[BKPictureBookView setLeftContentView:](self->_bookView, "setLeftContentView:", v9);

      objc_storeStrong((id *)&self->_rightContentViewController, obj);
      v10 = objc_opt_class(BKPictureBookContentViewController);
      v11 = BUDynamicCast(v10, self->_rightContentViewController);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      -[BKPictureBookNavigationController _applyAdditionalScale:](self, "_applyAdditionalScale:", v12);
      if (-[BKContentViewController isViewLoaded](v8, "isViewLoaded"))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
        objc_msgSend(v13, "pageNavigationDidRemoveContentViewController:", v8);

      }
    }
    v14 = -[BKPageNavigationViewController rightPageNumberForSinglePageOffset:](self, "rightPageNumberForSinglePageOffset:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
    v16 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentViewControllerForPageNumber:", v14));

    v17 = self->_pendingLoads;
    if (v16 != v17)
    {
      -[BKPictureBookNavigationController addPendingContent:](self, "addPendingContent:", v16);
      -[BKPictureBookNavigationController removePendingContent:](self, "removePendingContent:", v17);
      -[BKPictureBookView setRightContentView:](self->_bookView, "setRightContentView:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet view](v16, "view"));
      -[BKPictureBookView setRightContentView:](self->_bookView, "setRightContentView:", v18);

      objc_storeStrong((id *)&self->_pendingLoads, v16);
      v19 = objc_opt_class(BKPictureBookContentViewController);
      v20 = BUDynamicCast(v19, self->_pendingLoads);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      -[BKPictureBookNavigationController _applyAdditionalScale:](self, "_applyAdditionalScale:", v21);
      if (-[NSMutableSet isViewLoaded](v17, "isViewLoaded"))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
        objc_msgSend(v22, "pageNavigationDidRemoveContentViewController:", v17);

      }
    }
    -[BKPictureBookNavigationController updateVisibleContentViewControllerForOffset:](self, "updateVisibleContentViewControllerForOffset:", a3);
    -[BKPictureBookNavigationController updateUpsellZoomScale](self, "updateUpsellZoomScale");

  }
}

- (id)_singlePageVisibleContentViewControllerForPageOffset:(int64_t)a3
{
  char *v5;
  int64_t v6;
  id *p_rightContentViewController;
  id v8;

  if (-[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode")
    && ((v5 = (char *)-[BKPageNavigationViewController leftPageNumberForSinglePageOffset:](self, "leftPageNumberForSinglePageOffset:", a3)- 1, v6 = -[BKPageNavigationViewController rightPageNumberForSinglePageOffset:](self, "rightPageNumberForSinglePageOffset:", a3), v5 == (char *)a3)&& (p_rightContentViewController = (id *)&self->_rightContentViewController, -[BKContentViewController isContentLoaded](self->_rightContentViewController, "isContentLoaded"))|| v6 - 1 == a3&& (p_rightContentViewController = (id *)&self->_pendingLoads, -[NSMutableSet isContentLoaded](self->_pendingLoads, "isContentLoaded"))))
  {
    v8 = *p_rightContentViewController;
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)updateVisibleContentViewControllerForOffset:(int64_t)a3
{
  void *v5;
  id v6;

  if (-[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode"))
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController _singlePageVisibleContentViewControllerForPageOffset:](self, "_singlePageVisibleContentViewControllerForPageOffset:", a3));
    if (v6)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
      objc_msgSend(v5, "pageNavigationContentViewWillAppear:", v6);

    }
  }
}

- (id)contentView
{
  return self->_bookView;
}

- (void)contentViewImage:(BOOL)a3 completion:(id)a4
{
  -[BKPictureBookNavigationController contentViewImage:afterScreenUpdates:completion:](self, "contentViewImage:afterScreenUpdates:completion:", a3, 1, a4);
}

- (void)contentViewImage:(BOOL)a3 afterScreenUpdates:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void (**v7)(id, void *);
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
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  UIImage *ImageFromCurrentImageContext;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  BKPictureBookView *v30;
  int64_t v31;
  BKPictureBookView *v32;
  _QWORD v33[4];
  BKPictureBookView *v34;
  BKPictureBookNavigationController *v35;
  void (**v36)(id, void *);
  id v37;
  id location;
  CGSize v39;

  v5 = a3;
  v7 = (void (**)(id, void *))a5;
  if (v5)
    v5 = -[BKPictureBookNavigationController drawsSpine](self, "drawsSpine");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookView window](self->_bookView, "window"));

  if (v8)
  {
    -[BKPictureBookScrollView bounds](self->_scrollView, "bounds");
    v10 = v9;
    -[BKPictureBookView bounds](self->_bookView, "bounds");
    v12 = v10 / v11;
    -[BKPictureBookView bounds](self->_bookView, "bounds");
    v14 = v12 * v13;
    -[BKPictureBookScrollView bounds](self->_scrollView, "bounds");
    if (v14 > v15)
    {
      -[BKPictureBookScrollView bounds](self->_scrollView, "bounds");
      v17 = v16;
      -[BKPictureBookView bounds](self->_bookView, "bounds");
      v12 = v17 / v18;
    }
    -[BKPictureBookScrollView contentSize](self->_scrollView, "contentSize");
    v20 = v12 * v19;
    -[BKPictureBookScrollView contentSize](self->_scrollView, "contentSize");
    v22 = v12 * v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookView im_snapshotInContext](self->_bookView, "im_snapshotInContext"));
    v39.width = v20;
    v39.height = v22;
    UIGraphicsBeginImageContextWithOptions(v39, 0, 0.0);
    objc_msgSend(v23, "drawInRect:", 0.0, 0.0, v20, v22);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v25 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);

    UIGraphicsEndImageContext();
    v7[2](v7, v25);

  }
  else
  {
    -[BKPictureBookNavigationController contentSize](self, "contentSize");
    +[BKPictureBookView actualSizeForContentSize:drawsSpine:](BKPictureBookView, "actualSizeForContentSize:drawsSpine:", v5);
    v27 = v26;
    v29 = v28;
    v30 = objc_alloc_init(BKPictureBookView);
    -[BKPictureBookNavigationController contentSize](self, "contentSize");
    -[BKPictureBookView setContentSize:](v30, "setContentSize:");
    -[BKPictureBookView setFrame:](v30, "setFrame:", 0.0, 0.0, v27, v29);
    -[BKPictureBookView setOpaque:](v30, "setOpaque:", 0);
    -[BKPictureBookView setScale:](v30, "setScale:", 1.0);
    -[BKPictureBookView setDrawsSpine:](v30, "setDrawsSpine:", v5);
    objc_initWeak(&location, self);
    v31 = -[BKPageNavigationViewController pageOffset](self, "pageOffset");
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_73A0;
    v33[3] = &unk_1BEA10;
    objc_copyWeak(&v37, &location);
    v32 = v30;
    v34 = v32;
    v35 = self;
    v36 = v7;
    -[BKPictureBookNavigationController _generateLeftPageImageAtPageOffset:completion:](self, "_generateLeftPageImageAtPageOffset:completion:", v31, v33);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);

  }
}

- (void)_generateLeftPageImageAtPageOffset:(int64_t)a3 completion:(id)a4
{
  id v6;
  int64_t v7;
  id v8;

  v6 = a4;
  v7 = -[BKPageNavigationViewController leftPageNumberForSinglePageOffset:](self, "leftPageNumberForSinglePageOffset:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
  objc_msgSend(v8, "pageNavigationSnapshotForPageNumber:completion:", v7, v6);

}

- (void)_generateRightPageImageAtPageOffset:(int64_t)a3 completion:(id)a4
{
  id v6;
  int64_t v7;
  id v8;

  v6 = a4;
  v7 = -[BKPageNavigationViewController rightPageNumberForSinglePageOffset:](self, "rightPageNumberForSinglePageOffset:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
  objc_msgSend(v8, "pageNavigationSnapshotForPageNumber:completion:", v7, v6);

}

- (void)setPageOffset:(int64_t)a3
{
  void *v5;
  objc_super v6;

  if (self->super._pageOffset != a3
    || !-[BKPictureBookNavigationController hasTurnedToInitialPage](self, "hasTurnedToInitialPage"))
  {
    v6.receiver = self;
    v6.super_class = (Class)BKPictureBookNavigationController;
    -[BKPageNavigationViewController setPageOffset:](&v6, "setPageOffset:", a3);
    if (-[BKPictureBookNavigationController isViewLoaded](self, "isViewLoaded"))
    {
      -[BKPictureBookNavigationController _displayPagesForOffset:](self, "_displayPagesForOffset:", a3);
      -[BKPictureBookNavigationController setHasTurnedToInitialPage:](self, "setHasTurnedToInitialPage:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
      objc_msgSend(v5, "pageNavigationDidChangeLocation:", self);

    }
  }
}

- (_NSRange)visiblePages
{
  unsigned int v3;
  int64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  v3 = -[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode");
  v4 = -[BKPageNavigationViewController pageOffset](self, "pageOffset");
  if (v3)
  {
    v5 = v4 + 1;
    v6 = 1;
  }
  else
  {
    v7 = -[BKPageNavigationViewController leftPageNumberForSpreadPageOffset:](self, "leftPageNumberForSpreadPageOffset:", v4);
    v8 = -[BKPageNavigationViewController rightPageNumberForSpreadPageOffset:](self, "rightPageNumberForSpreadPageOffset:", -[BKPageNavigationViewController pageOffset](self, "pageOffset"));
    v9 = -[BKViewController layoutDirection](self, "layoutDirection");
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      v10 = v7;
    else
      v10 = v8;
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      v11 = v8;
    else
      v11 = v7;
    if (v7 == 0x7FFFFFFFFFFFFFFFLL || v8 == 0x7FFFFFFFFFFFFFFFLL)
      v6 = 1;
    else
      v6 = 2;
    if (v9 == 1)
      v5 = v10;
    else
      v5 = v11;
  }
  result.length = v6;
  result.location = v5;
  return result;
}

- (void)slide:(BOOL)a3 animated:(BOOL)a4 withDelay:(double)a5
{
  _BOOL4 v6;
  _BOOL4 v7;
  double v9;
  double v10;
  BKPictureBookScrollView *scrollView;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  _BOOL8 v26;
  _BOOL8 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  dispatch_time_t v47;
  _QWORD v48[5];
  _QWORD v49[7];
  _QWORD block[5];
  CGRect v51;
  CGRect v52;

  v6 = a4;
  v7 = a3;
  -[BKPictureBookScrollView contentOffset](self->_scrollView, "contentOffset");
  v10 = v9;
  scrollView = self->_scrollView;
  if (v7)
  {
    -[BKPictureBookScrollView contentInset](scrollView, "contentInset");
    v13 = -v12;
  }
  else
  {
    -[BKPictureBookScrollView contentSize](scrollView, "contentSize");
    v15 = v14;
    -[BKPictureBookScrollView bounds](self->_scrollView, "bounds");
    v16 = v15 - CGRectGetWidth(v51);
    -[BKPictureBookScrollView contentInset](self->_scrollView, "contentInset");
    v13 = v16 + v17;
  }
  -[BKPictureBookScrollView contentOffset](self->_scrollView, "contentOffset");
  v20 = v13 == v19 && v10 == v18;
  if (!v20)
  {
    if (v6)
    {
      -[BKPictureBookNavigationController contentSize](self, "contentSize");
      v22 = v21;
      v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController thumbnailBookViewConfiguration](self, "thumbnailBookViewConfiguration"));
      v26 = -[BKPictureBookNavigationController drawsSpine](self, "drawsSpine");
      v27 = -[BKPictureBookNavigationController supportsSinglePageMode](self, "supportsSinglePageMode");
      -[BKPictureBookNavigationController _containerBoundsForGeometry](self, "_containerBoundsForGeometry");
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:", v25, v26, v27, v22, v24, v28, v29, v30, v31));

      -[BKPictureBookScrollView contentSize](self->_scrollView, "contentSize");
      v34 = v33;
      -[BKPictureBookScrollView bounds](self->_scrollView, "bounds");
      v35 = vabdd_f64(v34, CGRectGetWidth(v52));
      objc_msgSend(v32, "sizeForSpread:landscape:", 0, isPortrait() ^ 1);
      v37 = v36;
      v39 = v38;
      objc_msgSend(v32, "maximumSize");
      v41 = v40;
      v43 = v42;
      -[BKPictureBookScrollView bounds](self->_scrollView, "bounds");
      v20 = v37 == v41;
      v45 = v35 / v44;
      if (v20 && v39 == v43)
      {
        -[BKPictureBookNavigationController pageCurlManager:durationForCurl:](self, "pageCurlManager:durationForCurl:", self->_curlState, 0);
        v45 = v46;
      }
      v47 = dispatch_time(0, 200000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_79E8;
      block[3] = &unk_1BEA38;
      block[4] = self;
      dispatch_after(v47, (dispatch_queue_t)&_dispatch_main_q, block);
      v48[4] = self;
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_79FC;
      v49[3] = &unk_1BEA60;
      v49[4] = self;
      *(double *)&v49[5] = v13;
      *(double *)&v49[6] = v10;
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_7A38;
      v48[3] = &unk_1BEA88;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v49, v48, v45, a5);

    }
    else
    {
      -[BKPictureBookScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v13, v10);
    }
  }
}

- (void)_insertDestinationSnapshotImageUnderCurrentPageCurl:(int64_t)a3
{
  BKPageBookCurlView *v5;
  void *v6;
  void *v7;
  void *v8;
  BKPageBookCurlView *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BKPageBookCurlView *v16;
  _QWORD v17[4];
  BKPageBookCurlView *v18;
  id v19;
  id buf;
  _QWORD v21[4];
  BKPageBookCurlView *v22;

  v5 = -[BKPageBookCurlView initWithImage:borderColor:isLeft:]([BKPageBookCurlView alloc], "initWithImage:borderColor:isLeft:", 0, 0, 0);
  -[BKPageCurl frame](self->_manualCurl, "frame");
  -[BKPageBookCurlView setFrame:](v5, "setFrame:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController theme](self, "theme"));
  -[BKPageBookCurlView setUseInvertedColors:](v5, "setUseInvertedColors:", objc_msgSend(v6, "shouldInvertContent"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl superview](self->_manualCurl, "superview"));
  objc_msgSend(v7, "insertSubview:belowSubview:", v5, self->_manualCurl);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_7CE4;
  v21[3] = &unk_1BEAB0;
  v9 = v5;
  v22 = v9;
  objc_msgSend(v8, "pageNavigationSnapshotForPageNumber:completion:", a3 + 1, v21);

  if (*(_QWORD *)&self->_desiredScale)
  {
    v10 = _AEWKPictureBookLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "We only track one lastCurlUnderPageView. removing previous", (uint8_t *)&buf, 2u);
    }

    BUAssertionFailed();
    objc_msgSend(*(id *)&self->_desiredScale, "removeFromSuperview");
  }
  objc_storeStrong((id *)&self->_desiredScale, v5);
  -[BKPictureBookNavigationController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_timeOutWaitingForPaint", 0, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController _singlePageVisibleContentViewControllerForPageOffset:](self, "_singlePageVisibleContentViewControllerForPageOffset:", a3));
  objc_initWeak(&buf, self);
  v13 = objc_opt_class(BKHTMLContentViewController);
  v14 = BUDynamicCast(v13, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_7CF0;
  v17[3] = &unk_1BEAD8;
  objc_copyWeak(&v19, &buf);
  v16 = v9;
  v18 = v16;
  objc_msgSend(v15, "afterEnsuringFirstPaintPerform:", v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&buf);

}

- (void)turnToPageNumber:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  BOOL v15;
  unsigned int v16;
  int64_t v17;
  CGFloat x;
  int64_t v19;
  int64_t v20;
  char v21;
  double v22;
  uint64_t v23;
  int64_t v24;
  char v25;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = a4;
    if ((char *)-[BKPageNavigationViewController pageOffset](self, "pageOffset") + 1 != (id)a3)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
      objc_msgSend(v7, "postEvent:sender:", kBETestDriverPageTurnStart, self);

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
      objc_msgSend(v8, "postEvent:sender:", kBETestDriverPageTurnSetupStart, self);

      self->_cancelControlTapForPageTurn = 1;
      self->_cancelPageChangeForPageTurn = 1;
      v9 = -[BKPictureBookNavigationController isVisible](self, "isVisible") & v4;
      if ((_DWORD)v9 == 1 && -[BKPictureBookNavigationController _isFreeScale](self, "_isFreeScale"))
      {
        *(_QWORD *)&self->_curlPageForReadAloud = a3;
        -[BKPictureBookNavigationController zoomToPage:animated:](self, "zoomToPage:animated:", (char *)-[BKPageNavigationViewController pageOffset](self, "pageOffset") + 1, 1);
      }
      else
      {
        v10 = -[BKPageNavigationViewController pageCount](self, "pageCount");
        if (v10 >= a3)
          v11 = a3;
        else
          v11 = v10;
        if (v11 <= 1)
          v12 = 1;
        else
          v12 = v11;
        v13 = v12 - 1;
        v14 = -[BKViewController layoutDirection](self, "layoutDirection");
        if (v14 == 1)
          v15 = v12;
        else
          v15 = (v12 & 1) == 0;
        v16 = -[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode");
        v17 = -[BKPageNavigationViewController pageOffset](self, "pageOffset");
        if (v16)
        {
          if (!LOBYTE(self->_swipeSelector)
            || (x = self->_manualCurlStartPosition.x, x == 0.0)
            || v13 > v17 == objc_msgSend(*(id *)&x, "forwardCurl"))
          {
            -[BKPictureBookNavigationController slide:animated:withDelay:](self, "slide:animated:withDelay:", v15, 0, 0.0);
            v24 = -[BKPageNavigationViewController pageOffset](self, "pageOffset");
            v25 = v9 ^ 1;
            if (v13 == v24)
              v25 = 1;
            if ((v25 & 1) == 0)
              -[BKPictureBookNavigationController _autoCurlToSinglePageOffset:forwardCurl:](self, "_autoCurlToSinglePageOffset:forwardCurl:", v13, v13 > v17);
            -[BKPictureBookNavigationController setPageOffset:](self, "setPageOffset:", v13);
            if (HIBYTE(self->_lastCompletedTransition))
              -[BKPictureBookNavigationController _insertDestinationSnapshotImageUnderCurrentPageCurl:](self, "_insertDestinationSnapshotImageUnderCurrentPageCurl:", v13);
          }
          else
          {
            objc_msgSend(*(id *)&self->_manualCurlStartPosition.x, "cancelManualCurl");
            self->_curlPageForReadAloudSelector = "turnToPreviousPage";
            LOBYTE(self->_swipeSelector) = 0;
          }
        }
        else
        {
          v19 = -[BKPageNavigationViewController leftPageNumberForSpreadPageOffset:](self, "leftPageNumberForSpreadPageOffset:", v17);
          v20 = -[BKPageNavigationViewController leftPageNumberForSpreadPageOffset:](self, "leftPageNumberForSpreadPageOffset:", v13);
          v21 = v9 ^ 1;
          v22 = 0.0;
          if (v19 == v20)
            v21 = 1;
          if ((v21 & 1) == 0)
          {
            v23 = (v14 == 1) ^ (v13 > -[BKPageNavigationViewController pageOffset](self, "pageOffset", 0.0));
            if (HIBYTE(self->_lastCompletedTransition))
              -[BKPictureBookNavigationController _autoCurlToSpreadPageOffset:forwardCurl:](self, "_autoCurlToSpreadPageOffset:forwardCurl:", v13, v23);
            else
              -[BKPictureBookNavigationController _autoSlideToSpreadPageOffset:forwardCurl:](self, "_autoSlideToSpreadPageOffset:forwardCurl:", v13, v23);
            v22 = 0.2;
          }
          -[BKPictureBookNavigationController slide:animated:withDelay:](self, "slide:animated:withDelay:", v15, v9, v22);
          -[BKPictureBookNavigationController setPageOffset:](self, "setPageOffset:", v13);
        }
      }
    }
  }
}

- (void)_autoSlideToSpreadPageOffset:(int64_t)a3 forwardCurl:(BOOL)a4
{
  _BOOL8 v4;
  int64_t v7;
  int64_t v8;
  _BOOL8 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  _BOOL8 v15;
  _BOOL8 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  _QWORD *p_pageCurlManager;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  int64_t v30;
  BKPageSlide *v31;
  void *v32;
  void *v33;
  int64_t v34;
  int64_t v35;
  BKPictureBookCurlState *v36;

  v4 = a4;
  v35 = -[BKPageNavigationViewController leftPageNumberForSpreadPageOffset:](self, "leftPageNumberForSpreadPageOffset:", -[BKPageNavigationViewController pageOffset](self, "pageOffset"));
  v34 = -[BKPageNavigationViewController rightPageNumberForSpreadPageOffset:](self, "rightPageNumberForSpreadPageOffset:", -[BKPageNavigationViewController pageOffset](self, "pageOffset"));
  v7 = -[BKPageNavigationViewController leftPageNumberForSpreadPageOffset:](self, "leftPageNumberForSpreadPageOffset:", a3);
  v8 = -[BKPageNavigationViewController rightPageNumberForSpreadPageOffset:](self, "rightPageNumberForSpreadPageOffset:", a3);
  v36 = objc_opt_new(BKPictureBookCurlState);
  v9 = -[BKPictureBookNavigationController isZoomedToSpread](self, "isZoomedToSpread");
  -[BKPictureBookNavigationController contentSize](self, "contentSize");
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController thumbnailBookViewConfiguration](self, "thumbnailBookViewConfiguration"));
  v15 = -[BKPictureBookNavigationController drawsSpine](self, "drawsSpine");
  v16 = -[BKPictureBookNavigationController supportsSinglePageMode](self, "supportsSinglePageMode");
  -[BKPictureBookNavigationController _containerBoundsForGeometry](self, "_containerBoundsForGeometry");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:", v14, v15, v16, v11, v13, v17, v18, v19, v20));

  objc_msgSend(v21, "scaleForSpread:landscape:", v9, isPortrait() ^ 1);
  if (v22 >= BEWebViewMinimumZoomScale)
    v23 = v22;
  else
    v23 = BEWebViewMinimumZoomScale;
  p_pageCurlManager = &self->_pageCurlManager;
  -[BKPageCurlManager setScale:](self->_pageCurlManager, "setScale:", v23);
  if (BYTE2(self->_lastCompletedTransition))
    -[BKPictureBookNavigationController _resetSinglePageCurlContainerFrame](self, "_resetSinglePageCurlContainerFrame");
  else
    -[BKPictureBookNavigationController _resetCurlContainerFrame](self, "_resetCurlContainerFrame");
  -[BKPictureBookCurlState setScale:](v36, "setScale:", v23);
  -[BKPictureBookCurlState setCurlContainer:](v36, "setCurlContainer:", *p_pageCurlManager);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
  -[BKPictureBookCurlState setNavDelegate:](v36, "setNavDelegate:", v25);

  -[BKPictureBookCurlState setForwardCurl:](v36, "setForwardCurl:", v4);
  -[BKPictureBookCurlState setAutoCurl:](v36, "setAutoCurl:", 1);
  -[BKPictureBookCurlState setApplyMaskAndGutter:](v36, "setApplyMaskAndGutter:", -[BKPictureBookNavigationController drawsSpine](self, "drawsSpine"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageCurlManager](self, "pageCurlManager"));
  v27 = objc_msgSend(v26, "numberOfQueuedCurls");

  if (!v27)
  {
    if (-[BKContentViewController isContentLoaded](self->_rightContentViewController, "isContentLoaded"))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self->_rightContentViewController, "view"));
      -[BKPictureBookCurlState setLeftSourceView:](v36, "setLeftSourceView:", v28);

    }
    if (-[NSMutableSet isContentLoaded](self->_pendingLoads, "isContentLoaded"))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet view](self->_pendingLoads, "view"));
      -[BKPictureBookCurlState setRightSourceView:](v36, "setRightSourceView:", v29);

    }
    -[BKPictureBookView setLeftContentView:](self->_bookView, "setLeftContentView:", 0);
    -[BKPictureBookView setRightContentView:](self->_bookView, "setRightContentView:", 0);
  }
  v30 = -[BKViewController layoutDirection](self, "layoutDirection");
  -[BKPictureBookCurlState generateWithOldLeftPageNumber:oldRightPageNumber:newLeftPageNumber:newRightPageNumber:useMirrorForBackImage:](v36, "generateWithOldLeftPageNumber:oldRightPageNumber:newLeftPageNumber:newRightPageNumber:useMirrorForBackImage:", v35, v34, v7, v8, 0);
  v31 = objc_alloc_init(BKPageSlide);
  -[BKPageAnimation setPageAnimationDelegate:](v31, "setPageAnimationDelegate:", self);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlState pageArray](v36, "pageArray"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlState backPageArray](v36, "backPageArray"));
  if (BYTE2(self->_lastCompletedTransition))
    p_pageCurlManager = &self->_manualCurl;
  -[BKPageSlide autoSlideFromPages:toPages:inContainer:isForwardAnimation:isRTL:isZoomedToSpread:completion:](v31, "autoSlideFromPages:toPages:inContainer:isForwardAnimation:isRTL:isZoomedToSpread:completion:", v32, v33, *p_pageCurlManager, v4, v30 == 1, v9, 0);

}

- (void)turnToNextPage
{
  uint64_t v3;

  if (-[BKPictureBookNavigationController isZoomedToSpread](self, "isZoomedToSpread"))
    v3 = 2;
  else
    v3 = 1;
  -[BKPageNavigationViewController turnToNextPageWithDelta:](self, "turnToNextPageWithDelta:", v3);
}

- (void)turnToPreviousPage
{
  uint64_t v3;

  if (-[BKPictureBookNavigationController isZoomedToSpread](self, "isZoomedToSpread"))
    v3 = 2;
  else
    v3 = 1;
  -[BKPageNavigationViewController turnToPreviousPageWithDelta:](self, "turnToPreviousPageWithDelta:", v3);
}

- (void)transitionDidFinish:(BOOL)a3
{
  if (a3)
    -[BKPictureBookNavigationController setLastCompletedTransition:](self, "setLastCompletedTransition:", 1);
  else
    -[BKPictureBookNavigationController setLastCompletedTransition:](self, "setLastCompletedTransition:", 2);
}

- (void)setContentSize:(CGSize)a3
{
  if (a3.width != self->_contentSize.width || a3.height != self->_contentSize.height)
  {
    self->_contentSize.width = fmax(a3.width, 100.0);
    self->_contentSize.height = fmax(a3.height, 100.0);
    -[BKPictureBookView setContentSize:](self->_bookView, "setContentSize:");
  }
}

- (BOOL)isContentRenderComplete
{
  return objc_msgSend((id)self->_needsTurnToPageNumber, "count") == 0;
}

- (void)addPendingContent:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = v4;
    v6 = objc_msgSend(v4, "isLoading");
    v5 = v9;
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v7, "addObserver:selector:name:object:", self, "_contentIsReadyOrFailed:", BKContentReadyNotification, v9);
      objc_msgSend(v7, "addObserver:selector:name:object:", self, "_contentIsReadyOrFailed:", BKContentFAILNotification, v9);
      -[BKPictureBookNavigationController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isContentRenderComplete"));
      objc_msgSend((id)self->_needsTurnToPageNumber, "addObject:", v9);
      -[BKPictureBookNavigationController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isContentRenderComplete"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
      objc_msgSend(v8, "setHidden:", 1);

      v5 = v9;
    }
  }

}

- (void)removePendingContent:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = objc_msgSend((id)self->_needsTurnToPageNumber, "containsObject:", v4);
    v4 = v8;
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v6, "removeObserver:name:object:", self, BKContentReadyNotification, v8);
      objc_msgSend(v6, "removeObserver:name:object:", self, BKContentFAILNotification, v8);
      -[BKPictureBookNavigationController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isContentRenderComplete"));
      objc_msgSend((id)self->_needsTurnToPageNumber, "removeObject:", v8);
      -[BKPictureBookNavigationController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isContentRenderComplete"));
      if (!objc_msgSend((id)self->_needsTurnToPageNumber, "count"))
      {
        -[BKPictureBookNavigationController _resetCurlContainer](self, "_resetCurlContainer");
        -[BKPictureBookNavigationController _resetSinglePageCurlContainer](self, "_resetSinglePageCurlContainer");
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
      objc_msgSend(v7, "setHidden:", 0);

      v4 = v8;
    }
  }

}

- (void)_contentIsReadyOrFailed:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  -[BKPictureBookNavigationController removePendingContent:](self, "removePendingContent:", v5);
  v4 = objc_opt_class(BKHTMLContentViewController);
  if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
    objc_msgSend(v5, "performSelector:withObject:afterDelay:", "playFirstVisibleAutoplayMediaObject", 0, 0.25);

}

- (BKPageCurlManager)pageCurlManager
{
  BKPictureBookCurlState *curlState;
  BKPageCurlManager *v4;
  BKPictureBookCurlState *v5;

  curlState = self->_curlState;
  if (!curlState)
  {
    v4 = -[BKPageCurlManager initWithContext:]([BKPageCurlManager alloc], "initWithContext:", self);
    v5 = self->_curlState;
    self->_curlState = (BKPictureBookCurlState *)v4;

    -[BKPictureBookCurlState setDelegate:](self->_curlState, "setDelegate:", self);
    curlState = self->_curlState;
  }
  return (BKPageCurlManager *)curlState;
}

- (id)thumbnailBookViewConfiguration
{
  return -[BKPictureBookNavigationController im_ancestorConfigurationConformingToProtocol:](self, "im_ancestorConfigurationConformingToProtocol:", &OBJC_PROTOCOL___BKThumbnailBookViewConfiguring);
}

- (int)tapActionForLocation:(CGPoint)a3 view:(id)a4 ignoreOppositePage:(BOOL)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  unsigned int v14;
  int64_t v15;
  int v16;
  int v17;
  int v18;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController thumbnailBookViewConfiguration](self, "thumbnailBookViewConfiguration"));
  objc_msgSend(v10, "tapToTurnWidth");
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v14 = objc_msgSend(v13, "BOOLForKey:", BKLeftTapTurnToNextDefault[0]);

  v15 = -[BKViewController layoutDirection](self, "layoutDirection");
  objc_msgSend(v9, "bounds");
  if (x > CGRectGetMaxX(v29) - v12)
    goto LABEL_2;
  objc_msgSend(v9, "bounds");
  if (x < v12 + CGRectGetMinX(v30))
    goto LABEL_4;
  objc_msgSend(v9, "convertPoint:toView:", self->_bookView, x, y);
  v21 = v20;
  -[BKPictureBookScrollView zoomScale](self->_scrollView, "zoomScale");
  v23 = v22;
  -[BKPictureBookScrollView minimumZoomScale](self->_scrollView, "minimumZoomScale");
  if (v23 > v24 && !a5 && !-[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode"))
  {
    v25 = -[BKPageNavigationViewController pageOffset](self, "pageOffset");
    v26 = v25 & 1;
    if (v25 < 0)
      v26 = -v26;
    if (v26 == (v15 != 1))
    {
      -[BKPictureBookView bounds](self->_bookView, "bounds");
      if (v21 > CGRectGetMidX(v31))
        goto LABEL_2;
    }
    v27 = -[BKPageNavigationViewController pageOffset](self, "pageOffset");
    v28 = v27 & 1;
    if (v27 < 0)
      v28 = -v28;
    if (v28 == (v15 == 1))
    {
      -[BKPictureBookView bounds](self->_bookView, "bounds");
      if (v21 < CGRectGetMidX(v32))
      {
LABEL_4:
        v16 = 1;
        goto LABEL_5;
      }
    }
  }
  -[BKPictureBookView bounds](self->_bookView, "bounds");
  if (v21 <= CGRectGetMidX(v33)
    || (-[BKPictureBookView bounds](self->_bookView, "bounds"), v21 <= CGRectGetMaxX(v34) - v12))
  {
    -[BKPictureBookView bounds](self->_bookView, "bounds");
    if (v21 >= CGRectGetMidX(v35)
      || (-[BKPictureBookView bounds](self->_bookView, "bounds"), v21 >= v12 + CGRectGetMinX(v36)))
    {
      v18 = 0;
      goto LABEL_11;
    }
    goto LABEL_4;
  }
LABEL_2:
  v16 = 2;
LABEL_5:
  if (v15 == 1)
    v17 = 1;
  else
    v17 = 2;
  if (v14)
    v18 = v17;
  else
    v18 = v16;
LABEL_11:

  return v18;
}

- (void)handlePageChangeTap:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unsigned int v9;
  double MidX;
  void *v11;
  id v12;
  CGRect v13;
  CGRect v14;

  if (!self->_cancelPageChangeForPageTurn)
  {
    v4 = a3;
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    objc_msgSend(v4, "locationInView:", v12);
    v6 = v5;
    v8 = v7;

    v9 = -[BKPictureBookNavigationController tapActionForLocation:view:ignoreOppositePage:](self, "tapActionForLocation:view:ignoreOppositePage:", v12, 0, v6, v8);
    if (-[BKPictureBookNavigationController isZoomedBeyondPage](self, "isZoomedBeyondPage") && v9)
    {
      -[BKPictureBookView frame](self->_bookView, "frame");
      MidX = CGRectGetMidX(v13);
      -[BKPictureBookScrollView bounds](self->_scrollView, "bounds");
      -[BKPictureBookNavigationController zoom:animated:](self, "zoom:animated:", MidX > CGRectGetMidX(v14), 1);
    }
    else if (v9 == 1)
    {
      -[BKPictureBookNavigationController turnToPreviousPage](self, "turnToPreviousPage");
    }
    else if (v9 == 2)
    {
      -[BKPictureBookNavigationController turnToNextPage](self, "turnToNextPage");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
    objc_msgSend(v11, "pageNavigationDidBeginInteracting:", self);

  }
}

- (void)handleDoubleTap:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double MidX;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  CGRect v16;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
  objc_msgSend(v15, "locationInView:", v4);
  objc_msgSend(v4, "convertPoint:toView:", self->_bookView);
  v6 = v5;
  -[BKPictureBookView bounds](self->_bookView, "bounds");
  MidX = CGRectGetMidX(v16);
  if (!-[BKPictureBookNavigationController isZoomedBeyondPage](self, "isZoomedBeyondPage")
    && !-[BKPictureBookNavigationController _isFreeScale](self, "_isFreeScale"))
  {
    if (-[BKPictureBookNavigationController isZoomedToSinglePage](self, "isZoomedToSinglePage")
      || (-[BKPictureBookScrollView bounds](self->_scrollView, "bounds"),
          v12 = v11,
          -[BKPictureBookScrollView bounds](self->_scrollView, "bounds"),
          v12 >= v13))
    {
      -[BKPictureBookScrollView zoomScale](self->_scrollView, "zoomScale");
      -[BKPictureBookScrollView maximumZoomScale](self->_scrollView, "maximumZoomScale");
      -[BKPictureBookScrollView zoomScale](self->_scrollView, "zoomScale");
      objc_msgSend(v15, "locationInView:", v4);
      objc_msgSend(v4, "convertPoint:toView:", self->_bookView);
      -[BKPictureBookNavigationController zoomToPoint:scale:animated:](self, "zoomToPoint:scale:animated:", 1);
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (-[BKPictureBookNavigationController supportsSinglePageMode](self, "supportsSinglePageMode")
    || (-[BKPictureBookScrollView bounds](self->_scrollView, "bounds"),
        v9 = v8,
        -[BKPictureBookScrollView bounds](self->_scrollView, "bounds"),
        v9 < v10))
  {
LABEL_8:
    -[BKPictureBookNavigationController zoom:animated:](self, "zoom:animated:", v6 <= MidX, 1);
    goto LABEL_10;
  }
  -[BKPictureBookNavigationController zoomToSpread:](self, "zoomToSpread:", 1);
LABEL_10:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
  objc_msgSend(v14, "pageNavigationDidBeginInteracting:", self);

}

- (void)toggleControls:(id)a3
{
  BKContentViewController *leftContentViewController;
  CGFloat x;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  leftContentViewController = self->_leftContentViewController;
  if (leftContentViewController
    && (-[BKContentViewController isAutoCurl](leftContentViewController, "isAutoCurl") & 1) == 0)
  {
    -[BKContentViewController cancelManualCurl](self->_leftContentViewController, "cancelManualCurl");
  }
  x = self->_manualCurlStartPosition.x;
  if (x != 0.0)
    objc_msgSend(*(id *)&x, "cancelManualCurl");
  if (!self->_cancelControlTapForPageTurn)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController presentedViewController](self, "presentedViewController"));

    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
      objc_msgSend(v7, "pageNavigationToggleControls:", self);

    }
  }

}

- (void)leftSwipe:(id)a3
{
  int64_t v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = -[BKViewController layoutDirection](self, "layoutDirection", a3);
  v5 = -[BKPageNavigationViewController pageOffset](self, "pageOffset");
  v6 = -[BKPageNavigationViewController pageCount](self, "pageCount");
  -[BKPictureBookScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 0);
  -[BKPictureBookNavigationController turnToNextPage](self, "turnToNextPage");
  -[BKPictureBookScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", -[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode") ^ 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
  objc_msgSend(v7, "pageNavigationDidBeginInteracting:", self);

  if (v4 != 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
    v9 = v8;
    if (v5 == v6 - 1)
      objc_msgSend(v8, "pageNavigationDidTryToSwipePastEndOfBook:", self);
    else
      objc_msgSend(v8, "pageNavigationDidSwipeToNextPage:", self);

  }
}

- (void)rightSwipe:(id)a3
{
  int64_t v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = -[BKViewController layoutDirection](self, "layoutDirection", a3);
  v5 = -[BKPageNavigationViewController pageOffset](self, "pageOffset");
  v6 = -[BKPageNavigationViewController pageCount](self, "pageCount");
  -[BKPictureBookScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 0);
  -[BKPictureBookNavigationController turnToPreviousPage](self, "turnToPreviousPage");
  -[BKPictureBookScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", -[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode") ^ 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
  objc_msgSend(v7, "pageNavigationDidBeginInteracting:", self);

  if (v4 == 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
    v9 = v8;
    if (v5 == v6 - 1)
      objc_msgSend(v8, "pageNavigationDidTryToSwipePastEndOfBook:", self);
    else
      objc_msgSend(v8, "pageNavigationDidSwipeToNextPage:", self);

  }
}

- (BOOL)_hasMediaElementAtTouch:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController view](self, "view"));
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  LOBYTE(self) = -[BKPictureBookNavigationController hasMediaElementAtPoint:inView:](self, "hasMediaElementAtPoint:inView:", v5, v7, v9);
  return (char)self;
}

- (BOOL)hasMediaElementAtPoint:(CGPoint)a3 inView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController viewControllers](self, "viewControllers", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v14 = objc_opt_class(BKHTMLContentViewController);
        v15 = BUDynamicCast(v14, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        if (v16
          && -[BKPictureBookNavigationController _contentController:hasMediaElementAtPoint:inView:](self, "_contentController:hasMediaElementAtPoint:inView:", v16, v7, x, y))
        {

          v17 = 1;
          goto LABEL_12;
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_12:

  return v17;
}

- (BOOL)_contentController:(id)a3 hasMediaElementAtPoint:(CGPoint)a4 inView:(id)a5
{
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  CGPoint v28;
  CGRect v29;

  y = a4.y;
  x = a4.x;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "webView2"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "be_contentView"));
  objc_msgSend(v11, "convertPoint:fromView:", v9, x, y);
  v13 = v12;
  v15 = v14;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "loader", 0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mediaFrames"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allValues"));

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "CGRectValue");
        v28.x = v13;
        v28.y = v15;
        if (CGRectContainsPoint(v29, v28))
        {
          LOBYTE(v19) = 1;
          goto LABEL_11;
        }
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v19)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v19;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UITapGestureRecognizer *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  unsigned int v14;
  BOOL v15;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  if ((self->_pageChangeTapRecognizer == v6 || self->_controlsTapRecognizer == v6)
    && -[BKPictureBookNavigationController _hasMediaElementAtTouch:](self, "_hasMediaElementAtTouch:", v7))
  {
    goto LABEL_6;
  }
  if (self->_doubleTapGestureRecognizer != v6)
    goto LABEL_7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UITapGestureRecognizer view](v6, "view"));
  objc_msgSend(v7, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UITapGestureRecognizer view](v6, "view"));
  v14 = -[BKPictureBookNavigationController tapActionForLocation:view:ignoreOppositePage:](self, "tapActionForLocation:view:ignoreOppositePage:", v13, 1, v10, v12);

  if (v14)
LABEL_6:
    v15 = 0;
  else
LABEL_7:
    v15 = 1;

  return v15;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *v5;
  unsigned int v6;
  void *v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BKContentViewController *leftContentViewController;
  unsigned __int8 v17;
  BKContentViewController *v18;
  int v19;
  double v20;
  CGFloat x;
  CGRect v22;

  v4 = (UITapGestureRecognizer *)a3;
  v5 = v4;
  if (self->_pageChangeTapRecognizer == v4)
  {
    self->_cancelPageChangeForPageTurn = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UITapGestureRecognizer view](v4, "view"));
    -[UITapGestureRecognizer locationInView:](v5, "locationInView:", v7);
    LOBYTE(v6) = -[BKPictureBookNavigationController tapActionForLocation:view:ignoreOppositePage:](self, "tapActionForLocation:view:ignoreOppositePage:", v7, -[BKPictureBookNavigationController isZoomedBeyondPage](self, "isZoomedBeyondPage"), v8, v9) != 0;
LABEL_15:

    goto LABEL_16;
  }
  if (self->_doubleTapGestureRecognizer == v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UITapGestureRecognizer view](v4, "view"));
    -[UITapGestureRecognizer locationInView:](v5, "locationInView:", v7);
    LOBYTE(v6) = !-[BKPictureBookNavigationController tapActionForLocation:view:ignoreOppositePage:](self, "tapActionForLocation:view:ignoreOppositePage:", v7, 1)&& -[BKPageCurlManager isHidden](self->_pageCurlManager, "isHidden")&& (-[BKPageCurl isHidden](self->_manualCurl, "isHidden") & 1) != 0;
    goto LABEL_15;
  }
  if ((UITapGestureRecognizer *)self->_leftSwipeGestureRecognizer == v4)
  {
    -[BKPictureBookScrollView contentOffset](self->_scrollView, "contentOffset");
    v12 = v11;
    -[BKPictureBookScrollView bounds](self->_scrollView, "bounds");
    v13 = v12 + CGRectGetWidth(v22);
    -[BKPictureBookScrollView contentSize](self->_scrollView, "contentSize");
    v15 = v14 + -5.0;
    LOBYTE(v6) = v13 >= v14 + -5.0;
    leftContentViewController = self->_leftContentViewController;
    if (!leftContentViewController
      || -[BKContentViewController isAutoCurl](leftContentViewController, "isAutoCurl"))
    {
      v17 = -[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode");
      if (v13 >= v15)
        LOBYTE(v6) = 1;
      else
        LOBYTE(v6) = v17;
    }
  }
  else
  {
    if ((UITapGestureRecognizer *)self->_rightSwipeGestureRecognizer != v4)
    {
      if (self->_controlsTapRecognizer == v4)
      {
        self->_cancelControlTapForPageTurn = 0;
      }
      else if ((UITapGestureRecognizer *)self->_manualCurlGestureRecognizer == v4
             || (UITapGestureRecognizer *)self->_panManualCurlGestureRecognizer == v4)
      {
        v6 = !-[BKPictureBookNavigationController isZoomedBeyondPage](self, "isZoomedBeyondPage");
        goto LABEL_16;
      }
      LOBYTE(v6) = 1;
      goto LABEL_16;
    }
    v18 = self->_leftContentViewController;
    if (v18 && (-[BKContentViewController isAutoCurl](v18, "isAutoCurl") & 1) == 0)
    {
      -[BKContentViewController cancelManualCurl](self->_leftContentViewController, "cancelManualCurl");
      v19 = 0;
      self->_curlPageForReadAloudSelector = "turnToPreviousPage";
    }
    else
    {
      v19 = 1;
    }
    -[BKPictureBookScrollView contentOffset](self->_scrollView, "contentOffset");
    x = self->_manualCurlStartPosition.x;
    if (x == 0.0)
    {
      if (v20 > 5.0)
        v19 = 0;
      v6 = -[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode") | v19;
    }
    else
    {
      objc_msgSend(*(id *)&x, "cancelManualCurl");
      LOBYTE(v6) = 0;
      self->_curlPageForReadAloudSelector = "turnToPreviousPage";
    }
  }
LABEL_16:

  return v6;
}

- (BOOL)isMediaPlayerGestureRecognizer:(id)a3
{
  id v3;
  Class v4;
  Class v5;
  Class v6;
  uint64_t v7;
  BOOL v8;

  v3 = a3;
  v4 = NSClassFromString(CFSTR("MPTapGestureRecognizer"));
  v8 = 1;
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
    v5 = NSClassFromString(CFSTR("MPSwipeGestureRecognizer"));
    if ((objc_opt_isKindOfClass(v3, v5) & 1) == 0)
    {
      v6 = NSClassFromString(CFSTR("MPActivityGestureRecognizer"));
      if ((objc_opt_isKindOfClass(v3, v6) & 1) == 0)
      {
        v7 = objc_opt_class(UIPinchGestureRecognizer);
        if ((objc_opt_isKindOfClass(v3, v7) & 1) == 0)
          v8 = 0;
      }
    }
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;

  v6 = a4;
  v7 = v6;
  if (self->_doubleTapGestureRecognizer == a3 || self->_pageChangeTapRecognizer == a3)
    v8 = objc_msgSend(v6, "bk_isWKSyntheticTapGestureRecognizer");
  else
    v8 = 0;

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4
{
  UISwipeGestureRecognizer *v6;
  id v7;
  Class v8;
  Class v9;
  uint64_t v10;
  id v11;
  char isKindOfClass;
  Class v14;

  v6 = (UISwipeGestureRecognizer *)a3;
  v7 = a4;
  v8 = NSClassFromString(CFSTR("UIWebTouchEventsGestureRecognizer"));
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0
    || (v9 = NSClassFromString(CFSTR("WKTouchEventsGestureRecognizer")), (objc_opt_isKindOfClass(v7, v9) & 1) != 0))
  {
LABEL_9:
    isKindOfClass = 1;
    goto LABEL_10;
  }
  if ((UISwipeGestureRecognizer *)self->_doubleTapGestureRecognizer != v6
    || (v10 = objc_opt_class(UITapGestureRecognizer), (objc_opt_isKindOfClass(v7, v10) & 1) == 0))
  {
    if (self->_leftSwipeGestureRecognizer == v6 || self->_rightSwipeGestureRecognizer == v6)
    {
      v14 = NSClassFromString(CFSTR("UITextRangeAdjustmentGestureRecognizer"));
      isKindOfClass = objc_opt_isKindOfClass(v7, v14);
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v11 = v7;
  if (objc_msgSend(v11, "numberOfTapsRequired") == (char *)&dword_0 + 2)
    isKindOfClass = objc_msgSend(v11, "matchesTarget:andAction:", +[UIView be_wkContentViewClass](UIView, "be_wkContentViewClass"), "_nonBlockingDoubleTapRecognized:") ^ 1;
  else
    isKindOfClass = 1;

LABEL_10:
  return isKindOfClass & 1;
}

- (void)pageAnimationWillBegin:(id)a3
{
  void *v4;

  if (-[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController singlePageCurlContainer](self, "singlePageCurlContainer"));
    objc_msgSend(v4, "setHidden:", 0);

  }
  else
  {
    -[BKPageCurlManager setHidden:](self->_pageCurlManager, "setHidden:", 0);
  }
  -[BKPictureBookScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 0);
}

- (void)pageAnimation:(id)a3 didFinish:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  CGFloat x;
  BKContentViewController *leftContentViewController;
  _QWORD *p_singlePageCurlContainer;
  id v10;

  v4 = a4;
  v10 = a3;
  if (objc_msgSend(v10, "state") != (char *)&dword_0 + 2)
  {
    if (-[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode"))
    {
      -[BKPictureBookNavigationController slide:animated:withDelay:](self, "slide:animated:withDelay:", -[BKPictureBookNavigationController isZoomedToRightPage](self, "isZoomedToRightPage"), 0, 0.0);
      -[BKPictureBookNavigationController _resetSinglePageCurlContainer](self, "_resetSinglePageCurlContainer");
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "existingPages"));
      -[BKPictureBookNavigationController _restoreViewHierarchyWithArray:](self, "_restoreViewHierarchyWithArray:", v6);

    }
  }
  -[BKPictureBookScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", -[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode") ^ 1);
  x = self->_manualCurlStartPosition.x;
  self->_manualCurlStartPosition.x = 0.0;

  leftContentViewController = self->_leftContentViewController;
  self->_leftContentViewController = 0;

  if (v4)
  {
    if (objc_msgSend(v10, "finished"))
      -[BKPictureBookNavigationController _resetCurlContainer](self, "_resetCurlContainer");
    if (-[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode")
      && objc_msgSend(v10, "state") == &dword_4)
    {
      -[BKPictureBookNavigationController slide:animated:withDelay:](self, "slide:animated:withDelay:", -[BKPictureBookNavigationController isZoomedToRightPage](self, "isZoomedToRightPage"), 0, 0.0);
    }
    -[BKPictureBookNavigationController _resetSinglePageCurlContainer](self, "_resetSinglePageCurlContainer");
    p_singlePageCurlContainer = &self->_singlePageCurlContainer;
    if (self->_singlePageCurlContainer
      && !-[BKPictureBookCurlState numberOfQueuedCurls](self->_curlState, "numberOfQueuedCurls"))
    {
      -[BKPictureBookNavigationController performSelector:withObject:](self, "performSelector:withObject:", *p_singlePageCurlContainer, &__kCFBooleanTrue);
LABEL_17:
      *p_singlePageCurlContainer = 0;
    }
  }
  else
  {
    p_singlePageCurlContainer = &self->_curlPageForReadAloudSelector;
    if (self->_curlPageForReadAloudSelector
      && !-[BKPictureBookScrollView touchInProgress](self->_scrollView, "touchInProgress"))
    {
      -[BKPictureBookNavigationController performSelector:](self, "performSelector:", *p_singlePageCurlContainer);
      goto LABEL_17;
    }
  }

}

- (double)pageAnimationDurationFor:(id)a3
{
  return 0.400000006;
}

- (void)pageCurlManager:(id)a3 willBeginCurl:(id)a4
{
  void *v5;

  if (-[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode", a3, a4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController singlePageCurlContainer](self, "singlePageCurlContainer"));
    objc_msgSend(v5, "setHidden:", 0);

  }
  else
  {
    -[BKPageCurlManager setHidden:](self->_pageCurlManager, "setHidden:", 0);
  }
  -[BKPictureBookScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 0);
}

- (void)pageCurlManager:(id)a3 didFinishCurl:(id)a4 transitionCompleted:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  CGFloat x;
  BKContentViewController *leftContentViewController;
  _QWORD *p_singlePageCurlContainer;
  id v13;

  v5 = a5;
  v13 = a3;
  v8 = a4;
  if (!v5)
  {
    if (-[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode"))
    {
      -[BKPictureBookNavigationController slide:animated:withDelay:](self, "slide:animated:withDelay:", -[BKPictureBookNavigationController isZoomedToRightPage](self, "isZoomedToRightPage"), 0, 0.0);
      -[BKPictureBookNavigationController _resetSinglePageCurlContainer](self, "_resetSinglePageCurlContainer");
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "existingPages"));
      -[BKPictureBookNavigationController _restoreViewHierarchyWithArray:](self, "_restoreViewHierarchyWithArray:", v9);

    }
  }
  -[BKPictureBookScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", -[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode") ^ 1);
  x = self->_manualCurlStartPosition.x;
  self->_manualCurlStartPosition.x = 0.0;

  leftContentViewController = self->_leftContentViewController;
  self->_leftContentViewController = 0;

  if (v5)
  {
    if (objc_msgSend(v8, "finished"))
      -[BKPictureBookNavigationController _resetCurlContainer](self, "_resetCurlContainer");
    if (-[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode")
      && objc_msgSend(v8, "state") == &dword_4)
    {
      -[BKPictureBookNavigationController slide:animated:withDelay:](self, "slide:animated:withDelay:", -[BKPictureBookNavigationController isZoomedToRightPage](self, "isZoomedToRightPage"), 0, 0.0);
    }
    -[BKPictureBookNavigationController _resetSinglePageCurlContainer:](self, "_resetSinglePageCurlContainer:", v8);
    p_singlePageCurlContainer = &self->_singlePageCurlContainer;
    if (self->_singlePageCurlContainer && !objc_msgSend(v13, "numberOfQueuedCurls"))
    {
      -[BKPictureBookNavigationController performSelector:withObject:](self, "performSelector:withObject:", *p_singlePageCurlContainer, &__kCFBooleanTrue);
LABEL_17:
      *p_singlePageCurlContainer = 0;
    }
  }
  else
  {
    p_singlePageCurlContainer = &self->_curlPageForReadAloudSelector;
    if (self->_curlPageForReadAloudSelector
      && !-[BKPictureBookScrollView touchInProgress](self->_scrollView, "touchInProgress"))
    {
      -[BKPictureBookNavigationController performSelector:](self, "performSelector:", *p_singlePageCurlContainer);
      goto LABEL_17;
    }
  }

}

- (void)pageCurlManager:(id)a3 didCancelCurl:(id)a4
{
  -[BKPictureBookScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", -[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode", a3, a4) ^ 1);
}

- (double)pageCurlManager:(id)a3 durationForCurl:(id)a4
{
  return 0.400000006;
}

- (void)setSelectionHighlightsVisible:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[BKContentViewController setSelectionHighlightsVisible:](self->_rightContentViewController, "setSelectionHighlightsVisible:");
  -[NSMutableSet setSelectionHighlightsVisible:](self->_pendingLoads, "setSelectionHighlightsVisible:", v3);
}

- (void)_updateSelectionHighlights
{
  -[BKContentViewController updateSelectionHighlights](self->_rightContentViewController, "updateSelectionHighlights");
  -[NSMutableSet updateSelectionHighlights](self->_pendingLoads, "updateSelectionHighlights");
}

- (void)scrollViewDidScroll:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v14 = a3;
  objc_msgSend(v14, "contentOffset");
  v4 = v3;
  v6 = v5;
  objc_msgSend(v14, "contentSize");
  v8 = v7;
  objc_msgSend(v14, "bounds");
  if (v8 > CGRectGetWidth(v15))
  {
    v9 = 0.0;
    if (v4 < 0.0)
    {
LABEL_5:
      objc_msgSend(v14, "setContentOffset:", v9, v6);
      goto LABEL_6;
    }
    objc_msgSend(v14, "contentSize", 0.0);
    v11 = v10;
    objc_msgSend(v14, "bounds");
    if (v4 > ceil(v11 - CGRectGetWidth(v16)))
    {
      objc_msgSend(v14, "contentSize");
      v13 = v12;
      objc_msgSend(v14, "bounds");
      v9 = round(v13 - CGRectGetWidth(v17));
      goto LABEL_5;
    }
  }
LABEL_6:

}

- (id)viewForZoomingInScrollView:(id)a3
{
  return self->_bookView;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "pageNavigationDidBeginInteracting:", self);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  double v6;
  double v7;
  double MidX;
  int64_t v9;
  int64_t v10;
  CGRect v11;

  -[BKZoomingScrollView pointToCenterAfterRotation](self->_scrollView, "pointToCenterAfterRotation", a3);
  v7 = v6;
  if (!-[BKPictureBookNavigationController isZoomedToSpread](self, "isZoomedToSpread"))
  {
    -[BKPictureBookView bounds](self->_bookView, "bounds");
    MidX = CGRectGetMidX(v11);
    v9 = -[BKPageNavigationViewController pageOffset](self, "pageOffset");
    v10 = v7 <= MidX
        ? -[BKPageNavigationViewController leftPageNumberForSinglePageOffset:](self, "leftPageNumberForSinglePageOffset:", v9): -[BKPageNavigationViewController rightPageNumberForSinglePageOffset:](self, "rightPageNumberForSinglePageOffset:", v9);
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      -[BKPictureBookNavigationController setPageOffset:](self, "setPageOffset:", v10 - 1);
  }
  if (!a4)
    -[BKPictureBookNavigationController _updateSelectionHighlights](self, "_updateSelectionHighlights");
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[BKPictureBookNavigationController _updateSelectionHighlights](self, "_updateSelectionHighlights", a3);
}

- (void)scrollViewDidZoom:(id)a3
{
  if (!+[BKBookViewController useEnhancedEditMenu](BKBookViewController, "useEnhancedEditMenu", a3))
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &stru_1BEAF8);
  -[BKZoomingScrollView centerContent](self->_scrollView, "centerContent");
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
  objc_msgSend(v6, "pageNavigationDidBeginInteracting:", self);

  objc_msgSend(v5, "setBounces:", 1);
  objc_msgSend(v5, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v5, "setAlwaysBounceHorizontal:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController pageCurl](self->_leftContentViewController, "pageCurl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "existingPages"));
  -[BKPictureBookNavigationController _restoreViewHierarchyWithArray:](self, "_restoreViewHierarchyWithArray:", v8);

  if (!+[BKBookViewController useEnhancedEditMenu](BKBookViewController, "useEnhancedEditMenu"))
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &stru_1BEB18);
  -[BKPictureBookNavigationController exitSinglePageMode](self, "exitSinglePageMode");
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id v7;
  void *v8;
  dispatch_time_t v9;
  double v10;
  double v11;
  double v12;
  _BOOL8 v13;
  _QWORD block[5];
  CGRect v15;

  v7 = a3;
  if (-[BKPictureBookNavigationController isZoomedToSpread](self, "isZoomedToSpread"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v8, "postEvent:sender:", kBETestDriverFXLZoomToSpreadEnd, self);

  }
  if (*(_QWORD *)&self->_curlPageForReadAloud)
  {
    v9 = dispatch_time(0, 100000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_A2A4;
    block[3] = &unk_1BEA38;
    block[4] = self;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
    -[BKPictureBookNavigationController _updateBookScale](self, "_updateBookScale");
  }
  else
  {
    if (-[BKPictureBookNavigationController isZoomedToSinglePage](self, "isZoomedToSinglePage"))
    {
      -[BKZoomingScrollView pointToCenterAfterRotation](self->_scrollView, "pointToCenterAfterRotation");
      v11 = v10;
      -[BKPictureBookView bounds](self->_bookView, "bounds");
      -[BKPictureBookNavigationController zoom:animated:](self, "zoom:animated:", v11 <= CGRectGetMidX(v15), 1);
    }
    else if (-[BKPictureBookNavigationController isZoomedCloseToSpread](self, "isZoomedCloseToSpread"))
    {
      -[BKPictureBookNavigationController zoomToSpread:](self, "zoomToSpread:", 1);
    }
    -[BKPictureBookScrollView zoomScale](self->_scrollView, "zoomScale");
    if (v12 == a5)
    {
      -[BKPictureBookNavigationController _updateBookScale](self, "_updateBookScale");
      if (-[BKPictureBookNavigationController isZoomedToSinglePage](self, "isZoomedToSinglePage"))
        -[BKPictureBookNavigationController enterSinglePageMode](self, "enterSinglePageMode");
    }
    v13 = -[BKPictureBookNavigationController _isFreeScale](self, "_isFreeScale");
    objc_msgSend(v7, "setBounces:", v13);
    objc_msgSend(v7, "setAlwaysBounceVertical:", v13);
    objc_msgSend(v7, "setAlwaysBounceHorizontal:", 0);
  }

}

- (double)singlePagePadding
{
  void *v4;
  double v5;
  double v6;

  if (-[BKPictureBookNavigationController supportsSinglePageMode](self, "supportsSinglePageMode"))
    return 0.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController thumbnailBookViewConfiguration](self, "thumbnailBookViewConfiguration"));
  objc_msgSend(v4, "singlePagePadding");
  v6 = v5;

  return v6;
}

- (double)effectiveZoomScale
{
  double v3;
  double v4;
  double v5;

  -[BKPictureBookView scale](self->_bookView, "scale");
  v4 = v3;
  -[BKPictureBookScrollView zoomScale](self->_scrollView, "zoomScale");
  return v4 * v5;
}

- (BOOL)isZoomedToSinglePage
{
  double v4;
  double v5;
  double v6;

  if (-[BKPictureBookNavigationController isZoomedToSpread](self, "isZoomedToSpread"))
    return 0;
  -[BKPictureBookNavigationController effectiveZoomScale](self, "effectiveZoomScale");
  v5 = v4;
  -[BKPictureBookNavigationController singlePageZoomScale](self, "singlePageZoomScale");
  return vabdd_f64(v5, v6) < 0.07;
}

- (BOOL)isZoomedToRightPage
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = -[BKPictureBookNavigationController isZoomedToSinglePage](self, "isZoomedToSinglePage");
  if (v3)
  {
    -[BKPictureBookScrollView contentOffset](self->_scrollView, "contentOffset");
    v5 = v4;
    -[BKPictureBookScrollView frame](self->_scrollView, "frame");
    v7 = v5 + v6;
    -[BKPictureBookScrollView contentSize](self->_scrollView, "contentSize");
    LOBYTE(v3) = vabdd_f64(v7, v8) <= 10.0;
  }
  return v3;
}

- (BOOL)shouldZoomToSinglePage
{
  double v4;
  double v5;
  double v6;

  if (-[BKPictureBookNavigationController isZoomedToSpread](self, "isZoomedToSpread"))
    return 0;
  -[BKPictureBookNavigationController effectiveZoomScale](self, "effectiveZoomScale");
  v5 = v4;
  -[BKPictureBookNavigationController singlePageZoomScale](self, "singlePageZoomScale");
  return vabdd_f64(v5, v6) < 0.07;
}

- (BOOL)isZoomedBeyondPage
{
  double v4;
  double v5;
  double v6;

  if (-[BKPictureBookNavigationController isZoomedToSinglePage](self, "isZoomedToSinglePage"))
    return 0;
  -[BKPictureBookNavigationController effectiveZoomScale](self, "effectiveZoomScale");
  v5 = v4;
  -[BKPictureBookNavigationController singlePageZoomScale](self, "singlePageZoomScale");
  return v5 > v6;
}

- (BOOL)isZoomedCloseToSpread
{
  double v4;
  double v5;
  double v6;

  if (-[BKPictureBookNavigationController isZoomedToSpread](self, "isZoomedToSpread"))
    return 0;
  -[BKPictureBookScrollView zoomScale](self->_scrollView, "zoomScale");
  v5 = v4;
  -[BKPictureBookScrollView minimumZoomScale](self->_scrollView, "minimumZoomScale");
  return vabdd_f64(v5, v6) < 0.23;
}

- (BOOL)isZoomedToSpread
{
  double v3;
  double v4;
  double v5;

  -[BKPictureBookScrollView zoomScale](self->_scrollView, "zoomScale");
  v4 = v3;
  -[BKPictureBookScrollView minimumZoomScale](self->_scrollView, "minimumZoomScale");
  return vabdd_f64(v4, v5) < 0.01;
}

- (BOOL)_isFreeScale
{
  if (-[BKPictureBookNavigationController isZoomedToSinglePage](self, "isZoomedToSinglePage"))
    return 0;
  else
    return !-[BKPictureBookNavigationController isZoomedToSpread](self, "isZoomedToSpread");
}

- (BOOL)currentlyZoomed
{
  if (-[BKPictureBookNavigationController _isFreeScale](self, "_isFreeScale"))
    return 1;
  else
    return -[BKPictureBookNavigationController isZoomedToSinglePage](self, "isZoomedToSinglePage");
}

- (BOOL)canZoomMore
{
  double v2;

  -[BKPictureBookScrollView zoomScale](self->_scrollView, "zoomScale");
  return v2 < 2.0;
}

- (BOOL)singlePageAspectFits
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[BKPictureBookScrollView bounds](self->_scrollView, "bounds");
  v4 = v3;
  v6 = v5;
  -[BKPictureBookView actualSize](self->_bookView, "actualSize");
  return v7 * 0.5 / v8 > v4 / v6;
}

- (BOOL)supportsSinglePageMode
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  BOOL v8;

  if (!-[BKPictureBookNavigationController isViewLoaded](self, "isViewLoaded"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController view](self, "view"));
  objc_msgSend(v6, "bounds");
  v8 = v5 < v7 && LOBYTE(self->_lastCompletedTransition) != 0;

  return v8;
}

- (UIView)singlePageCurlContainer
{
  BKPageCurl *manualCurl;
  BKPageCurl *v4;
  BKPageCurl *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;

  manualCurl = self->_manualCurl;
  if (!manualCurl)
  {
    v4 = (BKPageCurl *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_manualCurl;
    self->_manualCurl = v4;

    -[BKPageCurl setAutoresizingMask:](self->_manualCurl, "setAutoresizingMask:", 0);
    -[BKPageCurl setUserInteractionEnabled:](self->_manualCurl, "setUserInteractionEnabled:", 0);
    -[BKPageCurl setHidden:](self->_manualCurl, "setHidden:", 1);
    -[BKPageCurl setOpaque:](self->_manualCurl, "setOpaque:", 1);
    -[BKPageCurl setClipsToBounds:](self->_manualCurl, "setClipsToBounds:", 0);
    -[BKPictureBookNavigationController contentSize](self, "contentSize");
    v7 = v6;
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController thumbnailBookViewConfiguration](self, "thumbnailBookViewConfiguration"));
    -[BKPictureBookNavigationController _containerBoundsForGeometry](self, "_containerBoundsForGeometry");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:", v10, 0, 1, v7, v9, v11, v12, v13, v14));

    objc_msgSend(v15, "sizeForSpread:landscape:", 0, 0);
    -[BKPageCurl setFrame:](self->_manualCurl, "setFrame:", 0.0, 0.0, v16, v17);
    -[BKPictureBookView addSubview:](self->_bookView, "addSubview:", self->_manualCurl);

    manualCurl = self->_manualCurl;
  }
  return (UIView *)manualCurl;
}

- (void)enterSinglePageMode
{
  unsigned int v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  id v7;

  if (!-[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode")
    && -[BKPictureBookNavigationController supportsSinglePageMode](self, "supportsSinglePageMode")
    && -[BKPictureBookNavigationController isZoomedToSinglePage](self, "isZoomedToSinglePage"))
  {
    BYTE2(self->_lastCompletedTransition) = 1;
    v3 = -[BKPictureBookNavigationController isZoomedToRightPage](self, "isZoomedToRightPage");
    v4 = -[BKPageNavigationViewController pageOffset](self, "pageOffset");
    if (v3)
      v5 = -[BKPageNavigationViewController rightPageNumberForSinglePageOffset:](self, "rightPageNumberForSinglePageOffset:", v4);
    else
      v5 = -[BKPageNavigationViewController leftPageNumberForSinglePageOffset:](self, "leftPageNumberForSinglePageOffset:", v4);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      -[BKPictureBookNavigationController setPageOffset:](self, "setPageOffset:", v5 - 1);
    -[BKPictureBookScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 0);
    if ((char *)-[BKViewController layoutDirection](self, "layoutDirection") == (char *)&dword_0 + 1)
      v6 = 3;
    else
      v6 = 1;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageCurlManager](self, "pageCurlManager"));
    objc_msgSend(v7, "setSpineLocation:", v6);

  }
}

- (void)exitSinglePageMode
{
  CGFloat x;
  CGFloat v4;
  id v5;
  NSObject *v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  int v11;
  void *v12;

  if (-[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode"))
  {
    x = self->_manualCurlStartPosition.x;
    if (x != 0.0)
    {
      objc_msgSend(*(id *)&x, "killCurl");
      v4 = self->_manualCurlStartPosition.x;
      self->_manualCurlStartPosition.x = 0.0;

    }
    BYTE2(self->_lastCompletedTransition) = 0;
    *(_QWORD *)&self->_canFitToWidth = -[BKPageNavigationViewController pageOffset](self, "pageOffset");
    v5 = _AECaptureLocationLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)&self->_canFitToWidth));
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "#PictureBook 5 capture offset : %@", (uint8_t *)&v11, 0xCu);

    }
    v8 = -[BKViewController layoutDirection](self, "layoutDirection");
    v9 = -[BKPageNavigationViewController pageOffset](self, "pageOffset");
    if (v8 == 1)
      -[BKPageNavigationViewController rightPageNumberForSinglePageOffset:](self, "rightPageNumberForSinglePageOffset:", v9);
    else
      -[BKPageNavigationViewController leftPageNumberForSinglePageOffset:](self, "leftPageNumberForSinglePageOffset:", v9);
    -[BKPictureBookNavigationController _resetSinglePageCurlContainer](self, "_resetSinglePageCurlContainer");
    -[BKPictureBookScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageCurlManager](self, "pageCurlManager"));
    objc_msgSend(v10, "setSpineLocation:", 2);

  }
}

- (double)singlePageZoomScale
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  -[BKPictureBookScrollView bounds](self->_scrollView, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[BKPictureBookView actualSize](self->_bookView, "actualSize");
  v12 = v11;
  v14 = v13 * 0.5;
  -[BKPictureBookNavigationController singlePagePadding](self, "singlePagePadding");
  v16 = v15;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  v17 = CGRectGetWidth(v19) - v16;
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  if (v14 / v12 <= v17 / CGRectGetHeight(v20))
  {
    v22.origin.x = v4;
    v22.origin.y = v6;
    v22.size.width = v8;
    v22.size.height = v10;
    return CGRectGetHeight(v22) / v12;
  }
  else
  {
    v21.origin.x = v4;
    v21.origin.y = v6;
    v21.size.width = v8;
    v21.size.height = v10;
    return (CGRectGetWidth(v21) - v16) / v14;
  }
}

- (void)zoomToSpread:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (!-[BKPictureBookNavigationController isZoomedToSpread](self, "isZoomedToSpread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v5, "postEvent:sender:", kBETestDriverFXLZoomToSpreadStart, self);

    -[BKPictureBookView bounds](self->_bookView, "bounds");
    -[BKPictureBookScrollView zoomToRect:animated:](self->_scrollView, "zoomToRect:animated:", v3);
    if (!v3)
      -[BKPictureBookNavigationController exitSinglePageMode](self, "exitSinglePageMode");
  }
}

- (void)zoom:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double MinX;

  v4 = a4;
  v5 = a3;
  -[BKPictureBookView bounds](self->_bookView, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[BKPictureBookNavigationController singlePagePadding](self, "singlePagePadding");
  v16 = v15;
  -[BKPictureBookView scale](self->_bookView, "scale");
  v18 = v16 * v17;
  -[BKPictureBookNavigationController singlePageZoomScale](self, "singlePageZoomScale");
  v20 = v18 / v19;
  v21 = v8;
  v22 = v10;
  v23 = v12;
  v24 = v14;
  if (v5)
    MinX = CGRectGetMinX(*(CGRect *)&v21);
  else
    MinX = CGRectGetMidX(*(CGRect *)&v21) - v20;
  -[BKPictureBookScrollView zoomToRect:animated:](self->_scrollView, "zoomToRect:animated:", v4, MinX, v10, v12 * 0.5 + v20, v14);
}

- (void)zoomToPoint:(CGPoint)a3 scale:(double)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
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

  if (a4 != 0.0)
  {
    v5 = a5;
    y = a3.y;
    x = a3.x;
    -[BKPictureBookScrollView bounds](self->_scrollView, "bounds");
    v11 = v10 / a4;
    -[BKPictureBookScrollView bounds](self->_scrollView, "bounds");
    v13 = v12 / a4;
    v14 = y - v13 * 0.5;
    if (x - v11 * 0.5 >= 0.0)
      v15 = x - v11 * 0.5;
    else
      v15 = 0.0;
    if (v14 >= 0.0)
      v16 = v14;
    else
      v16 = 0.0;
    -[BKPictureBookView bounds](self->_bookView, "bounds");
    v18 = v15 - fmax(v11 + v15 - v17, 0.0);
    -[BKPictureBookView bounds](self->_bookView, "bounds");
    -[BKPictureBookScrollView zoomToRect:animated:](self->_scrollView, "zoomToRect:animated:", v5, v18, v16 - fmax(v13 + v16 - v19, 0.0), v11, v13);
  }
}

- (void)zoomToPage:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  int64_t v7;
  int64_t v8;

  v4 = a4;
  v7 = -[BKPageNavigationViewController leftPageNumberForSpreadPageOffset:](self, "leftPageNumberForSpreadPageOffset:", -[BKPageNavigationViewController pageOffset](self, "pageOffset"));
  v8 = -[BKPageNavigationViewController rightPageNumberForSpreadPageOffset:](self, "rightPageNumberForSpreadPageOffset:", -[BKPageNavigationViewController pageOffset](self, "pageOffset"));
  if (v7 != a3 && v8 != a3)
  {
    if (v4)
      return;
LABEL_6:
    -[BKPictureBookNavigationController enterSinglePageMode](self, "enterSinglePageMode");
    return;
  }
  -[BKPictureBookNavigationController zoom:animated:](self, "zoom:animated:", v7 == a3, v4);
  -[BKPictureBookNavigationController setPageOffset:](self, "setPageOffset:", a3 - 1);
  if (!v4)
    goto LABEL_6;
}

- (CGRect)_containerBoundsForGeometry
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController viewIfLoaded](self, "viewIfLoaded"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));
  v4 = v3;
  if (!v3)
  {
    if (!v2)
    {
      x = CGRectZero.origin.x;
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
      goto LABEL_5;
    }
    v3 = v2;
  }
  objc_msgSend(v3, "bounds");
  x = v5;
  y = v7;
  width = v9;
  height = v11;
LABEL_5:

  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)updateUpsellZoomScale
{
  _QWORD *p_rightContentViewController;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  _BOOL8 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  id v21;

  p_rightContentViewController = &self->_rightContentViewController;
  if ((-[BKContentViewController conformsToProtocol:](self->_rightContentViewController, "conformsToProtocol:", &OBJC_PROTOCOL___BKUpsell) & 1) != 0|| (p_rightContentViewController = &self->_pendingLoads, -[NSMutableSet conformsToProtocol:](self->_pendingLoads, "conformsToProtocol:", &OBJC_PROTOCOL___BKUpsell)))
  {
    v4 = BUProtocolCast(&OBJC_PROTOCOL___BKUpsell, *p_rightContentViewController);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (v5)
    {
      v21 = (id)v5;
      -[BKPictureBookNavigationController contentSize](self, "contentSize");
      v7 = v6;
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController thumbnailBookViewConfiguration](self, "thumbnailBookViewConfiguration"));
      v11 = -[BKPictureBookNavigationController drawsSpine](self, "drawsSpine");
      -[BKPictureBookNavigationController _containerBoundsForGeometry](self, "_containerBoundsForGeometry");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:containerBounds:", v10, v11, v7, v9, v12, v13, v14, v15));
      objc_msgSend(v16, "maximumSize");
      objc_msgSend(v21, "setContentSize:");

      -[BKPictureBookView layoutIfNeeded](self->_bookView, "layoutIfNeeded");
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookView leftContentView](self->_bookView, "leftContentView"));
      objc_msgSend(v17, "frame");
      v19 = v18;
      objc_msgSend(v21, "contentSize");
      objc_msgSend(v21, "setZoomScale:", v19 / v20);

      -[BKPictureBookView scale](self->_bookView, "scale");
      objc_msgSend(v21, "setContentScale:");
      objc_msgSend(v21, "setFixedLayout:", 1);

    }
  }
}

- (BOOL)_allowZoom
{
  return 1;
}

- (void)_updateBookScale
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unsigned int v13;
  double y;
  double width;
  double height;
  _BOOL8 v17;
  void *v18;
  _BOOL8 v19;
  _BOOL8 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  __int128 v28;
  CGSize size;
  double v30;
  CGAffineTransform *Scale;
  uint64_t v32;
  double v33;
  char v34;
  double v35;
  double v36;
  double v37;
  BKPictureBookView *bookView;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  double x;
  CGAffineTransform v50;
  _OWORD v51[2];
  _OWORD v52[2];
  CGRect v53;
  CGAffineTransform v54;
  CGRect v55;
  CGRect v56;

  -[BKPictureBookNavigationController contentSize](self, "contentSize");
  v4 = v3;
  v6 = v5;
  -[BKPictureBookScrollView zoomScale](self->_scrollView, "zoomScale");
  v8 = v7;
  -[BKPictureBookView scale](self->_bookView, "scale");
  v10 = v9;
  -[BKPictureBookScrollView minimumZoomScale](self->_scrollView, "minimumZoomScale");
  v12 = v11;
  v13 = -[BKPictureBookNavigationController _isFreeScale](self, "_isFreeScale");
  -[BKPictureBookView frame](self->_bookView, "frame");
  v56 = CGRectIntegral(v55);
  x = v56.origin.x;
  y = v56.origin.y;
  width = v56.size.width;
  height = v56.size.height;
  v17 = -[BKPictureBookNavigationController isZoomedToSpread](self, "isZoomedToSpread");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController thumbnailBookViewConfiguration](self, "thumbnailBookViewConfiguration"));
  v19 = -[BKPictureBookNavigationController drawsSpine](self, "drawsSpine");
  v20 = -[BKPictureBookNavigationController supportsSinglePageMode](self, "supportsSinglePageMode");
  -[BKPictureBookNavigationController _containerBoundsForGeometry](self, "_containerBoundsForGeometry");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:", v18, v19, v20, v4, v6, v21, v22, v23, v24));

  objc_msgSend(v25, "scaleForSpread:landscape:", v17, ((uint64_t (*)(void))isPortrait)() ^ 1);
  if (v13)
    v27 = v8 * v10;
  else
    v27 = v26;
  v28 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v54.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v54.c = v28;
  *(_OWORD *)&v54.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  size = CGRectZero.size;
  v53.origin = CGRectZero.origin;
  v53.size = size;
  v52[0] = v53.origin;
  v52[1] = size;
  v51[0] = v53.origin;
  v51[1] = size;
  -[BKPictureBookView calculateFramesAtScale:contentFrame:leftContentFrame:rightContentFrame:](self->_bookView, "calculateFramesAtScale:contentFrame:leftContentFrame:rightContentFrame:", &v53, v52, v51, v27);
  v30 = CGRectGetWidth(v53);
  v32 = (uint64_t)(v30 * CGRectGetHeight(v53));
  *(double *)self[1].super.super.IMViewController_opaque = v27;
  v33 = BEWebViewMinimumZoomScale;
  if (v27 >= BEWebViewMinimumZoomScale)
  {
    v34 = 0;
    v35 = v10 * v12;
    v33 = v27;
  }
  else
  {
    Scale = CGAffineTransformMakeScale(&v54, v27 / BEWebViewMinimumZoomScale, v27 / BEWebViewMinimumZoomScale);
    v34 = 1;
    v35 = v33;
  }
  *((_BYTE *)&self->_lastCompletedTransition + 4) = v34;
  if (v32 <= 50000000)
  {
    objc_msgSend(v25, "sizeForSpread:landscape:", v17, isPortrait(Scale) ^ 1);
    if (v13)
    {
      v36 = CGSizeZero.width;
      v37 = CGSizeZero.height;
    }
    -[BKPictureBookView setIdealSinglePageSize:](self->_bookView, "setIdealSinglePageSize:", v36, v37, CGSizeZero.width, CGSizeZero.height);
    bookView = self->_bookView;
    v50 = v54;
    -[BKPictureBookView setTransform:](bookView, "setTransform:", &v50);
    objc_msgSend(v25, "maximumSize");
    v40 = v39;
    -[BKPictureBookView setScale:](self->_bookView, "setScale:", v33);
    -[BKPictureBookView setFrame:](self->_bookView, "setFrame:", x, y, width, height);
    -[BKPictureBookView setNeedsLayout](self->_bookView, "setNeedsLayout");
    -[BKPageCurlManager setScale:](self->_pageCurlManager, "setScale:", v33);
    -[BKPictureBookScrollView setContentSize:](self->_scrollView, "setContentSize:", width, height + -2.0);
    if (*((_BYTE *)&self->_lastCompletedTransition + 4))
    {
      -[BKPictureBookScrollView zoomScale](self->_scrollView, "zoomScale");
    }
    else
    {
      v41 = v35 / v33;
      if (v17)
        v41 = 1.0;
    }
    -[BKPictureBookScrollView setMinimumZoomScale:](self->_scrollView, "setMinimumZoomScale:", v41);
    if (-[BKPictureBookNavigationController _allowZoom](self, "_allowZoom"))
      v42 = fmax(v40 / v4 + v40 / v4, 2.0) / v33;
    else
      -[BKPictureBookScrollView minimumZoomScale](self->_scrollView, "minimumZoomScale");
    -[BKPictureBookScrollView setMaximumZoomScale:](self->_scrollView, "setMaximumZoomScale:", v42);
    -[BKPictureBookNavigationController updateUpsellZoomScale](self, "updateUpsellZoomScale");
    v43 = objc_opt_class(BKPictureBookContentViewController);
    v44 = BUDynamicCast(v43, self->_rightContentViewController);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    -[BKPictureBookNavigationController _applyAdditionalScale:](self, "_applyAdditionalScale:", v45);
    v46 = objc_opt_class(BKPictureBookContentViewController);
    v47 = BUDynamicCast(v46, self->_pendingLoads);
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);

    -[BKPictureBookNavigationController _applyAdditionalScale:](self, "_applyAdditionalScale:", v48);
  }

}

- (void)_resetCurlContainer
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned int v6;
  UIView *lastCurlUnderPageView;
  id v8;

  if (-[BKPictureBookNavigationController isContentRenderComplete](self, "isContentRenderComplete"))
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageCurlManager](self, "pageCurlManager"));
    if (objc_msgSend(v8, "numberOfQueuedCurls"))
    {

      return;
    }
    v3 = objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageSlideAnimation](self, "pageSlideAnimation"));
    if (v3)
    {
      v4 = (void *)v3;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageSlideAnimation](self, "pageSlideAnimation"));
      v6 = objc_msgSend(v5, "finished");

      if (!v6)
        return;
    }
    else
    {

    }
    lastCurlUnderPageView = self->_lastCurlUnderPageView;
    self->_lastCurlUnderPageView = 0;

    -[BKPageCurlManager reset](self->_pageCurlManager, "reset");
    -[BKPageCurlManager setHidden:](self->_pageCurlManager, "setHidden:", 1);
  }
}

- (CGRect)_resetCurlContainerFrame
{
  id v3;
  void *v4;
  BKPictureBookScrollView *scrollView;
  double v6;
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
  double v17;
  double v18;
  CGRect result;

  v3 = -[BKPictureBookNavigationController curlContainer](self, "curlContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookView contentView](self->_bookView, "contentView"));
  scrollView = self->_scrollView;
  objc_msgSend(v4, "bounds");
  -[BKPictureBookScrollView convertRect:fromView:](scrollView, "convertRect:fromView:", v4);
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
  objc_msgSend(v4, "bounds");
  objc_msgSend(v10, "convertRect:fromView:", v4);
  v12 = v11;
  v14 = v13;

  -[BKPageCurlManager setFrame:](self->_pageCurlManager, "setFrame:", v7, v9, v12, v14);
  v15 = v7;
  v16 = v9;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)curlContainer
{
  BKPageCurlManager *pageCurlManager;
  BKPictureBookCurlContainerView *v4;
  BKPageCurlManager *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  _BOOL8 v11;
  _BOOL8 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  _BOOL8 v18;
  double v19;

  pageCurlManager = self->_pageCurlManager;
  if (!pageCurlManager)
  {
    v4 = -[BKPictureBookCurlContainerView initWithFrame:]([BKPictureBookCurlContainerView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_pageCurlManager;
    self->_pageCurlManager = (BKPageCurlManager *)v4;

    -[BKPageCurlManager setAutoresizingMask:](self->_pageCurlManager, "setAutoresizingMask:", 18);
    -[BKPageCurlManager setUserInteractionEnabled:](self->_pageCurlManager, "setUserInteractionEnabled:", 0);
    -[BKPageCurlManager setHidden:](self->_pageCurlManager, "setHidden:", 1);
    -[BKPageCurlManager setOpaque:](self->_pageCurlManager, "setOpaque:", 1);
    -[BKPageCurlManager setClipsToBounds:](self->_pageCurlManager, "setClipsToBounds:", 0);
    -[BKPageCurlManager setDrawsSpine:](self->_pageCurlManager, "setDrawsSpine:", -[BKPictureBookNavigationController drawsSpine](self, "drawsSpine"));
    -[BKPictureBookNavigationController contentSize](self, "contentSize");
    v7 = v6;
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController thumbnailBookViewConfiguration](self, "thumbnailBookViewConfiguration"));
    v11 = -[BKPictureBookNavigationController drawsSpine](self, "drawsSpine");
    v12 = -[BKPictureBookNavigationController supportsSinglePageMode](self, "supportsSinglePageMode");
    -[BKPictureBookNavigationController _containerBoundsForGeometry](self, "_containerBoundsForGeometry");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:", v10, v11, v12, v7, v9, v13, v14, v15, v16));

    v18 = -[BKPictureBookNavigationController isZoomedToSpread](self, "isZoomedToSpread");
    objc_msgSend(v17, "scaleForSpread:landscape:", v18, isPortrait(v18) ^ 1);
    if (v19 < BEWebViewMinimumZoomScale)
      v19 = BEWebViewMinimumZoomScale;
    -[BKPageCurlManager setScale:](self->_pageCurlManager, "setScale:", v19);
    -[BKPictureBookView addSubview:](self->_bookView, "addSubview:", self->_pageCurlManager);

    pageCurlManager = self->_pageCurlManager;
  }
  return pageCurlManager;
}

- (void)_resetSinglePageCurlContainer
{
  -[BKPictureBookNavigationController _resetSinglePageCurlContainer:](self, "_resetSinglePageCurlContainer:", 0);
}

- (void)_resetSinglePageCurlContainer:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageCurlManager](self, "pageCurlManager", a3));
  v5 = objc_msgSend(v4, "numberOfQueuedCurls");

  if (!v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController singlePageCurlContainer](self, "singlePageCurlContainer"));
    objc_msgSend(v6, "setHidden:", 1);

  }
}

- (CGRect)_resetSinglePageCurlContainerFrame
{
  void *v3;
  BKPictureBookScrollView *scrollView;
  double v5;
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
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookView contentView](self->_bookView, "contentView"));
  scrollView = self->_scrollView;
  objc_msgSend(v3, "bounds");
  -[BKPictureBookScrollView convertRect:fromView:](scrollView, "convertRect:fromView:", v3);
  v6 = v5;
  -[BKPictureBookScrollView contentOffset](self->_scrollView, "contentOffset");
  if (v7 <= 0.0)
  {
    -[BKPictureBookScrollView contentOffset](self->_scrollView, "contentOffset");
    v10 = v11;
  }
  else
  {
    objc_msgSend(v3, "frame");
    v9 = v8;
    objc_msgSend(v3, "frame");
    v10 = v9 + CGRectGetMidX(v21);
  }
  -[BKPictureBookView idealSinglePageSize](self->_bookView, "idealSinglePageSize");
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController singlePageCurlContainer](self, "singlePageCurlContainer"));
  objc_msgSend(v16, "setFrame:", v10, v6, v13, v15);

  v17 = v10;
  v18 = v6;
  v19 = v13;
  v20 = v15;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)_backPageCurlFrame
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookView contentView](self->_bookView, "contentView"));
  objc_msgSend(v3, "frame");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController singlePageCurlContainer](self, "singlePageCurlContainer"));
  objc_msgSend(v6, "origin");
  v8 = v7;

  if (v8 > 0.0)
    v5 = -v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController singlePageCurlContainer](self, "singlePageCurlContainer"));
  objc_msgSend(v9, "bounds");
  v19 = CGRectOffset(v18, v5, 0.0);
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;

  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_autoCurlToSpreadPageOffset:(int64_t)a3 forwardCurl:(BOOL)a4
{
  _BOOL8 v4;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  _BOOL8 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  _BOOL8 v16;
  _BOOL8 v17;
  _BOOL8 v18;
  _BOOL8 v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  id v30;
  BKPictureBookCurlState *v31;
  int64_t v32;
  void *v33;
  void *v34;
  BKContentViewController *v35;
  void *v36;
  void *v37;
  void *v38;
  BKContentViewController *leftContentViewController;
  int64_t v40;
  BKPictureBookCurlState *v41;

  v4 = a4;
  v40 = -[BKPageNavigationViewController leftPageNumberForSpreadPageOffset:](self, "leftPageNumberForSpreadPageOffset:", -[BKPageNavigationViewController pageOffset](self, "pageOffset"));
  v7 = -[BKPageNavigationViewController rightPageNumberForSpreadPageOffset:](self, "rightPageNumberForSpreadPageOffset:", -[BKPageNavigationViewController pageOffset](self, "pageOffset"));
  v8 = -[BKPageNavigationViewController leftPageNumberForSpreadPageOffset:](self, "leftPageNumberForSpreadPageOffset:", a3);
  v9 = -[BKPageNavigationViewController rightPageNumberForSpreadPageOffset:](self, "rightPageNumberForSpreadPageOffset:", a3);
  v41 = objc_opt_new(BKPictureBookCurlState);
  v10 = -[BKPictureBookNavigationController isZoomedToSpread](self, "isZoomedToSpread");
  -[BKPictureBookNavigationController contentSize](self, "contentSize");
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController thumbnailBookViewConfiguration](self, "thumbnailBookViewConfiguration"));
  v16 = -[BKPictureBookNavigationController drawsSpine](self, "drawsSpine");
  v17 = -[BKPictureBookNavigationController supportsSinglePageMode](self, "supportsSinglePageMode");
  -[BKPictureBookNavigationController _containerBoundsForGeometry](self, "_containerBoundsForGeometry");
  v18 = v16;
  v19 = v4;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:", v15, v18, v17, v12, v14, v20, v21, v22, v23));

  objc_msgSend(v24, "scaleForSpread:landscape:", v10, isPortrait(v25) ^ 1);
  if (v26 >= BEWebViewMinimumZoomScale)
    v27 = v26;
  else
    v27 = BEWebViewMinimumZoomScale;
  -[BKPageCurlManager setScale:](self->_pageCurlManager, "setScale:", v27);
  -[BKPictureBookNavigationController _resetCurlContainerFrame](self, "_resetCurlContainerFrame");
  -[BKPictureBookCurlState setScale:](v41, "setScale:", v27);
  -[BKPictureBookCurlState setCurlContainer:](v41, "setCurlContainer:", self->_pageCurlManager);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
  -[BKPictureBookCurlState setNavDelegate:](v41, "setNavDelegate:", v28);

  -[BKPictureBookCurlState setForwardCurl:](v41, "setForwardCurl:", v4);
  -[BKPictureBookCurlState setAutoCurl:](v41, "setAutoCurl:", 1);
  -[BKPictureBookCurlState setApplyMaskAndGutter:](v41, "setApplyMaskAndGutter:", -[BKPictureBookNavigationController drawsSpine](self, "drawsSpine"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageCurlManager](self, "pageCurlManager"));
  v30 = objc_msgSend(v29, "numberOfQueuedCurls");

  v32 = v40;
  v31 = v41;
  if (!v30)
  {
    if (-[BKContentViewController isContentLoaded](self->_rightContentViewController, "isContentLoaded"))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self->_rightContentViewController, "view"));
      -[BKPictureBookCurlState setLeftSourceView:](v41, "setLeftSourceView:", v33);

    }
    if (-[NSMutableSet isContentLoaded](self->_pendingLoads, "isContentLoaded"))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet view](self->_pendingLoads, "view"));
      -[BKPictureBookCurlState setRightSourceView:](v41, "setRightSourceView:", v34);

    }
    -[BKPictureBookView setLeftContentView:](self->_bookView, "setLeftContentView:", 0);
    -[BKPictureBookView setRightContentView:](self->_bookView, "setRightContentView:", 0);
    v31 = v41;
    v32 = v40;
  }
  -[BKPictureBookCurlState generateWithOldLeftPageNumber:oldRightPageNumber:newLeftPageNumber:newRightPageNumber:](v31, "generateWithOldLeftPageNumber:oldRightPageNumber:newLeftPageNumber:newRightPageNumber:", v32, v7, v8, v9);
  if (LOBYTE(self->_swipeSelector)
    && (v35 = self->_leftContentViewController) != 0
    && -[BKContentViewController isForwardCurl](v35, "isForwardCurl") == v4)
  {
    -[BKContentViewController finishManualCurlAtPostion:](self->_leftContentViewController, "finishManualCurlAtPostion:", 0.0, 0.0);
    leftContentViewController = self->_leftContentViewController;
    self->_leftContentViewController = 0;

    LOBYTE(self->_swipeSelector) = 0;
  }
  else
  {
    -[BKPictureBookNavigationController curlPageForReadAloud:](self, "curlPageForReadAloud:", 0);
    *(_QWORD *)&self->_canFitToWidth = 0x7FFFFFFFFFFFFFFFLL;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageCurlManager](self, "pageCurlManager"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlState pageArray](v41, "pageArray"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookCurlState backPage](v41, "backPage"));
    objc_msgSend(v36, "curlPages:backPage:inContainer:curlPage:", v37, v38, self->_pageCurlManager, v19);

  }
}

- (void)_autoCurlToSinglePageOffset:(int64_t)a3 forwardCurl:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat x;
  BKPageBookCurlView *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  unsigned int v14;
  BKPictureBookView *bookView;
  uint64_t v16;
  void *v17;
  void *v18;
  UIImage *ImageFromCurrentImageContext;
  void *v20;
  void *v21;
  int64_t v22;
  int64_t v23;
  BOOL v24;
  int v25;
  BKPageBookCurlView *v26;
  BKPageBookCurlView *v27;
  void *v28;
  void *v29;
  BKPageSlide *v30;
  _BOOL8 v31;
  void *v32;
  unsigned int v33;
  _QWORD v34[4];
  BKPageBookCurlView *v35;
  CGSize v36;
  CGRect v37;

  v4 = a4;
  if (LOBYTE(self->_swipeSelector)
    && (x = self->_manualCurlStartPosition.x, x != 0.0)
    && objc_msgSend(*(id *)&x, "forwardCurl") == a4)
  {
    objc_msgSend(*(id *)&self->_manualCurlStartPosition.x, "finishManualCurl");
    LOBYTE(self->_swipeSelector) = 0;
  }
  else
  {
    -[BKPictureBookNavigationController _resetSinglePageCurlContainerFrame](self, "_resetSinglePageCurlContainerFrame");
    v8 = -[BKPageBookCurlView initWithImage:borderColor:isLeft:]([BKPageBookCurlView alloc], "initWithImage:borderColor:isLeft:", 0, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController theme](self, "theme"));
    -[BKPageBookCurlView setUseInvertedColors:](v8, "setUseInvertedColors:", objc_msgSend(v9, "shouldInvertContent"));

    -[BKPageCurl bounds](self->_manualCurl, "bounds");
    -[BKPageBookCurlView setFrame:](v8, "setFrame:");
    -[BKPageBookCurlView bounds](v8, "bounds");
    v11 = v10;
    v13 = v12;
    v14 = -[BKPictureBookNavigationController isZoomedToRightPage](self, "isZoomedToRightPage");
    bookView = self->_bookView;
    if (v14)
      v16 = objc_claimAutoreleasedReturnValue(-[BKPictureBookView leftContentView](bookView, "leftContentView"));
    else
      v16 = objc_claimAutoreleasedReturnValue(-[BKPictureBookView rightContentView](bookView, "rightContentView"));
    v17 = (void *)v16;
    if (v16)
    {
      -[BKPageBookCurlView takeSnapshotOfView:](v8, "takeSnapshotOfView:", v16);
    }
    else
    {
      v36.width = v11;
      v36.height = v13;
      UIGraphicsBeginImageContextWithOptions(v36, 1, 0.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      objc_msgSend(v18, "setFill");

      v37.origin.x = 0.0;
      v37.origin.y = 0.0;
      v37.size.width = v11;
      v37.size.height = v13;
      UIRectFill(v37);
      ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
      v20 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
      -[BKPageBookCurlView setImage:](v8, "setImage:", v20);

      UIGraphicsEndImageContext();
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v8, 0));
    v22 = -[BKViewController layoutDirection](self, "layoutDirection");
    v23 = v22;
    if (HIBYTE(self->_lastCompletedTransition))
      v24 = 0;
    else
      v24 = v22 == 1;
    v25 = v24;
    v33 = v25 ^ v4;
    if (HIBYTE(self->_lastCompletedTransition))
    {
      v26 = 0;
      if (v4)
        goto LABEL_19;
    }
    v27 = -[BKPageBookCurlView initWithImage:borderColor:isLeft:]([BKPageBookCurlView alloc], "initWithImage:borderColor:isLeft:", 0, 0, 0);
    -[BKPictureBookNavigationController _backPageCurlFrame](self, "_backPageCurlFrame");
    -[BKPageBookCurlView setFrame:](v27, "setFrame:");
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController theme](self, "theme"));
    -[BKPageBookCurlView setUseInvertedColors:](v27, "setUseInvertedColors:", objc_msgSend(v28, "shouldInvertContent"));

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_C188;
    v34[3] = &unk_1BEAB0;
    v26 = v27;
    v35 = v26;
    objc_msgSend(v29, "pageNavigationSnapshotForPageNumber:completion:", a3 + 1, v34);

    if (HIBYTE(self->_lastCompletedTransition))
    {
LABEL_19:
      v30 = (BKPageSlide *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageCurlManager](self, "pageCurlManager"));
      -[BKPageSlide curlPages:backPage:inContainer:curlPage:](v30, "curlPages:backPage:inContainer:curlPage:", v21, v26, self->_manualCurl, v33);
    }
    else
    {
      v31 = v23 == 1;
      v30 = objc_alloc_init(BKPageSlide);
      -[BKPageAnimation setPageAnimationDelegate:](v30, "setPageAnimationDelegate:", self);
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v26));
      -[BKPageSlide autoSlideFromPages:toPages:inContainer:isForwardAnimation:isRTL:isZoomedToSpread:completion:](v30, "autoSlideFromPages:toPages:inContainer:isForwardAnimation:isRTL:isZoomedToSpread:completion:", v21, v32, self->_manualCurl, v33, v31, 0, 0);

    }
  }
}

- (void)_timeOutWaitingForPaint
{
  id v3;
  NSObject *v4;
  double desiredScale;
  double v6;
  uint8_t v7[16];

  v3 = _AEWKPictureBookLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "Timed out on painting content for curl. showing destination now", v7, 2u);
  }

  desiredScale = self->_desiredScale;
  if (desiredScale != 0.0)
  {
    objc_msgSend(*(id *)&desiredScale, "removeFromSuperview");
    v6 = self->_desiredScale;
    self->_desiredScale = 0.0;

  }
}

- (void)_manualCurlToSinglePage:(CGPoint)a3
{
  double y;
  double x;
  CGFloat v6;
  CGFloat v7;
  UIView *lastCurlUnderPageView;
  double v9;
  double v10;
  double width;
  double height;
  double MidX;
  int v14;
  int64_t v15;
  unsigned int v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  BKPageBookCurlView *v23;
  void *v24;
  BKPictureBookView *bookView;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  UIImage *ImageFromCurrentImageContext;
  void *v31;
  void *v32;
  BKPageBookCurlView *v33;
  void *v34;
  void *v35;
  BKPageBookCurlView *v36;
  BKPageBookCurlView *v37;
  BKPageBookCurlView *v38;
  void *v39;
  CGFloat v40;
  CGFloat v41;
  BKPageSlide *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  BKPageBookCurlView *v47;
  CGSize v48;
  CGRect v49;
  CGRect v50;

  y = a3.y;
  x = a3.x;
  v6 = self->_manualCurlStartPosition.x;
  if (v6 != 0.0)
  {
    objc_msgSend(*(id *)&v6, "killCurl");
    v7 = self->_manualCurlStartPosition.x;
    self->_manualCurlStartPosition.x = 0.0;

  }
  lastCurlUnderPageView = self->_lastCurlUnderPageView;
  self->_lastCurlUnderPageView = 0;

  -[BKPageCurl bounds](self->_manualCurl, "bounds");
  v9 = v49.origin.x;
  v10 = v49.origin.y;
  width = v49.size.width;
  height = v49.size.height;
  MidX = CGRectGetMidX(v49);
  v14 = x > MidX;
  v15 = -[BKViewController layoutDirection](self, "layoutDirection");
  v16 = v15 == 1;
  v17 = -[BKPictureBookNavigationController isZoomedToRightPage](self, "isZoomedToRightPage");
  v18 = -[BKPageNavigationViewController pageOffset](self, "pageOffset");
  v19 = v18;
  if (v14 == v16)
  {
    if (v18 <= 1)
      v22 = 1;
    else
      v22 = v18;
  }
  else
  {
    v20 = v18 + 1;
    v21 = (char *)-[BKPageNavigationViewController pageCount](self, "pageCount") - 1;
    if (v20 < (uint64_t)v21)
      v21 = (char *)(v19 + 1);
    v22 = (uint64_t)(v21 + 1);
  }
  -[BKPictureBookNavigationController slide:animated:withDelay:](self, "slide:animated:withDelay:", v17, 0, 0.0);
  -[BKPictureBookNavigationController _resetSinglePageCurlContainerFrame](self, "_resetSinglePageCurlContainerFrame");
  v23 = -[BKPageBookCurlView initWithImage:borderColor:isLeft:]([BKPageBookCurlView alloc], "initWithImage:borderColor:isLeft:", 0, 0, 0);
  -[BKPageBookCurlView setFrame:](v23, "setFrame:", v9, v10, width, height);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController theme](self, "theme"));
  -[BKPageBookCurlView setUseInvertedColors:](v23, "setUseInvertedColors:", objc_msgSend(v24, "shouldInvertContent"));

  bookView = self->_bookView;
  if (v17)
    v26 = objc_claimAutoreleasedReturnValue(-[BKPictureBookView rightContentView](bookView, "rightContentView"));
  else
    v26 = objc_claimAutoreleasedReturnValue(-[BKPictureBookView leftContentView](bookView, "leftContentView"));
  v27 = (void *)v26;
  v28 = v14 ^ v16;
  if (v26)
  {
    -[BKPageBookCurlView takeSnapshotOfView:](v23, "takeSnapshotOfView:", v26);
  }
  else
  {
    v48.width = width;
    v48.height = height;
    UIGraphicsBeginImageContextWithOptions(v48, 1, 0.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v29, "setFill");

    v50.origin.x = 0.0;
    v50.origin.y = 0.0;
    v50.size.width = width;
    v50.size.height = height;
    UIRectFill(v50);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v31 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    -[BKPageBookCurlView setImage:](v23, "setImage:", v31);

    UIGraphicsEndImageContext();
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v23, 0));
  v33 = -[BKPageBookCurlView initWithImage:borderColor:isLeft:]([BKPageBookCurlView alloc], "initWithImage:borderColor:isLeft:", 0, 0, 0);
  -[BKPageBookCurlView setFrame:](v33, "setFrame:", v9, v10, width, height);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController theme](self, "theme"));
  -[BKPageBookCurlView setUseInvertedColors:](v33, "setUseInvertedColors:", objc_msgSend(v34, "shouldInvertContent"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_C6A8;
  v46[3] = &unk_1BEAB0;
  v36 = v33;
  v47 = v36;
  objc_msgSend(v35, "pageNavigationSnapshotForPageNumber:completion:", v22, v46);

  if ((_DWORD)v28)
    v37 = v23;
  else
    v37 = v36;
  v38 = v37;
  -[BKPageCurl bounds](self->_manualCurl, "bounds");
  -[BKPageBookCurlView setFrame:](v23, "setFrame:");
  -[BKPictureBookNavigationController _backPageCurlFrame](self, "_backPageCurlFrame");
  -[BKPageBookCurlView setFrame:](v36, "setFrame:");
  if (HIBYTE(self->_lastCompletedTransition))
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageCurlManager](self, "pageCurlManager"));
    v40 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "beginManualCurl:atLocation:inPage:fromPages:backPage:inContainer:", v28, v38, v32, v36, self->_manualCurl, x, y)));
    v41 = self->_manualCurlStartPosition.x;
    self->_manualCurlStartPosition.x = v40;

  }
  else
  {
    v42 = objc_alloc_init(BKPageSlide);
    -[BKPictureBookNavigationController setPageSlideAnimation:](self, "setPageSlideAnimation:", v42);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageSlideAnimation](self, "pageSlideAnimation"));
    objc_msgSend(v43, "setPageAnimationDelegate:", self);

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageSlideAnimation](self, "pageSlideAnimation"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v36));
    objc_msgSend(v44, "initiateManualAnimationFromPages:toPages:inContainer:isForwardAnimation:isRTL:isZoomedToSpread:", v32, v45, self->_manualCurl, x > MidX, v15 == 1, 0);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageSlideAnimation](self, "pageSlideAnimation"));
    objc_msgSend(v39, "beginManualAnimationAtLocation:", x, y);
  }

  self->_manualCurlStartPosition.y = x;
  *(double *)&self->_pageOffsetToRestore = y;

}

- (void)_curlPageForReadAloud:(id)a3
{
  -[BKPictureBookNavigationController curlPageForReadAloud:](self, "curlPageForReadAloud:", objc_msgSend(a3, "BOOLValue"));
}

- (void)curlPageForReadAloud:(BOOL)a3
{
  void *v4;
  id v5;
  BKContentViewController *v6;
  int64_t v7;
  double Width;
  unint64_t v9;
  void *v10;
  char *v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  BKPictureBookCurlState *v16;
  BKContentViewController *leftContentViewController;
  void *v18;
  unsigned int v19;
  double v20;
  _BOOL8 v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  _BOOL8 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  unint64_t v37;
  double v38;
  double Height;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int64_t v55;
  id v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageCurlManager](self, "pageCurlManager"));
    v5 = objc_msgSend(v4, "numberOfQueuedCurls");

    if (v5)
    {
      self->_singlePageCurlContainer = (UIView *)"_curlPageForReadAloud:";
    }
    else
    {
      if (!-[BKPictureBookNavigationController isZoomedToSinglePage](self, "isZoomedToSinglePage"))
        -[BKPictureBookNavigationController zoomToSpread:](self, "zoomToSpread:", 1);
      v7 = -[BKViewController layoutDirection](self, "layoutDirection");
      if (-[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode"))
      {
        if (v7 == 1)
        {
          Width = 0.0;
          *(double *)&v9 = 50.0;
        }
        else
        {
          -[BKPageCurl bounds](self->_manualCurl, "bounds");
          Width = CGRectGetWidth(v57);
          *(double *)&v9 = -50.0;
        }
        v38 = *(double *)&v9;
        -[BKPageCurl bounds](self->_manualCurl, "bounds");
        Height = CGRectGetHeight(v58);
        -[BKPictureBookNavigationController _manualCurlToSinglePage:](self, "_manualCurlToSinglePage:", Width, Height);
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageCurlManager](self, "pageCurlManager"));
        objc_msgSend(v40, "updateManualCurl:toLocation:", *(_QWORD *)&self->_manualCurlStartPosition.x, v38 + Width, Height + -50.0);

        LOBYTE(self->_swipeSelector) = 1;
      }
      else if (!self->_leftContentViewController)
      {
        v56 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController curlContainer](self, "curlContainer"));
        -[BKPictureBookNavigationController _resetCurlContainerFrame](self, "_resetCurlContainerFrame");
        -[BKContentViewController cancelManualCurl](self->_leftContentViewController, "cancelManualCurl");
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageCurlManager](self, "pageCurlManager"));
        objc_msgSend(v10, "killAllCurls");

        v11 = (char *)-[BKPageNavigationViewController pageOffset](self, "pageOffset") + 2;
        v12 = -[BKPageNavigationViewController pageCount](self, "pageCount");
        if ((uint64_t)v11 >= v12 - 1)
          v11 = (char *)(v12 - 1);
        v55 = -[BKPageNavigationViewController leftPageNumberForSpreadPageOffset:](self, "leftPageNumberForSpreadPageOffset:", -[BKPageNavigationViewController pageOffset](self, "pageOffset"));
        v13 = -[BKPageNavigationViewController rightPageNumberForSpreadPageOffset:](self, "rightPageNumberForSpreadPageOffset:", -[BKPageNavigationViewController pageOffset](self, "pageOffset"));
        v14 = -[BKPageNavigationViewController leftPageNumberForSpreadPageOffset:](self, "leftPageNumberForSpreadPageOffset:", v11);
        v15 = -[BKPageNavigationViewController rightPageNumberForSpreadPageOffset:](self, "rightPageNumberForSpreadPageOffset:", v11);
        v16 = objc_opt_new(BKPictureBookCurlState);
        leftContentViewController = self->_leftContentViewController;
        self->_leftContentViewController = (BKContentViewController *)v16;

        -[BKContentViewController setCurlContainer:](self->_leftContentViewController, "setCurlContainer:", v56);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
        -[BKContentViewController setNavDelegate:](self->_leftContentViewController, "setNavDelegate:", v18);

        -[BKContentViewController setForwardCurl:](self->_leftContentViewController, "setForwardCurl:", -[BKViewController layoutDirection](self, "layoutDirection") == 0);
        v19 = -[BKPictureBookNavigationController isZoomedToSpread](self, "isZoomedToSpread");
        v20 = 0.25;
        if (v19)
          v20 = 0.5;
        -[BKContentViewController setCurlThreshold:](self->_leftContentViewController, "setCurlThreshold:", v20);
        -[BKContentViewController setApplyMaskAndGutter:](self->_leftContentViewController, "setApplyMaskAndGutter:", -[BKPictureBookNavigationController drawsSpine](self, "drawsSpine"));
        v21 = -[BKPictureBookNavigationController isZoomedToSpread](self, "isZoomedToSpread");
        -[BKPictureBookNavigationController contentSize](self, "contentSize");
        v23 = v22;
        v25 = v24;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController thumbnailBookViewConfiguration](self, "thumbnailBookViewConfiguration"));
        v27 = -[BKPictureBookNavigationController drawsSpine](self, "drawsSpine");
        -[BKPictureBookNavigationController _containerBoundsForGeometry](self, "_containerBoundsForGeometry");
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:containerBounds:", v26, v27, v23, v25, v28, v29, v30, v31));

        objc_msgSend(v32, "scaleForSpread:landscape:", v21, isPortrait(v33) ^ 1);
        if (v34 >= BEWebViewMinimumZoomScale)
          v35 = v34;
        else
          v35 = BEWebViewMinimumZoomScale;
        objc_msgSend(v56, "setScale:", v35);
        -[BKContentViewController setScale:](self->_leftContentViewController, "setScale:", v35);
        -[BKContentViewController generateWithOldLeftPageNumber:oldRightPageNumber:newLeftPageNumber:newRightPageNumber:](self->_leftContentViewController, "generateWithOldLeftPageNumber:oldRightPageNumber:newLeftPageNumber:newRightPageNumber:", v55, v13, v14, v15);
        if (v7 == 1)
        {
          v36 = 0.0;
          *(double *)&v37 = 50.0;
        }
        else
        {
          objc_msgSend(v56, "bounds");
          v36 = CGRectGetWidth(v59);
          *(double *)&v37 = -50.0;
        }
        v41 = *(double *)&v37;
        objc_msgSend(v56, "bounds");
        v42 = CGRectGetHeight(v60);
        -[BKContentViewController startManualCurlAtPostion:](self->_leftContentViewController, "startManualCurlAtPostion:", v36, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self->_rightContentViewController, "view"));
        -[BKContentViewController setLeftSourceView:](self->_leftContentViewController, "setLeftSourceView:", v43);

        v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet view](self->_pendingLoads, "view"));
        -[BKContentViewController setRightSourceView:](self->_leftContentViewController, "setRightSourceView:", v44);

        -[BKPictureBookView setLeftContentView:](self->_bookView, "setLeftContentView:", 0);
        -[BKPictureBookView setRightContentView:](self->_bookView, "setRightContentView:", 0);
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageCurlManager](self, "pageCurlManager"));
        v46 = -[BKContentViewController isForwardCurl](self->_leftContentViewController, "isForwardCurl");
        -[BKContentViewController manualCurlStartPosition](self->_leftContentViewController, "manualCurlStartPosition");
        v48 = v47;
        v50 = v49;
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController curlPage](self->_leftContentViewController, "curlPage"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController pageArray](self->_leftContentViewController, "pageArray"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController backPage](self->_leftContentViewController, "backPage"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "beginManualCurl:atLocation:inPage:fromPages:backPage:inContainer:", v46, v51, v52, v53, self->_pageCurlManager, v48, v50));
        -[BKContentViewController setPageCurl:](self->_leftContentViewController, "setPageCurl:", v54);

        -[BKContentViewController updateManualCurlToPosition:](self->_leftContentViewController, "updateManualCurlToPosition:", v41 + v36, v42 + -50.0);
        LOBYTE(self->_swipeSelector) = 1;

      }
    }
  }
  else
  {
    objc_msgSend(*(id *)&self->_manualCurlStartPosition.x, "cancelManualCurl");
    -[BKContentViewController cancelManualCurl](self->_leftContentViewController, "cancelManualCurl");
    v6 = self->_leftContentViewController;
    self->_leftContentViewController = 0;

    LOBYTE(self->_swipeSelector) = 0;
  }
}

- (BOOL)isManualCurlInProgress
{
  return self->_leftContentViewController || *(_QWORD *)&self->_manualCurlStartPosition.x != 0;
}

- (void)manualCurlGesture:(id)a3
{
  id v4;

  v4 = a3;
  if (-[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode"))
    -[BKPictureBookNavigationController handleSinglePageManualCurlGesture:](self, "handleSinglePageManualCurlGesture:", v4);
  else
    -[BKPictureBookNavigationController handleSpreadManualCurlGesture:](self, "handleSpreadManualCurlGesture:", v4);

}

- (void)handleSinglePageManualCurlGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  CGFloat v11;
  void *v12;
  void *v13;
  CGFloat x;
  unsigned int v15;
  CGFloat v16;
  int64_t v17;
  int64_t v18;
  CGFloat v19;
  CGFloat Width;
  UIView *lastCurlUnderPageView;
  unsigned int v22;
  int64_t v23;
  int64_t v24;
  id v25;
  CGRect v26;
  CGRect v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController singlePageCurlContainer](self, "singlePageCurlContainer"));
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = objc_msgSend(v4, "state");
  switch((unint64_t)v10)
  {
    case 1uLL:
      -[BKPictureBookNavigationController _manualCurlToSinglePage:](self, "_manualCurlToSinglePage:", v7, v9);
      break;
    case 2uLL:
      if (*(_QWORD *)&self->_manualCurlStartPosition.x)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageCurlManager](self, "pageCurlManager"));
        objc_msgSend(v12, "updateManualCurl:toLocation:", *(_QWORD *)&self->_manualCurlStartPosition.x, v7, v9);

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageSlideAnimation](self, "pageSlideAnimation"));

      if (v13)
      {
        v25 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageSlideAnimation](self, "pageSlideAnimation"));
        objc_msgSend(v25, "updateManualAnimationToLocation:", v7, v9);
        goto LABEL_10;
      }
      break;
    case 3uLL:
      x = self->_manualCurlStartPosition.x;
      if (x != 0.0)
      {
        v15 = objc_msgSend(*(id *)&x, "type");
        v16 = vabdd_f64(v7, self->_manualCurlStartPosition.y);
        -[BKPageCurl frame](self->_manualCurl, "frame");
        if (v16 <= CGRectGetWidth(v26) * 0.25)
        {
          objc_msgSend(*(id *)&self->_manualCurlStartPosition.x, "cancelManualCurl");
        }
        else
        {
          objc_msgSend(*(id *)&self->_manualCurlStartPosition.x, "finishManualCurl");
          v17 = -[BKPageNavigationViewController pageOffset](self, "pageOffset");
          if (v15 == 2)
            v18 = v17 + 1;
          else
            v18 = v17 - 1;
          -[BKPictureBookNavigationController setPageOffset:](self, "setPageOffset:", v18);
          -[BKPictureBookNavigationController _resetSinglePageCurlContainerFrame](self, "_resetSinglePageCurlContainerFrame");
        }
      }
      if (self->_lastCurlUnderPageView)
      {
        v19 = vabdd_f64(v7, self->_manualCurlStartPosition.y);
        -[BKPageCurl frame](self->_manualCurl, "frame");
        Width = CGRectGetWidth(v27);
        lastCurlUnderPageView = self->_lastCurlUnderPageView;
        if (v19 <= Width * 0.25)
        {
          -[UIView cancelManualAnimation](lastCurlUnderPageView, "cancelManualAnimation");
        }
        else
        {
          -[UIView finishManualAnimation](lastCurlUnderPageView, "finishManualAnimation");
          v22 = -[UIView isGoingToNextPage](self->_lastCurlUnderPageView, "isGoingToNextPage");
          v23 = -[BKPageNavigationViewController pageOffset](self, "pageOffset");
          if (v22)
            v24 = v23 + 1;
          else
            v24 = v23 - 1;
          -[BKPictureBookNavigationController setPageOffset:](self, "setPageOffset:", v24);
          -[BKPictureBookNavigationController _resetSinglePageCurlContainerFrame](self, "_resetSinglePageCurlContainerFrame");
        }
      }
      break;
    case 4uLL:
    case 5uLL:
      v11 = self->_manualCurlStartPosition.x;
      if (v11 != 0.0)
        objc_msgSend(*(id *)&v11, "cancelManualCurl");
      v25 = (id)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageSlideAnimation](self, "pageSlideAnimation"));
      objc_msgSend(v25, "cancelManualAnimation");
LABEL_10:

      break;
    default:
      return;
  }
}

- (unint64_t)_pageOffsetAfter:(int64_t)a3 whenCurlingForward:(BOOL)a4
{
  int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  void *v12;

  v6 = ((char *)-[BKViewController layoutDirection](self, "layoutDirection") == (char *)&dword_0 + 1) ^ a4;
  v7 = -[BKPictureBookNavigationController isZoomedToSpread](self, "isZoomedToSpread");
  v8 = 1;
  if (v7)
    v8 = 2;
  v9 = -2;
  if (!v7)
    v9 = -1;
  if (!v6)
    v8 = v9;
  v10 = v8 + a3;
  if (v6 == 1)
  {
    v11 = -[BKPageNavigationViewController pageCount](self, "pageCount");
    if (v10 >= v11 - 1)
      v10 = v11 - 1;
  }
  else
  {
    v10 &= ~(v10 >> 63);
  }
  v12 = -[BKPageNavigationViewController leftPageNumberForSpreadPageOffset:](self, "leftPageNumberForSpreadPageOffset:", v10);
  if (v12 == (void *)-[BKPageNavigationViewController leftPageNumberForSpreadPageOffset:](self, "leftPageNumberForSpreadPageOffset:", a3))return a3;
  else
    return v10;
}

- (void)handleSpreadManualCurlGesture:(id)a3
{
  _BOOL8 v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BKContentViewController *v10;
  void *v11;
  int *v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  int64_t v20;
  void *v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  int64_t v25;
  BKContentViewController *leftContentViewController;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  BKContentViewController *v45;
  void *v46;
  BKContentViewController *v47;
  BKPictureBookCurlState *v48;
  BKContentViewController *v49;
  id *p_pageCurlManager;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  int64_t v58;
  _BOOL8 v59;
  double v60;
  double v61;
  double v62;
  double v63;
  uint64_t v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  BKPageSlide *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  int64_t v75;
  int64_t v76;
  int64_t v77;
  int64_t v78;
  id v79;
  CGRect v80;

  v79 = a3;
  v4 = -[BKPictureBookNavigationController isZoomedToSpread](self, "isZoomedToSpread");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController curlContainer](self, "curlContainer"));
  objc_msgSend(v79, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  switch((unint64_t)objc_msgSend(v79, "state"))
  {
    case 1uLL:
      v12 = &OBJC_IVAR___BKPictureBookNavigationController__singlePageCurlContainer;
      if (v4)
        v12 = &OBJC_IVAR___BKPictureBookNavigationController__curlContainer;
      objc_msgSend(*(id *)&self->super.super.IMViewController_opaque[*v12], "bounds");
      v13 = v7 > CGRectGetMidX(v80);
      v14 = objc_opt_class(UIPanGestureRecognizer);
      v15 = BUDynamicCast(v14, v79);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController curlContainer](self, "curlContainer"));
        objc_msgSend(v16, "velocityInView:", v17);
        v19 = v18;

        v13 = v19 < 0.0;
      }
      v20 = -[BKViewController layoutDirection](self, "layoutDirection");
      v21 = -[BKPictureBookNavigationController _pageOffsetAfter:whenCurlingForward:](self, "_pageOffsetAfter:whenCurlingForward:", -[BKPageNavigationViewController pageOffset](self, "pageOffset"), v13);
      if (v21 == (void *)-[BKPageNavigationViewController pageOffset](self, "pageOffset"))
        goto LABEL_41;
      if (!v4)
        -[BKPictureBookNavigationController _resetSinglePageCurlContainerFrame](self, "_resetSinglePageCurlContainerFrame");
      -[BKPictureBookNavigationController _resetCurlContainerFrame](self, "_resetCurlContainerFrame");
      v22 = -[BKPageNavigationViewController leftPageNumberForSpreadPageOffset:](self, "leftPageNumberForSpreadPageOffset:", -[BKPageNavigationViewController pageOffset](self, "pageOffset"));
      v23 = -[BKPageNavigationViewController rightPageNumberForSpreadPageOffset:](self, "rightPageNumberForSpreadPageOffset:", -[BKPageNavigationViewController pageOffset](self, "pageOffset"));
      v24 = -[BKPageNavigationViewController leftPageNumberForSpreadPageOffset:](self, "leftPageNumberForSpreadPageOffset:", v21);
      v25 = -[BKPageNavigationViewController rightPageNumberForSpreadPageOffset:](self, "rightPageNumberForSpreadPageOffset:", v21);
      leftContentViewController = self->_leftContentViewController;
      if (leftContentViewController)
      {
        if (v13 != -[BKContentViewController isForwardCurl](leftContentViewController, "isForwardCurl"))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController pageCurl](self->_leftContentViewController, "pageCurl"));
          objc_msgSend(v27, "cancelManualCurl");
          goto LABEL_40;
        }
      }
      else
      {
        v48 = objc_opt_new(BKPictureBookCurlState);
        v49 = self->_leftContentViewController;
        self->_leftContentViewController = (BKContentViewController *)v48;

      }
      v75 = v20;
      v78 = v24;
      p_pageCurlManager = (id *)&self->_pageCurlManager;
      -[BKContentViewController setCurlContainer:](self->_leftContentViewController, "setCurlContainer:", self->_pageCurlManager);
      v77 = v25;
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
      -[BKContentViewController setNavDelegate:](self->_leftContentViewController, "setNavDelegate:", v51);

      -[BKContentViewController setForwardCurl:](self->_leftContentViewController, "setForwardCurl:", v13);
      -[BKContentViewController setApplyMaskAndGutter:](self->_leftContentViewController, "setApplyMaskAndGutter:", -[BKPictureBookNavigationController drawsSpine](self, "drawsSpine"));
      v52 = 0.25;
      if (v4)
        v52 = 0.5;
      -[BKContentViewController setCurlThreshold:](self->_leftContentViewController, "setCurlThreshold:", v52);
      -[BKPictureBookNavigationController contentSize](self, "contentSize");
      v54 = v53;
      v56 = v55;
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController thumbnailBookViewConfiguration](self, "thumbnailBookViewConfiguration"));
      v76 = v23;
      v58 = v22;
      v59 = -[BKPictureBookNavigationController drawsSpine](self, "drawsSpine");
      -[BKPictureBookNavigationController _containerBoundsForGeometry](self, "_containerBoundsForGeometry");
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:containerBounds:", v57, v59, v54, v56, v60, v61, v62, v63));

      objc_msgSend(v27, "scaleForSpread:landscape:", v4, isPortrait(v64) ^ 1);
      if (v65 >= BEWebViewMinimumZoomScale)
        v66 = v65;
      else
        v66 = BEWebViewMinimumZoomScale;
      objc_msgSend(*p_pageCurlManager, "setScale:", v66);
      -[BKContentViewController setScale:](self->_leftContentViewController, "setScale:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self->_rightContentViewController, "view"));
      -[BKContentViewController setLeftSourceView:](self->_leftContentViewController, "setLeftSourceView:", v67);

      v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet view](self->_pendingLoads, "view"));
      -[BKContentViewController setRightSourceView:](self->_leftContentViewController, "setRightSourceView:", v68);

      -[BKContentViewController generateWithOldLeftPageNumber:oldRightPageNumber:newLeftPageNumber:newRightPageNumber:](self->_leftContentViewController, "generateWithOldLeftPageNumber:oldRightPageNumber:newLeftPageNumber:newRightPageNumber:", v58, v76, v78, v77);
      if (HIBYTE(self->_lastCompletedTransition))
      {
        -[BKContentViewController startManualCurlAtPostion:](self->_leftContentViewController, "startManualCurlAtPostion:", v7, v9);
      }
      else
      {
        v69 = objc_alloc_init(BKPageSlide);
        -[BKPictureBookNavigationController setPageSlideAnimation:](self, "setPageSlideAnimation:", v69);

        v70 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageSlideAnimation](self, "pageSlideAnimation"));
        objc_msgSend(v70, "setPageAnimationDelegate:", self);

        v71 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageSlideAnimation](self, "pageSlideAnimation"));
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController pageArray](self->_leftContentViewController, "pageArray"));
        v73 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController backPageArray](self->_leftContentViewController, "backPageArray"));
        if (BYTE2(self->_lastCompletedTransition))
          p_pageCurlManager = (id *)&self->_manualCurl;
        objc_msgSend(v71, "initiateManualAnimationFromPages:toPages:inContainer:isForwardAnimation:isRTL:isZoomedToSpread:", v72, v73, *p_pageCurlManager, v13, v75 == 1, v4);

        v74 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageSlideAnimation](self, "pageSlideAnimation"));
        objc_msgSend(v74, "beginManualAnimationAtLocation:", v7, v9);

      }
LABEL_40:

LABEL_41:
LABEL_42:

      return;
    case 2uLL:
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self->_rightContentViewController, "view"));
      -[BKContentViewController setLeftSourceView:](self->_leftContentViewController, "setLeftSourceView:", v28);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet view](self->_pendingLoads, "view"));
      -[BKContentViewController setRightSourceView:](self->_leftContentViewController, "setRightSourceView:", v29);

      if (self->_leftContentViewController && !self->_lastCurlUnderPageView)
      {
        -[BKPictureBookView setLeftContentView:](self->_bookView, "setLeftContentView:", 0);
        -[BKPictureBookView setRightContentView:](self->_bookView, "setRightContentView:", 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController pageCurl](self->_leftContentViewController, "pageCurl"));

        if (!v30)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageCurlManager](self, "pageCurlManager"));
          v32 = -[BKContentViewController isForwardCurl](self->_leftContentViewController, "isForwardCurl");
          -[BKContentViewController manualCurlStartPosition](self->_leftContentViewController, "manualCurlStartPosition");
          v34 = v33;
          v36 = v35;
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController curlPage](self->_leftContentViewController, "curlPage"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController pageArray](self->_leftContentViewController, "pageArray"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController backPage](self->_leftContentViewController, "backPage"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "beginManualCurl:atLocation:inPage:fromPages:backPage:inContainer:", v32, v37, v38, v39, self->_pageCurlManager, v34, v36));
          -[BKContentViewController setPageCurl:](self->_leftContentViewController, "setPageCurl:", v40);

          v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self->_rightContentViewController, "view"));
          -[BKContentViewController setLeftSourceView:](self->_leftContentViewController, "setLeftSourceView:", v41);

          v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet view](self->_pendingLoads, "view"));
          -[BKContentViewController setRightSourceView:](self->_leftContentViewController, "setRightSourceView:", v42);

        }
        -[BKContentViewController updateManualCurlToPosition:](self->_leftContentViewController, "updateManualCurlToPosition:", v7, v9);
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController delegate](self, "delegate"));
        objc_msgSend(v43, "pageNavigationDidBeginInteracting:", self);

      }
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageSlideAnimation](self, "pageSlideAnimation"));
      objc_msgSend(v44, "updateManualAnimationToLocation:", v7, v9);

      goto LABEL_42;
    case 3uLL:
      v45 = self->_leftContentViewController;
      if (v45 && !self->_lastCurlUnderPageView)
      {
        -[BKContentViewController updateManualCurlToPosition:](v45, "updateManualCurlToPosition:", v7, v9);
        if (-[BKContentViewController finishManualCurlAtPostion:](self->_leftContentViewController, "finishManualCurlAtPostion:", v7, v9))
        {
          -[BKPictureBookNavigationController setPageOffset:](self, "setPageOffset:", -[BKPictureBookNavigationController _pageOffsetAfter:whenCurlingForward:](self, "_pageOffsetAfter:whenCurlingForward:", -[BKPageNavigationViewController pageOffset](self, "pageOffset"), -[BKContentViewController isForwardCurl](self->_leftContentViewController, "isForwardCurl")));
          if (!v4)
            -[BKPictureBookNavigationController slide:animated:withDelay:](self, "slide:animated:withDelay:", -[BKContentViewController isForwardCurl](self->_leftContentViewController, "isForwardCurl"), 1, 0.0);
        }
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController pageCurl](self->_leftContentViewController, "pageCurl"));

        if (!v46)
        {
          v47 = self->_leftContentViewController;
          self->_leftContentViewController = 0;

        }
      }
      if (self->_lastCurlUnderPageView)
      {
        -[BKPictureBookNavigationController setPageOffset:](self, "setPageOffset:", -[BKPictureBookNavigationController _pageOffsetAfter:whenCurlingForward:](self, "_pageOffsetAfter:whenCurlingForward:", -[BKPageNavigationViewController pageOffset](self, "pageOffset"), -[BKContentViewController isForwardCurl](self->_leftContentViewController, "isForwardCurl")));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageSlideAnimation](self, "pageSlideAnimation"));
        objc_msgSend(v11, "finishManualAnimation");
        goto LABEL_28;
      }
      goto LABEL_42;
    case 4uLL:
    case 5uLL:
      -[BKContentViewController cancelManualCurl](self->_leftContentViewController, "cancelManualCurl");
      v10 = self->_leftContentViewController;
      self->_leftContentViewController = 0;

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageSlideAnimation](self, "pageSlideAnimation"));
      objc_msgSend(v11, "cancelManualAnimation");
LABEL_28:

      -[BKPictureBookNavigationController setPageSlideAnimation:](self, "setPageSlideAnimation:", 0);
      goto LABEL_42;
    default:
      goto LABEL_42;
  }
}

- (void)_restoreViewHierarchyWithArray:(id)a3
{
  void *v4;
  void *v5;
  BKContentViewController *leftContentViewController;
  unsigned __int8 v7;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet view](self->_pendingLoads, "view"));
    -[BKPictureBookView setRightContentView:](self->_bookView, "setRightContentView:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self->_rightContentViewController, "view"));
    -[BKPictureBookView setLeftContentView:](self->_bookView, "setLeftContentView:", v5);

    leftContentViewController = self->_leftContentViewController;
    if (leftContentViewController)
    {
      v7 = -[BKContentViewController isAutoCurl](leftContentViewController, "isAutoCurl");
      leftContentViewController = self->_leftContentViewController;
      if ((v7 & 1) == 0)
      {
        -[BKContentViewController cancelManualCurl](leftContentViewController, "cancelManualCurl");
        leftContentViewController = self->_leftContentViewController;
      }
    }
    self->_leftContentViewController = 0;

  }
  -[BKPictureBookNavigationController _resetCurlContainer](self, "_resetCurlContainer");
}

- (void)_killSpreadManualCurl
{
  BKContentViewController *leftContentViewController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BKContentViewController *v9;

  leftContentViewController = self->_leftContentViewController;
  if (leftContentViewController
    && (-[BKContentViewController isAutoCurl](leftContentViewController, "isAutoCurl") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController pageCurl](self->_leftContentViewController, "pageCurl"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "existingPages"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet view](self->_pendingLoads, "view"));
      -[BKPictureBookView setRightContentView:](self->_bookView, "setRightContentView:", v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self->_rightContentViewController, "view"));
      -[BKPictureBookView setLeftContentView:](self->_bookView, "setLeftContentView:", v7);

      -[BKPictureBookView layoutIfNeeded](self->_bookView, "layoutIfNeeded");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController pageCurlManager](self, "pageCurlManager"));
      objc_msgSend(v8, "killAllCurls");

      v9 = self->_leftContentViewController;
      self->_leftContentViewController = 0;

      -[BKPictureBookNavigationController _resetCurlContainer](self, "_resetCurlContainer");
    }
  }
}

- (BOOL)bkLongPressGestureCanTransitionToRecognizedState:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  _BOOL4 v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  BOOL v18;
  int64_t v19;
  CGRect v21;
  CGRect v22;

  v4 = a3;
  v5 = -[BKViewController layoutDirection](self, "layoutDirection");
  if (-[BKPictureBookNavigationController inSinglePageMode](self, "inSinglePageMode"))
  {
    -[BKPictureBookNavigationController _resetSinglePageCurlContainerFrame](self, "_resetSinglePageCurlContainerFrame");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController view](self, "view"));
    objc_msgSend(v4, "locationInView:", v6);
    v8 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController view](self, "view"));
    objc_msgSend(v9, "frame");
    v10 = CGRectGetWidth(v21) + -22.0;

    v11 = 22.0;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookNavigationController curlContainer](self, "curlContainer"));
    objc_msgSend(v4, "locationInView:", v12);
    v8 = v13;

    -[BKPictureBookNavigationController _resetCurlContainerFrame](self, "_resetCurlContainerFrame");
    v10 = CGRectGetWidth(v22) + -88.0;
    v11 = 88.0;
  }
  if (-[BKPictureBookNavigationController _isFreeScale](self, "_isFreeScale") || v8 > v11 && v8 <= v10)
    goto LABEL_7;
  v15 = -[BKPageNavigationViewController pageOffset](self, "pageOffset");
  v16 = v15;
  if (v5 == 1)
  {
    if (v8 > v10 && !v15)
      goto LABEL_7;
    v17 = -[BKPageNavigationViewController pageOffset](self, "pageOffset");
    v18 = v17 >= -[BKPageNavigationViewController pageCount](self, "pageCount") - 1;
  }
  else
  {
    v19 = -[BKPageNavigationViewController pageCount](self, "pageCount");
    if (v8 > v10 && v16 >= v19 - 1)
      goto LABEL_7;
    v18 = -[BKPageNavigationViewController pageOffset](self, "pageOffset") == 0;
  }
  if (v8 < v11 && v18)
  {
LABEL_7:
    LOBYTE(v14) = 0;
    return v14;
  }
  v14 = -[BKPictureBookNavigationController isContentRenderComplete](self, "isContentRenderComplete");
  if (v14)
  {
    -[BKPictureBookScrollView setBounces:](self->_scrollView, "setBounces:", 0);
    -[BKPictureBookScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 0);
    -[BKPictureBookScrollView setAlwaysBounceHorizontal:](self->_scrollView, "setAlwaysBounceHorizontal:", 0);
    LOBYTE(v14) = 1;
  }
  return v14;
}

- (BOOL)drawsSpine
{
  return (BOOL)self->_curlContainer;
}

- (void)setDrawsSpine:(BOOL)a3
{
  LOBYTE(self->_curlContainer) = a3;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int)openToSpread
{
  return *(_QWORD *)&self->_openToSpread;
}

- (void)setOpenToSpread:(int)a3
{
  *(_QWORD *)&self->_openToSpread = *(_QWORD *)&a3;
}

- (int)lastCompletedTransition
{
  return (int)self->_performSelectorProxy;
}

- (void)setLastCompletedTransition:(int)a3
{
  LODWORD(self->_performSelectorProxy) = a3;
}

- (BOOL)hasTurnedToInitialPage
{
  return BYTE1(self->_lastCompletedTransition);
}

- (void)setHasTurnedToInitialPage:(BOOL)a3
{
  BYTE1(self->_lastCompletedTransition) = a3;
}

- (BOOL)inSinglePageMode
{
  return BYTE2(self->_lastCompletedTransition);
}

- (BKPageSlide)pageSlideAnimation
{
  return (BKPageSlide *)self->_lastCurlUnderPageView;
}

- (void)setPageSlideAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_lastCurlUnderPageView, a3);
}

- (BOOL)usePageCurlAnimation
{
  return HIBYTE(self->_lastCompletedTransition);
}

- (void)setUsePageCurlAnimation:(BOOL)a3
{
  HIBYTE(self->_lastCompletedTransition) = a3;
}

- (UIView)lastCurlUnderPageView
{
  return *(UIView **)&self->_desiredScale;
}

- (void)setLastCurlUnderPageView:(id)a3
{
  objc_storeStrong((id *)&self->_desiredScale, a3);
}

- (BOOL)scaleIsAdjusted
{
  return *((_BYTE *)&self->_lastCompletedTransition + 4);
}

- (void)setScaleIsAdjusted:(BOOL)a3
{
  *((_BYTE *)&self->_lastCompletedTransition + 4) = a3;
}

- (double)desiredScale
{
  return *(double *)self[1].super.super.IMViewController_opaque;
}

- (void)setDesiredScale:(double)a3
{
  *(double *)self[1].super.super.IMViewController_opaque = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredScale, 0);
  objc_storeStrong((id *)&self->_lastCurlUnderPageView, 0);
  objc_storeStrong((id *)&self->_pageSlideAnimation, 0);
  objc_storeStrong((id *)&self->_manualCurlStartPosition, 0);
  objc_storeStrong((id *)&self->_manualCurl, 0);
  objc_storeStrong((id *)&self->_needsTurnToPageNumber, 0);
  objc_storeStrong((id *)&self->_pendingLoads, 0);
  objc_storeStrong((id *)&self->_rightContentViewController, 0);
  objc_storeStrong((id *)&self->_leftContentViewController, 0);
  objc_storeStrong((id *)&self->_curlState, 0);
  objc_storeStrong((id *)&self->_pageCurlManager, 0);
  objc_storeStrong((id *)&self->_bookView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_panManualCurlGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_manualCurlGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rightSwipeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_leftSwipeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pageChangeTapRecognizer, 0);
  objc_storeStrong((id *)&self->_controlsTapRecognizer, 0);
}

@end
