@implementation BKRestorationScrimView

- (BKRestorationScrimView)initWithAssetID:(id)a3 window:(id)a4
{
  id v6;
  id v7;
  BKRestorationScrimView *v8;
  void *v9;
  BKRestorationScrimView *v10;
  id v11;
  unsigned int v12;
  BKRestorationScrimView *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NSObject *v34;
  uint64_t v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  unsigned __int8 v44;
  void *v45;
  unsigned __int8 v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v58;
  BKRestorationScrimView *v59;
  objc_super v60;
  _QWORD v61[2];
  uint8_t buf[4];
  double v63;
  __int16 v64;
  double v65;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "bounds");
  v60.receiver = self;
  v60.super_class = (Class)BKRestorationScrimView;
  v8 = -[BKRestorationScrimView initWithFrame:](&v60, "initWithFrame:");
  objc_storeWeak((id *)&v8->_window, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v8->_observationToken = (unint64_t)objc_msgSend(v9, "_addObserver:selector:name:object:options:", v8, "_contentDidFinishRestoring:", CFSTR("BKBookReaderContentLayoutFinished"), 0, 2048);

  v10 = v8;
  -[BKRestorationScrimView setAutoresizingMask:](v10, "setAutoresizingMask:", 18);
  v11 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[BEPageSnapshotCache restorationImageAssetID](BEPageSnapshotCache, "restorationImageAssetID"));
  v12 = objc_msgSend(v58, "isEqualToString:", v7);

  v13 = v10;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BEPageSnapshotCache restorationImageURL](BEPageSnapshotCache, "restorationImageURL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v14));

    v13 = v10;
    if (v15)
    {
      v16 = +[BEPageSnapshotCache restorationImageAppearance](BEPageSnapshotCache, "restorationImageAppearance");
      v17 = 1;
      switch((unint64_t)v16)
      {
        case 0uLL:
          goto LABEL_5;
        case 1uLL:
          v17 = 2;
LABEL_5:
          objc_msgSend(v11, "setOverrideUserInterfaceStyle:", v17);
          goto LABEL_6;
        case 2uLL:
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollection", 1));
          v40 = objc_msgSend(v39, "userInterfaceStyle");

          if (v40 != (id)1)
            goto LABEL_18;
          goto LABEL_6;
        case 3uLL:
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollection", 1));
          v42 = objc_msgSend(v41, "userInterfaceStyle");

          if (v42 != (id)2)
            goto LABEL_18;
          goto LABEL_6;
        case 4uLL:
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[BCLightLevelController sharedInstance](BCLightLevelController, "sharedInstance", 1));
          v44 = objc_msgSend(v43, "isLowLight");

          if ((v44 & 1) != 0)
            goto LABEL_18;
          goto LABEL_6;
        case 5uLL:
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[BCLightLevelController sharedInstance](BCLightLevelController, "sharedInstance", 1));
          v46 = objc_msgSend(v45, "isLowLight");

          if ((v46 & 1) == 0)
            goto LABEL_18;
LABEL_6:
          v18 = objc_msgSend(objc_alloc((Class)UIImage), "initWithData:", v15);
          v19 = v18;
          if (!v18)
          {
            v35 = BCSceneLog(0);
            v34 = objc_claimAutoreleasedReturnValue(v35);
            if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              goto LABEL_24;
            *(_WORD *)buf = 0;
            v36 = "Could not load snapshot image";
            v37 = v34;
            v38 = 2;
            goto LABEL_23;
          }
          -[NSObject size](v18, "size");
          v21 = v20;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screen"));
          objc_msgSend(v22, "scale");
          v24 = v21 / v23;

          v25 = objc_msgSend(v6, "bounds");
          v30 = v29;
          if (v24 == v29)
          {
            v31 = v26;
            v32 = v27;
            v33 = v28;
            v34 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v19);
            -[NSObject setAutoresizingMask:](v34, "setAutoresizingMask:", -[BKRestorationScrimView autoresizingMask](v10, "autoresizingMask"));
            -[NSObject setFrame:](v34, "setFrame:", v31, v32, v30, v33);
            -[BKRestorationScrimView addSubview:](v10, "addSubview:", v34);
            v13 = 0;
            goto LABEL_25;
          }
          v48 = BCSceneLog(v25);
          v34 = objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            v63 = v24;
            v64 = 2048;
            v65 = v30;
            v36 = "Snapshot image size mismatch. Found width: %f but wanted %f";
            v37 = v34;
            v38 = 22;
LABEL_23:
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
          }
LABEL_24:
          v13 = v10;
LABEL_25:

LABEL_26:
          break;
        default:
LABEL_18:
          v47 = BCSceneLog(v16);
          v19 = objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Cannot use image, appearance mismatch.", buf, 2u);
          }
          v13 = v10;
          goto LABEL_26;
      }
    }

  }
  -[BKRestorationScrimView addSubview:](v10, "addSubview:", v11);
  -[BKRestorationScrimView _setupMaskView:spinner:](v10, "_setupMaskView:spinner:", v13, v11);
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerXAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[BKRestorationScrimView centerXAnchor](v10, "centerXAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v50));
  v61[0] = v51;
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerYAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[BKRestorationScrimView centerYAnchor](v10, "centerYAnchor"));
  v59 = v10;
  v54 = v6;
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v53));
  v61[1] = v55;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v61, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v56);

  objc_msgSend(v11, "startAnimating");
  return v59;
}

- (void)show
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_window);
  objc_msgSend(WeakRetained, "addSubview:", self);

}

- (void)removeEventually
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = dispatch_time(0, 3000000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000822D4;
  v3[3] = &unk_1008E74C8;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)removeAnimated
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  if (!self->_removed)
  {
    self->_removed = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "_removeObserver:", self->_observationToken);

    v4[4] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000823CC;
    v5[3] = &unk_1008E72C0;
    v5[4] = self;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000823D8;
    v4[3] = &unk_1008E77C8;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v5, v4, 0.2);
  }
}

- (UIWindow)window
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_window);
}

- (void)setWindow:(id)a3
{
  objc_storeWeak((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_window);
}

- (void)_setupMaskView:(id)a3 spinner:(id)a4
{
  id v7;
  id v8;
  BKRestorationScrimView *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_10058CA60(a3, v8);

}

@end
