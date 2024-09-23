@implementation PedestrianARFloatingDebugViewController

+ (PedestrianARFloatingDebugViewController)sharedInstance
{
  if (qword_1014D40E0 != -1)
    dispatch_once(&qword_1014D40E0, &stru_1011E3DE0);
  return (PedestrianARFloatingDebugViewController *)(id)qword_1014D40D8;
}

- (PedestrianARFloatingDebugViewController)init
{
  PedestrianARFloatingDebugViewController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PedestrianARFloatingDebugViewController;
  v2 = -[MapsFloatingDebugViewController init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
    objc_msgSend(v3, "addAttachmentProvider:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[ARSession _removeObserver:](self->_session, "_removeObserver:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
  objc_msgSend(v3, "removeAttachmentProvider:", self);

  v4.receiver = self;
  v4.super_class = (Class)PedestrianARFloatingDebugViewController;
  -[PedestrianARFloatingDebugViewController dealloc](&v4, "dealloc");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UILabel *v7;
  void *v8;
  UILabel *debugLabel;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[4];

  v29.receiver = self;
  v29.super_class = (Class)PedestrianARFloatingDebugViewController;
  -[MapsFloatingDebugViewController viewDidLoad](&v29, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 7, 3, 35.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("arkit"), v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageWithRenderingMode:", 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailImageView](self, "thumbnailImageView"));
  objc_msgSend(v6, "setImage:", v5);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont monospacedSystemFontOfSize:weight:](UIFont, "monospacedSystemFontOfSize:weight:", 9.0, UIFontWeightRegular));
  -[UILabel setFont:](v7, "setFont:", v8);

  -[UILabel setNumberOfLines:](v7, "setNumberOfLines:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  debugLabel = self->_debugLabel;
  self->_debugLabel = v7;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  objc_msgSend(v10, "addSubview:", self->_debugLabel);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_debugLabel, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, 5.0));
  v30[0] = v24;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_debugLabel, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, -5.0));
  v30[1] = v20;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_debugLabel, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 5.0));
  v30[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_debugLabel, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -5.0));
  v30[3] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 4));
  objc_msgSend(v28, "addObjectsFromArray:", v19);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);
}

+ (BOOL)shouldAttachOnLaunch
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kPedestrianARFloatingDebugViewControllerAttachedKey"));

  return v3;
}

- (void)updateViewForCurrentState
{
  int64_t v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PedestrianARFloatingDebugViewController;
  -[MapsFloatingDebugViewController updateViewForCurrentState](&v6, "updateViewForCurrentState");
  v3 = -[MapsFloatingDebugViewController viewState](self, "viewState");
  if (v3 == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFloatingDebugViewController session](self, "session"));
    objc_msgSend(v5, "_addObserver:", self);

    -[PedestrianARFloatingDebugViewController updateDebugText](self, "updateDebugText");
    -[PedestrianARFloatingDebugViewController startDebugInfoRefreshTimer](self, "startDebugInfoRefreshTimer");
  }
  else if (!v3)
  {
    -[PedestrianARFloatingDebugViewController setDebugInfoRefreshTimer:](self, "setDebugInfoRefreshTimer:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFloatingDebugViewController session](self, "session"));
    objc_msgSend(v4, "_removeObserver:", self);

  }
}

- (id)tintColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor orangeColor](UIColor, "orangeColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorWithAlphaComponent:", 0.699999988));

  return v3;
}

- (id)iconText
{
  return CFSTR("Pedestrian AR");
}

- (void)attach
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PedestrianARFloatingDebugViewController;
  -[MapsFloatingDebugViewController attach](&v3, "attach");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("kPedestrianARFloatingDebugViewControllerAttachedKey"));

}

- (void)detach
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PedestrianARFloatingDebugViewController;
  -[MapsFloatingDebugViewController detach](&v3, "detach");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "setBool:forKey:", 0, CFSTR("kPedestrianARFloatingDebugViewControllerAttachedKey"));

}

- (void)setSession:(id)a3
{
  ARSession *v5;
  ARSession *session;
  ARSession *v7;

  v5 = (ARSession *)a3;
  session = self->_session;
  v7 = v5;
  if (session != v5)
  {
    -[ARSession _removeObserver:](session, "_removeObserver:", self);
    objc_storeStrong((id *)&self->_session, a3);
    if (-[MapsFloatingDebugViewController isAttached](self, "isAttached"))
    {
      if ((id)-[MapsFloatingDebugViewController viewState](self, "viewState") == (id)1)
        -[ARSession _addObserver:](self->_session, "_addObserver:", self);
    }
  }

}

- (void)composeTTR
{
  id v3;
  NSObject *v4;
  _QWORD *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[5];
  uint8_t buf[4];
  PedestrianARFloatingDebugViewController *v41;

  v3 = sub_100B4F578();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v41 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Will compose TTR", buf, 0xCu);
  }

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100B4F5B8;
  v39[3] = &unk_1011E3E08;
  v39[4] = self;
  v5 = objc_retainBlock(v39);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("What happened?"), 0, 0));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100B4F87C;
  v37[3] = &unk_1011AD960;
  v7 = v5;
  v38 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Missing AR element"), 0, v37));
  objc_msgSend(v6, "addAction:", v8);

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100B4F8D4;
  v35[3] = &unk_1011AD960;
  v9 = v7;
  v36 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Wrong AR placement"), 0, v35));
  objc_msgSend(v6, "addAction:", v10);

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100B4F92C;
  v33[3] = &unk_1011AD960;
  v11 = v9;
  v34 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Wrong instruction text"), 0, v33));
  objc_msgSend(v6, "addAction:", v12);

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100B4F984;
  v31[3] = &unk_1011AD960;
  v13 = v11;
  v32 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Failed to localize"), 0, v31));
  objc_msgSend(v6, "addAction:", v14);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100B4F9DC;
  v29[3] = &unk_1011AD960;
  v15 = v13;
  v30 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Slow to localize"), 0, v29));
  objc_msgSend(v6, "addAction:", v16);

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100B4FA34;
  v27[3] = &unk_1011AD960;
  v17 = v15;
  v28 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Performance"), 0, v27));
  objc_msgSend(v6, "addAction:", v18);

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100B4FA8C;
  v25[3] = &unk_1011AD960;
  v26 = v17;
  v19 = v17;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Something else"), 0, v25));
  objc_msgSend(v6, "addAction:", v20);

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100B4FAE4;
  v24[3] = &unk_1011AD938;
  v24[4] = self;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Nevermind"), 1, v24));
  objc_msgSend(v6, "addAction:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "chromeViewController"));
  objc_msgSend(v23, "_maps_topMostPresentViewController:animated:completion:", v6, 1, 0);

}

- (id)platformController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "platformController"));

  return v3;
}

- (PedestrianARSessionTask)pedestrianARSessionTask
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFloatingDebugViewController platformController](self, "platformController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "auxiliaryTasksManager"));
  v4 = objc_msgSend(v3, "auxilaryTaskForClass:", objc_opt_class(PedestrianARSessionTask));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return (PedestrianARSessionTask *)v5;
}

- (id)debugText
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  _UNKNOWN **v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  PedestrianARFloatingDebugViewController *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  Class *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  char isKindOfClass;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  uint64_t v71;
  void *i;
  id v73;
  void *v74;
  id v75;
  PedestrianARFloatingDebugViewController *v76;
  void *v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  double v84;
  void *v85;
  id v86;
  void *v87;
  __int128 v88;
  id v89;
  void *v90;
  id v91;
  void *v92;
  id v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  id v103;
  id v104;
  void *v105;
  uint64_t v106;
  void *v107;
  id v108;
  id v109;
  void *v110;
  void *v111;
  unsigned int v112;
  const __CFString *v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  id v123;
  id v124;
  id v125;
  uint64_t v126;
  void *j;
  void *v128;
  id v129;
  void *v130;
  unsigned int v131;
  __CFString *v132;
  __CFString *v133;
  void *v134;
  void *v135;
  id v136;
  __int128 v138;
  id v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  _BYTE v149[128];
  _BYTE v150[128];
  _QWORD v151[2];
  _QWORD v152[2];
  _QWORD v153[2];
  _QWORD v154[2];

  if (qword_1014D40E8 != -1)
    dispatch_once(&qword_1014D40E8, &stru_1011E3E28);
  v153[0] = NSForegroundColorAttributeName;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cyanColor](UIColor, "cyanColor"));
  v154[0] = v2;
  v153[1] = NSFontAttributeName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
  v154[1] = v3;
  v4 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v154, v153, 2));

  v5 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", &stru_1011EB268, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = objc_alloc((Class)NSAttributedString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D40F0, "stringFromDate:", v6));
  v9 = objc_msgSend(v7, "initWithString:attributes:", v8, v4);
  objc_msgSend(v5, "appendAttributedString:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFloatingDebugViewController platformController](self, "platformController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "chromeViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topContext"));

  v13 = objc_opt_class(PedestrianARContext);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    v14 = v12;
  else
    v14 = 0;
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fullscreenViewController"));
  v17 = objc_opt_class(PedestrianARViewController);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
    v18 = v16;
  else
    v18 = 0;
  v19 = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mapView"));
  v21 = MKPlaceCollectionsLogicController_ptr;
  if (v20)
    goto LABEL_11;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFloatingDebugViewController platformController](self, "platformController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "auxiliaryTasksManager"));
  v24 = objc_msgSend(v23, "auxilaryTaskForClass:", objc_opt_class(PedestrianARDebugMapAnnotationsTask));
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "mapView"));
  if (v20)
  {
LABEL_11:
    v151[0] = NSForegroundColorAttributeName;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cyanColor](UIColor, "cyanColor"));
    v151[1] = NSFontAttributeName;
    v152[0] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
    v152[1] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v152, v151, 2));

    v29 = objc_alloc((Class)NSAttributedString);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "arWalkingDebugOutput"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\nVKMapView:\n%@"), v30));
    v32 = objc_msgSend(v29, "initWithString:attributes:", v31, v28);
    objc_msgSend(v5, "appendAttributedString:", v32);

  }
  v33 = objc_alloc((Class)NSAttributedString);
  v34 = objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend((id)v34, "distanceUntilManeuver");
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\nDistance to end of current maneuver: %f"), v35));
  v37 = objc_msgSend(v33, "initWithString:attributes:", v36, v4);
  objc_msgSend(v5, "appendAttributedString:", v37);

  v38 = self;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFloatingDebugViewController session](self, "session"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "configuration"));
  v41 = objc_opt_class(ARRecordingConfiguration);
  LOBYTE(v34) = objc_opt_isKindOfClass(v40, v41);

  v42 = (Class *)MKPlaceCollectionsLogicController_ptr;
  if ((v34 & 1) != 0)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFloatingDebugViewController session](self, "session"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "configuration"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "fileURL"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "path"));

    v47 = objc_alloc((Class)NSAttributedString);
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\nAR Recording: %@"), v46));
    v49 = objc_msgSend(v47, "initWithString:attributes:", v48, v4);
    objc_msgSend(v5, "appendAttributedString:", v49);

  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFloatingDebugViewController session](self, "session"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "configuration"));
  v52 = objc_opt_class(ARReplayConfiguration);
  isKindOfClass = objc_opt_isKindOfClass(v51, v52);

  if ((isKindOfClass & 1) != 0)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFloatingDebugViewController session](self, "session"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "configuration"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "fileURL"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "path"));

    v58 = objc_alloc((Class)NSAttributedString);
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\nAR Replay: %@"), v57));
    v60 = objc_msgSend(v58, "initWithString:attributes:", v59, v4);
    objc_msgSend(v5, "appendAttributedString:", v60);

  }
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[MapsARSessionManager sharedManager](MapsARSessionManager, "sharedManager"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "currentSessionOwner"));

  v63 = objc_alloc((Class)NSAttributedString);
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\nCurrent session owner: %@\n"), v62));
  v65 = objc_msgSend(v63, "initWithString:attributes:", v64, v4);
  objc_msgSend(v5, "appendAttributedString:", v65);

  v66 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR("\nAll session owners:\n"), v4);
  v140 = v5;
  objc_msgSend(v5, "appendAttributedString:", v66);

  v147 = 0u;
  v148 = 0u;
  v145 = 0u;
  v146 = 0u;
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[MapsARSessionManager sharedManager](MapsARSessionManager, "sharedManager"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "allSessionOwners"));

  v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v145, v150, 16);
  if (v69)
  {
    v70 = v69;
    v71 = *(_QWORD *)v146;
    do
    {
      for (i = 0; i != v70; i = (char *)i + 1)
      {
        if (*(_QWORD *)v146 != v71)
          objc_enumerationMutation(v68);
        v38 = *(PedestrianARFloatingDebugViewController **)(*((_QWORD *)&v145 + 1) + 8 * (_QWORD)i);
        v73 = objc_alloc((Class)NSAttributedString);
        v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n"), v38));
        v75 = objc_msgSend(v73, "initWithString:attributes:", v74, v4);
        objc_msgSend(v140, "appendAttributedString:", v75);

        v42 = (Class *)MKPlaceCollectionsLogicController_ptr;
        v21 = MKPlaceCollectionsLogicController_ptr;
      }
      v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v145, v150, 16);
    }
    while (v70);
  }

  v76 = self;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFloatingDebugViewController session](self, "session"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "currentFrame"));

  if (v78)
  {
    v79 = objc_alloc((Class)NSAttributedString);
    objc_msgSend(v78, "heading");
    v81 = v80;
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "heading"));
    if (v83)
    {
      v42 = (Class *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      v38 = (PedestrianARFloatingDebugViewController *)objc_claimAutoreleasedReturnValue(-[Class heading](v42, "heading"));
      -[PedestrianARFloatingDebugViewController trueHeading](v38, "trueHeading");
    }
    else
    {
      v84 = -1.0;
    }
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\nHeading: ARKit %0.0f, CL %0.0f"), v81, *(_QWORD *)&v84));
    v86 = objc_msgSend(v79, "initWithString:attributes:", v85, v4);
    objc_msgSend(v140, "appendAttributedString:", v86);

    if (v83)
    {

    }
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "camera"));
    objc_msgSend(v87, "transform");
    v138 = v88;

    v42 = (Class *)MKPlaceCollectionsLogicController_ptr;
    v89 = objc_alloc((Class)NSAttributedString);
    v21 = MKPlaceCollectionsLogicController_ptr;
    v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\nAR Pos(%.3f, %.3f, %.3f)"), *(float *)&v138, *((float *)&v138 + 1), *((float *)&v138 + 2)));
    v91 = objc_msgSend(v89, "initWithString:attributes:", v90, v4);
    objc_msgSend(v140, "appendAttributedString:", v91);

    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "location"));
    if (v92)
    {
      v93 = objc_alloc((Class)NSAttributedString);
      v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "location"));
      objc_msgSend(v94, "coordinate");
      v96 = v95;
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "location"));
      objc_msgSend(v97, "coordinate");
      v99 = v98;
      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "location"));
      objc_msgSend(v100, "altitude");
      v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("; Coord(%.6f, %.6f, %.6f)"),
                         v96,
                         v99,
                         v101));
      v103 = objc_msgSend(v93, "initWithString:attributes:", v102, v4);
      objc_msgSend(v140, "appendAttributedString:", v103);

      v42 = (Class *)MKPlaceCollectionsLogicController_ptr;
      v21 = MKPlaceCollectionsLogicController_ptr;

    }
    v104 = objc_alloc((Class)NSAttributedString);
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "vlState"));
    objc_msgSend(v105, "timeSinceLastLocalization");
    v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\nlast VL localization: %f"), v106));
    v108 = objc_msgSend(v104, "initWithString:attributes:", v107, v4);
    objc_msgSend(v140, "appendAttributedString:", v108);

    v76 = self;
  }

  v109 = objc_alloc((Class)NSAttributedString);
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFloatingDebugViewController pedestrianARSessionTask](v76, "pedestrianARSessionTask"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "stateManager"));
  v112 = objc_msgSend(v111, "shouldShowPedestrianAR");
  v113 = CFSTR("🔴");
  if (v112)
    v113 = CFSTR("🟢");
  v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\nCurrent UI state: \n%@\n"), v113));
  v115 = objc_msgSend(v109, "initWithString:attributes:", v114, v4);
  objc_msgSend(v140, "appendAttributedString:", v115);

  v116 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFloatingDebugViewController pedestrianARSessionTask](v76, "pedestrianARSessionTask"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "stateManager"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "allMonitors"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "allObjects"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "sortedArrayUsingComparator:", &stru_1011E3E48));

  v121 = (void *)v4;
  v122 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR("\nState monitors:\n"), v4);
  objc_msgSend(v140, "appendAttributedString:", v122);

  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  v123 = v120;
  v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v141, v149, 16);
  if (v124)
  {
    v125 = v124;
    v126 = *(_QWORD *)v142;
    do
    {
      for (j = 0; j != v125; j = (char *)j + 1)
      {
        if (*(_QWORD *)v142 != v126)
          objc_enumerationMutation(v123);
        v128 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * (_QWORD)j);
        v129 = objc_alloc(v42[305]);
        v130 = v21[390];
        v131 = objc_msgSend(v128, "shouldShowPedestrianAR");
        v132 = CFSTR("🔴");
        if (v131)
          v132 = CFSTR("🟢");
        v133 = v132;
        v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "debugDescription"));
        v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "stringWithFormat:", CFSTR("%@ %@\n"), v133, v134));

        v21 = MKPlaceCollectionsLogicController_ptr;
        v136 = objc_msgSend(v129, "initWithString:attributes:", v135, v121);
        objc_msgSend(v140, "appendAttributedString:", v136);

        v42 = (Class *)MKPlaceCollectionsLogicController_ptr;
      }
      v125 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v141, v149, 16);
    }
    while (v125);
  }

  return v140;
}

- (void)updateDebugText
{
  const char *label;
  const char *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v14 = 136316418;
        v15 = "-[PedestrianARFloatingDebugViewController updateDebugText]";
        v16 = 2080;
        v17 = "PedestrianARFloatingDebugViewController.m";
        v18 = 1024;
        v19 = 373;
        v20 = 2080;
        v21 = "dispatch_get_main_queue()";
        v22 = 2080;
        v23 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v24 = 2080;
        v25 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v14,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v11 = sub_1004318FC();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v14 = 138412290;
          v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);

        }
      }
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFloatingDebugViewController view](self, "view"));
  objc_msgSend(v6, "setHidden:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFloatingDebugViewController debugText](self, "debugText"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARFloatingDebugViewController debugLabel](self, "debugLabel"));
  objc_msgSend(v8, "setAttributedText:", v7);

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
  v7 = sub_100B50C74;
  v8 = &unk_1011AE190;
  objc_copyWeak(&v9, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, &v5, 0.5));
  -[PedestrianARFloatingDebugViewController setDebugInfoRefreshTimer:](self, "setDebugInfoRefreshTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
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
  v7 = sub_100B50DE4;
  v8 = &unk_1011AFA88;
  objc_copyWeak(&v9, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("File a radar"), 0, &v5));
  v11 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1, v5, v6, v7, v8));

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100B50E9C;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)generateAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B50F70;
  block[3] = &unk_1011AECC0;
  block[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (ARSession)session
{
  return self->_session;
}

- (UILabel)debugLabel
{
  return self->_debugLabel;
}

- (void)setDebugLabel:(id)a3
{
  objc_storeStrong((id *)&self->_debugLabel, a3);
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
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
