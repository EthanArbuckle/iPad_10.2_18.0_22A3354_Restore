@implementation TransitDirectionsBoardingInfoView

- (TransitDirectionsBoardingInfoView)initWithFrame:(CGRect)a3
{
  TransitDirectionsBoardingInfoView *v3;
  TransitDirectionsBoardingInfoView *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double y;
  double width;
  double height;
  MKMultiPartLabel *v16;
  MKMultiPartLabel *label;
  TransitDirectionsBoardingInfoView *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double left;
  double bottom;
  double right;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  MapsLargerHitTargetButton *button;
  uint64_t v30;
  MapsLargerHitTargetButton *v31;
  void *v32;
  void *v33;
  void *v34;
  MapsLargerHitTargetButton *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  TransitDirectionsOccupancyStatusView *v40;
  TransitDirectionsOccupancyStatusView *occupancyStatusView;
  double v42;
  double v43;
  TransitDirectionsExitPlanView *v44;
  TransitDirectionsExitPlanView *exitPlanView;
  double v46;
  double v47;
  id v48;
  void *v49;
  UIStackView *v50;
  UIStackView *labelAndButtonStackView;
  uint64_t v52;
  UIStackView *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  id v66;
  void *v67;
  UIStackView *v68;
  UIStackView *occupancyAndExitStackView;
  double v70;
  double v71;
  double v72;
  id v73;
  void *v74;
  id v75;
  uint64_t v76;
  double v77;
  double v78;
  double v79;
  double v80;
  uint64_t v81;
  HairlineView *trailingHairline;
  double v83;
  void *v84;
  double v85;
  void *v86;
  void *v87;
  objc_super v89;
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];

  v89.receiver = self;
  v89.super_class = (Class)TransitDirectionsBoardingInfoView;
  v3 = -[TransitDirectionsBoardingInfoView initWithFrame:](&v89, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[TransitDirectionsBoardingInfoView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    LODWORD(v8) = 1132068864;
    -[TransitDirectionsBoardingInfoView setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 0, v8);
    LODWORD(v9) = 1148846080;
    -[TransitDirectionsBoardingInfoView setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 1, v9);
    LODWORD(v10) = 1132068864;
    -[TransitDirectionsBoardingInfoView setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 0, v10);
    LODWORD(v11) = 1148846080;
    -[TransitDirectionsBoardingInfoView setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 1, v11);
    v12 = objc_alloc((Class)MKMultiPartLabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v16 = (MKMultiPartLabel *)objc_msgSend(v12, "initWithFrame:");
    label = v4->_label;
    v4->_label = v16;

    -[MKMultiPartLabel setAccessibilityIdentifier:](v4->_label, "setAccessibilityIdentifier:", CFSTR("Label"));
    -[MKMultiPartLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = v4;
    sub_1002A8AA0(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));

    -[MKMultiPartLabel setFont:](v4->_label, "setFont:", v19);
    if (sub_1002A8AA0(v18) == 5)
      v20 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    else
      v20 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v21 = (void *)v20;
    -[MKMultiPartLabel setHighlightedTextColor:](v4->_label, "setHighlightedTextColor:", v20);

    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    -[MKMultiPartLabel setTextInset:](v4->_label, "setTextInset:", UIEdgeInsetsZero.top, left, bottom, right);
    -[MKMultiPartLabel setUserInteractionEnabled:](v4->_label, "setUserInteractionEnabled:", 0);
    LODWORD(v25) = 1132068864;
    -[MKMultiPartLabel setContentHuggingPriority:forAxis:](v4->_label, "setContentHuggingPriority:forAxis:", 0, v25);
    LODWORD(v26) = 1148846080;
    -[MKMultiPartLabel setContentHuggingPriority:forAxis:](v4->_label, "setContentHuggingPriority:forAxis:", 1, v26);
    LODWORD(v27) = 1148846080;
    -[MKMultiPartLabel setContentCompressionResistancePriority:forAxis:](v4->_label, "setContentCompressionResistancePriority:forAxis:", 1, v27);
    if (sub_1002A8AA0(v18) == 5)
    {
      v28 = objc_claimAutoreleasedReturnValue(+[MapsLargerHitTargetButton buttonWithType:](MapsLargerHitTargetButton, "buttonWithType:", 0));
      button = v18->_button;
      v18->_button = (MapsLargerHitTargetButton *)v28;

      -[TransitDirectionsBoardingInfoView setHighlighted:](v18, "setHighlighted:", 0);
    }
    else
    {
      v30 = objc_claimAutoreleasedReturnValue(+[MapsLargerHitTargetButton buttonWithType:](MapsLargerHitTargetButton, "buttonWithType:", 1));
      v31 = v18->_button;
      v18->_button = (MapsLargerHitTargetButton *)v30;

    }
    -[MapsLargerHitTargetButton setAccessibilityIdentifier:](v18->_button, "setAccessibilityIdentifier:", CFSTR("Button"));
    -[MapsLargerHitTargetButton setTranslatesAutoresizingMaskIntoConstraints:](v18->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MapsLargerHitTargetButton setContentEdgeInsets:](v18->_button, "setContentEdgeInsets:", UIEdgeInsetsZero.top, left, bottom, right);
    -[MapsLargerHitTargetButton setTitleEdgeInsets:](v18->_button, "setTitleEdgeInsets:", UIEdgeInsetsZero.top, left, bottom, right);
    -[MapsLargerHitTargetButton setTouchInsets:](v18->_button, "setTouchInsets:", -2.0, -4.0, -2.0, -4.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MKMultiPartLabel font](v4->_label, "font"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton titleLabel](v18->_button, "titleLabel"));
    objc_msgSend(v33, "setFont:", v32);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton titleLabel](v18->_button, "titleLabel"));
    objc_msgSend(v34, "setAdjustsFontForContentSizeCategory:", 1);

    v35 = v18->_button;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    -[MapsLargerHitTargetButton setTitleColor:forState:](v35, "setTitleColor:forState:", v36, 2);

    LODWORD(v37) = 1148846080;
    -[MapsLargerHitTargetButton setContentHuggingPriority:forAxis:](v18->_button, "setContentHuggingPriority:forAxis:", 0, v37);
    LODWORD(v38) = 1148846080;
    -[MapsLargerHitTargetButton setContentHuggingPriority:forAxis:](v18->_button, "setContentHuggingPriority:forAxis:", 1, v38);
    LODWORD(v39) = 1148846080;
    -[MapsLargerHitTargetButton setContentCompressionResistancePriority:forAxis:](v18->_button, "setContentCompressionResistancePriority:forAxis:", 1, v39);
    v40 = -[TransitDirectionsOccupancyStatusView initWithFrame:]([TransitDirectionsOccupancyStatusView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    occupancyStatusView = v18->_occupancyStatusView;
    v18->_occupancyStatusView = v40;

    -[TransitDirectionsOccupancyStatusView setTranslatesAutoresizingMaskIntoConstraints:](v18->_occupancyStatusView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v42) = 1148846080;
    -[TransitDirectionsOccupancyStatusView setContentCompressionResistancePriority:forAxis:](v18->_occupancyStatusView, "setContentCompressionResistancePriority:forAxis:", 1, v42);
    LODWORD(v43) = 1148846080;
    -[TransitDirectionsOccupancyStatusView setContentHuggingPriority:forAxis:](v18->_occupancyStatusView, "setContentHuggingPriority:forAxis:", 1, v43);
    v44 = -[TransitDirectionsExitPlanView initWithFrame:]([TransitDirectionsExitPlanView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    exitPlanView = v18->_exitPlanView;
    v18->_exitPlanView = v44;

    -[TransitDirectionsExitPlanView setTranslatesAutoresizingMaskIntoConstraints:](v18->_exitPlanView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v46) = 1148846080;
    -[TransitDirectionsExitPlanView setContentCompressionResistancePriority:forAxis:](v18->_exitPlanView, "setContentCompressionResistancePriority:forAxis:", 1, v46);
    LODWORD(v47) = 1148846080;
    -[TransitDirectionsExitPlanView setContentHuggingPriority:forAxis:](v18->_exitPlanView, "setContentHuggingPriority:forAxis:", 1, v47);
    v48 = objc_alloc((Class)UIStackView);
    v92[0] = v4->_label;
    v92[1] = v18->_button;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v92, 2));
    v50 = (UIStackView *)objc_msgSend(v48, "initWithArrangedSubviews:", v49);
    labelAndButtonStackView = v18->_labelAndButtonStackView;
    v18->_labelAndButtonStackView = v50;

    -[UIStackView setAccessibilityIdentifier:](v18->_labelAndButtonStackView, "setAccessibilityIdentifier:", CFSTR("LabelAndButtonStackView"));
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v18->_labelAndButtonStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v52 = sub_1002A8AA0(v18);
    v53 = v18->_labelAndButtonStackView;
    if (v52 == 5)
    {
      -[UIStackView setAxis:](v53, "setAxis:", 1);
      -[UIStackView setAlignment:](v18->_labelAndButtonStackView, "setAlignment:", 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[MKMultiPartLabel font](v4->_label, "font"));
      objc_msgSend(v54, "descender");
      v56 = v55;
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[MKMultiPartLabel font](v4->_label, "font"));
      objc_msgSend(v57, "descender");
      if (v56 < 0.0)
        v59 = -v58;
      else
        v59 = v58;
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLargerHitTargetButton titleLabel](v18->_button, "titleLabel"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "font"));
      objc_msgSend(v61, "ascender");
      -[UIStackView setSpacing:](v18->_labelAndButtonStackView, "setSpacing:", v59 + v62 + 4.0);

    }
    else
    {
      -[UIStackView setAxis:](v53, "setAxis:", 0);
      -[UIStackView setAlignment:](v18->_labelAndButtonStackView, "setAlignment:", 2);
      -[UIStackView setSpacing:](v18->_labelAndButtonStackView, "setSpacing:", 24.0);
    }
    -[UIStackView setBaselineRelativeArrangement:](v18->_labelAndButtonStackView, "setBaselineRelativeArrangement:", v52 == 5);
    -[UIStackView setDistribution:](v18->_labelAndButtonStackView, "setDistribution:", 3);
    LODWORD(v63) = 1132068864;
    -[UIStackView setContentHuggingPriority:forAxis:](v18->_labelAndButtonStackView, "setContentHuggingPriority:forAxis:", 0, v63);
    LODWORD(v64) = 1148846080;
    -[UIStackView setContentHuggingPriority:forAxis:](v18->_labelAndButtonStackView, "setContentHuggingPriority:forAxis:", 1, v64);
    LODWORD(v65) = 1148846080;
    -[UIStackView setContentCompressionResistancePriority:forAxis:](v18->_labelAndButtonStackView, "setContentCompressionResistancePriority:forAxis:", 1, v65);
    v66 = objc_alloc((Class)UIStackView);
    v91[0] = v18->_occupancyStatusView;
    v91[1] = v18->_exitPlanView;
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v91, 2));
    v68 = (UIStackView *)objc_msgSend(v66, "initWithArrangedSubviews:", v67);
    occupancyAndExitStackView = v18->_occupancyAndExitStackView;
    v18->_occupancyAndExitStackView = v68;

    -[UIStackView setAccessibilityIdentifier:](v18->_occupancyAndExitStackView, "setAccessibilityIdentifier:", CFSTR("OccupancyAndExitStackView"));
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v18->_occupancyAndExitStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v18->_occupancyAndExitStackView, "setAxis:", 0);
    -[UIStackView setDistribution:](v18->_occupancyAndExitStackView, "setDistribution:", 1);
    -[UIStackView setAlignment:](v18->_occupancyAndExitStackView, "setAlignment:", 0);
    -[UIStackView setSpacing:](v18->_occupancyAndExitStackView, "setSpacing:", 20.0);
    LODWORD(v70) = 1132068864;
    -[UIStackView setContentHuggingPriority:forAxis:](v18->_occupancyAndExitStackView, "setContentHuggingPriority:forAxis:", 0, v70);
    LODWORD(v71) = 1148846080;
    -[UIStackView setContentHuggingPriority:forAxis:](v18->_occupancyAndExitStackView, "setContentHuggingPriority:forAxis:", 1, v71);
    LODWORD(v72) = 1148846080;
    -[UIStackView setContentCompressionResistancePriority:forAxis:](v18->_occupancyAndExitStackView, "setContentCompressionResistancePriority:forAxis:", 1, v72);
    v73 = objc_alloc((Class)UIStackView);
    v90[0] = v18->_labelAndButtonStackView;
    v90[1] = v18->_occupancyAndExitStackView;
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v90, 2));
    v75 = objc_msgSend(v73, "initWithArrangedSubviews:", v74);

    objc_msgSend(v75, "setAccessibilityIdentifier:", CFSTR("MainStackView"));
    objc_msgSend(v75, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v75, "setAxis:", 1);
    objc_msgSend(v75, "setDistribution:", 3);
    objc_msgSend(v75, "setAlignment:", 0);
    v76 = sub_1002A8AA0(v18);
    v77 = 8.0;
    if (v76 == 5)
      v77 = 3.0;
    objc_msgSend(v75, "setSpacing:", v77);
    LODWORD(v78) = 1132068864;
    objc_msgSend(v75, "setContentHuggingPriority:forAxis:", 0, v78);
    LODWORD(v79) = 1148846080;
    objc_msgSend(v75, "setContentHuggingPriority:forAxis:", 1, v79);
    LODWORD(v80) = 1148846080;
    objc_msgSend(v75, "setContentCompressionResistancePriority:forAxis:", 1, v80);
    -[TransitDirectionsBoardingInfoView addSubview:](v18, "addSubview:", v75);
    v81 = objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoView _maps_addHairlineAtTrailingWithMargin:](v18, "_maps_addHairlineAtTrailingWithMargin:", 0.0));
    trailingHairline = v18->_trailingHairline;
    v18->_trailingHairline = (HairlineView *)v81;

    LODWORD(v83) = 1148846080;
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "_maps_constraintsEqualToEdgesOfView:priority:", v18, v83));
    if (sub_1002A8AA0(v18) == 5)
      v85 = 0.0;
    else
      v85 = 5.0;
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "bottomConstraint"));
    objc_msgSend(v86, "setConstant:", v85);

    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v87);

    -[TransitDirectionsBoardingInfoView _updateLayout](v18, "_updateLayout");
  }
  return v4;
}

- (void)setPreferredLayout:(unint64_t)a3
{
  if (self->_preferredLayout != a3)
  {
    self->_preferredLayout = a3;
    -[TransitDirectionsBoardingInfoView _updateLayout](self, "_updateLayout");
  }
}

- (void)setForceVerticalAxis:(BOOL)a3
{
  if (self->_forceVerticalAxis != a3)
  {
    self->_forceVerticalAxis = a3;
    -[TransitDirectionsBoardingInfoView _updateLayout](self, "_updateLayout");
  }
}

- (BOOL)separatorHidden
{
  return -[HairlineView isHidden](self->_trailingHairline, "isHidden");
}

- (void)setSeparatorHidden:(BOOL)a3
{
  -[HairlineView setHidden:](self->_trailingHairline, "setHidden:", a3);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  MapsLargerHitTargetButton *button;
  uint64_t v6;
  id v7;

  v3 = a3;
  if (sub_1002A8AA0(self) == 5)
  {
    button = self->_button;
    if (v3)
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    else
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    v7 = (id)v6;
    -[MapsLargerHitTargetButton setTitleColor:forState:](button, "setTitleColor:forState:", v6, 0);

  }
}

- (unint64_t)resolvedLayout
{
  unint64_t result;

  result = self->_preferredLayout;
  if (!result)
  {
    LODWORD(result) = -[GEOTransitBoardingInfoEntry hasOccupancyInfo](self->_entry, "hasOccupancyInfo");
    if (self->_exitPlanInfo)
      return result | 2;
    else
      return result;
  }
  return result;
}

- (void)_updateLayout
{
  unint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];

  v3 = -[TransitDirectionsBoardingInfoView resolvedLayout](self, "resolvedLayout");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1009DCF90;
  v8[3] = &unk_1011DEBE8;
  v8[4] = v3;
  v4 = objc_retainBlock(v8);
  v5 = 1;
  -[TransitDirectionsOccupancyStatusView setHidden:](self->_occupancyStatusView, "setHidden:", ((unsigned int (*)(_QWORD *, uint64_t))v4[2])(v4, 1) ^ 1);
  if (v3 == 1)
    v5 = -[TransitDirectionsBoardingInfoView forceVerticalAxis](self, "forceVerticalAxis");
  -[TransitDirectionsBoardingInfoStackView setAxis:](self->_occupancyStatusView, "setAxis:", v5);
  -[TransitDirectionsExitPlanView setHidden:](self->_exitPlanView, "setHidden:", ((unsigned int (*)(_QWORD *, uint64_t))v4[2])(v4, 2) ^ 1);
  if (v3 == 2)
    v6 = -[TransitDirectionsBoardingInfoView forceVerticalAxis](self, "forceVerticalAxis");
  else
    v6 = 1;
  -[TransitDirectionsBoardingInfoStackView setAxis:](self->_exitPlanView, "setAxis:", v6);
  if (-[TransitDirectionsOccupancyStatusView isHidden](self->_occupancyStatusView, "isHidden"))
    v7 = -[TransitDirectionsExitPlanView isHidden](self->_exitPlanView, "isHidden");
  else
    v7 = 0;
  -[UIStackView setHidden:](self->_occupancyAndExitStackView, "setHidden:", v7);
  -[TransitDirectionsBoardingInfoView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (void)setBoardingInfoEntry:(id)a3 exitPlan:(id)a4
{
  id v7;
  id v8;
  GEOTransitBoardingInfoEntry *entry;
  id v10;
  unsigned int v11;
  GEOTransitExitPlanInfo *exitPlanInfo;
  unint64_t v13;
  id v14;
  void *v15;
  unsigned int v16;
  NSArray *preboardingStrings;
  unint64_t v18;

  v7 = a3;
  v8 = a4;
  entry = self->_entry;
  v18 = (unint64_t)v7;
  v10 = entry;
  if (v18 | (unint64_t)v10)
  {
    v11 = objc_msgSend((id)v18, "isEqual:", v10);

    if (!v11)
      goto LABEL_8;
  }
  exitPlanInfo = self->_exitPlanInfo;
  v13 = (unint64_t)v8;
  v14 = exitPlanInfo;
  if (v13 | (unint64_t)v14)
  {
    v15 = v14;
    v16 = objc_msgSend((id)v13, "isEqual:", v14);

    if (!v16)
    {
LABEL_8:
      objc_storeStrong((id *)&self->_entry, a3);
      objc_storeStrong((id *)&self->_exitPlanInfo, a4);
      preboardingStrings = self->_preboardingStrings;
      self->_preboardingStrings = 0;

LABEL_9:
      -[TransitDirectionsBoardingInfoView _refreshContent](self, "_refreshContent");
      goto LABEL_10;
    }
  }
  if (self->_entry || self->_exitPlanInfo)
    goto LABEL_9;
LABEL_10:

}

- (void)setPreboardingStrings:(id)a3
{
  id v5;
  NSArray *preboardingStrings;
  id v7;
  unsigned int v8;
  GEOTransitBoardingInfoEntry *entry;
  GEOTransitExitPlanInfo *exitPlanInfo;
  unint64_t v11;

  v5 = a3;
  preboardingStrings = self->_preboardingStrings;
  v11 = (unint64_t)v5;
  v7 = preboardingStrings;
  if (v11 | (unint64_t)v7
    && (v8 = objc_msgSend((id)v11, "isEqual:", v7), v7, (id)v11, !v8))
  {
    objc_storeStrong((id *)&self->_preboardingStrings, a3);
    entry = self->_entry;
    self->_entry = 0;

    exitPlanInfo = self->_exitPlanInfo;
    self->_exitPlanInfo = 0;

  }
  else if (!self->_preboardingStrings)
  {
    goto LABEL_7;
  }
  -[TransitDirectionsBoardingInfoView _refreshContent](self, "_refreshContent");
LABEL_7:

}

- (void)setUseAlternativeInstruction:(BOOL)a3
{
  if (self->_useAlternativeInstruction != a3)
  {
    self->_useAlternativeInstruction = a3;
    if (self->_entry)
      -[TransitDirectionsBoardingInfoView _refreshContent](self, "_refreshContent");
  }
}

- (void)setButtonTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8;
  BOOL v9;
  uint64_t v11;
  MapsLargerHitTargetButton *button;
  id v13;
  void *v14;
  id v15;

  v8 = a4;
  v15 = v8;
  if (a3)
    v9 = v8 == 0;
  else
    v9 = 1;
  v11 = v9 || a5 == 0;
  button = self->_button;
  v13 = a3;
  -[MapsLargerHitTargetButton setHidden:](button, "setHidden:", v11);
  -[MapsLargerHitTargetButton setTitle:forState:](self->_button, "setTitle:forState:", v13, 0);

  -[MapsLargerHitTargetButton removeTarget:action:forControlEvents:](self->_button, "removeTarget:action:forControlEvents:", 0, 0, 64);
  v14 = v15;
  if (v15 && a5)
  {
    -[MapsLargerHitTargetButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", v15, a5, 64);
    v14 = v15;
  }

}

- (void)_refreshContent
{
  GEOTransitBoardingInfoEntry *entry;
  GEOTransitBoardingInfoEntry *v4;
  GEOTransitExitPlanInfo *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSArray *preboardingStrings;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  unint64_t v49;
  GEOTransitExitPlanInfo *v50;
  GEOTransitExitPlanInfo *v51;
  MapsLargerHitTargetButton *button;
  void *v53;
  uint64_t v54;
  id v55;
  GEOTransitExitPlanInfo *exitPlanInfo;
  void *v57;
  void *v58;
  GEOTransitBoardingInfoEntry *v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[4];
  _QWORD v70[4];
  _QWORD v71[3];
  _QWORD v72[3];

  entry = self->_entry;
  if (entry)
  {
    v4 = entry;
    exitPlanInfo = self->_exitPlanInfo;
    v5 = exitPlanInfo;
    v59 = v4;
    if (-[TransitDirectionsBoardingInfoView useAlternativeInstruction](self, "useAlternativeInstruction")
      && (-[GEOTransitBoardingInfoEntry hasAlternativeTimeInstruction](v4, "hasAlternativeTimeInstruction") & 1) != 0)
    {
      v6 = objc_claimAutoreleasedReturnValue(-[GEOTransitBoardingInfoEntry alternativeTimeInstruction](v4, "alternativeTimeInstruction"));
    }
    else
    {
      v6 = objc_claimAutoreleasedReturnValue(-[GEOTransitBoardingInfoEntry mainTimeInstruction](v4, "mainTimeInstruction"));
    }
    v7 = (void *)v6;
    v8 = objc_alloc((Class)GEOComposedString);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "primaryText"));
    v60 = objc_msgSend(v8, "initWithGeoFormattedString:", v9);

    v10 = objc_alloc((Class)GEOComposedString);
    v58 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "secondaryText"));
    v55 = objc_msgSend(v10, "initWithGeoFormattedString:", v11);

    v12 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 5));
    v71[0] = NSFontAttributeName;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MKMultiPartLabel font](self->_label, "font"));
    v54 = MKServerFormattedStringArtworkSizeAttributeKey;
    v72[0] = v13;
    v72[1] = v12;
    v14 = MKServerFormattedStringArtworkLimitToFontAscenderAttributeKey;
    v71[1] = MKServerFormattedStringArtworkSizeAttributeKey;
    v71[2] = MKServerFormattedStringArtworkLimitToFontAscenderAttributeKey;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
    v72[2] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v72, v71, 3));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString _mapkit_attributedStringForComposedString:defaultAttributes:](NSAttributedString, "_mapkit_attributedStringForComposedString:defaultAttributes:", v60, v16));

    v69[0] = NSFontAttributeName;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MKMultiPartLabel font](self->_label, "font"));
    v70[0] = v18;
    v69[1] = NSForegroundColorAttributeName;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v70[1] = v19;
    v70[2] = v12;
    v57 = (void *)v12;
    v69[2] = v54;
    v69[3] = v14;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
    v70[3] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v70, v69, 4));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString _mapkit_attributedStringForComposedString:defaultAttributes:](NSAttributedString, "_mapkit_attributedStringForComposedString:defaultAttributes:", v55, v21));

    v23 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
    v24 = v23;
    if (v17)
      objc_msgSend(v23, "addObject:", v17);
    if (v22)
      objc_msgSend(v24, "addObject:", v22);
    if (objc_msgSend(v24, "count"))
    {
      v25 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[MKMultiPartAttributedString multiPartAttributedStringWithComponents:repeatedSeparator:](MKMultiPartAttributedString, "multiPartAttributedStringWithComponents:repeatedSeparator:", v24, v25));
      -[MKMultiPartLabel setMultiPartString:](self->_label, "setMultiPartString:", v26);

    }
    else
    {
      -[MKMultiPartLabel setMultiPartString:](self->_label, "setMultiPartString:", 0);
    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitBoardingInfoEntry occupancyInfo](v59, "occupancyInfo"));
    v42 = objc_msgSend(v41, "occupancyStatus");

    v43 = v42 - 1;
    if (v43 < 4)
      v44 = v43 + 1;
    else
      v44 = 0;
    -[TransitDirectionsOccupancyStatusView setOccupancyStatus:](self->_occupancyStatusView, "setOccupancyStatus:", v44);
    objc_storeStrong((id *)&self->_exitPlanInfo, exitPlanInfo);
    v45 = objc_alloc((Class)GEOComposedString);
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitExitPlanInfo label](v5, "label"));
    v47 = objc_msgSend(v45, "initWithGeoFormattedString:", v46);
    -[TransitDirectionsExitPlanView setText:](self->_exitPlanView, "setText:", v47);

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
    if (-[GEOTransitExitPlanInfo selectedCarIndexsCount](v5, "selectedCarIndexsCount"))
    {
      v49 = 0;
      do
        objc_msgSend(v48, "addIndex:", -[GEOTransitExitPlanInfo selectedCarIndexAtIndex:](v5, "selectedCarIndexAtIndex:", v49++));
      while (v49 < (unint64_t)-[GEOTransitExitPlanInfo selectedCarIndexsCount](v5, "selectedCarIndexsCount"));
    }
    -[TransitDirectionsExitPlanView setIndexSetOfSuggestedCars:](self->_exitPlanView, "setIndexSetOfSuggestedCars:", v48);
    -[TransitDirectionsExitPlanView setNumberOfCars:](self->_exitPlanView, "setNumberOfCars:", -[GEOTransitExitPlanInfo numberOfCars](v5, "numberOfCars"));

  }
  else if (self->_preboardingStrings)
  {
    v27 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 5));
    v67[0] = NSFontAttributeName;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MKMultiPartLabel font](self->_label, "font"));
    v30 = MKServerFormattedStringArtworkSizeAttributeKey;
    v67[1] = MKServerFormattedStringArtworkSizeAttributeKey;
    v68[0] = v29;
    v68[1] = v28;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v68, v67, 2));

    v65[0] = NSFontAttributeName;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MKMultiPartLabel font](self->_label, "font"));
    v66[0] = v32;
    v65[1] = NSForegroundColorAttributeName;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v65[2] = v30;
    v66[1] = v33;
    v66[2] = v28;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v66, v65, 3));

    preboardingStrings = self->_preboardingStrings;
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_1009DDA3C;
    v61[3] = &unk_1011DEC10;
    v36 = v31;
    v62 = v36;
    v37 = v34;
    v63 = v37;
    v38 = v27;
    v64 = v38;
    -[NSArray enumerateObjectsUsingBlock:](preboardingStrings, "enumerateObjectsUsingBlock:", v61);
    if (objc_msgSend(v38, "count"))
    {
      v39 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR("\n"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[MKMultiPartAttributedString multiPartAttributedStringWithComponents:repeatedSeparator:](MKMultiPartAttributedString, "multiPartAttributedStringWithComponents:repeatedSeparator:", v38, v39));
      -[MKMultiPartLabel setMultiPartString:](self->_label, "setMultiPartString:", v40);

    }
    else
    {
      -[MKMultiPartLabel setMultiPartString:](self->_label, "setMultiPartString:", 0);
    }
    -[TransitDirectionsOccupancyStatusView setOccupancyStatus:](self->_occupancyStatusView, "setOccupancyStatus:", 0);
    v51 = self->_exitPlanInfo;
    self->_exitPlanInfo = 0;

    -[TransitDirectionsExitPlanView setIndexSetOfSuggestedCars:](self->_exitPlanView, "setIndexSetOfSuggestedCars:", 0);
    -[TransitDirectionsExitPlanView setNumberOfCars:](self->_exitPlanView, "setNumberOfCars:", 0);

  }
  else
  {
    -[MKMultiPartLabel setMultiPartString:](self->_label, "setMultiPartString:", 0);
    -[TransitDirectionsOccupancyStatusView setOccupancyStatus:](self->_occupancyStatusView, "setOccupancyStatus:", 0);
    v50 = self->_exitPlanInfo;
    self->_exitPlanInfo = 0;

    -[TransitDirectionsExitPlanView setIndexSetOfSuggestedCars:](self->_exitPlanView, "setIndexSetOfSuggestedCars:", 0);
    -[TransitDirectionsExitPlanView setNumberOfCars:](self->_exitPlanView, "setNumberOfCars:", 0);
  }
  button = self->_button;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoView traitCollection](self, "traitCollection"));
  -[MapsLargerHitTargetButton setEnabled:](button, "setEnabled:", objc_msgSend(v53, "isLuminanceReduced") ^ 1);

  -[TransitDirectionsBoardingInfoView _updateLayout](self, "_updateLayout");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  unsigned int v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TransitDirectionsBoardingInfoView;
  v4 = a3;
  -[TransitDirectionsBoardingInfoView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoView traitCollection](self, "traitCollection", v9.receiver, v9.super_class));
  v6 = sub_1002A8A0C(v4, v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoView traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "isLuminanceReduced");

    -[MapsLargerHitTargetButton setEnabled:](self->_button, "setEnabled:", v8 ^ 1);
  }
}

- (GEOTransitBoardingInfoEntry)entry
{
  return self->_entry;
}

- (GEOTransitExitPlanInfo)exitPlanInfo
{
  return self->_exitPlanInfo;
}

- (NSArray)preboardingStrings
{
  return self->_preboardingStrings;
}

- (unint64_t)entryType
{
  return self->_entryType;
}

- (void)setEntryType:(unint64_t)a3
{
  self->_entryType = a3;
}

- (unint64_t)preferredLayout
{
  return self->_preferredLayout;
}

- (BOOL)forceVerticalAxis
{
  return self->_forceVerticalAxis;
}

- (BOOL)useAlternativeInstruction
{
  return self->_useAlternativeInstruction;
}

- (NSLayoutConstraint)fixedWidthConstraint
{
  return self->_fixedWidthConstraint;
}

- (void)setFixedWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_fixedWidthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedWidthConstraint, 0);
  objc_storeStrong((id *)&self->_preboardingStrings, 0);
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_trailingHairline, 0);
  objc_storeStrong((id *)&self->_exitPlanInfo, 0);
  objc_storeStrong((id *)&self->_occupancyAndExitStackView, 0);
  objc_storeStrong((id *)&self->_labelAndButtonStackView, 0);
  objc_storeStrong((id *)&self->_exitPlanView, 0);
  objc_storeStrong((id *)&self->_occupancyStatusView, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
