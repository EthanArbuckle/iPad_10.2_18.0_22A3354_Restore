@implementation VTUIEnrollmentSetupIntroView

- (VTUIEnrollmentSetupIntroView)initWithFrame:(CGRect)a3
{
  VTUIEnrollmentSetupIntroView *v3;
  VTUIEnrollmentSetupIntroView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollmentSetupIntroView;
  v3 = -[VTUIEnrollmentBaseView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[VTUIEnrollmentSetupIntroView _setupContent](v3, "_setupContent");
  return v4;
}

- (void)_setupContent
{
  NSObject *v3;
  void *v4;
  NSString *v5;
  NSString *languageCode;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  VTUIButton *laterButton;
  void *v22;
  int v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 136315138;
    v24 = "-[VTUIEnrollmentSetupIntroView _setupContent]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Setup content", (uint8_t *)&v23, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageCode");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  languageCode = self->_languageCode;
  self->_languageCode = v5;

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "enrollmentMode");
  v9 = CFSTR("ASSISTANT_TRIGGER_INSTRUCTION");
  if (v8 == 3)
    v9 = CFSTR("ASSISTANT_TRIGGER_INSTRUCTION_SIRI_ONLY");
  if (v8 == 4)
    v10 = CFSTR("TEXT_TITLE_SETUP_HEYSIRI");
  else
    v10 = CFSTR("TEXT_TITLE_CONS");
  if (v8 == 4)
    v11 = CFSTR("HEY_SIRI_DESCRIPTION");
  else
    v11 = CFSTR("ASSISTANT_DESCRIPTION");
  if (v8 == 4)
    v12 = 0;
  else
    v12 = v9;
  if (v8 == 4)
    v13 = CFSTR("BUTTON_SET_UP_LATER");
  else
    v13 = CFSTR("BUTTON_CONTINUE_LATER");
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uiLocalizedStringForKey:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollmentBaseView setTitle:](self, "setTitle:", v15);

  objc_msgSend(v7, "VTUIDeviceSpecificString:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollmentBaseView setSubtitle:](self, "setSubtitle:", v16);

  objc_msgSend(v7, "VTUIDeviceSpecificString:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollmentBaseView setInstructionText:](self, "setInstructionText:", v17);

  if (objc_msgSend(v7, "isBuddyOrFollowUp")
    && objc_msgSend(v7, "bluetoothDeviceSupportsHeySiri"))
  {
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uiLocalizedStringForKey:", CFSTR("TEXT_TITLE_SETUP_HEYSIRI"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIEnrollmentBaseView setTitle:](self, "setTitle:", v19);

    objc_msgSend(v7, "proxHSDescription:", CFSTR("HEY_SIRI_DESCRIPTION_PROX"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIEnrollmentBaseView setSubtitle:](self, "setSubtitle:", v20);

    -[VTUIEnrollmentBaseView setInstructionText:](self, "setInstructionText:", &stru_24F340078);
  }
  laterButton = self->_laterButton;
  objc_msgSend(v7, "VTUIDeviceSpecificString:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton setTitle:forState:](laterButton, "setTitle:forState:", v22, 0);

}

- (id)_createFooterWithTextFieldShowlaterButton:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  VTUIButton *v8;
  VTUIButton *continueButton;
  void *v10;
  NSString *v11;
  NSString *languageCode;
  void *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  VTUIButton *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  VTUIButton *v28;
  VTUIButton *laterButton;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
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
  _BOOL4 v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[4];
  _QWORD v62[6];

  v56 = a3;
  v62[4] = *MEMORY[0x24BDAC8D0];
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BEBDB00]);
  v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[VTUIButton _vtuiButtonWithPrimaryStyle](VTUIButton, "_vtuiButtonWithPrimaryStyle");
  v8 = (VTUIButton *)objc_claimAutoreleasedReturnValue();
  continueButton = self->_continueButton;
  self->_continueButton = v8;

  -[VTUIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_continueButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "addSubview:", self->_continueButton);
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "languageCode");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  languageCode = self->_languageCode;
  self->_languageCode = v11;

  -[VTUIEnrollmentSetupIntroView languageCode](self, "languageCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v5;
  if (objc_msgSend(v5, "isSATEnrolledForSiriProfileId:forLanguageCode:", 0, v13))
  {

LABEL_5:
    v16 = CFSTR("BUTTON_USE_SIRI");
    goto LABEL_8;
  }
  if ((PSIsRunningInAssistant() & 1) != 0)
  {
    -[VTUIEnrollmentSetupIntroView languageCode](self, "languageCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v5, "hasVoiceProfileIniCloudForLanguageCode:", v14);

    if (v15)
      goto LABEL_5;
  }
  else
  {

  }
  v16 = CFSTR("BUTTON_CONTINUE_SETUP");
LABEL_8:
  v55 = v7;
  v17 = self->_continueButton;
  objc_msgSend(v4, "VTUIDeviceSpecificString:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton setTitle:forState:](v17, "setTitle:forState:", v18, 0);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton topAnchor](self->_continueButton, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "continueButtonOffset");
  objc_msgSend(v52, "constraintEqualToAnchor:constant:", v50);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v48;
  -[VTUIButton centerXAnchor](self->_continueButton, "centerXAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerXAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v21;
  -[VTUIButton widthAnchor](self->_continueButton, "widthAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footerButtonMaximumWidth");
  objc_msgSend(v22, "constraintEqualToConstant:");
  v23 = v4;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v24;
  -[VTUIButton heightAnchor](self->_continueButton, "heightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v23;
  objc_msgSend(v23, "primaryButtonHeight");
  objc_msgSend(v25, "constraintEqualToConstant:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v19;
  objc_msgSend(v19, "addObjectsFromArray:", v27);

  if (v56)
  {
    +[VTUIButton _vtuiButtonWithSecondaryStyle](VTUIButton, "_vtuiButtonWithSecondaryStyle");
    v28 = (VTUIButton *)objc_claimAutoreleasedReturnValue();
    laterButton = self->_laterButton;
    self->_laterButton = v28;

    -[VTUIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_laterButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v30 = v55;
    objc_msgSend(v55, "addSubview:", self->_laterButton);
    -[VTUIButton leadingAnchor](self->_laterButton, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "leadingAnchor");
    v57 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v57);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v31;
    -[VTUIButton trailingAnchor](self->_laterButton, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v53);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v49;
    -[VTUIButton firstBaselineAnchor](self->_laterButton, "firstBaselineAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIButton bottomAnchor](self->_continueButton, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "laterButtonBaselinePadding");
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v45);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v33;
    -[VTUIButton bottomAnchor](self->_laterButton, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "footerSkipButtonBaselineFromBottom");
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, -v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v61[3] = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v58;
    objc_msgSend(v58, "addObjectsFromArray:", v38);

    v40 = v51;
    v41 = v54;
    v42 = (void *)v57;
  }
  else
  {
    -[VTUIButton bottomAnchor](self->_continueButton, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v55;
    objc_msgSend(v55, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v54;
    objc_msgSend(v54, "continueButtonFromBottom");
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v42, -v43);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v60, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v19;
    objc_msgSend(v19, "addObjectsFromArray:", v32);
  }

  objc_msgSend(v30, "addConstraints:", v39);
  return v30;
}

- (BOOL)showPrivacyTextView
{
  void *v2;
  char v3;

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBuddyOrFollowUp");

  return v3;
}

- (id)footerView
{
  void *v3;
  UIView *footerView;
  uint64_t v5;
  UIView *v6;
  UIView *v7;

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isBuddyOrFollowUp"))
  {
    footerView = self->_footerView;

    if (!footerView)
    {
      v5 = 1;
LABEL_7:
      -[VTUIEnrollmentSetupIntroView _createFooterWithTextFieldShowlaterButton:](self, "_createFooterWithTextFieldShowlaterButton:", v5);
      v6 = (UIView *)objc_claimAutoreleasedReturnValue();
      v7 = self->_footerView;
      self->_footerView = v6;

      return self->_footerView;
    }
  }
  else
  {

  }
  if (!self->_footerView)
  {
    v5 = 0;
    goto LABEL_7;
  }
  return self->_footerView;
}

- (VTUIButton)laterButton
{
  return self->_laterButton;
}

- (VTUIButton)continueButton
{
  return self->_continueButton;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_laterButton, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
}

@end
