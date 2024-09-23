@implementation _UIKeyShortcutHUDSearchBar

- (_UIKeyShortcutHUDSearchBar)initWithFrame:(CGRect)a3
{
  _UIKeyShortcutHUDSearchBar *v3;
  _UIKeyShortcutHUDSearchBar *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDSearchBar;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_UIKeyShortcutHUDSearchBar _commonInit](v3, "_commonInit");
  return v4;
}

- (_UIKeyShortcutHUDSearchBar)initWithCoder:(id)a3
{
  _UIKeyShortcutHUDSearchBar *v3;
  _UIKeyShortcutHUDSearchBar *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDSearchBar;
  v3 = -[UIView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[_UIKeyShortcutHUDSearchBar _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  -[_UIKeyShortcutHUDSearchBar _createBackgroundView](self, "_createBackgroundView");
  -[_UIKeyShortcutHUDSearchBar _createSearchTextField](self, "_createSearchTextField");
  -[_UIKeyShortcutHUDSearchBar _createCancelButton](self, "_createCancelButton");
  -[_UIKeyShortcutHUDSearchBar _setupLayout](self, "_setupLayout");
}

- (void)_createBackgroundView
{
  UIView *v3;
  UIView *backgroundView;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = (UIView *)objc_opt_new();
  backgroundView = self->_backgroundView;
  self->_backgroundView = v3;

  +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v5);

  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toolbarCellCornerRadius");
  v8 = v7;
  -[UIView layer](self->_backgroundView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", v8);

  v10 = *MEMORY[0x1E0CD2A68];
  -[UIView layer](self->_backgroundView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerCurve:", v10);

  -[UIView setAlpha:](self->_backgroundView, "setAlpha:", 0.0);
}

- (void)_createSearchTextField
{
  _UIKeyShortcutHUDSearchTextField *v3;
  _UIKeyShortcutHUDSearchTextField *searchTextField;
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
  id v15;

  v3 = (_UIKeyShortcutHUDSearchTextField *)objc_opt_new();
  searchTextField = self->_searchTextField;
  self->_searchTextField = v3;

  -[UITextField setBorderStyle:](self->_searchTextField, "setBorderStyle:", 0);
  _UINSLocalizedStringWithDefaultValue(CFSTR("Search"), CFSTR("Search"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setPlaceholder:](self->_searchTextField, "setPlaceholder:", v5);

  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchHUDTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField _placeholderLabel](self->_searchTextField, "_placeholderLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](self->_searchTextField, "setFont:", v9);

  +[_UIKeyShortcutHUDUtilities sharedFocusGroupIdentifier]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setFocusGroupIdentifier:](self->_searchTextField, "setFocusGroupIdentifier:", v10);

  -[UIView setAlpha:](self->_searchTextField, "setAlpha:", 0.0);
  -[UITextField setLeftView:](self->_searchTextField, "setLeftView:", 0);
  v15 = (id)objc_opt_new();
  +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("?"), 0x100000, sel__doNothing_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIKeyShortcutHUDShortcut shortcutWithUIKeyCommand:](_UIKeyShortcutHUDShortcut, "shortcutWithUIKeyCommand:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWantsCompressedWidth:", 1);
  objc_msgSend(v15, "setShortcut:", v12);
  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "searchHUDTextColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v14);

  -[_UIKeyShortcutHUDSearchTextField setShortcutInputView:](self->_searchTextField, "setShortcutInputView:", v15);
  -[UITextField setClearButtonMode:](self->_searchTextField, "setClearButtonMode:", 1);
  -[_UIKeyShortcutHUDSearchTextField setAutocapitalizationType:](self->_searchTextField, "setAutocapitalizationType:", 0);
  -[_UIKeyShortcutHUDSearchTextField setAutocorrectionType:](self->_searchTextField, "setAutocorrectionType:", 1);
  -[_UIKeyShortcutHUDSearchTextField setKeyboardType:](self->_searchTextField, "setKeyboardType:", 13);
  -[_UIKeyShortcutHUDSearchTextField setDisableInputBars:](self->_searchTextField, "setDisableInputBars:", 1);
  -[_UIKeyShortcutHUDSearchTextField setDisableHandwritingKeyboard:](self->_searchTextField, "setDisableHandwritingKeyboard:", 1);
  -[UIControl addTarget:action:forControlEvents:](self->_searchTextField, "addTarget:action:forControlEvents:", self, sel__textChanged_, 0x20000);

}

- (void)_createCancelButton
{
  void *v3;
  void *v4;
  UIButton *v5;
  UIButton *cancelButton;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id location;

  objc_initWeak(&location, self);
  _UINSLocalizedStringWithDefaultValue(CFSTR("Cancel"), CFSTR("Cancel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __49___UIKeyShortcutHUDSearchBar__createCancelButton__block_invoke;
  v18 = &unk_1E16B58D0;
  objc_copyWeak(&v19, &location);
  +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v3, 0, 0, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIButton systemButtonWithPrimaryAction:](UIButton, "systemButtonWithPrimaryAction:", v4, v15, v16, v17, v18);
  v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
  cancelButton = self->_cancelButton;
  self->_cancelButton = v5;

  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchHUDTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTintColor:](self->_cancelButton, "setTintColor:", v8);

  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancelButtonFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_cancelButton, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v10);

  -[UIButton titleLabel](self->_cancelButton, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAdjustsFontForContentSizeCategory:", 1);

  -[UIView setAlpha:](self->_cancelButton, "setAlpha:", 0.0);
  LODWORD(v13) = 1148846080;
  -[UIView setContentHuggingPriority:forAxis:](self->_cancelButton, "setContentHuggingPriority:forAxis:", 0, v13);
  LODWORD(v14) = 1148846080;
  -[UIView setContentCompressionResistancePriority:forAxis:](self->_cancelButton, "setContentCompressionResistancePriority:forAxis:", 0, v14);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)_setupLayout
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *standardSearchTextFieldConstraints;
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
  _QWORD v40[6];
  _QWORD v41[6];

  v41[4] = *MEMORY[0x1E0C80C00];
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_searchTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_cancelButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self, "addSubview:", self->_backgroundView);
  -[UIView addSubview:](self, "addSubview:", self->_searchTextField);
  -[UIView addSubview:](self, "addSubview:", self->_cancelButton);
  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toolbarContentInset");
  v5 = v4;

  -[UIView leadingAnchor](self->_searchTextField, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v36, v5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v34;
  -[UIView topAnchor](self->_searchTextField, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v30, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v6;
  -[UIView bottomAnchor](self->_searchTextField, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, -v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v9;
  -[UIView leadingAnchor](self->_cancelButton, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_searchTextField, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v11, 2.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  standardSearchTextFieldConstraints = self->_standardSearchTextFieldConstraints;
  self->_standardSearchTextFieldConstraints = v13;

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_standardSearchTextFieldConstraints);
  v27 = (void *)MEMORY[0x1E0D156E0];
  -[UIView leadingAnchor](self->_backgroundView, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_searchTextField, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v37);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v35;
  -[UIView topAnchor](self->_backgroundView, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_searchTextField, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v31);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v29;
  -[UIView trailingAnchor](self->_backgroundView, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_searchTextField, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v25;
  -[UIView bottomAnchor](self->_backgroundView, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_searchTextField, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v17;
  -[UIView trailingAnchor](self, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_cancelButton, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v19, 2.17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v40[4] = v20;
  -[UIView centerYAnchor](self, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_cancelButton, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v40[5] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v24);

}

- (NSString)text
{
  return (NSString *)-[UISearchTextField text](self->_searchTextField, "text");
}

- (void)setText:(id)a3
{
  -[UISearchTextField setText:](self->_searchTextField, "setText:", a3);
}

- (BOOL)isEditing
{
  return -[UITextField isEditing](self->_searchTextField, "isEditing");
}

- (void)setSearchButton:(id)a3
{
  -[_UIKeyShortcutHUDSearchTextField setSearchButton:](self->_searchTextField, "setSearchButton:", a3);
}

- (_UIKeyShortcutHUDSearchButton)searchButton
{
  return -[_UIKeyShortcutHUDSearchTextField searchButton](self->_searchTextField, "searchButton");
}

- (void)prepareForSearchTransition:(BOOL)a3 usingCell:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
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
  _BOOL4 v30;
  _QWORD v31[5];

  v30 = a3;
  v31[4] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  if (v11)
  {
    v12 = v11;
    -[UIView setAlpha:](self->_backgroundView, "setAlpha:", 1.0);
  }
  else
  {
    self->_usingFallbackSearchAnimation = 1;
    -[_UIKeyShortcutHUDSearchBar searchButton](self, "searchButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyShortcutHUDSearchBar searchButton](self, "searchButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "searchButtonIndexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellForItemAtIndexPath:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v14 = 0.0;
  if (-[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toolbarContentInset");
    v14 = v15;

  }
  if (v12)
  {
    -[_UIKeyShortcutHUDSearchBar searchTextField](self, "searchTextField");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v16;
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v27, v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v26;
    -[_UIKeyShortcutHUDSearchBar searchTextField](self, "searchTextField");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v17;
    objc_msgSend(v17, "constraintEqualToAnchor:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v22;
    -[_UIKeyShortcutHUDSearchBar searchTextField](self, "searchTextField");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v18;
    objc_msgSend(v18, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v7;
    -[_UIKeyShortcutHUDSearchBar searchTextField](self, "searchTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "widthAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "widthAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_storeStrong((id *)&self->_searchTextFieldTransitionConstraints, v19);
  if (v12)
  {

  }
  if (v30)
  {
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->_standardSearchTextFieldConstraints);
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_searchTextFieldTransitionConstraints);
    -[UIView layoutIfNeeded](self, "layoutIfNeeded");
  }

}

- (void)setSearching:(BOOL)a3
{
  double v4;

  if (self->_searching != a3)
  {
    self->_searching = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->_searchTextFieldTransitionConstraints);
      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_standardSearchTextFieldConstraints);
      v4 = 1.0;
      -[UIView setAlpha:](self->_searchTextField, "setAlpha:", 1.0);
      -[UIView setAlpha:](self->_cancelButton, "setAlpha:", 1.0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->_standardSearchTextFieldConstraints);
      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_searchTextFieldTransitionConstraints);
      v4 = 0.0;
      -[UIView setAlpha:](self->_searchTextField, "setAlpha:", 0.0);
      -[UIView setAlpha:](self->_cancelButton, "setAlpha:", 0.0);
      if (!self->_usingFallbackSearchAnimation)
      {
LABEL_6:
        -[UIView layoutIfNeeded](self, "layoutIfNeeded");
        return;
      }
    }
    -[UIView setAlpha:](self->_backgroundView, "setAlpha:", v4);
    goto LABEL_6;
  }
}

- (void)didCompleteSearchTransition
{
  NSArray *searchTextFieldTransitionConstraints;

  objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->_searchTextFieldTransitionConstraints);
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_standardSearchTextFieldConstraints);
  searchTextFieldTransitionConstraints = self->_searchTextFieldTransitionConstraints;
  self->_searchTextFieldTransitionConstraints = 0;

  self->_usingFallbackSearchAnimation = 0;
  if (!self->_searching)
    -[UIView setAlpha:](self->_backgroundView, "setAlpha:", 0.0);
}

- (void)selectAll:(id)a3
{
  -[UITextField selectAll:](self->_searchTextField, "selectAll:", a3);
}

- (BOOL)becomeFirstResponder
{
  return -[UISearchTextField becomeFirstResponder](self->_searchTextField, "becomeFirstResponder");
}

- (BOOL)resignFirstResponder
{
  return -[UISearchTextField resignFirstResponder](self->_searchTextField, "resignFirstResponder");
}

- (BOOL)isFirstResponder
{
  return -[UIView isFirstResponder](self->_searchTextField, "isFirstResponder");
}

- (void)_textChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UIKeyShortcutHUDSearchBar delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "searchBar:didUpdateSearchText:", self, v5);
}

- (_UIKeyShortcutHUDSearchBarDelegate)delegate
{
  return (_UIKeyShortcutHUDSearchBarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UIKeyShortcutHUDSearchTextField)searchTextField
{
  return self->_searchTextField;
}

- (BOOL)isSearching
{
  return self->_searching;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (NSArray)standardSearchTextFieldConstraints
{
  return self->_standardSearchTextFieldConstraints;
}

- (void)setStandardSearchTextFieldConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_standardSearchTextFieldConstraints, a3);
}

- (NSArray)searchTextFieldTransitionConstraints
{
  return self->_searchTextFieldTransitionConstraints;
}

- (void)setSearchTextFieldTransitionConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_searchTextFieldTransitionConstraints, a3);
}

- (BOOL)isUsingFallbackSearchAnimation
{
  return self->_usingFallbackSearchAnimation;
}

- (void)setUsingFallbackSearchAnimation:(BOOL)a3
{
  self->_usingFallbackSearchAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTextFieldTransitionConstraints, 0);
  objc_storeStrong((id *)&self->_standardSearchTextFieldConstraints, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_searchTextField, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
