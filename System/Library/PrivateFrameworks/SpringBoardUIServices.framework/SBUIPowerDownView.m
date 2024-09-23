@implementation SBUIPowerDownView

- (SBUIPowerDownView)initWithFrame:(CGRect)a3
{
  return -[SBUIPowerDownView initWithFrame:vibrantSettings:](self, "initWithFrame:vibrantSettings:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBUIPowerDownView)initWithFrame:(CGRect)a3 vibrantSettings:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  SBUIPowerDownView *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  UIView *backdropView;
  uint64_t v23;
  _UIActionSlider *actionSlider;
  uint64_t v25;
  UIButton *cancelButton;
  UIButton *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  UILabel *v35;
  UILabel *cancelLabel;
  UILabel *v37;
  void *v38;
  UILabel *v39;
  void *v40;
  void *v41;
  void *v42;
  UILabel *v43;
  void *v44;
  SBUIShapeView *v45;
  SBUIShapeView *darkeningUnderlayView;
  SBUIShapeView *v47;
  void *v48;
  uint64_t v49;
  UIView *darkeningOverlayView;
  UIView *v51;
  void *v52;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v58.receiver = self;
  v58.super_class = (Class)SBUIPowerDownView;
  v11 = -[SBUIPowerDownView initWithFrame:](&v58, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    v54 = objc_alloc_init(MEMORY[0x1E0D898D8]);
    -[SBUIPowerDownView setBeaconManager:](v11, "setBeaconManager:", v54);
    -[SBUIPowerDownView _readIODeviceSupportsFindMy](v11, "_readIODeviceSupportsFindMy");
    -[SBUIPowerDownView _readShouldPowerDownViewShowFindMyAlert](v11, "_readShouldPowerDownViewShowFindMyAlert");
    -[SBUIPowerDownView setAutoresizingMask:](v11, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPowerDownView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[SBUIPowerDownView bounds](v11, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[SBUIPowerDownView setAlpha:](v11, "setAlpha:", 0.0);
    -[SBUIPowerDownView createDimmingBackdropViewWithFrame:](v11, "createDimmingBackdropViewWithFrame:", v14, v16, v18, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    backdropView = v11->_backdropView;
    v11->_backdropView = (UIView *)v21;

    -[SBUIPowerDownView addSubview:](v11, "addSubview:", v11->_backdropView);
    v56 = 0u;
    v57 = 0u;
    v55 = 0u;
    SBGetPowerDownViewMetrics((uint64_t)&v55, -[SBUIPowerDownView _isLandscapeAspectRatio](v11, "_isLandscapeAspectRatio"));
    objc_storeStrong((id *)&v11->_vibrantSettings, a4);
    -[SBUIPowerDownView _createActionSlider](v11, "_createActionSlider");
    v23 = objc_claimAutoreleasedReturnValue();
    actionSlider = v11->_actionSlider;
    v11->_actionSlider = (_UIActionSlider *)v23;

    -[_UIActionSlider setAlpha:](v11->_actionSlider, "setAlpha:", 0.0);
    -[SBUIPowerDownView addSubview:](v11, "addSubview:", v11->_actionSlider);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA3A0]), "initWithFrame:", 0.0, 0.0, *((double *)&v55 + 1), *((double *)&v55 + 1));
    cancelButton = v11->_cancelButton;
    v11->_cancelButton = (UIButton *)v25;

    v27 = v11->_cancelButton;
    v28 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "traitCollection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("PowerDownCancel"), v29, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_flatImageWithColor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v27, "setImage:forState:", v34, 0);

    -[UIButton addTarget:action:forControlEvents:](v11->_cancelButton, "addTarget:action:forControlEvents:", v11, sel__cancelButtonTapped, 64);
    -[UIButton setAlpha:](v11->_cancelButton, "setAlpha:", 0.0);
    -[SBUIPowerDownView addSubview:](v11, "addSubview:", v11->_cancelButton);
    v35 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    cancelLabel = v11->_cancelLabel;
    v11->_cancelLabel = v35;

    v37 = v11->_cancelLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v37, "setBackgroundColor:", v38);

    v39 = v11->_cancelLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v39, "setTextColor:", v40);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("POWER_DOWN_CANCEL"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setText:](v11->_cancelLabel, "setText:", v42);
    v43 = v11->_cancelLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", *((double *)&v56 + 1));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v43, "setFont:", v44);

    -[UILabel setAlpha:](v11->_cancelLabel, "setAlpha:", 0.0);
    -[SBUIPowerDownView addSubview:](v11, "addSubview:", v11->_cancelLabel);
    -[UIButton setAccessibilityLabel:](v11->_cancelButton, "setAccessibilityLabel:", v42);
    -[UILabel setAccessibilityElementsHidden:](v11->_cancelLabel, "setAccessibilityElementsHidden:", 1);
    v45 = -[SBUIShapeView initWithFrame:]([SBUIShapeView alloc], "initWithFrame:", v14, v16, v18, v20);
    darkeningUnderlayView = v11->_darkeningUnderlayView;
    v11->_darkeningUnderlayView = v45;

    v47 = v11->_darkeningUnderlayView;
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIShapeView setFillColor:](v47, "setFillColor:", v48);

    -[SBUIShapeView setFillRule:](v11->_darkeningUnderlayView, "setFillRule:", 1);
    -[SBUIShapeView setAlpha:](v11->_darkeningUnderlayView, "setAlpha:", 0.0);
    -[SBUIPowerDownView addSubview:](v11, "addSubview:", v11->_darkeningUnderlayView);
    v49 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v14, v16, v18, v20);
    darkeningOverlayView = v11->_darkeningOverlayView;
    v11->_darkeningOverlayView = (UIView *)v49;

    v51 = v11->_darkeningOverlayView;
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v51, "setBackgroundColor:", v52);

    -[UIView setAlpha:](v11->_darkeningOverlayView, "setAlpha:", 0.0);
    -[SBUIPowerDownView addSubview:](v11, "addSubview:", v11->_darkeningOverlayView);

  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[SBUIPowerDownView _cancelAutoDismissTimer](self, "_cancelAutoDismissTimer");
  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)SBUIPowerDownView;
  -[SBUIPowerDownView dealloc](&v3, sel_dealloc);
}

- (void)_createFindMyUI
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  UIButton *v17;
  UIButton *findMyButton;
  UIButton *v19;
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
  _QWORD v49[5];
  _OWORD v50[2];
  __int128 v51;
  uint64_t v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v51 = 0u;
  memset(v50, 0, sizeof(v50));
  SBGetPowerDownViewMetrics((uint64_t)v50, -[SBUIPowerDownView _isLandscapeAspectRatio](self, "_isLandscapeAspectRatio"));
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 4, *((double *)&v51 + 1));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:withConfiguration:", CFSTR("location.fill.radiowaves.left.and.right"), v46);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA258], "textAttachmentWithImage:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v47);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("chevron.right"), v46);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageFlippedForRightToLeftLayoutDirection");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA258], "textAttachmentWithImage:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3498];
  v52 = *MEMORY[0x1E0CEA0A0];
  v6 = v52;
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedStringWithAttachment:attributes:", v44, v8);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", CFSTR("POWER_DOWN_FIND_MY"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", v10, &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v43);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
  v12 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend(v12, "appendAttributedString:", v42);
  objc_msgSend(v12, "appendAttributedString:", v11);
  objc_msgSend(v12, "appendAttributedString:", v41);
  objc_msgSend(v12, "appendAttributedString:", v11);
  v13 = objc_msgSend(v12, "length");
  objc_msgSend(v12, "appendAttributedString:", v40);
  v14 = objc_msgSend(v12, "length");
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", *((double *)&v51 + 1));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x1E0CEA098], v39, 0, v14);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.55);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAttribute:value:range:", v6, v15, 0, v13);

  v16 = objc_alloc(MEMORY[0x1E0CEA3A0]);
  v17 = (UIButton *)objc_msgSend(v16, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  findMyButton = self->_findMyButton;
  self->_findMyButton = v17;
  v19 = v17;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setAlpha:](v19, "setAlpha:", 0.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setBackgroundColor:](v19, "setBackgroundColor:", v20);

  -[UIButton setAttributedTitle:forState:](v19, "setAttributedTitle:forState:", v12, 0);
  -[UIButton titleLabel](v19, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_setDrawsAsBackdropOverlayWithBlendMode:", 2);

  -[UIButton titleLabel](v19, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setNumberOfLines:", 0);

  -[UIButton titleLabel](v19, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTextAlignment:", 1);

  -[UIButton titleLabel](v19, "titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setLineBreakMode:", 0);

  -[UIButton addTarget:action:forControlEvents:](v19, "addTarget:action:forControlEvents:", self, sel__didTapFindMy, 64);
  -[SBUIPowerDownView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v19, self->_cancelLabel);
  -[UIButton centerXAnchor](v19, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIPowerDownView centerXAnchor](self, "centerXAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v27);

  -[UIButton leadingAnchor](v19, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIPowerDownView leadingAnchor](self, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintGreaterThanOrEqualToAnchor:constant:", v29, 20.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton trailingAnchor](v19, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIPowerDownView trailingAnchor](self, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:constant:", v32, 20.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v30);
  objc_msgSend(v3, "addObject:", v33);
  -[UIButton topAnchor](v19, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActionSlider bottomAnchor](self->_actionSlider, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, 4.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v36);

  -[UIButton heightAnchor](v19, "heightAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintGreaterThanOrEqualToConstant:", 40.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v38);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __36__SBUIPowerDownView__createFindMyUI__block_invoke;
  v49[3] = &unk_1E4C3E408;
  v49[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v49, 0);

}

uint64_t __36__SBUIPowerDownView__createFindMyUI__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setAlpha:", 1.0);
}

- (id)createDimmingBackdropViewWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_graphicsQuality");

  if (v8 == 10)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", x, y, width, height);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithFrame:privateStyle:", 2030, x, y, width, height);
  }
  return v9;
}

- (double)showHideAnimationDuration
{
  return 0.3;
}

- (void)showAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  double v13;
  double v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD);
  _QWORD v18[4];
  void (**v19)(_QWORD);
  _QWORD v20[4];
  void (**v21)(_QWORD);
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  BOOL v25;
  _QWORD v26[5];

  v4 = a3;
  v6 = a4;
  -[_UIActionSlider closeTrackAnimated:](self->_actionSlider, "closeTrackAnimated:", 0);
  -[SBUIPowerDownView _updateSliderExclusionPath](self, "_updateSliderExclusionPath");
  v7 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __45__SBUIPowerDownView_showAnimated_completion___block_invoke;
  v26[3] = &unk_1E4C3E408;
  v26[4] = self;
  v8 = (void (**)(_QWORD))MEMORY[0x1A85A1798](v26);
  v24[0] = v7;
  v24[1] = 3221225472;
  v24[2] = __45__SBUIPowerDownView_showAnimated_completion___block_invoke_2;
  v24[3] = &unk_1E4C3E430;
  v24[4] = self;
  v25 = v4;
  v9 = (void (**)(_QWORD))MEMORY[0x1A85A1798](v24);
  v22[0] = v7;
  v22[1] = 3221225472;
  v22[2] = __45__SBUIPowerDownView_showAnimated_completion___block_invoke_3;
  v22[3] = &unk_1E4C3E498;
  v22[4] = self;
  v10 = v6;
  v23 = v10;
  v11 = (void (**)(_QWORD))MEMORY[0x1A85A1798](v22);
  if (v4)
  {
    v12 = (void *)MEMORY[0x1E0CEABB0];
    -[SBUIPowerDownView showHideAnimationDuration](self, "showHideAnimationDuration");
    v14 = v13;
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __45__SBUIPowerDownView_showAnimated_completion___block_invoke_4;
    v20[3] = &unk_1E4C3E4C0;
    v21 = v8;
    objc_msgSend(v12, "animateWithDuration:delay:options:animations:completion:", 0, v20, 0, v14, 0.0);
    v15 = (void *)MEMORY[0x1E0CEABB0];
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __45__SBUIPowerDownView_showAnimated_completion___block_invoke_5;
    v18[3] = &unk_1E4C3E4C0;
    v19 = v9;
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __45__SBUIPowerDownView_showAnimated_completion___block_invoke_6;
    v16[3] = &unk_1E4C3E4E8;
    v17 = v11;
    objc_msgSend(v15, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 0, v18, v16, 0.15, 0.0);

  }
  else
  {
    v8[2](v8);
    v9[2](v9);
    v11[2](v11);
  }

}

uint64_t __45__SBUIPowerDownView_showAnimated_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 32), "_willAnimateIn");
}

uint64_t __45__SBUIPowerDownView_showAnimated_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "openTrackAnimated:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateSliderExclusionPath");
}

uint64_t __45__SBUIPowerDownView_showAnimated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_resetAutoDismissTimer");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __45__SBUIPowerDownView_showAnimated_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__SBUIPowerDownView_showAnimated_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__SBUIPowerDownView_showAnimated_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)hideAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  double v14;
  double v15;
  _QWORD v16[4];
  void (**v17)(_QWORD);
  _QWORD v18[4];
  void (**v19)(_QWORD);
  _QWORD v20[4];
  void (**v21)(_QWORD);
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  _QWORD v25[5];

  v4 = a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __45__SBUIPowerDownView_hideAnimated_completion___block_invoke;
  v25[3] = &unk_1E4C3E408;
  v25[4] = self;
  v8 = (void (**)(_QWORD))MEMORY[0x1A85A1798](v25);
  v24[0] = v7;
  v24[1] = 3221225472;
  v24[2] = __45__SBUIPowerDownView_hideAnimated_completion___block_invoke_2;
  v24[3] = &unk_1E4C3E408;
  v24[4] = self;
  v9 = (void (**)(_QWORD))MEMORY[0x1A85A1798](v24);
  v22[0] = v7;
  v22[1] = 3221225472;
  v22[2] = __45__SBUIPowerDownView_hideAnimated_completion___block_invoke_3;
  v22[3] = &unk_1E4C3E498;
  v22[4] = self;
  v10 = v6;
  v23 = v10;
  v11 = (void (**)(_QWORD))MEMORY[0x1A85A1798](v22);
  if (v4)
  {
    v12 = (void *)MEMORY[0x1E0CEABB0];
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __45__SBUIPowerDownView_hideAnimated_completion___block_invoke_4;
    v20[3] = &unk_1E4C3E4C0;
    v21 = v9;
    objc_msgSend(v12, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v20, 0);
    v13 = (void *)MEMORY[0x1E0CEABB0];
    -[SBUIPowerDownView showHideAnimationDuration](self, "showHideAnimationDuration");
    v15 = v14;
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __45__SBUIPowerDownView_hideAnimated_completion___block_invoke_5;
    v18[3] = &unk_1E4C3E4C0;
    v19 = v8;
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __45__SBUIPowerDownView_hideAnimated_completion___block_invoke_6;
    v16[3] = &unk_1E4C3E4E8;
    v17 = v11;
    objc_msgSend(v13, "animateWithDuration:delay:options:animations:completion:", 0, v18, v16, v15, 0.25);

  }
  else
  {
    v9[2](v9);
    v11[2](v11);
    v8[2](v8);
  }

}

uint64_t __45__SBUIPowerDownView_hideAnimated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_willAnimateOut");
}

uint64_t __45__SBUIPowerDownView_hideAnimated_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __45__SBUIPowerDownView_hideAnimated_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 496));
  objc_msgSend(WeakRetained, "powerDownViewAnimateOutCompleted:", *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __45__SBUIPowerDownView_hideAnimated_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__SBUIPowerDownView_hideAnimated_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__SBUIPowerDownView_hideAnimated_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  uint64_t v31;
  double v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v36.receiver = self;
  v36.super_class = (Class)SBUIPowerDownView;
  -[SBUIPowerDownView layoutSubviews](&v36, sel_layoutSubviews);
  -[SBUIPowerDownView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBUIPowerDownView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = v12;

  v34 = 0u;
  v35 = 0u;
  v33 = 0u;
  SBGetPowerDownViewMetrics((uint64_t)&v33, -[SBUIPowerDownView _isLandscapeAspectRatio](self, "_isLandscapeAspectRatio"));
  -[SBUIPowerDownView safeAreaInsets](self, "safeAreaInsets");
  -[_UIActionSlider sizeThatFits:](self->_actionSlider, "sizeThatFits:", v8, v10);
  UIRectCenteredXInRectScale();
  -[_UIActionSlider setFrame:](self->_actionSlider, "setFrame:", v13);
  -[UIButton frame](self->_cancelButton, "frame");
  UIRectCenteredXInRectScale();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v37.origin.x = v4;
  v37.origin.y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  -[UIButton setFrame:](self->_cancelButton, "setFrame:", v15, CGRectGetMaxY(v37) - *(double *)&v34 - *((double *)&v33 + 1), v17, v19, v13);
  -[UILabel sizeThatFits:](self->_cancelLabel, "sizeThatFits:", v8, v10);
  v31 = v13;
  v32 = v4;
  UIRectCenteredXInRectScale();
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v38.origin.x = v4;
  v38.origin.y = v6;
  v38.size.width = v8;
  v38.size.height = v10;
  v28 = CGRectGetMaxY(v38) - *(double *)&v35;
  v39.origin.x = v21;
  v39.origin.y = v23;
  v39.size.width = v25;
  v39.size.height = v27;
  v29 = v28 - CGRectGetHeight(v39);
  -[UILabel _baselineOffsetFromBottom](self->_cancelLabel, "_baselineOffsetFromBottom", v31);
  -[UILabel setFrame:](self->_cancelLabel, "setFrame:", v21, v29 + v30, v25, v27);
  -[UIView setFrame:](self->_backdropView, "setFrame:", v32, v6, v8, v10);
  -[SBUIShapeView setFrame:](self->_darkeningUnderlayView, "setFrame:", v32, v6, v8, v10);
  -[UIView setFrame:](self->_darkeningOverlayView, "setFrame:", v32, v6, v8, v10);
  -[SBUIPowerDownView _updateSliderExclusionPath](self, "_updateSliderExclusionPath");
  -[UILabel setNeedsLayout](self->_cancelLabel, "setNeedsLayout");
}

- (void)_willAnimateIn
{
  id v3;

  -[SBUIPowerDownView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "powerDownViewWillAnimateIn:", self);

}

- (void)_willAnimateOut
{
  id v3;

  -[SBUIPowerDownView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "powerDownViewWillAnimateOut:", self);

}

- (void)_powerDownSliderDidUpdateSlideWithValue:(double)a3
{
  -[SBUIShapeView setAlpha:](self->_darkeningUnderlayView, "setAlpha:", a3);
  -[SBUIPowerDownView _updateSliderExclusionPath](self, "_updateSliderExclusionPath");
}

- (BOOL)_isLandscapeAspectRatio
{
  double v2;
  double v3;

  -[SBUIPowerDownView bounds](self, "bounds");
  return v2 >= v3;
}

- (void)_cancelAutoDismissTimer
{
  NSTimer *autoDismissTimer;

  -[NSTimer invalidate](self->_autoDismissTimer, "invalidate");
  autoDismissTimer = self->_autoDismissTimer;
  self->_autoDismissTimer = 0;

}

- (void)_resetAutoDismissTimer
{
  NSTimer *v3;
  NSTimer *autoDismissTimer;

  -[SBUIPowerDownView _cancelAutoDismissTimer](self, "_cancelAutoDismissTimer");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__idleTimerFired, 0, 0, 30.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  autoDismissTimer = self->_autoDismissTimer;
  self->_autoDismissTimer = v3;

}

- (void)_updateSliderExclusionPath
{
  void *v3;
  void *v4;
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MinX;
  CGFloat MinY;
  CGAffineTransform v12;
  CGRect v13;
  CGRect v14;

  v3 = (void *)MEMORY[0x1E0CEA390];
  -[SBUIPowerDownView bounds](self, "bounds");
  objc_msgSend(v3, "bezierPathWithRect:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActionSlider knobMaskPath](self->_actionSlider, "knobMaskPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActionSlider frame](self->_actionSlider, "frame");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  MinX = CGRectGetMinX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  MinY = CGRectGetMinY(v14);
  CGAffineTransformMakeTranslation(&v12, MinX, MinY);
  objc_msgSend(v5, "applyTransform:", &v12);
  objc_msgSend(v4, "appendBezierPath:", v5);
  -[SBUIShapeView setPath:](self->_darkeningUnderlayView, "setPath:", v4);

}

- (void)_notifyDelegatePowerDown
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "powerDownViewRequestPowerDown:", self);

}

- (void)_notifyDelegateCancelled
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "powerDownViewRequestCancel:", self);

}

- (void)didAcknowledgeFindMyInfo
{
  -[SBUIPowerDownView setShouldPowerDownViewShowFindMyAlert:](self, "setShouldPowerDownViewShowFindMyAlert:", 0);
}

- (void)didSuppressFindMy
{
  -[UIButton setAlpha:](self->_findMyButton, "setAlpha:", 0.0);
}

- (void)_animatePowerDown
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__SBUIPowerDownView__animatePowerDown__block_invoke;
  v3[3] = &unk_1E4C3E408;
  v3[4] = self;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __38__SBUIPowerDownView__animatePowerDown__block_invoke_2;
  v2[3] = &unk_1E4C3E510;
  objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v3, v2);
}

uint64_t __38__SBUIPowerDownView__animatePowerDown__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 1.0);
}

uint64_t __38__SBUIPowerDownView__animatePowerDown__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegatePowerDown");
}

- (id)_createActionSlider
{
  void *v3;
  uint64_t v4;
  id v5;
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

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_graphicsQuality");

  v5 = objc_alloc(MEMORY[0x1E0CEAC40]);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:vibrantSettings:", self->_vibrantSettings, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("PowerDownKnob"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageWithRenderingMode:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKnobImage:", v12);

  objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v13);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("POWER_DOWN_LOCK_LABEL"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTrackText:", v15);

  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setKnobImageOffset:", -0.5, -1.0);
  if (v4 == 10)
  {
    objc_msgSend(v6, "setStyle:", 2);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.831372549, 0.96);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v16);

  }
  return v6;
}

- (void)_prepareViewsForAlert
{
  _UIActionSlider *v3;
  _UIActionSlider *actionSlider;
  UIButton *findMyButton;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[SBUIPowerDownView _resetAutoDismissTimer](self, "_resetAutoDismissTimer");
  -[_UIActionSlider removeFromSuperview](self->_actionSlider, "removeFromSuperview");
  -[SBUIPowerDownView _createActionSlider](self, "_createActionSlider");
  v3 = (_UIActionSlider *)objc_claimAutoreleasedReturnValue();
  actionSlider = self->_actionSlider;
  self->_actionSlider = v3;

  -[SBUIPowerDownView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_actionSlider, self->_cancelButton);
  findMyButton = self->_findMyButton;
  if (findMyButton)
  {
    -[UIButton topAnchor](findMyButton, "topAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActionSlider bottomAnchor](self->_actionSlider, "bottomAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 4.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CB3718];
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activateConstraints:", v10);

  }
  -[SBUIPowerDownView setNeedsLayout](self, "setNeedsLayout");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__SBUIPowerDownView__prepareViewsForAlert__block_invoke;
  v11[3] = &unk_1E4C3E408;
  v11[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingDefaultTimingWithOptions:animations:completion:", 4, v11, 0);
}

uint64_t __42__SBUIPowerDownView__prepareViewsForAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
}

- (void)_readIODeviceSupportsFindMy
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBUIPowerDownView beaconManager](self, "beaconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__SBUIPowerDownView__readIODeviceSupportsFindMy__block_invoke;
  v4[3] = &unk_1E4C3E560;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "isLPEMModeSupported:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __48__SBUIPowerDownView__readIODeviceSupportsFindMy__block_invoke(uint64_t a1, int a2)
{
  _QWORD block[4];
  id v3;

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__SBUIPowerDownView__readIODeviceSupportsFindMy__block_invoke_2;
    block[3] = &unk_1E4C3E538;
    objc_copyWeak(&v3, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v3);
  }
}

void __48__SBUIPowerDownView__readIODeviceSupportsFindMy__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setDeviceSupportsFindMy:", 1);
    objc_msgSend(v2, "_createFindMyUI");
    WeakRetained = v2;
  }

}

- (void)_readShouldPowerDownViewShowFindMyAlert
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SBUIPowerDownView beaconManager](self, "beaconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__SBUIPowerDownView__readShouldPowerDownViewShowFindMyAlert__block_invoke;
  v4[3] = &unk_1E4C3E560;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "userHasAcknowledgeFindMyWithCompletion:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __60__SBUIPowerDownView__readShouldPowerDownViewShowFindMyAlert__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  _QWORD v5[5];
  char v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __60__SBUIPowerDownView__readShouldPowerDownViewShowFindMyAlert__block_invoke_2;
    v5[3] = &unk_1E4C3E430;
    v5[4] = WeakRetained;
    v6 = a2;
    dispatch_async(MEMORY[0x1E0C80D38], v5);
  }

}

uint64_t __60__SBUIPowerDownView__readShouldPowerDownViewShowFindMyAlert__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShouldPowerDownViewShowFindMyAlert:", *(_BYTE *)(a1 + 40) == 0);
}

- (SBUIPowerDownViewDelegate)delegate
{
  return (SBUIPowerDownViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)deviceSupportsFindMy
{
  return self->_deviceSupportsFindMy;
}

- (void)setDeviceSupportsFindMy:(BOOL)a3
{
  self->_deviceSupportsFindMy = a3;
}

- (BOOL)shouldPowerDownViewShowFindMyAlert
{
  return self->_shouldPowerDownViewShowFindMyAlert;
}

- (void)setShouldPowerDownViewShowFindMyAlert:(BOOL)a3
{
  self->_shouldPowerDownViewShowFindMyAlert = a3;
}

- (SPBeaconManager)beaconManager
{
  return self->_beaconManager;
}

- (void)setBeaconManager:(id)a3
{
  objc_storeStrong((id *)&self->_beaconManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beaconManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vibrantSettings, 0);
  objc_storeStrong((id *)&self->_findMyButton, 0);
  objc_storeStrong((id *)&self->_cancelLabel, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_actionSlider, 0);
  objc_storeStrong((id *)&self->_darkeningOverlayView, 0);
  objc_storeStrong((id *)&self->_darkeningUnderlayView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_autoDismissTimer, 0);
}

@end
