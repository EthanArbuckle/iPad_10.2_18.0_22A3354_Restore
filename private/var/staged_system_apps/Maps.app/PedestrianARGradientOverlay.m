@implementation PedestrianARGradientOverlay

- (PedestrianARGradientOverlay)initWithConfiguration:(id)a3
{
  char *v4;
  double y;
  double width;
  double height;
  PedestrianARGradientOverlay *v8;
  NSObject *v9;
  PedestrianARGradientOverlayConfiguration *v10;
  PedestrianARGradientOverlayConfiguration *configuration;
  GradientView *v12;
  GradientView *localizingGradientView;
  void *v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  GradientView *v35;
  GradientView *runningGradientView;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
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
  id v57;
  NSObject *v58;
  id v59;
  NSObject *v60;
  char *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  char *v96;
  objc_super v97;
  _QWORD v98[4];
  _QWORD v99[10];
  _QWORD v100[4];
  _QWORD v101[10];
  uint8_t buf[4];
  const char *v103;
  __int16 v104;
  const char *v105;
  __int16 v106;
  int v107;
  __int16 v108;
  const char *v109;

  v4 = (char *)a3;
  if (!v4)
  {
    v57 = sub_1004318FC();
    v58 = objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v103 = "-[PedestrianARGradientOverlay initWithConfiguration:]";
      v104 = 2080;
      v105 = "PedestrianARGradientOverlay.m";
      v106 = 1024;
      v107 = 34;
      v108 = 2080;
      v109 = "configuration != nil";
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v59 = sub_1004318FC();
      v60 = objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        v61 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v103 = v61;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v97.receiver = self;
  v97.super_class = (Class)PedestrianARGradientOverlay;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = -[PedestrianARGradientOverlay initWithFrame:](&v97, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v8)
  {
    if (qword_1014D29F0 != -1)
      dispatch_once(&qword_1014D29F0, &stru_1011BC928);
    v9 = qword_1014D29E8;
    if (os_log_type_enabled((os_log_t)qword_1014D29E8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v103 = (const char *)v8;
      v104 = 2112;
      v105 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Initializing with configuration: %@", buf, 0x16u);
    }
    v10 = (PedestrianARGradientOverlayConfiguration *)objc_msgSend(v4, "copy");
    configuration = v8->_configuration;
    v8->_configuration = v10;

    v12 = -[GradientView initWithFrame:]([GradientView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    localizingGradientView = v8->_localizingGradientView;
    v8->_localizingGradientView = v12;

    -[GradientView setTranslatesAutoresizingMaskIntoConstraints:](v8->_localizingGradientView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView layer](v8->_localizingGradientView, "layer"));
    LODWORD(v15) = 0;
    objc_msgSend(v14, "setOpacity:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView gradientLayer](v8->_localizingGradientView, "gradientLayer"));
    objc_msgSend(v16, "setLocations:", &off_101273848);

    v92 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v88 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "colorWithAlphaComponent:", 0.0)));
    v101[0] = objc_msgSend(v88, "CGColor");
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v80 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "colorWithAlphaComponent:", 0.0120027435)));
    v101[1] = objc_msgSend(v80, "CGColor");
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v76 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "colorWithAlphaComponent:", 0.044170096)));
    v101[2] = objc_msgSend(v76, "CGColor");
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v72 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "colorWithAlphaComponent:", 0.0907407408)));
    v101[3] = objc_msgSend(v72, "CGColor");
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v68 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "colorWithAlphaComponent:", 0.145953361)));
    v101[4] = objc_msgSend(v68, "CGColor");
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "colorWithAlphaComponent:", 0.204046639)));
    v101[5] = objc_msgSend(v64, "CGColor");
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "colorWithAlphaComponent:", 0.259259259)));
    v101[6] = objc_msgSend(v17, "CGColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "colorWithAlphaComponent:", 0.305829904)));
    v101[7] = objc_msgSend(v19, "CGColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "colorWithAlphaComponent:", 0.337997257)));
    v101[8] = objc_msgSend(v21, "CGColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "colorWithAlphaComponent:", 0.35)));
    v101[9] = objc_msgSend(v23, "CGColor");
    v96 = v4;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v101, 10));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView gradientLayer](v8->_localizingGradientView, "gradientLayer"));
    objc_msgSend(v25, "setColors:", v24);

    -[PedestrianARGradientOverlay addSubview:](v8, "addSubview:", v8->_localizingGradientView);
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView leadingAnchor](v8->_localizingGradientView, "leadingAnchor"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay leadingAnchor](v8, "leadingAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:", v89));
    v100[0] = v85;
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView trailingAnchor](v8->_localizingGradientView, "trailingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay trailingAnchor](v8, "trailingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:", v26));
    v100[1] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView topAnchor](v8->_localizingGradientView, "topAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay topAnchor](v8, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
    v100[2] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView bottomAnchor](v8->_localizingGradientView, "bottomAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay bottomAnchor](v8, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
    v100[3] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v100, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);

    v35 = -[GradientView initWithFrame:]([GradientView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    runningGradientView = v8->_runningGradientView;
    v8->_runningGradientView = v35;

    -[GradientView setTranslatesAutoresizingMaskIntoConstraints:](v8->_runningGradientView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView gradientLayer](v8->_runningGradientView, "gradientLayer"));
    objc_msgSend(v37, "setLocations:", &off_101273860);

    v94 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v90 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "colorWithAlphaComponent:", 0.0)));
    v99[0] = objc_msgSend(v90, "CGColor");
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v82 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "colorWithAlphaComponent:", 0.0257201646)));
    v99[1] = objc_msgSend(v82, "CGColor");
    v79 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v77 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "colorWithAlphaComponent:", 0.0946502057)));
    v99[2] = objc_msgSend(v77, "CGColor");
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "colorWithAlphaComponent:", 0.194444444)));
    v99[3] = objc_msgSend(v73, "CGColor");
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "colorWithAlphaComponent:", 0.312757202)));
    v99[4] = objc_msgSend(v69, "CGColor");
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "colorWithAlphaComponent:", 0.437242798)));
    v99[5] = objc_msgSend(v65, "CGColor");
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "colorWithAlphaComponent:", 0.555555556)));
    v99[6] = objc_msgSend(v38, "CGColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "colorWithAlphaComponent:", 0.655349794)));
    v99[7] = objc_msgSend(v40, "CGColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "colorWithAlphaComponent:", 0.724279835)));
    v99[8] = objc_msgSend(v42, "CGColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "colorWithAlphaComponent:", 0.75)));
    v99[9] = objc_msgSend(v44, "CGColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v99, 10));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView gradientLayer](v8->_runningGradientView, "gradientLayer"));
    objc_msgSend(v46, "setColors:", v45);

    -[PedestrianARGradientOverlay addSubview:](v8, "addSubview:", v8->_runningGradientView);
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView leadingAnchor](v8->_runningGradientView, "leadingAnchor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay leadingAnchor](v8, "leadingAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "constraintEqualToAnchor:", v91));
    v98[0] = v87;
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView trailingAnchor](v8->_runningGradientView, "trailingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay trailingAnchor](v8, "trailingAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:", v47));
    v98[1] = v48;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView topAnchor](v8->_runningGradientView, "topAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay topAnchor](v8, "topAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v50));
    v98[2] = v51;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView bottomAnchor](v8->_runningGradientView, "bottomAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay bottomAnchor](v8, "bottomAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v53));
    v98[3] = v54;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v98, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v55);

    v4 = v96;
  }

  return v8;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PedestrianARGradientOverlay;
  -[PedestrianARGradientOverlay layoutSubviews](&v3, "layoutSubviews");
  -[PedestrianARGradientOverlay _updateGradient](self, "_updateGradient");
}

- (void)setState:(int64_t)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  id v26;
  _QWORD v27[5];
  _QWORD v28[5];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;

  if (self->_state != a3)
  {
    self->_state = a3;
    switch(a3)
    {
      case 0:
        v4 = sub_1004318FC();
        v5 = objc_claimAutoreleasedReturnValue(v4);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v30 = "-[PedestrianARGradientOverlay setState:]";
          v31 = 2080;
          v32 = "PedestrianARGradientOverlay.m";
          v33 = 1024;
          v34 = 163;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
        }

        if (sub_100A70734())
        {
          v6 = sub_1004318FC();
          v7 = objc_claimAutoreleasedReturnValue(v6);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            v8 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            v30 = v8;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }
        break;
      case 1:
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
        -[PedestrianARGradientOverlay setBackgroundColor:](self, "setBackgroundColor:", v9);

        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay runningGradientView](self, "runningGradientView"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
        LODWORD(v12) = 1.0;
        objc_msgSend(v11, "setOpacity:", v12);

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay localizingGradientView](self, "localizingGradientView"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
        LODWORD(v15) = 0;
        objc_msgSend(v14, "setOpacity:", v15);

        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_1005B9730;
        v28[3] = &unk_1011AC860;
        v28[4] = self;
        v16 = 0.3;
        v17 = v28;
        v18 = 0x10000;
        goto LABEL_11;
      case 2:
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
        -[PedestrianARGradientOverlay setBackgroundColor:](self, "setBackgroundColor:", v19);

        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_1005B97B4;
        v27[3] = &unk_1011AC860;
        v27[4] = self;
        v16 = 0.75;
        v17 = v27;
        v18 = 0x20000;
LABEL_11:
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v18, v17, 0, v16, 0.0);
        break;
      case 3:
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.6));
        -[PedestrianARGradientOverlay setBackgroundColor:](self, "setBackgroundColor:", v20);

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay runningGradientView](self, "runningGradientView"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layer"));
        LODWORD(v23) = 0;
        objc_msgSend(v22, "setOpacity:", v23);

        v26 = (id)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay localizingGradientView](self, "localizingGradientView"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "layer"));
        LODWORD(v25) = 1.0;
        objc_msgSend(v24, "setOpacity:", v25);

        break;
      default:
        return;
    }
  }
}

- (void)_updateGradient
{
  double Width;
  double Height;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  GradientView **p_runningGradientView;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  id v47;
  CGRect v48;
  CGRect v49;

  -[PedestrianARGradientOverlay frame](self, "frame");
  Width = CGRectGetWidth(v48);
  -[PedestrianARGradientOverlay frame](self, "frame");
  Height = CGRectGetHeight(v49);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay configuration](self, "configuration"));
  v6 = v5;
  if (Width <= Height)
  {
    objc_msgSend(v5, "portraitStartPoint");
    v28 = v27;
    v30 = v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView gradientLayer](self->_localizingGradientView, "gradientLayer"));
    objc_msgSend(v31, "setStartPoint:", v28, v30);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay configuration](self, "configuration"));
    objc_msgSend(v32, "portraitEndPoint");
    v34 = v33;
    v36 = v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView gradientLayer](self->_localizingGradientView, "gradientLayer"));
    objc_msgSend(v37, "setEndPoint:", v34, v36);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay configuration](self, "configuration"));
    objc_msgSend(v38, "portraitStartPoint");
    v40 = v39;
    v42 = v41;
    p_runningGradientView = &self->_runningGradientView;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView gradientLayer](self->_runningGradientView, "gradientLayer"));
    objc_msgSend(v43, "setStartPoint:", v40, v42);

    v47 = (id)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay configuration](self, "configuration"));
    objc_msgSend(v47, "portraitEndPoint");
  }
  else
  {
    objc_msgSend(v5, "landscapeStartPoint");
    v8 = v7;
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView gradientLayer](self->_localizingGradientView, "gradientLayer"));
    objc_msgSend(v11, "setStartPoint:", v8, v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay configuration](self, "configuration"));
    objc_msgSend(v12, "landscapeEndPoint");
    v14 = v13;
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView gradientLayer](self->_localizingGradientView, "gradientLayer"));
    objc_msgSend(v17, "setEndPoint:", v14, v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay configuration](self, "configuration"));
    objc_msgSend(v18, "landscapeStartPoint");
    v20 = v19;
    v22 = v21;
    p_runningGradientView = &self->_runningGradientView;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView gradientLayer](self->_runningGradientView, "gradientLayer"));
    objc_msgSend(v24, "setStartPoint:", v20, v22);

    v47 = (id)objc_claimAutoreleasedReturnValue(-[PedestrianARGradientOverlay configuration](self, "configuration"));
    objc_msgSend(v47, "landscapeEndPoint");
  }
  v44 = v25;
  v45 = v26;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[GradientView gradientLayer](*p_runningGradientView, "gradientLayer"));
  objc_msgSend(v46, "setEndPoint:", v44, v45);

}

- (int64_t)state
{
  return self->_state;
}

- (PedestrianARGradientOverlayConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (GradientView)localizingGradientView
{
  return self->_localizingGradientView;
}

- (void)setLocalizingGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_localizingGradientView, a3);
}

- (GradientView)runningGradientView
{
  return self->_runningGradientView;
}

- (void)setRunningGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_runningGradientView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningGradientView, 0);
  objc_storeStrong((id *)&self->_localizingGradientView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
