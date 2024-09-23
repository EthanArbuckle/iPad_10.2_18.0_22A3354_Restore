@implementation VTUIGMEnrollmentViewController

- (VTUIGMEnrollmentViewController)initWithCSFAvailability:(id)a3 delegate:(id)a4
{
  id v6;
  VTUIGMEnrollmentViewController *v7;

  objc_storeStrong((id *)&self->_availability, a3);
  v6 = a4;
  v7 = -[VTUIGMEnrollmentViewController initWithDelegate:](self, "initWithDelegate:", v6);

  return v7;
}

- (VTUIGMEnrollmentViewController)initWithDelegate:(id)a3
{
  id v4;
  _TtC14VoiceTriggerUI23GMAvailabilityViewModel *v5;
  _TtC14VoiceTriggerUI23GMAvailabilityViewModel *viewModel;
  VTUIGMEnrollmentViewController *v7;

  v4 = a3;
  v5 = objc_alloc_init(_TtC14VoiceTriggerUI23GMAvailabilityViewModel);
  viewModel = self->_viewModel;
  self->_viewModel = v5;

  v7 = -[VTUIGMEnrollmentViewController initWithEnrollmentType:delegate:](self, "initWithEnrollmentType:delegate:", -[GMAvailabilityViewModel enrollmentType](self->_viewModel, "enrollmentType"), v4);
  return v7;
}

- (VTUIGMEnrollmentViewController)initWithEnrollmentType:(unint64_t)a3 delegate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _TtC14VoiceTriggerUI20GMHeaderIconProvider *v14;
  _TtC14VoiceTriggerUI20GMHeaderIconProvider *headerIconProvider;
  VTUIGMEnrollmentViewController *v16;
  VTUIGMEnrollmentViewController *v17;
  objc_super v19;

  v6 = a4;
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_enrollmentType = a3;
  -[GMAvailabilityViewModel titleKeyWithEnrollmentType:](self->_viewModel, "titleKeyWithEnrollmentType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GMAvailabilityViewModel subtitleKeyWithEnrollmentType:](self->_viewModel, "subtitleKeyWithEnrollmentType:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "VTUIDeviceSpecificString:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "VTUIDeviceSpecificString:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(_TtC14VoiceTriggerUI20GMHeaderIconProvider);
  headerIconProvider = self->_headerIconProvider;
  self->_headerIconProvider = v14;

  v19.receiver = self;
  v19.super_class = (Class)VTUIGMEnrollmentViewController;
  v16 = -[VTUIGMEnrollmentViewController initWithTitle:detailText:icon:](&v19, sel_initWithTitle_detailText_icon_, v11, v13, 0);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_delegate, v6);
    -[VTUIGMEnrollmentViewController _setupContent](v17, "_setupContent");
  }

  return v17;
}

- (void)_setupContent
{
  void *v3;
  _TtC14VoiceTriggerUI20GMHeaderIconProvider *headerIconProvider;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t enrollmentType;
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
  unint64_t v25;
  NSObject *v26;
  uint64_t v27;
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
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  unint64_t v64;
  __int16 v65;
  int v66;
  _QWORD v67[6];

  v67[4] = *MEMORY[0x24BDAC8D0];
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBDAB0], "currentTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceStyle") == 2)
  {

LABEL_3:
    headerIconProvider = self->_headerIconProvider;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlackColor");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isIpad") & 1) != 0 || !-[GMAvailabilityViewModel isBuddy](self->_viewModel, "isBuddy"))
  {

  }
  else
  {
    enrollmentType = self->_enrollmentType;

    if (enrollmentType == 1)
      goto LABEL_3;
  }
  headerIconProvider = self->_headerIconProvider;
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v9 = (void *)v6;
  -[GMHeaderIconProvider imageViewWithLabelWithLabelFontSize:labelBackgroundColor:labelForegroundColor:](headerIconProvider, "imageViewWithLabelWithLabelFontSize:labelBackgroundColor:labelForegroundColor:", v5, v6, 18.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[VTUIGMEnrollmentViewController headerView](self, "headerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "customIconContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClipsToBounds:", 0);

  -[VTUIGMEnrollmentViewController headerView](self, "headerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "customIconContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v10);

  v52 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v10, "centerXAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIGMEnrollmentViewController headerView](self, "headerView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "customIconContainerView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "centerXAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v53;
  objc_msgSend(v10, "centerYAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIGMEnrollmentViewController headerView](self, "headerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "customIconContainerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v18;
  objc_msgSend(v10, "heightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToConstant:", 80.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v67[2] = v20;
  v59 = v10;
  objc_msgSend(v10, "widthAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToConstant:", 80.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v67[3] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "activateConstraints:", v23);

  v24 = (void *)VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v25 = self->_enrollmentType;
    v26 = v24;
    *(_DWORD *)buf = 136315650;
    v62 = "-[VTUIGMEnrollmentViewController _setupContent]";
    v63 = 2048;
    v64 = v25;
    v65 = 1024;
    v66 = objc_msgSend(v60, "isBuddyOrFollowUp");
    _os_log_impl(&dword_229EF7000, v26, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment Setting up GM Info Sheet with enrollmentType: %lu, launched from buddy/cfu: %d", buf, 0x1Cu);

  }
  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("apple.image.playground"));
  v27 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "VTUIDeviceSpecificString:", CFSTR("GM_NEW_TOOLS_TO_EXPRESS_TITLE"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "VTUIDeviceSpecificString:", CFSTR("GM_NEW_TOOLS_TO_EXPRESS_DESC"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)v27;
  -[VTUIGMEnrollmentViewController addBulletedListItemWithTitle:description:image:tintColor:](self, "addBulletedListItemWithTitle:description:image:tintColor:", v28, v29, v27, v30);

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("siri"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "VTUIDeviceSpecificString:", CFSTR("GM_DO_MORE_WITH_SIRI_TITLE"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "VTUIDeviceSpecificString:", CFSTR("GM_DO_MORE_WITH_SIRI_DESC"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIGMEnrollmentViewController addBulletedListItemWithTitle:description:image:tintColor:](self, "addBulletedListItemWithTitle:description:image:tintColor:", v32, v33, v31, v34);

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("apple.logo.lock"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "VTUIDeviceSpecificString:", CFSTR("GM_BUILT_FOR_PRIVACY_TITLE"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "VTUIDeviceSpecificString:", CFSTR("GM_BUILT_FOR_PRIVACY_DESC"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIGMEnrollmentViewController addBulletedListItemWithTitle:description:image:tintColor:](self, "addBulletedListItemWithTitle:description:image:tintColor:", v36, v37, v35, v38);

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[GMAvailabilityViewModel continueButtonTitleKeyWithEnrollmentType:](self->_viewModel, "continueButtonTitleKeyWithEnrollmentType:", self->_enrollmentType);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "VTUIDeviceSpecificString:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTitle:forState:", v41, 0);

  objc_msgSend(v39, "addTarget:action:forControlEvents:", self, sel__userDidTapContinueButton, 64);
  -[VTUIGMEnrollmentViewController buttonTray](self, "buttonTray");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addButton:", v39);

  if (!-[GMAvailabilityViewModel isBuddy](self->_viewModel, "isBuddy") && !self->_enrollmentType)
  {
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "VTUIDeviceSpecificString:", CFSTR("BUTTON_CONS_NOT_NOW"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setTitle:forState:", v44, 0);

    objc_msgSend(v43, "addTarget:action:forControlEvents:", self, sel__userDidTapCancelButton, 64);
    -[VTUIGMEnrollmentViewController buttonTray](self, "buttonTray");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addButton:", v43);

  }
  if (-[GMAvailabilityViewModel isBuddy](self->_viewModel, "isBuddy") && self->_enrollmentType == 1)
  {
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "VTUIDeviceSpecificString:", CFSTR("BUTTON_SET_UP_LATER"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setTitle:forState:", v47, 0);

    objc_msgSend(v46, "addTarget:action:forControlEvents:", self, sel__userDidTapSetupLaterButton, 64);
    -[VTUIGMEnrollmentViewController buttonTray](self, "buttonTray");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addButton:", v46);

  }
  -[VTUIGMEnrollmentViewController buttonTray](self, "buttonTray");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6E430], "linkWithBundleIdentifier:", CFSTR("com.apple.onboarding.intelligenceengine"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setPrivacyLinkController:", v50);

}

- (void)_userDidTapSetupLaterButton
{
  id v3;
  id WeakRetained;
  char v5;
  id v6;

  if (self->_enrollmentType == 1)
  {
    v3 = objc_alloc_init(MEMORY[0x24BE17DD8]);
    objc_msgSend(v3, "setIsOptedIn:", 0);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "siriGMIntroViewControllerNotNowPressed:", self);

  }
  else
  {
    -[VTUIGMEnrollmentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)_userDidTapCancelButton
{
  VTUIGMEnrollmentViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "siriGMIntroViewControllerNotNowPressed:", self);

  }
  else
  {
    -[VTUIGMEnrollmentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)_userDidTapContinueButton
{
  NSObject *v3;
  unint64_t enrollmentType;
  id v5;
  id WeakRetained;
  char v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    enrollmentType = self->_enrollmentType;
    v9 = 136315394;
    v10 = "-[VTUIGMEnrollmentViewController _userDidTapContinueButton]";
    v11 = 2048;
    v12 = enrollmentType;
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment User did tap continue button with enrollmentType: %lu", (uint8_t *)&v9, 0x16u);
  }
  if (self->_enrollmentType == 1)
  {
    v5 = objc_alloc_init(MEMORY[0x24BE17DD8]);
    objc_msgSend(v5, "setIsOptedIn:", 1);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "siriGMIntroViewControllerContinuePressed:", self);

  }
  else
  {
    -[VTUIGMEnrollmentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  unint64_t enrollmentType;
  id WeakRetained;
  char v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VTUIGMEnrollmentViewController;
  -[OBBaseWelcomeController viewDidLoad](&v9, sel_viewDidLoad);
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isIpad"))
    goto LABEL_6;
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isBuddyOrFollowUp") & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  enrollmentType = self->_enrollmentType;

  if (enrollmentType == 1)
    -[VTUIGMEnrollmentViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2);
LABEL_7:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "siriGMIntroViewControllerPresented:withEnrollmentType:", self, self->_enrollmentType);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerIconProvider, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_availability, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
