@implementation VIOSessionStateFloatingDebugViewController

+ (VIOSessionStateFloatingDebugViewController)sharedInstance
{
  if (qword_1014D43E8 != -1)
    dispatch_once(&qword_1014D43E8, &stru_1011E8970);
  return (VIOSessionStateFloatingDebugViewController *)(id)qword_1014D43E0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController session](self, "session"));
  objc_msgSend(v3, "_removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VIOSessionStateFloatingDebugViewController;
  -[VIOSessionStateFloatingDebugViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
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
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
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
  void *v47;
  void *v48;
  void *v49;
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
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  objc_super v71;
  _QWORD v72[5];
  _QWORD v73[3];

  v71.receiver = self;
  v71.super_class = (Class)VIOSessionStateFloatingDebugViewController;
  -[MapsFloatingDebugViewController viewDidLoad](&v71, "viewDidLoad");
  v3 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[VIOSessionStateFloatingDebugViewController setDebugInfoLabel:](self, "setDebugInfoLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  objc_msgSend(v7, "setTextColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  objc_msgSend(v8, "setNumberOfLines:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  LODWORD(v11) = 1148846080;
  objc_msgSend(v10, "setContentCompressionResistancePriority:forAxis:", 1, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  LODWORD(v13) = 1148846080;
  objc_msgSend(v12, "setContentCompressionResistancePriority:forAxis:", 0, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  objc_msgSend(v14, "addSubview:", v15);

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "leadingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "leadingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v63));
  v73[0] = v61;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v17));
  v73[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
  v73[2] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v73, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

  v25 = objc_alloc((Class)UIImageView);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("questionmark.video")));
  v27 = objc_msgSend(v25, "initWithImage:", v26);
  -[VIOSessionStateFloatingDebugViewController setCameraFeedImageView:](self, "setCameraFeedImageView:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController cameraFeedImageView](self, "cameraFeedImageView"));
  objc_msgSend(v28, "setContentMode:", 1);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController cameraFeedImageView](self, "cameraFeedImageView"));
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController cameraFeedImageView](self, "cameraFeedImageView"));
  LODWORD(v31) = 1148846080;
  objc_msgSend(v30, "setContentCompressionResistancePriority:forAxis:", 1, v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController cameraFeedImageView](self, "cameraFeedImageView"));
  LODWORD(v33) = 1148846080;
  objc_msgSend(v32, "setContentCompressionResistancePriority:forAxis:", 0, v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController cameraFeedImageView](self, "cameraFeedImageView"));
  objc_msgSend(v34, "addSubview:", v35);

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController cameraFeedImageView](self, "cameraFeedImageView"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "topAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "bottomAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", v64, 5.0));
  v72[0] = v62;
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController cameraFeedImageView](self, "cameraFeedImageView"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "centerXAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "centerXAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v55));
  v72[1] = v54;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController cameraFeedImageView](self, "cameraFeedImageView"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "widthAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToConstant:", 200.0));
  v72[2] = v51;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController cameraFeedImageView](self, "cameraFeedImageView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "heightAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController cameraFeedImageView](self, "cameraFeedImageView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "widthAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v37));
  v72[3] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController cameraFeedImageView](self, "cameraFeedImageView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "bottomAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v42));
  v72[4] = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v72, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 7, 3, 35.0));
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("arkit"), v45));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "imageWithRenderingMode:", 2));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailImageView](self, "thumbnailImageView"));
  objc_msgSend(v48, "setImage:", v47);

}

+ (BOOL)shouldAttachOnLaunch
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kVIOSessionStateFloatingDebugViewControllerAttachedKey"));

  return v3;
}

- (void)updateViewForCurrentState
{
  int64_t v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VIOSessionStateFloatingDebugViewController;
  -[MapsFloatingDebugViewController updateViewForCurrentState](&v6, "updateViewForCurrentState");
  v3 = -[MapsFloatingDebugViewController viewState](self, "viewState");
  if (v3 == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController session](self, "session"));
    objc_msgSend(v5, "_addObserver:", self);

    -[VIOSessionStateFloatingDebugViewController updateDebugText](self, "updateDebugText");
    -[VIOSessionStateFloatingDebugViewController startDebugInfoRefreshTimer](self, "startDebugInfoRefreshTimer");
  }
  else if (!v3)
  {
    -[VIOSessionStateFloatingDebugViewController setDebugInfoRefreshTimer:](self, "setDebugInfoRefreshTimer:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController session](self, "session"));
    objc_msgSend(v4, "_removeObserver:", self);

  }
}

- (id)tintColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorWithAlphaComponent:", 0.699999988));

  return v3;
}

- (id)iconText
{
  return CFSTR("MarcoLite");
}

- (void)attach
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VIOSessionStateFloatingDebugViewController;
  -[MapsFloatingDebugViewController attach](&v3, "attach");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("kVIOSessionStateFloatingDebugViewControllerAttachedKey"));

}

- (void)detach
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VIOSessionStateFloatingDebugViewController;
  -[MapsFloatingDebugViewController detach](&v3, "detach");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "setBool:forKey:", 0, CFSTR("kVIOSessionStateFloatingDebugViewControllerAttachedKey"));

}

- (VIOSessionTask)vioSessionTask
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "platformController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "auxiliaryTasksManager"));
  v5 = objc_msgSend(v4, "auxilaryTaskForClass:", objc_opt_class(VIOSessionTask));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (VIOSessionTask *)v6;
}

- (ARSession)session
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MapsARSessionManager sharedManager](MapsARSessionManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "session"));

  return (ARSession *)v3;
}

- (void)updateDebugText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  char *v26;
  const __CFString *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController vioSessionTask](self, "vioSessionTask"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeMonitors"));

  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    objc_msgSend(v5, "appendFormat:", CFSTR("Currently active monitors:\n"));
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v9)
            objc_enumerationMutation(v6);
          v11 = (objc_class *)objc_opt_class(*(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i));
          v12 = NSStringFromClass(v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v8);
    }

    objc_msgSend(v5, "appendFormat:", CFSTR("\n"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stateManager"));

    if (objc_msgSend(v15, "isThrottling"))
    {
      v16 = objc_msgSend(v15, "throttleEventReason");
      v17 = CFSTR("VIOSessionThrottleEventDeviceMotion");
      if (!v16)
        v17 = CFSTR("VIOSessionThrottleEventARTrackingState");
      objc_msgSend(v5, "appendFormat:", CFSTR("VIO session is currently being throttled for the following reason:\n%@\n"), v17);
      objc_msgSend(v15, "remainingThrottleTime");
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringValue"));
      objc_msgSend(v5, "appendFormat:", CFSTR("Throttle time remaining: %@"), v19);

    }
    else if (objc_msgSend(v15, "isDisabled"))
    {
      objc_msgSend(v5, "appendFormat:", CFSTR("VIO session is currently disabled for the following reasons:\n"));
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "disableEventReasons"));
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v30;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(_QWORD *)v30 != v24)
              objc_enumerationMutation(v21);
            v26 = (char *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j), "integerValue");
            v27 = CFSTR("VIOSessionDisableEventLowPowerMode");
            if ((unint64_t)(v26 - 1) <= 9)
              v27 = off_1011E8990[(_QWORD)(v26 - 1)];
            objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), v27);
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v23);
      }

    }
    else
    {
      objc_msgSend(v5, "appendFormat:", CFSTR("VIO session is currently neither throttled nor disabled"));
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
    objc_msgSend(v28, "setText:", v5);

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
    objc_msgSend(v20, "setText:", CFSTR("There are currently no running monitors"));

  }
}

- (void)startDebugInfoRefreshTimer
{
  id v3;
  void *v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = &_dispatch_main_q;
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_100BE7B34;
  v8 = &unk_1011AE190;
  objc_copyWeak(&v9, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, &v5, 0.5));
  -[VIOSessionStateFloatingDebugViewController setDebugInfoRefreshTimer:](self, "setDebugInfoRefreshTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)updateCameraFrame
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  CGImage *v17;
  void *v18;
  void *v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController session](self, "session"));
  v4 = objc_msgSend(v3, "state");

  if (v4 == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController session](self, "session"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentFrame"));

    if (v6)
    {
      memset(&v22, 0, sizeof(v22));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "windowScene"));
      v10 = objc_msgSend(v9, "interfaceOrientation");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController cameraFeedImageView](self, "cameraFeedImageView"));
      objc_msgSend(v11, "bounds");
      objc_msgSend(v6, "displayTransformForOrientation:viewportSize:", v10, v12, v13);

      v20 = v22;
      CGAffineTransformInvert(&v21, &v20);
      v22 = v21;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[CIImage imageWithCVPixelBuffer:](CIImage, "imageWithCVPixelBuffer:", objc_msgSend(v6, "capturedImage")));
      v21 = v22;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageByApplyingTransform:", &v21));

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CIContext contextWithOptions:](CIContext, "contextWithOptions:", 0));
      objc_msgSend(v15, "extent");
      v17 = (CGImage *)objc_msgSend(v16, "createCGImage:fromRect:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v17));
      CGImageRelease(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateFloatingDebugViewController cameraFeedImageView](self, "cameraFeedImageView"));
      objc_msgSend(v19, "setImage:", v18);

    }
  }
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  _QWORD block[7];

  if (a4 != 1)
  {
    block[5] = v4;
    block[6] = v5;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100BE7DDC;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (UILabel)debugInfoLabel
{
  return self->_debugInfoLabel;
}

- (void)setDebugInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_debugInfoLabel, a3);
}

- (UIImageView)cameraFeedImageView
{
  return self->_cameraFeedImageView;
}

- (void)setCameraFeedImageView:(id)a3
{
  objc_storeStrong((id *)&self->_cameraFeedImageView, a3);
}

- (GCDTimer)debugInfoRefreshTimer
{
  return self->_debugInfoRefreshTimer;
}

- (void)setDebugInfoRefreshTimer:(id)a3
{
  objc_storeStrong((id *)&self->_debugInfoRefreshTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfoRefreshTimer, 0);
  objc_storeStrong((id *)&self->_cameraFeedImageView, 0);
  objc_storeStrong((id *)&self->_debugInfoLabel, 0);
}

@end
