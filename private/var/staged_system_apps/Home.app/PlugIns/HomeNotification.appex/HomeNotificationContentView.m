@implementation HomeNotificationContentView

- (HomeNotificationContentView)initWithContent:(id)a3
{
  id v4;
  HomeNotificationContentView *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  HomeNotificationStatusView *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _QWORD v40[4];

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)HomeNotificationContentView;
  v5 = -[HomeNotificationContentView init](&v38, "init");
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    -[HomeNotificationContentView setSpinner:](v5, "setSpinner:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView spinner](v5, "spinner"));
    objc_msgSend(v7, "setHidesWhenStopped:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView spinner](v5, "spinner"));
    objc_msgSend(v8, "stopAnimating");

    v9 = objc_alloc_init((Class)HULayeredVisualEffectView);
    -[HomeNotificationContentView setStatusBarView:](v5, "setStatusBarView:", v9);

    v10 = objc_alloc_init(HomeNotificationStatusView);
    -[HomeNotificationContentView setStatusView:](v5, "setStatusView:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusBarView](v5, "statusBarView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusView](v5, "statusView"));
    objc_msgSend(v12, "addSubview:", v13);

    v14 = objc_alloc((Class)HUCameraView);
    v15 = objc_msgSend(objc_alloc((Class)HUCameraBadgeView), "initWithSize:", 0);
    v16 = objc_msgSend(v14, "initWithBadgeView:", v15);
    -[HomeNotificationContentView setCameraView:](v5, "setCameraView:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.7, 1.0));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView cameraView](v5, "cameraView"));
    objc_msgSend(v18, "setTintColor:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView cameraView](v5, "cameraView"));
    objc_msgSend(v19, "setBadgeOffset:", 16.0, 16.0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusBarView](v5, "statusBarView"));
    v40[0] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusView](v5, "statusView"));
    v40[1] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView cameraView](v5, "cameraView"));
    v40[2] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView spinner](v5, "spinner"));
    v40[3] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 4));

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v25 = v24;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v35;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v35 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v29), "setTranslatesAutoresizingMaskIntoConstraints:", 0, (_QWORD)v34);
          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v27);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView cameraView](v5, "cameraView"));
    -[HomeNotificationContentView addSubview:](v5, "addSubview:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusBarView](v5, "statusBarView"));
    -[HomeNotificationContentView addSubview:](v5, "addSubview:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView spinner](v5, "spinner"));
    -[HomeNotificationContentView addSubview:](v5, "addSubview:", v32);

    -[HomeNotificationContentView setContent:](v5, "setContent:", v4);
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusTextOverrideCancellationToken](self, "statusTextOverrideCancellationToken"));
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)HomeNotificationContentView;
  -[HomeNotificationContentView dealloc](&v4, "dealloc");
}

- (void)setContent:(id)a3
{
  -[HomeNotificationContentView setContent:animated:](self, "setContent:animated:", a3, 0);
}

- (void)setContent:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  HomeNotificationContent *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
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
  HomeNotificationContent *v25;
  void ***v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void **v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  HomeNotificationContent *v38;
  id v39;
  BOOL v40;
  id location;

  v4 = a4;
  v7 = (HomeNotificationContent *)a3;
  if (self->_content == v7)
    goto LABEL_19;
  objc_storeStrong((id *)&self->_content, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusTextOverrideCancellationToken](self, "statusTextOverrideCancellationToken"));
  objc_msgSend(v8, "cancel");

  -[HomeNotificationContentView setStatusTextOverrideCancellationToken:](self, "setStatusTextOverrideCancellationToken:", 0);
  v9 = (id)-[HomeNotificationContent mode](v7, "mode") != (id)1
    && (id)-[HomeNotificationContent mode](v7, "mode") != (id)2;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContent cameraSource](v7, "cameraSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView cameraView](self, "cameraView"));
  objc_msgSend(v11, "setCameraSource:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView cameraView](self, "cameraView"));
  objc_msgSend(v12, "setHidden:", v9);

  v13 = -[HomeNotificationContent statusDisplayStyle](v7, "statusDisplayStyle");
  if (!v13)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusBarView](self, "statusBarView"));
    objc_msgSend(v18, "setHidden:", 1);
    goto LABEL_11;
  }
  if (v13 == (id)1)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusBarView](self, "statusBarView"));
    objc_msgSend(v19, "setHidden:", 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[HULayeredBackgroundEffect backgroundWithBlurEffect:](HULayeredBackgroundEffect, "backgroundWithBlurEffect:", v18));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusBarView](self, "statusBarView"));
    objc_msgSend(v21, "setBackgroundEffect:", v20);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:](UIVibrancyEffect, "effectForBlurEffect:", v18));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[HULayeredContentEffect contentWithVibrancyEffect:](HULayeredContentEffect, "contentWithVibrancyEffect:", v22));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusBarView](self, "statusBarView"));
    objc_msgSend(v24, "setContentEffect:", v23);

    goto LABEL_11;
  }
  if (v13 == (id)2)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusBarView](self, "statusBarView"));
    objc_msgSend(v14, "setHidden:", 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor hf_keyColor](UIColor, "hf_keyColor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[HULayeredBackgroundEffect backgroundWithFillColor:](HULayeredBackgroundEffect, "backgroundWithFillColor:", v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusBarView](self, "statusBarView"));
    objc_msgSend(v17, "setBackgroundEffect:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusBarView](self, "statusBarView"));
    objc_msgSend(v18, "setContentEffect:", 0);
LABEL_11:

  }
  objc_initWeak(&location, self);
  v34 = _NSConcreteStackBlock;
  v35 = 3221225472;
  v36 = sub_10000CA88;
  v37 = &unk_100018CD0;
  objc_copyWeak(&v39, &location);
  v25 = v7;
  v38 = v25;
  v40 = v4;
  v26 = objc_retainBlock(&v34);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContent actionResultText](v25, "actionResultText", v34, v35, v36, v37));

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContent actionResultText](v25, "actionResultText"));
    -[HomeNotificationContentView _updateStatusText:accessoryImage:animated:](self, "_updateStatusText:accessoryImage:animated:", v28, 0, v4);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "afterDelay:performBlock:", v26, 2.0));
    -[HomeNotificationContentView setStatusTextOverrideCancellationToken:](self, "setStatusTextOverrideCancellationToken:", v30);

  }
  else
  {
    ((void (*)(void ***))v26[2])(v26);
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView cameraView](self, "cameraView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContent errorContent](v25, "errorContent"));
  objc_msgSend(v31, "setErrorContent:animated:", v32, v4);

  if (-[HomeNotificationContent mode](v25, "mode"))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView spinner](self, "spinner"));
    objc_msgSend(v33, "stopAnimating");
  }
  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView spinner](self, "spinner"));
    objc_msgSend(v33, "startAnimating");
  }

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
LABEL_19:

}

- (void)_updateStatusText:(id)a3 accessoryImage:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusView](self, "statusView"));
  objc_msgSend(v9, "setStatusText:", v8);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusView](self, "statusView"));
  objc_msgSend(v10, "setAccessoryImage:", v7);

}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)updateConstraints
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
  objc_super v67;
  _QWORD v68[13];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView constraints](self, "constraints"));

  if (!v3)
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView cameraView](self, "cameraView"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "topAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView topAnchor](self, "topAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v64));
    v68[0] = v63;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView cameraView](self, "cameraView"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "bottomAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView bottomAnchor](self, "bottomAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v60));
    v68[1] = v59;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView cameraView](self, "cameraView"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "leadingAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView leadingAnchor](self, "leadingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v56));
    v68[2] = v55;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView cameraView](self, "cameraView"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "trailingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView trailingAnchor](self, "trailingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
    v68[3] = v51;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView spinner](self, "spinner"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "centerXAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView cameraView](self, "cameraView"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "centerXAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
    v68[4] = v46;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView spinner](self, "spinner"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "centerYAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView cameraView](self, "cameraView"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "centerYAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
    v68[5] = v41;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusBarView](self, "statusBarView"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "leadingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView cameraView](self, "cameraView"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
    v68[6] = v36;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusBarView](self, "statusBarView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView cameraView](self, "cameraView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
    v68[7] = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusBarView](self, "statusBarView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView cameraView](self, "cameraView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
    v68[8] = v26;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusView](self, "statusView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "centerXAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusBarView](self, "statusBarView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "centerXAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
    v68[9] = v21;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusView](self, "statusView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "centerYAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusBarView](self, "statusBarView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "centerYAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
    v68[10] = v16;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusView](self, "statusView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "widthAnchor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusBarView](self, "statusBarView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "widthAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintLessThanOrEqualToAnchor:", v5));
    v68[11] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusView](self, "statusView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "heightAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView statusBarView](self, "statusBarView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "heightAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
    v68[12] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v68, 13));
    -[HomeNotificationContentView setConstraints:](self, "setConstraints:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationContentView constraints](self, "constraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

  }
  v67.receiver = self;
  v67.super_class = (Class)HomeNotificationContentView;
  -[HomeNotificationContentView updateConstraints](&v67, "updateConstraints");
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5;
  double v6;
  objc_super v7;
  CGSize result;

  v7.receiver = self;
  v7.super_class = (Class)HomeNotificationContentView;
  -[HomeNotificationContentView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v7, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height);
  if (v6 >= v5 * 16.0 / 9.0)
    v6 = v5 * 16.0 / 9.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (HomeNotificationContent)content
{
  return self->_content;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (HULayeredVisualEffectView)statusBarView
{
  return self->_statusBarView;
}

- (void)setStatusBarView:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarView, a3);
}

- (HomeNotificationStatusView)statusView
{
  return self->_statusView;
}

- (void)setStatusView:(id)a3
{
  objc_storeStrong((id *)&self->_statusView, a3);
}

- (HUCameraView)cameraView
{
  return self->_cameraView;
}

- (void)setCameraView:(id)a3
{
  objc_storeStrong((id *)&self->_cameraView, a3);
}

- (NACancelable)statusTextOverrideCancellationToken
{
  return self->_statusTextOverrideCancellationToken;
}

- (void)setStatusTextOverrideCancellationToken:(id)a3
{
  objc_storeStrong((id *)&self->_statusTextOverrideCancellationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusTextOverrideCancellationToken, 0);
  objc_storeStrong((id *)&self->_cameraView, 0);
  objc_storeStrong((id *)&self->_statusView, 0);
  objc_storeStrong((id *)&self->_statusBarView, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
