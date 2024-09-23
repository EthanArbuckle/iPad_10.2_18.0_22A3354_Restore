@implementation HKRPOnboardingSettingsViewController

- (HKRPOnboardingSettingsViewController)initWithStyle:(int64_t)a3 settings:(id)a4 onboardingManager:(id)a5 onboardingDelegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  HKRPOnboardingSettingsViewController *v14;
  HKRPOnboardingSettingsViewController *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HKRPOnboardingSettingsViewController;
  v14 = -[HKRPOnboardingSettingsViewController init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_style = a3;
    objc_storeStrong((id *)&v14->_settings, a4);
    objc_storeStrong((id *)&v15->_onboardingManager, a5);
    objc_storeWeak((id *)&v15->_onboardingDelegate, v13);
    v15->_didLayoutSubviews = 0;
  }

  return v15;
}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v5[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)-[HKRPOnboardingSettingsViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, &__block_literal_global);

}

uint64_t __63__HKRPOnboardingSettingsViewController_registerForTraitChanges__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "layoutUI");
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKRPOnboardingSettingsViewController;
  -[HKRPOnboardingSettingsViewController viewSafeAreaInsetsDidChange](&v3, sel_viewSafeAreaInsetsDidChange);
  -[HKRPOnboardingSettingsViewController layoutUI](self, "layoutUI");
}

- (void)setInsetsIfNeeded
{
  id v3;

  if (!-[HKRPOnboardingSettingsViewController isInitialInsetsSet](self, "isInitialInsetsSet")
    || -[HKRPOnboardingSettingsViewController style](self, "style") != 1)
  {
    -[HKRPOnboardingSettingsViewController setIsInitialInsetsSet:](self, "setIsInitialInsetsSet:", 1);
    -[HKRPOnboardingSettingsViewController view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeAreaInsets");
    -[HKRPOnboardingSettingsViewController setInitialInsets:](self, "setInitialInsets:");

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKRPOnboardingSettingsViewController;
  -[HKRPOnboardingSettingsViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[HKRPOnboardingSettingsViewController setIsVisible:](self, "setIsVisible:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKRPOnboardingSettingsViewController;
  -[HKRPOnboardingSettingsViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[HKRPOnboardingSettingsViewController setIsVisible:](self, "setIsVisible:", 0);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKRPOnboardingSettingsViewController;
  -[HKRPOnboardingSettingsViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[HKRPOnboardingSettingsViewController registerForTraitChanges](self, "registerForTraitChanges");
}

- (void)createUI
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  RespiratoryHealthHeroView *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
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
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  -[HKRPOnboardingSettingsViewController setInsetsIfNeeded](self, "setInsetsIfNeeded");
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  -[HKRPOnboardingSettingsViewController view](self, "view", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v97, v101, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v98;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v98 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * v8++), "removeFromSuperview");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v97, v101, 16);
    }
    while (v6);
  }

  -[HKRPOnboardingSettingsViewController backgroundColor](self, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6D50]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  -[HKRPOnboardingSettingsViewController setScrollView:](self, "setScrollView:", v11);

  -[HKRPOnboardingSettingsViewController scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShowsVerticalScrollIndicator:", 0);

  -[HKRPOnboardingSettingsViewController scrollView](self, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlwaysBounceVertical:", 1);

  -[HKRPOnboardingSettingsViewController scrollView](self, "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", self);

  -[HKRPOnboardingSettingsViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController scrollView](self, "scrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v16);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  -[HKRPOnboardingSettingsViewController setContentView:](self, "setContentView:", v17);

  -[HKRPOnboardingSettingsViewController scrollView](self, "scrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  -[HKRPOnboardingSettingsViewController setTitleLabel:](self, "setTitleLabel:", v20);

  -[HKRPOnboardingSettingsViewController _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("RESPIRATORY_HEALTH_TITLE"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController titleLabel](self, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v21);

  -[HKRPOnboardingSettingsViewController titleLabel](self, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTextAlignment:", 1);

  -[HKRPOnboardingSettingsViewController _headerTitleFont](self, "_headerTitleFont");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController titleLabel](self, "titleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFont:", v24);

  -[HKRPOnboardingSettingsViewController labelColor](self, "labelColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController titleLabel](self, "titleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTextColor:", v26);

  -[HKRPOnboardingSettingsViewController titleLabel](self, "titleLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setNumberOfLines:", 0);

  -[HKRPOnboardingSettingsViewController titleLabel](self, "titleLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAdjustsFontForContentSizeCategory:", 1);

  -[HKRPOnboardingSettingsViewController contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController titleLabel](self, "titleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", v31);

  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  -[HKRPOnboardingSettingsViewController setDescriptionLabel:](self, "setDescriptionLabel:", v32);

  -[HKRPOnboardingSettingsViewController settings](self, "settings");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "recordingInactiveDescription");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController descriptionLabel](self, "descriptionLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setText:", v34);

  -[HKRPOnboardingSettingsViewController descriptionLabel](self, "descriptionLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTextAlignment:", 1);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController descriptionLabel](self, "descriptionLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFont:", v37);

  -[HKRPOnboardingSettingsViewController labelColor](self, "labelColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController descriptionLabel](self, "descriptionLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setTextColor:", v39);

  -[HKRPOnboardingSettingsViewController descriptionLabel](self, "descriptionLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setNumberOfLines:", 0);

  -[HKRPOnboardingSettingsViewController descriptionLabel](self, "descriptionLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setAdjustsFontForContentSizeCategory:", 1);

  -[HKRPOnboardingSettingsViewController contentView](self, "contentView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController descriptionLabel](self, "descriptionLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addSubview:", v44);

  v45 = objc_alloc_init(RespiratoryHealthHeroView);
  -[HKRPOnboardingSettingsViewController setWatchView:](self, "setWatchView:", v45);

  -[HKRPOnboardingSettingsViewController view](self, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "frame");
  v48 = v47;
  -[HKRPOnboardingSettingsViewController view](self, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "frame");
  -[HKRPOnboardingSettingsViewController _calculateHeroHorizontalMarginForViewFrame:](self, "_calculateHeroHorizontalMarginForViewFrame:");
  v51 = v48 + v50 * -2.0;
  -[HKRPOnboardingSettingsViewController watchView](self, "watchView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setPreferredWidth:", v51);

  -[HKRPOnboardingSettingsViewController contentView](self, "contentView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController watchView](self, "watchView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addSubview:", v54);

  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController setSetupLaterButton:](self, "setSetupLaterButton:", v55);

  -[HKRPOnboardingSettingsViewController setupLaterButton](self, "setupLaterButton");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  -[HKRPOnboardingSettingsViewController setupLaterButton](self, "setupLaterButton");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("RESPIRATORY_HEALTH_SET_UP_LATER"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setTitle:forState:", v58, 0);

  -[HKRPOnboardingSettingsViewController setupLaterButton](self, "setupLaterButton");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addTarget:action:forControlEvents:", self, sel_setupLaterButtonPressed_, 64);

  -[HKRPOnboardingSettingsViewController contentView](self, "contentView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController setupLaterButton](self, "setupLaterButton");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addSubview:", v61);

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController setSuggestedChoiceButton:](self, "setSuggestedChoiceButton:", v62);

  -[HKRPOnboardingSettingsViewController suggestedChoiceButton](self, "suggestedChoiceButton");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  -[HKRPOnboardingSettingsViewController suggestedChoiceButton](self, "suggestedChoiceButton");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("RESPIRATORY_HEALTH_ENABLE"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setTitle:forState:", v65, 0);

  -[HKRPOnboardingSettingsViewController suggestedChoiceButton](self, "suggestedChoiceButton");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addTarget:action:forControlEvents:", self, sel_suggestedChoiceButtonPressed_, 64);

  -[HKRPOnboardingSettingsViewController suggestedChoiceButton](self, "suggestedChoiceButton");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController pillBackgroundColor](self, "pillBackgroundColor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setTintColor:", v68);

  -[HKRPOnboardingSettingsViewController suggestedChoiceButton](self, "suggestedChoiceButton");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController pillBackgroundSelectedColor](self, "pillBackgroundSelectedColor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  BPSPillButtonBackground();
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setBackgroundImage:forState:", v71, 4);

  -[HKRPOnboardingSettingsViewController suggestedChoiceButton](self, "suggestedChoiceButton");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController pillTitleColor](self, "pillTitleColor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setTitleColor:forState:", v73, 2);

  -[HKRPOnboardingSettingsViewController contentView](self, "contentView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController suggestedChoiceButton](self, "suggestedChoiceButton");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "addSubview:", v75);

  v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  -[HKRPOnboardingSettingsViewController setLocationLabel:](self, "setLocationLabel:", v76);

  -[HKRPOnboardingSettingsViewController _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("RESPIRATORY_HEALTH_BUTTON_CAPTION"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController locationLabel](self, "locationLabel");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setText:", v77);

  -[HKRPOnboardingSettingsViewController locationLabel](self, "locationLabel");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setTextAlignment:", 1);

  -[HKRPOnboardingSettingsViewController locationLabel](self, "locationLabel");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController locationLabel](self, "locationLabel");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setTextColor:", v81);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77C8]);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController locationLabel](self, "locationLabel");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setFont:", v83);

  -[HKRPOnboardingSettingsViewController locationLabel](self, "locationLabel");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setAdjustsFontForContentSizeCategory:", 1);

  -[HKRPOnboardingSettingsViewController contentView](self, "contentView");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController locationLabel](self, "locationLabel");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "addSubview:", v87);

  v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  -[HKRPOnboardingSettingsViewController setFooterView:](self, "setFooterView:", v88);

  objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 5);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", v89);
  -[HKRPOnboardingSettingsViewController setBlurView:](self, "setBlurView:", v90);

  -[HKRPOnboardingSettingsViewController blurView](self, "blurView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setFrame:", 0.0, 0.0, 1.0, 1.0);

  -[HKRPOnboardingSettingsViewController footerView](self, "footerView");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController blurView](self, "blurView");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "addSubview:", v93);

  -[HKRPOnboardingSettingsViewController footerView](self, "footerView");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setHidden:", 1);

  -[HKRPOnboardingSettingsViewController view](self, "view");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController footerView](self, "footerView");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addSubview:", v96);

}

- (void)layoutUI
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  int64_t v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  void *v120;
  void *v121;
  void *v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  void *v131;
  double v132;
  double v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  void *v149;
  double v150;
  double v151;
  void *v152;
  double v153;
  double v154;
  void *v155;
  void *v156;
  double v157;
  double v158;
  double v159;
  id v160;
  id v161;

  if (-[HKRPOnboardingSettingsViewController style](self, "style") != 1
    || !-[HKRPOnboardingSettingsViewController didLayoutSubviews](self, "didLayoutSubviews")
    || -[HKRPOnboardingSettingsViewController isVisible](self, "isVisible"))
  {
    -[HKRPOnboardingSettingsViewController setDidLayoutSubviews:](self, "setDidLayoutSubviews:", 1);
    -[HKRPOnboardingSettingsViewController createUI](self, "createUI");
    -[HKRPOnboardingSettingsViewController initialInsets](self, "initialInsets");
    v159 = v4;
    v160 = v3;
    v6 = v5;
    v8 = v7;
    -[HKRPOnboardingSettingsViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10 - v6 - v8 + -48.0;

    -[HKRPOnboardingSettingsViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;

    -[HKRPOnboardingSettingsViewController titleLabel](self, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sizeThatFits:", v11, v14);
    v17 = v16;

    v18 = v6 + 24.0;
    -[HKRPOnboardingSettingsViewController titleLabel](self, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFrame:", v6 + 24.0, 30.0, v11, v17);

    v20 = v17 + 30.0 + 16.0;
    -[HKRPOnboardingSettingsViewController descriptionLabel](self, "descriptionLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sizeThatFits:", v11, v14);
    v23 = v22;

    -[HKRPOnboardingSettingsViewController descriptionLabel](self, "descriptionLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFrame:", v6 + 24.0, v20, v11, v23);

    v25 = v20 + v23 + 24.0;
    -[HKRPOnboardingSettingsViewController watchView](self, "watchView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sizeThatFits:", v11, v14);
    v28 = v27;
    v30 = v29;

    -[HKRPOnboardingSettingsViewController watchView](self, "watchView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFrame:", v6 + (v11 - v28) * 0.5 + 24.0, v25, v28, v30);

    v32 = v25 + v30;
    v33 = -[HKRPOnboardingSettingsViewController style](self, "style");
    v34 = 49.0;
    if (v33 != 1)
      v34 = 0.0;
    v35 = *(double *)&v160 + v159 - v34;
    -[HKRPOnboardingSettingsViewController view](self, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "frame");
    v38 = v37 - v35;

    v39 = v38 + -16.0;
    -[HKRPOnboardingSettingsViewController setupLaterButton](self, "setupLaterButton");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "sizeThatFits:", v11, v14);
    v42 = v41;

    v43 = v39 - v42;
    -[HKRPOnboardingSettingsViewController setupLaterButton](self, "setupLaterButton");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setFrame:", v18, v43, v11, v42);

    -[HKRPOnboardingSettingsViewController suggestedChoiceButton](self, "suggestedChoiceButton");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "sizeThatFits:", v11, v14);
    v47 = v46;

    v48 = v43 + -4.0 - v47;
    -[HKRPOnboardingSettingsViewController suggestedChoiceButton](self, "suggestedChoiceButton");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setFrame:", v18, v48, v11, v47);

    -[HKRPOnboardingSettingsViewController locationLabel](self, "locationLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "sizeThatFits:", v11, v14);
    v52 = v51;

    v53 = v48 + -20.0 - v52;
    -[HKRPOnboardingSettingsViewController locationLabel](self, "locationLabel");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setFrame:", v18, v53, v11, v52);

    v55 = v32;
    v56 = v53 - v32;
    v57 = v53 + -16.0;
    v58 = v35 + v53;
    v59 = v35;
    v60 = v58 + -16.0;
    v61 = v57;
    -[HKRPOnboardingSettingsViewController view](self, "view");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "frame");
    v64 = v63;
    -[HKRPOnboardingSettingsViewController footerView](self, "footerView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setFrame:", 0.0, v60, v64, v14 - v61);

    -[HKRPOnboardingSettingsViewController footerView](self, "footerView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "frame");
    v68 = v67;
    -[HKRPOnboardingSettingsViewController footerView](self, "footerView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "frame");
    v71 = v70;
    -[HKRPOnboardingSettingsViewController blurView](self, "blurView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setFrame:", 0.0, 0.0, v68, v71);

    -[HKRPOnboardingSettingsViewController view](self, "view");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "frame");
    v75 = v74;
    -[HKRPOnboardingSettingsViewController contentView](self, "contentView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setFrame:", 0.0, 0.0, v75, v55);

    -[HKRPOnboardingSettingsViewController view](self, "view");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "frame");
    v79 = v78;
    -[HKRPOnboardingSettingsViewController view](self, "view");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "frame");
    v82 = v81;
    -[HKRPOnboardingSettingsViewController scrollView](self, "scrollView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setFrame:", 0.0, 0.0, v79, v82);

    -[HKRPOnboardingSettingsViewController scrollView](self, "scrollView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setScrollEnabled:", v56 < 14.0);

    if (v56 >= 14.0)
    {
      -[HKRPOnboardingSettingsViewController contentView](self, "contentView");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKRPOnboardingSettingsViewController setupLaterButton](self, "setupLaterButton");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "addSubview:", v136);

      -[HKRPOnboardingSettingsViewController contentView](self, "contentView");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKRPOnboardingSettingsViewController suggestedChoiceButton](self, "suggestedChoiceButton");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "addSubview:", v138);

      -[HKRPOnboardingSettingsViewController contentView](self, "contentView");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKRPOnboardingSettingsViewController locationLabel](self, "locationLabel");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "addSubview:", v140);

      -[HKRPOnboardingSettingsViewController scrollView](self, "scrollView");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "setContentInset:", *(double *)&v160, 0.0, 0.0, 0.0);

      -[HKRPOnboardingSettingsViewController contentView](self, "contentView");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "frame");
      v144 = v143;
      v146 = v145;
      v148 = v147;

      -[HKRPOnboardingSettingsViewController setupLaterButton](self, "setupLaterButton");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v149, "frame");
      v151 = v150;
      -[HKRPOnboardingSettingsViewController setupLaterButton](self, "setupLaterButton");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "bounds");
      v154 = v151 + v153;

      -[HKRPOnboardingSettingsViewController contentView](self, "contentView");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "setFrame:", v144, v146, v148, v154);

      -[HKRPOnboardingSettingsViewController footerView](self, "footerView");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "setHidden:", 1);
    }
    else
    {
      -[HKRPOnboardingSettingsViewController footerView](self, "footerView");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKRPOnboardingSettingsViewController setupLaterButton](self, "setupLaterButton");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "addSubview:", v86);

      -[HKRPOnboardingSettingsViewController setupLaterButton](self, "setupLaterButton");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "frame");
      v89 = v88;
      v91 = v90;
      v93 = v92;
      v95 = v94;

      -[HKRPOnboardingSettingsViewController setupLaterButton](self, "setupLaterButton");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "setFrame:", v89, v91 - v61, v93, v95);

      -[HKRPOnboardingSettingsViewController footerView](self, "footerView");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKRPOnboardingSettingsViewController suggestedChoiceButton](self, "suggestedChoiceButton");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "addSubview:", v98);

      -[HKRPOnboardingSettingsViewController suggestedChoiceButton](self, "suggestedChoiceButton");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "frame");
      v101 = v100;
      v103 = v102;
      v105 = v104;
      v107 = v106;

      -[HKRPOnboardingSettingsViewController suggestedChoiceButton](self, "suggestedChoiceButton");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "setFrame:", v101, v103 - v61, v105, v107);

      -[HKRPOnboardingSettingsViewController footerView](self, "footerView");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKRPOnboardingSettingsViewController locationLabel](self, "locationLabel");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "addSubview:", v110);

      -[HKRPOnboardingSettingsViewController locationLabel](self, "locationLabel");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "frame");
      v113 = v112;
      v115 = v114;
      v117 = v116;
      v119 = v118;

      -[HKRPOnboardingSettingsViewController locationLabel](self, "locationLabel");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "setFrame:", v113, v115 - v61, v117, v119);

      -[HKRPOnboardingSettingsViewController footerView](self, "footerView");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setHidden:", 0);

      -[HKRPOnboardingSettingsViewController contentView](self, "contentView");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "frame");
      v124 = v123;
      v126 = v125;
      v128 = v127;
      v130 = v129;

      -[HKRPOnboardingSettingsViewController footerView](self, "footerView");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "frame");
      v133 = v130 + v132 - v59;

      -[HKRPOnboardingSettingsViewController contentView](self, "contentView");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "setFrame:", v124, v126, v128, v133);
    }

    -[HKRPOnboardingSettingsViewController scrollView](self, "scrollView");
    v161 = (id)objc_claimAutoreleasedReturnValue();
    -[HKRPOnboardingSettingsViewController contentView](self, "contentView");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "frame");
    objc_msgSend(v161, "setContentSize:", v157, v158);

  }
}

- (void)suggestedChoiceButtonPressed:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __69__HKRPOnboardingSettingsViewController_suggestedChoiceButtonPressed___block_invoke;
  v3[3] = &unk_24EF4C800;
  v3[4] = self;
  -[HKRPOnboardingSettingsViewController _onboardWithCompletion:](self, "_onboardWithCompletion:", v3);
}

void __69__HKRPOnboardingSettingsViewController_suggestedChoiceButtonPressed___block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __69__HKRPOnboardingSettingsViewController_suggestedChoiceButtonPressed___block_invoke_2;
  v2[3] = &unk_24EF4C7D8;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
}

void __69__HKRPOnboardingSettingsViewController_suggestedChoiceButtonPressed___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "onboardingDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enablePressedWithAppropriateRegion:", *(unsigned __int8 *)(a1 + 40));

}

- (double)_calculateHeroHorizontalMarginForViewFrame:(CGRect)a3
{
  return a3.size.width / 375.0 * 115.0;
}

- (void)_onboardWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HKRPOnboardingSettingsViewController onboardingManager](self, "onboardingManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__HKRPOnboardingSettingsViewController__onboardWithCompletion___block_invoke;
  v7[3] = &unk_24EF4C958;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "onboardWithCompletion:", v7);

}

void __63__HKRPOnboardingSettingsViewController__onboardWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __63__HKRPOnboardingSettingsViewController__onboardWithCompletion___block_invoke_2;
    v12[3] = &unk_24EF4C828;
    v7 = *(void **)(a1 + 32);
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v7, "_installWatchAppIfNeededWithCompletion:", v12);
    v8 = v13;
  }
  else
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __63__HKRPOnboardingSettingsViewController__onboardWithCompletion___block_invoke_3;
    v9[3] = &unk_24EF4C850;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v5;
    v11 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], v9);

    v8 = v10;
  }

}

uint64_t __63__HKRPOnboardingSettingsViewController__onboardWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__HKRPOnboardingSettingsViewController__onboardWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __63__HKRPOnboardingSettingsViewController__onboardWithCompletion___block_invoke_4;
  v3[3] = &unk_24EF4C828;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_presentOnboardingError:completion:", v2, v3);

}

uint64_t __63__HKRPOnboardingSettingsViewController__onboardWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_installWatchAppIfNeededWithCompletion:(id)a3
{
  id v4;
  HKRPWatchAppInstaller *v5;
  HKRPWatchAppInstaller *v6;
  id v7;
  _QWORD v8[5];
  HKRPWatchAppInstaller *v9;
  id v10;

  v4 = a3;
  v5 = objc_alloc_init(HKRPWatchAppInstaller);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__HKRPOnboardingSettingsViewController__installWatchAppIfNeededWithCompletion___block_invoke;
  v8[3] = &unk_24EF4C9F8;
  v9 = v5;
  v10 = v4;
  v8[4] = self;
  v6 = v5;
  v7 = v4;
  -[HKRPWatchAppInstaller checkIfAppCanBeInstalledWithCompletion:](v6, "checkIfAppCanBeInstalledWithCompletion:", v8);

}

void __79__HKRPOnboardingSettingsViewController__installWatchAppIfNeededWithCompletion___block_invoke(uint64_t a1, char a2)
{
  _QWORD block[5];
  id v4;
  id v5;

  if ((a2 & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __79__HKRPOnboardingSettingsViewController__installWatchAppIfNeededWithCompletion___block_invoke_2;
    block[3] = &unk_24EF4C9D0;
    block[4] = *(_QWORD *)(a1 + 32);
    v5 = *(id *)(a1 + 48);
    v4 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __79__HKRPOnboardingSettingsViewController__installWatchAppIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __79__HKRPOnboardingSettingsViewController__installWatchAppIfNeededWithCompletion___block_invoke_3;
  v3[3] = &unk_24EF4C9A8;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_askUserToInstallWatchAppWithCompletion:", v3);

}

void __79__HKRPOnboardingSettingsViewController__installWatchAppIfNeededWithCompletion___block_invoke_3(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  if ((a2 & 1) != 0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __79__HKRPOnboardingSettingsViewController__installWatchAppIfNeededWithCompletion___block_invoke_4;
    v3[3] = &unk_24EF4C980;
    v2 = *(void **)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    objc_msgSend(v2, "installAppWithCompletion:", v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __79__HKRPOnboardingSettingsViewController__installWatchAppIfNeededWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_askUserToInstallWatchAppWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDF67F0];
  -[HKRPOnboardingSettingsViewController _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("RESPIRATORY_HEALTH_APP_INSTALL_PROMPT_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRPOnboardingSettingsViewController _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("RESPIRATORY_HEALTH_APP_INSTALL_PROMPT_BODY"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDF67E8];
  -[HKRPOnboardingSettingsViewController _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("RESPIRATORY_HEALTH_APP_INSTALL_PROMPT_CANCEL_BUTTON_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __80__HKRPOnboardingSettingsViewController__askUserToInstallWatchAppWithCompletion___block_invoke;
  v23[3] = &unk_24EF4C8A0;
  v12 = v4;
  v24 = v12;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDF67E8];
  -[HKRPOnboardingSettingsViewController _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("RESPIRATORY_HEALTH_APP_INSTALL_PROMPT_INSTALL_BUTTON_TITLE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v11;
  v19 = 3221225472;
  v20 = __80__HKRPOnboardingSettingsViewController__askUserToInstallWatchAppWithCompletion___block_invoke_2;
  v21 = &unk_24EF4C8A0;
  v22 = v12;
  v16 = v12;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, &v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v13, v18, v19, v20, v21);
  objc_msgSend(v8, "addAction:", v17);
  -[HKRPOnboardingSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

}

uint64_t __80__HKRPOnboardingSettingsViewController__askUserToInstallWatchAppWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__HKRPOnboardingSettingsViewController__askUserToInstallWatchAppWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_presentOnboardingError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v7;
  objc_msgSend(v8, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BDD2BE8];
  if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDD2BE8]) & 1) == 0)
  {

LABEL_5:
    v17 = v8;
    objc_msgSend(v17, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isEqualToString:", v11) & 1) != 0)
    {
      v19 = objc_msgSend(v17, "code");

      if (v19 == 110)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v20;
        v21 = CFSTR("RESPIRATORY_HEALTH_ONBOARDING_ALERT_LOCATION_UNAPPROVED_ERROR");
LABEL_10:
        objc_msgSend(v20, "localizedStringForKey:value:table:", v21, &stru_24EF4CAB8, CFSTR("RespiratoryHealthUI"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 0;
        goto LABEL_11;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v20;
    v21 = CFSTR("RESPIRATORY_HEALTH_ONBOARDING_ALERT_COMPLETION_UNKNOWN_ERROR");
    goto LABEL_10;
  }
  v12 = objc_msgSend(v8, "code");

  if (v12 != 109)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("RESPIRATORY_HEALTH_ONBOARDING_ALERT_LOCATION_NOT_FOUND_ERROR_TITLE"), &stru_24EF4CAB8, CFSTR("RespiratoryHealthUI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("RESPIRATORY_HEALTH_ONBOARDING_ALERT_LOCATION_NOT_FOUND_ERROR_BODY"), &stru_24EF4CAB8, CFSTR("RespiratoryHealthUI"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24EF4CAB8, CFSTR("RespiratoryHealthUI"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v14, v16, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x24BDF67E8];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __alertControllerForOnboardingError_block_invoke_0;
  v28[3] = &unk_24EF4C8A0;
  v29 = v9;
  v26 = v9;
  objc_msgSend(v25, "actionWithTitle:style:handler:", v23, 0, v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addAction:", v27);

  -[HKRPOnboardingSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v24, 1, 0);
}

- (void)setupLaterButtonPressed:(id)a3
{
  id v3;

  -[HKRPOnboardingSettingsViewController onboardingDelegate](self, "onboardingDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setupLaterPressed");

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HKRPOnboardingSettingsViewController onboardingDelegate](self, "onboardingDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HKRPOnboardingSettingsViewController onboardingDelegate](self, "onboardingDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "onboardingScrollViewDidScroll:", v7);

  }
}

- (id)_headerTitleFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7800]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)backgroundColor
{
  int64_t style;
  void *v3;

  style = self->_style;
  if (style == 1)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemBlackColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (style == 2)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)labelColor
{
  int64_t style;
  void *v3;

  style = self->_style;
  if (style == 1)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (style == 2)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)pillBackgroundSelectedColor
{
  int64_t style;
  void *v3;
  void *v4;

  style = self->_style;
  if (style == 1)
  {
    BPSPillSelectedColor();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (style == 2)
  {
    -[HKRPOnboardingSettingsViewController pillBackgroundColor](self, "pillBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "colorWithAlphaComponent:", 0.25);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)pillBackgroundColor
{
  int64_t style;
  void *v3;

  style = self->_style;
  if (style == 1)
  {
    BPSPillDeselectedColor();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (style == 2)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)pillTitleColor
{
  int64_t style;
  void *v3;

  style = self->_style;
  if (style == 1)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.7, 1.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (style == 2)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)pillTitleSelectedColor
{
  int64_t style;
  void *v3;
  void *v4;

  style = self->_style;
  if (style == 1)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.7, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (style == 2)
  {
    -[HKRPOnboardingSettingsViewController pillTitleColor](self, "pillTitleColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "colorWithAlphaComponent:", 0.25);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_localizedStringForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_24EF4CAB8, CFSTR("RespiratoryHealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate
{
  return (BPSSetupMiniFlowControllerDelegate *)objc_loadWeakRetained((id *)&self->miniFlowDelegate);
}

- (void)setMiniFlowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->miniFlowDelegate, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (HKRPOxygenSaturationSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (HKRPOxygenSaturationOnboardingManager)onboardingManager
{
  return self->_onboardingManager;
}

- (void)setOnboardingManager:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingManager, a3);
}

- (HKRPOnboardingDelegate)onboardingDelegate
{
  return (HKRPOnboardingDelegate *)objc_loadWeakRetained((id *)&self->_onboardingDelegate);
}

- (void)setOnboardingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_onboardingDelegate, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (RespiratoryHealthHeroView)watchView
{
  return self->_watchView;
}

- (void)setWatchView:(id)a3
{
  objc_storeStrong((id *)&self->_watchView, a3);
}

- (OBBoldTrayButton)suggestedChoiceButton
{
  return self->_suggestedChoiceButton;
}

- (void)setSuggestedChoiceButton:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedChoiceButton, a3);
}

- (OBLinkTrayButton)setupLaterButton
{
  return self->_setupLaterButton;
}

- (void)setSetupLaterButton:(id)a3
{
  objc_storeStrong((id *)&self->_setupLaterButton, a3);
}

- (UILabel)locationLabel
{
  return self->_locationLabel;
}

- (void)setLocationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_locationLabel, a3);
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_footerView, a3);
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (BOOL)didLayoutSubviews
{
  return self->_didLayoutSubviews;
}

- (void)setDidLayoutSubviews:(BOOL)a3
{
  self->_didLayoutSubviews = a3;
}

- (UIEdgeInsets)initialInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_initialInsets.top;
  left = self->_initialInsets.left;
  bottom = self->_initialInsets.bottom;
  right = self->_initialInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setInitialInsets:(UIEdgeInsets)a3
{
  self->_initialInsets = a3;
}

- (BOOL)isInitialInsetsSet
{
  return self->_isInitialInsetsSet;
}

- (void)setIsInitialInsetsSet:(BOOL)a3
{
  self->_isInitialInsetsSet = a3;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void)setIsVisible:(BOOL)a3
{
  self->_isVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_setupLaterButton, 0);
  objc_storeStrong((id *)&self->_suggestedChoiceButton, 0);
  objc_storeStrong((id *)&self->_watchView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_onboardingDelegate);
  objc_storeStrong((id *)&self->_onboardingManager, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->miniFlowDelegate);
}

@end
