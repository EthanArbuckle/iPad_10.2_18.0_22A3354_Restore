@implementation PHLocalVideoViewController

- (void)_avFirstPreviewFrameArrived:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  if (-[PHLocalVideoViewController waitingForLocalVideoFirstFrame](self, "waitingForLocalVideoFirstFrame", a3))
  {
    v4 = sub_10000E6C4();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "First frame arrived: fading in local video", buf, 2u);
    }

    -[PHLocalVideoViewController setWaitingForLocalVideoFirstFrame:](self, "setWaitingForLocalVideoFirstFrame:", 0);
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_autoFadeInLocalVideo", 0);
    -[PHLocalVideoViewController _fadeInLocalVideo](self, "_fadeInLocalVideo");
  }
  v6 = sub_10000E6C4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "First local video frame arrived, updating the video layer in case the camera source changed", v8, 2u);
  }

  -[PHLocalVideoViewController _applyAutoRotationCorrectionForCurrentOrientationWithTransitionCoordinator:](self, "_applyAutoRotationCorrectionForCurrentOrientationWithTransitionCoordinator:", 0);
}

- (void)associateLocalVideoLayers
{
  void *v3;
  void *v4;
  id v5;

  -[PHLocalVideoViewController _ensureVideoLayersExist](self, "_ensureVideoLayersExist");
  v5 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "videoDeviceController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_localVideoView, "layer"));
  objc_msgSend(v3, "setLocalFrontLayer:", v4);

}

- (void)_applyAutoRotationCorrectionForOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  CGFloat v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  unsigned int v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  CGAffineTransform v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGAffineTransform buf;

  v6 = -[PHLocalVideoViewController supportsAutoRotation](self, "supportsAutoRotation", a3, a4);
  v7 = sub_10000E6C4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) != 0)
  {
    if (v9)
    {
      LODWORD(buf.a) = 134217984;
      *(_QWORD *)((char *)&buf.a + 4) = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PHLocalVideoViewController _applyAutoRotationCorrectionForOrientation %lu (supportsAutoRotation = YES)", (uint8_t *)&buf, 0xCu);
    }

    -[UIControl bounds](self->_videoGroupView, "bounds");
    v12 = v10;
    v13 = v11;
    v45 = v14;
    v46 = v15;
    v47 = v10;
    v48 = v11;
    v16 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&buf.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&buf.c = v16;
    *(_OWORD *)&buf.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    switch(a3)
    {
      case 1:
        break;
      case 2:
        v17 = 3.14159203;
        goto LABEL_13;
      case 3:
        v45 = 0.0;
        v46 = 0.0;
        v47 = v11;
        v48 = v10;
        v17 = -1.57079633;
        goto LABEL_13;
      case 4:
        v45 = 0.0;
        v46 = 0.0;
        v47 = v11;
        v48 = v10;
        v17 = 1.57079633;
LABEL_13:
        CGAffineTransformMakeRotation(&buf, v17);
        break;
      default:
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
        v19 = v18;
        if (v18)
          objc_msgSend(v18, "transform");
        else
          memset(&v44, 0, sizeof(v44));
        buf = v44;

        break;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController featureFlags](self, "featureFlags"));
    v21 = objc_msgSend(v20, "previewMSROptimizationEnabled");

    if (v21)
      -[PHLocalVideoViewController _previewMSROptimizationCompensationForOrientation:withTransform:withBounds:](self, "_previewMSROptimizationCompensationForOrientation:withTransform:withBounds:", a3, &buf, &v45);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
    objc_msgSend(v22, "setCenter:", v12 * 0.5, v13 * 0.5);

    if (-[PHLocalVideoViewController isUsingIPadExternalCamera](self, "isUsingIPadExternalCamera"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController featureFlags](self, "featureFlags"));
      v24 = 0.0;
      v25 = 0.0;
      if (objc_msgSend(v23, "previewMSROptimizationEnabled"))
      {
        -[UIControl bounds](self->_videoGroupView, "bounds");
        v24 = v26;
        v25 = v27;
        v13 = v28;
        v12 = v29;
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
      objc_msgSend(v30, "setBounds:", v24, v25, v13, v12);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController featureFlags](self, "featureFlags"));
      v32 = objc_msgSend(v31, "previewMSROptimizationEnabled");
      v33 = -1.57079633;
      if (v32)
        v33 = 3.14159203;
      CGAffineTransformMakeRotation(&v43, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
      v42 = v43;
      objc_msgSend(v34, "setTransform:", &v42);

    }
    else
    {
      v35 = v45;
      v36 = v46;
      v37 = v47;
      v38 = v48;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
      objc_msgSend(v39, "setBounds:", v35, v36, v37, v38);

      v41 = buf;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
      v40 = v41;
      objc_msgSend(v31, "setTransform:", &v40);
    }

  }
  else
  {
    if (v9)
    {
      LODWORD(buf.a) = 134217984;
      *(_QWORD *)((char *)&buf.a + 4) = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PHLocalVideoViewController _applyAutoRotationCorrectionForOrientation %lu (supportsAutoRotation = NO)", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHLocalVideoViewController;
  -[PHLocalVideoViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[PHLocalVideoViewController _ensureLocalVideoWillBecomeVisible](self, "_ensureLocalVideoWillBecomeVisible");
}

- (void)_ensureLocalVideoWillBecomeVisible
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  int v9;
  PHLocalVideoViewController *v10;
  __int16 v11;
  const char *v12;

  v3 = sub_10000E6C4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = self;
    v11 = 2080;
    v12 = "-[PHLocalVideoViewController _ensureLocalVideoWillBecomeVisible]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ %s", (uint8_t *)&v9, 0x16u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
  objc_msgSend(v5, "setHidden:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
  objc_msgSend(v6, "alpha");
  v8 = v7;

  if (v8 == 0.0)
    -[PHLocalVideoViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_autoFadeInLocalVideo", 0, 0.5);
  else
    self->_waitingForLocalVideoFirstFrame = 0;
}

- (UIView)localVideoView
{
  return self->_localVideoView;
}

- (void)_handleVideoPreviewDidStartNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = sub_10000E6C4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Local preview did start notification, we'll remove the disabled overlay view if it exists", v8, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController disabledOverlayView](self, "disabledOverlayView"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController disabledOverlayView](self, "disabledOverlayView"));
    objc_msgSend(v7, "removeFromSuperview");

    -[PHLocalVideoViewController setDisabledOverlayView:](self, "setDisabledOverlayView:", 0);
  }
}

- (void)updateViewControllerForOrientation:(int64_t)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  uint8_t v9[16];

  if (-[PHLocalVideoViewController supportsAutoRotation](self, "supportsAutoRotation"))
  {
    -[PHLocalVideoViewController _applyAutoRotationCorrectionForOrientation:withTransitionCoordinator:](self, "_applyAutoRotationCorrectionForOrientation:withTransitionCoordinator:", a3, 0);
  }
  else
  {
    v5 = sub_10000E6C4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHLocalVideoViewController.updateViewControllerForOrientation: Ignoring since supportsAutoRotation = NO", v9, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController featureFlags](self, "featureFlags"));
    v8 = objc_msgSend(v7, "previewMSROptimizationEnabled");

    if (v8)
      -[PHLocalVideoViewController _applyPreviewMSROptimizationTransformsForOrientation:](self, "_applyPreviewMSROptimizationTransformsForOrientation:", a3);
  }
}

- (void)fadeInAnimated:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  _QWORD *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015408;
  v7[3] = &unk_1000898B8;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self, "view"));
  v8 = v4;
  v5 = objc_retainBlock(v7);
  v6 = v5;
  if (v3)
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, 0.400000006);
  else
    ((void (*)(_QWORD *))v5[2])(v5);

}

- (void)_handleSystemPreferredCameraChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = sub_10000E6C4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "System preferred camera changed", buf, 2u);
  }

  if (-[PHLocalVideoViewController didDeferStartCameraAction](self, "didDeferStartCameraAction"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVCaptureDevice systemPreferredCamera](AVCaptureDevice, "systemPreferredCamera"));

    v7 = sub_10000E6C4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v9)
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting camera that was deferred due to systemPreferredCamera initialization", v12, 2u);
      }

      -[PHLocalVideoViewController setDidDeferStartCameraAction:](self, "setDidDeferStartCameraAction:", 0);
      -[PHLocalVideoViewController startPreview](self, "startPreview");
    }
    else
    {
      if (v9)
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Ignoring change to systemPreferredCamera because it's nil", v13, 2u);
      }

    }
  }
  else
  {
    v10 = sub_10000E6C4();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Ignoring change to systemPreferredCamera because there's no pending start camera action", v14, 2u);
    }

  }
}

- (void)_applyAutoRotationCorrectionForCurrentOrientationWithTransitionCoordinator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PHOrientationMonitorComposer *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));

  if (v7)
  {
    v8 = objc_opt_new(PHOrientationMonitorComposer);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHOrientationMonitorComposer compose](v8, "compose"));

    -[PHLocalVideoViewController _applyAutoRotationCorrectionForOrientation:withTransitionCoordinator:](self, "_applyAutoRotationCorrectionForOrientation:withTransitionCoordinator:", objc_msgSend(v9, "makeInterfaceOrientationFrom:whenFailing:", objc_msgSend(v9, "deviceOrientation"), objc_msgSend(v7, "interfaceOrientation")), v4);
  }
  else
  {
    v10 = sub_10000E6C4();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to apply auto-rotation correction because there's no window scene to determine a valid fallback orientation", v12, 2u);
    }

  }
}

- (PHLocalVideoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PHLocalVideoViewController *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  TUFeatureFlags *v9;
  TUFeatureFlags *featureFlags;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PHLocalVideoViewController;
  v4 = -[PHLocalVideoViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6 == (id)1)
      v4->_showsLocalPreviewStatusBarGradient = 1;
    if (objc_msgSend(UIApp, "contentViewCanRotate"))
      v4->_supportsAutoRotation = 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, "_avFirstPreviewFrameArrived:", TUVideoDeviceControllerReceivedFirstPreviewFrameNotification, 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, "_applicationDidBecomeActive:", UIApplicationDidBecomeActiveNotification, 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, "_applicationEnteredBackground:", UIApplicationDidEnterBackgroundNotification, 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, "_handleLocalCameraErrorNotification:", TUVideoDeviceControllerDeviceDidReceiveErrorNotification, 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, "_handleLocalCameraAvailableNotification:", TUVideoDeviceControllerDeviceBecameAvailableNotification, 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, "_handleVideoPreviewDidStartNotification:", TUVideoDeviceControllerDidStartPreviewNotification, 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, "_handleSystemPreferredCameraChangedNotification:", TUVideoDeviceControllerSystemPreferredCameraChangedNotification, 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, "_handleLocalCameraUIDChangedNotification:", TUVideoDeviceControllerDidChangeLocalCameraUIDNotification, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v4->_lastKnownOrientation = (int64_t)objc_msgSend(v8, "orientation");

    if (!-[PHLocalVideoViewController _isValidFaceTimeOrientation:](v4, "_isValidFaceTimeOrientation:", v4->_lastKnownOrientation))v4->_lastKnownOrientation = -[PHLocalVideoViewController supportsAutoRotation](v4, "supportsAutoRotation") ^ 1;
    v9 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v4->_featureFlags;
    v4->_featureFlags = v9;

    v4->_readyForPreview = 1;
    v4->_screensaverActive = 0;

  }
  return v4;
}

- (void)_ensureVideoLayersExist
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
  UIControl *v12;
  UIControl *videoGroupView;
  void *v14;
  void *v15;
  UIView *v16;
  UIView *localVideoView;
  void *v18;
  void *v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (!self->_videoGroupView)
  {
    v12 = (UIControl *)objc_msgSend(objc_alloc((Class)UIControl), "initWithFrame:", v5, v7, v9, v11);
    videoGroupView = self->_videoGroupView;
    self->_videoGroupView = v12;

    -[UIControl setAutoresizingMask:](self->_videoGroupView, "setAutoresizingMask:", 18);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIControl layer](self->_videoGroupView, "layer"));
    objc_msgSend(v14, "setName:", CFSTR("PHLocalVideoControllerGroupView"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self, "view"));
    objc_msgSend(v15, "addSubview:", self->_videoGroupView);

  }
  if (!self->_localVideoView)
  {
    v16 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v5, v7, v9, v11);
    localVideoView = self->_localVideoView;
    self->_localVideoView = v16;

    -[UIView setAutoresizingMask:](self->_localVideoView, "setAutoresizingMask:", 18);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_localVideoView, "layer"));
    objc_msgSend(v18, "setContentsGravity:", kCAGravityResizeAspectFill);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_localVideoView, "layer"));
    objc_msgSend(v19, "setMasksToBounds:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_localVideoView, "layer"));
    objc_msgSend(v20, "setName:", CFSTR("PHLocalVideoControllerLocalVideoView"));

    -[UIControl addSubview:](self->_videoGroupView, "addSubview:", self->_localVideoView);
    -[PHLocalVideoViewController setWaitingForLocalVideoFirstFrame:](self, "setWaitingForLocalVideoFirstFrame:", 1);
  }
}

- (void)_adjustForOrientationAnimated:(BOOL)a3
{
  void *v4;
  id lastKnownOrientation;
  int64_t v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice", a3));
  lastKnownOrientation = objc_msgSend(v4, "orientation");

  if (!-[PHLocalVideoViewController _isValidFaceTimeOrientation:](self, "_isValidFaceTimeOrientation:", lastKnownOrientation))
  {
    if (-[PHLocalVideoViewController _isValidFaceTimeOrientation:](self, "_isValidFaceTimeOrientation:", self->_lastKnownOrientation))
    {
      lastKnownOrientation = (id)self->_lastKnownOrientation;
    }
    else
    {
      lastKnownOrientation = objc_msgSend(UIApp, "statusBarOrientation");
    }
  }
  if (objc_msgSend(UIApp, "isStatusBarHidden")
    && !-[PHLocalVideoViewController supportsAutoRotation](self, "supportsAutoRotation"))
  {
    v6 = +[PHInCallUIUtilities interfaceOrientationForDeviceOrientation:](PHInCallUIUtilities, "interfaceOrientationForDeviceOrientation:", lastKnownOrientation);
    objc_msgSend(UIApp, "setStatusBarOrientation:", v6);
  }
  self->_lastKnownOrientation = (int64_t)lastKnownOrientation;
}

- (BOOL)_isValidFaceTimeOrientation:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 4;
}

- (void)_updateLocalVideoOrientationAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char *lastKnownOrientation;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  if (-[PHLocalVideoViewController isUsingIPadExternalCamera](self, "isUsingIPadExternalCamera")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice")),
        v6 = objc_msgSend(v5, "userInterfaceIdiom"),
        v5,
        v6 == (id)5))
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "videoDeviceController"));
    objc_msgSend(v7, "setCurrentVideoOrientation:", 2);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    lastKnownOrientation = (char *)objc_msgSend(v8, "orientation");

    if (!-[PHLocalVideoViewController _isValidFaceTimeOrientation:](self, "_isValidFaceTimeOrientation:", lastKnownOrientation))lastKnownOrientation = (char *)self->_lastKnownOrientation;
    if ((unint64_t)(lastKnownOrientation - 1) <= 3)
    {
      v10 = -[PHLocalVideoViewController _tuVideoDeviceOrientationForDeviceOrientation:](self, "_tuVideoDeviceOrientationForDeviceOrientation:", lastKnownOrientation);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "videoDeviceController"));
      objc_msgSend(v12, "setCurrentVideoOrientation:", v10);

      -[PHLocalVideoViewController _adjustForOrientationAnimated:](self, "_adjustForOrientationAnimated:", v3);
    }
  }
}

- (int)_tuVideoDeviceOrientationForDeviceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) < 3)
    return a3 - 1;
  else
    return 0;
}

- (void)startPreview
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  const char *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  uint64_t v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[8];
  _BYTE v35[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController _scene](self, "_scene"));
  v4 = v3;
  if (!v3 || objc_msgSend(v3, "activationState") && objc_msgSend(v4, "activationState") != (id)1)
  {
    v12 = sub_10000E6C4();
    v8 = objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v13 = "PHLocalVideoViewController rejected a start preview request because the scene is not in the foreground";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    goto LABEL_41;
  }
  if (!-[PHLocalVideoViewController isReadyForPreview](self, "isReadyForPreview"))
  {
    v14 = sub_10000E6C4();
    v8 = objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v13 = "PHLocalVideoViewController rejected a start preview request because the client has not indicated it is ready";
    goto LABEL_15;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController featureFlags](self, "featureFlags"));
  v6 = objc_msgSend(v5, "previewMSROptimizationEnabled");

  if (v6)
    -[PHLocalVideoViewController associateLocalVideoLayers](self, "associateLocalVideoLayers");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "videoDeviceController"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject currentInputDevice](v8, "currentInputDevice"));
  if (-[PHLocalVideoViewController shouldDeferStartCameraAction](self, "shouldDeferStartCameraAction"))
  {
    v10 = sub_10000E6C4();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Deferring start camera action until systemPreferredCamera is initialized", buf, 2u);
    }

    -[PHLocalVideoViewController setDidDeferStartCameraAction:](self, "setDidDeferStartCameraAction:", 1);
  }
  else
  {
    if (!v9
      || !-[PHLocalVideoViewController deviceIsFrontFacingOrExternal:](self, "deviceIsFrontFacingOrExternal:", v9))
    {
      v15 = sub_10000E6C4();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Resetting camera on TUVideoDeviceController to be front-facing or external", buf, 2u);
      }

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject inputDevices](v8, "inputDevices", 0));
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v31;
        while (2)
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(_QWORD *)v31 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
            if (-[PHLocalVideoViewController deviceIsFrontFacingOrExternal:](self, "deviceIsFrontFacingOrExternal:", v22))
            {
              -[NSObject setCurrentInputDevice:](v8, "setCurrentInputDevice:", v22);
              goto LABEL_30;
            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          if (v19)
            continue;
          break;
        }
      }
LABEL_30:

    }
    v23 = sub_10000E6C4();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "VideoDeviceController startPreview", buf, 2u);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController disabledOverlayView](self, "disabledOverlayView"));
    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController disabledOverlayView](self, "disabledOverlayView"));
      objc_msgSend(v26, "removeFromSuperview");

      -[PHLocalVideoViewController setDisabledOverlayView:](self, "setDisabledOverlayView:", 0);
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject currentInputDevice](v8, "currentInputDevice"));

    if (v27)
    {
      -[NSObject startPreview](v8, "startPreview");
    }
    else
    {
      v28 = sub_10000E6C4();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "PHLocalVideoViewController was asked to start preview, but the current input device is nil", buf, 2u);
      }

    }
  }

LABEL_41:
}

- (BOOL)shouldDeferStartCameraAction
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController featureFlags](self, "featureFlags"));
  if (objc_msgSend(v2, "wombatWisdomEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    if (objc_msgSend(v3, "userInterfaceIdiom") == (id)1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVCaptureDevice systemPreferredCamera](AVCaptureDevice, "systemPreferredCamera"));
      v5 = v4 == 0;

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isUsingIPadExternalCamera
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  id v8;
  NSObject *v9;
  _DWORD v11[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController featureFlags](self, "featureFlags"));
  if (objc_msgSend(v3, "wombatWisdomEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "videoDeviceController"));
    if (objc_msgSend(v5, "currentInputIsExternal"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v7 = objc_msgSend(v6, "userInterfaceIdiom") == (id)1;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  if (v7 != -[PHLocalVideoViewController cachedIsUsingIPadExternalCamera](self, "cachedIsUsingIPadExternalCamera"))
  {
    v8 = sub_10000E6C4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updated cachedIsUsingIPadExternalCamera to %d", (uint8_t *)v11, 8u);
    }

    -[PHLocalVideoViewController setCachedIsUsingIPadExternalCamera:](self, "setCachedIsUsingIPadExternalCamera:", v7);
  }
  return v7;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (BOOL)isReadyForPreview
{
  return self->_readyForPreview;
}

- (PHLocalVideoDisabledOverlayView)disabledOverlayView
{
  return self->_disabledOverlayView;
}

- (BOOL)deviceIsFrontFacingOrExternal:(id)a3
{
  id v3;
  BOOL v4;
  AVCaptureDeviceType v5;

  v3 = a3;
  if (objc_msgSend(v3, "position") == (id)2)
  {
    v4 = 1;
  }
  else
  {
    v5 = (AVCaptureDeviceType)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceType"));
    v4 = v5 == AVCaptureDeviceTypeExternal;

  }
  return v4;
}

- (BOOL)cachedIsUsingIPadExternalCamera
{
  return self->_cachedIsUsingIPadExternalCamera;
}

- (void)_updateLocalPreviewStatusBarGradient
{
  unsigned int v3;
  UIView *localVideoStatusBarGradientView;
  void *v5;
  double v6;
  double v7;
  PHStatusBarGradientView *v8;
  UIView *v9;
  void *v10;
  double v11;

  v3 = -[PHLocalVideoViewController showsLocalPreviewStatusBarGradient](self, "showsLocalPreviewStatusBarGradient");
  localVideoStatusBarGradientView = self->_localVideoStatusBarGradientView;
  if (v3)
  {
    if (!localVideoStatusBarGradientView)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self, "view"));
      objc_msgSend(v5, "bounds");
      v7 = v6;

      v8 = -[PHStatusBarGradientView initWithFrame:]([PHStatusBarGradientView alloc], "initWithFrame:", 0.0, 0.0, v7, 40.0);
      v9 = self->_localVideoStatusBarGradientView;
      self->_localVideoStatusBarGradientView = &v8->super;

      -[UIView setAutoresizingMask:](self->_localVideoStatusBarGradientView, "setAutoresizingMask:", 34);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self, "view"));
      objc_msgSend(v10, "addSubview:", self->_localVideoStatusBarGradientView);

      localVideoStatusBarGradientView = self->_localVideoStatusBarGradientView;
    }
    v11 = 1.0;
  }
  else
  {
    v11 = 0.0;
  }
  -[UIView setAlpha:](localVideoStatusBarGradientView, "setAlpha:", v11);
}

- (BOOL)showsLocalPreviewStatusBarGradient
{
  return self->_showsLocalPreviewStatusBarGradient;
}

- (BOOL)waitingForLocalVideoFirstFrame
{
  return self->_waitingForLocalVideoFirstFrame;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHLocalVideoViewController;
  -[PHLocalVideoViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[PHLocalVideoViewController _updateLocalVideoOrientationAnimated:](self, "_updateLocalVideoOrientationAnimated:", 0);
  if (-[PHLocalVideoViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PHLocalVideoViewController startPreview](self, "startPreview");
    -[PHLocalVideoViewController _updateLocalPreviewStatusBarGradient](self, "_updateLocalPreviewStatusBarGradient");
  }
}

- (BOOL)supportsAutoRotation
{
  return self->_supportsAutoRotation;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)setWaitingForLocalVideoFirstFrame:(BOOL)a3
{
  self->_waitingForLocalVideoFirstFrame = a3;
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return 3;
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHLocalVideoViewController;
  -[PHLocalVideoViewController loadView](&v3, "loadView");
  -[PHLocalVideoViewController _setupVideoLayers](self, "_setupVideoLayers");
  -[PHLocalVideoViewController startPreview](self, "startPreview");
  -[PHLocalVideoViewController _updateLocalPreviewStatusBarGradient](self, "_updateLocalPreviewStatusBarGradient");
}

- (BOOL)didDeferStartCameraAction
{
  return self->_didDeferStartCameraAction;
}

- (void)_setupVideoLayers
{
  -[PHLocalVideoViewController associateLocalVideoLayers](self, "associateLocalVideoLayers");
  -[PHLocalVideoViewController _updateLocalVideoOrientationAnimated:](self, "_updateLocalVideoOrientationAnimated:", 0);
}

- (void)_applicationDidBecomeActive:(id)a3
{
  -[PHLocalVideoViewController _updateLocalVideoOrientationAnimated:](self, "_updateLocalVideoOrientationAnimated:", 0);
  if (-[PHLocalVideoViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PHLocalVideoViewController startPreview](self, "startPreview");
    -[PHLocalVideoViewController _updateLocalPreviewStatusBarGradient](self, "_updateLocalPreviewStatusBarGradient");
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[PHLocalVideoViewController stopPreview](self, "stopPreview");
  -[PHLocalVideoViewController _dissociateVideoLayers](self, "_dissociateVideoLayers");
  v4.receiver = self;
  v4.super_class = (Class)PHLocalVideoViewController;
  -[PHLocalVideoViewController dealloc](&v4, "dealloc");
}

- (BOOL)shouldDisableEdgeClip
{
  return 0;
}

- (void)fadeOutAnimated:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  _QWORD *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100030144;
  v7[3] = &unk_1000898B8;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self, "view"));
  v8 = v4;
  v5 = objc_retainBlock(v7);
  v6 = v5;
  if (v3)
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, 0.400000006);
  else
    ((void (*)(_QWORD *))v5[2])(v5);

}

- (BOOL)localVideoLayersAreAssociated
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "videoDeviceController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localFrontLayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_localVideoView, "layer"));
  v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

- (void)_dissociateVideoLayers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "videoDeviceController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localFrontLayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_localVideoView, "layer"));

  if (v5 == v6)
  {
    objc_msgSend(v4, "setLocalFrontLayer:", 0);
  }
  else
  {
    v7 = sub_10000E6C4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Not clearing the local front video layer because this isn't the current displayController's layer", v9, 2u);
    }

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHLocalVideoViewController;
  -[PHLocalVideoViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
  objc_msgSend(v4, "setAlpha:", 0.0);

  -[PHLocalVideoViewController setWaitingForLocalVideoFirstFrame:](self, "setWaitingForLocalVideoFirstFrame:", 1);
  -[PHLocalVideoViewController stopPreview](self, "stopPreview");
  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
}

- (void)_applicationEnteredBackground:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  v5 = sub_10000E6C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopping preview due to application notification %@", (uint8_t *)&v8, 0xCu);

  }
  -[PHLocalVideoViewController stopPreview](self, "stopPreview");

}

- (void)_previewMSROptimizationCompensationForOrientation:(int64_t)a3 withTransform:(CGAffineTransform *)a4 withBounds:(CGRect *)a5
{
  id v8;
  NSObject *v9;
  NSString *v10;
  void *v11;
  CGFloat v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CGAffineTransform v19;
  CGAffineTransform buf;

  v8 = sub_10000E6C4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromCGRect(*a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    LODWORD(buf.a) = 138412290;
    *(_QWORD *)((char *)&buf.a + 4) = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PHLocalVideoViewController _previewMSROptimizationCompensationForTransform bounds %@", (uint8_t *)&buf, 0xCu);

  }
  a5->origin.x = 0.0;
  a5->origin.y = 0.0;
  a5->size = (CGSize)vextq_s8((int8x16_t)a5->size, (int8x16_t)a5->size, 8uLL);
  v12 = dbl_100067480[(unint64_t)(a3 - 3) < 2];
  if ((unint64_t)(a3 - 3) >= 2)
    v13 = -1.0;
  else
    v13 = 1.0;
  if ((unint64_t)(a3 - 3) >= 2)
    v14 = 1.0;
  else
    v14 = -1.0;
  v15 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v19.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v19.c = v15;
  *(_OWORD *)&v19.tx = *(_OWORD *)&a4->tx;
  CGAffineTransformRotate(&buf, &v19, v12);
  v16 = *(_OWORD *)&buf.c;
  *(_OWORD *)&a4->a = *(_OWORD *)&buf.a;
  *(_OWORD *)&a4->c = v16;
  *(_OWORD *)&a4->tx = *(_OWORD *)&buf.tx;
  v17 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v19.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v19.c = v17;
  *(_OWORD *)&v19.tx = *(_OWORD *)&a4->tx;
  CGAffineTransformScale(&buf, &v19, v14, v13);
  v18 = *(_OWORD *)&buf.c;
  *(_OWORD *)&a4->a = *(_OWORD *)&buf.a;
  *(_OWORD *)&a4->c = v18;
  *(_OWORD *)&a4->tx = *(_OWORD *)&buf.tx;
}

- (void)_applyPreviewMSROptimizationTransformsForOrientation:(int64_t)a3
{
  __int128 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  _OWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v24 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v25 = v5;
  v26 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  -[UIControl bounds](self->_videoGroupView, "bounds");
  v20 = v6;
  v21 = v7;
  v22 = v8;
  v23 = v9;
  -[PHLocalVideoViewController _previewMSROptimizationCompensationForOrientation:withTransform:withBounds:](self, "_previewMSROptimizationCompensationForOrientation:withTransform:withBounds:", a3, &v24, &v20);
  v10 = v20;
  v11 = v21;
  v12 = v22;
  v13 = v23;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
  objc_msgSend(v14, "setBounds:", v10, v11, v12, v13);

  v17 = v24;
  v18 = v25;
  v19 = v26;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
  v16[0] = v17;
  v16[1] = v18;
  v16[2] = v19;
  objc_msgSend(v15, "setTransform:", v16);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  unsigned int v9;
  PHOrientationMonitorComposer *v10;
  void *v11;
  objc_super v12;
  _QWORD v13[5];
  id v14;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  if (-[PHLocalVideoViewController supportsAutoRotation](self, "supportsAutoRotation"))
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000307A0;
    v13[3] = &unk_10008A060;
    v13[4] = self;
    v14 = v7;
    objc_msgSend(v14, "animateAlongsideTransition:completion:", v13, 0);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController featureFlags](self, "featureFlags"));
    v9 = objc_msgSend(v8, "previewMSROptimizationEnabled");

    if (v9)
    {
      v10 = objc_opt_new(PHOrientationMonitorComposer);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHOrientationMonitorComposer compose](v10, "compose"));

      -[PHLocalVideoViewController _applyPreviewMSROptimizationTransformsForOrientation:](self, "_applyPreviewMSROptimizationTransformsForOrientation:", objc_msgSend(v11, "makeInterfaceOrientationFrom:whenFailing:", objc_msgSend(v11, "deviceOrientation"), 1));
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)PHLocalVideoViewController;
  -[PHLocalVideoViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (id)_scene
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "windowScene"));

  return v4;
}

- (void)stopPreview
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  _DWORD v6[2];

  v2 = sub_10000E6C4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = 1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "VideoDeviceController stopPreview: %d", (uint8_t *)v6, 8u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "videoDeviceController"));
  objc_msgSend(v5, "stopPreview");

}

- (void)_fadeInLocalVideo
{
  void *v3;
  double v4;
  double v5;
  _QWORD *v6;
  _QWORD v7[5];

  -[PHLocalVideoViewController setWaitingForLocalVideoFirstFrame:](self, "setWaitingForLocalVideoFirstFrame:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
  objc_msgSend(v3, "alpha");
  v5 = v4;

  if (v5 != 1.0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100030984;
    v7[3] = &unk_1000898B8;
    v7[4] = self;
    v6 = objc_retainBlock(v7);
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v6, 0.300000012);

  }
}

- (void)_handleLocalCameraErrorNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  PHLocalVideoDisabledOverlayView *v9;
  void *v10;
  PHLocalVideoDisabledOverlayView *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", TUVideoDeviceControllerDeviceDidReceiveErrorErrorKey));

  if (v5 && objc_msgSend(v5, "code") == (id)32023)
  {
    v6 = sub_10000E6C4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Local camera was pre-empted from FaceTime local preview", v15, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController disabledOverlayView](self, "disabledOverlayView"));
    if (!v8)
    {
      v9 = [PHLocalVideoDisabledOverlayView alloc];
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self, "view"));
      objc_msgSend(v10, "bounds");
      v11 = -[PHLocalVideoDisabledOverlayView initWithFrame:](v9, "initWithFrame:");
      -[PHLocalVideoViewController setDisabledOverlayView:](self, "setDisabledOverlayView:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController disabledOverlayView](self, "disabledOverlayView"));
      objc_msgSend(v12, "setAutoresizingMask:", 18);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self, "view"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController disabledOverlayView](self, "disabledOverlayView"));
      objc_msgSend(v13, "addSubview:", v14);

    }
  }

}

- (void)_handleLocalCameraAvailableNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = sub_10000E6C4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Local camera pre-emption ended and the camera became available", v8, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController disabledOverlayView](self, "disabledOverlayView"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController disabledOverlayView](self, "disabledOverlayView"));
    objc_msgSend(v7, "removeFromSuperview");

    -[PHLocalVideoViewController setDisabledOverlayView:](self, "setDisabledOverlayView:", 0);
  }
}

- (void)_handleLocalCameraUIDChangedNotification:(id)a3
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _DWORD v12[2];
  __int16 v13;
  unsigned int v14;

  v4 = -[PHLocalVideoViewController cachedIsUsingIPadExternalCamera](self, "cachedIsUsingIPadExternalCamera", a3);
  v5 = -[PHLocalVideoViewController isUsingIPadExternalCamera](self, "isUsingIPadExternalCamera");
  if (v4 != v5)
  {
    v6 = v5;
    v7 = sub_10000E6C4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109376;
      v12[1] = v4;
      v13 = 1024;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Local camera UID changed, oldIsUsingIPadExternalCamera=%d, newIsUsingIPadExternalCamera=%d", (uint8_t *)v12, 0xEu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController localVideoView](self, "localVideoView"));
    objc_msgSend(v9, "setAlpha:", 0.0);

    -[PHLocalVideoViewController setWaitingForLocalVideoFirstFrame:](self, "setWaitingForLocalVideoFirstFrame:", 1);
  }
  v10 = sub_10000E6C4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Local camera UID changed, updating the video layer in case we switched between a built-in and external camera", (uint8_t *)v12, 2u);
  }

  -[PHLocalVideoViewController _applyAutoRotationCorrectionForCurrentOrientationWithTransitionCoordinator:](self, "_applyAutoRotationCorrectionForCurrentOrientationWithTransitionCoordinator:", 0);
}

- (void)setReadyForPreview:(BOOL)a3
{
  self->_readyForPreview = a3;
}

- (UIControl)videoGroupView
{
  return self->_videoGroupView;
}

- (void)setVideoGroupView:(id)a3
{
  objc_storeStrong((id *)&self->_videoGroupView, a3);
}

- (void)setLocalVideoView:(id)a3
{
  objc_storeStrong((id *)&self->_localVideoView, a3);
}

- (UIView)localVideoStatusBarGradientView
{
  return self->_localVideoStatusBarGradientView;
}

- (void)setLocalVideoStatusBarGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_localVideoStatusBarGradientView, a3);
}

- (void)setDisabledOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_disabledOverlayView, a3);
}

- (void)setSupportsAutoRotation:(BOOL)a3
{
  self->_supportsAutoRotation = a3;
}

- (void)setShowsLocalPreviewStatusBarGradient:(BOOL)a3
{
  self->_showsLocalPreviewStatusBarGradient = a3;
}

- (int64_t)lastKnownOrientation
{
  return self->_lastKnownOrientation;
}

- (void)setLastKnownOrientation:(int64_t)a3
{
  self->_lastKnownOrientation = a3;
}

- (void)setDidDeferStartCameraAction:(BOOL)a3
{
  self->_didDeferStartCameraAction = a3;
}

- (BOOL)screensaverActive
{
  return self->_screensaverActive;
}

- (void)setScreensaverActive:(BOOL)a3
{
  self->_screensaverActive = a3;
}

- (void)setCachedIsUsingIPadExternalCamera:(BOOL)a3
{
  self->_cachedIsUsingIPadExternalCamera = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_disabledOverlayView, 0);
  objc_storeStrong((id *)&self->_localVideoStatusBarGradientView, 0);
  objc_storeStrong((id *)&self->_localVideoView, 0);
  objc_storeStrong((id *)&self->_videoGroupView, 0);
}

@end
