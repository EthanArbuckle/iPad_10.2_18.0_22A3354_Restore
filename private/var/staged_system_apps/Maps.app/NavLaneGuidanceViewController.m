@implementation NavLaneGuidanceViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NavLaneGuidanceViewController)initWithDelegate:(id)a3 blurGroup:(id)a4
{
  id v6;
  id v7;
  NavLaneGuidanceViewController *v8;
  NavLaneGuidanceViewController *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NavLaneGuidanceViewController;
  v8 = -[NavLaneGuidanceViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (v8)
  {
    v10 = (objc_class *)objc_opt_class(v8);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[NavLaneGuidanceViewController setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", v12);

    objc_storeWeak((id *)&v9->_delegate, v6);
    objc_storeStrong((id *)&v9->_blurGroup, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v13, "registerObserver:", v9);

  }
  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  NavSignLaneGuidanceView *v5;
  NavSignLaneGuidanceView *laneGuidanceView;
  NavSignLaneGuidanceView *v7;
  id v8;
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
  objc_super v25;
  _QWORD v26[4];

  v25.receiver = self;
  v25.super_class = (Class)NavLaneGuidanceViewController;
  -[NavLaneGuidanceViewController viewDidLoad](&v25, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavLaneGuidanceViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v4, "setMasksToBounds:", 1);

  -[NavLaneGuidanceViewController _insertBackgroundView](self, "_insertBackgroundView");
  v5 = -[NavSignLaneGuidanceView initWithLaneStyle:]([NavSignLaneGuidanceView alloc], "initWithLaneStyle:", 0);
  laneGuidanceView = self->_laneGuidanceView;
  self->_laneGuidanceView = v5;

  -[NavSignLaneGuidanceView setTranslatesAutoresizingMaskIntoConstraints:](self->_laneGuidanceView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[NavSignLaneGuidanceView setEdgeInsets:](self->_laneGuidanceView, "setEdgeInsets:", 10.0, 0.0, 0.0, 0.0);
  -[NavSignLaneGuidanceView setUserInteractionEnabled:](self->_laneGuidanceView, "setUserInteractionEnabled:", 1);
  v7 = self->_laneGuidanceView;
  v8 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "pressedLaneGuidance");
  -[NavSignLaneGuidanceView addGestureRecognizer:](v7, "addGestureRecognizer:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavLaneGuidanceViewController view](self, "view"));
  objc_msgSend(v9, "addSubview:", self->_laneGuidanceView);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView leadingAnchor](self->_laneGuidanceView, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavLaneGuidanceViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v26[0] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView trailingAnchor](self->_laneGuidanceView, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavLaneGuidanceViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v11));
  v26[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView bottomAnchor](self->_laneGuidanceView, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavLaneGuidanceViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  v26[2] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView heightAnchor](self->_laneGuidanceView, "heightAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToConstant:", 60.0));
  v26[3] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

}

- (void)pressedLaneGuidance
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[NavLaneGuidanceViewController delegate](self, "delegate"));
  objc_msgSend(v2, "didTapLaneGuidance");

}

- (MUBlurView)backgroundView
{
  MUBlurView *backgroundView;
  MUBlurView *v4;
  MUBlurView *v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  void *v11;

  backgroundView = self->_backgroundView;
  if (!backgroundView)
  {
    v4 = (MUBlurView *)objc_msgSend(objc_alloc((Class)MUBlurView), "initWithBlurEffectStyle:", 19);
    v5 = self->_backgroundView;
    self->_backgroundView = v4;

    v6 = sub_1006E66E4();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NavLaneGuidanceViewController layoutProgress](self, "layoutProgress");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "colorWithAlphaComponent:", v8 * 0.239999995));
    -[MUBlurView setOverlayColor:](self->_backgroundView, "setOverlayColor:", v9);

    -[MUBlurView setBlurGroupName:](self->_backgroundView, "setBlurGroupName:", self->_blurGroup);
    v10 = sub_1006E6768();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[MUBlurView setNonBlurredColor:](self->_backgroundView, "setNonBlurredColor:", v11);

    -[MUBlurView setStyle:](self->_backgroundView, "setStyle:", 2);
    -[MUBlurView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    backgroundView = self->_backgroundView;
  }
  return backgroundView;
}

- (void)setLayoutProgress:(double)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;
  double v7;
  void *v8;
  id v9;

  if (self->_layoutProgress != a3)
  {
    self->_layoutProgress = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavLaneGuidanceViewController traitCollection](self, "traitCollection"));
    v5 = objc_msgSend(v4, "isLuminanceReduced");

    if ((v5 & 1) == 0)
    {
      v6 = sub_1006E66E4();
      v9 = (id)objc_claimAutoreleasedReturnValue(v6);
      -[NavLaneGuidanceViewController layoutProgress](self, "layoutProgress");
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorWithAlphaComponent:", v7 * 0.239999995));
      -[MUBlurView setOverlayColor:](self->_backgroundView, "setOverlayColor:", v8);

    }
  }
}

- (BOOL)hasLaneGuidance
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavLaneGuidanceViewController laneGuidanceInfo](self, "laneGuidanceInfo"));
  v3 = v2 != 0;

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  char v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NavLaneGuidanceViewController;
  v4 = a3;
  -[NavLaneGuidanceViewController traitCollectionDidChange:](&v11, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavLaneGuidanceViewController traitCollection](self, "traitCollection"));
  v6 = sub_1002A8A0C(v4, v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavLaneGuidanceViewController traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "isLuminanceReduced");

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10054CCB4;
    v9[3] = &unk_1011ACE58;
    v10 = (char)v8;
    v9[4] = self;
    +[UIView _maps_animateForAndromeda:animations:](UIView, "_maps_animateForAndromeda:animations:", v8, v9);
  }
}

- (void)navigationService:(id)a3 showLaneDirections:(id)a4
{
  id v5;
  void *v6;
  _BOOL8 v7;
  NavSignLaneGuidanceInfo *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavLaneGuidanceViewController laneGuidanceInfo](self, "laneGuidanceInfo"));
  v7 = v6 == 0;

  v8 = -[NavSignLaneGuidanceInfo initWithGuidanceLaneInfo:]([NavSignLaneGuidanceInfo alloc], "initWithGuidanceLaneInfo:", v5);
  -[NavLaneGuidanceViewController setLaneGuidanceInfo:](self, "setLaneGuidanceInfo:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavLaneGuidanceViewController laneGuidanceInfo](self, "laneGuidanceInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lanes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavLaneGuidanceViewController laneGuidanceView](self, "laneGuidanceView"));
  objc_msgSend(v11, "setLanes:", v10);

  -[NavLaneGuidanceViewController _updateLaneGuidanceAnimated:](self, "_updateLaneGuidanceAnimated:", v7);
}

- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4
{
  -[NavLaneGuidanceViewController setLaneGuidanceInfo:](self, "setLaneGuidanceInfo:", 0, a4);
  -[NavLaneGuidanceViewController _updateLaneGuidanceAnimated:](self, "_updateLaneGuidanceAnimated:", 1);
}

- (void)_updateLaneGuidanceAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  _QWORD v10[6];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavLaneGuidanceViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
  objc_msgSend(v6, "layoutIfNeeded");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavLaneGuidanceViewController laneGuidanceInfo](self, "laneGuidanceInfo"));
  if (v7)
    v8 = 60.0;
  else
    v8 = 0.0;

  v9 = 0.25;
  if (!v3)
    v9 = 0.0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10054CF34;
  v10[3] = &unk_1011AD518;
  v10[4] = self;
  *(double *)&v10[5] = v8;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v10, v9);
}

- (void)_insertBackgroundView
{
  MUBlurView *backgroundView;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  -[MUBlurView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavLaneGuidanceViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavLaneGuidanceViewController backgroundView](self, "backgroundView"));
  objc_msgSend(v4, "insertSubview:atIndex:", v5, 0);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[NavLaneGuidanceViewController backgroundView](self, "backgroundView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavLaneGuidanceViewController view](self, "view"));
  LODWORD(v7) = 1148846080;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_maps_constraintsEqualToEdgesOfView:priority:", v6, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v9);

}

- (NavLaneGuidanceViewControllerDelegate)delegate
{
  return (NavLaneGuidanceViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)layoutProgress
{
  return self->_layoutProgress;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (NavSignLaneGuidanceView)laneGuidanceView
{
  return self->_laneGuidanceView;
}

- (void)setLaneGuidanceView:(id)a3
{
  objc_storeStrong((id *)&self->_laneGuidanceView, a3);
}

- (NSLayoutConstraint)laneGuidanceHeightConstraint
{
  return self->_laneGuidanceHeightConstraint;
}

- (void)setLaneGuidanceHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_laneGuidanceHeightConstraint, a3);
}

- (NavSignLaneGuidanceInfo)laneGuidanceInfo
{
  return self->_laneGuidanceInfo;
}

- (void)setLaneGuidanceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_laneGuidanceInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_laneGuidanceInfo, 0);
  objc_storeStrong((id *)&self->_laneGuidanceHeightConstraint, 0);
  objc_storeStrong((id *)&self->_laneGuidanceView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_blurGroup, 0);
}

@end
