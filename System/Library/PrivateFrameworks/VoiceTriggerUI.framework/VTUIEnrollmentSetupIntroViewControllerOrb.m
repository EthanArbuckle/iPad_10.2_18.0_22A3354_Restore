@implementation VTUIEnrollmentSetupIntroViewControllerOrb

- (BOOL)isLaterButtonAvailable
{
  return self->_laterButton != 0;
}

- (void)setContinueButtonEnabled:(BOOL)a3
{
  -[VTUIButton setEnabled:](self->_continueButton, "setEnabled:", a3);
}

- (void)setLaterButtonEnabled:(BOOL)a3
{
  -[VTUIButton setEnabled:](self->_laterButton, "setEnabled:", a3);
}

- (BOOL)shouldCleanupForEnrollment
{
  return 1;
}

- (void)enrollmentWillAppear
{
  id v2;

  -[VTUIEnrollmentSetupIntroViewControllerOrb view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

}

- (VTUIEnrollmentSetupIntroViewControllerOrb)initWithDelegate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  char v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  VTUIEnrollmentSetupIntroViewControllerOrb *v22;
  VTUIEnrollmentSetupIntroViewControllerOrb *v23;
  objc_super v25;

  v4 = a3;
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldSetupForMultipleTriggerPhrases");
  self->_showSiriConversations = objc_msgSend(v5, "supportsSiriConversationsAndBargeIn");
  self->_isPostUpgradeDisclosure = objc_msgSend(v5, "shouldPresentDisclosureForCompactVoiceTrigger");
  self->_includeHomePodInDisclosure = objc_msgSend(v5, "shouldIncludeHomePodInCompactTriggerDisclosure") & (v6 ^ 1);
  if (((v6 ^ 1) & 1) != 0)
    v7 = 0;
  else
    v7 = objc_msgSend(v4, "allLanguageOptionsSupportCompactTrigger");
  self->_showMultitriggerForSetup = v7;
  v8 = objc_msgSend(v5, "enrollmentMode");
  if (v8 == 3)
  {
    v11 = CFSTR("ASSISTANT_DESCRIPTION");
    if (v6)
      v11 = CFSTR("ASSISTANT_DESCRIPTION_SHORT");
  }
  else
  {
    if (v8 == 4)
    {
      if (self->_showMultitriggerForSetup)
        v9 = CFSTR("TEXT_TITLE_SETUP_BOTH");
      else
        v9 = CFSTR("TEXT_TITLE_SETUP_HEYSIRI");
      v10 = v9;
      if (self->_showMultitriggerForSetup)
        v11 = CFSTR("HEY_SIRI_DESCRIPTION_BOTH");
      else
        v11 = CFSTR("HEY_SIRI_DESCRIPTION");
      goto LABEL_15;
    }
    if (self->_isPostUpgradeDisclosure)
    {
      v12 = CFSTR("SIRI_CONVERSATIONS_SUBTITLE");
      v10 = CFSTR("SIRI_CONVERSATIONS_TITLE");
      goto LABEL_18;
    }
    if (-[VTUIEnrollmentSetupIntroViewControllerOrb _isDeviceEligibleForSAE](self, "_isDeviceEligibleForSAE"))
    {
      v10 = CFSTR("TEXT_TITLE_CONS");
      v11 = CFSTR("ASSISTANT_DESCRIPTION_SAE_ELIGIBLE");
      goto LABEL_15;
    }
    if (self->_showMultitriggerForSetup)
      v11 = CFSTR("ASSISTANT_DESCRIPTION_SHORT");
    else
      v11 = CFSTR("ASSISTANT_DESCRIPTION");
  }
  v10 = CFSTR("TEXT_TITLE_CONS");
LABEL_15:
  v12 = v11;
LABEL_18:
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uiLocalizedStringForKey:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "VTUIDeviceSpecificString:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isBuddyOrFollowUp")
    && objc_msgSend(v5, "bluetoothDeviceSupportsHeySiri"))
  {
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uiLocalizedStringForKey:", CFSTR("TEXT_TITLE_SETUP_HEYSIRI"));
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "proxHSDescription:", CFSTR("HEY_SIRI_DESCRIPTION_PROX"));
    v18 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v17;
    v15 = (void *)v18;
  }
  v19 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("OrbImage"), v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v25.receiver = self;
  v25.super_class = (Class)VTUIEnrollmentSetupIntroViewControllerOrb;
  v22 = -[VTUIEnrollmentSetupIntroViewControllerOrb initWithTitle:detailText:icon:](&v25, sel_initWithTitle_detailText_icon_, v14, v15, v21);
  v23 = v22;
  if (v22)
  {
    objc_storeWeak((id *)&v22->_delegate, v4);
    -[VTUIEnrollmentSetupIntroViewControllerOrb _setupContent](v23, "_setupContent");
  }

  return v23;
}

- (void)_setupContent
{
  NSObject *v3;
  void *v4;
  NSString *v5;
  NSString *languageCode;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  uint64_t v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  id WeakRetained;
  void *v39;
  VTUIButton *v40;
  void *v41;
  id v42;
  void *v43;
  VTUIButton *laterButton;
  const __CFString *v45;
  void *v46;
  void *v47;
  uint8_t buf[4];
  const char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v49 = "-[VTUIEnrollmentSetupIntroViewControllerOrb _setupContent]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Setup content", buf, 0xCu);
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
  v9 = v8;
  if (self->_isPostUpgradeDisclosure)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("quote.bubble"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "VTUIDeviceSpecificString:", CFSTR("SAY_SIRI_OR_HS_BULLET_TITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "VTUIDeviceSpecificString:", CFSTR("SAY_SIRI_OR_HS_BULLET_DESC"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIEnrollmentSetupIntroViewControllerOrb addBulletedListItemWithTitle:description:image:tintColor:](self, "addBulletedListItemWithTitle:description:image:tintColor:", v11, v12, v10, v13);

    if (!self->_showSiriConversations)
    {
LABEL_20:

      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("person.wave.2"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "VTUIDeviceSpecificString:", CFSTR("SPEAK_FREELY_BULLET_TITLE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "VTUIDeviceSpecificString:", CFSTR("SPEAK_FREELY_BULLET_DESC"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIEnrollmentSetupIntroViewControllerOrb addBulletedListItemWithTitle:description:image:tintColor:](self, "addBulletedListItemWithTitle:description:image:tintColor:", v15, v16, v14, v17);
LABEL_19:

    goto LABEL_20;
  }
  if (self->_showMultitriggerForSetup && v8 != 4)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("quote.bubble"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("iphone.side.button.arrow.left"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isIpad"))
    {
      v19 = objc_msgSend(v7, "supportsSideButtonActivation");
      v20 = (void *)MEMORY[0x24BEBD640];
      if (v19)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("ipad.top.button.arrow.down"), v21, 0);
        v22 = objc_claimAutoreleasedReturnValue();

        v14 = CFSTR("PRESS_AND_HOLD_BULLET_TITLE");
        v15 = (void *)v22;
LABEL_18:
        objc_msgSend(v7, "VTUIDeviceSpecificString:", CFSTR("JUST_SAY_SIRI_BULLET_TITLE"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "VTUIDeviceSpecificString:", CFSTR("JUST_SAY_SIRI_BULLET_DESC"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[VTUIEnrollmentSetupIntroViewControllerOrb addBulletedListItemWithTitle:description:image:tintColor:](self, "addBulletedListItemWithTitle:description:image:tintColor:", v26, v27, v10, v28);

        objc_msgSend(v7, "VTUIDeviceSpecificString:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "VTUIDeviceSpecificString:", CFSTR("PRESS_AND_HOLD_BULLET_DESC"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[VTUIEnrollmentSetupIntroViewControllerOrb addBulletedListItemWithTitle:description:image:tintColor:](self, "addBulletedListItemWithTitle:description:image:tintColor:", v16, v17, v15, v29);

        goto LABEL_19;
      }
      v23 = CFSTR("ipad.gen1");
      v24 = (void *)MEMORY[0x24BEBD640];
    }
    else
    {
      if ((objc_msgSend(v7, "supportSideButtonActivation") & 1) != 0)
      {
        v14 = CFSTR("PRESS_AND_HOLD_BULLET_TITLE");
        goto LABEL_18;
      }
      v24 = (void *)MEMORY[0x24BEBD640];
      v23 = CFSTR("iphone.gen1");
    }
    objc_msgSend(v24, "_systemImageNamed:", v23);
    v25 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "VTUIDeviceSpecificString:", CFSTR("PRESS_AND_HOLD_BULLET_TITLE_HOME"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)v25;
    goto LABEL_18;
  }
LABEL_21:
  v30 = self->_isPostUpgradeDisclosure && self->_includeHomePodInDisclosure;
  v31 = objc_msgSend(v7, "enrollmentMode");
  v32 = CFSTR("BUTTON_CONTINUE_LATER");
  if (v30)
    v32 = CFSTR("BUTTON_SETUP_LATER");
  v33 = CFSTR("BUTTON_CONTINUE_SETUP");
  if (v31 == 3)
  {
    v33 = CFSTR("BUTTON_TURN_ON_SIRI");
    v32 = CFSTR("BUTTON_CONTINUE_LATER");
  }
  if (v31 == 4)
    v34 = CFSTR("BUTTON_CONTINUE_SETUP");
  else
    v34 = v33;
  if (v31 == 4)
    v35 = CFSTR("BUTTON_SET_UP_LATER");
  else
    v35 = v32;
  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "VTUIDeviceSpecificString:", v34);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTitle:forState:", v37, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v36, "addTarget:action:forControlEvents:", WeakRetained, sel_siriIntroViewControllerContinuePressed_, 64);

  -[VTUIEnrollmentSetupIntroViewControllerOrb buttonTray](self, "buttonTray");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addButton:", v36);

  objc_storeStrong((id *)&self->_continueButton, v36);
  if (!v30 && self->_isPostUpgradeDisclosure)
    goto LABEL_49;
  if (objc_msgSend(v7, "isBuddyOrFollowUp"))
  {
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v40 = (VTUIButton *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "VTUIDeviceSpecificString:", v35);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIButton setTitle:forState:](v40, "setTitle:forState:", v41, 0);

    v42 = objc_loadWeakRetained((id *)&self->_delegate);
    -[VTUIButton addTarget:action:forControlEvents:](v40, "addTarget:action:forControlEvents:", v42, sel_siriIntroViewControllerLaterPressed_, 64);

    -[VTUIEnrollmentSetupIntroViewControllerOrb buttonTray](self, "buttonTray");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addButton:", v40);

    laterButton = self->_laterButton;
    self->_laterButton = v40;

  }
  if (self->_isPostUpgradeDisclosure)
  {
LABEL_49:
    if (objc_msgSend(v7, "isGreenTeaCapableDevice"))
      v45 = CFSTR("POST_UPGRADE_FOOTER_CHINA");
    else
      v45 = CFSTR("POST_UPGRADE_FOOTER");
    objc_msgSend(v7, "VTUIDeviceSpecificString:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIEnrollmentSetupIntroViewControllerOrb buttonTray](self, "buttonTray");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setCaptionText:", v46);

  }
  else
  {
    if (v9 == 4)
      goto LABEL_44;
    -[VTUIEnrollmentSetupIntroViewControllerOrb buttonTray](self, "buttonTray");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setPrivacyLinkForBundles:", &unk_24F34DD00);
  }

LABEL_44:
}

- (void)_fadeInSubViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];

  -[VTUIEnrollmentSetupIntroViewControllerOrb headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  -[VTUIEnrollmentSetupIntroViewControllerOrb contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  v5 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__VTUIEnrollmentSetupIntroViewControllerOrb__fadeInSubViews__block_invoke;
  v7[3] = &unk_24F33DA28;
  v7[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0, v7, 0, 0.400000006, 0.0);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __60__VTUIEnrollmentSetupIntroViewControllerOrb__fadeInSubViews__block_invoke_2;
  v6[3] = &unk_24F33DA28;
  v6[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0, v6, 0, 0.400000006, 0.300000012);
}

void __60__VTUIEnrollmentSetupIntroViewControllerOrb__fadeInSubViews__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "headerView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __60__VTUIEnrollmentSetupIntroViewControllerOrb__fadeInSubViews__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (BOOL)_isDeviceEligibleForSAE
{
  int v2;
  int v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = AFDeviceSupportsSAEByDeviceCapabilityAndFeatureFlags();
  v3 = AFLocaleSupportsSAE();
  v4 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315906;
    v7 = "-[VTUIEnrollmentSetupIntroViewControllerOrb _isDeviceEligibleForSAE]";
    v8 = 1024;
    v9 = v2;
    v10 = 1024;
    v11 = v3;
    v12 = 1024;
    v13 = v2 & v3;
    _os_log_impl(&dword_229EF7000, v4, OS_LOG_TYPE_DEFAULT, "%s deviceSupportsSAEByDeviceCapabilityAndFeatureFlags = %d, localeSupportsSAE = %d, deviceSupportsSAE = %d", (uint8_t *)&v6, 0x1Eu);
  }
  return v2 & v3;
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
  objc_destroyWeak((id *)&self->_delegate);
}

@end
