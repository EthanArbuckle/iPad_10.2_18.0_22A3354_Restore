@implementation PBController

- (PBController)initWithNibName:(id)a3 bundle:(id)a4
{
  PBController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBController;
  v4 = -[PBController initWithNibName:bundle:](&v6, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v4->_actionBlockMap = objc_opt_new(NSMutableDictionary);
    -[PBController _setupAssets](v4, "_setupAssets");
    -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", v4, "_tileWillZoom:", CFSTR("PBTileWillBeginZoomingNotification"), 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[PBController _setDidEndScrollingBlock:](self, "_setDidEndScrollingBlock:", 0);
  -[PBController _setDidStopStackingBlock:](self, "_setDidStopStackingBlock:", 0);
  -[PBController _removeAllNamedBlocks](self, "_removeAllNamedBlocks");

  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", self);
  -[PBController stopAutoscrolling](self, "stopAutoscrolling");
  -[PBEffectsController setDelegate:](self->_effectsController, "setDelegate:", 0);
  -[PBEffectsController removeObserver:forKeyPath:](self->_effectsController, "removeObserver:forKeyPath:", self, CFSTR("isSwitchingCamera"));

  -[StackController setDataSource:](self->_stackController, "setDataSource:", 0);
  -[StackController setDelegate:](self->_stackController, "setDelegate:", 0);

  -[UIView setDelegate:](self->_contentView, "setDelegate:", 0);
  -[UIPopoverController setDelegate:](self->__sharingPopoverController, "setDelegate:", 0);

  self->_keepAliveController = 0;
  v3.receiver = self;
  v3.super_class = (Class)PBController;
  -[PBController dealloc](&v3, "dealloc");
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PBController;
  -[PBController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)viewDidLoad
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  PBEffectsController *v12;
  StackController *v13;
  id v14;
  PBContainerView *v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  PBContainerView *v20;
  UIView *v21;
  id v22;
  id v23;
  PBBottomBar *v24;
  PBBottomBar *v25;
  id v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  id v31;
  UIScrollView *v32;
  CAMFilterButton *v33;
  CAMFilterButton *v34;
  CUShutterButton *v35;
  CUShutterButton *v36;
  CAMFlipButton *v37;
  CAMFlipButton *v38;
  UILabel *v39;
  CGRect v40;
  CGRect v41;
  CGRect remainder;
  CGRect slice;
  objc_super v44;
  CGRect v45;
  CGRect v46;

  v44.receiver = self;
  v44.super_class = (Class)PBController;
  -[PBController viewDidLoad](&v44, "viewDidLoad");
  v3 = -[PBController view](self, "view");
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  *((_BYTE *)self + 208) |= 8u;
  *((_BYTE *)self + 208) = *((_BYTE *)self + 208) & 0xFB | (4
                                                          * ((char *)objc_msgSend(UIApp, "statusBarOrientation") - 1 < (char *)2));
  v12 = objc_opt_new(PBEffectsController);
  self->_effectsController = v12;
  -[PBEffectsController setDelegate:](v12, "setDelegate:", self);
  -[PBEffectsController addObserver:forKeyPath:options:context:](self->_effectsController, "addObserver:forKeyPath:options:context:", self, CFSTR("isSwitchingCamera"), 0, 0);
  v13 = objc_opt_new(StackController);
  self->_stackController = v13;
  -[StackController setDataSource:](v13, "setDataSource:", self);
  -[StackController setDelegate:](self->_stackController, "setDelegate:", self);
  -[StackController setTransitionEdge:](self->_stackController, "setTransitionEdge:", 4);
  v14 = -[PBEffectsController view](self->_effectsController, "view");
  -[PBController addChildViewController:](self, "addChildViewController:", self->_effectsController);
  objc_msgSend(v14, "setFrame:", v5, v7, v9, v11);
  objc_msgSend(v3, "addSubview:", v14);
  -[PBEffectsController didMoveToParentViewController:](self->_effectsController, "didMoveToParentViewController:", self);
  v15 = -[PBContainerView initWithFrame:]([PBContainerView alloc], "initWithFrame:", v5, v7, v9, v11);
  self->_contentView = &v15->super;
  -[PBContainerView setDelegate:](v15, "setDelegate:", self);
  -[UIView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", self->_contentView);

  +[PBBottomBar defaultHeightForBottomBar](PBBottomBar, "defaultHeightForBottomBar");
  v17 = v16;
  v18 = 126.0;
  if ((*((_BYTE *)self + 208) & 4) == 0)
    v18 = 116.0;
  memset(&slice, 0, sizeof(slice));
  v19 = v17 + v18;
  memset(&remainder, 0, sizeof(remainder));
  v45.origin.x = v5;
  v45.origin.y = v7;
  v45.size.width = v9;
  v45.size.height = v11;
  CGRectDivide(v45, &slice, &remainder, v19, CGRectMaxYEdge);
  v20 = [PBContainerView alloc];
  v21 = -[PBContainerView initWithFrame:](v20, "initWithFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  self->_glassShelf = v21;
  -[UIView setAutoresizingMask:](v21, "setAutoresizingMask:", 10);
  -[CALayer setAllowsGroupOpacity:](-[UIView layer](self->_glassShelf, "layer"), "setAllowsGroupOpacity:", 0);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_glassShelf);
  memset(&v41, 0, sizeof(v41));
  memset(&v40, 0, sizeof(v40));
  -[UIView bounds](self->_glassShelf, "bounds");
  CGRectDivide(v46, &v40, &v41, v17, CGRectMaxYEdge);
  v22 = objc_alloc((Class)UIView);
  v23 = objc_msgSend(v22, "initWithFrame:", v41.origin.x, v41.origin.y, v41.size.width, v41.size.height);
  objc_msgSend(v23, "setTag:", 4);
  objc_msgSend(v23, "setAlpha:", 0.0);
  objc_msgSend(v23, "setAutoresizingMask:", 18);
  objc_msgSend(v23, "setUserInteractionEnabled:", 1);
  objc_msgSend(objc_msgSend(v23, "layer"), "setAllowsGroupOpacity:", 0);
  -[UIView addSubview:](self->_glassShelf, "addSubview:", v23);

  v24 = [PBBottomBar alloc];
  v25 = -[PBBottomBar initWithFrame:](v24, "initWithFrame:", *(_OWORD *)&v40.origin, *(_OWORD *)&v40.size);
  self->_bottomBar = v25;
  -[PBBottomBar setAutoresizingMask:](v25, "setAutoresizingMask:", 10);
  -[PBBottomBar setTintColor:](self->_bottomBar, "setTintColor:", +[UIColor whiteColor](UIColor, "whiteColor"));
  -[UIView addSubview:](self->_glassShelf, "addSubview:", self->_bottomBar);
  v26 = objc_msgSend(objc_alloc((Class)_UIBackdropView), "initWithPrivateStyle:", 2030);
  objc_msgSend(v26, "setGroupName:", -[PBBottomBar backdropViewGroupName](self->_bottomBar, "backdropViewGroupName"));
  objc_msgSend(v23, "addSubview:", v26);
  objc_msgSend(v23, "sendSubviewToBack:", v26);

  objc_msgSend(v23, "bounds");
  v41.origin.x = v27;
  v41.origin.y = v28;
  v41.size.width = v29;
  v41.size.height = v30;
  v31 = objc_alloc((Class)UIScrollView);
  v32 = (UIScrollView *)objc_msgSend(v31, "initWithFrame:", v41.origin.x, v41.origin.y, v41.size.width, v41.size.height);
  self->_photoShelf = v32;
  -[UIScrollView setAutoresizingMask:](v32, "setAutoresizingMask:", 18);
  -[UIScrollView setShowsHorizontalScrollIndicator:](self->_photoShelf, "setShowsHorizontalScrollIndicator:", 1);
  -[UIScrollView setShowsVerticalScrollIndicator:](self->_photoShelf, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setIndicatorStyle:](self->_photoShelf, "setIndicatorStyle:", 2);
  -[UIScrollView setScrollIndicatorInsets:](self->_photoShelf, "setScrollIndicatorInsets:", 0.0, 0.0, -1.0, 0.0);
  -[UIScrollView setPreservesCenterDuringRotation:](self->_photoShelf, "setPreservesCenterDuringRotation:", 1);
  -[UIScrollView setDelegate:](self->_photoShelf, "setDelegate:", self);
  objc_msgSend(v23, "addSubview:", self->_photoShelf);
  v33 = +[CAMFilterButton filterButtonWithLayoutStyle:](CAMFilterButton, "filterButtonWithLayoutStyle:", 3);
  self->__filterButton = v33;
  v34 = v33;
  -[CAMFilterButton addTarget:action:forControlEvents:](self->__filterButton, "addTarget:action:forControlEvents:", self, "toggleEffectsMode:", 64);
  v35 = +[CUShutterButton shutterButtonWithLayoutStyle:](CUShutterButton, "shutterButtonWithLayoutStyle:", 3);
  self->__shutterButton = v35;
  -[CUShutterButton setMode:](v35, "setMode:", 0);
  -[CUShutterButton setExclusiveTouch:](self->__shutterButton, "setExclusiveTouch:", 1);
  -[CUShutterButton addTarget:action:forControlEvents:](self->__shutterButton, "addTarget:action:forControlEvents:", self, "takePicture:", 64);
  v36 = self->__shutterButton;
  v37 = +[CAMFlipButton flipButtonWithLayoutStyle:](CAMFlipButton, "flipButtonWithLayoutStyle:", 3);
  self->__flipButton = v37;
  -[CAMFlipButton addTarget:action:forControlEvents:](v37, "addTarget:action:forControlEvents:", self->_effectsController, "toggleCamera:", 64);
  v38 = self->__flipButton;
  v39 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  self->__selectionLabel = v39;
  -[UILabel setFont:](v39, "setFont:", +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 18.0));
  -[UILabel setTextColor:](self->__selectionLabel, "setTextColor:", +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.3));
  -[UILabel setBackgroundColor:](self->__selectionLabel, "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setTextAlignment:](self->__selectionLabel, "setTextAlignment:", 1);
  -[PBController setCurrentMode:](self, "setCurrentMode:", 1);
  -[PBController _setUpCurtainAnimation:](self, "_setUpCurtainAnimation:", 1);
}

- (id)_initializeStackRootView
{
  double v3;
  double v4;
  double v5;
  double v6;
  PBStackContainerView *v7;

  -[UIView bounds](self->_contentView, "bounds");
  v7 = -[PBStackContainerView initWithFrame:]([PBStackContainerView alloc], "initWithFrame:", v3, v4, v5, v6);
  -[PBStackContainerView setTag:](v7, "setTag:", 1);
  -[PBStackContainerView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
  -[PBStackContainerView setBackgroundColor:](v7, "setBackgroundColor:", +[UIColor colorWithPatternImage:](UIColor, "colorWithPatternImage:", +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("PBBackgroundTexture.png"))));
  -[PBStackContainerView setOpaque:](v7, "setOpaque:", 1);
  -[PBStackContainerView setHidden:](v7, "setHidden:", 1);
  -[UIView insertSubview:below:](self->_contentView, "insertSubview:below:", v7, self->_glassShelf);

  -[PBController _updateStackContainerLayout](self, "_updateStackContainerLayout");
  return v7;
}

- (id)_photoShelfBackgroundView
{
  return -[UIView viewWithTag:](self->_glassShelf, "viewWithTag:", 4);
}

- (id)_stackContainerView
{
  return -[UIView viewWithTag:](self->_contentView, "viewWithTag:", 1);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBController;
  -[PBController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[PBController _startObservingForPhotoLibraryNotifications](self, "_startObservingForPhotoLibraryNotifications");
  -[PBController _reloadTiles](self, "_reloadTiles");
  if (-[PBEffectsController canTakePhoto](self->_effectsController, "canTakePhoto"))
    -[PBController showShelf:](self, "showShelf:", 0);
  else
    -[PBController hideShelf:](self, "hideShelf:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBController;
  -[PBController viewDidAppear:](&v4, "viewDidAppear:", a3);
  if (!self->_keepAliveController)
    self->_keepAliveController = (CAMKeepAliveController *)objc_alloc_init((Class)CAMKeepAliveController);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBController;
  -[PBController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[PBController _stopObservingForPhotoLibraryNotifications](self, "_stopObservingForPhotoLibraryNotifications");
}

- (BOOL)_effectsControllerIsVisible
{
  return self->_currentMode == 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)PBController;
  -[PBController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:");
  -[PBEffectsController viewWillTransitionToSize:withTransitionCoordinator:](self->_effectsController, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000A60C;
  v11[3] = &unk_100034A20;
  v11[4] = self;
  objc_msgSend(a4, "notifyWhenInteractionEndsUsingBlock:", v11);
  v9 = +[PhotoBoothApplication testingAnimationDelegate](PhotoBoothApplication, "testingAnimationDelegate");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000A648;
  v10[3] = &unk_100034A20;
  v10[4] = v9;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000A650;
  v8[3] = &unk_100034A20;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v10, v8);
}

- (BOOL)shouldAutorotate
{
  return !-[PBEffectsView hasShakeMotion](-[PBEffectsController effectsView](self->_effectsController, "effectsView"), "hasShakeMotion");
}

- (void)_setUpCurtainAnimation:(BOOL)a3
{
  PBCurtainView *curtain;
  PBCurtainView *v5;

  curtain = self->_curtain;
  if (curtain)
  {
    -[PBCurtainView setHidden:](curtain, "setHidden:", 0);
  }
  else
  {
    v5 = -[PBCurtainView initWithStyle:]([PBCurtainView alloc], "initWithStyle:", (*((_BYTE *)self + 208) & 4) == 0);
    self->_curtain = v5;
    -[UIView insertSubview:above:](self->_contentView, "insertSubview:above:", v5, self->_glassShelf);
  }
}

- (void)_performCurtainAnimation:(BOOL)a3
{
  _BOOL4 v3;
  PBCurtainView *curtain;
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = a3;
  -[PBController _setUpCurtainAnimation:](self, "_setUpCurtainAnimation:");
  curtain = self->_curtain;
  v6[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A78C;
  v7[3] = &unk_100034A48;
  v7[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000A798;
  v6[3] = &unk_100034A48;
  -[PBCurtainView animateWithStyle:didStartBlock:completionBlock:](curtain, "animateWithStyle:didStartBlock:completionBlock:", !v3, v7, v6);
}

- (id)tileAtLocation:(CGPoint)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[UIScrollView hitTest:withEvent:](self->_photoShelf, "hitTest:withEvent:", 0, a3.x, a3.y);
  v5 = objc_opt_class(PBShelfTile, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    return v3;
  else
    return 0;
}

- (CGPoint)_centerOfTileAtIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  CGPoint result;

  v3 = 116.0;
  if ((*((_BYTE *)self + 208) & 4) == 0)
    v3 = 100.0;
  v4 = v3 * 0.5 + 2.0 + (double)a3 * (v3 + 2.0);
  v5 = 60.0;
  if ((*((_BYTE *)self + 208) & 4) == 0)
    v5 = 52.0;
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)_setPortraitLayout:(BOOL)a3
{
  char v3;
  char v5;

  v3 = *((_BYTE *)self + 208);
  if (((((v3 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 4;
    else
      v5 = 0;
    *((_BYTE *)self + 208) = v3 & 0xFB | v5;
    -[PBCurtainView setStyle:](self->_curtain, "setStyle:", !a3);
    -[UIView setNeedsLayout](self->_contentView, "setNeedsLayout");
  }
}

- (BOOL)_isPortraitLayout
{
  return (*((unsigned __int8 *)self + 208) >> 2) & 1;
}

- (void)_updatePhotoShelfContentLayout
{
  char v3;
  id v4;
  double height;
  double width;
  double v7;
  double v8;

  v3 = *((_BYTE *)self + 208);
  v4 = -[NSMutableArray count](self->_tiles, "count");
  if (v4)
  {
    height = 104.0;
    if ((v3 & 4) != 0)
      height = 120.0;
    width = (double)(unint64_t)v4 * dbl_100027240[(v3 & 4) == 0] + 2.0;
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  -[UIScrollView setContentSize:](self->_photoShelf, "setContentSize:", width, height);
  -[UIScrollView bounds](self->_photoShelf, "bounds");
  v8 = 0.0;
  if (v7 - width >= 0.0)
    v8 = v7 - width;
  -[UIScrollView setContentInset:](self->_photoShelf, "setContentInset:", 0.0, v8, 0.0, 0.0);
}

- (void)_updateStackContainerLayout
{
  id v3;

  v3 = -[PBController _stackContainerView](self, "_stackContainerView");
  -[PBBottomBar frame](self->_bottomBar, "frame");
  objc_msgSend(UIApp, "statusBarHeight");
  objc_msgSend(v3, "setEdgeInsets:");
}

- (void)_setToolbarItemsEnabled:(BOOL)a3
{
  -[PBBottomBar setEnabled:](self->_bottomBar, "setEnabled:", a3);
}

- (void)hideShelf:(BOOL)a3
{
  double v4;
  _QWORD v5[5];

  if ((*((_BYTE *)self + 208) & a3) != 0)
    v4 = 0.25;
  else
    v4 = 0.0;
  if (-[PBController isShelfVisible](self, "isShelfVisible"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000AB50;
    v5[3] = &unk_100034A48;
    v5[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 6, v5, 0, v4, 0.0);
  }
  objc_msgSend(UIApp, "setStatusBarHidden:duration:", 1, v4);
}

- (void)showShelf:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  double v6;
  _QWORD v7[5];

  v3 = a3;
  v5 = *((unsigned __int8 *)self + 208);
  if (!-[PBController isShelfVisible](self, "isShelfVisible"))
  {
    if ((v5 & v3) != 0)
      v6 = 0.25;
    else
      v6 = 0.0;
    -[PBController _updateHighlightedTile](self, "_updateHighlightedTile");
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000AC1C;
    v7[3] = &unk_100034A48;
    v7[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 6, v7, 0, v6, 0.0);
  }
}

- (BOOL)isShelfVisible
{
  double v2;

  -[UIView alpha](self->_glassShelf, "alpha");
  return v2 != 0.0;
}

- (void)_reloadPhotos:(id)a3
{

  self->_selectedItems = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
  self->_cachedItems = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
}

- (void)_reloadTiles
{
  PBShelfTile *highlightedTile;
  _QWORD *v4;
  NSMutableArray *v5;
  PHFetchResult *assetsFetchResult;
  id v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[6];
  _QWORD v11[5];
  NSString *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = sub_10000AF04;
  v17 = sub_10000AF14;
  v18 = 0;
  highlightedTile = self->_highlightedTile;
  if (highlightedTile)
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3052000000;
    v11[3] = sub_10000AF04;
    v11[4] = sub_10000AF14;
    v12 = 0;
    v12 = +[NSString stringWithString:](NSString, "stringWithString:", -[PBShelfTile uuid](highlightedTile, "uuid"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000AF20;
    v10[3] = &unk_100034BE8;
    v10[4] = v11;
    v10[5] = &v13;
    _Block_object_dispose(v11, 8);
    v4 = v10;
  }
  else
  {
    v4 = 0;
  }
  -[PBController _reloadPhotos:](self, "_reloadPhotos:", v4);

  self->_highlightedTile = 0;
  self->_previousHighlightedTile = 0;
  -[NSMutableArray makeObjectsPerformSelector:](self->_tiles, "makeObjectsPerformSelector:", "removeFromSuperview");

  self->_tiles = objc_opt_new(NSMutableArray);
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[PHFetchResult count](self->_assetsFetchResult, "count"));
  assetsFetchResult = self->_assetsFetchResult;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000AF84;
  v9[3] = &unk_100034C10;
  v9[4] = v5;
  -[PHFetchResult enumerateObjectsUsingBlock:](assetsFetchResult, "enumerateObjectsUsingBlock:", v9);
  -[PBController _addTilesForPhotos:animated:](self, "_addTilesForPhotos:animated:", v5, 0);
  v7 = -[NSMutableArray lastObject](self->_tiles, "lastObject");
  if (v14[5] && -[NSMutableArray count](self->_tiles, "count"))
  {
    v8 = -[PBController _tileForPhoto:](self, "_tileForPhoto:", v14[5]);
    if (v8)
      v7 = v8;
    -[PBController setHighlightedTile:](self, "setHighlightedTile:", v7);
    -[PBController _updateVisiblePhoto](self, "_updateVisiblePhoto");
  }
  -[PBController scrollTileToVisible:animated:](self, "scrollTileToVisible:animated:", v7, 0);
  _Block_object_dispose(&v13, 8);
}

- (void)_reloadTilesAtIndices:(id)a3
{
  id v5;
  __int128 *v6;
  _QWORD v7[6];
  __int128 v8;
  __int128 v9;

  if (a3 && objc_msgSend(a3, "firstIndex") != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = -[NSMutableArray count](self->_tiles, "count");
    if ((*((_BYTE *)self + 208) & 4) != 0)
      v6 = &xmmword_100027280;
    else
      v6 = &xmmword_100027298;
    v9 = *v6;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000B050;
    v7[3] = &unk_100034C38;
    v7[4] = self;
    v7[5] = v5;
    v8 = v9;
    objc_msgSend(a3, "enumerateIndexesUsingBlock:", v7);
  }
}

- (id)_addTilesForPhotos:(id)a3 animated:(BOOL)a4
{
  id v6;
  id v7;
  void *i;
  void *v9;
  NSUInteger v10;
  NSObject *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  PBShelfTile *v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  NSObject *v23;
  double v24;
  double v25;
  id v26;
  double v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  _BOOL4 v32;
  id obj;
  uint64_t v34;
  NSMutableArray *v35;
  _QWORD v36[5];
  _QWORD v37[6];
  _QWORD v38[5];
  _QWORD v39[5];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  NSUInteger v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];

  v32 = a4;
  v35 = objc_opt_new(NSMutableArray);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = a3;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v6)
  {
    v7 = v6;
    v34 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v34)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        v10 = -[PHFetchResult indexOfObject:](self->_assetsFetchResult, "indexOfObject:", v9);
        v11 = os_log_create("com.apple.camera", "PhotoBooth");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v45 = v10;
          v46 = 2114;
          v47 = v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Adding tile at index %lu for photo %{public}@", buf, 0x16u);
        }
        if ((*((_BYTE *)self + 208) & 4) != 0)
          v12 = 116.0;
        else
          v12 = 100.0;
        -[PBController _centerOfTileAtIndex:](self, "_centerOfTileAtIndex:", v10);
        v14 = v13;
        v16 = v15;
        v17 = -[PBShelfTile initWithFrame:]([PBShelfTile alloc], "initWithFrame:", 0.0, 0.0, v12, v12);
        -[PBShelfTile setSmallSize:](v17, "setSmallSize:", (*((_BYTE *)self + 208) & 4) == 0);
        -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
        v19 = v12 * v18;
        -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
        -[PBShelfTile setIconFromAsset:maxIconSizeInPixels:](v17, "setIconFromAsset:maxIconSizeInPixels:", v9, v19, v12 * v20);
        -[PBShelfTile setUUID:](v17, "setUUID:", objc_msgSend(v9, "uuid"));
        -[PBShelfTile setCenter:](v17, "setCenter:", v14, v16);
        -[PBShelfTile addTarget:action:forControlEvents:](v17, "addTarget:action:forControlEvents:", self, "beginTouchTile:", 1);
        -[PBShelfTile addTarget:action:forControlEvents:](v17, "addTarget:action:forControlEvents:", self, "dragInOrOut:", 48);
        -[PBShelfTile addTarget:action:forControlEvents:](v17, "addTarget:action:forControlEvents:", self, "endTouchTile:", 64);
        -[PBShelfTile addTarget:action:forControlEvents:](v17, "addTarget:action:forControlEvents:", self, "cancelTouchTile:", 128);
        -[NSMutableArray addObject:](v35, "addObject:", v17);
        -[NSMutableArray addObject:](self->_tiles, "addObject:", v17);
        -[UIScrollView addSubview:](self->_photoShelf, "addSubview:", v17);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v7);
  }
  if (-[NSMutableArray count](v35, "count"))
  {
    v21 = -[PBController _photoShelfBackgroundView](self, "_photoShelfBackgroundView");
    v22 = v21;
    if (v32)
    {
      if ((unint64_t)-[NSMutableArray count](v35, "count") >= 2)
      {
        v23 = os_log_create("com.apple.camera", "PhotoBooth");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          sub_10001D4F4(v23);
      }
      objc_msgSend(v22, "alpha");
      v25 = v24;
      v26 = -[NSMutableArray lastObject](v35, "lastObject");
      objc_msgSend(v26, "setHidden:", 1);
      if (v25 >= 1.0)
      {
        v36[4] = v26;
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_10000B650;
        v37[3] = &unk_100034AE8;
        v37[4] = self;
        v37[5] = v26;
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_10000B67C;
        v36[3] = &unk_100034A70;
        v27 = 0.76;
        v28 = v37;
        v29 = v36;
        v30 = 131078;
      }
      else
      {
        -[PBController _updatePhotoShelfContentLayout](self, "_updatePhotoShelfContentLayout");
        -[PBController scrollTileToVisible:animated:](self, "scrollTileToVisible:animated:", v26, 0);
        v38[4] = v26;
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_10000B614;
        v39[3] = &unk_100034A48;
        v39[4] = v22;
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_10000B620;
        v38[3] = &unk_100034A70;
        v27 = 0.25;
        v28 = v39;
        v29 = v38;
        v30 = 2;
      }
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v30, v28, v29, v27, 0.0);
    }
    else
    {
      objc_msgSend(v21, "setAlpha:", 1.0);
      -[PBController _updatePhotoShelfContentLayout](self, "_updatePhotoShelfContentLayout");
      -[PBController scrollTileToVisible:animated:](self, "scrollTileToVisible:animated:", -[NSMutableArray lastObject](v35, "lastObject"), 0);
    }
    -[UIPageController setPageCount:](self->_pageController, "setPageCount:", -[NSArray count](-[PBController tiles](self, "tiles"), "count"));
    -[PBController _updateSelectionLabel](self, "_updateSelectionLabel");
  }
  return v35;
}

- (void)_removeTilesAtIndices:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIPageController *pageController;
  uint64_t v8;
  double v9;
  id v10;
  id v11;
  _QWORD v12[8];
  _QWORD v13[8];
  _QWORD v14[7];
  _QWORD v15[3];
  char v16;
  _QWORD v17[3];
  uint64_t v18;

  if (a3)
  {
    v4 = a4;
    if (objc_msgSend(a3, "firstIndex") != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v17[0] = 0;
      v17[1] = v17;
      v17[2] = 0x2020000000;
      v18 = 0;
      pageController = self->_pageController;
      if (pageController)
        v8 = (uint64_t)-[UIPageController visibleIndex](pageController, "visibleIndex");
      else
        v8 = -1;
      v18 = v8;
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x2020000000;
      v16 = 0;
      if (v4)
        v9 = 0.25;
      else
        v9 = 0.0;
      -[NSMutableIndexSet pl_adjustIndexesForDeletions:](self->_cachedItems, "pl_adjustIndexesForDeletions:", a3);
      -[NSMutableIndexSet pl_adjustIndexesForDeletions:](self->_selectedItems, "pl_adjustIndexesForDeletions:", a3);
      v10 = -[NSMutableArray count](self->_tiles, "count");
      v11 = objc_alloc_init((Class)NSMutableArray);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10000B898;
      v14[3] = &unk_100034C60;
      v14[5] = self;
      v14[6] = v10;
      v14[4] = v11;
      objc_msgSend(a3, "enumerateIndexesUsingBlock:", v14);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10000B97C;
      v13[3] = &unk_100034C88;
      v13[4] = self;
      v13[5] = v11;
      v13[6] = v15;
      v13[7] = v17;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10000BC04;
      v12[3] = &unk_100034CB0;
      v12[4] = self;
      v12[5] = v11;
      v12[6] = v17;
      v12[7] = v15;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v13, v12, v9);
      _Block_object_dispose(v15, 8);
      _Block_object_dispose(v17, 8);
    }
  }
}

- (id)_tileForPhoto:(id)a3
{
  id v4;
  NSMutableArray *tiles;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (!a3)
    return 0;
  v4 = objc_msgSend(a3, "uuid");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  tiles = self->_tiles;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tiles, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v13;
LABEL_4:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v8)
      objc_enumerationMutation(tiles);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    if ((objc_msgSend(objc_msgSend(v10, "uuid"), "isEqualToString:", v4) & 1) != 0)
      return v10;
    if (v7 == (id)++v9)
    {
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tiles, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 0;
      if (v7)
        goto LABEL_4;
      return v10;
    }
  }
}

- (void)toggleCamera:(id)a3
{
  -[PBEffectsController toggleCamera:](self->_effectsController, "toggleCamera:", a3);
}

- (void)toggleShelf:(id)a3
{
  if (-[PBController isShelfVisible](self, "isShelfVisible", a3))
    -[PBController hideShelf:](self, "hideShelf:", 1);
  else
    -[PBController showShelf:](self, "showShelf:", 1);
}

- (void)toggleZoom:(id)a3
{
  objc_msgSend(-[PBController _visibleTileController](self, "_visibleTileController"), "toggleZoom:", a3);
}

- (void)displayPopupMenu:(id)a3
{
  UIMenuController *v5;
  double v6;
  double v7;

  v5 = +[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController");
  if (!-[UIMenuController isMenuVisible](v5, "isMenuVisible"))
  {
    -[PBController becomeFirstResponder](self, "becomeFirstResponder");
    objc_msgSend(a3, "centroid");
    -[UIMenuController setTargetRect:inView:](v5, "setTargetRect:inView:", objc_msgSend(a3, "view"), v7, v6 + -20.0, CGSizeZero.width, CGSizeZero.height);
    -[UIMenuController setMenuVisible:animated:](v5, "setMenuVisible:animated:", 1, 1);
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "dismissPopupMenu:", self);
    -[PBController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "dismissPopupMenu:", self, 5.0);
  }
}

- (void)dismissPopupMenu:(id)a3
{
  -[UIMenuController setMenuVisible:animated:](+[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController", a3), "setMenuVisible:animated:", 0, 1);
  objc_msgSend(objc_msgSend(-[UIPageController visibleViewController](self->_pageController, "visibleViewController"), "view"), "resignFirstResponder");
}

- (void)copy:(id)a3
{
  int currentMode;
  PHFetchResult *assetsFetchResult;
  NSString *v6;
  uint64_t v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;

  currentMode = self->_currentMode;
  if (currentMode == 3)
  {
    -[PBController _copyAssetsToPasteboard:](self, "_copyAssetsToPasteboard:", -[PBController _selectedPhotos](self, "_selectedPhotos", a3));
  }
  else if (currentMode == 2)
  {
    assetsFetchResult = self->_assetsFetchResult;
    v6 = -[PBShelfTile uuid](self->_highlightedTile, "uuid", a3);
    v9 = 0;
    v10 = &v9;
    v11 = 0x3052000000;
    v12 = sub_10000AF04;
    v13 = sub_10000AF14;
    v14 = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000FE20;
    v8[3] = &unk_100034D90;
    v8[4] = v6;
    v8[5] = &v9;
    -[PHFetchResult enumerateObjectsUsingBlock:](assetsFetchResult, "enumerateObjectsUsingBlock:", v8);
    v7 = v10[5];
    _Block_object_dispose(&v9, 8);
    if (v7)
    {
      v15 = v7;
      -[PBController _copyAssetsToPasteboard:](self, "_copyAssetsToPasteboard:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    }
  }
}

- (void)_copyAssetsToPasteboard:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "count"))
  {
    v4 = (void *)PXDefaultAssetSharingHelperClass();
    objc_msgSend(v4, "copyAssets:completionHandler:", a3, &stru_100034CF0);
  }
}

- (void)deleteSelectedItems:(id)a3
{
  if (!-[PBController _dismissPopovers](self, "_dismissPopovers"))
    -[PBController _confirmDeleteItems:showFromObject:](self, "_confirmDeleteItems:showFromObject:", self->_selectedItems, a3);
}

- (void)_confirmDeleteItems:(id)a3 showFromObject:(id)a4
{
  NSMutableIndexSet *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  NSString *v12;
  const __CFString *v13;
  NSString *v14;
  const __CFString *v15;
  NSString *v16;
  UIAlertController *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[5];

  -[PBController _dismissPopovers](self, "_dismissPopovers");

  v7 = (NSMutableIndexSet *)objc_msgSend(a3, "mutableCopy");
  self->_cachedItems = v7;
  v8 = -[PHFetchResult objectsAtIndexes:](self->_assetsFetchResult, "objectsAtIndexes:", v7);
  v9 = (uint64_t)objc_msgSend(+[PHAssetCollection fetchAssetCollectionsContainingAssets:withType:options:](PHAssetCollection, "fetchAssetCollectionsContainingAssets:withType:options:", v8, 1, 0), "count");
  v10 = v9;
  if (v9 >= 2)
  {
    if (-[NSArray count](v8, "count") <= 1)
      v11 = CFSTR("DELETE_WARNING_ALBUMS_PHOTO");
    else
      v11 = CFSTR("DELETE_WARNING_ALBUMS_PHOTOS");
    v12 = +[NSString localizedStringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", objc_msgSend((id)PLPhotoLibraryServicesFrameworkBundle(), "localizedStringForKey:value:table:", v11, &stru_100035390, CFSTR("PhotoLibraryServices")), CFSTR("%ld"), 0, v10);
LABEL_11:
    v14 = v12;
    goto LABEL_13;
  }
  if (v9 == 1)
  {
    if (-[NSArray count](v8, "count") <= 1)
      v13 = CFSTR("DELETE_WARNING_ALBUM_PHOTO");
    else
      v13 = CFSTR("DELETE_WARNING_ALBUM_PHOTOS");
    v12 = (NSString *)objc_msgSend((id)PLPhotoLibraryServicesFrameworkBundle(), "localizedStringForKey:value:table:", v13, &stru_100035390, CFSTR("PhotoLibraryServices"));
    goto LABEL_11;
  }
  v14 = 0;
LABEL_13:
  if ((unint64_t)objc_msgSend(a3, "count") <= 1)
    v15 = CFSTR("SINGULAR_DELETE_PHOTO");
  else
    v15 = CFSTR("PLURAL_DELETE_PHOTO");
  v16 = -[NSBundle localizedStringForKey:value:table:](+[NSBundle mainBundle](NSBundle, "mainBundle"), "localizedStringForKey:value:table:", v15, &stru_100035390, CFSTR("PhotoBooth"));
  v17 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v14, 0, 0);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000C538;
  v22[3] = &unk_100034D40;
  v22[4] = self;
  -[UIAlertController addAction:](v17, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 2, v22));
  v18 = -[UIAlertController popoverPresentationController](v17, "popoverPresentationController");
  if (v18)
  {
    v20 = v18;
    v21 = objc_opt_class(UIBarButtonItem, v19);
    if ((objc_opt_isKindOfClass(a4, v21) & 1) != 0)
    {
      objc_msgSend(v20, "setBarButtonItem:", a4);
    }
    else
    {
      objc_msgSend(v20, "setSourceView:", a4);
      objc_msgSend(a4, "frame");
      objc_msgSend(v20, "setSourceRect:");
    }
  }
  -[PBController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
}

- (void)beginTouchTile:(id)a3
{
  int currentMode;
  PBController *v6;
  id v7;
  unsigned __int8 v8;
  _QWORD v9[5];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000C780;
  v9[3] = &unk_100034A48;
  v9[4] = self;
  -[PBController addBlockNamed:block:](self, "addBlockNamed:block:", CFSTR("Edit Tiles"), v9);
  currentMode = self->_currentMode;
  switch(currentMode)
  {
    case 3:
      if (objc_msgSend(a3, "isSelected"))
        -[PBController deselectTile:](self, "deselectTile:", a3);
      else
        -[PBController selectTile:](self, "selectTile:", a3);
      -[PBShelfTile setReviewed:](self->_highlightedTile, "setReviewed:", objc_msgSend(a3, "isSelected"));
      break;
    case 2:
      v8 = -[PBController _dismissPopovers](self, "_dismissPopovers");
      self->_previousHighlightedTile = self->_highlightedTile;
      if (self->_highlightedTile == a3)
      {
        if ((v8 & 1) == 0)
        {
          v6 = self;
          v7 = 0;
          goto LABEL_5;
        }
      }
      else
      {
        -[PBController setHighlightedTile:](self, "setHighlightedTile:", a3);
        -[PBController _updateVisiblePhoto](self, "_updateVisiblePhoto");
      }
      break;
    case 1:
      v6 = self;
      v7 = a3;
LABEL_5:
      -[PBController setHighlightedTile:](v6, "setHighlightedTile:", v7);
      break;
  }
}

- (void)dragInOrOut:(id)a3
{
  void *previousHighlightedTile;
  unsigned int v5;
  int currentMode;
  void *v7;

  previousHighlightedTile = a3;
  v5 = objc_msgSend(a3, "isTouchInside");
  currentMode = self->_currentMode;
  switch(currentMode)
  {
    case 3:
      if (objc_msgSend(previousHighlightedTile, "isSelected"))
        -[PBController deselectTile:](self, "deselectTile:", previousHighlightedTile);
      else
        -[PBController selectTile:](self, "selectTile:", previousHighlightedTile);
      break;
    case 2:
      if ((v5 & 1) == 0)
        previousHighlightedTile = self->_previousHighlightedTile;
      -[PBController setHighlightedTile:](self, "setHighlightedTile:", previousHighlightedTile);
      -[PBController _updateVisiblePhoto](self, "_updateVisiblePhoto");
      break;
    case 1:
      if (v5)
        v7 = previousHighlightedTile;
      else
        v7 = 0;
      -[PBController setHighlightedTile:](self, "setHighlightedTile:", v7);
      break;
  }
}

- (void)endTouchTile:(id)a3
{
  PBController *v3;
  int currentMode;
  uint64_t v5;
  PBShelfTile *highlightedTile;

  v3 = self;
  currentMode = self->_currentMode;
  switch(currentMode)
  {
    case 3:
      -[PBShelfTile setReviewed:](self->_highlightedTile, "setReviewed:", objc_msgSend(a3, "isSelected"));
      break;
    case 2:
      highlightedTile = self->_highlightedTile;
      if (!highlightedTile)
      {
        v5 = 1;
        goto LABEL_9;
      }
      -[PBController scrollTileToVisible:animated:](self, "scrollTileToVisible:animated:", highlightedTile, 1);
      -[PBController _updateVisiblePhoto](v3, "_updateVisiblePhoto");
      break;
    case 1:
      -[PBController setHighlightedTile:](self, "setHighlightedTile:", a3);
      self = v3;
      v5 = 2;
LABEL_9:
      -[PBController setCurrentMode:animated:](self, "setCurrentMode:animated:", v5, 1);
      break;
  }
  -[PBController performBlockNamed:removeFromMap:](v3, "performBlockNamed:removeFromMap:", CFSTR("Edit Tiles"), 1);
}

- (void)cancelTouchTile:(id)a3
{
  int currentMode;

  currentMode = self->_currentMode;
  switch(currentMode)
  {
    case 3:
      -[PBShelfTile setReviewed:](self->_highlightedTile, "setReviewed:", -[NSMutableIndexSet count](self->_selectedItems, "count", a3) == 0);
      break;
    case 2:
      -[PBController scrollTileToVisible:animated:](self, "scrollTileToVisible:animated:", self->_highlightedTile, 1);
      break;
    case 1:
      -[PBController setHighlightedTile:](self, "setHighlightedTile:", 0);
      break;
  }
  -[PBController performBlockNamed:removeFromMap:](self, "performBlockNamed:removeFromMap:", CFSTR("Edit Tiles"), 1);
}

- (void)confirmDeleteTile:(id)a3
{
  _QWORD v5[6];

  if (self->_currentMode == 2 && !-[PBController _dismissPopovers](self, "_dismissPopovers"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000CA90;
    v5[3] = &unk_100034AE8;
    v5[4] = self;
    v5[5] = a3;
    -[PBController _setDidEndScrollingBlock:](self, "_setDidEndScrollingBlock:", v5);
    if (!-[PBController scrollTileToVisible:animated:](self, "scrollTileToVisible:animated:", a3, 1))
    {
      (*((void (**)(void))self->_didEndScrollingBlock + 2))();
      -[PBController _setDidEndScrollingBlock:](self, "_setDidEndScrollingBlock:", 0);
    }
  }
}

- (void)setHighlightedTile:(id)a3
{
  PBShelfTile *highlightedTile;
  PBShelfTile *v6;

  highlightedTile = self->_highlightedTile;
  if (highlightedTile != a3)
  {
    -[PBShelfTile setIcon:inCorner:offset:](highlightedTile, "setIcon:inCorner:offset:", 0, 0, CGSizeZero.width, CGSizeZero.height);
    -[PBShelfTile setReviewed:](self->_highlightedTile, "setReviewed:", 0);

    v6 = (PBShelfTile *)a3;
    self->_highlightedTile = v6;
    -[PBShelfTile setReviewed:](v6, "setReviewed:", 1);
  }
}

- (id)highlightedTile
{
  return self->_highlightedTile;
}

- (void)_updateHighlightedTile
{
  UIPageController *pageController;
  id v4;
  id v5;

  if (self->_currentMode == 2
    && -[NSMutableArray count](self->_tiles, "count")
    && (pageController = self->_pageController) != 0
    && (v4 = -[UIPageController visibleIndex](pageController, "visibleIndex"), v4 != (id)-1))
  {
    v5 = -[NSMutableArray objectAtIndex:](self->_tiles, "objectAtIndex:", v4);
  }
  else
  {
    v5 = 0;
  }
  -[PBController setHighlightedTile:](self, "setHighlightedTile:", v5);
  -[PBController scrollTileToVisible:animated:](self, "scrollTileToVisible:animated:", v5, 0);
}

- (void)_updateVisiblePhoto
{
  PHFetchResult *assetsFetchResult;
  NSString *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  assetsFetchResult = self->_assetsFetchResult;
  v4 = -[PBShelfTile uuid](self->_highlightedTile, "uuid");
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = sub_10000AF04;
  v13 = sub_10000AF14;
  v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000FE20;
  v8[3] = &unk_100034D90;
  v8[4] = v4;
  v8[5] = &v9;
  -[PHFetchResult enumerateObjectsUsingBlock:](assetsFetchResult, "enumerateObjectsUsingBlock:", v8);
  v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  v6 = -[PHFetchResult count](self->_assetsFetchResult, "count");
  if (v5)
  {
    v7 = -[PHFetchResult indexOfObject:](self->_assetsFetchResult, "indexOfObject:", v5);
  }
  else if (v6)
  {
    v7 = -1;
  }
  else
  {
    v7 = 0;
  }
  -[UIPageController setVisibleIndex:](self->_pageController, "setVisibleIndex:", v7);
}

- (void)selectTile:(id)a3
{
  if ((objc_msgSend(a3, "isSelected") & 1) == 0)
  {
    objc_msgSend(a3, "setSelected:", 1);
    -[NSMutableIndexSet addIndex:](self->_selectedItems, "addIndex:", -[NSMutableArray indexOfObject:](self->_tiles, "indexOfObject:", a3));
    -[PBController _updateSelectionLabel](self, "_updateSelectionLabel");
    -[StackController displayStackedViewsForItems:animated:](self->_stackController, "displayStackedViewsForItems:animated:", -[PBController _selectedStackItems](self, "_selectedStackItems"), 1);
  }
}

- (void)deselectTile:(id)a3
{
  if (objc_msgSend(a3, "isSelected"))
  {
    objc_msgSend(a3, "setSelected:", 0);
    -[NSMutableIndexSet removeIndex:](self->_selectedItems, "removeIndex:", -[NSMutableArray indexOfObject:](self->_tiles, "indexOfObject:", a3));
    -[PBController _updateSelectionLabel](self, "_updateSelectionLabel");
    -[StackController displayStackedViewsForItems:animated:](self->_stackController, "displayStackedViewsForItems:animated:", -[PBController _selectedStackItems](self, "_selectedStackItems"), 1);
  }
}

- (void)deselectAllTiles
{
  -[NSMutableArray setValue:forKeyPath:](self->_tiles, "setValue:forKeyPath:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), CFSTR("selected"));
  -[NSMutableIndexSet removeAllIndexes](self->_selectedItems, "removeAllIndexes");
}

- (id)_selectedPhotos
{
  return -[PHFetchResult objectsAtIndexes:](self->_assetsFetchResult, "objectsAtIndexes:", self->_selectedItems);
}

- (id)_selectedStackItems
{
  NSMutableArray *v3;
  PHFetchResult *assetsFetchResult;
  NSMutableIndexSet *selectedItems;
  _QWORD v7[5];

  v3 = objc_opt_new(NSMutableArray);
  assetsFetchResult = self->_assetsFetchResult;
  selectedItems = self->_selectedItems;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000CF70;
  v7[3] = &unk_100034C10;
  v7[4] = v3;
  -[PHFetchResult enumerateObjectsAtIndexes:options:usingBlock:](assetsFetchResult, "enumerateObjectsAtIndexes:options:usingBlock:", selectedItems, 0, v7);
  return v3;
}

- (id)selectedTiles
{
  NSMutableArray *v3;
  NSMutableArray *tiles;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_opt_new(NSMutableArray);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  tiles = self->_tiles;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tiles, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(tiles);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "isSelected"))
          -[NSMutableArray addObject:](v3, "addObject:", v9);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tiles, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v3;
}

- (void)autoscrollGesture:(id)a3
{
  double v5;
  double v6;
  CGRect v7;
  CGRect v8;

  objc_msgSend(a3, "locationInView:", self->_photoShelf);
  v6 = v5;
  -[UIScrollView bounds](self->_photoShelf, "bounds");
  v8.origin.x = v6 + -20.0;
  v8.size.width = 40.0;
  v8.origin.y = v7.origin.y;
  v8.size.height = v7.size.height;
  if (CGRectContainsRect(v7, v8))
    -[PBController stopAutoscrolling](self, "stopAutoscrolling");
  else
    -[PBController startAutoscrollingWithGesture:](self, "startAutoscrollingWithGesture:", a3);
}

- (void)startAutoscrollingWithGesture:(id)a3
{
  CGPoint *p_autoscrollPosition;
  CGFloat v5;
  CGFloat v6;

  p_autoscrollPosition = &self->_autoscrollPosition;
  objc_msgSend(a3, "locationInView:", self->_contentView);
  p_autoscrollPosition->x = v5;
  p_autoscrollPosition->y = v6;
  if (!self->_autoscrollTimer)
    self->_autoscrollTimer = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_autoscroll:", 0, 1, 0.03);
}

- (void)stopAutoscrolling
{
  -[NSTimer invalidate](self->_autoscrollTimer, "invalidate");

  self->_autoscrollTimer = 0;
  self->_autoscrollPosition = CGPointZero;
}

- (void)_autoscroll:(id)a3
{
  double v4;
  double v5;

  -[UIView convertPoint:toView:](self->_contentView, "convertPoint:toView:", self->_photoShelf, self->_autoscrollPosition.x, self->_autoscrollPosition.y);
  v5 = v4;
  -[UIScrollView bounds](self->_photoShelf, "bounds");
  -[UIScrollView scrollRectToVisible:animated:](self->_photoShelf, "scrollRectToVisible:animated:", 0, v5 + -20.0);
}

- (BOOL)scrollTileToVisible:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  if (!a3)
    return 0;
  v4 = a4;
  if ((*((_BYTE *)self + 208) & 4) != 0)
    v6 = 116.0;
  else
    v6 = 100.0;
  objc_msgSend(a3, "center");
  v12.size.width = v6;
  v12.size.height = v6;
  v13 = CGRectOffset(v12, v6 * -0.5, v6 * -0.5);
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  -[UIScrollView bounds](self->_photoShelf, "bounds");
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  if (CGRectContainsRect(v14, v17))
    return 0;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v16 = CGRectInset(v15, -2.0, 0.0);
  -[UIScrollView scrollRectToVisible:animated:](self->_photoShelf, "scrollRectToVisible:animated:", v4, v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (self->_effectsController == a4)
    objc_msgSend(a3, "isEqualToString:", CFSTR("isSwitchingCamera"));
}

- (void)_setupAssets
{
  id v3;

  v3 = objc_alloc_init((Class)PHFetchOptions);
  objc_msgSend(v3, "setInternalPredicate:", +[PLValidatedSavedAssetType predicateForIncludeMask:useIndex:](PLValidatedSavedAssetType, "predicateForIncludeMask:useIndex:", +[PLValidatedSavedAssetType maskForPhotoBoothAsset](PLValidatedSavedAssetType, "maskForPhotoBoothAsset"), 1));

  self->_assetsFetchResult = +[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v3);
}

- (void)_startObservingForPhotoLibraryNotifications
{
  -[PHPhotoLibrary registerChangeObserver:](+[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary"), "registerChangeObserver:", self);
}

- (void)_stopObservingForPhotoLibraryNotifications
{
  -[PHPhotoLibrary unregisterChangeObserver:](+[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary"), "unregisterChangeObserver:", self);
}

- (void)photoLibraryDidChange:(id)a3
{
  PHFetchResult *assetsFetchResult;
  NSObject *v7;
  _BOOL4 v8;
  _QWORD v9[6];
  uint8_t buf[4];
  NSString *v11;

  assetsFetchResult = self->_assetsFetchResult;
  v7 = os_log_create("com.apple.camera", "PhotoBooth");
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (assetsFetchResult)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543362;
      v11 = NSStringFromSelector(a2);
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000D5E0;
    v9[3] = &unk_100034AE8;
    v9[4] = a3;
    v9[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  }
  else if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Ignoring photo library change because asset fetch has not been set up yet", buf, 2u);
  }
}

- (void)prepareForDefaultImageSnapshot
{
  -[PBController _setUpCurtainAnimation:](self, "_setUpCurtainAnimation:", 1);
}

- (void)applicationDidFinishLaunching:(id)a3
{
  -[PBController _enterForeground:](self, "_enterForeground:", 1);
}

- (void)applicationWillEnterForeground:(id)a3
{
  -[PBController _enterForeground:](self, "_enterForeground:", 0);
}

- (void)_enterForeground:(BOOL)a3
{
  *((_BYTE *)self + 208) |= 1u;
  self->_mediaStreamContext = objc_msgSend(+[MSConnection sharedConnection](MSConnection, "sharedConnection"), "pause");
  if (-[PBController _shouldResetEffects](self, "_shouldResetEffects"))
    -[PBEffectsController resetEffects:](self->_effectsController, "resetEffects:", self);
  if (!a3)
  {
    *((_BYTE *)self + 208) |= 8u;
    -[PBEffectsController start](self->_effectsController, "start");
  }
}

- (void)applicationDidEnterBackground:(id)a3
{
  *((_BYTE *)self + 208) &= ~1u;
  -[PBController _updateLastActiveDate](self, "_updateLastActiveDate", a3);
  -[PBEffectsController stop](self->_effectsController, "stop");
  -[PBController _dismissPopovers](self, "_dismissPopovers");
  if (self->_currentMode == 1)
    -[PBController _setToolbarItemsEnabled:](self, "_setToolbarItemsEnabled:", 0);
  objc_msgSend(+[MSConnection sharedConnection](MSConnection, "sharedConnection"), "resume:", self->_mediaStreamContext);

  self->_mediaStreamContext = 0;
}

- (void)_updateLastActiveDate
{
  -[NSUserDefaults setObject:forKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "setObject:forKey:", +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", +[NSDate date](NSDate, "date"), 1, 0), CFSTR("Last Active Date"));
}

- (BOOL)_shouldResetEffects
{
  id v2;
  uint64_t v3;
  double v4;
  BOOL result;

  v2 = -[NSUserDefaults objectForKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "objectForKey:", CFSTR("Last Active Date"));
  result = 0;
  if (v2)
  {
    -[NSDate timeIntervalSinceDate:](+[NSDate date](NSDate, "date"), "timeIntervalSinceDate:", +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(NSDate, v3), v2, 0));
    if (v4 > 480.0)
      return 1;
  }
  return result;
}

- (id)rotatingContentViewForWindow:(id)a3
{
  return self->_contentView;
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  int currentMode;
  int v6;
  int v8;
  unsigned int v9;

  currentMode = self->_currentMode;
  if ((currentMode - 2) >= 2)
  {
    if (currentMode == 1)
    {
      if (objc_msgSend(UIApp, "isStatusBarHidden", a3, a4))
        v8 = 0;
      else
        v8 = 8;
      v9 = -[PBController isShelfVisible](self, "isShelfVisible");
      v6 = v8 | 4;
      if (!v9)
        v6 = v8;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 15;
  }
  a3->var6 = v6;
}

- (void)effectsControllerWillChangeMode:(id)a3
{
  if (-[PBEffectsController canTakePhoto](self->_effectsController, "canTakePhoto", a3))
  {
    if ((-[UIApplication currentTestRequestsShelfSuppression](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "currentTestRequestsShelfSuppression") & 1) == 0)-[PBController showShelf:](self, "showShelf:", 1);
  }
}

- (void)effectsControllerDidChangeMode:(id)a3
{
  if (!-[PBEffectsController canTakePhoto](self->_effectsController, "canTakePhoto", a3))
    -[PBController hideShelf:](self, "hideShelf:", 1);
}

- (void)effectsControllerDidStartPreview:(id)a3
{
  -[PBController _performCurtainAnimation:](self, "_performCurtainAnimation:", 1);
}

- (void)effectsControllerCaptureSessionDidStartRunning
{
  *((_BYTE *)self + 208) &= ~8u;
}

- (void)effectsControllerCaptureSessionDidStopRunning
{
  if ((*((_BYTE *)self + 208) & 8) == 0 && !objc_msgSend(UIApp, "applicationState"))
    -[PBController _performCurtainAnimation:](self, "_performCurtainAnimation:", 0);
}

- (void)layoutContentView:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  char v16;
  NSMutableArray *tiles;
  id v18;
  id v19;
  double v20;
  uint64_t v21;
  void *i;
  void *v23;
  PBCurtainView *curtain;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CGRect v29;
  CGRect v30;
  CGRect remainder;
  CGRect slice;
  _BYTE v33[128];
  CGRect v34;
  CGRect v35;

  objc_msgSend(-[PBController view](self, "view"), "safeAreaInsets");
  v6 = v5;
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  memset(&v30, 0, sizeof(v30));
  memset(&v29, 0, sizeof(v29));
  +[PBBottomBar defaultHeightForBottomBar](PBBottomBar, "defaultHeightForBottomBar");
  v8 = v7 + v6 * 2.0;
  if ((*((_BYTE *)self + 208) & 4) != 0)
    v9 = 126.0;
  else
    v9 = 116.0;
  -[PBBottomBar frame](self->_bottomBar, "frame");
  v11 = v9 + v10;
  objc_msgSend(a3, "bounds");
  CGRectDivide(v34, &slice, &remainder, v11, CGRectMaxYEdge);
  -[UIView setFrame:](self->_glassShelf, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  -[UIView bounds](self->_glassShelf, "bounds");
  CGRectDivide(v35, &v29, &v30, v8, CGRectMaxYEdge);
  -[PBBottomBar setFrame:](self->_bottomBar, "setFrame:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
  -[PBController _centerOfTileAtIndex:](self, "_centerOfTileAtIndex:", 0);
  v13 = v12;
  v15 = v14;
  v16 = *((_BYTE *)self + 208);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  tiles = self->_tiles;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tiles, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v18)
  {
    v19 = v18;
    if ((v16 & 4) != 0)
      v20 = 116.0;
    else
      v20 = 100.0;
    v21 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(tiles);
        v23 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v23, "setFrame:", 0.0, 0.0, v20, v20);
        objc_msgSend(v23, "setSmallSize:", (*((_BYTE *)self + 208) & 4) == 0);
        objc_msgSend(v23, "setCenter:", v13, v15);
        v13 = v20 + 2.0 + v13;
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tiles, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v19);
  }
  -[PBController _updatePhotoShelfContentLayout](self, "_updatePhotoShelfContentLayout");
  -[PBController _updateStackContainerLayout](self, "_updateStackContainerLayout");
  curtain = self->_curtain;
  objc_msgSend(a3, "bounds");
  -[PBCurtainView setFrame:](curtain, "setFrame:");
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  void (**didEndScrollingBlock)(id, SEL, id);

  didEndScrollingBlock = (void (**)(id, SEL, id))self->_didEndScrollingBlock;
  if (didEndScrollingBlock)
  {
    didEndScrollingBlock[2](didEndScrollingBlock, a2, a3);
    -[PBController _setDidEndScrollingBlock:](self, "_setDidEndScrollingBlock:", 0);
  }
}

- (void)_setDidEndScrollingBlock:(id)a3
{
  id didEndScrollingBlock;

  didEndScrollingBlock = self->_didEndScrollingBlock;
  if (didEndScrollingBlock)
  {
    _Block_release(didEndScrollingBlock);
    self->_didEndScrollingBlock = 0;
  }
  if (a3)
    self->_didEndScrollingBlock = _Block_copy(a3);
}

- (id)pageController:(id)a3 viewControllerLeftOfController:(id)a4
{
  char *v5;

  if (a4)
    v5 = (char *)objc_msgSend(a3, "indexOfViewController:", a4) - 1;
  else
    v5 = (char *)objc_msgSend(a3, "visibleIndex");
  return -[PBController _viewControllerAtIndex:](self, "_viewControllerAtIndex:", v5);
}

- (id)pageController:(id)a3 viewControllerRightOfController:(id)a4
{
  char *v5;

  if (a4)
    v5 = (char *)objc_msgSend(a3, "indexOfViewController:", a4) + 1;
  else
    v5 = (char *)objc_msgSend(a3, "visibleIndex");
  return -[PBController _viewControllerAtIndex:](self, "_viewControllerAtIndex:", v5);
}

- (void)pageControllerWillBeginPaging:(id)a3
{
  -[PBController hideShelf:](self, "hideShelf:", 1);
}

- (id)_viewControllerAtIndex:(unint64_t)a3
{
  return -[PBTileController initWithPhoto:]([PBTileController alloc], "initWithPhoto:", -[PHFetchResult objectAtIndex:](self->_assetsFetchResult, "objectAtIndex:", a3));
}

- (void)stackControllerDidStopStackingViews:(id)a3
{
  void (**didStopStackingBlock)(id, SEL, id);

  didStopStackingBlock = (void (**)(id, SEL, id))self->_didStopStackingBlock;
  if (didStopStackingBlock)
  {
    didStopStackingBlock[2](didStopStackingBlock, a2, a3);
    -[PBController _setDidStopStackingBlock:](self, "_setDidStopStackingBlock:", 0);
  }
}

- (void)stackControllerWillStartAnimatingViews:(id)a3
{
  id v3;

  v3 = -[PBController _stackContainerView](self, "_stackContainerView", a3);
  objc_msgSend(objc_msgSend(v3, "window"), "beginDisablingInterfaceAutorotation");
  objc_msgSend(objc_msgSend(v3, "layer"), "setShouldRasterize:", 1);
  objc_msgSend(objc_msgSend(v3, "subviews"), "setValue:forKeyPath:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), CFSTR("layer.shouldRasterize"));
}

- (void)stackControllerDidStopAnimatingViews:(id)a3
{
  id v3;

  v3 = -[PBController _stackContainerView](self, "_stackContainerView", a3);
  objc_msgSend(objc_msgSend(v3, "layer"), "setShouldRasterize:", 0);
  objc_msgSend(objc_msgSend(v3, "subviews"), "setValue:forKeyPath:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), CFSTR("layer.shouldRasterize"));
  objc_msgSend(objc_msgSend(v3, "window"), "endDisablingInterfaceAutorotationAnimated:", 1);
}

- (void)_setDidStopStackingBlock:(id)a3
{
  id didStopStackingBlock;

  didStopStackingBlock = self->_didStopStackingBlock;
  if (didStopStackingBlock)
  {
    _Block_release(didStopStackingBlock);
    self->_didStopStackingBlock = 0;
  }
  if (a3)
    self->_didStopStackingBlock = _Block_copy(a3);
}

- (id)defaultItemForStackController:(id)a3
{
  return -[PBShelfTile uuid](self->_highlightedTile, "uuid", a3);
}

- (id)defaultViewForStackController:(id)a3
{
  id result;
  PHFetchResult *assetsFetchResult;
  NSString *v6;
  uint64_t v7;
  id v8;
  id v9;
  UIView *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  result = self->_defaultStackView;
  if (!result)
  {
    assetsFetchResult = self->_assetsFetchResult;
    v6 = -[PBShelfTile uuid](self->_highlightedTile, "uuid", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x3052000000;
    v15 = sub_10000AF04;
    v16 = sub_10000AF14;
    v17 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000FE20;
    v11[3] = &unk_100034D90;
    v11[4] = v6;
    v11[5] = &v12;
    -[PHFetchResult enumerateObjectsUsingBlock:](assetsFetchResult, "enumerateObjectsUsingBlock:", v11);
    v7 = v13[5];
    _Block_object_dispose(&v12, 8);
    v8 = -[PBController _stackContainerView](self, "_stackContainerView");
    v9 = objc_msgSend(-[PBController _visibleTileController](self, "_visibleTileController"), "imageView");
    objc_msgSend(v9, "bounds");
    objc_msgSend(v9, "convertRect:toView:", v8);
    v10 = -[PBController _newStackTileForPhoto:withFrame:](self, "_newStackTileForPhoto:withFrame:", v7);
    self->_defaultStackView = v10;
    -[UIView setTag:](v10, "setTag:", 3);
    objc_msgSend(v8, "addSubview:", self->_defaultStackView);
    return self->_defaultStackView;
  }
  return result;
}

- (id)stackController:(id)a3 viewForItem:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  PHFetchResult *assetsFetchResult;
  uint64_t v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;

  objc_msgSend(-[PBController _stackContainerView](self, "_stackContainerView", a3), "stackBounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  assetsFetchResult = self->_assetsFetchResult;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = sub_10000AF04;
  v22 = sub_10000AF14;
  v23 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000FE20;
  v17[3] = &unk_100034D90;
  v17[4] = a4;
  v17[5] = &v18;
  -[PHFetchResult enumerateObjectsUsingBlock:](assetsFetchResult, "enumerateObjectsUsingBlock:", v17);
  v15 = v19[5];
  _Block_object_dispose(&v18, 8);
  return -[PBController _newStackTileForPhoto:withFrame:](self, "_newStackTileForPhoto:withFrame:", v15, v7, v9, v11, v13);
}

- (BOOL)stackController:(id)a3 isDataLoadedForItem:(id)a4 inView:(id)a5
{
  return 1;
}

- (id)_newStackTileForPhoto:(id)a3 withFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  PHImageManager *v12;
  id v13;
  id v14;
  uint64_t v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v16 = 0;
  v9 = PHFullScreenSizeForScreen(+[UIScreen mainScreen](UIScreen, "mainScreen"), &v16);
  v11 = v10;
  v12 = +[PHImageManager defaultManager](PHImageManager, "defaultManager");
  v13 = -[PHImageManager synchronousImageForAsset:targetSize:contentMode:options:](v12, "synchronousImageForAsset:targetSize:contentMode:options:", a3, v16, 0, v9, v11);
  v14 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", x, y, width, height);
  objc_msgSend(v14, "setAutoresizingMask:", 0);
  objc_msgSend(v14, "setContentMode:", 2);
  objc_msgSend(v14, "setImage:", v13);
  objc_msgSend(v14, "setClipsToBounds:", 1);
  objc_msgSend(v14, "setOpaque:", 1);
  return v14;
}

- (void)_tileWillZoom:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "object");
  if (v4 == -[PBController _visibleTileController](self, "_visibleTileController"))
    -[PBController hideShelf:](self, "hideShelf:", 1);
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  if (self->__sharingPopoverController == a3)
  {
    objc_msgSend(a3, "setDelegate:", 0);

    self->__sharingPopoverController = 0;
  }
}

- (BOOL)_dismissPopovers
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;
  UIPopoverController *sharingPopoverController;

  v3 = -[PBController presentedViewController](self, "presentedViewController");
  v5 = objc_opt_class(UIAlertController, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);
  if ((isKindOfClass & 1) != 0)
    -[PBController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  sharingPopoverController = self->__sharingPopoverController;
  if (sharingPopoverController)
  {
    isKindOfClass = 1;
    -[UIPopoverController dismissPopoverAnimated:](sharingPopoverController, "dismissPopoverAnimated:", 1);
    -[PBController popoverControllerDidDismissPopover:](self, "popoverControllerDidDismissPopover:", self->__sharingPopoverController);
  }
  return isKindOfClass & 1;
}

- (void)addBlockNamed:(id)a3 block:(id)a4
{
  id v7;
  NSMutableDictionary *actionBlockMap;

  v7 = -[NSMutableDictionary objectForKey:](self->_actionBlockMap, "objectForKey:");
  if (v7)
    _Block_release(v7);
  actionBlockMap = self->_actionBlockMap;
  if (a4)
    -[NSMutableDictionary setObject:forKey:](actionBlockMap, "setObject:forKey:", _Block_copy(a4), a3);
  else
    -[NSMutableDictionary removeObjectForKey:](actionBlockMap, "removeObjectForKey:", a3);
}

- (void)removeBlockNamed:(id)a3
{
  -[PBController addBlockNamed:block:](self, "addBlockNamed:block:", a3, 0);
}

- (void)performBlockNamed:(id)a3 removeFromMap:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  const void *v8;

  v4 = a4;
  v7 = -[NSMutableDictionary objectForKey:](self->_actionBlockMap, "objectForKey:");
  if (v7)
  {
    v8 = v7;
    (*((void (**)(void))v7 + 2))();
    if (v4)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_actionBlockMap, "removeObjectForKey:", a3);
      _Block_release(v8);
    }
  }
}

- (void)_removeAllNamedBlocks
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[NSMutableDictionary allValues](self->_actionBlockMap, "allValues", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        _Block_release(*(const void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[NSMutableDictionary removeAllObjects](self->_actionBlockMap, "removeAllObjects");
}

- (int)currentMode
{
  return self->_currentMode;
}

- (void)_setTiles:(id)a3
{

  self->_tiles = (NSMutableArray *)a3;
}

- (NSArray)tiles
{
  return &self->_tiles->super;
}

- (id)_visibleTileController
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = -[UIPageController visibleViewController](self->_pageController, "visibleViewController");
  v4 = objc_opt_class(PBTileController, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0)
    return v2;
  else
    return 0;
}

- (void)setCurrentMode:(int)a3
{
  -[PBController setCurrentMode:animated:](self, "setCurrentMode:animated:", *(_QWORD *)&a3, 0);
}

- (void)setCurrentMode:(int)a3 animated:(BOOL)a4
{
  int currentMode;
  _BOOL8 v5;

  currentMode = self->_currentMode;
  if (currentMode != a3)
  {
    v5 = a4;
    switch(currentMode)
    {
      case 3:
        -[PBController _stopEditModeAnimated:](self, "_stopEditModeAnimated:", a4);
        break;
      case 2:
        -[PBController _stopSelectionModeAnimated:](self, "_stopSelectionModeAnimated:", a4);
        break;
      case 1:
        -[PBController _stopCaptureModeAnimated:](self, "_stopCaptureModeAnimated:", a4);
        break;
    }
    self->_currentMode = a3;
    switch(a3)
    {
      case 3:
        -[PBController _startEditModeAnimated:](self, "_startEditModeAnimated:", v5);
        break;
      case 2:
        -[PBController _startSelectionModeAnimated:](self, "_startSelectionModeAnimated:", v5);
        break;
      case 1:
        -[PBController _startCaptureModeAnimated:](self, "_startCaptureModeAnimated:", v5);
        break;
    }
  }
}

- (void)_startCaptureModeAnimated:(BOOL)a3
{
  -[PBBottomBar setItems:animated:](self->_bottomBar, "setItems:animated:", -[PBController _captureBarButtonItems](self, "_captureBarButtonItems", a3), 1);
  -[PBEffectsController startRendering:](self->_effectsController, "startRendering:", self);
  -[PBEffectsController viewWillAppear:](self->_effectsController, "viewWillAppear:", *((_BYTE *)self + 208) & 1);
  -[PBEffectsController viewDidAppear:](self->_effectsController, "viewDidAppear:", *((_BYTE *)self + 208) & 1);
}

- (void)_stopCaptureModeAnimated:(BOOL)a3
{
  -[PBEffectsController stopRendering:](self->_effectsController, "stopRendering:", self);
  -[PBEffectsController viewWillDisappear:](self->_effectsController, "viewWillDisappear:", *((_BYTE *)self + 208) & 1);
  -[PBEffectsController viewDidDisappear:](self->_effectsController, "viewDidDisappear:", *((_BYTE *)self + 208) & 1);
}

- (void)_startSelectionModeAnimated:(BOOL)a3
{
  UIPageController *v4;
  id v5;
  NSUInteger v6;
  _QWORD v7[5];

  v4 = (UIPageController *)objc_alloc_init((Class)UIPageController);
  self->_pageController = v4;
  v5 = -[UIPageController view](v4, "view");
  objc_msgSend(v5, "setAlpha:", 0.0);
  objc_msgSend(v5, "setBackgroundColor:", +[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  -[UIView bounds](self->_contentView, "bounds");
  objc_msgSend(v5, "setFrame:");
  -[PBController addChildViewController:](self, "addChildViewController:", self->_pageController);
  -[UIView insertSubview:below:](self->_contentView, "insertSubview:below:", v5, self->_glassShelf);
  -[UIPageController didMoveToParentViewController:](self->_pageController, "didMoveToParentViewController:", self);
  v6 = -[PHFetchResult count](self->_assetsFetchResult, "count");
  -[UIPageController setDelegate:](self->_pageController, "setDelegate:", self);
  -[UIPageController setPageSpacing:](self->_pageController, "setPageSpacing:", 20.0);
  -[UIPageController setPageCount:](self->_pageController, "setPageCount:", v6);
  -[PBController _updateVisiblePhoto](self, "_updateVisiblePhoto");
  -[PBController _resumeSelectionMode](self, "_resumeSelectionMode");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000EA14;
  v7[3] = &unk_100034A48;
  v7[4] = v5;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v7, 0.25);
}

- (void)_resumeSelectionMode
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = -[UIPageController view](self->_pageController, "view");
  v4 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "toggleShelf:");
  objc_msgSend(v3, "addGestureRecognizer:", v4);
  v5 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "toggleZoom:");
  objc_msgSend(v5, "setNumberOfTapsRequired:", 2);
  objc_msgSend(v3, "addGestureRecognizer:", v5);
  v6 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "displayPopupMenu:");
  objc_msgSend(v6, "setMinimumPressDuration:", 0.75);
  objc_msgSend(v3, "addGestureRecognizer:", v6);
  objc_msgSend(v4, "requireGestureRecognizerToFail:", v5);

  -[PBBottomBar setItems:animated:](self->_bottomBar, "setItems:animated:", -[PBController _selectionBarButtonItems](self, "_selectionBarButtonItems"), 1);
  -[PBController showShelf:](self, "showShelf:", 1);
  -[PBController scrollTileToVisible:animated:](self, "scrollTileToVisible:animated:", self->_highlightedTile, 1);
  objc_msgSend(-[UIPageController view](self->_pageController, "view"), "setUserInteractionEnabled:", 1);
}

- (void)_pauseSelectionMode
{
  id v2;

  v2 = -[UIPageController view](self->_pageController, "view");
  objc_msgSend(v2, "removeAllGestureRecognizers");
  objc_msgSend(v2, "setUserInteractionEnabled:", 0);
}

- (void)_stopSelectionModeAnimated:(BOOL)a3
{
  UIPageController *pageController;
  _QWORD v5[5];
  _QWORD v6[5];

  pageController = self->_pageController;
  -[PBController _pauseSelectionMode](self, "_pauseSelectionMode", a3);
  v5[4] = pageController;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000EC4C;
  v6[3] = &unk_100034A48;
  v6[4] = pageController;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000EC68;
  v5[3] = &unk_100034A70;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v5, 0.25);
  -[UIPageController setDelegate:](self->_pageController, "setDelegate:", 0);

  self->_pageController = 0;
}

- (void)_startEditModeAnimated:(BOOL)a3
{
  -[PBBottomBar setItems:animated:](self->_bottomBar, "setItems:animated:", -[PBController _editBarButtonItems](self, "_editBarButtonItems", a3), 1);
  -[NSMutableArray setValue:forKeyPath:](self->_tiles, "setValue:forKeyPath:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), CFSTR("showsBadge"));
  -[StackController displayStackedViewsForItems:animated:](self->_stackController, "displayStackedViewsForItems:animated:", -[PBController _selectedStackItems](self, "_selectedStackItems"), 1);
  -[PBController selectTile:](self, "selectTile:", self->_highlightedTile);
}

- (void)pushEditMode
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[6];

  -[PBController _pauseSelectionMode](self, "_pauseSelectionMode");
  -[PBShelfTile setIcon:inCorner:offset:](self->_highlightedTile, "setIcon:inCorner:offset:", 0, 0, CGSizeZero.width, CGSizeZero.height);
  v3 = -[PBController _stackContainerView](self, "_stackContainerView");
  if (v3)
  {
    v4 = v3;
    -[PBController _setDidStopStackingBlock:](self, "_setDidStopStackingBlock:", 0);
  }
  else
  {
    v4 = -[PBController _initializeStackRootView](self, "_initializeStackRootView");
  }
  v5 = -[PBController _visibleTileController](self, "_visibleTileController");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000EE30;
  v6[3] = &unk_100034AE8;
  v6[4] = v4;
  v6[5] = self;
  objc_msgSend(v5, "setDidEndZoomingBlock:", v6);
  objc_msgSend(v5, "zoomToFit:", self);
  self->_currentMode = 2;
  -[PBController _startSelectionModeAnimated:](self, "_startSelectionModeAnimated:", 1);
}

- (void)popEditMode
{
  objc_msgSend(-[UIPageController view](self->_pageController, "view"), "setHidden:", 0);
  -[PBController _stopEditModeAnimated:](self, "_stopEditModeAnimated:", 1);
  self->_currentMode = 2;
  -[PBShelfTile setReviewed:](self->_highlightedTile, "setReviewed:", 1);
  -[PBController _resumeSelectionMode](self, "_resumeSelectionMode");
}

- (void)_stopEditModeAnimated:(BOOL)a3
{
  _QWORD v4[5];

  -[PBController _dismissPopovers](self, "_dismissPopovers", a3);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000EF88;
  v4[3] = &unk_100034A48;
  v4[4] = self;
  -[PBController _setDidStopStackingBlock:](self, "_setDidStopStackingBlock:", v4);
  -[NSMutableArray setValue:forKeyPath:](self->_tiles, "setValue:forKeyPath:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), CFSTR("showsBadge"));
  -[StackController removeStackedViews:](self->_stackController, "removeStackedViews:", 1);
  -[PBController deselectAllTiles](self, "deselectAllTiles");
}

- (void)takePicture:(id)a3
{
  if (!-[PBController _dismissPopovers](self, "_dismissPopovers"))
  {
    if (self->_currentMode == 1)
    {
      -[PBEffectsController takePicture:](self->_effectsController, "takePicture:", a3);
    }
    else
    {
      -[PBController deselectAllTiles](self, "deselectAllTiles");
      -[PBController setHighlightedTile:](self, "setHighlightedTile:", 0);
      -[PBController setCurrentMode:](self, "setCurrentMode:", 1);
    }
  }
}

- (void)toggleEffectsMode:(id)a3
{
  if (!-[PBController _dismissPopovers](self, "_dismissPopovers"))
  {
    if (self->_currentMode == 1)
    {
      -[PBEffectsController toggleEffectsMode:](self->_effectsController, "toggleEffectsMode:", a3);
    }
    else
    {
      -[PBController deselectAllTiles](self, "deselectAllTiles");
      -[PBController setHighlightedTile:](self, "setHighlightedTile:", 0);
      -[PBController setCurrentMode:](self, "setCurrentMode:", 1);
    }
  }
}

- (void)_shareCurrentlySelectedPhotos:(id)a3
{
  NSArray *v4;
  id v5;
  PBLinkPresentationActivityItemProvider *v6;
  id v7;
  NSMutableArray *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  id v11;

  -[PBController _dismissPopovers](self, "_dismissPopovers", a3);
  v4 = -[PBController _selectedPhotos](self, "_selectedPhotos");
  if (!-[NSArray count](v4, "count") && self->_highlightedTile)
  {
    v11 = -[PHFetchResult objectAtIndex:](self->_assetsFetchResult, "objectAtIndex:", -[NSMutableArray indexOfObject:](self->_tiles, "indexOfObject:"));
    v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1);
  }
  v5 = +[PUActivityAssetItem itemsForAssets:](PUActivityAssetItem, "itemsForAssets:", +[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v4));
  v6 = -[PBLinkPresentationActivityItemProvider initWithAsset:]([PBLinkPresentationActivityItemProvider alloc], "initWithAsset:", -[NSArray firstObject](v4, "firstObject"));
  v7 = objc_msgSend(objc_alloc((Class)PUActivityViewController), "initWithAssetItems:photosApplicationActivities:linkPresentation:", v5, 0, v6);

  v10[0] = PUActivityTypeSlideShow;
  v10[1] = PUActivityTypeAirPlay;
  v10[2] = UIActivityTypeAddToReadingList;
  v10[3] = UIActivityTypeAssignToContact;
  v10[4] = UIActivityTypePrint;
  v8 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 5));
  -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", +[PUActivityViewController externalApplicationExcludedPhotosActivityTypes](PUActivityViewController, "externalApplicationExcludedPhotosActivityTypes"));
  objc_msgSend(v7, "setExcludedActivityTypes:", v8);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000F32C;
  v9[3] = &unk_100034D68;
  v9[4] = self;
  objc_msgSend(v7, "setCompletionWithItemsHandler:", v9);

  self->__sharingPopoverController = (UIPopoverController *)objc_msgSend(objc_alloc((Class)PUPopoverController), "initWithContentViewController:", v7);
  -[UIPopoverController presentPopoverFromBarButtonItem:permittedArrowDirections:animated:](self->__sharingPopoverController, "presentPopoverFromBarButtonItem:permittedArrowDirections:animated:", -[PBController _shareBarButtonItem](self, "_shareBarButtonItem"), 3, 0);
  -[UIPopoverController setDelegate:](self->__sharingPopoverController, "setDelegate:", self);
}

- (void)_deleteCurrentlySelectedPhotos:(id)a3
{
  NSMutableIndexSet *selectedItems;

  if (!-[PBController _dismissPopovers](self, "_dismissPopovers"))
  {
    selectedItems = self->_selectedItems;
    if (!-[NSMutableIndexSet count](selectedItems, "count"))
    {
      if (self->_highlightedTile)
        -[NSMutableIndexSet addIndex:](selectedItems, "addIndex:", -[NSMutableArray indexOfObject:](self->_tiles, "indexOfObject:"));
    }
    -[PBController _confirmDeleteItems:showFromObject:](self, "_confirmDeleteItems:showFromObject:", selectedItems, a3);
  }
}

- (void)_enterEditMode:(id)a3
{
  -[PBController setCurrentMode:animated:](self, "setCurrentMode:animated:", 3, 1);
}

- (void)_cancelEditMode:(id)a3
{
  -[PBController setCurrentMode:animated:](self, "setCurrentMode:animated:", 2, 1);
}

- (UIBarButtonItem)_filterBarButtonItem
{
  UIBarButtonItem *result;
  CAMFilterButton *v4;

  result = self->__filterBarButtonItem;
  if (!result)
  {
    v4 = -[PBController _filterButton](self, "_filterButton");
    -[CAMFilterButton sizeToFit](v4, "sizeToFit");
    result = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v4);
    self->__filterBarButtonItem = result;
  }
  return result;
}

- (UIBarButtonItem)_shutterBarButtonItem
{
  UIBarButtonItem *result;
  CUShutterButton *v4;

  result = self->__shutterBarButtonItem;
  if (!result)
  {
    v4 = -[PBController _shutterButton](self, "_shutterButton");
    -[CUShutterButton sizeToFit](v4, "sizeToFit");
    result = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v4);
    self->__shutterBarButtonItem = result;
  }
  return result;
}

- (UIBarButtonItem)_flipBarButtonItem
{
  UIBarButtonItem *result;

  result = self->__flipBarButtonItem;
  if (!result)
  {
    -[CAMFlipButton sizeToFit](-[PBController _flipButton](self, "_flipButton"), "sizeToFit");
    result = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", -[PBController _flipButton](self, "_flipButton"));
    self->__flipBarButtonItem = result;
  }
  return result;
}

- (id)_buttonWithSystemImageNamed:(id)a3 touchUpInsideAction:(SEL)a4
{
  UIImage *v6;
  id v7;
  id v8;

  v6 = -[UIImage imageByApplyingSymbolConfiguration:](+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", a3), "imageByApplyingSymbolConfiguration:", +[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 3));
  v7 = objc_alloc((Class)UIButton);
  -[UIImage size](v6, "size");
  v8 = objc_msgSend(v7, "initWithSize:");
  objc_msgSend(v8, "setImage:forState:", v6, 0);
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, a4, 64);
  return v8;
}

- (UIBarButtonItem)_shareBarButtonItem
{
  UIBarButtonItem *result;

  result = self->__shareBarButtonItem;
  if (!result)
  {
    result = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", -[PBController _buttonWithSystemImageNamed:touchUpInsideAction:](self, "_buttonWithSystemImageNamed:touchUpInsideAction:", CFSTR("square.and.arrow.up"), "_shareCurrentlySelectedPhotos:"));
    self->__shareBarButtonItem = result;
  }
  return result;
}

- (UIBarButtonItem)_editBarButtonItem
{
  UIBarButtonItem *result;

  result = self->__editBarButtonItem;
  if (!result)
  {
    result = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", PLLocalizedFrameworkString(CFSTR("Edit"), &stru_100035390), 0, self, "_enterEditMode:");
    self->__editBarButtonItem = result;
  }
  return result;
}

- (UIBarButtonItem)_deleteBarButtonItem
{
  UIBarButtonItem *result;

  result = self->__deleteBarButtonItem;
  if (!result)
  {
    result = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", -[PBController _buttonWithSystemImageNamed:touchUpInsideAction:](self, "_buttonWithSystemImageNamed:touchUpInsideAction:", CFSTR("trash"), "_deleteCurrentlySelectedPhotos:"));
    self->__deleteBarButtonItem = result;
  }
  return result;
}

- (UIBarButtonItem)_selectionLabelBarButtonItem
{
  UIBarButtonItem *result;

  result = self->__selectionLabelBarButtonItem;
  if (!result)
  {
    result = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", -[PBController _selectionLabel](self, "_selectionLabel"));
    self->__selectionLabelBarButtonItem = result;
  }
  return result;
}

- (UIBarButtonItem)_cancelBarButtonItem
{
  UIBarButtonItem *result;

  result = self->__cancelBarButtonItem;
  if (!result)
  {
    result = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", PLLocalizedFrameworkString(CFSTR("Cancel"), &stru_100035390), 0, self, "_cancelEditMode:");
    self->__cancelBarButtonItem = result;
  }
  return result;
}

- (NSArray)_captureBarButtonItems
{
  NSArray *result;
  id v4;
  id v5;
  id v6;

  result = self->__captureBarButtonItems;
  if (!result)
  {
    v4 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    objc_msgSend(v4, "setWidth:", 13.0);
    v5 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    objc_msgSend(v5, "setWidth:", 13.0);
    v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    self->__captureBarButtonItems = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v4, -[PBController _filterBarButtonItem](self, "_filterBarButtonItem"), v6, -[PBController _shutterBarButtonItem](self, "_shutterBarButtonItem"), v6, -[PBController _flipBarButtonItem](self, "_flipBarButtonItem"), v5, 0);

    return self->__captureBarButtonItems;
  }
  return result;
}

- (NSArray)_selectionBarButtonItems
{
  NSArray *result;
  id v4;
  double v5;
  id v6;
  double v7;
  id v8;
  id v9;
  id v10;

  result = self->__selectionBarButtonItems;
  if (!result)
  {
    v10 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    objc_msgSend(v10, "setWidth:", 13.0);
    v4 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
    objc_msgSend(v4, "setWidth:", 1.0 / v5 + 37.0);
    v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
    objc_msgSend(v6, "setWidth:", 1.0 / v7 + 47.0);
    v8 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    objc_msgSend(v8, "setWidth:", 13.0);
    v9 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    self->__selectionBarButtonItems = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v10, -[PBController _filterBarButtonItem](self, "_filterBarButtonItem"), v4, -[PBController _shareBarButtonItem](self, "_shareBarButtonItem"), v6, -[PBController _deleteBarButtonItem](self, "_deleteBarButtonItem"), v9, -[PBController _shutterBarButtonItem](self, "_shutterBarButtonItem"), v9, 0);

    return self->__selectionBarButtonItems;
  }
  return result;
}

- (NSArray)_editBarButtonItems
{
  NSArray *result;
  id v4;
  double v5;
  id v6;
  double v7;
  id v8;
  id v9;

  result = self->__editBarButtonItems;
  if (!result)
  {
    v4 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
    objc_msgSend(v4, "setWidth:", 1.0 / v5 + 22.0);
    v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
    objc_msgSend(v6, "setWidth:", 1.0 / v7 + 47.0);
    v8 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    objc_msgSend(v8, "setWidth:", 13.0);
    v9 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    self->__editBarButtonItems = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v4, -[PBController _deleteBarButtonItem](self, "_deleteBarButtonItem"), v6, -[PBController _shareBarButtonItem](self, "_shareBarButtonItem"), v9, -[PBController _selectionLabelBarButtonItem](self, "_selectionLabelBarButtonItem"), v9, -[PBController _cancelBarButtonItem](self, "_cancelBarButtonItem"), v8, 0);

    return self->__editBarButtonItems;
  }
  return result;
}

- (id)_toolbarItemsForControllerMode:(int)a3
{
  switch(a3)
  {
    case 3:
      return -[PBController _editBarButtonItems](self, "_editBarButtonItems");
    case 2:
      return -[PBController _selectionBarButtonItems](self, "_selectionBarButtonItems");
    case 1:
      return -[PBController _captureBarButtonItems](self, "_captureBarButtonItems");
  }
  return 0;
}

- (void)_updateSelectionLabel
{
  id v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = -[NSMutableIndexSet count](self->_selectedItems, "count");
  v4 = CFSTR("PLURAL_SELECTED_MESSAGE");
  if (v3 == (id)1)
    v4 = CFSTR("ONE_SELECTED_MESSAGE");
  if (v3)
    v5 = v4;
  else
    v5 = CFSTR("SELECT_PHOTOS_MESSAGE");
  -[UILabel setText:](self->__selectionLabel, "setText:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", -[NSBundle localizedStringForKey:value:table:](+[NSBundle mainBundle](NSBundle, "mainBundle"), "localizedStringForKey:value:table:", v5, &stru_100035390, CFSTR("PhotoBooth")), v3));
  -[UILabel sizeToFit](self->__selectionLabel, "sizeToFit");
}

- (id)effectsController
{
  return self->_effectsController;
}

- (unint64_t)shelfAssetCount
{
  return -[PHFetchResult count](self->_assetsFetchResult, "count");
}

- (id)photoShelf
{
  return self->_photoShelf;
}

- (void)selectFirstShelfAsset
{
  -[PBController showShelf:](self, "showShelf:", 0);
  -[PBController setCurrentMode:animated:](self, "setCurrentMode:animated:", 2, 1);
  -[PBController _updateHighlightedTile](self, "_updateHighlightedTile");
}

- (CAMFilterButton)_filterButton
{
  return self->__filterButton;
}

- (CUShutterButton)_shutterButton
{
  return self->__shutterButton;
}

- (CAMFlipButton)_flipButton
{
  return self->__flipButton;
}

- (UILabel)_selectionLabel
{
  return self->__selectionLabel;
}

- (UIPopoverController)_sharingPopoverController
{
  return self->__sharingPopoverController;
}

@end
