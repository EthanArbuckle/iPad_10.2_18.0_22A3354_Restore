@implementation VTUIEnrollmentSuccessView

- (VTUIEnrollmentSuccessView)initWithFrame:(CGRect)a3
{
  VTUIEnrollmentSuccessView *v3;
  VTUIEnrollmentSuccessView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollmentSuccessView;
  v3 = -[VTUIEnrollmentBaseView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[VTUIEnrollmentSuccessView _setupContent](v3, "_setupContent");
  return v4;
}

- (void)_setupContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollmentSuccessView setBackgroundColor:](self, "setBackgroundColor:", v3);

  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiLocalizedStringForKey:", CFSTR("TEXT_TITLE_READY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollmentBaseView setTitle:](self, "setTitle:", v5);

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldSetupForMultipleTriggerPhrases");

  v8 = (void *)MEMORY[0x24BDD16A8];
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
  {
    objc_msgSend(v9, "VTUIDeviceSpecificString:", CFSTR("TEXT_MAIN_READY_MIXED"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("TEXT_MAIN_READY_MIXED_SPEAK_FREELY_SUFFIX");
  }
  else
  {
    objc_msgSend(v9, "VTUIDeviceSpecificString:", CFSTR("TEXT_MAIN_READY"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithString:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("TEXT_MAIN_READY_SPEAK_FREELY_SUFFIX");
  }
  objc_msgSend(v13, "uiLocalizedStringForKey:", v15);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "supportsSiriConversationsAndBargeIn");

  if (v18)
    objc_msgSend(v12, "appendString:", v19);
  -[VTUIEnrollmentBaseView setSubtitle:](self, "setSubtitle:", v12);

}

- (id)_createFooter
{
  void *v3;
  id v4;
  void *v5;
  VTUIButton *v6;
  VTUIButton *finishButton;
  void *v8;
  int v9;
  VTUIButton *v10;
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
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[6];

  v31[5] = *MEMORY[0x24BDAC8D0];
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BEBDB00]);
  v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[VTUIButton _vtuiButtonWithPrimaryStyle](VTUIButton, "_vtuiButtonWithPrimaryStyle");
  v6 = (VTUIButton *)objc_claimAutoreleasedReturnValue();
  finishButton = self->_finishButton;
  self->_finishButton = v6;

  -[VTUIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_finishButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "addSubview:", self->_finishButton);
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isBuddyOrFollowUp");

  v10 = self->_finishButton;
  if (v9)
  {
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "VTUIDeviceSpecificString:", CFSTR("BUTTON_CONTINUE_SETUP"));
  }
  else
  {
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uiLocalizedStringForKey:", CFSTR("BUTTON_DONE"));
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton setTitle:forState:](v10, "setTitle:forState:", v12, 0);

  v25 = (void *)MEMORY[0x24BDD1628];
  -[VTUIButton topAnchor](self->_finishButton, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "continueButtonOffset");
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v28;
  -[VTUIButton centerXAnchor](self->_finishButton, "centerXAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerXAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v13;
  -[VTUIButton widthAnchor](self->_finishButton, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "footerButtonMaximumWidth");
  objc_msgSend(v14, "constraintEqualToConstant:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v15;
  -[VTUIButton heightAnchor](self->_finishButton, "heightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryButtonHeight");
  objc_msgSend(v16, "constraintEqualToConstant:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v17;
  -[VTUIButton bottomAnchor](self->_finishButton, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "continueButtonFromBottom");
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -v20);
  v24 = v3;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "activateConstraints:", v22);

  return v5;
}

- (BOOL)showPrivacyTextView
{
  return 0;
}

- (id)footerView
{
  UIView *footerView;
  UIView *v4;
  UIView *v5;

  footerView = self->_footerView;
  if (!footerView)
  {
    -[VTUIEnrollmentSuccessView _createFooter](self, "_createFooter");
    v4 = (UIView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_footerView;
    self->_footerView = v4;

    footerView = self->_footerView;
  }
  return footerView;
}

- (void)setHidden:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTUIEnrollmentSuccessView;
  -[VTUIEnrollmentSuccessView setHidden:](&v3, sel_setHidden_, a3);
}

- (BOOL)isSuccessViewReady
{
  return 1;
}

- (void)addFinishButtonTarget:(id)a3 selector:(SEL)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[VTUIEnrollmentSuccessView finishButton](self, "finishButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forControlEvents:", v6, a4, 64);

}

- (VTUIButton)finishButton
{
  return self->_finishButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishButton, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
}

@end
