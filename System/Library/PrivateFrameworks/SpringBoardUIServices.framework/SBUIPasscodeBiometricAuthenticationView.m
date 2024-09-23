@implementation SBUIPasscodeBiometricAuthenticationView

- (SBUIPasscodeBiometricAuthenticationView)initWithFrame:(CGRect)a3 layoutDelegate:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  SBUIPasscodeBiometricAuthenticationView *v10;
  SBUIPasscodeBiometricAuthenticationView *v11;
  void *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBUIPasscodeBiometricAuthenticationView;
  v10 = -[SBUIPasscodeBiometricAuthenticationView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[SBUIPasscodeBiometricAuthenticationView setLayoutDelegate:](v10, "setLayoutDelegate:", v9);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, sel__noteContentSizeCategoryDidChange, *MEMORY[0x1E0CEB3F0], 0);

  }
  return v11;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUIPasscodeBiometricAuthenticationView;
  -[SBUIPasscodeBiometricAuthenticationView layoutSubviews](&v3, sel_layoutSubviews);
  -[SBUIPasscodeBiometricAuthenticationView _layoutAuthReasonLabel:](self, "_layoutAuthReasonLabel:", self->_touchIDReasonLabel);
  -[SBUIPasscodeBiometricAuthenticationView _layoutAuthReasonLabel:](self, "_layoutAuthReasonLabel:", self->_faceIDReasonLabel);
}

- (void)_layoutAuthReasonLabel:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "frame");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(v3, "setPreferredMaxLayoutWidth:", 246.0);
  objc_msgSend(v3, "sizeToFit");

}

- (void)setType:(unint64_t)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    -[SBUIPasscodeBiometricAuthenticationView _updateReasonTextIfPossible](self, "_updateReasonTextIfPossible");
    -[SBUIPasscodeBiometricAuthenticationView _updateSubviews](self, "_updateSubviews");
    -[SBUIPasscodeBiometricAuthenticationView _updateConstraints](self, "_updateConstraints");
  }
}

- (void)setUnlockDestination:(id)a3
{
  NSString *v4;
  NSString *unlockDestination;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  unlockDestination = self->_unlockDestination;
  self->_unlockDestination = v4;

  -[SBUIPasscodeBiometricAuthenticationView _updateReasonTextIfPossible](self, "_updateReasonTextIfPossible");
}

- (void)_updateReasonTextIfPossible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t type;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  if (!self->_unlockDestination)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("TOUCH_ID_NO_REASON"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeBiometricAuthenticationView _setTouchIDReason:](self, "_setTouchIDReason:", v13);

    type = self->_type;
    if (type == 3)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("UNLOCKING_WITH_WATCH_LABEL");
    }
    else
    {
      if (type != 2)
      {
LABEL_13:
        -[SBUIPasscodeBiometricAuthenticationView _setFaceIDReasonLine2:](self, "_setFaceIDReasonLine2:", CFSTR(" "));
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("FACE_ID_LABEL");
    }
    objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeBiometricAuthenticationView _setFaceIDReason:](self, "_setFaceIDReason:", v21);

    goto LABEL_13;
  }
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TOUCH_ID_REASON"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v5, self->_unlockDestination);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIPasscodeBiometricAuthenticationView _setTouchIDReason:](self, "_setTouchIDReason:", v6);

  v7 = self->_type;
  if (v7 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("UNLOCKING_WITH_WATCH_REASON_LINE_1"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeBiometricAuthenticationView _setFaceIDReason:](self, "_setFaceIDReason:", v10);
    goto LABEL_9;
  }
  if (v7 == 2)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FACE_ID_REASON_LINE_1"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeBiometricAuthenticationView _setFaceIDReason:](self, "_setFaceIDReason:", v11);

LABEL_9:
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("FACE_ID_REASON_LINE_2"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v19, self->_unlockDestination);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIPasscodeBiometricAuthenticationView _setFaceIDReasonLine2:](self, "_setFaceIDReasonLine2:", v20);

LABEL_14:
  -[SBUIPasscodeBiometricAuthenticationView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)showsEmergencyCallButton
{
  return -[SBUIButton isHidden](self->_emergencyCallButton, "isHidden") ^ 1;
}

- (void)setShowsEmergencyCallButton:(BOOL)a3
{
  -[SBUIButton setHidden:](self->_emergencyCallButton, "setHidden:", !a3);
}

- (BOOL)showsCancelButton
{
  return -[SBUIButton isHidden](self->_cancelButton, "isHidden") ^ 1;
}

- (void)setShowsCancelButton:(BOOL)a3
{
  -[SBUIButton setHidden:](self->_cancelButton, "setHidden:", !a3);
}

- (void)setAncillaryButtonsVisible:(BOOL)a3
{
  -[SBUIPasscodeBiometricAuthenticationView setAncillaryButtonsVisible:animated:](self, "setAncillaryButtonsVisible:animated:", a3, 0);
}

- (void)setAncillaryButtonsVisible:(BOOL)a3 animated:(BOOL)a4
{
  double v4;
  _QWORD v5[5];

  if (self->_ancillaryButtonsVisible != a3)
  {
    self->_ancillaryButtonsVisible = a3;
    v4 = 0.3;
    if (!a4)
      v4 = 0.0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __79__SBUIPasscodeBiometricAuthenticationView_setAncillaryButtonsVisible_animated___block_invoke;
    v5[3] = &unk_1E4C3E408;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v5, 0, v4, 0.0);
  }
}

uint64_t __79__SBUIPasscodeBiometricAuthenticationView_setAncillaryButtonsVisible_animated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 424))
    v3 = 1.0;
  else
    v3 = 0.0;
  objc_msgSend(*(id *)(v2 + 536), "setAlpha:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setAlpha:", v3);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "setAlpha:", v3);
}

- (void)setFaceIDUsePasscodeButtonVisible:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__SBUIPasscodeBiometricAuthenticationView_setFaceIDUsePasscodeButtonVisible___block_invoke;
  v3[3] = &unk_1E4C3E430;
  v3[4] = self;
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v3, 0, 0.3, 0.0);
}

uint64_t __77__SBUIPasscodeBiometricAuthenticationView_setFaceIDUsePasscodeButtonVisible___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 512);
  if (*(_BYTE *)(a1 + 40))
    v3 = 1.0;
  else
    v3 = 0.0;
  objc_msgSend(v2, "setAlpha:", v3);
  if (*(_BYTE *)(a1 + 40))
    v4 = 0.0;
  else
    v4 = 1.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "setAlpha:", v4);
  if (*(_BYTE *)(a1 + 40))
    v5 = 0.0;
  else
    v5 = 1.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 584), "setAlpha:", v5);
  if (*(_BYTE *)(a1 + 40))
    v6 = 0.0;
  else
    v6 = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "setAlpha:", v6);
}

- (void)setGlyphViewState:(int64_t)a3
{
  -[PKGlyphView setState:](self->_touchIDGlyphView, "setState:", a3);
}

- (void)setGlyphViewState:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[PKGlyphView setState:animated:completionHandler:](self->_touchIDGlyphView, "setState:animated:completionHandler:", a3, a4, a5);
}

- (void)_updateSubviews
{
  void *v3;
  unint64_t v4;
  _BOOL4 v5;
  unint64_t v6;
  UILayoutGuide *touchIDGlyphLayoutGuide;
  UILayoutGuide *v8;
  UILayoutGuide *v9;
  void *v10;
  objc_class *v11;
  PKGlyphView *v12;
  PKGlyphView *touchIDGlyphView;
  PKGlyphView *v14;
  void *v15;
  UILabel *v16;
  UILabel *touchIDReasonLabel;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  void *v24;
  void *v25;
  UILayoutGuide *v26;
  PKGlyphView *v27;
  UILabel *v28;
  UIButton *backgroundCancelButton;
  UIButton *v30;
  UIButton *v31;
  UIButton *v32;
  UIButton *invisibleUsePasscodeButton;
  UIButton *v34;
  UILabel *faceIDLabel;
  UILabel *v36;
  UILabel *v37;
  UILabel *v38;
  void *v39;
  void *v40;
  UILabel *v41;
  void *v42;
  UILabel *v43;
  void *v44;
  UILabel *v45;
  void *v46;
  void *v47;
  void *v48;
  UILabel *v49;
  UILabel *faceIDReasonLabel;
  UILabel *v51;
  void *v52;
  UILabel *v53;
  void *v54;
  UILabel *v55;
  void *v56;
  void *v57;
  void *v58;
  UILayoutGuide *v59;
  UILayoutGuide *faceIDLabelAndReasonLayoutGuide;
  UILayoutGuide *v61;
  UILayoutGuide *faceIDLabelAndReasonHelperGuide;
  SBUIPasscodePillButton *v63;
  SBUIPasscodePillButton *v64;
  SBUIPasscodePillButton *faceIDUsePasscodeButton;
  SBUIPasscodePillButton *v66;
  void *v67;
  void *v68;
  void *v69;
  SBUIPasscodePillButton *v70;
  void *v71;
  void *v72;
  UILabel *v73;
  UILabel *v74;
  SBUIPasscodePillButton *v75;
  UIImageView *faceIDLockIcon;
  UILayoutGuide *v77;
  UILayoutGuide *v78;
  SBUIButton *touchIDUsePasscodeButton;
  SBUIButton *v80;
  SBUIButton *v81;
  SBUIButton *v82;
  void *v83;
  void *v84;
  SBUIButton *v85;
  void *v86;
  void *v87;
  void *v88;
  SBUIButton *v89;
  UILayoutGuide *v90;
  UILayoutGuide *cancelButtonLayoutGuide;
  SBUIButton *v92;
  SBUIButton *cancelButton;
  SBUIButton *v94;
  void *v95;
  void *v96;
  SBUIButton *v97;
  void *v98;
  SBUIButton *v99;
  SBUIButton *emergencyCallButton;
  SBUIButton *v101;
  void *v102;
  void *v103;
  SBUIButton *v104;
  void *v105;
  _QWORD v106[5];
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;

  -[SBUIPasscodeBiometricAuthenticationView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupBlending:", 0);

  v4 = -[SBUIPasscodeBiometricAuthenticationView type](self, "type");
  v5 = -[SBUIPasscodeBiometricAuthenticationView type](self, "type") == 2
    || -[SBUIPasscodeBiometricAuthenticationView type](self, "type") == 3;
  v6 = -[SBUIPasscodeBiometricAuthenticationView type](self, "type");
  touchIDGlyphLayoutGuide = self->_touchIDGlyphLayoutGuide;
  if (v4 == 1)
  {
    if (!touchIDGlyphLayoutGuide)
    {
      v8 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
      v9 = self->_touchIDGlyphLayoutGuide;
      self->_touchIDGlyphLayoutGuide = v8;

      -[SBUIPasscodeBiometricAuthenticationView addLayoutGuide:](self, "addLayoutGuide:", self->_touchIDGlyphLayoutGuide);
    }
    if (!self->_touchIDGlyphView)
    {
      v107 = 0;
      v108 = &v107;
      v109 = 0x2050000000;
      v10 = (void *)getPKGlyphViewClass_softClass;
      v110 = getPKGlyphViewClass_softClass;
      if (!getPKGlyphViewClass_softClass)
      {
        v106[0] = MEMORY[0x1E0C809B0];
        v106[1] = 3221225472;
        v106[2] = __getPKGlyphViewClass_block_invoke;
        v106[3] = &unk_1E4C3E458;
        v106[4] = &v107;
        __getPKGlyphViewClass_block_invoke((uint64_t)v106);
        v10 = (void *)v108[3];
      }
      v11 = objc_retainAutorelease(v10);
      _Block_object_dispose(&v107, 8);
      v12 = (PKGlyphView *)objc_msgSend([v11 alloc], "initWithStyle:", 4);
      touchIDGlyphView = self->_touchIDGlyphView;
      self->_touchIDGlyphView = v12;

      v14 = self->_touchIDGlyphView;
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scale");
      -[PKGlyphView updateRasterizationScale:](v14, "updateRasterizationScale:");

      -[PKGlyphView setTranslatesAutoresizingMaskIntoConstraints:](self->_touchIDGlyphView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PKGlyphView setState:](self->_touchIDGlyphView, "setState:", 0);
      -[PKGlyphView setAlpha:](self->_touchIDGlyphView, "setAlpha:", 0.8);
      -[SBUIPasscodeBiometricAuthenticationView addSubview:](self, "addSubview:", self->_touchIDGlyphView);
    }
    if (!self->_touchIDReasonLabel)
    {
      v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
      touchIDReasonLabel = self->_touchIDReasonLabel;
      self->_touchIDReasonLabel = v16;

      v18 = self->_touchIDReasonLabel;
      objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory((void *)*MEMORY[0x1E0CEB3E0], 18.0));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v18, "setFont:", v19);

      v20 = self->_touchIDReasonLabel;
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v20, "setBackgroundColor:", v21);

      v22 = self->_touchIDReasonLabel;
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.48);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v22, "setTextColor:", v23);

      -[UILabel layer](self->_touchIDReasonLabel, "layer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setCompositingFilter:", v25);

      -[UILabel setTextAlignment:](self->_touchIDReasonLabel, "setTextAlignment:", 1);
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_touchIDReasonLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UILabel setNumberOfLines:](self->_touchIDReasonLabel, "setNumberOfLines:", 0);
      -[SBUIPasscodeBiometricAuthenticationView addSubview:](self, "addSubview:", self->_touchIDReasonLabel);
    }
  }
  else
  {
    -[SBUIPasscodeBiometricAuthenticationView removeLayoutGuide:](self, "removeLayoutGuide:", touchIDGlyphLayoutGuide);
    v26 = self->_touchIDGlyphLayoutGuide;
    self->_touchIDGlyphLayoutGuide = 0;

    -[PKGlyphView removeFromSuperview](self->_touchIDGlyphView, "removeFromSuperview");
    v27 = self->_touchIDGlyphView;
    self->_touchIDGlyphView = 0;

    -[UILabel removeFromSuperview](self->_touchIDReasonLabel, "removeFromSuperview");
    v28 = self->_touchIDReasonLabel;
    self->_touchIDReasonLabel = 0;

  }
  backgroundCancelButton = self->_backgroundCancelButton;
  if (v6)
  {
    if (!backgroundCancelButton)
    {
      +[SBUIButton buttonWithType:](SBUIButton, "buttonWithType:", 1);
      v30 = (UIButton *)objc_claimAutoreleasedReturnValue();
      v31 = self->_backgroundCancelButton;
      self->_backgroundCancelButton = v30;

      -[UIButton addTarget:action:forControlEvents:](self->_backgroundCancelButton, "addTarget:action:forControlEvents:", self, sel__cancelButtonHit, 1);
      -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundCancelButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIButton sbui_removePointerInteraction](self->_backgroundCancelButton, "sbui_removePointerInteraction");
      -[SBUIPasscodeBiometricAuthenticationView addSubview:](self, "addSubview:", self->_backgroundCancelButton);
      +[SBUIButton buttonWithType:](SBUIButton, "buttonWithType:", 1);
      v32 = (UIButton *)objc_claimAutoreleasedReturnValue();
      invisibleUsePasscodeButton = self->_invisibleUsePasscodeButton;
      self->_invisibleUsePasscodeButton = v32;

      -[UIButton addTarget:action:forControlEvents:](self->_invisibleUsePasscodeButton, "addTarget:action:forControlEvents:", self, sel__usePasscodeButtonHit, 64);
      -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_invisibleUsePasscodeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIButton sbui_removePointerInteraction](self->_invisibleUsePasscodeButton, "sbui_removePointerInteraction");
      -[SBUIPasscodeBiometricAuthenticationView addSubview:](self, "addSubview:", self->_invisibleUsePasscodeButton);
    }
  }
  else
  {
    -[UIButton removeFromSuperview](backgroundCancelButton, "removeFromSuperview");
    v34 = self->_backgroundCancelButton;
    self->_backgroundCancelButton = 0;

  }
  faceIDLabel = self->_faceIDLabel;
  if (v5)
  {
    if (!faceIDLabel)
    {
      v36 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
      v37 = self->_faceIDLabel;
      self->_faceIDLabel = v36;

      v38 = self->_faceIDLabel;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("FACE_ID_LABEL"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v38, "setText:", v40);

      v41 = self->_faceIDLabel;
      objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB5B8]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v41, "setFont:", v42);

      -[UILabel setAdjustsFontForContentSizeCategory:](self->_faceIDLabel, "setAdjustsFontForContentSizeCategory:", 1);
      v43 = self->_faceIDLabel;
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v43, "setBackgroundColor:", v44);

      v45 = self->_faceIDLabel;
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.48);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v45, "setTextColor:", v46);

      -[UILabel layer](self->_faceIDLabel, "layer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setCompositingFilter:", v48);

      -[UILabel setTextAlignment:](self->_faceIDLabel, "setTextAlignment:", 1);
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_faceIDLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[SBUIPasscodeBiometricAuthenticationView addSubview:](self, "addSubview:", self->_faceIDLabel);
    }
    if (!self->_faceIDReasonLabel)
    {
      v49 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
      faceIDReasonLabel = self->_faceIDReasonLabel;
      self->_faceIDReasonLabel = v49;

      v51 = self->_faceIDReasonLabel;
      objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB5B8]);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v51, "setFont:", v52);

      -[UILabel setAdjustsFontForContentSizeCategory:](self->_faceIDReasonLabel, "setAdjustsFontForContentSizeCategory:", 1);
      v53 = self->_faceIDReasonLabel;
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v53, "setBackgroundColor:", v54);

      v55 = self->_faceIDReasonLabel;
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.23);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v55, "setTextColor:", v56);

      -[UILabel layer](self->_faceIDReasonLabel, "layer");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setCompositingFilter:", v58);

      -[UILabel setTextAlignment:](self->_faceIDReasonLabel, "setTextAlignment:", 1);
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_faceIDReasonLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UILabel setNumberOfLines:](self->_faceIDReasonLabel, "setNumberOfLines:", 0);
      -[SBUIPasscodeBiometricAuthenticationView addSubview:](self, "addSubview:", self->_faceIDReasonLabel);
    }
    if (!self->_faceIDLabelAndReasonLayoutGuide)
    {
      v59 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
      faceIDLabelAndReasonLayoutGuide = self->_faceIDLabelAndReasonLayoutGuide;
      self->_faceIDLabelAndReasonLayoutGuide = v59;

      -[SBUIPasscodeBiometricAuthenticationView addLayoutGuide:](self, "addLayoutGuide:", self->_faceIDLabelAndReasonLayoutGuide);
    }
    if (!self->_faceIDLabelAndReasonHelperGuide)
    {
      v61 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
      faceIDLabelAndReasonHelperGuide = self->_faceIDLabelAndReasonHelperGuide;
      self->_faceIDLabelAndReasonHelperGuide = v61;

      -[SBUIPasscodeBiometricAuthenticationView addLayoutGuide:](self, "addLayoutGuide:", self->_faceIDLabelAndReasonHelperGuide);
    }
    if (!self->_faceIDUsePasscodeButton)
    {
      v63 = [SBUIPasscodePillButton alloc];
      v64 = -[SBUIPasscodePillButton initWithFrame:](v63, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      faceIDUsePasscodeButton = self->_faceIDUsePasscodeButton;
      self->_faceIDUsePasscodeButton = v64;

      v66 = self->_faceIDUsePasscodeButton;
      v67 = (void *)MEMORY[0x1E0CEA5E8];
      objc_msgSend(MEMORY[0x1E0CEA5F0], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB5B8], 0x8000, 1);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "fontWithDescriptor:size:", v68, 0.0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBUIPasscodePillButton setFont:](v66, "setFont:", v69);

      v70 = self->_faceIDUsePasscodeButton;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "localizedStringForKey:value:table:", CFSTR("USE_PASSCODE"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBUIPasscodePillButton setTitle:](v70, "setTitle:", v72);

      -[SBUIPasscodePillButton addTarget:action:forControlEvents:](self->_faceIDUsePasscodeButton, "addTarget:action:forControlEvents:", self, sel__usePasscodeButtonHit, 64);
      -[SBUIPasscodePillButton setAlpha:](self->_faceIDUsePasscodeButton, "setAlpha:", 0.0);
      -[SBUIPasscodePillButton setTranslatesAutoresizingMaskIntoConstraints:](self->_faceIDUsePasscodeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[SBUIPasscodeBiometricAuthenticationView addSubview:](self, "addSubview:", self->_faceIDUsePasscodeButton);
    }
  }
  else
  {
    -[UILabel removeFromSuperview](faceIDLabel, "removeFromSuperview");
    v73 = self->_faceIDLabel;
    self->_faceIDLabel = 0;

    -[UILabel removeFromSuperview](self->_faceIDReasonLabel, "removeFromSuperview");
    v74 = self->_faceIDReasonLabel;
    self->_faceIDReasonLabel = 0;

    -[SBUIPasscodePillButton removeFromSuperview](self->_faceIDUsePasscodeButton, "removeFromSuperview");
    v75 = self->_faceIDUsePasscodeButton;
    self->_faceIDUsePasscodeButton = 0;

    -[UIImageView removeFromSuperview](self->_faceIDLockIcon, "removeFromSuperview");
    faceIDLockIcon = self->_faceIDLockIcon;
    self->_faceIDLockIcon = 0;

    v77 = self->_faceIDLabelAndReasonLayoutGuide;
    self->_faceIDLabelAndReasonLayoutGuide = 0;

    v78 = self->_faceIDLabelAndReasonHelperGuide;
    self->_faceIDLabelAndReasonHelperGuide = 0;

  }
  touchIDUsePasscodeButton = self->_touchIDUsePasscodeButton;
  if (v4 == 1)
  {
    if (!touchIDUsePasscodeButton)
    {
      +[SBUIButton buttonWithType:](SBUIButton, "buttonWithType:", 1);
      v80 = (SBUIButton *)objc_claimAutoreleasedReturnValue();
      v81 = self->_touchIDUsePasscodeButton;
      self->_touchIDUsePasscodeButton = v80;

      v82 = self->_touchIDUsePasscodeButton;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "localizedStringForKey:value:table:", CFSTR("USE_PASSCODE"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBUIButton setTitle:forState:](v82, "setTitle:forState:", v84, 0);

      -[SBUIButton addTarget:action:forControlEvents:](self->_touchIDUsePasscodeButton, "addTarget:action:forControlEvents:", self, sel__usePasscodeButtonHit, 64);
      v85 = self->_touchIDUsePasscodeButton;
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.48);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBUIButton setTitleColor:forState:](v85, "setTitleColor:forState:", v86, 0);

      -[SBUIButton layer](self->_touchIDUsePasscodeButton, "layer");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setCompositingFilter:", v88);

      -[SBUIPasscodeBiometricAuthenticationView addSubview:](self, "addSubview:", self->_touchIDUsePasscodeButton);
    }
  }
  else
  {
    -[SBUIButton removeFromSuperview](touchIDUsePasscodeButton, "removeFromSuperview");
    v89 = self->_touchIDUsePasscodeButton;
    self->_touchIDUsePasscodeButton = 0;

  }
  if (!self->_cancelButtonLayoutGuide)
  {
    v90 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
    cancelButtonLayoutGuide = self->_cancelButtonLayoutGuide;
    self->_cancelButtonLayoutGuide = v90;

    -[SBUIPasscodeBiometricAuthenticationView addLayoutGuide:](self, "addLayoutGuide:", self->_cancelButtonLayoutGuide);
  }
  if (!self->_cancelButton)
  {
    +[SBUIButton buttonWithType:](SBUIButton, "buttonWithType:", 1);
    v92 = (SBUIButton *)objc_claimAutoreleasedReturnValue();
    cancelButton = self->_cancelButton;
    self->_cancelButton = v92;

    v94 = self->_cancelButton;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "localizedStringForKey:value:table:", CFSTR("PASSCODE_CANCEL"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIButton setTitle:forState:](v94, "setTitle:forState:", v96, 0);

    -[SBUIButton addTarget:action:forControlEvents:](self->_cancelButton, "addTarget:action:forControlEvents:", self, sel__cancelButtonHit, 64);
    v97 = self->_cancelButton;
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIButton setTitleColor:forState:](v97, "setTitleColor:forState:", v98, 0);

    -[SBUIPasscodeBiometricAuthenticationView addSubview:](self, "addSubview:", self->_cancelButton);
  }
  if (!self->_emergencyCallButton)
  {
    +[SBUIButton buttonWithType:](SBUIButton, "buttonWithType:", 1);
    v99 = (SBUIButton *)objc_claimAutoreleasedReturnValue();
    emergencyCallButton = self->_emergencyCallButton;
    self->_emergencyCallButton = v99;

    v101 = self->_emergencyCallButton;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "localizedStringForKey:value:table:", CFSTR("PASSCODE_EMERGENCY"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIButton setTitle:forState:](v101, "setTitle:forState:", v103, 0);

    -[SBUIButton addTarget:action:forControlEvents:](self->_emergencyCallButton, "addTarget:action:forControlEvents:", self, sel__emergencyCallButtonHit, 64);
    v104 = self->_emergencyCallButton;
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIButton setTitleColor:forState:](v104, "setTitleColor:forState:", v105, 0);

    -[SBUIButton setExclusiveTouch:](self->_emergencyCallButton, "setExclusiveTouch:", 1);
    -[SBUIPasscodeBiometricAuthenticationView addSubview:](self, "addSubview:", self->_emergencyCallButton);
  }
}

- (void)_updateConstraints
{
  unint64_t v3;
  SBUIButton *emergencyCallButton;
  UIButton *invisibleUsePasscodeButton;
  void *v6;
  _QWORD *v7;
  SBUIButton *cancelButton;
  UIButton *backgroundCancelButton;
  uint64_t v10;
  SBUIButton *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  id *p_isa;
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
  uint64_t v37;
  NSLayoutConstraint *faceIDLabelFaceIDReasonBaselineConstraint;
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
  uint64_t v56;
  id *v57;
  void *v58;
  uint64_t v59;
  double v60;
  uint64_t v61;
  int *v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  double v101;
  double v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  uint64_t v158;
  void *v159;
  void *v160;
  void *v161;
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  SBUIPasscodeBiometricAuthenticationView *v169;
  void *v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  _QWORD v175[2];
  _QWORD v176[2];
  _QWORD v177[4];
  _QWORD v178[2];
  _QWORD v179[4];
  _QWORD v180[10];
  _QWORD v181[14];
  _BYTE v182[128];
  _QWORD v183[2];
  _QWORD v184[4];
  _QWORD v185[6];

  v185[4] = *MEMORY[0x1E0C80C00];
  v3 = -[SBUIPasscodeBiometricAuthenticationView type](self, "type");
  v169 = self;
  if (v3 - 2 < 2)
  {
    emergencyCallButton = self->_emergencyCallButton;
    v185[0] = self->_cancelButton;
    v185[1] = emergencyCallButton;
    invisibleUsePasscodeButton = self->_invisibleUsePasscodeButton;
    v185[2] = self->_backgroundCancelButton;
    v185[3] = invisibleUsePasscodeButton;
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = v185;
LABEL_5:
    v10 = 4;
    goto LABEL_7;
  }
  if (v3 == 1)
  {
    cancelButton = self->_cancelButton;
    v184[0] = self->_touchIDUsePasscodeButton;
    v184[1] = cancelButton;
    backgroundCancelButton = self->_backgroundCancelButton;
    v184[2] = self->_emergencyCallButton;
    v184[3] = backgroundCancelButton;
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = v184;
    goto LABEL_5;
  }
  v11 = self->_emergencyCallButton;
  v183[0] = self->_cancelButton;
  v183[1] = v11;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = v183;
  v10 = 2;
LABEL_7:
  objc_msgSend(v6, "arrayWithObjects:count:", v7, v10);
  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v171, v182, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v172;
    v16 = (void *)*MEMORY[0x1E0CEB3E0];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v172 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * i);
        objc_msgSend(v18, "setUserInteractionEnabled:", 1);
        objc_msgSend(v18, "setClipsToBounds:", 1);
        objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setBackgroundColor:", v19);

        objc_msgSend(v18, "titleLabel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory(v16, 16.0));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setFont:", v21);

        objc_msgSend(v20, "setLineBreakMode:", 5);
        objc_msgSend(v20, "setAdjustsFontSizeToFitWidth:", 1);
        objc_msgSend(v20, "setMinimumScaleFactor:", 1.0);
        objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v18, "setContentHorizontalAlignment:", 0);
        LODWORD(v22) = 1144750080;
        objc_msgSend(v18, "setContentCompressionResistancePriority:forAxis:", 0, v22);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v171, v182, 16);
    }
    while (v14);
  }

  p_isa = (id *)&v169->super.super.super.super.isa;
  -[SBUIPasscodePillButton widthAnchor](v169->_faceIDUsePasscodeButton, "widthAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", 225.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v26) = 1132068864;
  v168 = v25;
  objc_msgSend(v25, "setPriority:", v26);
  if (-[SBUIPasscodeBiometricAuthenticationView type](v169, "type") == 2
    || -[SBUIPasscodeBiometricAuthenticationView type](v169, "type") == 3)
  {
    v125 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel centerXAnchor](v169->_faceIDLabel, "centerXAnchor");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeBiometricAuthenticationView centerXAnchor](v169, "centerXAnchor");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "constraintEqualToAnchor:", v159);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    v181[0] = v155;
    -[UILabel centerXAnchor](v169->_faceIDReasonLabel, "centerXAnchor");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeBiometricAuthenticationView centerXAnchor](v169, "centerXAnchor");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "constraintEqualToAnchor:", v146);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v181[1] = v144;
    -[UILayoutGuide topAnchor](v169->_faceIDLabelAndReasonLayoutGuide, "topAnchor");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel topAnchor](v169->_faceIDLabel, "topAnchor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "constraintEqualToAnchor:", v139);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v181[2] = v137;
    -[UILayoutGuide bottomAnchor](v169->_faceIDLabelAndReasonLayoutGuide, "bottomAnchor");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v169->_faceIDReasonLabel, "bottomAnchor");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "constraintEqualToAnchor:", v133);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v181[3] = v131;
    -[UILayoutGuide topAnchor](v169->_faceIDLabelAndReasonHelperGuide, "topAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeBiometricAuthenticationView topAnchor](v169, "topAnchor");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "constraintEqualToAnchor:", v127);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v181[4] = v123;
    -[UILayoutGuide heightAnchor](v169->_faceIDLabelAndReasonHelperGuide, "heightAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeBiometricAuthenticationView heightAnchor](v169, "heightAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "constraintEqualToAnchor:multiplier:", v119, 0.48);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v181[5] = v117;
    -[UILayoutGuide centerYAnchor](v169->_faceIDLabelAndReasonLayoutGuide, "centerYAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v169->_faceIDLabelAndReasonHelperGuide, "bottomAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "constraintEqualToAnchor:", v114);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v181[6] = v113;
    -[SBUIPasscodePillButton centerXAnchor](v169->_faceIDUsePasscodeButton, "centerXAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeBiometricAuthenticationView centerXAnchor](v169, "centerXAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "constraintEqualToAnchor:", v111);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v181[7] = v110;
    -[SBUIPasscodePillButton centerYAnchor](v169->_faceIDUsePasscodeButton, "centerYAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide centerYAnchor](v169->_faceIDLabelAndReasonLayoutGuide, "centerYAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "constraintEqualToAnchor:", v108);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v181[8] = v107;
    v181[9] = v25;
    -[UIButton widthAnchor](v169->_invisibleUsePasscodeButton, "widthAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintEqualToConstant:", 200.0);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v181[10] = v105;
    -[UIButton heightAnchor](v169->_invisibleUsePasscodeButton, "heightAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "constraintEqualToConstant:", 150.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v181[11] = v27;
    -[UIButton centerXAnchor](v169->_invisibleUsePasscodeButton, "centerXAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeBiometricAuthenticationView centerXAnchor](v169, "centerXAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v181[12] = v30;
    -[UIButton centerYAnchor](v169->_invisibleUsePasscodeButton, "centerYAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide centerYAnchor](v169->_faceIDLabelAndReasonLayoutGuide, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v181[13] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v181, 14);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "activateConstraints:", v34);

    p_isa = (id *)&v169->super.super.super.super.isa;
    -[UILabel firstBaselineAnchor](v169->_faceIDReasonLabel, "firstBaselineAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](v169->_faceIDLabel, "firstBaselineAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeBiometricAuthenticationView _leadingForFaceIDReason](v169, "_leadingForFaceIDReason");
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36);
    v37 = objc_claimAutoreleasedReturnValue();
    faceIDLabelFaceIDReasonBaselineConstraint = v169->_faceIDLabelFaceIDReasonBaselineConstraint;
    v169->_faceIDLabelFaceIDReasonBaselineConstraint = (NSLayoutConstraint *)v37;

    -[NSLayoutConstraint setActive:](v169->_faceIDLabelFaceIDReasonBaselineConstraint, "setActive:", 1);
  }
  if (objc_msgSend(p_isa, "type") == 1)
  {
    v138 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(p_isa[65], "heightAnchor");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "constraintEqualToConstant:", 66.0);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v180[0] = v160;
    objc_msgSend(p_isa[65], "widthAnchor");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "constraintEqualToConstant:", 66.0);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v180[1] = v152;
    objc_msgSend(p_isa[65], "centerXAnchor");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "centerXAnchor");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "constraintEqualToAnchor:", v147);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v180[2] = v145;
    objc_msgSend(p_isa[76], "topAnchor");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "topAnchor");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "constraintEqualToAnchor:", v142);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v180[3] = v140;
    objc_msgSend(p_isa[76], "heightAnchor");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "heightAnchor");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "constraintEqualToAnchor:multiplier:constant:", v134, 0.4, 33.0);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v180[4] = v132;
    objc_msgSend(p_isa[65], "bottomAnchor");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[76], "bottomAnchor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "constraintEqualToAnchor:", v128);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v180[5] = v126;
    objc_msgSend(p_isa[70], "centerXAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "centerXAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "constraintEqualToAnchor:", v122);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v180[6] = v120;
    objc_msgSend(p_isa[70], "firstBaselineAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[65], "bottomAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "constraintEqualToAnchor:constant:", v116, 36.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v180[7] = v39;
    objc_msgSend(p_isa[63], "centerXAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "centerXAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v180[8] = v42;
    objc_msgSend(p_isa[63], "firstBaselineAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[70], "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, 56.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v180[9] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v180, 10);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "activateConstraints:", v46);

    p_isa = (id *)&v169->super.super.super.super.isa;
  }
  if (objc_msgSend(p_isa, "type"))
  {
    v148 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(p_isa[68], "topAnchor");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "topAnchor");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "constraintEqualToAnchor:", v161);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v179[0] = v157;
    objc_msgSend(p_isa[68], "leadingAnchor");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "leadingAnchor");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "constraintEqualToAnchor:", v151);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v179[1] = v47;
    objc_msgSend(p_isa[68], "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v179[2] = v50;
    objc_msgSend(p_isa[68], "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:constant:", v52, -50.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v179[3] = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v179, 4);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "activateConstraints:", v54);

    p_isa = (id *)&v169->super.super.super.super.isa;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "userInterfaceIdiom");

  if ((v56 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "userInterfaceIdiom");

    if ((v76 & 0xFFFFFFFFFFFFFFFBLL) == 1
      || (unint64_t)(objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation") - 1) < 2)
    {
      objc_msgSend(p_isa, "rightAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa[67], "rightAnchor");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "constraintGreaterThanOrEqualToAnchor:", v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setActive:", 1);

      objc_msgSend(p_isa[66], "leftAnchor");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa, "leftAnchor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "constraintGreaterThanOrEqualToAnchor:", v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "setActive:", 1);

    }
    v89 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_cancelButton, _emergencyCallButton"), p_isa[67], p_isa[66], 0);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[_emergencyCallButton]-(>=10)-[_cancelButton]"), 0x10000, 0, v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "activateConstraints:", v91);

    objc_msgSend(p_isa, "layoutDelegate");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "passcodeBiometricAuthenticationViewSideButtonsOffsetFromCenter:", p_isa);
    v93 = v92;
    v163 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(p_isa[66], "centerXAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "centerXAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "constraintEqualToAnchor:constant:", v95, -v93);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v176[0] = v96;
    objc_msgSend(p_isa[67], "centerXAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "centerXAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintEqualToAnchor:constant:", v98, v93);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v176[1] = v99;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v176, 2);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "activateConstraints:", v100);

    objc_msgSend(v170, "passcodeBiometricAuthenticationViewNumberPadAncillaryButtonOffsetFromTopOfScreen:", p_isa);
    v102 = v101;
    v63 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(p_isa[67], "centerYAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "topAnchor");
    v103 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:constant:", v103, v102);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v175[0] = v68;
    objc_msgSend(p_isa[66], "centerYAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[67], "centerYAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v175[1] = v72;
    v73 = (void *)MEMORY[0x1E0C99D20];
    v69 = (void *)v103;
    v74 = v175;
    goto LABEL_33;
  }
  v57 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "preferredContentSizeCategory");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v58))
  {
    v59 = objc_msgSend(p_isa, "type");

    if (v59)
    {
      v60 = dbl_1A47AEA10[(unint64_t)(objc_msgSend(*v57, "activeInterfaceOrientation") - 1) < 2];
      v61 = objc_msgSend(p_isa, "type");
      v62 = &OBJC_IVAR___SBUIPasscodeBiometricAuthenticationView__faceIDReasonLabel;
      if (v61 == 1)
        v62 = &OBJC_IVAR___SBUIPasscodeBiometricAuthenticationView__touchIDUsePasscodeButton;
      v63 = (void *)MEMORY[0x1E0CB3718];
      v64 = p_isa[67];
      v65 = *(id *)((char *)p_isa + *v62);
      objc_msgSend(v64, "centerXAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa, "centerXAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v170 = v66;
      objc_msgSend(v66, "constraintEqualToAnchor:", v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v178[0] = v68;
      v69 = v65;
      objc_msgSend(p_isa[67], "topAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "bottomAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "constraintEqualToAnchor:constant:", v71, v60);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v178[1] = v72;
      v73 = (void *)MEMORY[0x1E0C99D20];
      v74 = v178;
LABEL_33:
      objc_msgSend(v73, "arrayWithObjects:count:", v74, 2);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "activateConstraints:", v83);
      goto LABEL_34;
    }
  }
  else
  {

  }
  v167 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(p_isa[77], "topAnchor");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(p_isa, "topAnchor");
  v162 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "constraintEqualToAnchor:", v162);
  v158 = objc_claimAutoreleasedReturnValue();
  v177[0] = v158;
  objc_msgSend(p_isa[77], "heightAnchor");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(p_isa, "heightAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "constraintEqualToAnchor:multiplier:", v70, 0.6);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v177[1] = v71;
  objc_msgSend(p_isa[67], "centerXAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(p_isa, "centerXAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v177[2] = v84;
  objc_msgSend(p_isa[67], "topAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(p_isa[77], "bottomAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v177[3] = v87;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v177, 4);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "activateConstraints:", v88);

  v67 = (void *)v162;
  v69 = (void *)v158;

  v68 = v154;
LABEL_34:

}

- (void)setShowsLockIconForFaceID:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  UIImageView *faceIDLockIcon;
  void *v7;
  void *v8;
  void *v9;
  UIImageView *v10;
  UIImageView *v11;
  UIImageView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UIImageView *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  if (self->_showsLockIconForFaceID != a3)
  {
    v3 = a3;
    self->_showsLockIconForFaceID = a3;
    v5 = -[SBUIPasscodeBiometricAuthenticationView type](self, "type") == 2
      || -[SBUIPasscodeBiometricAuthenticationView type](self, "type") == 3;
    -[UILabel setHidden:](self->_faceIDLabel, "setHidden:", v3);
    faceIDLockIcon = self->_faceIDLockIcon;
    if (v3 && v5 && !faceIDLockIcon)
    {
      v7 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 4, 2, 46.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "systemImageNamed:withConfiguration:", CFSTR("lock.fill"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v9);
      v11 = self->_faceIDLockIcon;
      self->_faceIDLockIcon = v10;

      v12 = self->_faceIDLockIcon;
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](v12, "setTintColor:", v13);

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_faceIDLockIcon, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[SBUIPasscodeBiometricAuthenticationView addSubview:](self, "addSubview:", self->_faceIDLockIcon);
      v14 = (void *)MEMORY[0x1E0CB3718];
      -[UIImageView centerXAnchor](self->_faceIDLockIcon, "centerXAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBUIPasscodeBiometricAuthenticationView centerXAnchor](self, "centerXAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v17;
      -[UIImageView bottomAnchor](self->_faceIDLockIcon, "bottomAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel bottomAnchor](self->_faceIDLabel, "bottomAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "activateConstraints:", v21);

      -[SBUIPasscodeBiometricAuthenticationView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    }
    else
    {
      -[UIImageView removeFromSuperview](faceIDLockIcon, "removeFromSuperview");
      v22 = self->_faceIDLockIcon;
      self->_faceIDLockIcon = 0;

    }
  }
}

- (void)setPasscodeButtonTitle:(id)a3
{
  -[SBUIPasscodePillButton setTitle:](self->_faceIDUsePasscodeButton, "setTitle:", a3);
}

- (void)_setTouchIDReason:(id)a3
{
  NSString *v4;
  NSString *touchIDReason;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_touchIDReason, "isEqualToString:") && self->_touchIDReasonLabel)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    touchIDReason = self->_touchIDReason;
    self->_touchIDReason = v4;

    -[UILabel setText:](self->_touchIDReasonLabel, "setText:", self->_touchIDReason);
    -[SBUIPasscodeBiometricAuthenticationView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_setFaceIDReason:(id)a3
{
  NSString *v4;
  NSString *faceIDReason;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_faceIDReason, "isEqualToString:") && self->_faceIDLabel)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    faceIDReason = self->_faceIDReason;
    self->_faceIDReason = v4;

    -[UILabel setText:](self->_faceIDLabel, "setText:", self->_faceIDReason);
    -[SBUIPasscodeBiometricAuthenticationView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_setFaceIDReasonLine2:(id)a3
{
  NSString *v4;
  NSString *faceIDReasonLine2;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_faceIDReasonLine2, "isEqualToString:") && self->_faceIDReasonLabel)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    faceIDReasonLine2 = self->_faceIDReasonLine2;
    self->_faceIDReasonLine2 = v4;

    -[UILabel setText:](self->_faceIDReasonLabel, "setText:", self->_faceIDReasonLine2);
    -[SBUIPasscodeBiometricAuthenticationView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_usePasscodeButtonHit
{
  id v3;

  -[SBUIPasscodeBiometricAuthenticationView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passcodeBiometricAuthenticationViewUsePasscodeButtonHit:", self);

}

- (void)_cancelButtonHit
{
  id v3;

  -[SBUIPasscodeBiometricAuthenticationView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passcodeBiometricAuthenticationViewCancelButtonHit:", self);

}

- (void)_emergencyCallButtonHit
{
  id v3;

  -[SBUIPasscodeBiometricAuthenticationView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passcodeBiometricAuthenticationViewEmergencyCallButtonHit:", self);

}

- (double)_leadingForFaceIDReason
{
  void *v2;
  double v3;
  double v4;

  -[UILabel font](self->_faceIDReasonLabel, "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_bodyLeading");
  v4 = v3;

  return v4;
}

- (void)_noteContentSizeCategoryDidChange
{
  NSLayoutConstraint *faceIDLabelFaceIDReasonBaselineConstraint;

  faceIDLabelFaceIDReasonBaselineConstraint = self->_faceIDLabelFaceIDReasonBaselineConstraint;
  -[SBUIPasscodeBiometricAuthenticationView _leadingForFaceIDReason](self, "_leadingForFaceIDReason");
  -[NSLayoutConstraint setConstant:](faceIDLabelFaceIDReasonBaselineConstraint, "setConstant:");
}

- (BOOL)showsLockIconForFaceID
{
  return self->_showsLockIconForFaceID;
}

- (unint64_t)type
{
  return self->_type;
}

- (SBUIPasscodeBiometricAuthenticationViewLayoutDelegate)layoutDelegate
{
  return (SBUIPasscodeBiometricAuthenticationViewLayoutDelegate *)objc_loadWeakRetained((id *)&self->_layoutDelegate);
}

- (void)setLayoutDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_layoutDelegate, a3);
}

- (SBUIPasscodeBiometricAuthenticationViewDelegate)delegate
{
  return (SBUIPasscodeBiometricAuthenticationViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)unlockDestination
{
  return self->_unlockDestination;
}

- (BOOL)ancillaryButtonsVisible
{
  return self->_ancillaryButtonsVisible;
}

- (BOOL)faceIDUsePasscodeButtonVisible
{
  return self->_faceIDUsePasscodeButtonVisible;
}

- (NSString)overrideFaceIDReason
{
  return self->_overrideFaceIDReason;
}

- (NSString)passcodeButtonTitle
{
  return self->_passcodeButtonTitle;
}

- (NSString)touchIDReason
{
  return self->_touchIDReason;
}

- (NSString)faceIDReason
{
  return self->_faceIDReason;
}

- (NSString)faceIDReasonLine2
{
  return self->_faceIDReasonLine2;
}

- (void)_setFaceIDReason2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (SBUIButton)touchIDUsePasscodeButton
{
  return self->_touchIDUsePasscodeButton;
}

- (void)setTouchIDUsePasscodeButton:(id)a3
{
  objc_storeStrong((id *)&self->_touchIDUsePasscodeButton, a3);
}

- (SBUIPasscodePillButton)faceIDUsePasscodeButton
{
  return self->_faceIDUsePasscodeButton;
}

- (void)setFaceIDUsePasscodeButton:(id)a3
{
  objc_storeStrong((id *)&self->_faceIDUsePasscodeButton, a3);
}

- (PKGlyphView)touchIDGlyphView
{
  return self->_touchIDGlyphView;
}

- (void)setTouchIDGlyphView:(id)a3
{
  objc_storeStrong((id *)&self->_touchIDGlyphView, a3);
}

- (SBUIButton)emergencyCallButton
{
  return self->_emergencyCallButton;
}

- (void)setEmergencyCallButton:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyCallButton, a3);
}

- (SBUIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (UIButton)backgroundCancelButton
{
  return self->_backgroundCancelButton;
}

- (void)setBackgroundCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundCancelButton, a3);
}

- (UIButton)invisibleUsePasscodeButton
{
  return self->_invisibleUsePasscodeButton;
}

- (void)setInvisibleUsePasscodeButton:(id)a3
{
  objc_storeStrong((id *)&self->_invisibleUsePasscodeButton, a3);
}

- (UILabel)touchIDReasonLabel
{
  return self->_touchIDReasonLabel;
}

- (void)setTouchIDReasonLabel:(id)a3
{
  objc_storeStrong((id *)&self->_touchIDReasonLabel, a3);
}

- (UILabel)faceIDLabel
{
  return self->_faceIDLabel;
}

- (void)setFaceIDLabel:(id)a3
{
  objc_storeStrong((id *)&self->_faceIDLabel, a3);
}

- (UILabel)faceIDReasonLabel
{
  return self->_faceIDReasonLabel;
}

- (void)setFaceIDReasonLabel:(id)a3
{
  objc_storeStrong((id *)&self->_faceIDReasonLabel, a3);
}

- (UIImageView)faceIDLockIcon
{
  return self->_faceIDLockIcon;
}

- (void)setFaceIDLockIcon:(id)a3
{
  objc_storeStrong((id *)&self->_faceIDLockIcon, a3);
}

- (UILayoutGuide)faceIDLabelAndReasonHelperGuide
{
  return self->_faceIDLabelAndReasonHelperGuide;
}

- (void)setFaceIDLabelAndReasonHelperGuide:(id)a3
{
  objc_storeStrong((id *)&self->_faceIDLabelAndReasonHelperGuide, a3);
}

- (UILayoutGuide)faceIDLabelAndReasonLayoutGuide
{
  return self->_faceIDLabelAndReasonLayoutGuide;
}

- (void)setFaceIDLabelAndReasonLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_faceIDLabelAndReasonLayoutGuide, a3);
}

- (UILayoutGuide)touchIDGlyphLayoutGuide
{
  return self->_touchIDGlyphLayoutGuide;
}

- (void)setTouchIDGlyphLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_touchIDGlyphLayoutGuide, a3);
}

- (UILayoutGuide)cancelButtonLayoutGuide
{
  return self->_cancelButtonLayoutGuide;
}

- (void)setCancelButtonLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButtonLayoutGuide, a3);
}

- (NSLayoutConstraint)faceIDLabelFaceIDReasonBaselineConstraint
{
  return self->_faceIDLabelFaceIDReasonBaselineConstraint;
}

- (void)setFaceIDLabelFaceIDReasonBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_faceIDLabelFaceIDReasonBaselineConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceIDLabelFaceIDReasonBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_cancelButtonLayoutGuide, 0);
  objc_storeStrong((id *)&self->_touchIDGlyphLayoutGuide, 0);
  objc_storeStrong((id *)&self->_faceIDLabelAndReasonLayoutGuide, 0);
  objc_storeStrong((id *)&self->_faceIDLabelAndReasonHelperGuide, 0);
  objc_storeStrong((id *)&self->_faceIDLockIcon, 0);
  objc_storeStrong((id *)&self->_faceIDReasonLabel, 0);
  objc_storeStrong((id *)&self->_faceIDLabel, 0);
  objc_storeStrong((id *)&self->_touchIDReasonLabel, 0);
  objc_storeStrong((id *)&self->_invisibleUsePasscodeButton, 0);
  objc_storeStrong((id *)&self->_backgroundCancelButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_emergencyCallButton, 0);
  objc_storeStrong((id *)&self->_touchIDGlyphView, 0);
  objc_storeStrong((id *)&self->_faceIDUsePasscodeButton, 0);
  objc_storeStrong((id *)&self->_touchIDUsePasscodeButton, 0);
  objc_storeStrong((id *)&self->_faceIDReasonLine2, 0);
  objc_storeStrong((id *)&self->_faceIDReason, 0);
  objc_storeStrong((id *)&self->_touchIDReason, 0);
  objc_storeStrong((id *)&self->_passcodeButtonTitle, 0);
  objc_storeStrong((id *)&self->_overrideFaceIDReason, 0);
  objc_storeStrong((id *)&self->_unlockDestination, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_layoutDelegate);
}

@end
