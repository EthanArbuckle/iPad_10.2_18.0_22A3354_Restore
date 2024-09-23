@implementation TKVibrationRecorderView

- (TKVibrationRecorderView)initWithVibrationPatternMaximumDuration:(double)a3
{
  TKVibrationRecorderView *v4;
  TKVibrationRecorderView *v5;
  TKStyleProvider *v6;
  TKVibrationRecorderStyleProvider *styleProvider;
  void *v8;
  void *v9;
  UIToolbar *v10;
  UIToolbar *bottomLineToolbar;
  double v12;
  uint64_t v13;
  NSLayoutConstraint *bottomLineToolbarBottomConstraint;
  UIToolbar *v15;
  UIToolbar *controlsToolbar;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  NSLayoutConstraint *controlsToolbarTopConstraint;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  NSLayoutConstraint *progressToolbarBottomConstraint;
  TKVibrationRecorderProgressView *v34;
  TKVibrationRecorderProgressView *progressView;
  double v36;
  double v37;
  void *v38;
  TKVibrationRecorderTouchSurface *v39;
  TKVibrationRecorderTouchSurface *touchSurface;
  uint64_t v41;
  NSLayoutConstraint *touchSurfaceTopConstraint;
  TKVibrationRecorderTouchSurface *v43;
  TKVibrationRecorderTouchSurface *v44;
  TKVibrationRecorderTouchSurface *v45;
  TKVibrationRecorderTouchSurface *v46;
  UILabel *v47;
  UILabel *instructionsLabel;
  UILabel *v49;
  void *v50;
  UILabel *v51;
  void *v52;
  UILabel *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  objc_super v70;

  v70.receiver = self;
  v70.super_class = (Class)TKVibrationRecorderView;
  v4 = -[TKVibrationRecorderView init](&v70, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_vibrationPatternMaximumDuration = a3;
    v6 = objc_alloc_init(TKStyleProvider);
    styleProvider = v5->_styleProvider;
    v5->_styleProvider = (TKVibrationRecorderStyleProvider *)v6;

    -[TKVibrationRecorderStyleProvider vibrationRecorderBarsBackgroundColor](v5->_styleProvider, "vibrationRecorderBarsBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKVibrationRecorderView setBackgroundColor:](v5, "setBackgroundColor:", v8);

    -[TKVibrationRecorderView safeAreaLayoutGuide](v5, "safeAreaLayoutGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (UIToolbar *)objc_alloc_init(MEMORY[0x24BDF6F10]);
    bottomLineToolbar = v5->_bottomLineToolbar;
    v5->_bottomLineToolbar = v10;

    -[UIToolbar setTranslatesAutoresizingMaskIntoConstraints:](v5->_bottomLineToolbar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TKVibrationRecorderView addSubview:](v5, "addSubview:", v5->_bottomLineToolbar);
    -[UIToolbar intrinsicContentSize](v5->_bottomLineToolbar, "intrinsicContentSize");
    -[UIToolbar tk_addedConstraintForLayoutAttribute:asEqualToValueOfItem:withOffset:](v5->_bottomLineToolbar, "tk_addedConstraintForLayoutAttribute:asEqualToValueOfItem:withOffset:", 4, v9, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    bottomLineToolbarBottomConstraint = v5->_bottomLineToolbarBottomConstraint;
    v5->_bottomLineToolbarBottomConstraint = (NSLayoutConstraint *)v13;

    -[UIToolbar tk_constrainLayoutAttribute:asEqualToValueOfItem:](v5->_bottomLineToolbar, "tk_constrainLayoutAttribute:asEqualToValueOfItem:", 1, v5);
    -[UIToolbar tk_constrainLayoutAttribute:asEqualToValueOfItem:](v5->_bottomLineToolbar, "tk_constrainLayoutAttribute:asEqualToValueOfItem:", 2, v5);
    v15 = (UIToolbar *)objc_alloc_init(MEMORY[0x24BDF6F10]);
    controlsToolbar = v5->_controlsToolbar;
    v5->_controlsToolbar = v15;

    -[UIToolbar setTranslatesAutoresizingMaskIntoConstraints:](v5->_controlsToolbar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TKVibrationRecorderView addSubview:](v5, "addSubview:", v5->_controlsToolbar);
    -[TKVibrationRecorderStyleProvider vibrationRecorderControlsToolbarVerticalOffset](v5->_styleProvider, "vibrationRecorderControlsToolbarVerticalOffset");
    v18 = v17;
    -[UIToolbar intrinsicContentSize](v5->_controlsToolbar, "intrinsicContentSize");
    v20 = v19;
    -[TKVibrationRecorderStyleProvider vibrationRecorderControlsToolbarAdditionalHeight](v5->_styleProvider, "vibrationRecorderControlsToolbarAdditionalHeight");
    v22 = v21;
    -[UIToolbar tk_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofItem:withOffset:](v5->_controlsToolbar, "tk_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofItem:withOffset:", 4, 3, v5->_bottomLineToolbar, v18);
    v23 = objc_claimAutoreleasedReturnValue();
    controlsToolbarTopConstraint = v5->_controlsToolbarTopConstraint;
    v5->_controlsToolbarTopConstraint = (NSLayoutConstraint *)v23;

    -[UIToolbar tk_constrainLayoutAttribute:asEqualToValueOfItem:](v5->_controlsToolbar, "tk_constrainLayoutAttribute:asEqualToValueOfItem:", 1, v5);
    -[UIToolbar tk_constrainLayoutAttribute:asEqualToValueOfItem:](v5->_controlsToolbar, "tk_constrainLayoutAttribute:asEqualToValueOfItem:", 2, v5);
    -[UIToolbar tk_constrainLayoutAttribute:asEqualToConstant:](v5->_controlsToolbar, "tk_constrainLayoutAttribute:asEqualToConstant:", 8, v20 + v22);
    v25 = objc_alloc_init(MEMORY[0x24BDF6F10]);
    objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TKVibrationRecorderView addSubview:](v5, "addSubview:", v25);
    -[TKVibrationRecorderStyleProvider vibrationRecorderProgressToolbarVerticalOffset](v5->_styleProvider, "vibrationRecorderProgressToolbarVerticalOffset");
    v27 = v26;
    objc_msgSend(v25, "intrinsicContentSize");
    v29 = v28;
    -[TKVibrationRecorderStyleProvider vibrationRecorderProgressToolbarAdditionalHeight](v5->_styleProvider, "vibrationRecorderProgressToolbarAdditionalHeight");
    v31 = v30;
    objc_msgSend(v25, "tk_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofItem:withOffset:", 4, 3, v5->_controlsToolbar, v27);
    v32 = objc_claimAutoreleasedReturnValue();
    progressToolbarBottomConstraint = v5->_progressToolbarBottomConstraint;
    v5->_progressToolbarBottomConstraint = (NSLayoutConstraint *)v32;

    objc_msgSend(v25, "tk_constrainLayoutAttribute:asEqualToValueOfItem:", 1, v5);
    objc_msgSend(v25, "tk_constrainLayoutAttribute:asEqualToValueOfItem:", 2, v5);
    objc_msgSend(v25, "tk_constrainLayoutAttribute:asEqualToConstant:", 8, v29 + v31);
    v34 = -[TKVibrationRecorderProgressView initWithMaximumTimeInterval:styleProvider:]([TKVibrationRecorderProgressView alloc], "initWithMaximumTimeInterval:styleProvider:", v5->_styleProvider, a3);
    progressView = v5->_progressView;
    v5->_progressView = v34;

    -[TKVibrationRecorderProgressView setTranslatesAutoresizingMaskIntoConstraints:](v5->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TKVibrationRecorderView addSubview:](v5, "addSubview:", v5->_progressView);
    -[TKVibrationRecorderStyleProvider vibrationRecorderProgressViewHorizontalOffsetFromEdge](v5->_styleProvider, "vibrationRecorderProgressViewHorizontalOffsetFromEdge");
    v37 = v36;
    -[UIView tk_constrainLayoutAttribute:asEqualToValueOfItem:withOffset:](v5->_progressView, "tk_constrainLayoutAttribute:asEqualToValueOfItem:withOffset:", 1, v9);
    -[UIView tk_constrainLayoutAttribute:asEqualToValueOfItem:withOffset:](v5->_progressView, "tk_constrainLayoutAttribute:asEqualToValueOfItem:withOffset:", 2, v9, -v37);
    -[UIView tk_constrainLayoutAttribute:asEqualToValueOfItem:](v5->_progressView, "tk_constrainLayoutAttribute:asEqualToValueOfItem:", 10, v25);
    TLLocalizedString();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[TKVibrationRecorderTouchSurface initWithVibrationPatternMaximumDuration:styleProvider:]([TKVibrationRecorderTouchSurface alloc], "initWithVibrationPatternMaximumDuration:styleProvider:", v5->_styleProvider, a3);
    touchSurface = v5->_touchSurface;
    v5->_touchSurface = v39;

    -[TKVibrationRecorderTouchSurface setDelegate:](v5->_touchSurface, "setDelegate:", v5);
    -[TKVibrationRecorderTouchSurface setAccessibilityHint:](v5->_touchSurface, "setAccessibilityHint:", v38);
    -[TKVibrationRecorderTouchSurface setTranslatesAutoresizingMaskIntoConstraints:](v5->_touchSurface, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TKVibrationRecorderView insertSubview:belowSubview:](v5, "insertSubview:belowSubview:", v5->_touchSurface, v5->_bottomLineToolbar);
    -[UIView tk_constrainLayoutAttribute:asEqualToValueOfItem:](v5->_touchSurface, "tk_constrainLayoutAttribute:asEqualToValueOfItem:", 1, v5);
    -[UIView tk_constrainLayoutAttribute:asEqualToValueOfItem:](v5->_touchSurface, "tk_constrainLayoutAttribute:asEqualToValueOfItem:", 2, v5);
    -[UIView tk_addedConstraintForLayoutAttribute:asEqualToValueOfItem:](v5->_touchSurface, "tk_addedConstraintForLayoutAttribute:asEqualToValueOfItem:", 3, v5);
    v41 = objc_claimAutoreleasedReturnValue();
    touchSurfaceTopConstraint = v5->_touchSurfaceTopConstraint;
    v5->_touchSurfaceTopConstraint = (NSLayoutConstraint *)v41;

    -[UIView tk_constrainLayoutAttribute:asEqualToLayoutAttribute:ofItem:](v5->_touchSurface, "tk_constrainLayoutAttribute:asEqualToLayoutAttribute:ofItem:", 4, 3, v25);
    v43 = v5->_touchSurface;
    -[TKVibrationRecorderStyleProvider vibrationRecorderRippleFingerStillSpeed](v5->_styleProvider, "vibrationRecorderRippleFingerStillSpeed");
    -[TKVibrationRecorderRippleView setFingerStillSpeed:](v43, "setFingerStillSpeed:");
    v44 = v5->_touchSurface;
    -[TKVibrationRecorderStyleProvider vibrationRecorderRippleFingerMovingSpeed](v5->_styleProvider, "vibrationRecorderRippleFingerMovingSpeed");
    -[TKVibrationRecorderRippleView setFingerMovingSpeed:](v44, "setFingerMovingSpeed:");
    v45 = v5->_touchSurface;
    -[TKVibrationRecorderStyleProvider vibrationRecorderRippleInitialRadius](v5->_styleProvider, "vibrationRecorderRippleInitialRadius");
    -[TKVibrationRecorderRippleView setFirstRippleInitialRadius:](v45, "setFirstRippleInitialRadius:");
    v46 = v5->_touchSurface;
    -[TKVibrationRecorderStyleProvider vibrationRecorderRippleFinalRadius](v5->_styleProvider, "vibrationRecorderRippleFinalRadius");
    -[TKVibrationRecorderRippleView setFadeOutRadius:](v46, "setFadeOutRadius:");
    v47 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    instructionsLabel = v5->_instructionsLabel;
    v5->_instructionsLabel = v47;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_instructionsLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v49 = v5->_instructionsLabel;
    -[TKVibrationRecorderStyleProvider vibrationRecorderInstructionsLabelFont](v5->_styleProvider, "vibrationRecorderInstructionsLabelFont");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v49, "setFont:", v50);

    v51 = v5->_instructionsLabel;
    -[TKVibrationRecorderStyleProvider vibrationRecorderInstructionsLabelTextColor](v5->_styleProvider, "vibrationRecorderInstructionsLabelTextColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v51, "setTextColor:", v52);

    v53 = v5->_instructionsLabel;
    -[TKVibrationRecorderStyleProvider vibrationRecorderInstructionsLabelBackgroundColor](v5->_styleProvider, "vibrationRecorderInstructionsLabelBackgroundColor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v53, "setBackgroundColor:", v54);

    -[UILabel setText:](v5->_instructionsLabel, "setText:", v38);
    -[UILabel setTextAlignment:](v5->_instructionsLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v5->_instructionsLabel, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](v5->_instructionsLabel, "setNumberOfLines:", 0);
    -[UILabel setUserInteractionEnabled:](v5->_instructionsLabel, "setUserInteractionEnabled:", 0);
    -[UILabel setIsAccessibilityElement:](v5->_instructionsLabel, "setIsAccessibilityElement:", 0);
    -[TKVibrationRecorderView addSubview:](v5, "addSubview:", v5->_instructionsLabel);
    -[TKVibrationRecorderStyleProvider vibrationRecorderInstructionsLabelEdgeInsets](v5->_styleProvider, "vibrationRecorderInstructionsLabelEdgeInsets");
    v56 = v55;
    v58 = v57;
    v60 = v59;
    v62 = v61;
    -[TKVibrationRecorderStyleProvider vibrationRecorderInstructionsLabelPositionOffset](v5->_styleProvider, "vibrationRecorderInstructionsLabelPositionOffset");
    v64 = v63;
    v66 = v65;
    -[UILabel tk_constrainLayoutAttribute:asGreaterThanOrEqualToValueOfItem:withOffset:](v5->_instructionsLabel, "tk_constrainLayoutAttribute:asGreaterThanOrEqualToValueOfItem:withOffset:", 1, v9, v58);
    -[UILabel tk_constrainLayoutAttribute:asLessThanOrEqualToValueOfItem:withOffset:](v5->_instructionsLabel, "tk_constrainLayoutAttribute:asLessThanOrEqualToValueOfItem:withOffset:", 2, v9, -v62);
    -[UILabel tk_constrainLayoutAttribute:asGreaterThanOrEqualToValueOfItem:withOffset:](v5->_instructionsLabel, "tk_constrainLayoutAttribute:asGreaterThanOrEqualToValueOfItem:withOffset:", 3, v5, v56);
    -[UILabel tk_constrainLayoutAttribute:asLessThanOrEqualToValueOfItem:withOffset:](v5->_instructionsLabel, "tk_constrainLayoutAttribute:asLessThanOrEqualToValueOfItem:withOffset:", 4, v5, -v60);
    -[UILabel tk_constrainLayoutAttribute:asEqualToValueOfItem:withOffset:](v5->_instructionsLabel, "tk_constrainLayoutAttribute:asEqualToValueOfItem:withOffset:", 9, v5->_touchSurface, v64);
    -[UILabel tk_constrainLayoutAttribute:asEqualToValueOfItem:withOffset:](v5->_instructionsLabel, "tk_constrainLayoutAttribute:asEqualToValueOfItem:withOffset:", 10, v5->_touchSurface, v66);
    -[TKVibrationRecorderView _enterWaitingModeWithAnimation:enablePlayButton:](v5, "_enterWaitingModeWithAnimation:enablePlayButton:", 0, 0);
    +[TKDisplayLinkManager currentDisplayLinkManager](TKDisplayLinkManager, "currentDisplayLinkManager");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "beginRequiringWarmUpMode");

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "addObserver:selector:name:object:", v5, sel__handleScreenPeripheryInsetsDidChangeNotification_, *MEMORY[0x24BDF81A0], 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF81A0], 0);

  +[TKDisplayLinkManager currentDisplayLinkManager](TKDisplayLinkManager, "currentDisplayLinkManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endRequiringWarmUpMode");

  -[TKVibrationRecorderTouchSurface setDelegate:](self->_touchSurface, "setDelegate:", 0);
  v5.receiver = self;
  v5.super_class = (Class)TKVibrationRecorderView;
  -[TKVibrationRecorderView dealloc](&v5, sel_dealloc);
}

- (id)_titleForControlsToolbarButtonWithIdentifier:(int)a3
{
  return (id)TLLocalizedString();
}

- (void)_setLeftButtonIdentifier:(int)a3 enabled:(BOOL)a4 rightButtonIdentifier:(int)a5 enabled:(BOOL)a6 animated:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  _QWORD v30[6];

  v29 = a7;
  v7 = a6;
  v8 = *(_QWORD *)&a5;
  v9 = a4;
  v30[5] = *MEMORY[0x24BDAC8D0];
  self->_leftButtonIdentifier = a3;
  self->_rightButtonIdentifier = a5;
  -[TKVibrationRecorderView _titleForControlsToolbarButtonWithIdentifier:](self, "_titleForControlsToolbarButtonWithIdentifier:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKVibrationRecorderView _titleForControlsToolbarButtonWithIdentifier:](self, "_titleForControlsToolbarButtonWithIdentifier:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithTitle:style:target:action:", v11, 0, self, sel__handleLeftButtonTapped_);
  objc_msgSend(v13, "setEnabled:", v9);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithTitle:style:target:action:", v12, 0, self, sel__handleRightButtonTapped_);
  objc_msgSend(v14, "setEnabled:", v7);
  -[TKVibrationRecorderView safeAreaInsets](self, "safeAreaInsets");
  v16 = v15;
  v18 = v17;
  v19 = objc_msgSend(MEMORY[0x24BDF6F90], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[UIToolbar semanticContentAttribute](self->_controlsToolbar, "semanticContentAttribute"));
  -[TKVibrationRecorderStyleProvider vibrationRecorderControlsToolbarItemsHorizontalOffsetFromEdge](self->_styleProvider, "vibrationRecorderControlsToolbarItemsHorizontalOffsetFromEdge");
  v21 = v20;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
  v23 = v22;
  if (v19)
    v24 = v18;
  else
    v24 = v16;
  v25 = v24 + v21;
  if (!v19)
    v16 = v18;
  objc_msgSend(v22, "setWidth:", v25);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
  objc_msgSend(v26, "setWidth:", v16 + v21);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v30[0] = v23;
  v30[1] = v13;
  v30[2] = v27;
  v30[3] = v14;
  v30[4] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIToolbar setItems:animated:](self->_controlsToolbar, "setItems:animated:", v28, v29);

}

- (void)_handleLeftButtonTapped:(id)a3
{
  id v4;

  -[TKVibrationRecorderView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vibrationRecorderView:buttonTappedWithIdentifier:", self, self->_leftButtonIdentifier);

}

- (void)_handleRightButtonTapped:(id)a3
{
  id v4;

  -[TKVibrationRecorderView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vibrationRecorderView:buttonTappedWithIdentifier:", self, self->_rightButtonIdentifier);

}

- (void)_enterWaitingModeWithAnimation:(BOOL)a3 enablePlayButton:(BOOL)a4
{
  _BOOL4 v5;
  uint64_t v7;
  TKVibrationRecorderTouchSurface *touchSurface;
  double v9;
  TKVibrationRecorderTouchSurface *v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  v5 = a3;
  if (a4)
    v7 = 1;
  else
    v7 = 2;
  -[TKVibrationRecorderView _setLeftButtonIdentifier:enabled:rightButtonIdentifier:enabled:animated:](self, "_setLeftButtonIdentifier:enabled:rightButtonIdentifier:enabled:animated:", 3, a4, v7, a4, a3);
  if (a4)
  {
    touchSurface = self->_touchSurface;
    TLLocalizedString();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[TKVibrationRecorderTouchSurface setAccessibilityHint:](touchSurface, "setAccessibilityHint:", v12);

  }
  else
  {
    v9 = 0.0;
    if (v5)
      -[TKVibrationRecorderStyleProvider vibrationRecorderInstructionsLabelFadeAnimationDuration](self->_styleProvider, "vibrationRecorderInstructionsLabelFadeAnimationDuration", 0.0);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __75__TKVibrationRecorderView__enterWaitingModeWithAnimation_enablePlayButton___block_invoke;
    v13[3] = &unk_24D37FE38;
    v13[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 6, v13, &__block_literal_global_2, v9, 0.0);
    v10 = self->_touchSurface;
    -[UILabel text](self->_instructionsLabel, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKVibrationRecorderTouchSurface setAccessibilityHint:](v10, "setAccessibilityHint:", v11);

  }
}

uint64_t __75__TKVibrationRecorderView__enterWaitingModeWithAnimation_enablePlayButton___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 1.0);
}

- (void)_exitWaitingModeWithAnimation:(BOOL)a3
{
  double v4;
  _QWORD v5[5];

  v4 = 0.0;
  if (a3)
    -[TKVibrationRecorderStyleProvider vibrationRecorderInstructionsLabelFadeAnimationDuration](self->_styleProvider, "vibrationRecorderInstructionsLabelFadeAnimationDuration", 0.0);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__TKVibrationRecorderView__exitWaitingModeWithAnimation___block_invoke;
  v5[3] = &unk_24D37FE38;
  v5[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 6, v5, &__block_literal_global_28, v4, 0.0);
  -[TKVibrationRecorderTouchSurface setAccessibilityHint:](self->_touchSurface, "setAccessibilityHint:", 0);
}

uint64_t __57__TKVibrationRecorderView__exitWaitingModeWithAnimation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 0.0);
}

- (void)enterRecordingMode
{
  -[TKVibrationRecorderView _exitWaitingModeWithAnimation:](self, "_exitWaitingModeWithAnimation:", 1);
  -[TKVibrationRecorderView _setLeftButtonIdentifier:enabled:rightButtonIdentifier:enabled:animated:](self, "_setLeftButtonIdentifier:enabled:rightButtonIdentifier:enabled:animated:", 3, 0, 2, 1, 1);
  -[TKVibrationRecorderProgressView clearAllVibrationComponents](self->_progressView, "clearAllVibrationComponents");
  -[TKVibrationRecorderProgressView setRoundedCornersCompensationDelayMode:](self->_progressView, "setRoundedCornersCompensationDelayMode:", 1);
  -[TKVibrationRecorderProgressView setCurrentTimeInterval:](self->_progressView, "setCurrentTimeInterval:", 0.0);
  -[TKVibrationRecorderTouchSurface enterRecordingMode](self->_touchSurface, "enterRecordingMode");
}

- (void)exitRecordingModeWithPlayButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (self->_isWaitingForEndOfCurrentVibrationComponent)
    -[TKVibrationRecorderProgressView vibrationComponentDidEnd](self->_progressView, "vibrationComponentDidEnd");
  -[TKVibrationRecorderView stopAnimatingProgress](self, "stopAnimatingProgress");
  -[TKVibrationRecorderProgressView setRoundedCornersCompensationDelayMode:](self->_progressView, "setRoundedCornersCompensationDelayMode:", 0);
  -[TKVibrationRecorderProgressView setCurrentTimeInterval:](self->_progressView, "setCurrentTimeInterval:", 0.0);
  self->_currentVibrationProgressDidStartTimestamp = 0.0;
  -[TKVibrationRecorderView _enterWaitingModeWithAnimation:enablePlayButton:](self, "_enterWaitingModeWithAnimation:enablePlayButton:", 1, v3);
  -[TKVibrationRecorderTouchSurface exitRecordingMode](self->_touchSurface, "exitRecordingMode");
}

- (void)enterReplayModeWithVibrationPattern:(id)a3
{
  id v4;

  if (!self->_isReplayModeEnabled)
  {
    self->_isReplayModeEnabled = 1;
    v4 = a3;
    -[TKVibrationRecorderView _exitWaitingModeWithAnimation:](self, "_exitWaitingModeWithAnimation:", 1);
    -[TKVibrationRecorderView _setLeftButtonIdentifier:enabled:rightButtonIdentifier:enabled:animated:](self, "_setLeftButtonIdentifier:enabled:rightButtonIdentifier:enabled:animated:", 3, 0, 4, 1, 1);
    -[TKVibrationRecorderTouchSurface enterReplayModeWithVibrationPattern:](self->_touchSurface, "enterReplayModeWithVibrationPattern:", v4);

    -[TKVibrationRecorderProgressView setRoundedCornersCompensationDelayMode:](self->_progressView, "setRoundedCornersCompensationDelayMode:", 2);
    -[TKVibrationRecorderView startAnimatingProgress](self, "startAnimatingProgress");
  }
}

- (void)exitReplayMode
{
  if (self->_isReplayModeEnabled)
  {
    self->_isReplayModeEnabled = 0;
    -[TKVibrationRecorderView stopAnimatingProgress](self, "stopAnimatingProgress");
    -[TKVibrationRecorderProgressView setRoundedCornersCompensationDelayMode:](self->_progressView, "setRoundedCornersCompensationDelayMode:", 0);
    -[TKVibrationRecorderProgressView setCurrentTimeInterval:](self->_progressView, "setCurrentTimeInterval:", 0.0);
    -[TKVibrationRecorderTouchSurface exitReplayMode](self->_touchSurface, "exitReplayMode");
    -[TKVibrationRecorderView _enterWaitingModeWithAnimation:enablePlayButton:](self, "_enterWaitingModeWithAnimation:enablePlayButton:", 1, 1);
  }
}

- (void)startAnimatingProgress
{
  double v3;
  void *v4;
  NSCopying *v5;
  NSCopying *displayLinkManagerObserverToken;
  _QWORD v7[5];

  self->_isAnimatingProgress = 1;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  self->_currentVibrationProgressDidStartTimestamp = v3;
  -[TKVibrationRecorderProgressView setCurrentTimeInterval:](self->_progressView, "setCurrentTimeInterval:", 0.0);
  +[TKDisplayLinkManager currentDisplayLinkManager](TKDisplayLinkManager, "currentDisplayLinkManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__TKVibrationRecorderView_startAnimatingProgress__block_invoke;
  v7[3] = &unk_24D380388;
  v7[4] = self;
  objc_msgSend(v4, "addObserverForFrameInterval:handler:", 2, v7);
  v5 = (NSCopying *)objc_claimAutoreleasedReturnValue();
  displayLinkManagerObserverToken = self->_displayLinkManagerObserverToken;
  self->_displayLinkManagerObserverToken = v5;

}

uint64_t __49__TKVibrationRecorderView_startAnimatingProgress__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateProgress:", a2);
}

- (void)stopAnimatingProgress
{
  void *v3;
  NSCopying *displayLinkManagerObserverToken;

  if (self->_displayLinkManagerObserverToken)
  {
    +[TKDisplayLinkManager currentDisplayLinkManager](TKDisplayLinkManager, "currentDisplayLinkManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserverWithToken:", self->_displayLinkManagerObserverToken);

    displayLinkManagerObserverToken = self->_displayLinkManagerObserverToken;
    self->_displayLinkManagerObserverToken = 0;

  }
  self->_isAnimatingProgress = 0;
}

- (void)_updateProgress:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  v4 = a3;
  if (self->_isAnimatingProgress)
  {
    v8 = v4;
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v6 = v5;
    if (v5 - self->_currentVibrationProgressDidStartTimestamp > self->_vibrationPatternMaximumDuration)
    {
      -[TKVibrationRecorderView stopAnimatingProgress](self, "stopAnimatingProgress");
      -[TKVibrationRecorderProgressView setRoundedCornersCompensationDelayMode:](self->_progressView, "setRoundedCornersCompensationDelayMode:", 0);
      self->_currentVibrationProgressDidStartTimestamp = 0.0;
      -[TKVibrationRecorderView delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "vibrationRecorderViewDidReachVibrationRecordingMaximumDuration:", self);

LABEL_7:
      v4 = v8;
      goto LABEL_8;
    }
    -[TKVibrationRecorderProgressView setCurrentTimeInterval:](self->_progressView, "setCurrentTimeInterval:");
    v4 = v8;
    if (self->_isWaitingForEndOfCurrentVibrationComponent
      && v6 - self->_currentVibrationComponentDidStartTimestamp > 4.9)
    {
      -[TKVibrationRecorderTouchSurface currentVibrationComponentShouldEnd](self->_touchSurface, "currentVibrationComponentShouldEnd");
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  TKVibrationRecorderStyleProvider *styleProvider;
  void *v6;
  NSLayoutConstraint *controlsToolbarTopConstraint;
  NSLayoutConstraint *progressToolbarBottomConstraint;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TKVibrationRecorderView;
  -[TKVibrationRecorderView didMoveToWindow](&v9, sel_didMoveToWindow);
  -[TKVibrationRecorderView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    styleProvider = self->_styleProvider;
    objc_msgSend(v3, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKVibrationRecorderStyleProvider setScreen:](styleProvider, "setScreen:", v6);

    controlsToolbarTopConstraint = self->_controlsToolbarTopConstraint;
    -[TKVibrationRecorderStyleProvider vibrationRecorderControlsToolbarVerticalOffset](self->_styleProvider, "vibrationRecorderControlsToolbarVerticalOffset");
    -[NSLayoutConstraint setConstant:](controlsToolbarTopConstraint, "setConstant:");
    progressToolbarBottomConstraint = self->_progressToolbarBottomConstraint;
    -[TKVibrationRecorderStyleProvider vibrationRecorderProgressToolbarVerticalOffset](self->_styleProvider, "vibrationRecorderProgressToolbarVerticalOffset");
    -[NSLayoutConstraint setConstant:](progressToolbarBottomConstraint, "setConstant:");
  }
  -[TKVibrationRecorderView _updateBottomLineToolbarForPeripheryInsetsChange](self, "_updateBottomLineToolbarForPeripheryInsetsChange");

}

- (void)_handleScreenPeripheryInsetsDidChangeNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[TKVibrationRecorderView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screen");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7 == v5)
  {
    -[TKVibrationRecorderView _updateBottomLineToolbarForPeripheryInsetsChange](self, "_updateBottomLineToolbarForPeripheryInsetsChange");
    v6 = v7;
  }

}

- (void)_updateBottomLineToolbarForPeripheryInsetsChange
{
  double v3;
  double v4;
  void *v5;
  double v6;
  _BOOL4 v7;
  double v8;
  double v9;
  _BOOL8 v10;
  id v11;

  -[UIToolbar intrinsicContentSize](self->_bottomLineToolbar, "intrinsicContentSize");
  v4 = v3;
  -[TKVibrationRecorderView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "_peripheryInsets");
    v7 = TKFloatEqualToFloat(v6, 0.0);
    if (!v7)
    {
      objc_msgSend(v11, "scale");
      TKFloatGetSafeScaleForValue(v8);
      v4 = v4 + 1.0 / v9;
    }
    v10 = !v7;
  }
  else
  {
    v10 = 0;
  }
  -[UIToolbar _setHidesShadow:](self->_bottomLineToolbar, "_setHidesShadow:", v10);
  -[NSLayoutConstraint setConstant:](self->_bottomLineToolbarBottomConstraint, "setConstant:", v4);

}

- (void)safeAreaInsetsDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TKVibrationRecorderView;
  -[TKVibrationRecorderView safeAreaInsetsDidChange](&v16, sel_safeAreaInsetsDidChange);
  -[TKVibrationRecorderView safeAreaInsets](self, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  v7 = objc_msgSend(MEMORY[0x24BDF6F90], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[UIToolbar semanticContentAttribute](self->_controlsToolbar, "semanticContentAttribute"));
  -[UIToolbar items](self->_controlsToolbar, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKVibrationRecorderStyleProvider vibrationRecorderControlsToolbarItemsHorizontalOffsetFromEdge](self->_styleProvider, "vibrationRecorderControlsToolbarItemsHorizontalOffsetFromEdge");
  v10 = v9;
  objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v7)
    v13 = v6;
  else
    v13 = v4;
  v14 = v13 + v10;
  if (!v7)
    v4 = v6;
  objc_msgSend(v11, "setWidth:", v14);
  objc_msgSend(v8, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWidth:", v4 + v10);
  -[UIToolbar setNeedsLayout](self->_controlsToolbar, "setNeedsLayout");

}

- (void)vibrationComponentDidStartForVibrationRecorderTouchSurface:(id)a3
{
  void *v4;
  double v5;

  -[TKVibrationRecorderView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vibrationComponentDidStartForVibrationRecorderView:", self);

  -[TKVibrationRecorderProgressView vibrationComponentDidStart](self->_progressView, "vibrationComponentDidStart");
  self->_isWaitingForEndOfCurrentVibrationComponent = 1;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  self->_currentVibrationComponentDidStartTimestamp = v5;
}

- (void)vibrationComponentDidEndForVibrationRecorderTouchSurface:(id)a3
{
  void *v4;

  -[TKVibrationRecorderView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vibrationComponentDidEndForVibrationRecorderView:", self);

  -[TKVibrationRecorderProgressView vibrationComponentDidEnd](self->_progressView, "vibrationComponentDidEnd");
  self->_isWaitingForEndOfCurrentVibrationComponent = 0;
  self->_currentVibrationComponentDidStartTimestamp = 0.0;
}

- (void)vibrationRecorderTouchSurfaceDidFinishReplayingVibration:(id)a3
{
  void *v4;
  double v5;
  float v6;

  -[TKVibrationRecorderView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vibrationRecorderViewDidFinishReplayingVibration:", self);

  -[TKVibrationRecorderView stopAnimatingProgress](self, "stopAnimatingProgress");
  -[TKVibrationRecorderView _enterWaitingModeWithAnimation:enablePlayButton:](self, "_enterWaitingModeWithAnimation:enablePlayButton:", 1, 1);
  self->_isReplayModeEnabled = 0;
  -[TKVibrationRecorderProgressView setRoundedCornersCompensationDelayMode:](self->_progressView, "setRoundedCornersCompensationDelayMode:", 0);
  if (self->_vibrationPatternMaximumDuration > 0.0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v6 = (v5 - self->_currentVibrationProgressDidStartTimestamp) / self->_vibrationPatternMaximumDuration;
    if (v6 > 0.98)
      -[TKVibrationRecorderProgressView setCurrentTimeInterval:](self->_progressView, "setCurrentTimeInterval:");
  }
}

- (BOOL)vibrationRecorderTouchSurfaceDidEnterRecordingMode:(id)a3
{
  TKVibrationRecorderView *v3;
  void *v4;

  v3 = self;
  -[TKVibrationRecorderView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "vibrationRecorderViewDidEnterRecordingMode:", v3);

  return (char)v3;
}

- (void)vibrationRecorderTouchSurface:(id)a3 didExitRecordingModeWithContextObject:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[TKVibrationRecorderView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vibrationRecorderView:didExitRecordingModeWithContextObject:", self, v5);

}

- (TKVibrationRecorderViewDelegate)delegate
{
  return (TKVibrationRecorderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayLinkManagerObserverToken, 0);
  objc_storeStrong((id *)&self->_touchSurfaceTopConstraint, 0);
  objc_storeStrong((id *)&self->_progressToolbarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_controlsToolbarTopConstraint, 0);
  objc_storeStrong((id *)&self->_bottomLineToolbarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_touchSurface, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_controlsToolbar, 0);
  objc_storeStrong((id *)&self->_bottomLineToolbar, 0);
  objc_storeStrong((id *)&self->_instructionsLabel, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
}

@end
