@implementation _PXFeedbackTapToRadarViewController

- (UIStackView)screenshotControlStackView
{
  UIStackView *screenshotControlStackView;
  UIStackView *v4;
  UIStackView *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  UIStackView *v10;
  void *v11;

  screenshotControlStackView = self->_screenshotControlStackView;
  if (!screenshotControlStackView)
  {
    v4 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    v5 = self->_screenshotControlStackView;
    self->_screenshotControlStackView = v4;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_screenshotControlStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](self->_screenshotControlStackView, "setAxis:", 0);
    -[UIStackView setSpacing:](self->_screenshotControlStackView, "setSpacing:", 10.0);
    -[UIStackView setAlignment:](self->_screenshotControlStackView, "setAlignment:", 3);
    -[UIStackView setDistribution:](self->_screenshotControlStackView, "setDistribution:", 4);
    v6 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    +[_PXFeedbackTapToRadarViewController _textColor](_PXFeedbackTapToRadarViewController, "_textColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v8);

    objc_msgSend(v6, "setNumberOfLines:", 0);
    objc_msgSend(v6, "setText:", CFSTR("Include Screenshot:"));
    LODWORD(v9) = 1144750080;
    objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 0, v9);
    -[UIStackView addArrangedSubview:](self->_screenshotControlStackView, "addArrangedSubview:", v6);
    v10 = self->_screenshotControlStackView;
    -[_PXFeedbackTapToRadarViewController screenshotSwitch](self, "screenshotSwitch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v10, "addArrangedSubview:", v11);

    screenshotControlStackView = self->_screenshotControlStackView;
  }
  return screenshotControlStackView;
}

- (UIStackView)diagnosticStackView
{
  UIStackView *diagnosticStackView;
  UIStackView *v4;
  UIStackView *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  UIStackView *v10;
  void *v11;

  diagnosticStackView = self->_diagnosticStackView;
  if (!diagnosticStackView)
  {
    v4 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    v5 = self->_diagnosticStackView;
    self->_diagnosticStackView = v4;

    -[UIStackView setAxis:](self->_diagnosticStackView, "setAxis:", 0);
    -[UIStackView setSpacing:](self->_diagnosticStackView, "setSpacing:", 10.0);
    -[UIStackView setAlignment:](self->_diagnosticStackView, "setAlignment:", 3);
    -[UIStackView setDistribution:](self->_diagnosticStackView, "setDistribution:", 4);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_diagnosticStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    +[_PXFeedbackTapToRadarViewController _textColor](_PXFeedbackTapToRadarViewController, "_textColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v8);

    objc_msgSend(v6, "setNumberOfLines:", 0);
    objc_msgSend(v6, "setText:", CFSTR("Include Diagnostics:"));
    LODWORD(v9) = 1144750080;
    objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 0, v9);
    -[UIStackView addArrangedSubview:](self->_diagnosticStackView, "addArrangedSubview:", v6);
    v10 = self->_diagnosticStackView;
    -[_PXFeedbackTapToRadarViewController diagnoseSwitch](self, "diagnoseSwitch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v10, "addArrangedSubview:", v11);

    diagnosticStackView = self->_diagnosticStackView;
  }
  return diagnosticStackView;
}

- (UISegmentedControl)routesSegmentedControl
{
  UISegmentedControl *routesSegmentedControl;
  id v4;
  void *v5;
  UISegmentedControl *v6;
  UISegmentedControl *v7;
  void *v8;

  routesSegmentedControl = self->_routesSegmentedControl;
  if (!routesSegmentedControl)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3C58]);
    -[_PXFeedbackTapToRadarViewControllerDelegate availableRoutes](self->_delegate, "availableRoutes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UISegmentedControl *)objc_msgSend(v4, "initWithItems:", v5);
    v7 = self->_routesSegmentedControl;
    self->_routesSegmentedControl = v6;

    -[UISegmentedControl setSelectedSegmentIndex:](self->_routesSegmentedControl, "setSelectedSegmentIndex:", 0);
    -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](self->_routesSegmentedControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[_PXFeedbackTapToRadarViewController _textColor](_PXFeedbackTapToRadarViewController, "_textColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl setTintColor:](self->_routesSegmentedControl, "setTintColor:", v8);

    routesSegmentedControl = self->_routesSegmentedControl;
  }
  return routesSegmentedControl;
}

- (UILabel)routesDescriptionLabel
{
  UILabel *routesDescriptionLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  routesDescriptionLabel = self->_routesDescriptionLabel;
  if (!routesDescriptionLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v5 = self->_routesDescriptionLabel;
    self->_routesDescriptionLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_routesDescriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_routesDescriptionLabel, "setFont:", v6);

    +[_PXFeedbackTapToRadarViewController _textColor](_PXFeedbackTapToRadarViewController, "_textColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_routesDescriptionLabel, "setTextColor:", v7);

    -[_PXFeedbackTapToRadarViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "availableRoutesDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_routesDescriptionLabel, "setText:", v9);

    -[UILabel setTextAlignment:](self->_routesDescriptionLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_routesDescriptionLabel, "setNumberOfLines:", 0);
    routesDescriptionLabel = self->_routesDescriptionLabel;
  }
  return routesDescriptionLabel;
}

- (UISwitch)screenshotSwitch
{
  UISwitch *screenshotSwitch;
  UISwitch *v4;
  UISwitch *v5;
  void *v6;

  screenshotSwitch = self->_screenshotSwitch;
  if (!screenshotSwitch)
  {
    v4 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0DC3D18]);
    v5 = self->_screenshotSwitch;
    self->_screenshotSwitch = v4;

    -[UISwitch setTranslatesAutoresizingMaskIntoConstraints:](self->_screenshotSwitch, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[_PXFeedbackTapToRadarViewController _buttonTintColor](_PXFeedbackTapToRadarViewController, "_buttonTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwitch setOnTintColor:](self->_screenshotSwitch, "setOnTintColor:", v6);

    -[UISwitch setOn:](self->_screenshotSwitch, "setOn:", 1);
    screenshotSwitch = self->_screenshotSwitch;
  }
  return screenshotSwitch;
}

- (UISwitch)diagnoseSwitch
{
  UISwitch *diagnoseSwitch;
  UISwitch *v4;
  UISwitch *v5;
  void *v6;

  diagnoseSwitch = self->_diagnoseSwitch;
  if (!diagnoseSwitch)
  {
    v4 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0DC3D18]);
    v5 = self->_diagnoseSwitch;
    self->_diagnoseSwitch = v4;

    -[UISwitch setTranslatesAutoresizingMaskIntoConstraints:](self->_diagnoseSwitch, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[_PXFeedbackTapToRadarViewController _buttonTintColor](_PXFeedbackTapToRadarViewController, "_buttonTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwitch setOnTintColor:](self->_diagnoseSwitch, "setOnTintColor:", v6);

    -[UISwitch setOn:](self->_diagnoseSwitch, "setOn:", 1);
    diagnoseSwitch = self->_diagnoseSwitch;
  }
  return diagnoseSwitch;
}

- (UIButton)fileRadarButton
{
  UIButton *fileRadarButton;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIButton *v8;
  UIButton *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  fileRadarButton = self->_fileRadarButton;
  if (!fileRadarButton)
  {
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E0DC3518];
    objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0DC3428];
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __54___PXFeedbackTapToRadarViewController_fileRadarButton__block_invoke;
    v16 = &unk_1E5147F40;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v6, "actionWithHandler:", &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buttonWithConfiguration:primaryAction:", v5, v7, v13, v14, v15, v16);
    v8 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v9 = self->_fileRadarButton;
    self->_fileRadarButton = v8;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_fileRadarButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[_PXFeedbackTapToRadarViewController _buttonTintColor](_PXFeedbackTapToRadarViewController, "_buttonTintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](self->_fileRadarButton, "setTintColor:", v10);

    -[UIButton layer](self->_fileRadarButton, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCornerRadius:", 5.0);

    -[UIButton setTitle:forState:](self->_fileRadarButton, "setTitle:forState:", CFSTR("File Radar"), 0);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    fileRadarButton = self->_fileRadarButton;
  }
  return fileRadarButton;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
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
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  objc_super v81;
  _QWORD v82[2];
  _QWORD v83[14];

  v83[12] = *MEMORY[0x1E0C80C00];
  v81.receiver = self;
  v81.super_class = (Class)_PXFeedbackTapToRadarViewController;
  -[_PXFeedbackTapToRadarViewController viewDidLoad](&v81, sel_viewDidLoad);
  -[_PXFeedbackTapToRadarViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__didSelectCancelButton_);
  +[_PXFeedbackTapToRadarViewController _buttonTintColor](_PXFeedbackTapToRadarViewController, "_buttonTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

  -[_PXFeedbackTapToRadarViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v5;
  objc_msgSend(v7, "setLeftBarButtonItem:", v5);

  v8 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "setAxis:", 1);
  objc_msgSend(v8, "setAlignment:", 3);
  objc_msgSend(v8, "setSpacing:", 18.0);
  v9 = objc_alloc_init(MEMORY[0x1E0DC3C28]);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "addSubview:", v8);
  v80 = v9;
  objc_msgSend(v3, "addSubview:", v9);
  v10 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v11);

  objc_msgSend(v10, "setNumberOfLines:", 0);
  objc_msgSend(v10, "setTextAlignment:", 1);
  objc_msgSend(v10, "setText:", CFSTR("File Radar"));
  objc_msgSend(v8, "addArrangedSubview:", v10);
  v12 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v13);

  +[_PXFeedbackTapToRadarViewController _textColor](_PXFeedbackTapToRadarViewController, "_textColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v14);

  objc_msgSend(v12, "setNumberOfLines:", 0);
  objc_msgSend(v12, "setTextAlignment:", 1);
  objc_msgSend(v12, "setText:", CFSTR("This will take a snapshot of the details of your Photo Library (such as filenames and locations, but not actual assets).\n\nBy submitting this feedback you agree to share the details of this snapshot with Apple."));
  v76 = v12;
  objc_msgSend(v8, "addArrangedSubview:", v12);
  -[_PXFeedbackTapToRadarViewController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "shouldRequestScreenshotPermission");

  if (v16)
  {
    -[_PXFeedbackTapToRadarViewController screenshotControlStackView](self, "screenshotControlStackView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addArrangedSubview:", v17);

  }
  -[_PXFeedbackTapToRadarViewController diagnosticStackView](self, "diagnosticStackView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addArrangedSubview:");
  -[_PXFeedbackTapToRadarViewController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "availableRoutes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  v73 = v20;
  if (v20)
  {
    -[_PXFeedbackTapToRadarViewController routesSegmentedControl](self, "routesSegmentedControl");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addArrangedSubview:", v21);

    -[_PXFeedbackTapToRadarViewController routesDescriptionLabel](self, "routesDescriptionLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addArrangedSubview:", v22);

  }
  -[_PXFeedbackTapToRadarViewController fileRadarButton](self, "fileRadarButton", self);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addArrangedSubview:", v23);

  objc_msgSend(v10, "leadingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:", v71);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v70;
  objc_msgSend(v10, "trailingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v68);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v83[1] = v67;
  objc_msgSend(v10, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v65);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v83[2] = v64;
  v77 = v10;
  objc_msgSend(v10, "trailingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v83[3] = v60;
  objc_msgSend(v80, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v83[4] = v57;
  objc_msgSend(v80, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v83[5] = v53;
  objc_msgSend(v80, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, 10.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v83[6] = v50;
  objc_msgSend(v80, "trailingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v3;
  objc_msgSend(v3, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, -10.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v83[7] = v47;
  objc_msgSend(v8, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v83[8] = v24;
  objc_msgSend(v8, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v83[9] = v27;
  objc_msgSend(v8, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "leadingAnchor");
  v29 = v8;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v83[10] = v31;
  v63 = v29;
  objc_msgSend(v29, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v83[11] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 12);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v73)
  {
    objc_msgSend(v44, "routesDescriptionLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "leadingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v63;
    objc_msgSend(v63, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = v38;
    objc_msgSend(v35, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v82[1] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "arrayByAddingObjectsFromArray:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v36 = v63;
    v43 = v56;
  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v43);

}

- (void)_didSelectCancelButton:(id)a3
{
  -[_PXFeedbackTapToRadarViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_didSelectFileRadarButton
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[_PXFeedbackTapToRadarViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "shouldRequestScreenshotPermission"))
  {
    -[_PXFeedbackTapToRadarViewController screenshotSwitch](self, "screenshotSwitch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isOn");

  }
  else
  {
    v5 = 0;
  }

  -[_PXFeedbackTapToRadarViewController diagnoseSwitch](self, "diagnoseSwitch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isOn");

  -[_PXFeedbackTapToRadarViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "availableRoutes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    -[_PXFeedbackTapToRadarViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "availableRoutes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXFeedbackTapToRadarViewController routesSegmentedControl](self, "routesSegmentedControl");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v12, "selectedSegmentIndex"));
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  -[_PXFeedbackTapToRadarViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "didSelectFileRadarButtonWithScreenshotAllowed:attachDiagnose:selectedRoute:", v5, v7, v14);

  -[_PXFeedbackTapToRadarViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)setScreenshotControlStackView:(id)a3
{
  objc_storeStrong((id *)&self->_screenshotControlStackView, a3);
}

- (void)setDiagnosticStackView:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticStackView, a3);
}

- (void)setRoutesSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_routesSegmentedControl, a3);
}

- (void)setRoutesDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_routesDescriptionLabel, a3);
}

- (void)setScreenshotSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_screenshotSwitch, a3);
}

- (void)setDiagnoseSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_diagnoseSwitch, a3);
}

- (void)setFileRadarButton:(id)a3
{
  objc_storeStrong((id *)&self->_fileRadarButton, a3);
}

- (_PXFeedbackTapToRadarViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_fileRadarButton, 0);
  objc_storeStrong((id *)&self->_diagnoseSwitch, 0);
  objc_storeStrong((id *)&self->_screenshotSwitch, 0);
  objc_storeStrong((id *)&self->_routesDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_routesSegmentedControl, 0);
  objc_storeStrong((id *)&self->_diagnosticStackView, 0);
  objc_storeStrong((id *)&self->_screenshotControlStackView, 0);
}

+ (id)_textColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (id)_buttonTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", 0.55, 0.33, 0.667, 1.0);
}

@end
