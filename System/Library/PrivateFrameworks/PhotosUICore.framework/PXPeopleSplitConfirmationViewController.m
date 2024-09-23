@implementation PXPeopleSplitConfirmationViewController

- (PXPeopleSplitConfirmationViewController)initWithPerson:(id)a3
{
  id v5;
  PXPeopleSplitConfirmationViewController *v6;
  PXPeopleSplitConfirmationViewController *v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXPeopleSplitConfirmationViewController;
  v6 = -[PXPeopleConfirmationViewController initWithPerson:](&v12, sel_initWithPerson_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_person, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel_contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)-[PXPeopleSplitConfirmationViewController registerForTraitChanges:withAction:](v7, "registerForTraitChanges:withAction:", v9, sel_traitEnvironment_didChangeTraitCollection_);

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  PXAnimatedCountView *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
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
  PXAnimatedCountView *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)PXPeopleSplitConfirmationViewController;
  -[PXPeopleConfirmationViewController viewDidLoad](&v38, sel_viewDidLoad);
  -[PXPeopleSplitConfirmationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneTapped_);
  -[PXPeopleSplitConfirmationViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)v5;
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 21, self, sel_undoButtonTapped_);
  -[PXPeopleSplitConfirmationViewController setUndoButton:](self, "setUndoButton:");
  v7 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  objc_msgSend(v3, "addLayoutGuide:", v7);
  v8 = v7;
  -[PXPeopleSplitConfirmationViewController setControlLayoutGuide:](self, "setControlLayoutGuide:", v7);
  -[PXPeopleConfirmationViewController descriptionLabel](self, "descriptionLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v9, "setHidden:", 1);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = *MEMORY[0x1E0DC4B58];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v10, 2, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v11, "pointSize");
  v35 = (void *)v12;
  objc_msgSend(v13, "fontWithDescriptor:size:", v12);
  v14 = objc_claimAutoreleasedReturnValue();

  v34 = (void *)v14;
  objc_msgSend(v9, "setFont:", v14);
  objc_msgSend(v3, "addSubview:", v9);
  v15 = -[PXAnimatedCountView initWithFrame:]([PXAnimatedCountView alloc], "initWithFrame:", 0.0, 0.0, 200.0, 44.0);
  -[PXAnimatedCountView setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PXPeopleConfirmationViewController setCountView:](self, "setCountView:", v15);
  v33 = v15;
  objc_msgSend(v3, "addSubview:", v15);
  -[PXPeopleSplitConfirmationViewController person](self, "person");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "px_localizedName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v17;
  if (objc_msgSend(v17, "length"))
  {
    PXLocalizedStringForPersonOrPetAndVisibility(v16, 0, CFSTR("PXPeopleConfirmButtonThisIsPerson"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v19 = objc_claimAutoreleasedReturnValue();

    PXLocalizedStringForPersonOrPetAndVisibility(v16, 0, CFSTR("PXPeopleDenyButtonNotThisPerson"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v17;
    PXStringWithValidatedFormat();
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PXLocalizedStringForPersonOrPetAndVisibility(v16, 0, CFSTR("PXPeopleConfirmButtonUnnamed"));
    v19 = objc_claimAutoreleasedReturnValue();
    PXLocalizedStringForPersonOrPetAndVisibility(v16, 0, CFSTR("PXPeopleDenyButtonUnnamed"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v19;
  objc_msgSend(v3, "tintColor", v30);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleSplitConfirmationViewController _buttonWithTitle:action:andColor:](self, "_buttonWithTitle:action:andColor:", v19, sel_confirmTapped_, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addSubview:", v23);
  -[PXPeopleSplitConfirmationViewController setConfirmButton:](self, "setConfirmButton:", v23);
  objc_msgSend(v23, "setHidden:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleSplitConfirmationViewController _buttonWithTitle:action:andColor:](self, "_buttonWithTitle:action:andColor:", v21, sel_denyTapped_, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addSubview:", v25);
  -[PXPeopleSplitConfirmationViewController setDenyButton:](self, "setDenyButton:", v25);
  objc_msgSend(v25, "setHidden:", 1);
  objc_msgSend(v8, "heightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintGreaterThanOrEqualToConstant:", 100.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleSplitConfirmationViewController setControlGuideHeightConstraint:](self, "setControlGuideHeightConstraint:", v27);
  v28 = (void *)MEMORY[0x1E0CB3718];
  -[PXPeopleSplitConfirmationViewController commonConstraints](self, "commonConstraints");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "activateConstraints:", v29);

}

- (void)updateViewConstraints
{
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  _BOOL4 v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v39;
  CGRect v40;
  CGRect v41;

  -[PXPeopleSplitConfirmationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  x = v40.origin.x;
  y = v40.origin.y;
  width = v40.size.width;
  height = v40.size.height;
  v8 = CGRectGetWidth(v40);
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  v9 = CGRectGetHeight(v41);
  v10 = (void *)MEMORY[0x1E0CB3718];
  if (v8 >= v9)
    -[PXPeopleSplitConfirmationViewController portraitConstraints](self, "portraitConstraints");
  else
    -[PXPeopleSplitConfirmationViewController landscapeConstraints](self, "landscapeConstraints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deactivateConstraints:", v11);

  -[PXPeopleSplitConfirmationViewController traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "horizontalSizeClass");
  v14 = objc_msgSend(v12, "verticalSizeClass");
  -[PXPeopleConfirmationViewController descriptionLabel](self, "descriptionLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "font");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleSplitConfirmationViewController confirmButton](self, "confirmButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "font");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleSplitConfirmationViewController denyButton](self, "denyButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "font");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 < v9 && v13 == 1)
  {
    v23 = 40.0;
    v24 = 66.0;
    v25 = 66.0;
  }
  else
  {
    v26 = v8 < v9;
    if (v14 != 1)
      v26 = 1;
    if (v8 >= v9)
      v24 = dbl_1A7C0C990[v14 != 1];
    else
      v24 = 74.0;
    if (v26)
      v25 = 71.0;
    else
      v25 = 86.0;
    v23 = 81.0;
  }
  objc_msgSend(v16, "_scaledValueForValue:", v23);
  v28 = v27;
  objc_msgSend(v19, "_scaledValueForValue:", v24);
  v30 = v29;
  objc_msgSend(v22, "_scaledValueForValue:", v25);
  v32 = v28 + v30 + v31 * 2.0;
  -[PXPeopleSplitConfirmationViewController controlGuideHeightConstraint](self, "controlGuideHeightConstraint");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setConstant:", v32);

  objc_msgSend(v3, "safeAreaInsets");
  if (v34 == 0.0)
    v35 = -15.0;
  else
    v35 = 0.0;
  -[PXPeopleSplitConfirmationViewController denyButtonBottomConstraint](self, "denyButtonBottomConstraint");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setConstant:", v35);

  v37 = (void *)MEMORY[0x1E0CB3718];
  if (v8 >= v9)
    -[PXPeopleSplitConfirmationViewController landscapeConstraints](self, "landscapeConstraints");
  else
    -[PXPeopleSplitConfirmationViewController portraitConstraints](self, "portraitConstraints");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "activateConstraints:", v38);

  v39.receiver = self;
  v39.super_class = (Class)PXPeopleSplitConfirmationViewController;
  -[PXPeopleSplitConfirmationViewController updateViewConstraints](&v39, sel_updateViewConstraints);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleSplitConfirmationViewController;
  -[PXPeopleSplitConfirmationViewController dealloc](&v4, sel_dealloc);
}

- (NSArray)portraitConstraints
{
  NSArray *portraitConstraints;
  void *v4;
  void *v5;
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
  NSArray *v16;
  NSArray *v17;
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
  _QWORD v34[9];

  v34[7] = *MEMORY[0x1E0C80C00];
  portraitConstraints = self->_portraitConstraints;
  if (!portraitConstraints)
  {
    -[PXPeopleConfirmationViewController suggestionView](self, "suggestionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleSplitConfirmationViewController controlLayoutGuide](self, "controlLayoutGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleSplitConfirmationViewController confirmButton](self, "confirmButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleSplitConfirmationViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeAreaLayoutGuide");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPeopleSplitConfirmationViewController controlGuideHeightConstraint](self, "controlGuideHeightConstraint");
    v32 = v5;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v29;
    objc_msgSend(v5, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v26;
    objc_msgSend(v4, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v21 = v7;
    objc_msgSend(v7, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v22;
    objc_msgSend(v4, "heightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widthAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:multiplier:", v19, 0.5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v9;
    objc_msgSend(v4, "heightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widthAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintLessThanOrEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34[4] = v12;
    objc_msgSend(v23, "widthAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "widthAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:multiplier:", v14, 0.8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34[5] = v15;
    v34[6] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 7);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v17 = self->_portraitConstraints;
    self->_portraitConstraints = v16;

    portraitConstraints = self->_portraitConstraints;
  }
  return portraitConstraints;
}

- (NSArray)landscapeConstraints
{
  NSArray *landscapeConstraints;
  void *v4;
  void *v5;
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
  NSArray *v19;
  NSArray *v20;
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
  _QWORD v36[8];

  v36[6] = *MEMORY[0x1E0C80C00];
  landscapeConstraints = self->_landscapeConstraints;
  if (!landscapeConstraints)
  {
    -[PXPeopleSplitConfirmationViewController confirmButton](self, "confirmButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleConfirmationViewController suggestionView](self, "suggestionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleSplitConfirmationViewController controlLayoutGuide](self, "controlLayoutGuide");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleSplitConfirmationViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeAreaLayoutGuide");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    objc_msgSend(v8, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v33;
    objc_msgSend(v6, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v5;
    objc_msgSend(v5, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v29;
    objc_msgSend(v4, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v6;
    objc_msgSend(v6, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v25, 42.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v24;
    v26 = v4;
    objc_msgSend(v4, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v10, -42.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v11;
    objc_msgSend(v5, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9;
    v23 = v9;
    objc_msgSend(v9, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36[4] = v15;
    objc_msgSend(v4, "widthAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "widthAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:multiplier:", v17, 0.33);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36[5] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 6);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v20 = self->_landscapeConstraints;
    self->_landscapeConstraints = v19;

    landscapeConstraints = self->_landscapeConstraints;
  }
  return landscapeConstraints;
}

- (NSArray)commonConstraints
{
  NSArray *commonConstraints;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *denyButtonBottomConstraint;
  NSLayoutConstraint *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSArray *v25;
  NSArray *v26;
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
  void *v73;
  _QWORD v74[19];

  v74[17] = *MEMORY[0x1E0C80C00];
  commonConstraints = self->_commonConstraints;
  if (!commonConstraints)
  {
    -[PXPeopleSplitConfirmationViewController confirmButton](self, "confirmButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleSplitConfirmationViewController denyButton](self, "denyButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleConfirmationViewController suggestionView](self, "suggestionView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleConfirmationViewController descriptionLabel](self, "descriptionLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleConfirmationViewController countView](self, "countView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleSplitConfirmationViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeAreaLayoutGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPeopleSplitConfirmationViewController controlLayoutGuide](self, "controlLayoutGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

    denyButtonBottomConstraint = self->_denyButtonBottomConstraint;
    self->_denyButtonBottomConstraint = v13;
    v15 = v13;

    objc_msgSend(v6, "topAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:constant:", v70, 15.0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v69;
    objc_msgSend(v7, "topAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v67, 5.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v74[1] = v66;
    objc_msgSend(v4, "heightAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToConstant:", 50.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v74[2] = v64;
    objc_msgSend(v5, "heightAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "heightAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v62);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v74[3] = v61;
    v73 = v5;
    objc_msgSend(v5, "widthAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widthAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v58);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v74[4] = v57;
    v60 = v6;
    objc_msgSend(v6, "widthAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "widthAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v54);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v74[5] = v53;
    v56 = v7;
    objc_msgSend(v7, "widthAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "widthAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v51);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v74[6] = v50;
    objc_msgSend(v5, "centerXAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerXAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v48);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v74[7] = v46;
    objc_msgSend(v6, "centerXAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerXAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v74[8] = v41;
    objc_msgSend(v7, "centerXAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerXAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v74[9] = v38;
    objc_msgSend(v72, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v74[10] = v35;
    objc_msgSend(v72, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v74[11] = v32;
    objc_msgSend(v10, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v9;
    objc_msgSend(v9, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v74[12] = v29;
    v43 = v10;
    objc_msgSend(v10, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v74[13] = v17;
    v18 = v4;
    v45 = v4;
    objc_msgSend(v4, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "centerXAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v74[14] = v21;
    objc_msgSend(v18, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -5.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v74[15] = v24;
    v74[16] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 17);
    v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v26 = self->_commonConstraints;
    self->_commonConstraints = v25;

    commonConstraints = self->_commonConstraints;
  }
  return commonConstraints;
}

- (void)updateViewWithViewState:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXPeopleSplitConfirmationViewController;
  -[PXPeopleConfirmationViewController updateViewWithViewState:](&v10, sel_updateViewWithViewState_);
  v5 = (a3 < 6) & (0x2Cu >> a3);
  -[PXPeopleConfirmationViewController descriptionLabel](self, "descriptionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5);

  -[PXPeopleSplitConfirmationViewController confirmButton](self, "confirmButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v5);

  -[PXPeopleSplitConfirmationViewController denyButton](self, "denyButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v5);

  -[PXPeopleConfirmationViewController countView](self, "countView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", v5);

}

- (void)suggestionDidDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPeopleSplitConfirmationViewController;
  -[PXPeopleConfirmationViewController suggestionDidDisplay](&v3, sel_suggestionDidDisplay);
  -[PXPeopleSplitConfirmationViewController _enableActionButtons](self, "_enableActionButtons");
}

- (void)confirmTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  objc_super v8;

  v4 = a3;
  -[PXPeopleSplitConfirmationViewController _disableActionButtonsWithSelectedButton:](self, "_disableActionButtonsWithSelectedButton:", v4);
  v8.receiver = self;
  v8.super_class = (Class)PXPeopleSplitConfirmationViewController;
  -[PXPeopleConfirmationViewController confirmTapped:](&v8, sel_confirmTapped_, v4);

  v5 = (void *)MEMORY[0x1E0DC3F10];
  -[PXPeopleSplitConfirmationViewController confirmButton](self, "confirmButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PXPeopleSplitConfirmationViewController_confirmTapped___block_invoke;
  v7[3] = &unk_1E5149198;
  v7[4] = self;
  objc_msgSend(v5, "transitionWithView:duration:options:animations:completion:", v6, 5242880, v7, 0, 0.33);

}

- (void)denyTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  objc_super v8;

  v4 = a3;
  -[PXPeopleSplitConfirmationViewController _disableActionButtonsWithSelectedButton:](self, "_disableActionButtonsWithSelectedButton:", v4);
  v8.receiver = self;
  v8.super_class = (Class)PXPeopleSplitConfirmationViewController;
  -[PXPeopleConfirmationViewController denyTapped:](&v8, sel_denyTapped_, v4);

  v5 = (void *)MEMORY[0x1E0DC3F10];
  -[PXPeopleSplitConfirmationViewController denyButton](self, "denyButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__PXPeopleSplitConfirmationViewController_denyTapped___block_invoke;
  v7[3] = &unk_1E5149198;
  v7[4] = self;
  objc_msgSend(v5, "transitionWithView:duration:options:animations:completion:", v6, 5242880, v7, 0, 0.33);

}

- (void)undoButtonTapped:(id)a3
{
  id v4;

  -[PXPeopleSplitConfirmationViewController _disableActionButtonsWithSelectedButton:](self, "_disableActionButtonsWithSelectedButton:", a3);
  -[PXPeopleSplitConfirmationViewController undoManager](self, "undoManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "canUndo"))
    objc_msgSend(v4, "undo");

}

- (id)_buttonWithTitle:(id)a3 action:(SEL)a4 andColor:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = (void *)MEMORY[0x1E0DC3518];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "buttonWithType:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v11, "setTitle:forState:", v10, 0);

  objc_msgSend(v11, "setTitleColor:forState:", v9, 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v12);

  objc_msgSend(v11, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerRadius:", 15.0);

  objc_msgSend(v11, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v15);

  objc_msgSend(v14, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v11, "setClipsToBounds:", 1);
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, a4, 64);

  return v11;
}

- (void)_enableActionButtons
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXPeopleSplitConfirmationViewController confirmButton](self, "confirmButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPeopleSplitConfirmationViewController denyButton](self, "denyButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 1);
  objc_msgSend(v3, "setEnabled:", 1);
  objc_msgSend(v6, "setBackgroundImage:forState:", 0, 2);
  objc_msgSend(v3, "setBackgroundImage:forState:", 0, 2);
  objc_msgSend(v6, "titleColorForState:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleColor:forState:", v4, 2);
  objc_msgSend(v3, "titleColorForState:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleColor:forState:", v5, 2);

}

- (void)_disableActionButtonsWithSelectedButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PXPeopleSplitConfirmationViewController confirmButton](self, "confirmButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleSplitConfirmationViewController denyButton](self, "denyButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "titleColorForState:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backgroundImageForState:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitleColor:forState:", v6, 2);
    objc_msgSend(v8, "setBackgroundImage:forState:", v7, 2);

  }
  objc_msgSend(v4, "setEnabled:", 0);
  objc_msgSend(v5, "setEnabled:", 0);

}

- (void)_updateUndoButton
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  -[PXPeopleConfirmationViewController suggestionManager](self, "suggestionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canUndo");

  -[PXPeopleSplitConfirmationViewController navigationItem](self, "navigationItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PXPeopleSplitConfirmationViewController undoButton](self, "undoButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLeftBarButtonItem:", v5);

  }
  else
  {
    objc_msgSend(v6, "setLeftBarButtonItem:", 0);
  }

}

- (void)suggestionManager:(id)a3 hasNewSuggestionsAvailable:(id)a4
{
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPeopleSplitConfirmationViewController;
  -[PXPeopleConfirmationViewController suggestionManager:hasNewSuggestionsAvailable:](&v6, sel_suggestionManager_hasNewSuggestionsAvailable_, a3, a4);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__PXPeopleSplitConfirmationViewController_suggestionManager_hasNewSuggestionsAvailable___block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)noMoreSuggestionsAvailableForSuggestionManager:(id)a3
{
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleSplitConfirmationViewController;
  -[PXPeopleConfirmationViewController noMoreSuggestionsAvailableForSuggestionManager:](&v5, sel_noMoreSuggestionsAvailableForSuggestionManager_, a3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PXPeopleSplitConfirmationViewController_noMoreSuggestionsAvailableForSuggestionManager___block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  id v3;

  -[PXPeopleSplitConfirmationViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdateConstraints");

}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "displayScale");
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    v9 = v11;

  }
  -[PXPeopleSplitConfirmationViewController traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");
  v14 = v13;

  if (v14 != v9)
  {
    -[PXPeopleSplitConfirmationViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNeedsUpdateConstraints");

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PXPeopleSplitConfirmationViewController;
  v7 = a4;
  -[PXPeopleSplitConfirmationViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__PXPeopleSplitConfirmationViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5148240;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (UIButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setConfirmButton:(id)a3
{
  objc_storeStrong((id *)&self->_confirmButton, a3);
}

- (UIButton)denyButton
{
  return self->_denyButton;
}

- (void)setDenyButton:(id)a3
{
  objc_storeStrong((id *)&self->_denyButton, a3);
}

- (UIBarButtonItem)undoButton
{
  return self->_undoButton;
}

- (void)setUndoButton:(id)a3
{
  objc_storeStrong((id *)&self->_undoButton, a3);
}

- (UILayoutGuide)controlLayoutGuide
{
  return self->_controlLayoutGuide;
}

- (void)setControlLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_controlLayoutGuide, a3);
}

- (NSLayoutConstraint)controlGuideHeightConstraint
{
  return self->_controlGuideHeightConstraint;
}

- (void)setControlGuideHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_controlGuideHeightConstraint, a3);
}

- (NSLayoutConstraint)denyButtonBottomConstraint
{
  return self->_denyButtonBottomConstraint;
}

- (void)setPortraitConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_portraitConstraints, a3);
}

- (void)setLandscapeConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_landscapeConstraints, a3);
}

- (void)setCommonConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_commonConstraints, a3);
}

- (PXPerson)person
{
  return self->_person;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_commonConstraints, 0);
  objc_storeStrong((id *)&self->_landscapeConstraints, 0);
  objc_storeStrong((id *)&self->_portraitConstraints, 0);
  objc_storeStrong((id *)&self->_denyButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_controlGuideHeightConstraint, 0);
  objc_storeStrong((id *)&self->_controlLayoutGuide, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_storeStrong((id *)&self->_denyButton, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
}

void __94__PXPeopleSplitConfirmationViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsUpdateConstraints");

}

uint64_t __90__PXPeopleSplitConfirmationViewController_noMoreSuggestionsAvailableForSuggestionManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateUndoButton");
}

uint64_t __88__PXPeopleSplitConfirmationViewController_suggestionManager_hasNewSuggestionsAvailable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateUndoButton");
}

void __54__PXPeopleSplitConfirmationViewController_denyTapped___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "denyButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHighlighted:", 1);

}

void __57__PXPeopleSplitConfirmationViewController_confirmTapped___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "confirmButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHighlighted:", 1);

}

@end
