@implementation VLFSessionStateFloatingDebugViewController

+ (VLFSessionStateFloatingDebugViewController)sharedInstance
{
  if (qword_1014D2EA0 != -1)
    dispatch_once(&qword_1014D2EA0, &stru_1011C0800);
  return (VLFSessionStateFloatingDebugViewController *)(id)qword_1014D2E98;
}

- (void)viewDidLoad
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
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
  void *v71;
  void *v72;
  objc_super v73;
  _QWORD v74[4];
  _QWORD v75[4];

  v73.receiver = self;
  v73.super_class = (Class)VLFSessionStateFloatingDebugViewController;
  -[MapsFloatingDebugViewController viewDidLoad](&v73, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  -[VLFSessionStateFloatingDebugViewController setShowVLFDebugUIButton:](self, "setShowVLFDebugUIButton:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController showVLFDebugUIButton](self, "showVLFDebugUIButton"));
  objc_msgSend(v4, "setTitle:forState:", CFSTR("Show VLF UI"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController showVLFDebugUIButton](self, "showVLFDebugUIButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v5, "setTitleColor:forState:", v6, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController showVLFDebugUIButton](self, "showVLFDebugUIButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
  objc_msgSend(v8, "setCornerRadius:", 5.0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorWithAlphaComponent:", 0.600000024));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController showVLFDebugUIButton](self, "showVLFDebugUIButton"));
  objc_msgSend(v11, "setBackgroundColor:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController showVLFDebugUIButton](self, "showVLFDebugUIButton"));
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, "showVLFDebugUIButtonTapped:", 64);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController showVLFDebugUIButton](self, "showVLFDebugUIButton"));
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController showVLFDebugUIButton](self, "showVLFDebugUIButton"));
  objc_msgSend(v14, "addSubview:", v15);

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController showVLFDebugUIButton](self, "showVLFDebugUIButton"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "leadingAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "leadingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v65));
  v75[0] = v63;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController showVLFDebugUIButton](self, "showVLFDebugUIButton"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "trailingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "trailingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v55));
  v75[1] = v53;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController showVLFDebugUIButton](self, "showVLFDebugUIButton"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
  v75[2] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController showVLFDebugUIButton](self, "showVLFDebugUIButton"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "heightAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:", 44.0));
  v75[3] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v75, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

  v25 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[VLFSessionStateFloatingDebugViewController setDebugInfoLabel:](self, "setDebugInfoLabel:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  objc_msgSend(v27, "setBackgroundColor:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  objc_msgSend(v29, "setTextColor:", v28);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  objc_msgSend(v30, "setNumberOfLines:", 0);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  LODWORD(v33) = 1148846080;
  objc_msgSend(v32, "setContentCompressionResistancePriority:forAxis:", 1, v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  LODWORD(v35) = 1148846080;
  objc_msgSend(v34, "setContentCompressionResistancePriority:forAxis:", 0, v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  objc_msgSend(v36, "addSubview:", v37);

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "leadingAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "leadingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:", v66));
  v74[0] = v64;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "trailingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "trailingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v56));
  v74[1] = v54;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController showVLFDebugUIButton](self, "showVLFDebugUIButton"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v39));
  v74[2] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController debugInfoLabel](self, "debugInfoLabel"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v44));
  v74[3] = v45;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v74, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 7, 3, 35.0));
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("arkit"), v47));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "imageWithRenderingMode:", 2));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailImageView](self, "thumbnailImageView"));
  objc_msgSend(v50, "setImage:", v49);

}

+ (BOOL)shouldAttachOnLaunch
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kVLFSessionStateFloatingDebugViewControllerAttachedKey"));

  return v3;
}

- (void)updateViewForCurrentState
{
  int64_t v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VLFSessionStateFloatingDebugViewController;
  -[MapsFloatingDebugViewController updateViewForCurrentState](&v6, "updateViewForCurrentState");
  v3 = -[MapsFloatingDebugViewController viewState](self, "viewState");
  if (v3 == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController session](self, "session"));
    objc_msgSend(v5, "_addObserver:", self);

    -[VLFSessionStateFloatingDebugViewController updateDebugText](self, "updateDebugText");
    -[VLFSessionStateFloatingDebugViewController startDebugInfoRefreshTimer](self, "startDebugInfoRefreshTimer");
  }
  else if (!v3)
  {
    -[VLFSessionStateFloatingDebugViewController setDebugInfoRefreshTimer:](self, "setDebugInfoRefreshTimer:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController session](self, "session"));
    objc_msgSend(v4, "_removeObserver:", self);

  }
}

- (id)tintColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blueColor](UIColor, "blueColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorWithAlphaComponent:", 0.699999988));

  return v3;
}

- (id)iconText
{
  return CFSTR("Treadstone");
}

- (void)attach
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VLFSessionStateFloatingDebugViewController;
  -[MapsFloatingDebugViewController attach](&v3, "attach");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("kVLFSessionStateFloatingDebugViewControllerAttachedKey"));

}

- (void)detach
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VLFSessionStateFloatingDebugViewController;
  -[MapsFloatingDebugViewController detach](&v3, "detach");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "setBool:forKey:", 0, CFSTR("kVLFSessionStateFloatingDebugViewControllerAttachedKey"));

}

- (VLFSessionTask)vlfSessionTask
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "platformController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "auxiliaryTasksManager"));
  v5 = objc_msgSend(v4, "auxilaryTaskForClass:", objc_opt_class(VLFSessionTask));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (VLFSessionTask *)v6;
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
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t UInteger;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  NSString *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  objc_class *v32;
  NSString *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *i;
  void *v45;
  void *v46;
  unint64_t v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  id v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  void *j;
  void *v63;
  unint64_t v64;
  const __CFString *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  VLFSessionStateFloatingDebugViewController *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD block[5];
  _BYTE v96[128];
  _BYTE v97[128];

  global_queue = dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006D91C0;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async(v4, block);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  if (qword_1014D2EA8 != -1)
    dispatch_once(&qword_1014D2EA8, &stru_1011C0820);
  v6 = (void *)qword_1014D2EB0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringFromDate:", v7));
  objc_msgSend(v5, "appendFormat:", CFSTR("%@\n\n"), v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSession lastGeoTrackingStatus](VLFSession, "lastGeoTrackingStatus"));
  v10 = NSStringFromARGeoTrackingState(objc_msgSend(v9, "state"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSession lastGeoTrackingStatus](VLFSession, "lastGeoTrackingStatus"));
  v13 = NSStringFromARGeoTrackingStateReason(objc_msgSend(v12, "stateReason"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSession lastGeoTrackingStatus](VLFSession, "lastGeoTrackingStatus"));
  v16 = NSStringFromARGeoTrackingAccuracy(objc_msgSend(v15, "accuracy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v5, "appendFormat:", CFSTR("ARGeoTrackingStatus:\nstate: %@\nreason: %@\naccuracy: %@\n\n"), v11, v14, v17);

  UInteger = GEOConfigGetUInteger(MapsConfig_VLFSessionSuccessCriteria, off_1014B3B88);
  v19 = CFSTR("AND");
  if (!UInteger)
    v19 = CFSTR("OR");
  objc_msgSend(v5, "appendFormat:", CFSTR("Current VLF success criteria: %@\n\n"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSession lastLocation](VLFSession, "lastLocation"));
  if (objc_msgSend(v20, "isCoordinateFused"))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  v82 = v20;
  objc_msgSend(v5, "appendFormat:", CFSTR("Current location: %@\nisCoordinateFused:%@\n\n"), v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController isConnectedToInternalAppleNetwork](self, "isConnectedToInternalAppleNetwork"));
  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController isConnectedToInternalAppleNetwork](self, "isConnectedToInternalAppleNetwork"));
    if (objc_msgSend(v23, "BOOLValue"))
      v24 = CFSTR("YES");
    else
      v24 = CFSTR("NO");
    objc_msgSend(v5, "appendFormat:", CFSTR("Connected to internal apple network: %@\n\n"), v24);

  }
  else
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("Connected to internal apple network: %@\n\n"), CFSTR("unknown"));
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController session](self, "session"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "configuration"));

  v27 = (objc_class *)objc_opt_class(v26);
  v28 = NSStringFromClass(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  objc_msgSend(v5, "appendFormat:", CFSTR("Current configuration: %@\n"), v29);

  v30 = objc_opt_class(ARCustomTechniquesConfiguration);
  if ((objc_opt_isKindOfClass(v26, v30) & 1) != 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "templateConfiguration"));
    v32 = (objc_class *)objc_opt_class(v31);
    v33 = NSStringFromClass(v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    objc_msgSend(v5, "appendFormat:", CFSTR("Template configuration: %@\n"), v34);

  }
  v81 = v26;
  objc_msgSend(v5, "appendFormat:", CFSTR("\nCurrent state:"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController session](self, "session"));
  v36 = (unint64_t)objc_msgSend(v35, "state");

  if (v36 <= 2)
    objc_msgSend(v5, "appendFormat:", off_1011C0880[v36]);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[MapsARSessionManager sharedManager](MapsARSessionManager, "sharedManager"));
  v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "currentSessionOwner"));

  v80 = (void *)v38;
  objc_msgSend(v5, "appendFormat:", CFSTR("\nCurrent session owner: %@\n"), v38);
  objc_msgSend(v5, "appendFormat:", CFSTR("\nAll session owners:\n"));
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[MapsARSessionManager sharedManager](MapsARSessionManager, "sharedManager"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "allSessionOwners"));

  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v92;
    do
    {
      for (i = 0; i != v42; i = (char *)i + 1)
      {
        if (*(_QWORD *)v92 != v43)
          objc_enumerationMutation(v40);
        objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)i));
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
    }
    while (v42);
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController vlfSessionTask](self, "vlfSessionTask"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "stateManager"));
  v47 = (unint64_t)objc_msgSend(v46, "currentState");
  if (v47 > 2)
    v48 = CFSTR("?");
  else
    v48 = off_1011C0898[v47];
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController vlfSessionTask](self, "vlfSessionTask"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "stateManager"));
  v51 = objc_msgSend(v50, "currentState");
  v52 = CFSTR("Off");
  if (v51 == (id)1)
    v52 = CFSTR("Puck");
  if (v51 == (id)2)
    v52 = CFSTR("PuckAndBanner");
  objc_msgSend(v5, "appendFormat:", CFSTR("\nCurrent UI state: \n%@ %@\n"), v48, v52);

  v83 = self;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController vlfSessionTask](self, "vlfSessionTask"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "stateManager"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "allMonitors"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "allObjects"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "sortedArrayUsingComparator:", &stru_1011C0860));

  objc_msgSend(v5, "appendFormat:", CFSTR("\nState monitors:\n"));
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v58 = v57;
  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v88;
    do
    {
      for (j = 0; j != v60; j = (char *)j + 1)
      {
        if (*(_QWORD *)v88 != v61)
          objc_enumerationMutation(v58);
        v63 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)j);
        v64 = (unint64_t)objc_msgSend(v63, "state");
        v65 = CFSTR("?");
        if (v64 <= 2)
          v65 = off_1011C0898[v64];
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "debugDescription"));
        objc_msgSend(v5, "appendFormat:", CFSTR("%@ %@\n"), v65, v66);

      }
      v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
    }
    while (v60);
  }

  v67 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "platformController"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "chromeViewController"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "userLocationView"));
  objc_msgSend(v70, "_locationAccuracyInScreenPoints");
  objc_msgSend(v5, "appendFormat:", CFSTR("\nlocationAccuracyInScreenPoints: %f\n"), v71);

  v84 = 0;
  v85 = 0;
  v86 = 0;
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "platformController"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "chromeViewController"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "mapView"));
  v76 = v75;
  if (v75)
  {
    objc_msgSend(v75, "_userTrackingBehavior");
  }
  else
  {
    v84 = 0;
    v85 = 0;
    v86 = 0;
  }

  v77 = VKStringForAnnotationTrackingBehavior(&v84);
  v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
  objc_msgSend(v5, "appendFormat:", CFSTR("\nuserTrackingBehavior: %@\n"), v78);

  v79 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController debugInfoLabel](v83, "debugInfoLabel"));
  objc_msgSend(v79, "setText:", v5);

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
  v7 = sub_1006D956C;
  v8 = &unk_1011AE190;
  objc_copyWeak(&v9, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, &v5, 0.5));
  -[VLFSessionStateFloatingDebugViewController setDebugInfoRefreshTimer:](self, "setDebugInfoRefreshTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)showVLFDebugUIButtonTapped:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionStateFloatingDebugViewController vlfSessionTask](self, "vlfSessionTask", a3));
  objc_msgSend(v3, "showVLFUI");

  v4 = (id)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
  objc_msgSend(v4, "registerUserWasShownCallout");

}

- (id)additionalLongPressActions
{
  void *v2;
  void *v3;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;
  void *v11;

  objc_initWeak(&location, self);
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_1006D972C;
  v8 = &unk_1011AFA88;
  objc_copyWeak(&v9, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Show VLF UI"), 0, &v5));
  v11 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1, v5, v6, v7, v8));

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

- (UIButton)showVLFDebugUIButton
{
  return self->_showVLFDebugUIButton;
}

- (void)setShowVLFDebugUIButton:(id)a3
{
  objc_storeStrong((id *)&self->_showVLFDebugUIButton, a3);
}

- (UILabel)debugInfoLabel
{
  return self->_debugInfoLabel;
}

- (void)setDebugInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_debugInfoLabel, a3);
}

- (GCDTimer)debugInfoRefreshTimer
{
  return self->_debugInfoRefreshTimer;
}

- (void)setDebugInfoRefreshTimer:(id)a3
{
  objc_storeStrong((id *)&self->_debugInfoRefreshTimer, a3);
}

- (NSNumber)isConnectedToInternalAppleNetwork
{
  return self->_isConnectedToInternalAppleNetwork;
}

- (void)setIsConnectedToInternalAppleNetwork:(id)a3
{
  self->_isConnectedToInternalAppleNetwork = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfoRefreshTimer, 0);
  objc_storeStrong((id *)&self->_debugInfoLabel, 0);
  objc_storeStrong((id *)&self->_showVLFDebugUIButton, 0);
}

@end
