@implementation RCPlatterTimeView

- (RCPlatterTimeView)initWithPresentationStyle:(unint64_t)a3
{
  RCPlatterTimeView *v4;
  RCPlatterTimeView *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;
  void *v12;

  v11.receiver = self;
  v11.super_class = (Class)RCPlatterTimeView;
  v4 = -[RCPlatterTimeView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    -[RCPlatterTimeView setPresentationStyle:](v4, "setPresentationStyle:", a3);
    -[RCPlatterTimeView _setupSubviews](v5, "_setupSubviews");
    v6 = objc_opt_self(UITraitPreferredContentSizeCategory);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v12 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    v9 = -[RCPlatterTimeView registerForTraitChanges:withAction:](v5, "registerForTraitChanges:withAction:", v8, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v5;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RCPlatterTimeView;
  -[RCPlatterTimeView layoutSubviews](&v3, "layoutSubviews");
  -[RCPlatterTimeView _constrainTimeLabelTopToObstructedAreaBottomIfNeeded](self, "_constrainTimeLabelTopToObstructedAreaBottomIfNeeded");
}

- (void)setState:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  if (self->_state != a3)
  {
    self->_state = a3;
    if (a3 != 2)
    {
      if (a3 == 1)
      {
        -[RCPlatterTimeView _showTimeLabel](self, "_showTimeLabel");
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView stopButton](self, "stopButton"));
        objc_msgSend(v10, "setState:", 1);

        -[RCPlatterTimeView _showStopButton](self, "_showStopButton");
      }
      else if (!a3)
      {
        -[RCPlatterTimeView _showTimeLabel](self, "_showTimeLabel");
        -[RCPlatterTimeView _hideStopButton](self, "_hideStopButton");
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView stopButton](self, "stopButton"));
        objc_msgSend(v4, "setState:", 0);
LABEL_14:

      }
      -[RCPlatterTimeView _updateLabelFont](self, "_updateLabelFont");
      return;
    }
    if (!-[RCPlatterTimeView presentationStyle](self, "presentationStyle"))
      -[RCPlatterTimeView _hideTimeLabel](self, "_hideTimeLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView systemApertureElementContext](self, "systemApertureElementContext"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transitionContext"));

    if (v4 && objc_msgSend(v4, "fromLayoutMode") == (id)4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
      objc_msgSend(v6, "platterEmptyViewToCheckmarkTransitionDuration");
      v8 = v7;

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView stopButton](self, "stopButton"));
      objc_msgSend(v9, "transitionToState:viaState:transitionDuration:", 2, 0, v8);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView stopButton](self, "stopButton"));
      objc_msgSend(v9, "setState:", 2);
    }

    -[RCPlatterTimeView _showStopButton](self, "_showStopButton");
    goto LABEL_14;
  }
}

- (void)updateTime:(double)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  id v16;

  v5 = RCLocalizedDuration(self, a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView currentTimeLabel](self, "currentTimeLabel"));
  objc_msgSend(v7, "setText:", v6);

  v8 = UIAXTimeStringForDuration(floor(a3));
  v16 = (id)objc_claimAutoreleasedReturnValue(v8);
  v9 = AXLocalizeDurationTime();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView currentTimeLabel](self, "currentTimeLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accessibilityValue"));
  v13 = objc_msgSend(v10, "isEqualToString:", v12);

  if ((v13 & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView currentTimeLabel](self, "currentTimeLabel"));
    objc_msgSend(v14, "setAccessibilityValue:", v10);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView delegate](self, "delegate"));
    objc_msgSend(v15, "accessibilityValueDidChange");

  }
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  -[RCPlatterTimeView _updateLabelFont](self, "_updateLabelFont", a3, a4);
}

- (void)_setupSubviews
{
  void *v3;
  double v4;
  double v5;
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
  double v26;
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
  double v41;
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
  _QWORD v56[10];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView _createCurrentTimeLabel](self, "_createCurrentTimeLabel"));
  -[RCPlatterTimeView setCurrentTimeLabel:](self, "setCurrentTimeLabel:", v3);
  LODWORD(v4) = 1144750080;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 0, v4);
  LODWORD(v5) = 1148846080;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView _createStopButton](self, "_createStopButton"));
  -[RCPlatterTimeView setStopButton:](self, "setStopButton:", v6);
  -[RCPlatterTimeView addSubview:](self, "addSubview:", v6);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView trailingAnchor](self, "trailingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerYAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView centerYAnchor](self, "centerYAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView topAnchor](self, "topAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintGreaterThanOrEqualToAnchor:", v12));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView leadingAnchor](self, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  -[RCPlatterTimeView setStopButtonToLeadingConstraint:](self, "setStopButtonToLeadingConstraint:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToConstant:", 0.0));
  -[RCPlatterTimeView setStopButtonHeightConstraint:](self, "setStopButtonHeightConstraint:", v17);

  v54 = v6;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToConstant:", 0.0));
  -[RCPlatterTimeView setStopButtonWidthConstraint:](self, "setStopButtonWidthConstraint:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView stopButton](self, "stopButton"));
  objc_msgSend(v20, "setAlpha:", 0.0);

  -[RCPlatterTimeView addSubview:](self, "addSubview:", v3);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_tightBoundingBoxLayoutGuide"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView leadingAnchor](self, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
  -[RCPlatterTimeView setTimeLabelToLeadingConstraint:](self, "setTimeLabelToLeadingConstraint:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView timeLabelToLeadingConstraint](self, "timeLabelToLeadingConstraint"));
  LODWORD(v26) = 1148846080;
  objc_msgSend(v25, "setPriority:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView topAnchor](self, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintGreaterThanOrEqualToAnchor:", v28));
  -[RCPlatterTimeView setTimeLabelTopToTopConstraint:](self, "setTimeLabelTopToTopConstraint:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_tightBoundingBoxLayoutGuide"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView SBUISA_systemApertureObstructedAreaLayoutGuide](self, "SBUISA_systemApertureObstructedAreaLayoutGuide"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v33));
  -[RCPlatterTimeView setTimeLabelTopToObstructedAreaBottomConstraint:](self, "setTimeLabelTopToObstructedAreaBottomConstraint:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerYAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView centerYAnchor](self, "centerYAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v36));
  -[RCPlatterTimeView setTimeLabelCenterYConstraint:](self, "setTimeLabelCenterYConstraint:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "heightAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView heightAnchor](self, "heightAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));

  LODWORD(v41) = 1132003328;
  objc_msgSend(v40, "setPriority:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, 0.0));
  -[RCPlatterTimeView setTimeLabelToStopButtonConstraint:](self, "setTimeLabelToStopButtonConstraint:", v44);

  v56[0] = v55;
  v56[1] = v53;
  v56[2] = v52;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView stopButtonHeightConstraint](self, "stopButtonHeightConstraint"));
  v56[3] = v45;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView stopButtonWidthConstraint](self, "stopButtonWidthConstraint"));
  v56[4] = v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView timeLabelToLeadingConstraint](self, "timeLabelToLeadingConstraint"));
  v56[5] = v47;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView timeLabelTopToTopConstraint](self, "timeLabelTopToTopConstraint"));
  v56[6] = v48;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView timeLabelCenterYConstraint](self, "timeLabelCenterYConstraint"));
  v56[7] = v49;
  v56[8] = v40;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView timeLabelToStopButtonConstraint](self, "timeLabelToStopButtonConstraint"));
  v56[9] = v50;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 10));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v51);

}

- (NSLayoutXAxisAnchor)trailingCustomConcentricLayoutAnchor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView stopButton](self, "stopButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "centerXAnchor"));

  return (NSLayoutXAxisAnchor *)v3;
}

- (id)_createCurrentTimeLabel
{
  RCTimeLabel *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(RCTimeLabel);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView _labelFontForState:presentationStyle:](self, "_labelFontForState:presentationStyle:", -[RCPlatterTimeView state](self, "state"), -[RCPlatterTimeView presentationStyle](self, "presentationStyle")));
  -[RCTimeLabel setFont:](v3, "setFont:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView _labelTextColorForState:presentationStyle:](self, "_labelTextColorForState:presentationStyle:", -[RCPlatterTimeView state](self, "state"), -[RCPlatterTimeView presentationStyle](self, "presentationStyle")));
  -[RCTimeLabel setTextColor:](v3, "setTextColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CURRENT_POSITION"), &stru_1001B2BC0, 0));
  -[RCTimeLabel setAccessibilityLabel:](v3, "setAccessibilityLabel:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCTimeLabel layer](v3, "layer"));
  objc_msgSend(v8, "setAllowsHitTesting:", 0);

  return v3;
}

- (id)_createStopButton
{
  RCPlatterStopButton *v3;

  v3 = -[RCPlatterStopButton initWithFrame:]([RCPlatterStopButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[RCPlatterStopButton setDelegate:](v3, "setDelegate:", self);
  return v3;
}

- (void)_updateLabelFont
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView _labelFontForState:presentationStyle:](self, "_labelFontForState:presentationStyle:", -[RCPlatterTimeView state](self, "state"), -[RCPlatterTimeView presentationStyle](self, "presentationStyle")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView currentTimeLabel](self, "currentTimeLabel"));
  objc_msgSend(v4, "setFont:", v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView _labelTextColorForState:presentationStyle:](self, "_labelTextColorForState:presentationStyle:", -[RCPlatterTimeView state](self, "state"), -[RCPlatterTimeView presentationStyle](self, "presentationStyle")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView currentTimeLabel](self, "currentTimeLabel"));
  objc_msgSend(v5, "setTextColor:", v6);

}

- (id)_labelFontForState:(unint64_t)a3 presentationStyle:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView traitCollection](self, "traitCollection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v8 = v7;
  if (a3 == 1 || a3 == 2 && a4 == 1)
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "platterTimeLabelCustomModeFontForTraitCollection:", v6));
  else
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "platterTimeLabelCompactModeFontForTraitCollection:", v6));
  v10 = (void *)v9;

  return v10;
}

- (id)_labelTextColorForState:(unint64_t)a3 presentationStyle:(unint64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v7 = v6;
  if (a3 == 2 && a4 == 1)
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "platterStatusMessageStateTimeLabelColor"));
  else
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "platterDefaultTimeLabelColor"));
  v9 = (void *)v8;

  return v9;
}

- (void)_showStopButton
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  BOOL IsEmpty;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  CGRect v18;

  v17 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v17, "platterStopButtonHeight");
  v4 = v3;
  -[RCPlatterTimeView SBUISA_standardInteritemPadding](self, "SBUISA_standardInteritemPadding");
  v6 = v5;
  if ((id)-[RCPlatterTimeView state](self, "state") == (id)2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView SBUISA_systemApertureObstructedAreaLayoutGuide](self, "SBUISA_systemApertureObstructedAreaLayoutGuide"));
    objc_msgSend(v7, "layoutFrame");
    IsEmpty = CGRectIsEmpty(v18);

    if (!IsEmpty)
    {
      objc_msgSend(v17, "platterCheckmarkHeightMultiplier");
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView SBUISA_systemApertureObstructedAreaLayoutGuide](self, "SBUISA_systemApertureObstructedAreaLayoutGuide"));
      objc_msgSend(v11, "layoutFrame");
      v4 = v10 * v12;

      v6 = 0.0;
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView stopButtonWidthConstraint](self, "stopButtonWidthConstraint"));
  objc_msgSend(v13, "setConstant:", v4);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView stopButtonHeightConstraint](self, "stopButtonHeightConstraint"));
  objc_msgSend(v14, "setConstant:", v4);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView timeLabelToStopButtonConstraint](self, "timeLabelToStopButtonConstraint"));
  objc_msgSend(v15, "setConstant:", v6);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView stopButton](self, "stopButton"));
  objc_msgSend(v16, "setAlpha:", 1.0);

}

- (void)_hideStopButton
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView stopButtonWidthConstraint](self, "stopButtonWidthConstraint"));
  objc_msgSend(v3, "setConstant:", 0.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView stopButtonHeightConstraint](self, "stopButtonHeightConstraint"));
  objc_msgSend(v4, "setConstant:", 0.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView timeLabelToStopButtonConstraint](self, "timeLabelToStopButtonConstraint"));
  objc_msgSend(v5, "setConstant:", 0.0);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView stopButton](self, "stopButton"));
  objc_msgSend(v6, "setAlpha:", 0.0);

}

- (void)_showTimeLabel
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView currentTimeLabel](self, "currentTimeLabel"));
  v4 = objc_msgSend(v3, "isHidden");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView currentTimeLabel](self, "currentTimeLabel"));
    objc_msgSend(v5, "setHidden:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView timeLabelToLeadingConstraint](self, "timeLabelToLeadingConstraint"));
    objc_msgSend(v6, "setActive:", 1);

    v7 = (id)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView stopButtonToLeadingConstraint](self, "stopButtonToLeadingConstraint"));
    objc_msgSend(v7, "setActive:", 0);

  }
}

- (void)_hideTimeLabel
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView currentTimeLabel](self, "currentTimeLabel"));
  v4 = objc_msgSend(v3, "isHidden");

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView currentTimeLabel](self, "currentTimeLabel"));
    objc_msgSend(v5, "setHidden:", 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView timeLabelToLeadingConstraint](self, "timeLabelToLeadingConstraint"));
    objc_msgSend(v6, "setActive:", 0);

    v7 = (id)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView stopButtonToLeadingConstraint](self, "stopButtonToLeadingConstraint"));
    objc_msgSend(v7, "setActive:", 1);

  }
}

- (void)_constrainTimeLabelTopToObstructedAreaBottomIfNeeded
{
  void *v3;
  unsigned __int8 v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double width;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView currentTimeLabel](self, "currentTimeLabel"));
  v4 = objc_msgSend(v3, "isHidden");

  if ((v4 & 1) == 0)
  {
    -[RCPlatterTimeView _currentTimeLabelTightFrame](self, "_currentTimeLabelTightFrame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView SBUISA_systemApertureObstructedAreaLayoutGuide](self, "SBUISA_systemApertureObstructedAreaLayoutGuide"));
    objc_msgSend(v13, "layoutFrame");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    v29.origin.x = v6;
    v29.origin.y = v8;
    v29.size.width = v10;
    v29.size.height = v12;
    v31.origin.x = v15;
    v31.origin.y = v17;
    v31.size.width = v19;
    v31.size.height = v21;
    v30 = CGRectIntersection(v29, v31);
    width = v30.size.width;
    v23 = -[RCPlatterTimeView state](self, "state", v30.origin.x, v30.origin.y);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView timeLabelTopToObstructedAreaBottomConstraint](self, "timeLabelTopToObstructedAreaBottomConstraint"));
    v25 = v24;
    if (v23 == 1 && width > 0.0)
    {
      objc_msgSend(v24, "setActive:", 1);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView timeLabelCenterYConstraint](self, "timeLabelCenterYConstraint"));
      v28 = v26;
      v27 = 0;
    }
    else
    {
      objc_msgSend(v24, "setActive:", 0);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView timeLabelCenterYConstraint](self, "timeLabelCenterYConstraint"));
      v28 = v26;
      v27 = 1;
    }
    objc_msgSend(v26, "setActive:", v27);

  }
}

- (CGRect)_currentTimeLabelTightFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView currentTimeLabel](self, "currentTimeLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_tightBoundingBoxLayoutGuide"));
  objc_msgSend(v4, "layoutFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView currentTimeLabel](self, "currentTimeLabel"));
  objc_msgSend(v13, "convertRect:toView:", self, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)didTapOnStopButton:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView delegate](self, "delegate", a3));
  objc_msgSend(v3, "didTapStopRecordingButton");

}

- (id)accessibilityLabel
{
  id v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  if (-[RCPlatterTimeView state](self, "state"))
  {
    v10.receiver = self;
    v10.super_class = (Class)RCPlatterTimeView;
    v3 = -[RCPlatterTimeView accessibilityLabel](&v10, "accessibilityLabel");
    return (id)objc_claimAutoreleasedReturnValue(v3);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView currentTimeLabel](self, "currentTimeLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessibilityLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView currentTimeLabel](self, "currentTimeLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessibilityValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@"), v6, v8));

    return v9;
  }
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView currentTimeLabel](self, "currentTimeLabel"));
  v7[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterTimeView stopButton](self, "stopButton"));
  v7[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));

  return v5;
}

- (RCPlatterTimeViewDelegate)delegate
{
  return (RCPlatterTimeViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(unint64_t)a3
{
  self->_presentationStyle = a3;
}

- (RCTimeLabel)currentTimeLabel
{
  return self->_currentTimeLabel;
}

- (void)setCurrentTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_currentTimeLabel, a3);
}

- (RCPlatterStopButton)stopButton
{
  return self->_stopButton;
}

- (void)setStopButton:(id)a3
{
  objc_storeStrong((id *)&self->_stopButton, a3);
}

- (NSLayoutConstraint)timeLabelToLeadingConstraint
{
  return self->_timeLabelToLeadingConstraint;
}

- (void)setTimeLabelToLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabelToLeadingConstraint, a3);
}

- (NSLayoutConstraint)timeLabelToStopButtonConstraint
{
  return self->_timeLabelToStopButtonConstraint;
}

- (void)setTimeLabelToStopButtonConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabelToStopButtonConstraint, a3);
}

- (NSLayoutConstraint)timeLabelTopToTopConstraint
{
  return self->_timeLabelTopToTopConstraint;
}

- (void)setTimeLabelTopToTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabelTopToTopConstraint, a3);
}

- (NSLayoutConstraint)timeLabelTopToObstructedAreaBottomConstraint
{
  return self->_timeLabelTopToObstructedAreaBottomConstraint;
}

- (void)setTimeLabelTopToObstructedAreaBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabelTopToObstructedAreaBottomConstraint, a3);
}

- (NSLayoutConstraint)timeLabelCenterYConstraint
{
  return self->_timeLabelCenterYConstraint;
}

- (void)setTimeLabelCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabelCenterYConstraint, a3);
}

- (NSLayoutConstraint)stopButtonToLeadingConstraint
{
  return self->_stopButtonToLeadingConstraint;
}

- (void)setStopButtonToLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stopButtonToLeadingConstraint, a3);
}

- (NSLayoutConstraint)stopButtonWidthConstraint
{
  return self->_stopButtonWidthConstraint;
}

- (void)setStopButtonWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stopButtonWidthConstraint, a3);
}

- (NSLayoutConstraint)stopButtonHeightConstraint
{
  return self->_stopButtonHeightConstraint;
}

- (void)setStopButtonHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stopButtonHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_stopButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_stopButtonToLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_timeLabelCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_timeLabelTopToObstructedAreaBottomConstraint, 0);
  objc_storeStrong((id *)&self->_timeLabelTopToTopConstraint, 0);
  objc_storeStrong((id *)&self->_timeLabelToStopButtonConstraint, 0);
  objc_storeStrong((id *)&self->_timeLabelToLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_stopButton, 0);
  objc_storeStrong((id *)&self->_currentTimeLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
