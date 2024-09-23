@implementation NavPrimaryDrivingSignView

- (id)_defaultSignLayoutDelegate
{
  return +[NavSignLayoutDelegateManager defaultLayoutDelegateForDriving](NavSignLayoutDelegateManager, "defaultLayoutDelegateForDriving");
}

- (void)_setupSubviews
{
  NavSignLaneGuidanceView *v3;
  NavSignLaneGuidanceView *laneGuidanceView;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NavPrimaryDrivingSignView;
  -[NavManeuverSignView _setupSubviews](&v6, "_setupSubviews");
  v3 = -[NavSignLaneGuidanceView initWithLaneStyle:]([NavSignLaneGuidanceView alloc], "initWithLaneStyle:", 0);
  laneGuidanceView = self->_laneGuidanceView;
  self->_laneGuidanceView = v3;

  -[NavSignLaneGuidanceView setTranslatesAutoresizingMaskIntoConstraints:](self->_laneGuidanceView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v5) = 1148846080;
  -[NavSignLaneGuidanceView setContentCompressionResistancePriority:forAxis:](self->_laneGuidanceView, "setContentCompressionResistancePriority:forAxis:", 1, v5);
  -[NavSignLaneGuidanceView setHidden:](self->_laneGuidanceView, "setHidden:", 1);
  -[NavPrimaryDrivingSignView addSubview:](self, "addSubview:", self->_laneGuidanceView);
}

- (void)refreshSign
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceInfo](self, "laneGuidanceInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lanes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  objc_msgSend(v5, "setLanes:", v4);

  v6.receiver = self;
  v6.super_class = (Class)NavPrimaryDrivingSignView;
  -[NavManeuverSignView refreshSign](&v6, "refreshSign");
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *laneGuidanceViewTopMarginConstraint;
  void *v9;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *laneGuidanceViewLeadingMarginConstraint;
  void *v14;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *laneGuidanceViewTrailingMarginConstraint;
  void *v19;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *laneGuidanceViewMajorLabelConstraint;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;
  _QWORD v34[5];

  v33.receiver = self;
  v33.super_class = (Class)NavPrimaryDrivingSignView;
  -[NavManeuverSignView _setupConstraints](&v33, "_setupConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView topAnchor](self, "topAnchor"));
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  laneGuidanceViewTopMarginConstraint = self->_laneGuidanceViewTopMarginConstraint;
  self->_laneGuidanceViewTopMarginConstraint = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView leadingAnchor](self, "leadingAnchor"));
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  laneGuidanceViewLeadingMarginConstraint = self->_laneGuidanceViewLeadingMarginConstraint;
  self->_laneGuidanceViewLeadingMarginConstraint = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView trailingAnchor](self, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
  laneGuidanceViewTrailingMarginConstraint = self->_laneGuidanceViewTrailingMarginConstraint;
  self->_laneGuidanceViewTrailingMarginConstraint = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView topAnchor](self, "topAnchor"));
  v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:", v21));
  laneGuidanceViewMajorLabelConstraint = self->_laneGuidanceViewMajorLabelConstraint;
  self->_laneGuidanceViewMajorLabelConstraint = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceViewTopMarginConstraint](self, "laneGuidanceViewTopMarginConstraint"));
  v34[0] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceViewLeadingMarginConstraint](self, "laneGuidanceViewLeadingMarginConstraint"));
  v34[1] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceViewTrailingMarginConstraint](self, "laneGuidanceViewTrailingMarginConstraint"));
  v34[2] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceViewMajorLabelConstraint](self, "laneGuidanceViewMajorLabelConstraint"));
  v34[3] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView bottomAnchor](self, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintGreaterThanOrEqualToAnchor:", v30));
  v34[4] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 5));
  objc_msgSend(v3, "addObjectsFromArray:", v32);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v3);
}

- (void)_updateConstraints
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  double Height;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  objc_super v41;
  CGRect v42;

  v41.receiver = self;
  v41.super_class = (Class)NavPrimaryDrivingSignView;
  -[NavManeuverSignView _updateConstraints](&v41, "_updateConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceInfo](self, "laneGuidanceInfo"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
    v5 = objc_msgSend(v4, "forceHideLaneGuidanceViewForSign:", self) ^ 1;

  }
  else
  {
    v5 = 0;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  objc_msgSend(v6, "setHidden:", v5 ^ 1);

  if (-[NavPrimaryDrivingSignView animatingToHideLaneGuidanceView](self, "animatingToHideLaneGuidanceView"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
    objc_msgSend(v7, "setHidden:", 0);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  objc_msgSend(v8, "frame");
  Height = CGRectGetHeight(v42);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  objc_msgSend(v10, "laneGuidanceViewTopMarginForSign:", self);
  v12 = v11;

  if (!v5)
    v12 = -Height;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceViewTopMarginConstraint](self, "laneGuidanceViewTopMarginConstraint"));
  objc_msgSend(v13, "setConstant:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceViewMajorLabelConstraint](self, "laneGuidanceViewMajorLabelConstraint"));
  v15 = v14;
  if (v5)
  {
    objc_msgSend(v14, "setConstant:", Height);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceViewMajorLabelConstraint](self, "laneGuidanceViewMajorLabelConstraint"));
    v17 = v16;
    v18 = 1;
  }
  else
  {
    objc_msgSend(v14, "setConstant:", 0.0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceViewMajorLabelConstraint](self, "laneGuidanceViewMajorLabelConstraint"));
    v17 = v16;
    v18 = 0;
  }
  objc_msgSend(v16, "setActive:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  objc_msgSend(v19, "laneGuidanceViewSideMarginForSign:", self);
  v21 = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceViewLeadingMarginConstraint](self, "laneGuidanceViewLeadingMarginConstraint"));
  objc_msgSend(v22, "setConstant:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceViewTrailingMarginConstraint](self, "laneGuidanceViewTrailingMarginConstraint"));
  objc_msgSend(v23, "setConstant:", v21);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  objc_msgSend(v24, "laneGuidanceViewInternalEdgeInsetsForSign:", self);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  objc_msgSend(v33, "setEdgeInsets:", v26, v28, v30, v32);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  v35 = objc_msgSend(v34, "shouldTransformLaneViewsForSign:", self);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  objc_msgSend(v36, "setShouldTransformWithVerticalScale:", v35);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  objc_msgSend(v37, "laneGuidanceViewVerticalScaleForSign:", self);
  v39 = v38;

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  objc_msgSend(v40, "setVerticalScale:", v39);

}

- (void)_updateLabelText
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceInfo](self, "laneGuidanceInfo"));
  v4 = objc_msgSend(v3, "isForMidStep");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceInfo](self, "laneGuidanceInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "midStepTitles"));
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceInfo](self, "laneGuidanceInfo"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "midStepTitles"));
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverGuidanceInfo](self, "maneuverGuidanceInfo"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "majorTextAlternatives"));
    }
    v10 = (void *)v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
    objc_msgSend(v11, "setTextAlternatives:", v10);

    v14 = (id)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceInfo](self, "laneGuidanceInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "textAlternatives"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
    objc_msgSend(v13, "setTextAlternatives:", v12);

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NavPrimaryDrivingSignView;
    -[NavManeuverSignView _updateLabelText](&v15, "_updateLabelText");
  }
}

- (id)accessibilityIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self);
  return NSStringFromClass(v2);
}

- (void)clearContent
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NavPrimaryDrivingSignView;
  -[NavManeuverSignView clearContent](&v4, "clearContent");
  -[NavPrimaryDrivingSignView setLaneGuidanceInfo:](self, "setLaneGuidanceInfo:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  objc_msgSend(v3, "setLanes:", 0);

}

- (BOOL)debugHighlightLanes
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  v3 = objc_msgSend(v2, "debugHighlightLanes");

  return v3;
}

- (void)setDebugHighlightLanes:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  objc_msgSend(v4, "setDebugHighlightLanes:", v3);

}

- (UIView)viewForSecondarySignTextToAlignLeading
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  if ((objc_msgSend(v3, "isHidden") & 1) != 0)
  {

  }
  else
  {
    if (self->_laneGuidanceInfo)
    {
      v4 = -[NavPrimaryDrivingSignView highlightedLanesNotInVisibleRange](self, "highlightedLanesNotInVisibleRange");

      if ((v4 & 1) == 0)
        goto LABEL_9;
    }
    else
    {

    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
    v6 = objc_msgSend(v5, "isHidden");

    if ((v6 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
      return (UIView *)v9;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
    v8 = objc_msgSend(v7, "isHidden");

    if ((v8 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
      return (UIView *)v9;
    }
  }
LABEL_9:
  v9 = 0;
  return (UIView *)v9;
}

- (BOOL)highlightedLanesNotInVisibleRange
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceInfo](self, "laneGuidanceInfo"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
    v5 = objc_msgSend(v4, "highlightedLanesNotInVisibleRange");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)updateLaneGuidance:(id)a3
{
  objc_storeStrong((id *)&self->_laneGuidanceInfo, a3);
  -[NavPrimaryDrivingSignView refreshSign](self, "refreshSign");
}

- (void)showLaneGuidance:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t Log;
  NSObject *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  NSString *v27;
  void *v28;
  void *v29;
  NSString *v30;
  void *v31;
  int v32;
  _BYTE v33[14];
  __int16 v34;
  void *v35;
  NSRange v36;
  NSRange v37;

  v4 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lanes"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "laneInfoId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceInfo](self, "laneGuidanceInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "laneInfoId"));
    v13 = objc_msgSend(v10, "isEqual:", v12);

    if (v13)
    {
      Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsNavSigns");
      v15 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v32 = 138412290;
        *(_QWORD *)v33 = v7;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Lane guidance %@ already showing.", (uint8_t *)&v32, 0xCu);
      }
      goto LABEL_16;
    }
    v15 = objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceInfo](self, "laneGuidanceInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lanes](v15, "lanes"));
    if (objc_msgSend(v16, "count"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
      v18 = objc_msgSend(v17, "isHidden") ^ 1;

    }
    else
    {
      v18 = 0;
    }

    objc_storeStrong((id *)&self->_laneGuidanceInfo, a3);
    if (v4)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lanes"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
      objc_msgSend(v20, "setLanes:", v19);

      -[NavPrimaryDrivingSignView _updateLabelText](self, "_updateLabelText");
      if (!-[NavPrimaryDrivingSignView highlightedLanesNotInVisibleRange](self, "highlightedLanesNotInVisibleRange"))
      {
        if (v18)
          -[NavPrimaryDrivingSignView _animateTransitioningFromOldLaneGuidance:](self, "_animateTransitioningFromOldLaneGuidance:", v15);
        else
          -[NavPrimaryDrivingSignView _animateShowingLaneGuidanceView](self, "_animateShowingLaneGuidanceView");
        goto LABEL_16;
      }
    }
    else
    {
      -[NavPrimaryDrivingSignView refreshSign](self, "refreshSign");
      if (!-[NavPrimaryDrivingSignView highlightedLanesNotInVisibleRange](self, "highlightedLanesNotInVisibleRange"))
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    v21 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsNavSigns");
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lanes"));
      v25 = objc_msgSend(v24, "count");
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
      v36.location = (NSUInteger)objc_msgSend(v26, "highlightedLaneRange");
      v27 = NSStringFromRange(v36);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
      v37.location = (NSUInteger)objc_msgSend(v29, "visibleLaneRange");
      v30 = NSStringFromRange(v37);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v32 = 67109634;
      *(_DWORD *)v33 = v25;
      *(_WORD *)&v33[4] = 2112;
      *(_QWORD *)&v33[6] = v28;
      v34 = 2112;
      v35 = v31;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Visual lane guidance suppressed: %d total lanes, highlighted lanes range = %@, visible lanes range = %@", (uint8_t *)&v32, 0x1Cu);

    }
    goto LABEL_16;
  }
LABEL_17:

}

- (void)hideLaneGuidanceAnimated:(BOOL)a3
{
  unsigned int v5;
  NavSignLaneGuidanceInfo *laneGuidanceInfo;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];

  if (self->_laneGuidanceInfo)
  {
    v5 = -[NavPrimaryDrivingSignView highlightedLanesNotInVisibleRange](self, "highlightedLanesNotInVisibleRange");
    laneGuidanceInfo = self->_laneGuidanceInfo;
    self->_laneGuidanceInfo = 0;

    if (a3)
    {
      -[NavPrimaryDrivingSignView _updateLabelText](self, "_updateLabelText");
      if (v5)
      {
        v7 = (id)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
        objc_msgSend(v7, "setLanes:", 0);

      }
      else
      {
        -[NavPrimaryDrivingSignView setAnimatingToHideLaneGuidanceView:](self, "setAnimatingToHideLaneGuidanceView:", 1);
        -[NavPrimaryDrivingSignView setNeedsLayout](self, "setNeedsLayout");
        v8[4] = self;
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_10077AA40;
        v9[3] = &unk_1011AC860;
        v9[4] = self;
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_10077AA48;
        v8[3] = &unk_1011AE8F8;
        +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v9, v8, 0.699999988);
      }
    }
    else
    {
      -[NavPrimaryDrivingSignView refreshSign](self, "refreshSign");
    }
  }
}

- (void)_animateShowingLaneGuidanceView
{
  void *v3;
  void *v4;
  void *v5;
  double MaxY;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  NavPrimaryDrivingSignView *v16;
  _QWORD v17[5];
  CGRect v18;
  CGRect v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  objc_msgSend(v3, "setHidden:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  objc_msgSend(v4, "setNeedsLayout");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  objc_msgSend(v5, "layoutIfNeeded");

  -[NavManeuverSignView setAnimatingToHideManeuverView:](self, "setAnimatingToHideManeuverView:", 1);
  -[NavPrimaryDrivingSignView frame](self, "frame");
  MaxY = CGRectGetMaxY(v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  objc_msgSend(v7, "frame");
  v8 = MaxY - CGRectGetMaxY(v19);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView bottomAnchor](self, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -v8));

  objc_msgSend(v12, "setActive:", 1);
  -[NavPrimaryDrivingSignView setNeedsLayout](self, "setNeedsLayout");
  v16 = self;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10077AC58;
  v17[3] = &unk_1011AC860;
  v17[4] = self;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10077AC60;
  v14[3] = &unk_1011ACCB8;
  v15 = v12;
  v13 = v12;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v17, v14, 0.699999988);

}

- (void)_animateTransitioningFromOldLaneGuidance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  _QWORD v28[4];
  id v29;
  NavPrimaryDrivingSignView *v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  uint64_t v36;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "duplicateLaneGuidanceView"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lanes"));
  objc_msgSend(v6, "setLanes:", v7);

  objc_msgSend(v6, "setNeedsLayout");
  objc_msgSend(v6, "layoutIfNeeded");
  -[NavPrimaryDrivingSignView addSubview:](self, "addSubview:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  objc_msgSend(v8, "setNeedsLayout");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  objc_msgSend(v9, "layoutIfNeeded");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  objc_msgSend(v10, "setAlpha:", 0.0);

  objc_msgSend(v6, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = objc_msgSend(v6, "numberOfVisibleLanes");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  v21 = (double)(unint64_t)(v19 - (_BYTE *)objc_msgSend(v20, "numberOfVisibleLanes"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceView](self, "laneGuidanceView"));
  objc_msgSend(v22, "availableLaneWidth");
  v24 = v23 * v21;

  v25 = v16 + v24;
  if (v24 == 0.0)
    v26 = 0.0;
  else
    v26 = 0.5;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10077AEC0;
  v31[3] = &unk_1011AFFE8;
  v32 = v6;
  v33 = v12;
  v34 = v14;
  v35 = v25;
  v36 = v18;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10077AED0;
  v28[3] = &unk_1011ACCB8;
  v29 = v32;
  v30 = self;
  v27 = v32;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v31, v28, v26);

}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NavPrimaryDrivingSignView;
  v3 = -[NavManeuverSignView debugDescription](&v8, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavPrimaryDrivingSignView laneGuidanceInfo](self, "laneGuidanceInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\nLane Guidance: [%@]"), v4, v5));

  return v6;
}

- (NavSignLaneGuidanceInfo)laneGuidanceInfo
{
  return self->_laneGuidanceInfo;
}

- (void)setLaneGuidanceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_laneGuidanceInfo, a3);
}

- (NavSignLaneGuidanceView)laneGuidanceView
{
  return self->_laneGuidanceView;
}

- (NSLayoutConstraint)laneGuidanceViewTopMarginConstraint
{
  return self->_laneGuidanceViewTopMarginConstraint;
}

- (NSLayoutConstraint)laneGuidanceViewLeadingMarginConstraint
{
  return self->_laneGuidanceViewLeadingMarginConstraint;
}

- (NSLayoutConstraint)laneGuidanceViewTrailingMarginConstraint
{
  return self->_laneGuidanceViewTrailingMarginConstraint;
}

- (NSLayoutConstraint)laneGuidanceViewMajorLabelConstraint
{
  return self->_laneGuidanceViewMajorLabelConstraint;
}

- (BOOL)animatingToHideLaneGuidanceView
{
  return self->_animatingToHideLaneGuidanceView;
}

- (void)setAnimatingToHideLaneGuidanceView:(BOOL)a3
{
  self->_animatingToHideLaneGuidanceView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_laneGuidanceViewMajorLabelConstraint, 0);
  objc_storeStrong((id *)&self->_laneGuidanceViewTrailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_laneGuidanceViewLeadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_laneGuidanceViewTopMarginConstraint, 0);
  objc_storeStrong((id *)&self->_laneGuidanceView, 0);
  objc_storeStrong((id *)&self->_laneGuidanceInfo, 0);
}

@end
