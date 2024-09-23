@implementation VTUIVoiceSelectionView

- (VTUIVoiceSelectionView)initWithAllowsRandomVoiceSelection:(BOOL)a3 showContinueButton:(BOOL)a4
{
  VTUIVoiceSelectionView *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VTUIVoiceSelectionView;
  v6 = -[VTUIVoiceSelectionView init](&v11, sel_init);
  if (v6)
  {
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIsFloatingWithReducedWidth:", 1);

    v6->_allowsRandomSelection = a3;
    v6->_shouldShowContinueButton = a4;
    -[VTUIVoiceSelectionView _setupButtons](v6, "_setupButtons");
    -[VTUIEnrollmentBaseView setShowsVerticalScrollIndicator:](v6, "setShowsVerticalScrollIndicator:", 0);
    if (!v6->_shouldShowContinueButton && !v6->_allowsRandomSelection)
    {
      -[VTUIEnrollmentBaseView backdropView](v6, "backdropView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHidden:", 1);

      -[VTUIVoiceSelectionView footerView](v6, "footerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUserInteractionEnabled:", 0);

    }
  }
  return v6;
}

- (void)tintColorDidChange
{
  UIButton *continueButton;
  void *v4;
  void *v5;
  UIButton *chooseRandomVoiceButton;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VTUIVoiceSelectionView;
  -[VTUIVoiceSelectionView tintColorDidChange](&v8, sel_tintColorDidChange);
  continueButton = self->_continueButton;
  -[VTUIVoiceSelectionView tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIButton vtuiBackgroundButtonImageWithColor:](VTUIButton, "vtuiBackgroundButtonImageWithColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setBackgroundImage:forState:](continueButton, "setBackgroundImage:forState:", v5, 0);

  chooseRandomVoiceButton = self->_chooseRandomVoiceButton;
  -[VTUIVoiceSelectionView tintColor](self, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](chooseRandomVoiceButton, "setTitleColor:forState:", v7, 0);

}

- (id)footerView
{
  UIView *footerView;
  UIView *v4;
  UIView *v5;

  footerView = self->_footerView;
  if (!footerView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    v5 = self->_footerView;
    self->_footerView = v4;

    footerView = self->_footerView;
  }
  return footerView;
}

- (void)_setupButtons
{
  void *v3;
  void *v4;
  UIButton *v5;
  UIButton *continueButton;
  UIButton *v7;
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
  double v20;
  void *v21;
  void **v22;
  double v23;
  void *v24;
  UIButton *v25;
  UIButton *chooseRandomVoiceButton;
  UIButton *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
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
  _QWORD v55[4];
  void *v56;
  void *v57;
  _QWORD v58[5];

  v58[4] = *MEMORY[0x24BDAC8D0];
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIVoiceSelectionView footerView](self, "footerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (self->_shouldShowContinueButton)
  {
    +[VTUIButton _vtuiButtonWithPrimaryStyleForNormalAndDisabledState](VTUIButton, "_vtuiButtonWithPrimaryStyleForNormalAndDisabledState");
    v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
    continueButton = self->_continueButton;
    self->_continueButton = v5;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_continueButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "addSubview:", self->_continueButton);
    v7 = self->_continueButton;
    objc_msgSend(v3, "VTUIDeviceSpecificString:", CFSTR("BUTTON_CONTINUE_SETUP"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v7, "setTitle:forState:", v8, 0);

    objc_msgSend(v4, "addSubview:", self->_continueButton);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_continueButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v46 = (void *)MEMORY[0x24BDD1628];
    -[UIButton topAnchor](self->_continueButton, "topAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "continueButtonOffset");
    objc_msgSend(v52, "constraintEqualToAnchor:constant:", v50);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v47;
    -[UIButton centerXAnchor](self->_continueButton, "centerXAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerXAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v9);
    v48 = v4;
    v10 = v3;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v11;
    -[UIButton widthAnchor](self->_continueButton, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "footerButtonMaximumWidth");
    objc_msgSend(v12, "constraintEqualToConstant:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = v13;
    -[UIButton heightAnchor](self->_continueButton, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "primaryButtonHeight");
    objc_msgSend(v14, "constraintEqualToConstant:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v58[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "activateConstraints:", v16);

    LODWORD(v14) = self->_allowsRandomSelection;
    v17 = (void *)MEMORY[0x24BDD1628];
    -[UIButton bottomAnchor](self->_continueButton, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v14)
    {
      objc_msgSend(v10, "continueButtonFromBottomTwoButtons");
      objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v21;
      v22 = &v56;
    }
    else
    {
      objc_msgSend(v10, "continueButtonFromBottom");
      objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -v23);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v21;
      v22 = &v57;
    }
    v3 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v24);

    v4 = v48;
  }
  if (self->_allowsRandomSelection)
  {
    +[VTUIButton _vtuiButtonWithSecondaryStyle](VTUIButton, "_vtuiButtonWithSecondaryStyle");
    v25 = (UIButton *)objc_claimAutoreleasedReturnValue();
    chooseRandomVoiceButton = self->_chooseRandomVoiceButton;
    self->_chooseRandomVoiceButton = v25;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_chooseRandomVoiceButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v27 = self->_chooseRandomVoiceButton;
    objc_msgSend(v3, "VTUIDeviceSpecificString:", CFSTR("BUTTON_CHOOSE_FOR_ME"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v27, "setTitle:forState:", v28, 0);

    objc_msgSend(v4, "addSubview:", self->_chooseRandomVoiceButton);
    -[UIButton topAnchor](self->_chooseRandomVoiceButton, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "continueButtonOffset");
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_shouldShowContinueButton)
    {
      -[UIButton leadingAnchor](self->_chooseRandomVoiceButton, "leadingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton leadingAnchor](self->_continueButton, "leadingAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:", v33);
      v34 = objc_claimAutoreleasedReturnValue();

      v31 = (void *)v34;
    }
    v49 = (void *)MEMORY[0x24BDD1628];
    v51 = v31;
    v55[0] = v31;
    -[UIButton widthAnchor](self->_chooseRandomVoiceButton, "widthAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "footerButtonMaximumWidth");
    objc_msgSend(v53, "constraintEqualToConstant:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v35;
    -[UIButton bottomAnchor](self->_chooseRandomVoiceButton, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v37 = v4;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "footerSkipButtonBaselineFromBottom");
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v38, -v39);
    v54 = v3;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v40;
    -[UIButton centerXAnchor](self->_chooseRandomVoiceButton, "centerXAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "centerXAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v55[3] = v43;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "activateConstraints:", v44);

    v3 = v54;
    v4 = v37;

  }
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (UIButton)chooseRandomVoiceButton
{
  return self->_chooseRandomVoiceButton;
}

- (void)setChooseRandomVoiceButton:(id)a3
{
  objc_storeStrong((id *)&self->_chooseRandomVoiceButton, a3);
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_chooseRandomVoiceButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
}

@end
