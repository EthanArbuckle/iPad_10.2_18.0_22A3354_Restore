@implementation MapsPopupMessageView

- (MapsPopupMessageView)initWithMessage:(id)a3 timeout:(double)a4 timeoutHandler:(id)a5
{
  MapsPopupMessageView *v8;
  NSString *v9;
  NSString *message;
  id v11;
  id timeoutHandler;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  id v21;
  NSBundle *v22;
  void *v23;
  CALayerCornerCurve v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  CALayer *materialLayer;
  void *v32;
  UIView *v33;
  UIView *backgroundView;
  void *v35;
  CALayer *v36;
  CALayer *borderLayer;
  void *v38;
  UILabel *v39;
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
  id v50;
  void *v51;
  id v52;
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
  id v73;
  id v74;
  id obj;
  objc_super v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD v83[9];
  _BYTE buf[24];
  void *v85;
  uint64_t *v86;

  v74 = a3;
  v73 = a5;
  v76.receiver = self;
  v76.super_class = (Class)MapsPopupMessageView;
  v8 = -[MapsPopupMessageView initWithFrame:](&v76, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v74, "copy");
    message = v8->_message;
    v8->_message = v9;

    v8->_timeout = a4;
    v11 = objc_msgSend(v73, "copy");
    timeoutHandler = v8->_timeoutHandler;
    v8->_timeoutHandler = v11;

    -[MapsPopupMessageView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
    v14 = objc_msgSend(v13, "CGColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView layer](v8, "layer"));
    objc_msgSend(v15, "setShadowColor:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView layer](v8, "layer"));
    objc_msgSend(v16, "setShadowOffset:", 0.0, 2.0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView layer](v8, "layer"));
    objc_msgSend(v17, "setShadowRadius:", 8.0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView layer](v8, "layer"));
    LODWORD(v19) = *(_DWORD *)"\nף=";
    objc_msgSend(v18, "setShadowOpacity:", v19);

    v77 = 0;
    v78 = &v77;
    v79 = 0x2050000000;
    v20 = (void *)qword_1014D2000;
    v80 = qword_1014D2000;
    if (!qword_1014D2000)
    {
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_1002C33A8;
      v85 = &unk_1011AFF60;
      v86 = &v77;
      sub_1002C33A8((uint64_t)buf);
      v20 = (void *)v78[3];
    }
    v21 = objc_retainAutorelease(v20);
    _Block_object_dispose(&v77, 8);
    obj = (id)objc_opt_new(v21);
    if (obj)
    {
      v22 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v8));
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      objc_msgSend(obj, "setRecipeName:fromBundle:", CFSTR("coaching-material"), v23);

      objc_msgSend(obj, "setWeighting:", 1.0);
      v24 = kCACornerCurveContinuous;
      objc_msgSend(obj, "setCornerCurve:", kCACornerCurveContinuous);
      objc_storeStrong((id *)&v8->_materialLayer, obj);
    }
    else
    {
      v25 = sub_1004318FC();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[MapsPopupMessageView initWithMessage:timeout:timeoutHandler:]";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "MapsPopupMessageView.m";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v85) = 67;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
      }

      if (sub_100A70734())
      {
        v27 = sub_1004318FC();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
      v30 = objc_opt_new(CABackdropLayer);
      materialLayer = v8->_materialLayer;
      v8->_materialLayer = (CALayer *)v30;

      v24 = kCACornerCurveContinuous;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView layer](v8, "layer"));
    objc_msgSend(v32, "addSublayer:", v8->_materialLayer);

    v33 = objc_opt_new(UIView);
    backgroundView = v8->_backgroundView;
    v8->_backgroundView = v33;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.200000003));
    -[UIView setBackgroundColor:](v8->_backgroundView, "setBackgroundColor:", v35);

    -[MapsPopupMessageView addSubview:](v8, "addSubview:", v8->_backgroundView);
    v36 = objc_opt_new(CALayer);
    borderLayer = v8->_borderLayer;
    v8->_borderLayer = v36;

    -[CALayer setBorderWidth:](v8->_borderLayer, "setBorderWidth:", 1.0);
    -[CALayer setCornerCurve:](v8->_materialLayer, "setCornerCurve:", v24);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v8->_backgroundView, "layer"));
    objc_msgSend(v38, "addSublayer:", v8->_borderLayer);

    v39 = objc_opt_new(UILabel);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v39, "setNumberOfLines:", 4);
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v39, "setTextColor:", v40);

    -[UILabel setText:](v39, "setText:", v8->_message);
    -[UILabel setTextAlignment:](v39, "setTextAlignment:", 1);
    -[UIView addSubview:](v8->_backgroundView, "addSubview:", v39);
    objc_storeStrong((id *)&v8->_messageLabel, v39);
    -[MapsPopupMessageView _userInterfaceStyleDidChange](v8, "_userInterfaceStyleDidChange");
    -[MapsPopupMessageView _preferredContentSizeDidChange](v8, "_preferredContentSizeDidChange");
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView widthAnchor](v8, "widthAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintLessThanOrEqualToConstant:", 340.0));
    v83[0] = v71;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v8->_backgroundView, "leadingAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView leadingAnchor](v8, "leadingAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v69));
    v83[1] = v68;
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v8->_backgroundView, "trailingAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView trailingAnchor](v8, "trailingAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v67));
    v83[2] = v65;
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v8->_backgroundView, "topAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView topAnchor](v8, "topAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v63));
    v83[3] = v62;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v8->_backgroundView, "bottomAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView bottomAnchor](v8, "bottomAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v61));
    v83[4] = v59;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v39, "leadingAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView leadingAnchor](v8, "leadingAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:constant:", v57, 16.0));
    v83[5] = v56;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v39, "trailingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView trailingAnchor](v8, "trailingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:constant:", v55, -16.0));
    v83[6] = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v39, "topAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView topAnchor](v8, "topAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, 8.0));
    v83[7] = v44;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v39, "bottomAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView bottomAnchor](v8, "bottomAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, -8.0));
    v83[8] = v47;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v83, 9));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v48);

    v82 = objc_opt_class(UITraitUserInterfaceStyle);
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v82, 1));
    v50 = -[MapsPopupMessageView registerForTraitChanges:withTarget:action:](v8, "registerForTraitChanges:withTarget:action:", v49, v8, "_userInterfaceStyleDidChange");

    v81 = objc_opt_class(UITraitPreferredContentSizeCategory);
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v81, 1));
    v52 = -[MapsPopupMessageView registerForTraitChanges:withTarget:action:](v8, "registerForTraitChanges:withTarget:action:", v51, v8, "_preferredContentSizeDidChange");

  }
  return v8;
}

- (void)layoutSubviews
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  CALayer *materialLayer;
  double v10;
  objc_super v11;
  CGRect v12;
  CGRect v13;

  v11.receiver = self;
  v11.super_class = (Class)MapsPopupMessageView;
  -[MapsPopupMessageView layoutSubviews](&v11, "layoutSubviews");
  -[MapsPopupMessageView bounds](self, "bounds");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:")));
  v4 = objc_msgSend(v3, "CGPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView layer](self, "layer"));
  objc_msgSend(v5, "setShadowPath:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView layer](self, "layer"));
  objc_msgSend(v6, "bounds");
  -[CALayer setFrame:](self->_materialLayer, "setFrame:");

  -[UIView bounds](self->_backgroundView, "bounds");
  v13 = CGRectInset(v12, -1.0, -1.0);
  -[CALayer setFrame:](self->_borderLayer, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
  -[MapsPopupMessageView frame](self, "frame");
  v8 = v7 * 0.5;
  materialLayer = self->_materialLayer;
  if (v7 * 0.5 <= 19.0)
  {
    -[CALayer setCornerRadius:](materialLayer, "setCornerRadius:", v7 * 0.5);
    -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", v8);
    v10 = v8 + 1.0;
  }
  else
  {
    -[CALayer setCornerRadius:](materialLayer, "setCornerRadius:", 16.0);
    -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", 16.0);
    v10 = 17.0;
  }
  -[CALayer setCornerRadius:](self->_borderLayer, "setCornerRadius:", v10);
}

- (void)presentFromView:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  GCDTimer *timer;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  double v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  BOOL v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id location;
  uint8_t buf[4];
  _BOOL4 v40;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "addSubview:", self);
  -[MapsPopupMessageView setAlpha:](self, "setAlpha:", 0.0);
  -[NSLayoutConstraint setActive:](self->_activeTopConstraint, "setActive:", 0);
  timer = self->_timer;
  self->_timer = 0;

  if (sub_1002A8AA0(self) == 5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView leadingAnchor](self, "leadingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
    v10 = 8.0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 8.0));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView centerXAnchor](self, "centerXAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerXAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
    v10 = 4.0;
  }

  v12 = sub_1002A8AA0(self) == 1;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView bottomAnchor](self, "bottomAnchor"));
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "safeAreaLayoutGuide"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView topAnchor](self, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "safeAreaLayoutGuide"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, v10));

  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v21));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView topAnchor](self, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, v10));
  }

  objc_msgSend(v11, "setActive:", 1);
  objc_msgSend(v16, "setActive:", 1);
  objc_msgSend(v6, "layoutIfNeeded");
  objc_initWeak(&location, self);
  v22 = sub_1002C2A38();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v40 = v4;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Presenting popup, animated: %d", buf, 8u);
  }

  if (v4)
    v24 = 0.3;
  else
    v24 = 0.0;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1002C2A78;
  v33[3] = &unk_1011AFEC0;
  objc_copyWeak(&v37, &location);
  v25 = v16;
  v34 = v25;
  v26 = v20;
  v35 = v26;
  v27 = v6;
  v36 = v27;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1002C2AD8;
  v29[3] = &unk_1011AFEE8;
  objc_copyWeak(&v31, &location);
  v28 = v26;
  v30 = v28;
  v32 = v4;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v33, v29, v24);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  double v15;
  id v16;
  _QWORD v17[4];
  void (**v18)(_QWORD);
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id buf;

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView superview](self, "superview"));
  if (v7 && !self->_isDismissing)
  {
    self->_isDismissing = 1;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView bottomAnchor](self, "bottomAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));

    v13 = sub_1002C2A38();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 67109120;
      HIDWORD(buf) = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Dismissing popup, animated %d", (uint8_t *)&buf, 8u);
    }

    objc_initWeak(&buf, self);
    if (v4)
      v15 = 0.3;
    else
      v15 = 0.0;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1002C2DEC;
    v20[3] = &unk_1011AFF10;
    objc_copyWeak(&v23, &buf);
    v16 = v12;
    v21 = v16;
    v22 = v7;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1002C2E58;
    v17[3] = &unk_1011AE988;
    objc_copyWeak(&v19, &buf);
    v18 = v6;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v20, v17, v15);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&buf);

  }
  else
  {
    v8 = sub_1002C2A38();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Ignoring dismiss", (uint8_t *)&buf, 2u);
    }

    if (v6)
      v6[2](v6);
  }

}

- (void)resetTimerAnimated:(BOOL)a3
{
  id v5;
  NSObject *v6;
  double timeout;
  double v8;
  id v9;
  GCDTimer *v10;
  GCDTimer *timer;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  uint8_t buf[4];
  double v16;

  if (self->_timeout > 0.0)
  {
    v5 = sub_1002C2A38();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      timeout = self->_timeout;
      *(_DWORD *)buf = 134217984;
      v16 = timeout;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Scheduling timer to dismiss pop in %f", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v8 = self->_timeout;
    v9 = &_dispatch_main_q;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002C3068;
    v12[3] = &unk_1011AFF38;
    objc_copyWeak(&v13, (id *)buf);
    v14 = a3;
    v10 = (GCDTimer *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v12, v8));
    timer = self->_timer;
    self->_timer = v10;

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_userInterfaceStyleDidChange
{
  void *v3;
  id v4;
  void *v5;
  CALayer **p_borderLayer;
  double v7;
  double v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.800000012));
    -[UILabel setTextColor:](self->_messageLabel, "setTextColor:", v5);

    -[UILabel _setDrawsAsBackdropOverlayWithBlendMode:](self->_messageLabel, "_setDrawsAsBackdropOverlayWithBlendMode:", 2);
    p_borderLayer = &self->_borderLayer;
    -[CALayer setCompositingFilter:](*p_borderLayer, "setCompositingFilter:", kCAFilterLightenBlendMode);
    v7 = 0.400000006;
    v8 = 1.0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](self->_messageLabel, "setTextColor:", v9);

    -[UILabel _setDrawsAsBackdropOverlayWithBlendMode:](self->_messageLabel, "_setDrawsAsBackdropOverlayWithBlendMode:", 0);
    p_borderLayer = &self->_borderLayer;
    -[CALayer setCompositingFilter:](*p_borderLayer, "setCompositingFilter:", kCAFilterDarkenBlendMode);
    v7 = 0.0799999982;
    v8 = 0.0;
  }
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v8, v7)));
  -[CALayer setBorderColor:](*p_borderLayer, "setBorderColor:", objc_msgSend(v10, "CGColor"));

}

- (void)_preferredContentSizeDidChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryExtraExtraExtraLarge));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleSubheadline, v4, UIFontWeightSemibold));

  -[UILabel setFont:](self->_messageLabel, "setFont:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPopupMessageView superview](self, "superview"));
  objc_msgSend(v5, "setNeedsLayout");

}

- (NSString)message
{
  return self->_message;
}

- (double)timeout
{
  return self->_timeout;
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_activeTopConstraint, 0);
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_materialLayer, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
