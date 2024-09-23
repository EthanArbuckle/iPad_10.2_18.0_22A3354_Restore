@implementation NavTrayEndCell

- (NavTrayEndCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  NavTrayEndCell *v4;
  NavTrayEndCell *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  NSArray *buttonHeightConstraints;
  AxisAdjustingStackView *v11;
  AxisAdjustingStackView *buttonStackView;
  void *v13;
  UIButton *v14;
  UIButton *endRouteButton;
  double v16;
  UIButton *v17;
  UIButton *walkingRouteButton;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;
  _QWORD v39[4];

  v38.receiver = self;
  v38.super_class = (Class)NavTrayEndCell;
  v4 = -[NavTrayEndCell initWithStyle:reuseIdentifier:](&v38, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (objc_class *)objc_opt_class(v4);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[NavTrayEndCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[NavTrayEndCell setBackgroundColor:](v5, "setBackgroundColor:", v9);

    buttonHeightConstraints = v5->_buttonHeightConstraints;
    v5->_buttonHeightConstraints = (NSArray *)&__NSArray0__struct;

    v11 = -[AxisAdjustingStackView initWithFrame:]([AxisAdjustingStackView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    buttonStackView = v5->_buttonStackView;
    v5->_buttonStackView = v11;

    -[AxisAdjustingStackView setDelegate:](v5->_buttonStackView, "setDelegate:", v5);
    -[AxisAdjustingStackView setTranslatesAutoresizingMaskIntoConstraints:](v5->_buttonStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AxisAdjustingStackView setDistribution:](v5->_buttonStackView, "setDistribution:", 1);
    -[AxisAdjustingStackView setAlignment:](v5->_buttonStackView, "setAlignment:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayEndCell contentView](v5, "contentView"));
    objc_msgSend(v13, "addSubview:", v5->_buttonStackView);

    v14 = objc_opt_new(UIButton);
    endRouteButton = v5->_endRouteButton;
    v5->_endRouteButton = v14;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v5->_endRouteButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setAccessibilityIdentifier:](v5->_endRouteButton, "setAccessibilityIdentifier:", CFSTR("EndRouteButton"));
    LODWORD(v16) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v5->_endRouteButton, "setContentCompressionResistancePriority:forAxis:", 1, v16);
    -[AxisAdjustingStackView addArrangedTruncatableSubview:](v5->_buttonStackView, "addArrangedTruncatableSubview:", v5->_endRouteButton);
    v17 = objc_opt_new(UIButton);
    walkingRouteButton = v5->_walkingRouteButton;
    v5->_walkingRouteButton = v17;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v5->_walkingRouteButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setAccessibilityIdentifier:](v5->_walkingRouteButton, "setAccessibilityIdentifier:", CFSTR("WalkingRouteButton"));
    LODWORD(v19) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v5->_walkingRouteButton, "setContentCompressionResistancePriority:forAxis:", 1, v19);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[AxisAdjustingStackView topAnchor](v5->_buttonStackView, "topAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayEndCell contentView](v5, "contentView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "topAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
    v39[0] = v34;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[AxisAdjustingStackView bottomAnchor](v5->_buttonStackView, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayEndCell contentView](v5, "contentView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "bottomAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
    v39[1] = v30;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[AxisAdjustingStackView leadingAnchor](v5->_buttonStackView, "leadingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayEndCell contentView](v5, "contentView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
    v39[2] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[AxisAdjustingStackView trailingAnchor](v5->_buttonStackView, "trailingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayEndCell contentView](v5, "contentView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
    v39[3] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

  }
  return v5;
}

- (void)setMetrics:(id)a3
{
  NavTrayMetrics **p_metrics;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *buttonHeightConstraints;
  _QWORD v13[2];

  p_metrics = &self->_metrics;
  objc_storeStrong((id *)&self->_metrics, a3);
  v6 = a3;
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_buttonHeightConstraints);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_endRouteButton, "heightAnchor"));
  -[NavTrayMetrics endButtonHeight](*p_metrics, "endButtonHeight");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToConstant:"));
  v13[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_walkingRouteButton, "heightAnchor"));
  -[NavTrayMetrics endButtonHeight](*p_metrics, "endButtonHeight");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToConstant:"));
  v13[1] = v10;
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
  buttonHeightConstraints = self->_buttonHeightConstraints;
  self->_buttonHeightConstraints = v11;

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_buttonHeightConstraints);
  -[NavTrayMetrics actionButtonInterButtonPadding](*p_metrics, "actionButtonInterButtonPadding");
  -[AxisAdjustingStackView setSpacing:](self->_buttonStackView, "setSpacing:");
  -[AxisAdjustingStackView setNeedsLayout](self->_buttonStackView, "setNeedsLayout");

  -[NavTrayEndCell _updateButtonStyling](self, "_updateButtonStyling");
}

- (void)setButtonStylingDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_buttonStylingDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_buttonStylingDelegate, obj);
    -[NavTrayEndCell _updateButtonStyling](self, "_updateButtonStyling");
    v5 = obj;
  }

}

- (void)setHasWalkingETAInfo:(BOOL)a3
{
  AxisAdjustingStackView *buttonStackView;

  if (self->_hasWalkingETAInfo != a3)
  {
    self->_hasWalkingETAInfo = a3;
    buttonStackView = self->_buttonStackView;
    if (a3)
    {
      -[AxisAdjustingStackView insertArrangedTruncatableSubview:atIndex:](buttonStackView, "insertArrangedTruncatableSubview:atIndex:", self->_walkingRouteButton, 0);
    }
    else
    {
      -[AxisAdjustingStackView removeArrangedTruncatableSubview:](buttonStackView, "removeArrangedTruncatableSubview:", self->_walkingRouteButton);
      -[UIButton removeFromSuperview](self->_walkingRouteButton, "removeFromSuperview");
    }
    -[AxisAdjustingStackView setNeedsLayout](self->_buttonStackView, "setNeedsLayout");
    -[NavTrayEndCell _updateButtonStyling](self, "_updateButtonStyling");
  }
}

- (void)updateAlternateWalkingRouteDuration
{
  void *v3;

  if (self->_hasWalkingETAInfo)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayEndCell buttonStylingDelegate](self, "buttonStylingDelegate"));
    objc_msgSend(v3, "styleButton:ofType:", self->_walkingRouteButton, 6);

    -[AxisAdjustingStackView invalidateStackViewAxis](self->_buttonStackView, "invalidateStackViewAxis");
  }
}

- (void)_updateButtonStyling
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayEndCell buttonStylingDelegate](self, "buttonStylingDelegate"));
  objc_msgSend(v3, "styleButton:ofType:", self->_endRouteButton, 1);

  if (self->_hasWalkingETAInfo)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayEndCell buttonStylingDelegate](self, "buttonStylingDelegate"));
    objc_msgSend(v4, "styleButton:ofType:", self->_walkingRouteButton, 6);

  }
  -[AxisAdjustingStackView invalidateStackViewAxis](self->_buttonStackView, "invalidateStackViewAxis");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NavTrayEndCell;
  v4 = a3;
  -[NavTrayEndCell traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayEndCell traitCollection](self, "traitCollection", v9.receiver, v9.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v8 = sub_1002A8950(v6, v7);
  if (v8)
    -[NavTrayEndCell _updateButtonStyling](self, "_updateButtonStyling");
}

- (NavTrayMetrics)metrics
{
  return self->_metrics;
}

- (BOOL)hasWalkingETAInfo
{
  return self->_hasWalkingETAInfo;
}

- (NavTrayButtonStylingDelegate)buttonStylingDelegate
{
  return (NavTrayButtonStylingDelegate *)objc_loadWeakRetained((id *)&self->_buttonStylingDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_buttonStylingDelegate);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_buttonHeightConstraints, 0);
  objc_storeStrong((id *)&self->_walkingRouteButton, 0);
  objc_storeStrong((id *)&self->_endRouteButton, 0);
}

@end
