@implementation RCAVWaveformViewController

- (RCAVWaveformViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCAVWaveformViewController.m"), 55, CFSTR("initWithNibName:bundle: is not the designated initializer"));

  return self;
}

- (RCAVWaveformViewController)initWithCoder:(id)a3
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCAVWaveformViewController.m"), 61, CFSTR("this view controller does not support keyed coding.  use the other designated initializer"));

  return -[RCAVWaveformViewController init](self, "init");
}

- (RCAVWaveformViewController)initWithWaveformDataSource:(id)a3 displayStyle:(unint64_t)a4 isOverview:(BOOL)a5 delegate:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  RCAVWaveformViewController *v12;
  RCAVWaveformViewController *v13;
  double v14;
  RCWaveformViewController *v15;
  RCWaveformViewController *waveformViewController;
  RCHitTestForwardingView *v17;
  double y;
  double width;
  double height;
  RCHitTestForwardingView *v21;
  RCHitTestForwardingView *leftForwardingView;
  RCHitTestForwardingView *v23;
  RCHitTestForwardingView *rightForwardingView;
  objc_super v26;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v26.receiver = self;
  v26.super_class = (Class)RCAVWaveformViewController;
  v12 = -[RCAVWaveformViewController initWithNibName:bundle:](&v26, "initWithNibName:bundle:", 0, 0);
  v13 = v12;
  if (v12)
  {
    v12->_isOverview = v7;
    v12->_userInteractionEnabled = 1;
    v12->_autocenterCurrentTimeIndicatorAlways = !v12->_isOverview;
    v12->_clipsTimeMarkersToDuration = 1;
    v12->_currentTimeTracksCapturedEndPoint = 1;
    objc_msgSend(v10, "duration");
    v13->_duration = v14;
    v15 = -[RCWaveformViewController initWithDisplayStyle:isOverview:duration:]([RCWaveformViewController alloc], "initWithDisplayStyle:isOverview:duration:", a4, v7, v13->_duration);
    waveformViewController = v13->_waveformViewController;
    v13->_waveformViewController = v15;

    -[RCWaveformViewController setCurrentTime:](v13->_waveformViewController, "setCurrentTime:", 0.0);
    -[RCWaveformViewController setCurrentTimeDisplayOptions:](v13->_waveformViewController, "setCurrentTimeDisplayOptions:", v13->_duration > 0.0);
    -[RCWaveformViewController setDelegate:](v13->_waveformViewController, "setDelegate:", v13);
    -[RCAVWaveformViewController addChildViewController:](v13, "addChildViewController:", v13->_waveformViewController);
    -[RCAVWaveformViewController _setWaveformDataSource:initialTime:](v13, "_setWaveformDataSource:initialTime:", v10, 0.0);
    -[RCWaveformViewController didMoveToParentViewController:](v13->_waveformViewController, "didMoveToParentViewController:", v13);
    objc_storeWeak((id *)&v13->_delegate, v11);
    if (v13->_isOverview)
    {
      v17 = [RCHitTestForwardingView alloc];
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
      v21 = -[RCHitTestForwardingView initWithFrame:](v17, "initWithFrame:", CGRectZero.origin.x, y, width, height);
      leftForwardingView = v13->_leftForwardingView;
      v13->_leftForwardingView = v21;

      v23 = -[RCHitTestForwardingView initWithFrame:]([RCHitTestForwardingView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
      rightForwardingView = v13->_rightForwardingView;
      v13->_rightForwardingView = v23;

    }
  }

  return v13;
}

- (void)dealloc
{
  RCWaveformViewController *waveformViewController;
  objc_super v4;

  -[RCTimeController removeTimeObserver:](self->_activeTimeController, "removeTimeObserver:", self);
  waveformViewController = self->_waveformViewController;
  self->_waveformViewController = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  v4.receiver = self;
  v4.super_class = (Class)RCAVWaveformViewController;
  -[RCAVWaveformViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RCAVWaveformViewController;
  -[RCAVWaveformViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController waveformViewController](self, "waveformViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v3, "addSubview:", v5);

  if (self->_isOverview)
  {
    -[RCHitTestForwardingView setUserInteractionEnabled:](self->_leftForwardingView, "setUserInteractionEnabled:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController _selectionOverlay](self, "_selectionOverlay"));
    -[RCHitTestForwardingView setTargetView:](self->_leftForwardingView, "setTargetView:", v6);

    -[RCHitTestForwardingView setUserInteractionEnabled:](self->_rightForwardingView, "setUserInteractionEnabled:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController _selectionOverlay](self, "_selectionOverlay"));
    -[RCHitTestForwardingView setTargetView:](self->_rightForwardingView, "setTargetView:", v7);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController waveformViewController](self, "waveformViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  -[RCAVWaveformViewController annotatedWaveformRectForLayoutBounds:](self, "annotatedWaveformRectForLayoutBounds:");
  objc_msgSend(v4, "setFrame:");

  v20.receiver = self;
  v20.super_class = (Class)RCAVWaveformViewController;
  -[RCAVWaveformViewController viewDidLayoutSubviews](&v20, "viewDidLayoutSubviews");
  if (self->_isOverview)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController view](self, "view"));
    objc_msgSend(v6, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController view](self, "view"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "superview"));
    objc_msgSend(v16, "frame");
    v18 = v17;

    v19 = (v18 - v12) * 0.5;
    -[RCHitTestForwardingView setFrame:](self->_leftForwardingView, "setFrame:", v8 - v19, v10, v19, v14);
    -[RCHitTestForwardingView setFrame:](self->_rightForwardingView, "setFrame:", v8 + v12, v10, v19, v14);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCAVWaveformViewController;
  -[RCAVWaveformViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  -[RCTimeController currentTime](self->_activeTimeController, "currentTime");
  -[RCAVWaveformViewController setCurrentTime:](self, "setCurrentTime:");
  -[RCAVWaveformViewController _updateCurrentTimeForCapturedInputAtTime:](self, "_updateCurrentTimeForCapturedInputAtTime:", self->_currentTime);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003E0E8;
  v4[3] = &unk_1001AB588;
  v4[4] = self;
  -[RCAVWaveformViewController _updateDisplayableTimesWithBlock:](self, "_updateDisplayableTimesWithBlock:", v4);
  -[RCAVWaveformViewController _updateInterfaceForTimeControllerState:](self, "_updateInterfaceForTimeControllerState:", -[RCTimeController timeControllerState](self->_activeTimeController, "timeControllerState"));
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RCAVWaveformViewController;
  -[RCAVWaveformViewController viewDidAppear:](&v8, "viewDidAppear:", a3);
  -[RCTimeController addTimeObserver:](self->_activeTimeController, "addTimeObserver:", self);
  if (self->_isOverview)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController view](self, "view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
    objc_msgSend(v5, "addSubview:", self->_leftForwardingView);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));
    objc_msgSend(v7, "addSubview:", self->_rightForwardingView);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCAVWaveformViewController;
  -[RCAVWaveformViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  if (self->_isOverview)
  {
    -[RCHitTestForwardingView removeFromSuperview](self->_leftForwardingView, "removeFromSuperview");
    -[RCHitTestForwardingView removeFromSuperview](self->_rightForwardingView, "removeFromSuperview");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RCAVWaveformViewController;
  -[RCAVWaveformViewController viewDidDisappear:](&v3, "viewDidDisappear:", a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)reloadWaveformDataSource:(id)a3 withActiveTimeController:(id)a4
{
  id v6;
  id v7;

  v7 = a4;
  v6 = a3;
  objc_msgSend(v7, "currentTime");
  -[RCAVWaveformViewController _setWaveformDataSource:initialTime:](self, "_setWaveformDataSource:initialTime:", v6);

  -[RCAVWaveformViewController setActiveTimeController:](self, "setActiveTimeController:", v7);
}

- (void)setActiveTimeController:(id)a3
{
  RCTimeController *v5;
  RCTimeController **p_activeTimeController;
  RCTimeController *activeTimeController;
  double v8;
  double v9;
  double v10;
  RCTimeController *v11;

  v5 = (RCTimeController *)a3;
  p_activeTimeController = &self->_activeTimeController;
  activeTimeController = self->_activeTimeController;
  if (activeTimeController != v5)
  {
    v11 = v5;
    -[RCTimeController removeTimeObserver:](activeTimeController, "removeTimeObserver:", self);
    objc_storeStrong((id *)&self->_activeTimeController, a3);
    -[RCTimeController addTimeObserver:](*p_activeTimeController, "addTimeObserver:", self);
    v5 = v11;
    if (v11)
    {
      -[RCTimeController currentTime](v11, "currentTime");
      v9 = v8;
      -[RCAVWaveformViewController currentTime](self, "currentTime");
      if (v9 != v10)
        -[RCAVWaveformViewController setCurrentTime:](self, "setCurrentTime:", v9);
      -[RCAVWaveformViewController _updateInterfaceForTimeControllerState:](self, "_updateInterfaceForTimeControllerState:", -[RCTimeController timeControllerState](*p_activeTimeController, "timeControllerState"));
      v5 = v11;
    }
  }

}

- (void)setIsEditMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_isEditMode != a3)
  {
    v3 = a3;
    self->_isEditMode = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController waveformViewController](self, "waveformViewController"));
    objc_msgSend(v4, "setEditing:", v3);

  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)nextPreviewTimeRange
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  if (self->_selectionOverlayVisible)
  {
    -[RCAVWaveformViewController selectedTimeRange](self, "selectedTimeRange");
  }
  else
  {
    v2 = RCTimeRangeEverything[0];
    v3 = RCTimeRangeEverything[1];
  }
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setVisibleTimeRange:(id)a3
{
  -[RCWaveformViewController setVisibleTimeRange:](self->_waveformViewController, "setVisibleTimeRange:", a3.var0, a3.var1);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)visibleTimeRange
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[RCWaveformViewController visibleTimeRange](self->_waveformViewController, "visibleTimeRange");
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setHighlightTimeRange:(id)a3
{
  double var1;
  double var0;
  $93AB83F55FD8EAABF5C634313E89AB95 *p_highlightTimeRange;

  var1 = a3.var1;
  var0 = a3.var0;
  p_highlightTimeRange = &self->_highlightTimeRange;
  if ((RCTimeRangeEqualToTimeRange(self->_highlightTimeRange.beginTime, self->_highlightTimeRange.endTime, a3.var0, a3.var1) & 1) == 0)
  {
    p_highlightTimeRange->beginTime = var0;
    p_highlightTimeRange->endTime = var1;
    -[RCWaveformViewController setHighlightTimeRange:](self->_waveformViewController, "setHighlightTimeRange:", var0, var1);
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)setHighlightTimeRange
{
  double beginTime;
  double endTime;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  if (self->_waveformViewController)
  {
    -[RCWaveformViewController highlightTimeRange](self->_waveformViewController, "highlightTimeRange");
  }
  else
  {
    beginTime = self->_highlightTimeRange.beginTime;
    endTime = self->_highlightTimeRange.endTime;
  }
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- (void)setCurrentTime:(double)a3
{
  float v4;

  if (self->_currentTime != a3)
  {
    self->_currentTime = a3;
    self->_nextPreviewStartTime = a3;
    -[RCAVWaveformViewController _didUpdateDisplayableTime](self, "_didUpdateDisplayableTime");
    if (self->_didJumpTime)
    {
      -[RCTimeController currentRate](self->_activeTimeController, "currentRate");
      if (v4 > 0.0)
        self->_didJumpTime = 0;
    }
  }
}

- (void)setDuration:(double)a3
{
  if (self->_duration != a3)
  {
    self->_duration = a3;
    -[RCWaveformViewController setDuration:](self->_waveformViewController, "setDuration:");
    -[RCAVWaveformViewController _didUpdateDisplayableTime](self, "_didUpdateDisplayableTime");
  }
}

- (CGRect)waveformRectForLayoutBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[RCWaveformViewController waveformRectForLayoutBounds:](self->_waveformViewController, "waveformRectForLayoutBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)waveformBottomLineInset
{
  CGRect v3;

  -[RCWaveformViewController waveformRectForLayoutBounds:](self->_waveformViewController, "waveformRectForLayoutBounds:", 0.0, 0.0, 320.0, 1000.0);
  return 1000.0 - CGRectGetMaxY(v3);
}

- (double)currentTimeIndicatorCoordinate
{
  double result;
  void *v4;
  double MidX;
  CGRect v6;

  if ((-[RCAVWaveformViewController _currentTimeDisplayOptionsIgnoringSelectionOverlayState:](self, "_currentTimeDisplayOptionsIgnoringSelectionOverlayState:", 1) & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController view](self, "view"));
    objc_msgSend(v4, "bounds");
    MidX = CGRectGetMidX(v6);

    return MidX;
  }
  else
  {
    -[RCWaveformViewController currentTimeIndicatorCoordinate](self->_waveformViewController, "currentTimeIndicatorCoordinate");
  }
  return result;
}

- (void)setAutocenterCurrentTimeIndicatorAlways:(BOOL)a3
{
  if (self->_autocenterCurrentTimeIndicatorAlways != a3)
  {
    self->_autocenterCurrentTimeIndicatorAlways = a3;
    -[RCWaveformViewController setCurrentTimeDisplayOptions:](self->_waveformViewController, "setCurrentTimeDisplayOptions:", -[RCAVWaveformViewController _currentTimeDisplayOptions](self, "_currentTimeDisplayOptions"));
  }
}

- (void)setClipsTimeMarkersToDuration:(BOOL)a3
{
  if (self->_clipsTimeMarkersToDuration != a3)
  {
    self->_clipsTimeMarkersToDuration = a3;
    -[RCWaveformViewController setClipTimeMarkersToDuration:](self->_waveformViewController, "setClipTimeMarkersToDuration:");
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  self->_userInteractionEnabled = a3;
}

- (void)setBlurred:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_blurred != a3)
  {
    v3 = a3;
    self->_blurred = a3;
    self->_shouldPauseTimeControllerUpdates = a3;
    if (!a3)
      -[RCAVWaveformViewController _forceUpdateCurrentTimeAndDuration](self, "_forceUpdateCurrentTimeAndDuration");
    v5 = (id)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController waveformViewController](self, "waveformViewController"));
    objc_msgSend(v5, "setBlurred:", v3);

  }
}

- (void)showSelectionOverlayAndEnableInsertMode:(BOOL)a3
{
  -[RCAVWaveformViewController _beginShowingSelectionOverlayAndEnableInsertMode:](self, "_beginShowingSelectionOverlayAndEnableInsertMode:", a3);
}

- (void)hidSelectionOverlayWithCompletionBlock:(id)a3
{
  -[RCAVWaveformViewController _endShowingSelectionOverlayWithCompletionBlock:](self, "_endShowingSelectionOverlayWithCompletionBlock:", a3);
}

- (void)setSelectedTimeRange:(id)a3 animationDuration:(double)a4
{
  -[RCWaveformViewController setSelectedTimeRange:animationDuration:](self->_waveformViewController, "setSelectedTimeRange:animationDuration:", a3.var0, a3.var1, a4);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)selectedTimeRange
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[RCWaveformViewController selectedTimeRange](self->_waveformViewController, "selectedTimeRange");
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)resetSelectedTimeRangeToFullDuration
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  -[RCAVWaveformViewController maximumSelectionDuration](self, "maximumSelectionDuration");
  v4 = v3;
  if (v3 == 0.0)
  {
    -[RCAVWaveformViewController duration](self, "duration");
    v4 = v5;
  }
  if (v4 >= 0.0)
  {
    if (-[RCAVWaveformViewController isViewLoaded](self, "isViewLoaded"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController view](self, "view"));

    }
    v9 = (id)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController waveformViewController](self, "waveformViewController"));
    objc_msgSend(v9, "duration");
    if (v4 >= v7)
      v8 = v7;
    else
      v8 = v4;
    objc_msgSend(v9, "setSelectedTimeRange:animationDuration:", RCTimeRangeMake(0.0, v8));

  }
}

- (void)setMaximumSelectionDuration:(double)a3
{
  if (self->_maximumSelectionDuration != a3)
  {
    self->_maximumSelectionDuration = a3;
    -[RCWaveformViewController setMaximumSelectionDuration:](self->_waveformViewController, "setMaximumSelectionDuration:");
  }
}

- (void)waveformViewController:(id)a3 didScrubToTime:(double)a4 finished:(BOOL)a5
{
  _BOOL4 v5;
  UIAccessibilityNotifications v9;
  uint64_t v10;
  void *v11;

  v5 = a5;
  if (UIAccessibilityIsVoiceOverRunning() && (CFAbsoluteTimeGetCurrent() - *(double *)&qword_1001ED868 > 2.0 || v5))
  {
    v9 = UIAccessibilityAnnouncementNotification;
    v10 = UIAXTimeStringForDuration(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    UIAccessibilityPostNotification(v9, v11);

    qword_1001ED868 = CFAbsoluteTimeGetCurrent();
  }
  -[RCTimeController setTargetTime:](self->_activeTimeController, "setTargetTime:", a4);
}

- (void)waveformViewControllerDidEndEditingSelectedTimeRange:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;

  -[RCAVWaveformViewController selectedTimeRange](self, "selectedTimeRange", a3);
  v5 = v4;
  v7 = v6;
  v8 = -[RCTimeController currentTime](self->_activeTimeController, "currentTime");
  v10 = v9;
  if ((RCTimeRangeContainsTime(v8, v5, v7, v9) & 1) == 0)
  {
    v10 = RCTimeRangeConstrainTime(v5, v7, v10);
    -[RCTimeController setTargetTime:](self->_activeTimeController, "setTargetTime:");
  }
  self->_nextPreviewStartTime = v10;
  -[RCTimeController setAllowedTimeRange:](self->_activeTimeController, "setAllowedTimeRange:", v5, v7);
}

- (void)timeController:(id)a3 didChangeState:(int64_t)a4
{
  double v6;

  if (!a4)
  {
    objc_msgSend(a3, "currentTime");
    self->_nextPreviewStartTime = v6;
  }
  -[RCAVWaveformViewController _updateInterfaceForTimeControllerState:](self, "_updateInterfaceForTimeControllerState:", a4);
}

- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4 didJumpTime:(BOOL)a5
{
  self->_didJumpTime = a5;
  -[RCAVWaveformViewController setCurrentTime:](self, "setCurrentTime:", a3, a4);
}

- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4 didChangeDuration:(double)a5
{
  _QWORD v5[7];

  if (!self->_shouldPauseTimeControllerUpdates)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10003EB1C;
    v5[3] = &unk_1001ABDE8;
    v5[4] = self;
    *(double *)&v5[5] = a5;
    *(double *)&v5[6] = a4;
    -[RCAVWaveformViewController _updateDisplayableTimesWithBlock:](self, "_updateDisplayableTimesWithBlock:", v5);
  }
}

- (void)_forceUpdateCurrentTimeAndDuration
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10003EBA8;
  v2[3] = &unk_1001AB588;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

- (void)_setWaveformDataSource:(id)a3 initialTime:(double)a4
{
  RCWaveformDataSource *v7;
  RCWaveformDataSource **p_waveformDataSource;
  RCWaveformViewController *waveformViewController;
  id WeakRetained;
  _QWORD v11[6];

  v7 = (RCWaveformDataSource *)a3;
  p_waveformDataSource = &self->_waveformDataSource;
  if (self->_waveformDataSource != v7)
  {
    objc_storeStrong((id *)&self->_waveformDataSource, a3);
    if (*p_waveformDataSource)
      -[RCWaveformDataSource beginLoading](*p_waveformDataSource, "beginLoading");
    -[RCWaveformViewController setDataSource:](self->_waveformViewController, "setDataSource:", v7);
    -[RCWaveformViewController setCurrentTime:](self->_waveformViewController, "setCurrentTime:", a4);
    waveformViewController = self->_waveformViewController;
    -[RCWaveformDataSource duration](v7, "duration");
    -[RCWaveformViewController setDuration:](waveformViewController, "setDuration:");
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003ED64;
    v11[3] = &unk_1001ABE10;
    v11[4] = self;
    *(double *)&v11[5] = a4;
    -[RCAVWaveformViewController _updateDisplayableTimesWithBlock:](self, "_updateDisplayableTimesWithBlock:", v11);
    self->_nextPreviewStartTime = a4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "audioWaveformControllerDidChangeWaveformDataSource:", self);

  }
}

- (void)_updateCurrentTimeForCapturedInputAtTime:(double)a3
{
  if (self->_currentTimeTracksCapturedEndPoint)
    -[RCAVWaveformViewController setCurrentTime:](self, "setCurrentTime:", a3);
}

- (void)_didUpdateDisplayableTime
{
  double v3;
  double v4;
  RCWaveformViewController *waveformViewController;
  id WeakRetained;

  if (self->_batchUpdatingDisplayableTimesCount < 1)
  {
    -[RCAVWaveformViewController currentTime](self, "currentTime");
    v4 = v3;
    if (v3 > RCTimeRangeGetMidTime(-[RCAVWaveformViewController visibleTimeRange](self, "visibleTimeRange")))
      -[RCWaveformViewController setCurrentTimeDisplayOptions:](self->_waveformViewController, "setCurrentTimeDisplayOptions:", -[RCAVWaveformViewController _currentTimeDisplayOptions](self, "_currentTimeDisplayOptions"));
    -[RCWaveformViewController setCurrentTime:](self->_waveformViewController, "setCurrentTime:", v4);
    waveformViewController = self->_waveformViewController;
    -[RCAVWaveformViewController duration](self, "duration");
    -[RCWaveformViewController setDuration:](waveformViewController, "setDuration:");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "audioWaveformControllerDidChangeAVTimes:", self);

    if (self->_isOverview)
      -[RCWaveformViewController updateVisibleTimeRangeToFullDuration](self->_waveformViewController, "updateVisibleTimeRangeToFullDuration");
  }
  else
  {
    self->_needsUpdateDisplayableTime = 1;
  }
}

- (void)_updateDisplayableTimesWithBlock:(id)a3
{
  int64_t v4;

  ++self->_batchUpdatingDisplayableTimesCount;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  v4 = self->_batchUpdatingDisplayableTimesCount - 1;
  self->_batchUpdatingDisplayableTimesCount = v4;
  if (!v4 && self->_needsUpdateDisplayableTime)
    -[RCAVWaveformViewController _didUpdateDisplayableTime](self, "_didUpdateDisplayableTime");
}

- (void)_setSelectionOverlayEnabled:(BOOL)a3
{
  if (self->_showingSelectionOverlayEnabled != a3)
  {
    self->_showingSelectionOverlayEnabled = a3;
    -[RCAVWaveformViewController _didUpdateDisplayableTime](self, "_didUpdateDisplayableTime");
  }
}

- (unint64_t)_currentTimeDisplayOptions
{
  return -[RCAVWaveformViewController _currentTimeDisplayOptionsIgnoringSelectionOverlayState:](self, "_currentTimeDisplayOptionsIgnoringSelectionOverlayState:", 0);
}

- (unint64_t)_currentTimeDisplayOptionsIgnoringSelectionOverlayState:(BOOL)a3
{
  if (self->_selectionOverlayVisible && !a3)
    return 2;
  else
    return self->_autocenterCurrentTimeIndicatorAlways;
}

- (void)_updateInterfaceForTimeControllerState:(int64_t)a3
{
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  _BOOL8 selectionOverlayVisible;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;

  v4 = a3 == 1;
  v5 = a3 == 2;
  v6 = (unint64_t)(a3 - 3) < 0xFFFFFFFFFFFFFFFELL;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController waveformViewController](self, "waveformViewController"));
  objc_msgSend(v7, "setPlaying:", v4);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController waveformViewController](self, "waveformViewController"));
  objc_msgSend(v8, "setCapturing:", v5);

  selectionOverlayVisible = self->_selectionOverlayVisible;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController waveformViewController](self, "waveformViewController"));
  objc_msgSend(v10, "setSelectedTimeRangeEditingEnabled:", selectionOverlayVisible);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController waveformViewController](self, "waveformViewController"));
  objc_msgSend(v11, "setScrubbingEnabled:", v6);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController waveformViewController](self, "waveformViewController"));
  -[RCAVWaveformViewController _setSelectionOverlayEnabled:](self, "_setSelectionOverlayEnabled:", objc_msgSend(v12, "showPlayBarOnly"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "audioWaveformControllerDidChangeAVState:", self);

}

- (void)_beginShowingSelectionOverlayAndEnableInsertMode:(BOOL)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  BOOL v17;

  -[RCAVWaveformViewController maximumSelectionDuration](self, "maximumSelectionDuration");
  if (v5 == 0.0)
    -[RCAVWaveformViewController duration](self, "duration");
  if (v5 >= 0.0)
  {
    -[RCAVWaveformViewController resetSelectedTimeRangeToFullDuration](self, "resetSelectedTimeRangeToFullDuration");
    v6 = 0.0;
    if (-[RCAVWaveformViewController isViewLoaded](self, "isViewLoaded"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController view](self, "view"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
      if (v8)
        v6 = 0.5;
      else
        v6 = 0.0;

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController waveformViewController](self, "waveformViewController"));
    self->_selectionOverlayVisible = 1;
    -[RCAVWaveformViewController currentTime](self, "currentTime");
    self->_nextPreviewStartTime = v10;
    objc_msgSend(v9, "visibleTimeRange");
    self->_defaultVisibleDuration = RCTimeRangeDeltaWithUIPrecision(v11, v12);
    objc_msgSend(v9, "setCurrentTimeDisplayOptions:", -[RCAVWaveformViewController _currentTimeDisplayOptions](self, "_currentTimeDisplayOptions"));
    v14[4] = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003F208;
    v15[3] = &unk_1001AB8D8;
    v16 = v9;
    v17 = a3;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003F238;
    v14[3] = &unk_1001ABE38;
    v13 = v9;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v15, v14, v6, 0.0);

  }
}

- (void)_endShowingSelectionOverlayWithCompletionBlock:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  double v20;

  v4 = a3;
  v5 = 0.0;
  if (-[RCAVWaveformViewController isViewLoaded](self, "isViewLoaded"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
    if (v7)
      v5 = 0.5;
    else
      v5 = 0.0;

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController waveformViewController](self, "waveformViewController"));
  -[RCAVWaveformViewController nextPreviewStartTime](self, "nextPreviewStartTime");
  v10 = v9;
  self->_selectionOverlayVisible = 0;
  objc_msgSend(v8, "setCurrentTimeDisplayOptions:", -[RCAVWaveformViewController _currentTimeDisplayOptions](self, "_currentTimeDisplayOptions"));
  objc_msgSend(v8, "setSelectionOverlayShouldUseInsertMode:", 0);
  objc_msgSend(v8, "setSelectedTimeRangeEditingEnabled:", 0);
  objc_msgSend(v8, "setScrubbingEnabled:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController activeTimeController](self, "activeTimeController"));
  objc_msgSend(v11, "currentDuration");
  objc_msgSend(v11, "setAllowedTimeRange:", RCTimeRangeMake(0.0, v12));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003F45C;
  v17[3] = &unk_1001ABDE8;
  v18 = v8;
  v19 = v10;
  v20 = v5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003F4A4;
  v15[3] = &unk_1001ABE60;
  v16 = v4;
  v13 = v4;
  v14 = v8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v17, v15, v5, 0.0);

}

- (id)_selectionOverlay
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCAVWaveformViewController waveformViewController](self, "waveformViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("_selectionOverlay")));

  return v3;
}

- (RCWaveformDataSource)waveformDataSource
{
  return self->_waveformDataSource;
}

- (void)setWaveformDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_waveformDataSource, a3);
}

- (RCAVWaveformViewControllerDelegate)delegate
{
  return (RCAVWaveformViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RCWaveformViewController)waveformViewController
{
  return self->_waveformViewController;
}

- (void)setWaveformViewController:(id)a3
{
  objc_storeStrong((id *)&self->_waveformViewController, a3);
}

- (RCTimeController)activeTimeController
{
  return self->_activeTimeController;
}

- (double)nextPreviewStartTime
{
  return self->_nextPreviewStartTime;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)highlightTimeRange
{
  double beginTime;
  double endTime;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  beginTime = self->_highlightTimeRange.beginTime;
  endTime = self->_highlightTimeRange.endTime;
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (BOOL)currentTimeTracksCapturedEndPoint
{
  return self->_currentTimeTracksCapturedEndPoint;
}

- (void)setCurrentTimeTracksCapturedEndPoint:(BOOL)a3
{
  self->_currentTimeTracksCapturedEndPoint = a3;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)autocenterCurrentTimeIndicatorAlways
{
  return self->_autocenterCurrentTimeIndicatorAlways;
}

- (BOOL)clipsTimeMarkersToDuration
{
  return self->_clipsTimeMarkersToDuration;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (BOOL)isBlurred
{
  return self->_blurred;
}

- (BOOL)isSelectionOverlayVisible
{
  return self->_selectionOverlayVisible;
}

- (double)maximumSelectionDuration
{
  return self->_maximumSelectionDuration;
}

- (BOOL)isEditMode
{
  return self->_isEditMode;
}

- (BOOL)isOverview
{
  return self->_isOverview;
}

- (void)setIsOverview:(BOOL)a3
{
  self->_isOverview = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waveformViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_waveformDataSource, 0);
  objc_storeStrong((id *)&self->_rightForwardingView, 0);
  objc_storeStrong((id *)&self->_leftForwardingView, 0);
  objc_storeStrong((id *)&self->_activeTimeController, 0);
}

@end
