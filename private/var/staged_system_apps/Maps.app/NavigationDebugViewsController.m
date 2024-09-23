@implementation NavigationDebugViewsController

- (NavigationDebugViewsController)init
{
  return -[NavigationDebugViewsController initWithDelegate:](self, "initWithDelegate:", 0);
}

- (NavigationDebugViewsController)initWithDelegate:(id)a3
{
  id v4;
  NavigationDebugViewsController *v5;
  NavigationDebugViewsController *v6;
  uint64_t v7;
  MNTrace *trace;
  MNTraceBookmarkRecorder *v9;
  MNTraceBookmarkRecorder *bookmarkRecorder;
  void *v11;
  NavigationDebugViewsController *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NavigationDebugViewsController;
  v5 = -[NavigationDebugViewsController init](&v14, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    -[MNTracePlayer registerObserver:](v6->_tracePlayer, "registerObserver:", v6);
    v7 = objc_claimAutoreleasedReturnValue(-[MNTracePlayer trace](v6->_tracePlayer, "trace"));
    trace = v6->_trace;
    v6->_trace = (MNTrace *)v7;

    v9 = (MNTraceBookmarkRecorder *)objc_msgSend(objc_alloc((Class)MNTraceBookmarkRecorder), "initWithTrace:", v6->_trace);
    bookmarkRecorder = v6->_bookmarkRecorder;
    v6->_bookmarkRecorder = v9;

    -[NavigationDebugViewsController setAutomaticallyHideTraceControls:](v6, "setAutomaticallyHideTraceControls:", 1);
    v6->_showTraceControlsForStaleLocations = 1;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v11, "registerObserver:", v6);
    v12 = v6;

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NavigationDebugViewsController resetTracePlayer](self, "resetTracePlayer");
  -[TraceControlView setDelegate:](self->_traceControlView, "setDelegate:", 0);
  -[TraceSliderView setDelegate:](self->_traceSliderView, "setDelegate:", 0);
  -[UILongPressGestureRecognizer setDelegate:](self->_bookmarkGestureRecognizer, "setDelegate:", 0);
  -[NSTimer invalidate](self->_hideTraceControlTimer, "invalidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NavigationDebugViewsController;
  -[NavigationDebugViewsController dealloc](&v4, "dealloc");
}

- (void)prepareToRunNavigation
{
  -[TraceControlView setIsPlaying:](self->_traceControlView, "setIsPlaying:", 1);
  -[TraceControlView setPlaySpeed:](self->_traceControlView, "setPlaySpeed:", 1.0);
}

- (void)showTraceControls
{
  TraceSliderView *traceSliderView;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  if (!self->_traceControlsAreShowing)
  {
    self->_traceControlsAreShowing = 1;
    traceSliderView = self->_traceSliderView;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v4, "tracePosition");
    -[TraceSliderView setTraceTime:](traceSliderView, "setTraceTime:");

    v5[4] = self;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100BDFC98;
    v6[3] = &unk_1011AC860;
    v6[4] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100BDFCA8;
    v5[3] = &unk_1011AE8F8;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v5, 0.3);
  }
}

- (void)resetTracePlayer
{
  MNTracePlayer *tracePlayer;

  -[MNTracePlayer unregisterObserver:](self->_tracePlayer, "unregisterObserver:", self);
  tracePlayer = self->_tracePlayer;
  self->_tracePlayer = 0;

}

- (MNTracePlayer)tracePlayer
{
  return self->_tracePlayer;
}

- (void)setAutomaticallyHideTraceControls:(BOOL)a3
{
  if (self->_automaticallyHideTraceControls != a3)
  {
    self->_automaticallyHideTraceControls = a3;
    -[NavigationDebugViewsController resetHideTraceControlsTimer](self, "resetHideTraceControlsTimer");
  }
}

- (void)resetHideTraceControlsTimer
{
  NSTimer *hideTraceControlTimer;
  id v4;

  hideTraceControlTimer = self->_hideTraceControlTimer;
  if (hideTraceControlTimer)
    -[NSTimer invalidate](hideTraceControlTimer, "invalidate");
  if (self->_automaticallyHideTraceControls && self->_traceControlsAreShowing)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "hideTraceControls", 0, 0, 5.0));
    -[NavigationDebugViewsController setHideTraceControlTimer:](self, "setHideTraceControlTimer:", v4);

  }
}

- (void)hideTraceControls
{
  -[NavigationDebugViewsController hideTraceControlsAnimated:](self, "hideTraceControlsAnimated:", 0);
}

- (void)hideTraceControlsAnimated:(BOOL)a3
{
  _BOOL4 v3;
  NSTimer *hideTraceControlTimer;
  double v6;
  _QWORD v7[5];

  v3 = a3;
  hideTraceControlTimer = self->_hideTraceControlTimer;
  if (hideTraceControlTimer)
  {
    -[NSTimer invalidate](hideTraceControlTimer, "invalidate");
    -[NavigationDebugViewsController setHideTraceControlTimer:](self, "setHideTraceControlTimer:", 0);
  }
  if (!-[TraceSliderView isSliderEditing](self->_traceSliderView, "isSliderEditing") && self->_traceControlsAreShowing)
  {
    self->_traceControlsAreShowing = 0;
    v6 = 0.3;
    if (!v3)
      v6 = 0.0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100BDFE40;
    v7[3] = &unk_1011AC860;
    v7[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v7, v6);
  }
}

- (BOOL)_isSimulating
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v3 = (objc_msgSend(v2, "isNavigatingFromTrace") & 1) == 0
    && objc_msgSend(v2, "simulationType")
    && objc_msgSend(v2, "simulationType") != (id)-1;

  return v3;
}

- (double)debugViewHeight
{
  double v2;

  if (!self->_debugViewsWereAdded)
    return 0.0;
  -[UIView systemLayoutSizeFittingSize:](self->_debugControlsView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  return v2;
}

- (UIView)debugControlsView
{
  UIView *debugControlsView;
  id v4;
  double y;
  double width;
  double height;
  UIView *v8;
  UIView *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  TraceControlView *v14;
  TraceControlView *traceControlView;
  TraceSliderView *v16;
  TraceSliderView *traceSliderView;
  void *v18;
  double v19;
  double v20;
  TraceSliderView *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  _QWORD v45[7];

  debugControlsView = self->_debugControlsView;
  if (!debugControlsView)
  {
    v4 = objc_alloc((Class)UIView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v8 = (UIView *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    v9 = self->_debugControlsView;
    self->_debugControlsView = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.5));
    -[UIView setBackgroundColor:](self->_debugControlsView, "setBackgroundColor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_debugControlsView, "layer"));
    objc_msgSend(v11, "setCornerRadius:", 10.0);

    v12 = -[NavigationDebugViewsController _isSimulating](self, "_isSimulating");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    if ((objc_msgSend(v13, "isNavigatingFromTrace") & 1) != 0 || v12)
    {
      v14 = -[TraceControlView initWithFrame:]([TraceControlView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
      traceControlView = self->_traceControlView;
      self->_traceControlView = v14;

      -[TraceControlView setTranslatesAutoresizingMaskIntoConstraints:](self->_traceControlView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[TraceControlView setDelegate:](self->_traceControlView, "setDelegate:", self);
      if (GEOConfigGetDouble(NavigationConfig_TracePlaybackDefaultSpeedMultiplier[0], NavigationConfig_TracePlaybackDefaultSpeedMultiplier[1]) > 0.0)-[TraceControlView setPlaySpeed:](self->_traceControlView, "setPlaySpeed:");
      -[TraceControlView setIsPlaying:](self->_traceControlView, "setIsPlaying:", 1);
      self->_isSimulationPlaying = v12;
      -[TraceControlView setUseDistanceAsPosition:](self->_traceControlView, "setUseDistanceAsPosition:", v12);
      -[TraceControlView setPosition:](self->_traceControlView, "setPosition:", 0.0);
      -[UIView addSubview:](self->_debugControlsView, "addSubview:", self->_traceControlView);
      v16 = -[TraceSliderView initWithFrame:]([TraceSliderView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
      traceSliderView = self->_traceSliderView;
      self->_traceSliderView = v16;

      if (v12)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "route"));
        objc_msgSend(v18, "distance");
        -[TraceSliderView setTraceLength:](self->_traceSliderView, "setTraceLength:");

      }
      else
      {
        objc_msgSend(v13, "traceDuration");
        -[TraceSliderView setTraceLength:](self->_traceSliderView, "setTraceLength:");
      }
      -[TraceControlView playSpeed](self->_traceControlView, "playSpeed");
      -[TraceSliderView setPlaySpeed:](self->_traceSliderView, "setPlaySpeed:");
      -[TraceSliderView setTranslatesAutoresizingMaskIntoConstraints:](self->_traceSliderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[TraceSliderView setDelegate:](self->_traceSliderView, "setDelegate:", self);
      LODWORD(v19) = 1148846080;
      -[TraceSliderView setContentHuggingPriority:forAxis:](self->_traceSliderView, "setContentHuggingPriority:forAxis:", 1, v19);
      LODWORD(v20) = 1148846080;
      -[TraceSliderView setContentCompressionResistancePriority:forAxis:](self->_traceSliderView, "setContentCompressionResistancePriority:forAxis:", 1, v20);
      v21 = self->_traceSliderView;
      objc_msgSend(v13, "tracePosition");
      -[TraceSliderView setTraceTime:](v21, "setTraceTime:");
      -[UIView addSubview:](self->_debugControlsView, "addSubview:", self->_traceSliderView);
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[TraceSliderView topAnchor](self->_traceSliderView, "topAnchor"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_debugControlsView, "topAnchor"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, 8.0));
      v45[0] = v42;
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[TraceSliderView leadingAnchor](self->_traceSliderView, "leadingAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_debugControlsView, "leadingAnchor"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
      v45[1] = v39;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[TraceSliderView trailingAnchor](self->_traceSliderView, "trailingAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_debugControlsView, "trailingAnchor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
      v45[2] = v36;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[TraceControlView bottomAnchor](self->_traceControlView, "bottomAnchor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_debugControlsView, "bottomAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, -8.0));
      v45[3] = v33;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[TraceControlView leadingAnchor](self->_traceControlView, "leadingAnchor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_debugControlsView, "leadingAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
      v45[4] = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[TraceControlView trailingAnchor](self->_traceControlView, "trailingAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_debugControlsView, "trailingAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
      v45[5] = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[TraceSliderView bottomAnchor](self->_traceSliderView, "bottomAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[TraceControlView topAnchor](self->_traceControlView, "topAnchor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, -4.0));
      v45[6] = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 7));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

    }
    debugControlsView = self->_debugControlsView;
  }
  return debugControlsView;
}

- (void)addDebugViewsToView:(id)a3 layoutGuide:(id)a4 mapView:(id)a5 modalPresentingViewController:(id)a6
{
  id v10;
  id v11;
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
  UILongPressGestureRecognizer *bookmarkGestureRecognizer;
  UILongPressGestureRecognizer *v23;
  UILongPressGestureRecognizer *v24;
  UITapGestureRecognizer *v25;
  UITapGestureRecognizer *oldBookmarkGestureRecognizer;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[3];

  v10 = a3;
  v29 = a6;
  v28 = a5;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController debugControlsView](self, "debugControlsView"));
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v30 = v12;
  v31 = v10;
  objc_msgSend(v10, "addSubview:", v12);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_debugControlsView, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v13));
  v32[0] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_debugControlsView, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
  v32[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_debugControlsView, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
  v32[2] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

  bookmarkGestureRecognizer = self->_bookmarkGestureRecognizer;
  if (!bookmarkGestureRecognizer)
  {
    v23 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "_longPressBookmarkGesture:");
    v24 = self->_bookmarkGestureRecognizer;
    self->_bookmarkGestureRecognizer = v23;

    -[UILongPressGestureRecognizer setAllowableMovement:](self->_bookmarkGestureRecognizer, "setAllowableMovement:", 100.0);
    -[UILongPressGestureRecognizer setDelegate:](self->_bookmarkGestureRecognizer, "setDelegate:", self);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_bookmarkGestureRecognizer, "setMinimumPressDuration:", 2.0);
    v25 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_threeFingerTapBookmarkGesture:");
    oldBookmarkGestureRecognizer = self->_oldBookmarkGestureRecognizer;
    self->_oldBookmarkGestureRecognizer = v25;

    -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->_oldBookmarkGestureRecognizer, "setNumberOfTouchesRequired:", 3);
    bookmarkGestureRecognizer = self->_bookmarkGestureRecognizer;
  }
  objc_msgSend(v31, "addGestureRecognizer:", bookmarkGestureRecognizer);
  objc_msgSend(v31, "addGestureRecognizer:", self->_oldBookmarkGestureRecognizer);
  -[NavigationDebugViewsController setMapView:](self, "setMapView:", v28);

  -[NavigationDebugViewsController setUpCameraSnapshotPickerVCFromViewController:](self, "setUpCameraSnapshotPickerVCFromViewController:", v29);
  -[NavigationDebugViewsController didManuallyAddDebugViews](self, "didManuallyAddDebugViews");
  if (-[NavigationDebugViewsController automaticallyHideTraceControls](self, "automaticallyHideTraceControls"))
    -[NavigationDebugViewsController hideTraceControls](self, "hideTraceControls");

}

- (void)didManuallyAddDebugViews
{
  *(_WORD *)&self->_traceControlsAreShowing = 257;
}

- (void)setUpCameraSnapshotPickerVCFromViewController:(id)a3
{
  NavigationCameraSnapshotPickerViewController *v4;
  NavigationCameraSnapshotPickerViewController *cameraSnapshotPickerVC;
  id obj;

  obj = a3;
  v4 = -[NavigationCameraSnapshotPickerViewController initWithDelegate:]([NavigationCameraSnapshotPickerViewController alloc], "initWithDelegate:", self);
  cameraSnapshotPickerVC = self->_cameraSnapshotPickerVC;
  self->_cameraSnapshotPickerVC = v4;

  objc_storeWeak((id *)&self->_modalPresentingViewController, obj);
}

- (void)_setUpCameraSnapshotPickerVCFromWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  UINavigationController *v9;
  UINavigationController *nonsplitRootViewController;
  NavigationDebugSplitViewController *v11;
  NavigationDebugSplitViewController *splitViewController;
  NavigationCameraSnapshotPickerViewController *v13;
  NavigationCameraSnapshotPickerViewController *cameraSnapshotPickerVC;
  UINavigationController *v15;
  uint64_t v16;
  void *v17;
  UIViewController **p_mainViewController;
  id WeakRetained;
  void *v20;
  _QWORD v21[2];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootViewController"));
    v7 = objc_opt_class(UINavigationController);
    isKindOfClass = objc_opt_isKindOfClass(v6, v7);

    if ((isKindOfClass & 1) != 0)
    {
      v9 = (UINavigationController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rootViewController"));
      nonsplitRootViewController = self->_nonsplitRootViewController;
      self->_nonsplitRootViewController = v9;

      v11 = objc_alloc_init(NavigationDebugSplitViewController);
      splitViewController = self->_splitViewController;
      self->_splitViewController = v11;

      v13 = -[NavigationCameraSnapshotPickerViewController initWithDelegate:]([NavigationCameraSnapshotPickerViewController alloc], "initWithDelegate:", self);
      cameraSnapshotPickerVC = self->_cameraSnapshotPickerVC;
      self->_cameraSnapshotPickerVC = v13;

      v15 = self->_nonsplitRootViewController;
      v16 = objc_opt_class(UINavigationController);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self->_nonsplitRootViewController, "topViewController"));
        p_mainViewController = &self->_mainViewController;
        objc_storeWeak((id *)&self->_mainViewController, v17);

      }
      else
      {
        p_mainViewController = &self->_mainViewController;
        objc_storeWeak((id *)&self->_mainViewController, self->_nonsplitRootViewController);
      }
      v21[0] = self->_cameraSnapshotPickerVC;
      WeakRetained = objc_loadWeakRetained((id *)p_mainViewController);
      v21[1] = WeakRetained;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
      -[NavigationDebugSplitViewController setViewControllers:](self->_splitViewController, "setViewControllers:", v20);

      -[NavigationDebugSplitViewController setDelegate:](self->_splitViewController, "setDelegate:", self);
      -[NavigationDebugSplitViewController setPresentsWithGesture:](self->_splitViewController, "setPresentsWithGesture:", 0);
      -[NavigationDebugSplitViewController setPreferredDisplayMode:](self->_splitViewController, "setPreferredDisplayMode:", 1);
      -[NavigationDebugSplitViewController setPreferredPrimaryColumnWidthFraction:](self->_splitViewController, "setPreferredPrimaryColumnWidthFraction:", 0.370000005);
      objc_msgSend(v5, "setRootViewController:", self->_splitViewController);
      objc_storeWeak((id *)&self->_window, v5);
    }
  }

}

- (void)removeDebugViewsFromView:(id)a3
{
  id v4;

  v4 = a3;
  -[NavigationDebugViewsController hideTraceControls](self, "hideTraceControls");
  -[UIView removeFromSuperview](self->_debugControlsView, "removeFromSuperview");
  objc_msgSend(v4, "removeGestureRecognizer:", self->_bookmarkGestureRecognizer);
  objc_msgSend(v4, "removeGestureRecognizer:", self->_oldBookmarkGestureRecognizer);

  -[NavigationDebugViewsController didManuallyRemoveDebugViews](self, "didManuallyRemoveDebugViews");
}

- (void)didManuallyRemoveDebugViews
{
  id WeakRetained;
  UINavigationController *nonsplitRootViewController;
  id v5;
  UINavigationController *v6;
  id v7;
  UINavigationController *v8;
  NavigationDebugSplitViewController *splitViewController;
  NavigationCameraSnapshotPickerViewController *cameraSnapshotPickerVC;
  TraceControlView *traceControlView;
  TraceSliderView *traceSliderView;
  UIView *debugControlsView;
  TraceBookmarkSelector *traceBookmarkSelector;

  -[NSTimer invalidate](self->_hideTraceControlTimer, "invalidate");
  -[NavigationDebugViewsController setHideTraceControlTimer:](self, "setHideTraceControlTimer:", 0);
  if (self->_nonsplitRootViewController)
  {
    if (self->_splitViewController)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_window);

      if (WeakRetained)
      {
        nonsplitRootViewController = self->_nonsplitRootViewController;
        v5 = objc_loadWeakRetained((id *)&self->_mainViewController);
        -[UINavigationController pushViewController:animated:](nonsplitRootViewController, "pushViewController:animated:", v5, 0);

        v6 = self->_nonsplitRootViewController;
        v7 = objc_loadWeakRetained((id *)&self->_window);
        objc_msgSend(v7, "setRootViewController:", v6);

        v8 = self->_nonsplitRootViewController;
        self->_nonsplitRootViewController = 0;

        splitViewController = self->_splitViewController;
        self->_splitViewController = 0;

        objc_storeWeak((id *)&self->_mainViewController, 0);
        cameraSnapshotPickerVC = self->_cameraSnapshotPickerVC;
        self->_cameraSnapshotPickerVC = 0;

      }
    }
  }
  traceControlView = self->_traceControlView;
  self->_traceControlView = 0;

  traceSliderView = self->_traceSliderView;
  self->_traceSliderView = 0;

  debugControlsView = self->_debugControlsView;
  self->_debugControlsView = 0;

  -[TraceBookmarkSelector setDelegate:](self->_traceBookmarkSelector, "setDelegate:", 0);
  traceBookmarkSelector = self->_traceBookmarkSelector;
  self->_traceBookmarkSelector = 0;

  -[NavigationDebugViewsController setMapView:](self, "setMapView:", 0);
  *(_WORD *)&self->_traceControlsAreShowing = 0;
}

- (void)_longPressBookmarkGesture:(id)a3
{
  if (objc_msgSend(a3, "state") == (id)1)
    -[NavigationDebugViewsController _addTraceBookmark](self, "_addTraceBookmark");
}

- (void)_threeFingerTapBookmarkGesture:(id)a3
{
  -[NavigationDebugViewsController _addTraceBookmark](self, "_addTraceBookmark", a3);
}

- (void)_addTraceBookmark
{
  UIImage *v2;
  NSData *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  if (+[UIApplication _maps_isAnyApplicationOrCarPlayApplicationSceneForeground](UIApplication, "_maps_isAnyApplicationOrCarPlayApplicationSceneForeground"))
  {
    v2 = (UIImage *)_UICreateScreenUIImage();
    v3 = UIImagePNGRepresentation(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    objc_msgSend(v5, "recordTraceBookmarkAtCurrentPositionWthScreenshotData:", v4);

  }
}

- (void)tracePlayerDidStart:(id)a3
{
  if (self->_debugViewsWereAdded)
    -[NavigationDebugViewsController showTraceControls](self, "showTraceControls", a3);
}

- (void)tracePlayerDidStop:(id)a3
{
  if (self->_debugViewsWereAdded)
    -[NavigationDebugViewsController hideTraceControls](self, "hideTraceControls", a3);
}

- (void)tracePlayerDidPause:(id)a3
{
  id v4;
  TraceControlView *traceControlView;
  void *v6;
  void *v7;
  id WeakRetained;
  char v9;
  id v10;
  id v11;

  v4 = a3;
  if (self->_debugViewsWereAdded)
  {
    v11 = v4;
    traceControlView = self->_traceControlView;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController tracePlayer](self, "tracePlayer"));
    if ((objc_msgSend(v6, "isPlaying") & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController tracePlayer](self, "tracePlayer"));
      -[TraceControlView setIsPlaying:](traceControlView, "setIsPlaying:", objc_msgSend(v7, "isPaused") ^ 1);

    }
    else
    {
      -[TraceControlView setIsPlaying:](traceControlView, "setIsPlaying:", 0);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_opt_respondsToSelector(WeakRetained, "navigationDebugViewsTracePlaybackDidPause:");

    v4 = v11;
    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "navigationDebugViewsTracePlaybackDidPause:", self);

      v4 = v11;
    }
  }

}

- (void)tracePlayerDidResume:(id)a3
{
  id v4;
  TraceControlView *traceControlView;
  void *v6;
  void *v7;
  id WeakRetained;
  char v9;
  id v10;
  id v11;

  v4 = a3;
  if (self->_debugViewsWereAdded)
  {
    v11 = v4;
    traceControlView = self->_traceControlView;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController tracePlayer](self, "tracePlayer"));
    if ((objc_msgSend(v6, "isPlaying") & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController tracePlayer](self, "tracePlayer"));
      -[TraceControlView setIsPlaying:](traceControlView, "setIsPlaying:", objc_msgSend(v7, "isPaused") ^ 1);

    }
    else
    {
      -[TraceControlView setIsPlaying:](traceControlView, "setIsPlaying:", 0);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_opt_respondsToSelector(WeakRetained, "navigationDebugViewsTracePlaybackDidPause:");

    v4 = v11;
    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "navigationDebugViewsTracePlaybackDidResume:", self);

      v4 = v11;
    }
  }

}

- (void)tracePlayer:(id)a3 didSeekToTime:(double)a4 fromTime:(double)a5 location:(id)a6
{
  id v9;
  id WeakRetained;
  MNLocation *puckLocation;
  void *v12;
  id v13;

  v13 = a3;
  v9 = a6;
  if (self->_debugViewsWereAdded)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "navigationDebugViewsTracePlaybackDidSeek:", self);

    if (self->_shouldUpdateLocationPuck)
    {
      puckLocation = self->_puckLocation;
      -[TraceControlView setPosition:](self->_traceControlView, "setPosition:", a4);
      -[TraceSliderView setTraceTime:animated:](self->_traceSliderView, "setTraceTime:animated:", 0, a4);
      if (puckLocation)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
        objc_msgSend(v12, "pushLocation:", self->_puckLocation);

        self->_shouldUpdateLocationPuck = 0;
      }
    }
    else
    {
      -[TraceControlView setPosition:](self->_traceControlView, "setPosition:", a4);
      -[TraceSliderView setTraceTime:animated:](self->_traceSliderView, "setTraceTime:animated:", 0, a4);
    }
  }

}

- (void)tracePlayer:(id)a3 didPlayAtTime:(double)a4
{
  if (self->_debugViewsWereAdded)
  {
    -[TraceSliderView setTraceTime:animated:](self->_traceSliderView, "setTraceTime:animated:", 1);
    -[TraceControlView setPosition:](self->_traceControlView, "setPosition:", a4);
  }
}

- (void)traceControlView:(id)a3 setPlaying:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  id v7;

  v4 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService", a3));
  if (-[NavigationDebugViewsController _isSimulating](self, "_isSimulating"))
  {
    self->_isSimulationPlaying = v4;
    v6 = 0.0;
    if (v4)
      -[TraceSliderView playSpeed](self->_traceSliderView, "playSpeed", 0.0);
    objc_msgSend(v7, "setSimulationSpeedMultiplier:", v6);
  }
  else
  {
    objc_msgSend(v7, "setTraceIsPlaying:", v4);
  }
  -[NavigationDebugViewsController resetHideTraceControlsTimer](self, "resetHideTraceControlsTimer");

}

- (void)traceControlViewJumpedBack:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController tracePlayer](self, "tracePlayer", a3));
  objc_msgSend(v4, "skipByTimeInterval:", -30.0);

  -[NavigationDebugViewsController resetHideTraceControlsTimer](self, "resetHideTraceControlsTimer");
}

- (void)traceControlView:(id)a3 setPlaySpeed:(double)a4
{
  id WeakRetained;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService", a3));
  if (-[NavigationDebugViewsController _isSimulating](self, "_isSimulating"))
    objc_msgSend(v7, "setSimulationSpeedMultiplier:", a4);
  else
    objc_msgSend(v7, "setTracePlaybackSpeed:", a4);
  -[TraceSliderView setPlaySpeed:](self->_traceSliderView, "setPlaySpeed:", a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationDebugViewsTracePlaybackSpeedDidChange:speedMultiplier:", self, a4);

  -[NavigationDebugViewsController resetHideTraceControlsTimer](self, "resetHideTraceControlsTimer");
}

- (void)traceControlViewPressedBookmarksButton:(id)a3
{
  TraceBookmarkSelector *traceBookmarkSelector;
  TraceBookmarkSelector *v5;
  TraceBookmarkSelector *v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  traceBookmarkSelector = self->_traceBookmarkSelector;
  if (!traceBookmarkSelector)
  {
    v5 = -[TraceBookmarkSelector initWithStyle:]([TraceBookmarkSelector alloc], "initWithStyle:", 0);
    v6 = self->_traceBookmarkSelector;
    self->_traceBookmarkSelector = v5;

    -[TraceBookmarkSelector setModalPresentationStyle:](self->_traceBookmarkSelector, "setModalPresentationStyle:", 2);
    -[TraceBookmarkSelector setDelegate:](self->_traceBookmarkSelector, "setDelegate:", self);
    traceBookmarkSelector = self->_traceBookmarkSelector;
  }
  -[TraceBookmarkSelector reloadBookmarks](traceBookmarkSelector, "reloadBookmarks");
  v7 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self->_traceBookmarkSelector);
  WeakRetained = objc_loadWeakRetained((id *)&self->_modalPresentingViewController);
  v9 = WeakRetained;
  if (WeakRetained)
    v10 = WeakRetained;
  else
    v10 = objc_loadWeakRetained((id *)&self->_mainViewController);
  v11 = v10;

  objc_msgSend(v11, "_maps_topMostPresentViewController:animated:completion:", v7, 1, 0);
  -[NavigationDebugViewsController resetHideTraceControlsTimer](self, "resetHideTraceControlsTimer");

}

- (void)traceControlViewPressedSaveCameraSnapshotButton:(id)a3
{
  id v4;
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
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NavigationCameraSnapshot *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  NavigationCameraSnapshot *v69;
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  NavigationCameraSnapshot *v74;
  NavigationDebugViewsController *v75;
  _QWORD v76[4];
  id v77;
  id v78;
  id v79;
  double v80;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController tracePath](self, "tracePath"));

  if (!v5)
    goto LABEL_25;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController mapView](self, "mapView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_mapLayer"));

  if (!v7)
    goto LABEL_25;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController mapView](self, "mapView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_mapLayer"));

  if (!v9)
    goto LABEL_25;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapCamera camera](MKMapCamera, "camera"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController mapView](self, "mapView"));
  objc_msgSend(v11, "centerCoordinate");
  objc_msgSend(v10, "setCenterCoordinate:");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController mapView](self, "mapView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_mapLayer"));
  objc_msgSend(v13, "yaw");
  objc_msgSend(v10, "setHeading:");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController mapView](self, "mapView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_mapLayer"));
  objc_msgSend(v15, "pitch");
  objc_msgSend(v10, "setPitch:");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController mapView](self, "mapView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_mapLayer"));
  objc_msgSend(v17, "altitude");
  objc_msgSend(v10, "setAltitude:");

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController tracePlayer](self, "tracePlayer"));
  objc_msgSend(v18, "duration");
  v19 = 0.0;
  v20 = 0.0;
  if (v21 > 0.0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController tracePlayer](self, "tracePlayer"));
    objc_msgSend(v22, "position");
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController tracePlayer](self, "tracePlayer"));
    objc_msgSend(v25, "duration");
    v20 = v24 / v26;

  }
  v27 = fmin(v20, 1.0);
  if (v20 <= 0.0)
    v28 = 0.0;
  else
    v28 = v27;
  v29 = objc_alloc((Class)MNLocation);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController mapView](self, "mapView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "userLocation"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "location"));
  v33 = objc_msgSend(v29, "initWithRawLocation:", v32);

  v34 = -[NavigationCameraSnapshot initWithCamera:tracePlaybackTimeFraction:puckLocation:]([NavigationCameraSnapshot alloc], "initWithCamera:tracePlaybackTimeFraction:puckLocation:", v10, v33, v28);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController mapView](self, "mapView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "snapshotViewAfterScreenUpdates:", 0));

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController mapView](self, "mapView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "window"));

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController mapView](self, "mapView"));
  objc_msgSend(v39, "bounds");
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController mapView](self, "mapView"));
  objc_msgSend(v38, "convertRect:fromView:", v48, v41, v43, v45, v47);
  objc_msgSend(v36, "setFrame:");

  objc_msgSend(v38, "addSubview:", v36);
  objc_msgSend(v36, "bounds");
  v50 = v49;
  if (v49 > 0.0)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewCameraSnapshotsButton"));
    objc_msgSend(v39, "bounds");
    v52 = v51;
    objc_msgSend(v36, "bounds");
    v19 = v52 / (v53 + v53);
  }
  objc_msgSend(v36, "bounds");
  v55 = v54;
  if (v54 <= 0.0)
  {
    v59 = 0.0;
  }
  else
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewCameraSnapshotsButton"));
    objc_msgSend(v48, "bounds");
    v57 = v56;
    objc_msgSend(v36, "bounds");
    v59 = v57 / (v58 + v58);
  }
  objc_msgSend(v36, "bounds");
  if (v19 >= v59)
  {
    v62 = 0.0;
    if (v60 > 0.0)
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewCameraSnapshotsButton"));
      objc_msgSend(v63, "bounds");
      v65 = v67;
      objc_msgSend(v36, "bounds");
      v66 = v68;
      goto LABEL_19;
    }
  }
  else
  {
    v62 = 0.0;
    if (v61 > 0.0)
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewCameraSnapshotsButton"));
      objc_msgSend(v63, "bounds");
      v65 = v64;
      objc_msgSend(v36, "bounds");
LABEL_19:
      v62 = v65 / (v66 + v66);

    }
  }
  if (v55 > 0.0)

  if (v50 > 0.0)
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_100BE15D4;
  v76[3] = &unk_1011B1C08;
  v77 = v36;
  v78 = v38;
  v79 = v4;
  v80 = v62;
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_100BE1700;
  v72[3] = &unk_1011E0110;
  v73 = v77;
  v74 = v34;
  v75 = self;
  v69 = v34;
  v70 = v77;
  v71 = v38;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v76, v72, 0.3, 0.0);

LABEL_25:
}

- (void)traceControlViewPressedViewCameraSnapshotsButton:(id)a3
{
  -[NavigationDebugViewsController toggleCameraSnapshotPickerVisibility](self, "toggleCameraSnapshotPickerVisibility", a3);
}

- (void)traceSliderViewEditingDidBegin:(id)a3
{
  _BOOL4 isSimulationPlaying;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService", a3));
  if ((objc_msgSend(v6, "traceIsPlaying") & 1) != 0)
  {
    self->_shouldResumeTracePlayer = 1;
LABEL_4:
    objc_msgSend(v6, "setTraceIsPlaying:", 0);
    v5 = v6;
    goto LABEL_5;
  }
  isSimulationPlaying = self->_isSimulationPlaying;
  self->_shouldResumeTracePlayer = isSimulationPlaying;
  v5 = v6;
  if (isSimulationPlaying)
    goto LABEL_4;
LABEL_5:

}

- (void)_sliderDidEndEditing
{
  void *v3;

  if (self->_shouldResumeTracePlayer)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v3, "setTraceIsPlaying:", 1);

  }
  -[NavigationDebugViewsController resetHideTraceControlsTimer](self, "resetHideTraceControlsTimer");
}

- (void)traceSliderView:(id)a3 editingEndedAtTime:(double)a4
{
  void *v4;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  id v17;

  v17 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService", a3));
  if (-[NavigationDebugViewsController _isSimulating](self, "_isSimulating"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "route"));
    objc_msgSend(v7, "distance");
    v9 = a4 / v8;
    v10 = 1.0;
    if (a4 / v8 < 1.0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "route"));
      objc_msgSend(v4, "distance");
      v12 = 0.0;
      if (a4 / v11 < 0.0)
        goto LABEL_7;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "route"));
    objc_msgSend(v13, "distance");
    if (a4 / v14 < 1.0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "route"));
      objc_msgSend(v15, "distance");
      v10 = a4 / v16;

    }
    v12 = v10;
    if (v9 < 1.0)
    {
LABEL_7:

      v10 = v12;
    }

    objc_msgSend(v17, "setSimulationPosition:", v10);
  }
  else
  {
    objc_msgSend(v17, "setTracePosition:", a4);
  }
  -[NavigationDebugViewsController _sliderDidEndEditing](self, "_sliderDidEndEditing");

}

- (void)toggleCameraSnapshotPickerVisibility
{
  uint64_t v3;

  if (-[NavigationDebugSplitViewController preferredDisplayMode](self->_splitViewController, "preferredDisplayMode") == (id)1)
    v3 = 2;
  else
    v3 = 1;
  -[NavigationDebugSplitViewController setPreferredDisplayMode:](self->_splitViewController, "setPreferredDisplayMode:", v3);
  -[NavigationDebugViewsController _presentCameraSnapshotPickerModallyIfNeededAnimated:](self, "_presentCameraSnapshotPickerModallyIfNeededAnimated:", 1);
}

- (id)primaryViewControllerForExpandingSplitViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v8;

  v4 = objc_alloc_init((Class)UIViewController);
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  -[UINavigationController setViewControllers:](self->_modalCameraSnapshotPickerVC, "setViewControllers:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController navigationItem](self->_cameraSnapshotPickerVC, "navigationItem"));
  objc_msgSend(v6, "setLeftBarButtonItem:", 0);

  return self->_cameraSnapshotPickerVC;
}

- (BOOL)splitViewController:(id)a3 collapseSecondaryViewController:(id)a4 ontoPrimaryViewController:(id)a5
{
  -[NavigationDebugSplitViewController setPreferredDisplayMode:](self->_splitViewController, "setPreferredDisplayMode:", 1, a4, a5);
  return 1;
}

- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4
{
  -[NavigationDebugViewsController _dismissModalCameraSnapshotPickerIfNeededAnimated:](self, "_dismissModalCameraSnapshotPickerIfNeededAnimated:", 0, a4);
  return objc_loadWeakRetained((id *)&self->_mainViewController);
}

- (id)primaryViewControllerForCollapsingSplitViewController:(id)a3
{
  return objc_loadWeakRetained((id *)&self->_mainViewController);
}

- (void)_done
{
  -[NavigationDebugViewsController _dismissModalCameraSnapshotPickerIfNeededAnimated:](self, "_dismissModalCameraSnapshotPickerIfNeededAnimated:", 1);
  -[NavigationDebugSplitViewController setPreferredDisplayMode:](self->_splitViewController, "setPreferredDisplayMode:", 1);
}

- (void)_presentCameraSnapshotPickerModallyIfNeededAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  id v6;
  id v7;
  void *v8;
  UINavigationController *v9;
  UINavigationController *modalCameraSnapshotPickerVC;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;

  v3 = a3;
  -[NavigationDebugViewsController _dismissModalCameraSnapshotPickerIfNeededAnimated:](self, "_dismissModalCameraSnapshotPickerIfNeededAnimated:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  if (WeakRetained)
  {

  }
  else
  {
    v6 = objc_loadWeakRetained((id *)&self->_modalPresentingViewController);

    if (!v6)
      return;
  }
  self->_isPresentingModallyPickerVC = 1;
  v7 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_done");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController navigationItem](self->_cameraSnapshotPickerVC, "navigationItem"));
  objc_msgSend(v8, "setLeftBarButtonItem:", v7);

  v9 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self->_cameraSnapshotPickerVC);
  modalCameraSnapshotPickerVC = self->_modalCameraSnapshotPickerVC;
  self->_modalCameraSnapshotPickerVC = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController tracePlayer](self, "tracePlayer"));
  objc_msgSend(v11, "pause");

  v12 = objc_loadWeakRetained((id *)&self->_modalPresentingViewController);
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = objc_loadWeakRetained((id *)&self->_mainViewController);
  v18 = v14;

  v15 = objc_loadWeakRetained((id *)&self->_modalPresentingViewController);
  if (v18 == v15)
  {

    v17 = v18;
  }
  else
  {
    if (!-[NavigationDebugSplitViewController isCollapsed](self->_splitViewController, "isCollapsed"))
    {

      goto LABEL_14;
    }
    v16 = -[NavigationDebugSplitViewController preferredDisplayMode](self->_splitViewController, "preferredDisplayMode");

    v17 = v18;
    if (v16 == (id)1)
      goto LABEL_15;
  }
  v18 = v17;
  objc_msgSend(v17, "presentViewController:animated:completion:", self->_modalCameraSnapshotPickerVC, v3, 0);
LABEL_14:
  v17 = v18;
LABEL_15:

}

- (void)_dismissModalCameraSnapshotPickerIfNeededAnimated:(BOOL)a3
{
  UINavigationController *modalCameraSnapshotPickerVC;
  _QWORD v4[5];

  if (self->_isPresentingModallyPickerVC)
  {
    modalCameraSnapshotPickerVC = self->_modalCameraSnapshotPickerVC;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100BE1CF0;
    v4[3] = &unk_1011AC860;
    v4[4] = self;
    -[UINavigationController dismissViewControllerAnimated:completion:](modalCameraSnapshotPickerVC, "dismissViewControllerAnimated:completion:", a3, v4);
  }
}

- (unint64_t)splitViewControllerSupportedInterfaceOrientations:(id)a3
{
  return 30;
}

- (NSString)tracePath
{
  MNTrace *trace;
  void *v3;
  void *v4;

  trace = self->_trace;
  if (trace)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrace tracePath](trace, "tracePath"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tracePath"));

  }
  return (NSString *)v3;
}

- (void)cameraSnapshotPicker:(id)a3 didSelectCameraSnapshot:(id)a4
{
  id v5;
  void *v6;
  MNLocation *v7;
  MNLocation *puckLocation;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  NavigationDebugViewsController *v19;
  id v20;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController tracePlayer](self, "tracePlayer"));
  objc_msgSend(v6, "pause");

  v7 = (MNLocation *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "puckLocation"));
  puckLocation = self->_puckLocation;
  self->_puckLocation = v7;

  if (self->_puckLocation)
    self->_shouldUpdateLocationPuck = 1;
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_100BE1EE4;
  v18 = &unk_1011AC8B0;
  v19 = self;
  v9 = v5;
  v20 = v9;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, &v15, 0, 0.33, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController tracePlayer](self, "tracePlayer", v15, v16, v17, v18, v19));
  objc_msgSend(v9, "tracePlaybackTimeFraction");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController tracePlayer](self, "tracePlayer"));
  objc_msgSend(v13, "duration");
  objc_msgSend(v10, "jumpToTime:", v12 * v14);

  if (self->_isPresentingModallyPickerVC)
    -[NavigationDebugViewsController _done](self, "_done");

}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v10 = a4;
  if (-[NavigationDebugViewsController _isSimulating](self, "_isSimulating"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routeMatch"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "route"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routeMatch"));
    objc_msgSend(v6, "distanceFromStartToRouteCoordinate:", objc_msgSend(v7, "routeCoordinate"));
    v9 = v8;

    -[TraceControlView setPosition:](self->_traceControlView, "setPosition:", v9);
    -[TraceSliderView setTraceTime:animated:](self->_traceSliderView, "setTraceTime:animated:", 0, v9);
  }

}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v6;

  v6 = a4;
  if (-[NavigationDebugViewsController _isSimulating](self, "_isSimulating"))
  {
    objc_msgSend(v6, "distance");
    -[TraceSliderView setTraceLength:](self->_traceSliderView, "setTraceLength:");
  }

}

- (void)navigationService:(id)a3 didFinishLoadingTrace:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService", a3, a4));
  objc_msgSend(v5, "traceDuration");
  -[TraceSliderView setTraceLength:](self->_traceSliderView, "setTraceLength:");

}

- (void)navigationServiceDidPauseTrace:(id)a3
{
  id v4;
  TraceControlView *traceControlView;
  void *v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v4 = a3;
  if (self->_debugViewsWereAdded)
  {
    traceControlView = self->_traceControlView;
    v10 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    -[TraceControlView setIsPlaying:](traceControlView, "setIsPlaying:", objc_msgSend(v6, "traceIsPlaying"));

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector(WeakRetained, "navigationDebugViewsTracePlaybackDidPause:");

    v4 = v10;
    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "navigationDebugViewsTracePlaybackDidPause:", self);

      v4 = v10;
    }
  }

}

- (void)navigationServiceDidResumeTrace:(id)a3
{
  id v4;
  TraceControlView *traceControlView;
  void *v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v4 = a3;
  if (self->_debugViewsWereAdded)
  {
    traceControlView = self->_traceControlView;
    v10 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    -[TraceControlView setIsPlaying:](traceControlView, "setIsPlaying:", objc_msgSend(v6, "traceIsPlaying"));

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector(WeakRetained, "navigationDebugViewsTracePlaybackDidPause:");

    v4 = v10;
    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "navigationDebugViewsTracePlaybackDidResume:", self);

      v4 = v10;
    }
  }

}

- (void)navigationService:(id)a3 didPlayTracePosition:(double)a4
{
  if (self->_traceControlsAreShowing && self->_debugViewsWereAdded)
  {
    -[TraceSliderView setTraceTime:animated:](self->_traceSliderView, "setTraceTime:animated:", 0);
    -[TraceControlView setPosition:](self->_traceControlView, "setPosition:", a4);
  }
}

- (void)navigationService:(id)a3 didSeekToTracePosition:(double)a4
{
  id v6;
  id WeakRetained;
  MNLocation *puckLocation;
  void *v9;
  id v10;

  v6 = a3;
  if (self->_traceControlsAreShowing && self->_debugViewsWereAdded)
  {
    v10 = v6;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "navigationDebugViewsTracePlaybackDidSeek:", self);

    if (self->_shouldUpdateLocationPuck)
    {
      puckLocation = self->_puckLocation;
      -[TraceControlView setPosition:](self->_traceControlView, "setPosition:", a4);
      -[TraceSliderView setTraceTime:animated:](self->_traceSliderView, "setTraceTime:animated:", 1, a4);
      v6 = v10;
      if (puckLocation)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
        objc_msgSend(v9, "pushLocation:", self->_puckLocation);

        v6 = v10;
        self->_shouldUpdateLocationPuck = 0;
      }
    }
    else
    {
      -[TraceControlView setPosition:](self->_traceControlView, "setPosition:", a4);
      -[TraceSliderView setTraceTime:animated:](self->_traceSliderView, "setTraceTime:animated:", 1, a4);
      v6 = v10;
    }
  }

}

- (void)navigationService:(id)a3 didRecordTraceBookmarkWithID:(unint64_t)a4
{
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  id v9;

  -[TraceBookmarkSelector reloadBookmarks](self->_traceBookmarkSelector, "reloadBookmarks", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("TraceBookmarksAlert"));

  if (v6)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Bookmark #%lu saved to trace."), a4));
    v7 = sub_1002A8E94();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v8, "_maps_presentSimpleAlertWithTitle:message:dismissalActionTitle:", CFSTR("Bookmark Added"), v9, CFSTR("OK"));

  }
}

- (NSTimer)hideTraceControlTimer
{
  return self->_hideTraceControlTimer;
}

- (void)setHideTraceControlTimer:(id)a3
{
  objc_storeStrong((id *)&self->_hideTraceControlTimer, a3);
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (BOOL)automaticallyHideTraceControls
{
  return self->_automaticallyHideTraceControls;
}

- (BOOL)isShowingTraceControls
{
  return self->_traceControlsAreShowing;
}

- (BOOL)showTraceControlsForStaleLocations
{
  return self->_showTraceControlsForStaleLocations;
}

- (void)setShowTraceControlsForStaleLocations:(BOOL)a3
{
  self->_showTraceControlsForStaleLocations = a3;
}

- (void)setDebugControlsView:(id)a3
{
  objc_storeStrong((id *)&self->_debugControlsView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_puckLocation, 0);
  objc_storeStrong((id *)&self->_modalCameraSnapshotPickerVC, 0);
  objc_destroyWeak((id *)&self->_modalPresentingViewController);
  objc_destroyWeak((id *)&self->_mainViewController);
  objc_storeStrong((id *)&self->_nonsplitRootViewController, 0);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_cameraSnapshotPickerVC, 0);
  objc_storeStrong((id *)&self->_bookmarkRecorder, 0);
  objc_storeStrong((id *)&self->_trace, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_bookmarkGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_oldBookmarkGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_traceBookmarkSelector, 0);
  objc_storeStrong((id *)&self->_debugControlsView, 0);
  objc_storeStrong((id *)&self->_traceSliderView, 0);
  objc_storeStrong((id *)&self->_traceControlView, 0);
  objc_storeStrong((id *)&self->_hideTraceControlTimer, 0);
  objc_storeStrong((id *)&self->_tracePlayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
