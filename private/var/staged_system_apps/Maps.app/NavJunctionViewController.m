@implementation NavJunctionViewController

- (NavJunctionViewController)init
{
  NavJunctionViewController *v2;
  NavJunctionViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavJunctionViewController;
  v2 = -[NavJunctionViewController init](&v5, "init");
  v3 = v2;
  if (v2)
    -[NavJunctionViewController setLightModeSource:](v2, "setLightModeSource:", 1);
  return v3;
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
  CAGradientLayer *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
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
  double v32;
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
  objc_super v49;
  _QWORD v50[5];

  v49.receiver = self;
  v49.super_class = (Class)NavJunctionViewController;
  -[NavJunctionViewController viewDidLoad](&v49, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v4, "setMasksToBounds:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController view](self, "view"));
  objc_msgSend(v5, "setClipsToBounds:", 1);

  v6 = objc_opt_new(CAGradientLayer);
  -[NavJunctionViewController setSkyGradientLayer:](self, "setSkyGradientLayer:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController skyGradientLayer](self, "skyGradientLayer"));
  objc_msgSend(v7, "setLocations:", &off_101273938);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController skyGradientLayer](self, "skyGradientLayer"));
  objc_msgSend(v8, "setStartPoint:", 0.5, 0.0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController skyGradientLayer](self, "skyGradientLayer"));
  objc_msgSend(v9, "setEndPoint:", 0.5, 1.0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController skyGradientLayer](self, "skyGradientLayer"));
  objc_msgSend(v11, "addSublayer:", v12);

  v13 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[NavJunctionViewController setJunctionView:](self, "setJunctionView:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController junctionView](self, "junctionView"));
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController junctionView](self, "junctionView"));
  objc_msgSend(v15, "setContentMode:", 2);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController junctionView](self, "junctionView"));
  objc_msgSend(v16, "setUserInteractionEnabled:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController junctionView](self, "junctionView"));
  objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("NavJunctionView"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController junctionView](self, "junctionView"));
  v19 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_pressedJunctionView");
  objc_msgSend(v18, "addGestureRecognizer:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController junctionView](self, "junctionView"));
  objc_msgSend(v20, "addSubview:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController junctionView](self, "junctionView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25, 0.0));
  -[NavJunctionViewController setJunctionViewBottomConstraint:](self, "setJunctionViewBottomConstraint:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController junctionView](self, "junctionView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "heightAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToConstant:", 0.0));
  -[NavJunctionViewController setJunctionViewHeightConstraint:](self, "setJunctionViewHeightConstraint:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController view](self, "view"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "heightAnchor"));
  LODWORD(v32) = 1148846080;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToConstant:priority:", 0.0, v32));
  -[NavJunctionViewController setHeightConstraint:](self, "setHeightConstraint:", v33);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController junctionView](self, "junctionView"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "widthAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController view](self, "view"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "widthAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
  v50[0] = v44;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController junctionView](self, "junctionView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "centerXAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController view](self, "view"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "centerXAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v37));
  v50[1] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController junctionViewBottomConstraint](self, "junctionViewBottomConstraint"));
  v50[2] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController junctionViewHeightConstraint](self, "junctionViewHeightConstraint"));
  v50[3] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController heightConstraint](self, "heightConstraint"));
  v50[4] = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[MapsLightLevelController sharedController](MapsLightLevelController, "sharedController"));
  objc_msgSend(v43, "addObserver:", self);

}

- (void)setAvailableHeight:(double)a3
{
  self->_availableHeight = a3;
  -[NavJunctionViewController fitImageForHeight:](self, "fitImageForHeight:");
}

- (double)calculateAvailableHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController heightConstraint](self, "heightConstraint"));
  objc_msgSend(v4, "constant");
  objc_msgSend(v3, "maxAvailableHeightForJunctionView:");
  v6 = v5;

  return v6;
}

- (void)viewDidLayoutSubviews
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
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NavJunctionViewController;
  -[NavJunctionViewController viewDidLayoutSubviews](&v13, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController skyGradientLayer](self, "skyGradientLayer"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)fitImageForHeight:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  id v23;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController junctionImage](self, "junctionImage"));
  objc_msgSend(v5, "size");
  v7 = v6;

  if (a3 == 0.0 || v7 == 0.0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController heightConstraint](self, "heightConstraint"));
    v21 = 0.0;
    v23 = v20;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController junctionImage](self, "junctionImage"));
    objc_msgSend(v8, "size");
    v9 = 0.0;
    if (v10 > 0.0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController junctionImage](self, "junctionImage"));
      objc_msgSend(v11, "size");
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController view](self, "view"));
      objc_msgSend(v14, "frame");
      v16 = v13 * v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController junctionImage](self, "junctionImage"));
      objc_msgSend(v17, "size");
      v9 = floor(v16 / v18);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController junctionViewBottomConstraint](self, "junctionViewBottomConstraint"));
    if (v9 <= a3)
    {
      objc_msgSend(v19, "setConstant:", 0.0);
      a3 = v9;
    }
    else
    {
      objc_msgSend(v19, "setConstant:", (v9 - a3) * 0.600000024);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController junctionViewHeightConstraint](self, "junctionViewHeightConstraint"));
    objc_msgSend(v22, "setConstant:", v9);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController heightConstraint](self, "heightConstraint"));
    v23 = v20;
    v21 = a3;
  }
  objc_msgSend(v20, "setConstant:", v21);

}

- (void)setJunctionImage:(id)a3
{
  void *v5;
  double v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NavJunctionViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  objc_storeStrong((id *)&self->_junctionImage, a3);
  -[UIImage setAccessibilityIdentifier:](self->_junctionImage, "setAccessibilityIdentifier:", CFSTR("NavJunctionImage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController junctionView](self, "junctionView"));
  objc_msgSend(v5, "setImage:", v8);

  if (v8 && (objc_msgSend(v8, "size"), v6 > 0.0))
  {
    -[NavJunctionViewController calculateAvailableHeight](self, "calculateAvailableHeight");
    -[NavJunctionViewController setAvailableHeight:](self, "setAvailableHeight:");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController heightConstraint](self, "heightConstraint"));
    objc_msgSend(v7, "setConstant:", 0.0);

  }
  -[NavJunctionViewController updateSkyColor](self, "updateSkyColor");

}

- (void)setJunctionViewInfo:(id)a3
{
  NavJunctionViewInfo *v4;
  NavJunctionViewInfo *v5;
  void *v6;
  void *v7;
  NavJunctionViewInfo *junctionViewInfo;
  NavJunctionViewInfo *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = (NavJunctionViewInfo *)a3;
  v5 = v4;
  if (v4 && self->_junctionViewInfo != v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NavigationFeedbackCollector sharedFeedbackCollector](NavigationFeedbackCollector, "sharedFeedbackCollector"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewInfo junctionViewId](v5, "junctionViewId"));
    objc_msgSend(v6, "setJunctionViewDisplayed:", v7);

  }
  junctionViewInfo = self->_junctionViewInfo;
  self->_junctionViewInfo = v5;
  v9 = v5;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v12, "userInterfaceStyle") == (id)2)
    v10 = objc_claimAutoreleasedReturnValue(-[NavJunctionViewInfo junctionViewDarkenedImage](v9, "junctionViewDarkenedImage"));
  else
    v10 = objc_claimAutoreleasedReturnValue(-[NavJunctionViewInfo junctionViewImage](v9, "junctionViewImage"));
  v11 = (void *)v10;

  -[NavJunctionViewController setJunctionImage:](self, "setJunctionImage:", v11);
}

- (void)_pressedJunctionView
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController delegate](self, "delegate"));
  objc_msgSend(v2, "hideJunctionViewTemporarily");

}

- (void)updateSkyColor
{
  void *v2;
  unint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];

  v4 = -[NavJunctionViewController lightModeSource](self, "lightModeSource");
  if (v4)
  {
    if ((id)-[NavJunctionViewController lightModeSource](self, "lightModeSource") != (id)1)
      goto LABEL_12;
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[MapsLightLevelController sharedController](MapsLightLevelController, "sharedController"));
    if (objc_msgSend(v2, "shouldUseNightMode"))
    {

      goto LABEL_10;
    }
    if ((id)-[NavJunctionViewController lightModeSource](self, "lightModeSource") != (id)1)
    {

LABEL_12:
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.709803922, 0.866666667, 0.929411765, 1.0)));
      v12[0] = objc_msgSend(v7, "CGColor");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.929411765, 0.929411765, 0.929411765, 1.0)));
      v12[1] = objc_msgSend(v8, "CGColor");
      v9 = v12;
      goto LABEL_13;
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  if (!v4)
  if (v6 != (id)2)
    goto LABEL_12;
LABEL_10:
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.137254902, 0.298039216, 0.478431373, 1.0)));
  v13[0] = objc_msgSend(v7, "CGColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.337254902, 0.42745098, 0.647058824, 1.0)));
  v13[1] = objc_msgSend(v8, "CGColor");
  v9 = v13;
LABEL_13:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController skyGradientLayer](self, "skyGradientLayer"));
  objc_msgSend(v11, "setColors:", v10);

}

+ (void)updateJunctionImageSizeForScreenSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  if (a3.width == 0.0 || (height = a3.height, a3.height == 0.0))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    if (!v5)
    {
      v11 = 2.0;
      goto LABEL_11;
    }
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentMode"));
    objc_msgSend(v7, "size");
    width = v8;
    height = v9;

  }
  else
  {
    width = a3.width;
  }
  if (width >= height)
    v10 = 828.0;
  else
    v10 = 415.0;
  v11 = trunc(width / v10) + 1.0;
LABEL_11:
  v12 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v12, "setJunctionViewImageWidth:height:", v11 * 414.0, v11 * 292.0);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NavJunctionViewController;
  -[NavJunctionViewController traitCollectionDidChange:](&v14, "traitCollectionDidChange:", v4);
  if ((id)-[NavJunctionViewController lightModeSource](self, "lightModeSource") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController traitCollection](self, "traitCollection"));
    v6 = objc_msgSend(v5, "userInterfaceStyle");
    v7 = objc_msgSend(v4, "userInterfaceStyle");

    if (v6 != v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController traitCollection](self, "traitCollection"));
      v9 = objc_msgSend(v8, "userInterfaceStyle");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewController junctionViewInfo](self, "junctionViewInfo"));
      v11 = v10;
      if (v9 == (id)2)
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "junctionViewDarkenedImage"));
      else
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "junctionViewImage"));
      v13 = (void *)v12;
      -[NavJunctionViewController setJunctionImage:](self, "setJunctionImage:", v12);

    }
  }

}

- (void)lightLevelController:(id)a3 didUpdateLightLevel:(int64_t)a4
{
  unsigned __int8 v5;
  NavJunctionViewInfo *junctionViewInfo;
  uint64_t v7;
  void *v8;
  id v9;

  if (!-[NavJunctionViewController lightModeSource](self, "lightModeSource", a3, a4))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[MapsLightLevelController sharedController](MapsLightLevelController, "sharedController"));
    v5 = objc_msgSend(v9, "shouldUseNightMode");
    junctionViewInfo = self->_junctionViewInfo;
    if ((v5 & 1) != 0)
      v7 = objc_claimAutoreleasedReturnValue(-[NavJunctionViewInfo junctionViewDarkenedImage](junctionViewInfo, "junctionViewDarkenedImage"));
    else
      v7 = objc_claimAutoreleasedReturnValue(-[NavJunctionViewInfo junctionViewImage](junctionViewInfo, "junctionViewImage"));
    v8 = (void *)v7;
    -[NavJunctionViewController setJunctionImage:](self, "setJunctionImage:", v7);

  }
}

- (NavJunctionViewInfo)junctionViewInfo
{
  return self->_junctionViewInfo;
}

- (NavJunctionViewControllerDelegate)delegate
{
  return (NavJunctionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)availableHeight
{
  return self->_availableHeight;
}

- (unint64_t)lightModeSource
{
  return self->_lightModeSource;
}

- (void)setLightModeSource:(unint64_t)a3
{
  self->_lightModeSource = a3;
}

- (UIImage)junctionImage
{
  return self->_junctionImage;
}

- (UIImageView)junctionView
{
  return self->_junctionView;
}

- (void)setJunctionView:(id)a3
{
  objc_storeStrong((id *)&self->_junctionView, a3);
}

- (NSLayoutConstraint)junctionViewBottomConstraint
{
  return self->_junctionViewBottomConstraint;
}

- (void)setJunctionViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_junctionViewBottomConstraint, a3);
}

- (NSLayoutConstraint)junctionViewHeightConstraint
{
  return self->_junctionViewHeightConstraint;
}

- (void)setJunctionViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_junctionViewHeightConstraint, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (CAGradientLayer)skyGradientLayer
{
  return self->_skyGradientLayer;
}

- (void)setSkyGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_skyGradientLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skyGradientLayer, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_junctionViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_junctionViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_junctionView, 0);
  objc_storeStrong((id *)&self->_junctionImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_junctionViewInfo, 0);
}

@end
