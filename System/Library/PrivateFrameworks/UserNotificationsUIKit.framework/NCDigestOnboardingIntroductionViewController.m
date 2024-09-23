@implementation NCDigestOnboardingIntroductionViewController

+ (id)introductionViewControllerWithDeferButtonText:(id)a3
{
  id v3;
  NCDigestOnboardingIntroductionViewController *v4;

  v3 = a3;
  v4 = -[NCDigestOnboardingIntroductionViewController initWithDeferButtonText:]([NCDigestOnboardingIntroductionViewController alloc], "initWithDeferButtonText:", v3);

  return v4;
}

- (NCDigestOnboardingIntroductionViewController)initWithDeferButtonText:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NCDigestOnboardingIntroductionViewController *v10;
  objc_super v12;

  v5 = a3;
  NCUserNotificationsUIKitFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_ONBOARDING_INTRODUCTION_TITLE"), &stru_1E8D21F60, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NCUserNotificationsUIKitFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_ONBOARDING_INTRODUCTION_DESCRIPTION"), &stru_1E8D21F60, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)NCDigestOnboardingIntroductionViewController;
  v10 = -[NCOnboardingViewController initWithTitle:detailText:contentLayout:](&v12, sel_initWithTitle_detailText_contentLayout_, v7, v9, 4);

  if (v10)
    objc_storeStrong((id *)&v10->_deferButtonText, a3);

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
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
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)NCDigestOnboardingIntroductionViewController;
  -[NCOnboardingViewController viewDidLoad](&v38, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:forState:", self->_deferButtonText, 0);
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__deferButtonPressed_, 64);
  -[NCDigestOnboardingIntroductionViewController buttonTray](self, "buttonTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addButton:", v3);

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NCDigestOnboardingIntroductionViewController customContentView](self, "customContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[NCDigestOnboardingIntroductionViewController contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v6);

  objc_msgSend(v6, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCDigestOnboardingIntroductionViewController contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);

  -[NCDigestOnboardingIntroductionViewController contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v15);

  objc_msgSend(v6, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCDigestOnboardingIntroductionViewController contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v19);

  objc_msgSend(v6, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCDigestOnboardingIntroductionViewController contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v23);

  -[NCDigestOnboardingIntroductionViewController secondaryCustomContentView](self, "secondaryCustomContentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCDigestOnboardingIntroductionViewController secondaryContentView](self, "secondaryContentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v25, "addSubview:", v24);
  objc_msgSend(v24, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v28);

  objc_msgSend(v25, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v31);

  objc_msgSend(v24, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v34);

  objc_msgSend(v24, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v37);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v5);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NCDigestOnboardingIntroductionViewController;
  -[NCDigestOnboardingIntroductionViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  -[NCDigestOnboardingIntroductionViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:animated:", 1, v3);

}

- (id)customContentView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UILabel *v26;
  UILabel *clockLabel;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  UILabel *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  UILabel *v39;
  void *v40;
  double v41;
  UILabel *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
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
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
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
  void *v122;
  void *v123;
  NCGradientView *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  CGAffineTransform v129;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.258823529, 0.537254902, 0.82745098, 1.0);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.749019608, 0.980392157, 0.423529412, 1.0);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = -[NCGradientView initWithVerticalStartColor:verticalEndColor:]([NCGradientView alloc], "initWithVerticalStartColor:verticalEndColor:", v127, v126);
  -[NCGradientView setTranslatesAutoresizingMaskIntoConstraints:](v124, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v128 = v8;
  objc_msgSend(v8, "addSubview:", v124);
  -[NCDigestOnboardingIntroductionViewController traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceStyle");
  v11 = CFSTR("DigestOnboardingIntroduction-Dark-Foreground");
  if (v10 == 1)
    v11 = CFSTR("DigestOnboardingIntroduction-Light-Foreground");
  v12 = v11;

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v4, v5, v6, v7);
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowsGroupBlending:", 0);

  objc_msgSend(v8, "addSubview:", v13);
  v15 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (void *)MEMORY[0x1E0DC3870];
  NCUserNotificationsUIKitFrameworkBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageNamed:inBundle:", CFSTR("DigestOnboardingIntroduction-Background"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageWithRenderingMode:", 2);
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setImage:", v125);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTintColor:", v19);

  objc_msgSend(v15, "setContentMode:", 2);
  objc_msgSend(v15, "setClipsToBounds:", 0);
  objc_msgSend(v15, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCompositingFilter:", *MEMORY[0x1E0CD2E98]);

  objc_msgSend(v13, "addSubview:", v15);
  v21 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v22 = (void *)MEMORY[0x1E0DC3870];
  NCUserNotificationsUIKitFrameworkBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "imageNamed:inBundle:", v12, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setImage:", v24);
  objc_msgSend(v21, "setContentMode:", 2);
  objc_msgSend(v21, "setClipsToBounds:", 0);
  CGAffineTransformMakeScale(&v129, 0.6, 0.6);
  objc_msgSend(v21, "setTransform:", &v129);
  objc_msgSend(v13, "addSubview:", v21);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v4, v5, v6, v7);
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v122 = v25;
  objc_msgSend(v13, "addSubview:", v25);
  v26 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  clockLabel = self->_clockLabel;
  self->_clockLabel = v26;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_clockLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v28 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "containsString:", CFSTR("a"));

  v32 = self->_clockLabel;
  NCUserNotificationsUIKitFrameworkBundle();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v31)
    v35 = CFSTR("NOTIFICATION_DIGEST_ONBOARDING_INTRODUCTION_CLOCK_TIME_12_HOUR");
  else
    v35 = CFSTR("NOTIFICATION_DIGEST_ONBOARDING_INTRODUCTION_CLOCK_TIME_24_HOUR");
  objc_msgSend(v33, "localizedStringForKey:value:table:", v35, &stru_1E8D21F60, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v32, "setText:", v36);

  -[UILabel setTextAlignment:](self->_clockLabel, "setTextAlignment:", 1);
  -[UILabel setClipsToBounds:](self->_clockLabel, "setClipsToBounds:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 42.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "fontDescriptor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "fontDescriptorWithDesign:", *MEMORY[0x1E0DC13A8]);
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = self->_clockLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v123, 42.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v39, "setFont:", v40);

  -[UILabel setMinimumScaleFactor:](self->_clockLabel, "setMinimumScaleFactor:", 0.25);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_clockLabel, "setAdjustsFontSizeToFitWidth:", 1);
  LODWORD(v41) = 1132068864;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_clockLabel, "setContentCompressionResistancePriority:forAxis:", 0, v41);
  v42 = self->_clockLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "colorWithAlphaComponent:", 0.4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v42, "setTextColor:", v44);

  -[UILabel superview](self->_clockLabel, "superview");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "layer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setAllowsGroupBlending:", 0);

  -[UILabel layer](self->_clockLabel, "layer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setCompositingFilter:", *MEMORY[0x1E0CD2EA0]);

  objc_msgSend(v25, "addSubview:", self->_clockLabel);
  v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v13, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50, 44.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v51);

  objc_msgSend(v128, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v54);

  objc_msgSend(v13, "widthAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "heightAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:multiplier:", v56, 0.656);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v57);

  objc_msgSend(v13, "centerXAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "centerXAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v60);

  objc_msgSend(v15, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:constant:", v62, 0.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v63);

  objc_msgSend(v13, "trailingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:constant:", v65, 0.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v66);

  objc_msgSend(v15, "topAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:constant:", v68, 0.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v69);

  objc_msgSend(v13, "bottomAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:constant:", v71, 0.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v72);

  objc_msgSend(v21, "leadingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:constant:", v74, 0.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v75);

  objc_msgSend(v13, "trailingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:constant:", v77, 0.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v78);

  objc_msgSend(v21, "topAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:constant:", v80, 30.0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v81);

  objc_msgSend(v13, "bottomAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:constant:", v83, 0.0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v84);

  objc_msgSend(v122, "heightAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "heightAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:multiplier:", v86, 0.319);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v87);

  objc_msgSend(v122, "topAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v90);

  objc_msgSend(v122, "leadingAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "constraintEqualToAnchor:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v93);

  objc_msgSend(v15, "trailingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "trailingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:", v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v96);

  -[UILabel heightAnchor](self->_clockLabel, "heightAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "heightAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintEqualToAnchor:multiplier:", v98, 0.15);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v99);

  -[UILabel bottomAnchor](self->_clockLabel, "bottomAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "bottomAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToAnchor:", v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v102);

  -[UILabel leadingAnchor](self->_clockLabel, "leadingAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "leadingAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "constraintEqualToAnchor:", v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v105);

  -[UILabel trailingAnchor](self->_clockLabel, "trailingAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "trailingAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "constraintEqualToAnchor:", v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v108);

  -[NCGradientView leadingAnchor](v124, "leadingAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "leadingAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "constraintEqualToAnchor:constant:", v110, 0.0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v111);

  objc_msgSend(v128, "trailingAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCGradientView trailingAnchor](v124, "trailingAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "constraintEqualToAnchor:constant:", v113, 0.0);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v114);

  -[NCGradientView topAnchor](v124, "topAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "topAnchor");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "constraintEqualToAnchor:constant:", v116, 0.0);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v117);

  objc_msgSend(v128, "bottomAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCGradientView bottomAnchor](v124, "bottomAnchor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "constraintEqualToAnchor:constant:", v119, 0.0);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v120);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v48);
  return v128;
}

- (id)secondaryCustomContentView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  UIView *v11;
  UIView *explainer1Container;
  void *v13;
  UILabel *v14;
  UILabel *explainer1Title;
  UILabel *v16;
  void *v17;
  void *v18;
  UILabel *v19;
  UILabel *explainer1Label;
  UILabel *v21;
  void *v22;
  void *v23;
  UIView *v24;
  UIView *explainer2Container;
  void *v26;
  UILabel *v27;
  UILabel *explainer2Title;
  UILabel *v29;
  void *v30;
  void *v31;
  UILabel *v32;
  UILabel *explainer2Label;
  UILabel *v34;
  void *v35;
  void *v36;
  id v37;
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
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v121 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  objc_msgSend(v121, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "pointSize");
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 6, 29.0);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v122, "pointSize");
  objc_msgSend(v10, "systemFontOfSize:weight:");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v4, v5, v6, v7);
  explainer1Container = self->_explainer1Container;
  self->_explainer1Container = v11;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_explainer1Container, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v121, "addSubview:", self->_explainer1Container);
  v117 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v4, v5, v6, v7);
  objc_msgSend(v117, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("deskclock"), v120);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "setImage:", v116);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "setTintColor:", v13);

  objc_msgSend(v117, "setContentMode:", 7);
  -[UIView addSubview:](self->_explainer1Container, "addSubview:", v117);
  v14 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  explainer1Title = self->_explainer1Title;
  self->_explainer1Title = v14;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_explainer1Title, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_explainer1Title, "setNumberOfLines:", 0);
  v16 = self->_explainer1Title;
  NCUserNotificationsUIKitFrameworkBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_ONBOARDING_INTRODUCTION_EXPLAINER_1_TITLE"), &stru_1E8D21F60, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v16, "setText:", v18);

  -[UILabel setFont:](self->_explainer1Title, "setFont:", v118);
  -[UIView addSubview:](self->_explainer1Container, "addSubview:", self->_explainer1Title);
  v19 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  explainer1Label = self->_explainer1Label;
  self->_explainer1Label = v19;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_explainer1Label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v21 = self->_explainer1Label;
  NCUserNotificationsUIKitFrameworkBundle();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_ONBOARDING_INTRODUCTION_EXPLAINER_1_BODY"), &stru_1E8D21F60, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v21, "setText:", v23);

  -[UILabel setFont:](self->_explainer1Label, "setFont:", v122);
  -[UILabel setNumberOfLines:](self->_explainer1Label, "setNumberOfLines:", 0);
  -[UILabel setTextColor:](self->_explainer1Label, "setTextColor:", v119);
  -[UIView addSubview:](self->_explainer1Container, "addSubview:", self->_explainer1Label);
  v24 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v4, v5, v6, v7);
  explainer2Container = self->_explainer2Container;
  self->_explainer2Container = v24;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_explainer2Container, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v121, "addSubview:", self->_explainer2Container);
  v114 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v4, v5, v6, v7);
  objc_msgSend(v114, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.bubble"), v120);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setImage:", v115);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setTintColor:", v26);

  objc_msgSend(v114, "setContentMode:", 7);
  -[UIView addSubview:](self->_explainer2Container, "addSubview:", v114);
  v27 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  explainer2Title = self->_explainer2Title;
  self->_explainer2Title = v27;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_explainer2Title, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_explainer2Title, "setNumberOfLines:", 0);
  v29 = self->_explainer2Title;
  NCUserNotificationsUIKitFrameworkBundle();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_ONBOARDING_INTRODUCTION_EXPLAINER_2_TITLE"), &stru_1E8D21F60, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v29, "setText:", v31);

  -[UILabel setFont:](self->_explainer2Title, "setFont:", v118);
  -[UIView addSubview:](self->_explainer2Container, "addSubview:", self->_explainer2Title);
  v32 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  explainer2Label = self->_explainer2Label;
  self->_explainer2Label = v32;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_explainer2Label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v34 = self->_explainer2Label;
  NCUserNotificationsUIKitFrameworkBundle();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_ONBOARDING_INTRODUCTION_EXPLAINER_2_BODY"), &stru_1E8D21F60, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v34, "setText:", v36);

  -[UILabel setFont:](self->_explainer2Label, "setFont:", v122);
  -[UILabel setNumberOfLines:](self->_explainer2Label, "setNumberOfLines:", 0);
  -[UILabel setTextColor:](self->_explainer2Label, "setTextColor:", v119);
  -[UIView addSubview:](self->_explainer2Container, "addSubview:", self->_explainer2Label);
  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[UIView topAnchor](self->_explainer1Container, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, v9);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v40);

  -[UIView leadingAnchor](self->_explainer1Container, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v43);

  objc_msgSend(v121, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_explainer1Container, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v46);

  objc_msgSend(v117, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel topAnchor](self->_explainer1Title, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, 12.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v49);

  objc_msgSend(v117, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_explainer1Container, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, 12.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v52);

  -[UILabel leadingAnchor](self->_explainer1Title, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_explainer1Container, "leadingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, 64.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v55);

  -[UIView trailingAnchor](self->_explainer1Container, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_explainer1Title, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v58);

  -[UILabel topAnchor](self->_explainer1Title, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_explainer1Container, "topAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v61);

  -[UILabel topAnchor](self->_explainer1Label, "topAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_explainer1Title, "bottomAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:constant:", v63, 0.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v64);

  -[UILabel leadingAnchor](self->_explainer1Label, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leadingAnchor](self->_explainer1Title, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v67);

  -[UIView trailingAnchor](self->_explainer1Container, "trailingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_explainer1Label, "trailingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v70);

  -[UIView bottomAnchor](self->_explainer1Container, "bottomAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_explainer1Label, "bottomAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:constant:", v72, 0.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v73);

  -[UIView leadingAnchor](self->_explainer2Container, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "leadingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v76);

  objc_msgSend(v121, "trailingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_explainer2Container, "trailingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:", v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v79);

  -[UIView topAnchor](self->_explainer2Container, "topAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_explainer1Container, "bottomAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:constant:", v81, v9 * 2.0 + -5.0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v82);

  -[UIView bottomAnchor](self->_explainer2Container, "bottomAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "bottomAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:", v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v85);

  objc_msgSend(v114, "topAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel topAnchor](self->_explainer2Title, "topAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToAnchor:constant:", v87, 11.0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v88);

  objc_msgSend(v114, "leadingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_explainer2Container, "leadingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:constant:", v90, 9.0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v91);

  -[UILabel leadingAnchor](self->_explainer2Title, "leadingAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_explainer2Container, "leadingAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToAnchor:constant:", v93, 64.0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v94);

  -[UIView trailingAnchor](self->_explainer2Container, "trailingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_explainer2Title, "trailingAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:", v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v97);

  -[UILabel topAnchor](self->_explainer2Title, "topAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_explainer2Container, "topAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "constraintEqualToAnchor:", v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v100);

  -[UILabel topAnchor](self->_explainer2Label, "topAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_explainer2Title, "bottomAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "constraintEqualToAnchor:constant:", v102, 0.0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v103);

  -[UILabel leadingAnchor](self->_explainer2Label, "leadingAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leadingAnchor](self->_explainer2Title, "leadingAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "constraintEqualToAnchor:", v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v106);

  -[UIView trailingAnchor](self->_explainer2Container, "trailingAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_explainer2Label, "trailingAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "constraintEqualToAnchor:", v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v109);

  -[UIView bottomAnchor](self->_explainer2Container, "bottomAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_explainer2Label, "bottomAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "constraintEqualToAnchor:constant:", v111, 0.0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v112);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v37);
  return v121;
}

- (void)_deferButtonPressed:(id)a3
{
  void *v4;
  id v5;

  -[NCDigestOnboardingIntroductionViewController navigationController](self, "navigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  -[NCOnboardingViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "onboardingViewControllerDidDeferSetup:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockLabel, 0);
  objc_storeStrong((id *)&self->_explainer2Label, 0);
  objc_storeStrong((id *)&self->_explainer2Title, 0);
  objc_storeStrong((id *)&self->_explainer2Container, 0);
  objc_storeStrong((id *)&self->_explainer1Label, 0);
  objc_storeStrong((id *)&self->_explainer1Title, 0);
  objc_storeStrong((id *)&self->_explainer1Container, 0);
  objc_storeStrong((id *)&self->_deferButtonText, 0);
}

@end
