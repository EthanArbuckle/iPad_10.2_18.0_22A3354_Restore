@implementation TUIEmojiSearchView

- (TUIEmojiSearchView)initWithFrame:(CGRect)a3
{
  TUIEmojiSearchView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIView *bottomHalfContainerView;
  uint64_t v11;
  UIView *resultsCollectionContainerView;
  TUIEmojiSearchTextField *v13;
  TUIEmojiSearchTextField *searchTextField;
  uint64_t v15;
  UIView *searchTextFieldContainerView;
  uint64_t v17;
  UIView *predictionViewWrapperView;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)TUIEmojiSearchView;
  v3 = -[TUIEmojiSearchView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    bottomHalfContainerView = v3->_bottomHalfContainerView;
    v3->_bottomHalfContainerView = (UIView *)v9;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_bottomHalfContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TUIEmojiSearchView addSubview:](v3, "addSubview:", v3->_bottomHalfContainerView);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v6, v7, v8);
    resultsCollectionContainerView = v3->_resultsCollectionContainerView;
    v3->_resultsCollectionContainerView = (UIView *)v11;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_resultsCollectionContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v3->_bottomHalfContainerView, "addSubview:", v3->_resultsCollectionContainerView);
    v3->_resultsViewVisible = 1;
    v13 = -[TUIEmojiSearchTextField initWithFrame:pretendsToBecomeFirstResponder:]([TUIEmojiSearchTextField alloc], "initWithFrame:pretendsToBecomeFirstResponder:", 1, v5, v6, v7, v8);
    searchTextField = v3->_searchTextField;
    v3->_searchTextField = v13;

    -[TUIEmojiSearchTextField setTranslatesAutoresizingMaskIntoConstraints:](v3->_searchTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TUIEmojiSearchView updatePlaceholder](v3, "updatePlaceholder");
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v6, v7, v8);
    searchTextFieldContainerView = v3->_searchTextFieldContainerView;
    v3->_searchTextFieldContainerView = (UIView *)v15;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_searchTextFieldContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v3->_searchTextFieldContainerView, "addSubview:", v3->_searchTextField);
    -[TUIEmojiSearchView insertSubview:belowSubview:](v3, "insertSubview:belowSubview:", v3->_searchTextFieldContainerView, v3->_bottomHalfContainerView);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v6, v7, v8);
    predictionViewWrapperView = v3->_predictionViewWrapperView;
    v3->_predictionViewWrapperView = (UIView *)v17;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_predictionViewWrapperView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v3->_bottomHalfContainerView, "addSubview:", v3->_predictionViewWrapperView);
    -[UIView setHidden:](v3->_predictionViewWrapperView, "setHidden:", !v3->_predictionViewVisible);
    v3->_buttonConfiguration = 1;
    if (TUIRemoteEmojiSearchViewControllerEnabled())
    {
      -[TUIEmojiSearchView addButtons](v3, "addButtons");
      -[TUIEmojiSearchView createConstraintsIfNeeded](v3, "createConstraintsIfNeeded");
      -[TUIEmojiSearchView updateButtons](v3, "updateButtons");
      -[TUIEmojiSearchView layoutIfNeeded](v3, "layoutIfNeeded");
    }
    if (TUIRemoteEmojiSearchViewControllerEnabled())
    {
      -[TUIEmojiSearchView traitCollection](v3, "traitCollection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIEmojiSearchView setCollapsed:](v3, "setCollapsed:", objc_msgSend(v19, "userInterfaceIdiom") != 1);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel__didChangeHandBiasNotification_, *MEMORY[0x1E0DC4EF0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v3, sel__buttonConfigurationWillChange_, CFSTR("TUIEmojiSearchViewButtonConfigurationWillChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v3, sel__placeholderWillChange_, CFSTR("TUIChangeEmojiSearchTextFieldPlaceholderNotification"), 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TUIEmojiSearchView;
  -[TUIEmojiSearchView dealloc](&v4, sel_dealloc);
}

- (void)addButtons
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  UIView *v9;
  UIView *createButton;
  void *v11;
  void *v12;
  void *v13;
  UIView *v14;
  UIView *stickerButton;
  void *v16;
  void *v17;
  void *v18;
  UIView *v19;
  UIView *memojiButton;
  void *v21;
  void *v22;
  void *v23;
  UIView *v24;
  UIView *animojiButton;
  UIVisualEffectView *v26;
  UIVisualEffectView *createButtonVisualEffectView;
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
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  id location;
  _QWORD v53[6];

  v53[4] = *MEMORY[0x1E0C80C00];
  if (TUIRemoteEmojiSearchViewControllerEnabled())
  {
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC37E8], "smallSystemFontSize");
    objc_msgSend(v3, "configurationWithPointSize:weight:", 4);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0DC3428];
    v6 = MEMORY[0x1E0C809B0];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __32__TUIEmojiSearchView_addButtons__block_invoke;
    v50[3] = &unk_1E24FAF08;
    objc_copyWeak(&v51, &location);
    objc_msgSend(v5, "actionWithHandler:", v50);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", CFSTR("emoji.face.grinning.and.plus"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiSearchView addButtonForAction:image:addLightEffect:](self, "addButtonForAction:image:addLightEffect:", v7, v8, 1);
    v9 = (UIView *)objc_claimAutoreleasedReturnValue();
    createButton = self->_createButton;
    self->_createButton = v9;

    v11 = (void *)MEMORY[0x1E0DC3428];
    v48[0] = v6;
    v48[1] = 3221225472;
    v48[2] = __32__TUIEmojiSearchView_addButtons__block_invoke_3;
    v48[3] = &unk_1E24FAF08;
    objc_copyWeak(&v49, &location);
    objc_msgSend(v11, "actionWithHandler:", v48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", CFSTR("sticker.badge.plus"), v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiSearchView addButtonForAction:image:addLightEffect:](self, "addButtonForAction:image:addLightEffect:", v12, v13, 0);
    v14 = (UIView *)objc_claimAutoreleasedReturnValue();
    stickerButton = self->_stickerButton;
    self->_stickerButton = v14;

    v16 = (void *)MEMORY[0x1E0DC3428];
    v46[0] = v6;
    v46[1] = 3221225472;
    v46[2] = __32__TUIEmojiSearchView_addButtons__block_invoke_4;
    v46[3] = &unk_1E24FAF08;
    objc_copyWeak(&v47, &location);
    objc_msgSend(v16, "actionWithHandler:", v46);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)v4;
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", CFSTR("ellipsis"), v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiSearchView addButtonForAction:image:addLightEffect:](self, "addButtonForAction:image:addLightEffect:", v17, v18, 0);
    v19 = (UIView *)objc_claimAutoreleasedReturnValue();
    memojiButton = self->_memojiButton;
    self->_memojiButton = v19;

    v21 = (void *)MEMORY[0x1E0DC3428];
    v44[0] = v6;
    v44[1] = 3221225472;
    v44[2] = __32__TUIEmojiSearchView_addButtons__block_invoke_5;
    v44[3] = &unk_1E24FAF08;
    objc_copyWeak(&v45, &location);
    objc_msgSend(v21, "actionWithHandler:", v44);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", CFSTR("plus"), v4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiSearchView addButtonForAction:image:addLightEffect:](self, "addButtonForAction:image:addLightEffect:", v22, v23, 0);
    v24 = (UIView *)objc_claimAutoreleasedReturnValue();
    animojiButton = self->_animojiButton;
    self->_animojiButton = v24;

    v26 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", 0);
    createButtonVisualEffectView = self->_createButtonVisualEffectView;
    self->_createButtonVisualEffectView = v26;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_createButtonVisualEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView layer](self->_createButtonVisualEffectView, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAllowsHitTesting:", 0);

    -[UIVisualEffectView setUserInteractionEnabled:](self->_createButtonVisualEffectView, "setUserInteractionEnabled:", 0);
    -[TUIEmojiSearchView addSubview:](self, "addSubview:", self->_createButtonVisualEffectView);
    v39 = (void *)MEMORY[0x1E0CB3718];
    -[UIVisualEffectView topAnchor](self->_createButtonVisualEffectView, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_createButton, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v40;
    -[UIVisualEffectView bottomAnchor](self->_createButtonVisualEffectView, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_createButton, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v31;
    -[UIVisualEffectView leadingAnchor](self->_createButtonVisualEffectView, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_createButton, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2] = v34;
    -[UIVisualEffectView trailingAnchor](self->_createButtonVisualEffectView, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_createButton, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v53[3] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "activateConstraints:", v38);

    objc_destroyWeak(&v45);
    objc_destroyWeak(&v47);
    objc_destroyWeak(&v49);
    objc_destroyWeak(&v51);

    objc_destroyWeak(&location);
  }
}

- (void)updateGlowEffects
{
  double v3;
  id v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[UIView frame](self->_createButton, "frame");
  -[UIVisualEffectView _setCornerRadius:](self->_createButtonVisualEffectView, "_setCornerRadius:", v3 * 0.5);
  if (self->_shouldCreateButtonGlow)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC4218]);
    objc_msgSend(MEMORY[0x1E0DC4228], "sharedShimmeringLight");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView frame](self->_createButton, "frame");
    v7 = (void *)objc_msgSend(v4, "initWithLightSource:radius:region:", v5, 1, v6 / 6.0);
    v9[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundEffects:](self->_createButtonVisualEffectView, "setBackgroundEffects:", v8);

  }
  else
  {
    -[UIVisualEffectView setBackgroundEffects:](self->_createButtonVisualEffectView, "setBackgroundEffects:", 0);
  }
}

- (void)setShouldCreateButtonGlow:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD v5[5];
  _QWORD v6[5];
  __int128 v7;
  _QWORD v8[6];

  v4 = a3 && !self->_collapsed;
  if (self->_shouldCreateButtonGlow != v4)
  {
    self->_shouldCreateButtonGlow = v4;
    if (a4)
    {
      if (v4)
      {
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __57__TUIEmojiSearchView_setShouldCreateButtonGlow_animated___block_invoke;
        v8[3] = &unk_1E24FB430;
        v8[4] = self;
        v8[5] = 0x3FF3333333333333;
        v6[0] = MEMORY[0x1E0C809B0];
        v6[1] = 3221225472;
        v6[2] = __57__TUIEmojiSearchView_setShouldCreateButtonGlow_animated___block_invoke_2;
        v6[3] = &unk_1E24FAF30;
        v6[4] = self;
        v7 = xmmword_18C80CD80;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v8, v6, 0.2);
      }
      else
      {
        v5[0] = MEMORY[0x1E0C809B0];
        v5[1] = 3221225472;
        v5[2] = __57__TUIEmojiSearchView_setShouldCreateButtonGlow_animated___block_invoke_5;
        v5[3] = &unk_1E24FC068;
        v5[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5, 0.5);
      }
    }
    else
    {
      -[TUIEmojiSearchView updateGlowEffects](self, "updateGlowEffects");
    }
  }
}

- (void)updatePlaceholder
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __39__TUIEmojiSearchView_updatePlaceholder__block_invoke;
  v2[3] = &unk_1E24FC068;
  v2[4] = self;
  tui_performBlockOnMainThread(v2);
}

- (void)_updatePlaceholder
{
  NSString *overridingPlaceholder;
  NSString *v4;
  void *v5;
  const __CFString *v6;
  NSString *v7;
  NSString *v8;

  overridingPlaceholder = self->_overridingPlaceholder;
  if (overridingPlaceholder)
  {
    v4 = overridingPlaceholder;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[TUIEmojiSearchView shouldShowGenmoji](TUIEmojiSearchView, "shouldShowGenmoji"))
      v6 = CFSTR("DESCRIBE_AN_EMOJI");
    else
      v6 = CFSTR("SEARCH_EMOJI");
    objc_msgSend(v5, "localizedStringInDeviceLanguageForKey:", v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

    v4 = v7;
  }
  v8 = v4;
  -[TUIEmojiSearchTextField setPlaceholder:](self->_searchTextField, "setPlaceholder:", v4);

}

- (void)updateButtons
{
  NSLayoutConstraint **p_buttonConstraintFirstButtonEnabled;
  NSLayoutConstraint **p_buttonConstaintNoButton;
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t buttonConfiguration;
  NSLayoutConstraint **p_buttonConstraintTwoButtons;
  double v11;
  double v12;
  double v13;
  double v14;

  p_buttonConstraintFirstButtonEnabled = &self->_buttonConstraintFirstButtonEnabled;
  -[NSLayoutConstraint setActive:](self->_buttonConstraintFirstButtonEnabled, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_buttonConstraintFirstButtonDisabled, "setActive:", 0);
  p_buttonConstaintNoButton = &self->_buttonConstaintNoButton;
  -[NSLayoutConstraint setActive:](self->_buttonConstaintNoButton, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_buttonConstraintOneButton, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_buttonConstraintTwoButtons, "setActive:", 0);
  if (+[TUIEmojiSearchView shouldShowGenmoji](TUIEmojiSearchView, "shouldShowGenmoji"))
  {
    v5 = 1.0;
  }
  else if (+[TUIEmojiSearchView shouldShowImages](TUIEmojiSearchView, "shouldShowImages"))
  {
    p_buttonConstraintFirstButtonEnabled = &self->_buttonConstraintFirstButtonDisabled;
    v5 = 0.0;
  }
  else
  {
    v5 = 1.0;
  }
  -[NSLayoutConstraint setActive:](*p_buttonConstraintFirstButtonEnabled, "setActive:", 1);
  if (+[TUIEmojiSearchView shouldShowImages](TUIEmojiSearchView, "shouldShowImages"))
  {
    buttonConfiguration = self->_buttonConfiguration;
    v6 = 0.0;
    v7 = 1.0;
    if (buttonConfiguration == 2)
      p_buttonConstraintTwoButtons = &self->_buttonConstraintTwoButtons;
    else
      p_buttonConstraintTwoButtons = &self->_buttonConstraintOneButton;
    if (buttonConfiguration == 2)
      v8 = 1.0;
    else
      v8 = 0.0;
    if (buttonConfiguration == 3)
    {
      p_buttonConstraintTwoButtons = &self->_buttonConstraintTwoButtons;
      v8 = 0.0;
      v11 = 1.0;
    }
    else
    {
      v11 = 0.0;
    }
    if (buttonConfiguration == 1)
      p_buttonConstaintNoButton = &self->_buttonConstraintTwoButtons;
    else
      p_buttonConstaintNoButton = p_buttonConstraintTwoButtons;
    if (buttonConfiguration == 1)
      v12 = 1.0;
    else
      v12 = 0.0;
    if (buttonConfiguration == 1)
      v13 = 0.0;
    else
      v13 = v8;
    if (buttonConfiguration == 1)
      v14 = 0.0;
    else
      v14 = v11;
  }
  else
  {
    v5 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
  }
  -[NSLayoutConstraint setActive:](*p_buttonConstaintNoButton, "setActive:", 1, v6, v7, v8);
  -[UIView setAlpha:](self->_createButton, "setAlpha:", v5);
  -[UIView setAlpha:](self->_stickerButton, "setAlpha:", v12);
  -[UIView setAlpha:](self->_memojiButton, "setAlpha:", v13);
  -[UIView setAlpha:](self->_animojiButton, "setAlpha:", v14);
  -[TUIEmojiSearchView updatePlaceholder](self, "updatePlaceholder");
}

- (id)addButtonForAction:(id)a3 image:(id)a4 addLightEffect:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  TUIEmojiSearchTextFieldBackgroundView *v11;
  TUIEmojiSearchTextFieldBackgroundView *v12;
  id v13;
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
  TUIEmojiSearchTextFieldBackgroundView *v47;
  void *v48;
  _QWORD v50[4];
  _QWORD v51[6];

  v5 = a5;
  v51[4] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  +[TUIEmojiSearchTextField preferredHeight](TUIEmojiSearchTextField, "preferredHeight");
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v7);

  v48 = v9;
  if (v5)
    objc_msgSend(MEMORY[0x1E0DC3518], "intelligenceButtonWithConfiguration:primaryAction:", v9, v8);
  else
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v9, v8);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setTintColor:", v10);

  v11 = [TUIEmojiSearchTextFieldBackgroundView alloc];
  objc_msgSend(v40, "bounds");
  v12 = -[TUIEmojiSearchTextFieldBackgroundView initWithFrame:](v11, "initWithFrame:");
  -[TUIEmojiSearchTextFieldBackgroundView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v14 = (void *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v14, "setAlpha:", 0.0);
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAllowsGroupBlending:", 0);

  objc_msgSend(v14, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAllowsGroupOpacity:", 0);

  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v14, "addSubview:", v12);
  v36 = (void *)MEMORY[0x1E0CB3718];
  -[TUIEmojiSearchTextFieldBackgroundView topAnchor](v12, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v43);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v41;
  -[TUIEmojiSearchTextFieldBackgroundView bottomAnchor](v12, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v18;
  v47 = v12;
  -[TUIEmojiSearchTextFieldBackgroundView leadingAnchor](v12, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v21;
  -[TUIEmojiSearchTextFieldBackgroundView trailingAnchor](v12, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "activateConstraints:", v25);

  objc_msgSend(v14, "addSubview:", v40);
  v35 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v40, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v44);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v42;
  objc_msgSend(v40, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v37);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v26;
  objc_msgSend(v40, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v29;
  objc_msgSend(v40, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "activateConstraints:", v33);

  -[UIView addSubview:](self->_searchTextFieldContainerView, "addSubview:", v14);
  return v14;
}

- (void)invalidateCollectionViewLayoutIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);

  if ((TUIRemoteEmojiSearchViewControllerEnabled() & 1) == 0)
  {
    -[TUIEmojiSearchView resultsCollectionView](self, "resultsCollectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "collectionViewLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateLayout");

  }
  -[TUIEmojiSearchView layoutInvalidationCallback](self, "layoutInvalidationCallback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TUIEmojiSearchView layoutInvalidationCallback](self, "layoutInvalidationCallback");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

  }
}

- (void)transitionToCompactLayout:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  NSArray **p_textFieldOnTopConstraints;
  void *v8;
  char v9;
  int *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  double v15;
  double v16;

  v3 = a3;
  -[TUIEmojiSearchView createConstraintsIfNeeded](self, "createConstraintsIfNeeded");
  -[TUIEmojiSearchView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 != 1)
    goto LABEL_16;
  self->_useHorizontalLayout = !v3;
  if (!v3)
  {
    if ((TUIRemoteEmojiSearchViewControllerEnabled() & 1) == 0)
      -[TUIEmojiSearchView setHidden:](self, "setHidden:", -[TUIEmojiSearchView isCollapsed](self, "isCollapsed"));
    p_textFieldOnTopConstraints = &self->_textFieldOnTopConstraints;
    -[NSArray firstObject](self->_textFieldOnTopConstraints, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isActive");

    if (!v12)
      goto LABEL_10;
    v10 = &OBJC_IVAR___TUIEmojiSearchView__sideBySideViewConstraints;
    goto LABEL_9;
  }
  -[TUIEmojiSearchView setHidden:](self, "setHidden:", 0);
  p_textFieldOnTopConstraints = &self->_sideBySideViewConstraints;
  -[NSArray firstObject](self->_sideBySideViewConstraints, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isActive");

  if ((v9 & 1) != 0)
  {
    v10 = &OBJC_IVAR___TUIEmojiSearchView__textFieldOnTopConstraints;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", *p_textFieldOnTopConstraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(Class *)((char *)&self->super.super.super.isa + *v10));
  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "showsCandidateBar");

  v15 = 0.0;
  v16 = 0.0;
  if (v14)
  {
    if (self->_useHorizontalLayout)
      v15 = -9.0;
    else
      v15 = 0.0;
    v16 = 6.0;
  }
  -[NSLayoutConstraint setConstant:](self->_predictionWrapperTop, "setConstant:", v15);
  -[NSLayoutConstraint setConstant:](self->_predictionWrapperBottom, "setConstant:", v15);
  -[NSLayoutConstraint setConstant:](self->_predictionWrapperLeading, "setConstant:", v16);
LABEL_16:
  -[TUIEmojiSearchView invalidateCollectionViewLayoutIfNeeded](self, "invalidateCollectionViewLayoutIfNeeded");
}

- (void)setResultsCollectionView:(id)a3
{
  UIView **p_resultsCollectionView;
  UIView *v6;
  UIView *resultsCollectionContainerView;
  _BOOL8 v8;
  id v9;

  v9 = a3;
  p_resultsCollectionView = &self->_resultsCollectionView;
  objc_storeStrong((id *)&self->_resultsCollectionView, a3);
  -[UIView superview](self->_resultsCollectionView, "superview");
  v6 = (UIView *)objc_claimAutoreleasedReturnValue();
  resultsCollectionContainerView = self->_resultsCollectionContainerView;

  if (v6 != resultsCollectionContainerView)
  {
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_resultsCollectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_resultsCollectionContainerView, "addSubview:", *p_resultsCollectionView);
    if (!self->_resultsCollectionWrapperConstraints)
      -[TUIEmojiSearchView _createResultsViewConstraints](self, "_createResultsViewConstraints");
  }
  -[TUIEmojiSearchView setNeedsLayout](self, "setNeedsLayout");
  v8 = self->_predictionViewVisible && !self->_resultsViewVisible;
  -[UIView setHidden:](*p_resultsCollectionView, "setHidden:", v8);
  -[TUIEmojiSearchView invalidateCollectionViewLayoutIfNeeded](self, "invalidateCollectionViewLayoutIfNeeded");

}

- (void)setPredictionView:(id)a3
{
  UIView *v5;
  UIView **p_predictionView;
  UIView *predictionView;
  UIView *v8;
  NSArray *predictionWrapperConstraints;
  UIView *v10;
  UIView *predictionViewWrapperView;
  UIView *v12;

  v5 = (UIView *)a3;
  p_predictionView = &self->_predictionView;
  predictionView = self->_predictionView;
  v8 = v5;
  v12 = v5;
  if (predictionView != v5)
  {
    -[UIView removeFromSuperview](predictionView, "removeFromSuperview");
    if (self->_predictionWrapperConstraints)
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
      predictionWrapperConstraints = self->_predictionWrapperConstraints;
      self->_predictionWrapperConstraints = 0;

    }
    objc_storeStrong((id *)&self->_predictionView, a3);
    -[UIView setHidden:](*p_predictionView, "setHidden:", 0);
    -[TUIEmojiSearchView setPredictionViewVisible:animated:](self, "setPredictionViewVisible:animated:", 0, 0);
    v8 = *p_predictionView;
  }
  -[UIView superview](v8, "superview");
  v10 = (UIView *)objc_claimAutoreleasedReturnValue();
  predictionViewWrapperView = self->_predictionViewWrapperView;

  if (v10 != predictionViewWrapperView)
  {
    -[UIView addSubview:](self->_predictionViewWrapperView, "addSubview:", *p_predictionView);
    -[TUIEmojiSearchView setNeedsLayout](self, "setNeedsLayout");
  }
  if (!self->_predictionWrapperConstraints)
    -[TUIEmojiSearchView _createPredictionViewConstraints](self, "_createPredictionViewConstraints");

}

- (void)setCollapsed:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_collapsed != a3)
  {
    v3 = a3;
    self->_collapsed = a3;
    -[TUIEmojiSearchView createConstraintsIfNeeded](self, "createConstraintsIfNeeded");
    -[UIView setHidden:](self->_bottomHalfContainerView, "setHidden:", v3);
    -[TUIEmojiSearchView invalidateCollectionViewLayoutIfNeeded](self, "invalidateCollectionViewLayoutIfNeeded");
    if (v3)
      -[TUIEmojiSearchView setShouldCreateButtonGlow:animated:](self, "setShouldCreateButtonGlow:animated:", 0, 0);
    if (self->_useHorizontalLayout)
    {
      if ((TUIRemoteEmojiSearchViewControllerEnabled() & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      v3 = 0;
    }
    -[TUIEmojiSearchView setHidden:](self, "setHidden:", v3);
LABEL_9:
    -[TUIEmojiSearchView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIEmojiSearchView;
  -[TUIEmojiSearchView layoutSubviews](&v3, sel_layoutSubviews);
  -[TUIEmojiSearchView updateGlowEffects](self, "updateGlowEffects");
  if (!-[TUIEmojiSearchView isCollapsed](self, "isCollapsed"))
  {
    -[UILayoutGuide layoutFrame](self->_predictionViewGuide, "layoutFrame");
    -[UIView setFrame:](self->_predictionView, "setFrame:");
  }
}

- (void)setPredictionViewVisible:(BOOL)a3
{
  -[TUIEmojiSearchView setPredictionViewVisible:animated:](self, "setPredictionViewVisible:animated:", a3, 0);
}

- (void)setPredictionViewVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v7;
  int *v8;
  id v9;
  UIView *v10;
  UIView *v11;
  uint64_t v12;
  UIView *v13;
  id v14;
  void (**v15)(_QWORD);
  UIView *v16;
  void (**v17)(void *, uint64_t);
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, int);
  void *v23;
  UIView *v24;
  TUIEmojiSearchView *v25;
  BOOL v26;
  _QWORD aBlock[4];
  UIView *v28;
  id v29;
  BOOL v30;

  v4 = a4;
  v5 = a3;
  if (self->_predictionViewVisible != a3
    || (v7 = -[UIView isHidden](self->_predictionViewWrapperView, "isHidden"),
        v7 == -[UIView isHidden](self->_resultsCollectionContainerView, "isHidden")))
  {
    self->_predictionViewVisible = v5;
    v8 = &OBJC_IVAR___TUIEmojiSearchView__resultsCollectionContainerView;
    if (v5)
      v8 = &OBJC_IVAR___TUIEmojiSearchView__predictionViewWrapperView;
    v9 = *(id *)((char *)&self->super.super.super.isa + *v8);
    if (v5)
    {
      v10 = self->_resultsCollectionContainerView;
    }
    else
    {
      -[UIView snapshotViewAfterScreenUpdates:](self->_predictionViewWrapperView, "snapshotViewAfterScreenUpdates:", 0);
      v10 = (UIView *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
    objc_msgSend(v9, "setHidden:", 0);
    -[UIView bringSubviewToFront:](self->_bottomHalfContainerView, "bringSubviewToFront:", v9);
    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__TUIEmojiSearchView_setPredictionViewVisible_animated___block_invoke;
    aBlock[3] = &unk_1E24FAF58;
    v30 = v5;
    v13 = v11;
    v28 = v13;
    v14 = v9;
    v29 = v14;
    v15 = (void (**)(_QWORD))_Block_copy(aBlock);
    v20 = v12;
    v21 = 3221225472;
    v22 = __56__TUIEmojiSearchView_setPredictionViewVisible_animated___block_invoke_4;
    v23 = &unk_1E24FAF80;
    v16 = v13;
    v26 = v5;
    v24 = v16;
    v25 = self;
    v17 = (void (**)(void *, uint64_t))_Block_copy(&v20);
    if (v4)
    {
      if (!v5)
      {
        -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0, v20, v21, v22, v23);
        -[UIView addSubview:](self->_bottomHalfContainerView, "addSubview:", v16);
        v18 = (void *)MEMORY[0x1E0CB3718];
        -[TUIEmojiSearchView _constraintsFromView:toContainerView:insets:identifier:](self, "_constraintsFromView:toContainerView:insets:identifier:", v16, self->_predictionViewWrapperView, CFSTR("snapshot"), *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "activateConstraints:", v19);

        -[UIView setHidden:](self->_predictionViewWrapperView, "setHidden:", 1);
      }
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateKeyframesWithDuration:delay:options:animations:completion:", 1, v15, v17, 0.2, 0.0, v20, v21, v22, v23);
    }
    else
    {
      v15[2](v15);
      v17[2](v17, 1);
    }

  }
}

- (void)setResultsViewVisible:(BOOL)a3
{
  void *v5;
  void (**v6)(void);

  if (self->_resultsViewVisible != a3)
  {
    self->_resultsViewVisible = a3;
    -[UIView setHidden:](self->_bottomHalfContainerView, "setHidden:", !a3);
    if (!a3)
      -[TUIEmojiSearchView transitionToCompactLayout:](self, "transitionToCompactLayout:", 1);
    -[TUIEmojiSearchView setNeedsLayout](self, "setNeedsLayout");
    -[TUIEmojiSearchView layoutInvalidationCallback](self, "layoutInvalidationCallback");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[TUIEmojiSearchView layoutInvalidationCallback](self, "layoutInvalidationCallback");
      v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v6[2]();

    }
  }
}

- (void)didMoveToWindow
{
  void *v3;
  NSString *overridingPlaceholder;

  -[TUIEmojiSearchView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TUIEmojiSearchView updateButtons](self, "updateButtons");
  }
  else
  {
    overridingPlaceholder = self->_overridingPlaceholder;
    self->_overridingPlaceholder = 0;

  }
}

- (void)createConstraintsIfNeeded
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *searchFieldToTop;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *topToBottomPadding;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSLayoutConstraint *v31;
  NSArray *v32;
  NSArray *textFieldOnTopConstraints;
  void *v34;
  uint64_t v35;
  BOOL v36;
  int v37;
  UIView *searchTextFieldContainerView;
  void *v39;
  void *v40;
  NSLayoutConstraint *v41;
  NSLayoutConstraint **p_searchFieldLeading;
  NSLayoutConstraint *searchFieldLeading;
  double v44;
  void *v45;
  void *v46;
  NSLayoutConstraint *v47;
  void *v48;
  void *v49;
  NSLayoutConstraint *v50;
  void *v51;
  void *v52;
  NSLayoutConstraint *v53;
  void *v54;
  void *v55;
  NSLayoutConstraint *v56;
  void *v57;
  void *v58;
  NSLayoutConstraint *v59;
  void *v60;
  void *v61;
  NSLayoutConstraint *v62;
  NSLayoutConstraint **v63;
  void *v64;
  void *v65;
  NSLayoutConstraint *v66;
  NSLayoutConstraint *v67;
  double v68;
  void *v69;
  void *v70;
  NSLayoutConstraint *v71;
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
  NSLayoutConstraint *v82;
  NSArray *v83;
  NSArray *sideBySideViewConstraints;
  void *v85;
  char v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  double v92;
  void *v93;
  char v94;
  double v95;
  _BOOL4 v96;
  double v97;
  NSLayoutConstraint *v98;
  uint64_t v99;
  void *v100;
  NSLayoutConstraint *v101;
  NSLayoutConstraint *v102;
  _QWORD v103[10];

  v103[8] = *MEMORY[0x1E0C80C00];
  if (!self->_searchFieldToTop)
  {
    -[UIView topAnchor](self->_searchTextFieldContainerView, "topAnchor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiSearchView topAnchor](self, "topAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, 0.0);
    v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    searchFieldToTop = self->_searchFieldToTop;
    self->_searchFieldToTop = v5;

    -[NSLayoutConstraint setIdentifier:](self->_searchFieldToTop, "setIdentifier:", CFSTR("searchField.top"));
    LODWORD(v7) = 1148829696;
    -[NSLayoutConstraint setPriority:](self->_searchFieldToTop, "setPriority:", v7);
  }
  if (!self->_textFieldOnTopConstraints)
  {
    -[UIView heightAnchor](self->_searchTextFieldContainerView, "heightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[TUIEmojiSearchTextField preferredHeight](TUIEmojiSearchTextField, "preferredHeight");
    objc_msgSend(v8, "constraintEqualToConstant:", v9 + -12.0);
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v100, "setIdentifier:", CFSTR("searchField.height"));
    -[UIView leadingAnchor](self->_searchTextFieldContainerView, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiSearchView leadingAnchor](self, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 8.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v13) = 1148829696;
    objc_msgSend(v12, "setPriority:", v13);
    objc_msgSend(v12, "setIdentifier:", CFSTR("searchField.leading"));
    -[TUIEmojiSearchView trailingAnchor](self, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_searchTextFieldContainerView, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 8.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v17) = 1148829696;
    objc_msgSend(v16, "setPriority:", v17);
    objc_msgSend(v16, "setIdentifier:", CFSTR("searchField.trailing"));
    -[UIView topAnchor](self->_bottomHalfContainerView, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_searchTextFieldContainerView, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 0.0);
    v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    topToBottomPadding = self->_topToBottomPadding;
    self->_topToBottomPadding = v20;

    -[NSLayoutConstraint setIdentifier:](self->_topToBottomPadding, "setIdentifier:", CFSTR("verticalSearchSpacing"));
    -[UIView leadingAnchor](self->_bottomHalfContainerView, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiSearchView leadingAnchor](self, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "setIdentifier:", CFSTR("bottomContainer.leading"));
    -[TUIEmojiSearchView bottomAnchor](self, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_bottomHalfContainerView, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 0.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "setIdentifier:", CFSTR("bottomContainer.bottom"));
    -[TUIEmojiSearchView trailingAnchor](self, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_bottomHalfContainerView, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, 0.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "setIdentifier:", CFSTR("bottomContainer.trailing"));
    v31 = self->_topToBottomPadding;
    v103[0] = self->_searchFieldToTop;
    v103[1] = v31;
    v103[2] = v27;
    v103[3] = v100;
    v103[4] = v12;
    v103[5] = v16;
    v103[6] = v24;
    v103[7] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 8);
    v32 = (NSArray *)objc_claimAutoreleasedReturnValue();
    textFieldOnTopConstraints = self->_textFieldOnTopConstraints;
    self->_textFieldOnTopConstraints = v32;

  }
  -[TUIEmojiSearchView traitCollection](self, "traitCollection");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "userInterfaceIdiom");

  if (self->_sideBySideViewConstraints)
    v36 = 0;
  else
    v36 = v35 == 1;
  if (v36)
  {
    v99 = v35;
    self->_previousInsets = -1.0;
    v37 = TUIRemoteEmojiSearchViewControllerEnabled();
    searchTextFieldContainerView = self->_searchTextFieldContainerView;
    if (v37)
    {
      -[UIView trailingAnchor](searchTextFieldContainerView, "trailingAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIEmojiSearchView trailingAnchor](self, "trailingAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, 0.0);
      v41 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      p_searchFieldLeading = &self->_searchFieldLeading;
      searchFieldLeading = self->_searchFieldLeading;
      self->_searchFieldLeading = v41;

      LODWORD(v44) = 1148829696;
      -[NSLayoutConstraint setPriority:](self->_searchFieldLeading, "setPriority:", v44);
      -[NSLayoutConstraint setIdentifier:](self->_searchFieldLeading, "setIdentifier:", CFSTR("searchField.leading"));
      -[TUIEmojiSearchView bottomAnchor](self, "bottomAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_searchTextFieldContainerView, "bottomAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, 0.0);
      v47 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

      v98 = v47;
      -[NSLayoutConstraint setIdentifier:](v47, "setIdentifier:", CFSTR("searchField.bottom"));
      -[UIView topAnchor](self->_bottomHalfContainerView, "topAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self->_searchTextFieldContainerView, "topAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "constraintEqualToAnchor:", v49);
      v50 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

      -[NSLayoutConstraint setIdentifier:](v50, "setIdentifier:", CFSTR("bottomContainer.top"));
      -[UIView trailingAnchor](self->_bottomHalfContainerView, "trailingAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self->_searchTextFieldContainerView, "leadingAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "constraintEqualToAnchor:constant:", v52, -8.0);
      v53 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

      -[NSLayoutConstraint setIdentifier:](v53, "setIdentifier:", CFSTR("bottomContainer.leading"));
      -[TUIEmojiSearchView bottomAnchor](self, "bottomAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_bottomHalfContainerView, "bottomAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "constraintEqualToAnchor:constant:", v55, 0.0);
      v56 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

      -[NSLayoutConstraint setIdentifier:](v56, "setIdentifier:", CFSTR("bottomContainer.bottom"));
      -[TUIEmojiSearchView leadingAnchor](self, "leadingAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self->_bottomHalfContainerView, "leadingAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "constraintEqualToAnchor:constant:", v58, 0.0);
      v59 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

      -[NSLayoutConstraint setIdentifier:](v59, "setIdentifier:", CFSTR("bottomContainer.trailing"));
      -[UIView widthAnchor](self->_bottomHalfContainerView, "widthAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView widthAnchor](self->_searchTextFieldContainerView, "widthAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "constraintEqualToAnchor:multiplier:", v61, 2.0);
      v62 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

      -[NSLayoutConstraint setIdentifier:](v62, "setIdentifier:", CFSTR("searchToResults.width"));
      v102 = self->_searchFieldToTop;
      v63 = &v102;
    }
    else
    {
      -[UIView leadingAnchor](searchTextFieldContainerView, "leadingAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIEmojiSearchView leadingAnchor](self, "leadingAnchor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "constraintEqualToAnchor:constant:", v65, 0.0);
      v66 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      p_searchFieldLeading = &self->_searchFieldLeading;
      v67 = self->_searchFieldLeading;
      self->_searchFieldLeading = v66;

      LODWORD(v68) = 1148829696;
      -[NSLayoutConstraint setPriority:](self->_searchFieldLeading, "setPriority:", v68);
      -[NSLayoutConstraint setIdentifier:](self->_searchFieldLeading, "setIdentifier:", CFSTR("searchField.leading"));
      -[TUIEmojiSearchView bottomAnchor](self, "bottomAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_searchTextFieldContainerView, "bottomAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "constraintEqualToAnchor:constant:", v70, 0.0);
      v71 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

      v98 = v71;
      -[NSLayoutConstraint setIdentifier:](v71, "setIdentifier:", CFSTR("searchField.bottom"));
      -[UIView topAnchor](self->_bottomHalfContainerView, "topAnchor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self->_searchTextFieldContainerView, "topAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "constraintEqualToAnchor:", v73);
      v50 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

      -[NSLayoutConstraint setIdentifier:](v50, "setIdentifier:", CFSTR("bottomContainer.top"));
      -[UIView leadingAnchor](self->_bottomHalfContainerView, "leadingAnchor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_searchTextFieldContainerView, "trailingAnchor");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "constraintEqualToAnchor:constant:", v75, 8.0);
      v53 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

      -[NSLayoutConstraint setIdentifier:](v53, "setIdentifier:", CFSTR("bottomContainer.leading"));
      -[TUIEmojiSearchView bottomAnchor](self, "bottomAnchor");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_bottomHalfContainerView, "bottomAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "constraintEqualToAnchor:constant:", v77, 0.0);
      v56 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

      -[NSLayoutConstraint setIdentifier:](v56, "setIdentifier:", CFSTR("bottomContainer.bottom"));
      -[TUIEmojiSearchView trailingAnchor](self, "trailingAnchor");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_bottomHalfContainerView, "trailingAnchor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "constraintEqualToAnchor:constant:", v79, 0.0);
      v59 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

      -[NSLayoutConstraint setIdentifier:](v59, "setIdentifier:", CFSTR("bottomContainer.trailing"));
      -[UIView widthAnchor](self->_bottomHalfContainerView, "widthAnchor");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView widthAnchor](self->_searchTextFieldContainerView, "widthAnchor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "constraintEqualToAnchor:multiplier:", v81, 2.0);
      v62 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

      -[NSLayoutConstraint setIdentifier:](v62, "setIdentifier:", CFSTR("searchToResults.width"));
      v101 = self->_searchFieldToTop;
      v63 = &v101;
    }
    v82 = *p_searchFieldLeading;
    v63[1] = v98;
    v63[2] = v82;
    v63[3] = v50;
    v63[4] = v56;
    v63[5] = v53;
    v63[6] = v59;
    v63[7] = v62;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
    v83 = (NSArray *)objc_claimAutoreleasedReturnValue();
    sideBySideViewConstraints = self->_sideBySideViewConstraints;
    self->_sideBySideViewConstraints = v83;

    v35 = v99;
  }
  if (!self->_resultsCollectionWrapperConstraints)
    -[TUIEmojiSearchView _createResultsViewConstraints](self, "_createResultsViewConstraints");
  if (!self->_predictionWrapperConstraints)
    -[TUIEmojiSearchView _createPredictionViewConstraints](self, "_createPredictionViewConstraints");
  if (!self->_buttonConstaintNoButton)
    -[TUIEmojiSearchView _createSearchTextFieldAndButtonConstraints](self, "_createSearchTextFieldAndButtonConstraints");
  if (self->_useHorizontalLayout)
  {
    -[NSArray firstObject](self->_sideBySideViewConstraints, "firstObject");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v85, "isActive");

    if ((v86 & 1) == 0)
      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_sideBySideViewConstraints);
    -[NSLayoutConstraint setConstant:](self->_searchFieldToTop, "setConstant:", 12.0);
    objc_msgSend(MEMORY[0x1E0DC3938], "keyplanePadding");
    -[TUIEmojiSearchView updateInsetsIfNeeded:](self, "updateInsetsIfNeeded:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "currentInputMode");
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v88, "softwareLayout");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v89, "containsString:", CFSTR("HWR")) & 1) != 0)
    {
      -[TUIEmojiSearchView traitCollection](self, "traitCollection");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = objc_msgSend(v90, "horizontalSizeClass");

      if (v91 == 1)
        v92 = 0.0;
      else
        v92 = 4.0;
    }
    else
    {

      v92 = 4.0;
    }
    -[NSArray firstObject](self->_textFieldOnTopConstraints, "firstObject");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v93, "isActive");

    if ((v94 & 1) == 0)
      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_textFieldOnTopConstraints);
    v95 = 2.0;
    if (v35 != 1)
      v95 = 10.0;
    -[NSLayoutConstraint setConstant:](self->_searchFieldToTop, "setConstant:", v95);
    v96 = -[TUIEmojiSearchView isCollapsed](self, "isCollapsed");
    v97 = 0.0;
    if (!v96)
      v97 = v92;
    -[NSLayoutConstraint setConstant:](self->_topToBottomPadding, "setConstant:", v97);

  }
  -[TUIEmojiSearchView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)updateInsetsIfNeeded:(UIEdgeInsets)a3
{
  double right;
  double left;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;

  if (self->_useHorizontalLayout)
  {
    right = a3.right;
    left = a3.left;
    if (self->_previousInsets != a3.left + a3.right)
    {
      self->_previousInsets = a3.left + a3.right;
      -[TUIEmojiSearchView traitCollection](self, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "layoutDirection") == 1)
        left = right;

      if (left == 0.0)
        v7 = 4.0;
      else
        v7 = 3.5;
      if (left > 12.5)
        left = 12.5;
      v8 = 1.0;
      if (TUIRemoteEmojiSearchViewControllerEnabled())
      {
        -[TUIEmojiSearchView traitCollection](self, "traitCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "userInterfaceIdiom");

        if (v10 == 1)
          v8 = -1.0;
        else
          v8 = 1.0;
      }
      -[NSLayoutConstraint setConstant:](self->_searchFieldLeading, "setConstant:", (left + v7) * v8);
      -[TUIEmojiSearchView layoutIfNeeded](self, "layoutIfNeeded");
    }
  }
}

- (void)_createResultsViewConstraints
{
  UIView *v3;
  UIView *resultsCollectionContainerView;
  NSArray *resultsCollectionWrapperConstraints;
  void *v6;
  int v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  id v11;

  -[UIView superview](self->_resultsCollectionView, "superview");
  v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  resultsCollectionContainerView = self->_resultsCollectionContainerView;

  if (v3 == resultsCollectionContainerView)
  {
    resultsCollectionWrapperConstraints = self->_resultsCollectionWrapperConstraints;
    if (resultsCollectionWrapperConstraints)
    {
      -[NSArray firstObject](resultsCollectionWrapperConstraints, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isActive");

      if (v7)
        objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_resultsCollectionWrapperConstraints);
    }
    -[TUIEmojiSearchView _constraintsFromView:toContainerView:insets:identifier:](self, "_constraintsFromView:toContainerView:insets:identifier:", self->_resultsCollectionView, self->_resultsCollectionContainerView, CFSTR("resultsCollection"), *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiSearchView _constraintsFromView:toContainerView:insets:identifier:](self, "_constraintsFromView:toContainerView:insets:identifier:", self->_resultsCollectionContainerView, self->_bottomHalfContainerView, CFSTR("resultsContainer"), -1.0, 0.0, -1.0, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v8);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_resultsCollectionWrapperConstraints;
    self->_resultsCollectionWrapperConstraints = v9;

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_resultsCollectionWrapperConstraints);
  }
}

- (void)_createPredictionViewConstraints
{
  UIView *v3;
  UIView *predictionViewWrapperView;
  UILayoutGuide *v5;
  UILayoutGuide *predictionViewGuide;
  void *v7;
  void *v8;
  void *v9;
  double v10;
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
  NSLayoutConstraint *v21;
  NSLayoutConstraint *predictionWrapperTop;
  void *v23;
  void *v24;
  NSLayoutConstraint *v25;
  NSLayoutConstraint *predictionWrapperLeading;
  void *v27;
  void *v28;
  NSLayoutConstraint *v29;
  NSLayoutConstraint *predictionWrapperBottom;
  void *v31;
  void *v32;
  void *v33;
  NSLayoutConstraint *v34;
  void *v35;
  NSArray *v36;
  NSArray *predictionWrapperConstraints;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  _QWORD v42[5];

  v42[4] = *MEMORY[0x1E0C80C00];
  -[UIView superview](self->_predictionView, "superview");
  v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  predictionViewWrapperView = self->_predictionViewWrapperView;

  if (v3 == predictionViewWrapperView)
  {
    if (!self->_predictionViewGuide)
    {
      v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
      predictionViewGuide = self->_predictionViewGuide;
      self->_predictionViewGuide = v5;

      -[UILayoutGuide setIdentifier:](self->_predictionViewGuide, "setIdentifier:", CFSTR("predictionViewGuide"));
      -[UIView addLayoutGuide:](self->_predictionViewWrapperView, "addLayoutGuide:", self->_predictionViewGuide);
    }
    -[UIView trailingAnchor](self->_predictionViewWrapperView, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self->_predictionViewGuide, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 6.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v10) = 1148829696;
    objc_msgSend(v9, "setPriority:", v10);
    -[UILayoutGuide leadingAnchor](self->_predictionViewGuide, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_predictionViewWrapperView, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v12;
    -[UILayoutGuide topAnchor](self->_predictionViewGuide, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_predictionViewWrapperView, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v15;
    v42[2] = v9;
    v40 = v9;
    -[UIView bottomAnchor](self->_predictionViewWrapperView, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self->_predictionViewGuide, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (!self->_predictionWrapperTop)
    {
      -[UIView topAnchor](self->_predictionViewWrapperView, "topAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self->_bottomHalfContainerView, "topAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 0.0);
      v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      predictionWrapperTop = self->_predictionWrapperTop;
      self->_predictionWrapperTop = v21;

      -[NSLayoutConstraint setIdentifier:](self->_predictionWrapperTop, "setIdentifier:", CFSTR("predictionViewWrapper.top"));
    }
    if (!self->_predictionWrapperLeading)
    {
      -[UIView leadingAnchor](self->_predictionViewWrapperView, "leadingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self->_bottomHalfContainerView, "leadingAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, 0.0);
      v25 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      predictionWrapperLeading = self->_predictionWrapperLeading;
      self->_predictionWrapperLeading = v25;

      -[NSLayoutConstraint setIdentifier:](self->_predictionWrapperLeading, "setIdentifier:", CFSTR("predictionViewWrapper.leading"));
    }
    if (!self->_predictionWrapperBottom)
    {
      -[UIView bottomAnchor](self->_bottomHalfContainerView, "bottomAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_predictionViewWrapperView, "bottomAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, 0.0);
      v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      predictionWrapperBottom = self->_predictionWrapperBottom;
      self->_predictionWrapperBottom = v29;

      -[NSLayoutConstraint setIdentifier:](self->_predictionWrapperBottom, "setIdentifier:", CFSTR("predictionViewWrapper.bottom"));
    }
    -[UIView trailingAnchor](self->_bottomHalfContainerView, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_predictionViewWrapperView, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "setIdentifier:", CFSTR("predictionViewWrapper.trailing"));
    v34 = self->_predictionWrapperLeading;
    v41[0] = self->_predictionWrapperTop;
    v41[1] = v34;
    v41[2] = self->_predictionWrapperBottom;
    v41[3] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "arrayByAddingObjectsFromArray:", v35);
    v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
    predictionWrapperConstraints = self->_predictionWrapperConstraints;
    self->_predictionWrapperConstraints = v36;

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_predictionWrapperConstraints);
  }
}

- (void)_createSearchTextFieldAndButtonConstraints
{
  void *v3;
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
  NSLayoutConstraint *buttonConstraintFirstButtonDisabled;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *buttonConstraintFirstButtonEnabled;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *buttonConstaintNoButton;
  void *v23;
  void *v24;
  NSLayoutConstraint *v25;
  NSLayoutConstraint *buttonConstraintOneButton;
  void *v27;
  void *v28;
  NSLayoutConstraint *v29;
  NSLayoutConstraint *buttonConstraintTwoButtons;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSLayoutConstraint *v40;
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
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
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
  _QWORD v85[17];
  _QWORD v86[5];

  v86[3] = *MEMORY[0x1E0C80C00];
  v80 = (void *)MEMORY[0x1E0CB3718];
  -[TUIEmojiSearchTextField topAnchor](self->_searchTextField, "topAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_searchTextFieldContainerView, "topAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v82);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v3;
  -[TUIEmojiSearchTextField bottomAnchor](self->_searchTextField, "bottomAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_searchTextFieldContainerView, "bottomAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v6;
  -[TUIEmojiSearchTextField leadingAnchor](self->_searchTextField, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_searchTextFieldContainerView, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v86[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "activateConstraints:", v10);

  if (TUIRemoteEmojiSearchViewControllerEnabled())
  {
    -[UIView trailingAnchor](self->_createButton, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiSearchTextField trailingAnchor](self->_searchTextField, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 0.0);
    v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    buttonConstraintFirstButtonDisabled = self->_buttonConstraintFirstButtonDisabled;
    self->_buttonConstraintFirstButtonDisabled = v13;

    -[UIView leadingAnchor](self->_createButton, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiSearchTextField trailingAnchor](self->_searchTextField, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 8.0);
    v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    buttonConstraintFirstButtonEnabled = self->_buttonConstraintFirstButtonEnabled;
    self->_buttonConstraintFirstButtonEnabled = v17;

    -[UIView leadingAnchor](self->_createButton, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_searchTextFieldContainerView, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    buttonConstaintNoButton = self->_buttonConstaintNoButton;
    self->_buttonConstaintNoButton = v21;

    -[UIView trailingAnchor](self->_createButton, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_searchTextFieldContainerView, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    buttonConstraintOneButton = self->_buttonConstraintOneButton;
    self->_buttonConstraintOneButton = v25;

    -[UIView trailingAnchor](self->_stickerButton, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_searchTextFieldContainerView, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    buttonConstraintTwoButtons = self->_buttonConstraintTwoButtons;
    self->_buttonConstraintTwoButtons = v29;

    v65 = (void *)MEMORY[0x1E0CB3718];
    -[UIView topAnchor](self->_createButton, "topAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_searchTextFieldContainerView, "topAnchor");
    v63 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v63);
    v66 = objc_claimAutoreleasedReturnValue();
    v85[0] = v66;
    -[UIView bottomAnchor](self->_createButton, "bottomAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_searchTextFieldContainerView, "bottomAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:", v81);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v85[1] = v79;
    -[UIView widthAnchor](self->_createButton, "widthAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](self->_createButton, "heightAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:", v77);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v85[2] = v76;
    -[UIView topAnchor](self->_stickerButton, "topAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_searchTextFieldContainerView, "topAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v74);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v85[3] = v73;
    -[UIView bottomAnchor](self->_stickerButton, "bottomAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_searchTextFieldContainerView, "bottomAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:", v71);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v85[4] = v70;
    -[UIView leadingAnchor](self->_stickerButton, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_createButton, "trailingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v67, 8.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v85[5] = v64;
    -[UIView widthAnchor](self->_stickerButton, "widthAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](self->_stickerButton, "heightAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v61);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v85[6] = v60;
    -[UIView topAnchor](self->_memojiButton, "topAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_searchTextFieldContainerView, "topAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v58);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v85[7] = v57;
    -[UIView bottomAnchor](self->_memojiButton, "bottomAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_searchTextFieldContainerView, "bottomAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v55);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v85[8] = v54;
    -[UIView leadingAnchor](self->_memojiButton, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_createButton, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, 8.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v85[9] = v51;
    -[UIView widthAnchor](self->_memojiButton, "widthAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](self->_memojiButton, "heightAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v85[10] = v48;
    -[UIView topAnchor](self->_animojiButton, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_searchTextFieldContainerView, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v85[11] = v45;
    -[UIView bottomAnchor](self->_animojiButton, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_searchTextFieldContainerView, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v85[12] = v33;
    -[UIView leadingAnchor](self->_animojiButton, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_createButton, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, 8.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v85[13] = v36;
    -[UIView widthAnchor](self->_animojiButton, "widthAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](self->_animojiButton, "heightAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = self->_buttonConstaintNoButton;
    v85[14] = v39;
    v85[15] = v40;
    v85[16] = self->_buttonConstraintFirstButtonDisabled;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 17);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "activateConstraints:", v41);

    v42 = (void *)v63;
    v43 = (void *)v66;

    v44 = v69;
  }
  else
  {
    -[TUIEmojiSearchTextField trailingAnchor](self->_searchTextField, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_searchTextFieldContainerView, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setActive:", 1);
  }

}

- (id)_constraintsFromView:(id)a3 toContainerView:(id)a4 insets:(UIEdgeInsets)a5 identifier:(id)a6
{
  double right;
  double bottom;
  double left;
  double top;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
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
  _QWORD v35[5];

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v35[4] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (!v14)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = objc_opt_class();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@:%p>-<%@:%p>"), v16, v13, objc_opt_class(), v12);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, top);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.top"), v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setIdentifier:", v20);

  objc_msgSend(v12, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, left);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.leading"), v14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setIdentifier:", v24);

  objc_msgSend(v13, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, bottom);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.bottom"), v14);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setIdentifier:", v28);

  objc_msgSend(v13, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, right);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.trailing"), v14);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setIdentifier:", v32);

  v35[0] = v19;
  v35[1] = v23;
  v35[2] = v27;
  v35[3] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (UIEdgeInsets)_handBiasedEdgeInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0DC49E8];
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "interfaceOrientation") - 1;

  if (v8 <= 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3978], "sharedPreferencesController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferencesActions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "handBias");

    if (v11)
    {
      -[TUIEmojiSearchView bounds](self, "bounds");
      v12 = *MEMORY[0x1E0DC5B40];
      v13 = CGRectGetWidth(v18) - v12;
      if (v11 == 2)
      {
        v6 = v13;
      }
      else if (v11 == 1)
      {
        v4 = v13;
      }
    }
  }
  v14 = v3;
  v15 = v4;
  v16 = v5;
  v17 = v6;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)_buttonConfigurationWillChange:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ButtonConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_buttonConfiguration = objc_msgSend(v5, "integerValue");

  -[TUIEmojiSearchView updateButtons](self, "updateButtons");
  -[UIView layoutIfNeeded](self->_searchTextFieldContainerView, "layoutIfNeeded");
}

- (void)_placeholderWillChange:(id)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  NSString *overridingPlaceholder;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Placeholder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  overridingPlaceholder = self->_overridingPlaceholder;
  self->_overridingPlaceholder = v6;

  -[TUIEmojiSearchView updatePlaceholder](self, "updatePlaceholder");
}

- (TUIEmojiSearchTextField)searchTextField
{
  return self->_searchTextField;
}

- (UIView)resultsCollectionView
{
  return self->_resultsCollectionView;
}

- (id)layoutInvalidationCallback
{
  return self->_layoutInvalidationCallback;
}

- (void)setLayoutInvalidationCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 688);
}

- (id)createButtonCallback
{
  return self->_createButtonCallback;
}

- (void)setCreateButtonCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 696);
}

- (id)createStickerFromPhotosButtonCallback
{
  return self->_createStickerFromPhotosButtonCallback;
}

- (void)setCreateStickerFromPhotosButtonCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 704);
}

- (id)presentAvatarEditorButtonCallback
{
  return self->_presentAvatarEditorButtonCallback;
}

- (void)setPresentAvatarEditorButtonCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 712);
}

- (UIView)predictionView
{
  return self->_predictionView;
}

- (BOOL)predictionViewVisible
{
  return self->_predictionViewVisible;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (BOOL)resultsViewVisible
{
  return self->_resultsViewVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionView, 0);
  objc_storeStrong(&self->_presentAvatarEditorButtonCallback, 0);
  objc_storeStrong(&self->_createStickerFromPhotosButtonCallback, 0);
  objc_storeStrong(&self->_createButtonCallback, 0);
  objc_storeStrong(&self->_layoutInvalidationCallback, 0);
  objc_storeStrong((id *)&self->_resultsCollectionView, 0);
  objc_storeStrong((id *)&self->_searchTextField, 0);
  objc_storeStrong((id *)&self->_overridingPlaceholder, 0);
  objc_storeStrong((id *)&self->_predictionWrapperBottom, 0);
  objc_storeStrong((id *)&self->_predictionWrapperTop, 0);
  objc_storeStrong((id *)&self->_predictionWrapperLeading, 0);
  objc_storeStrong((id *)&self->_predictionViewGuide, 0);
  objc_storeStrong((id *)&self->_topToBottomPadding, 0);
  objc_storeStrong((id *)&self->_searchFieldLeading, 0);
  objc_storeStrong((id *)&self->_searchFieldToTop, 0);
  objc_storeStrong((id *)&self->_predictionWrapperConstraints, 0);
  objc_storeStrong((id *)&self->_resultsCollectionWrapperConstraints, 0);
  objc_storeStrong((id *)&self->_textFieldOnTopConstraints, 0);
  objc_storeStrong((id *)&self->_sideBySideViewConstraints, 0);
  objc_storeStrong((id *)&self->_buttonConstraintTwoButtons, 0);
  objc_storeStrong((id *)&self->_buttonConstraintOneButton, 0);
  objc_storeStrong((id *)&self->_buttonConstaintNoButton, 0);
  objc_storeStrong((id *)&self->_buttonConstraintFirstButtonEnabled, 0);
  objc_storeStrong((id *)&self->_buttonConstraintFirstButtonDisabled, 0);
  objc_storeStrong((id *)&self->_animojiButton, 0);
  objc_storeStrong((id *)&self->_memojiButton, 0);
  objc_storeStrong((id *)&self->_stickerButton, 0);
  objc_storeStrong((id *)&self->_createButton, 0);
  objc_storeStrong((id *)&self->_createButtonVisualEffectView, 0);
  objc_storeStrong((id *)&self->_resultsCollectionContainerView, 0);
  objc_storeStrong((id *)&self->_predictionViewWrapperView, 0);
  objc_storeStrong((id *)&self->_bottomHalfContainerView, 0);
  objc_storeStrong((id *)&self->_searchTextFieldContainerView, 0);
  objc_storeStrong((id *)&self->_searchTextFieldPortal, 0);
}

void __56__TUIEmojiSearchView_setPredictionViewVisible_animated___block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  if (*(_BYTE *)(a1 + 48))
    v2 = 0.0;
  else
    v2 = 0.5;
  v3 = MEMORY[0x1E0C809B0];
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__TUIEmojiSearchView_setPredictionViewVisible_animated___block_invoke_2;
  v8[3] = &unk_1E24FC068;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v4, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v8, 0.0, 1.0);
  v5 = (void *)MEMORY[0x1E0DC3F10];
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __56__TUIEmojiSearchView_setPredictionViewVisible_animated___block_invoke_3;
  v6[3] = &unk_1E24FC068;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v5, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v6, v2, 1.0 - v2);

}

void __56__TUIEmojiSearchView_setPredictionViewVisible_animated___block_invoke_4(uint64_t a1, int a2)
{
  void *v3;
  void (**v4)(void);

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
    if (!*(_BYTE *)(a1 + 48))
      objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 40), "layoutInvalidationCallback");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "layoutInvalidationCallback");
      v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v4[2]();

    }
  }
}

uint64_t __56__TUIEmojiSearchView_setPredictionViewVisible_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __56__TUIEmojiSearchView_setPredictionViewVisible_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __39__TUIEmojiSearchView_updatePlaceholder__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePlaceholder");
}

uint64_t __57__TUIEmojiSearchView_setShouldCreateButtonGlow_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  CGAffineTransformMakeScale(&v8, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 472);
  v7 = v8;
  objc_msgSend(v2, "setTransform:", &v7);
  CGAffineTransformMakeScale(&v6, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  v5 = v6;
  return objc_msgSend(v3, "setTransform:", &v5);
}

uint64_t __57__TUIEmojiSearchView_setShouldCreateButtonGlow_animated___block_invoke_2(double *a1)
{
  double v2;
  uint64_t v3;
  double v4;
  _QWORD v6[5];
  _QWORD v7[5];

  v2 = a1[5];
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__TUIEmojiSearchView_setShouldCreateButtonGlow_animated___block_invoke_3;
  v7[3] = &unk_1E24FC068;
  *(double *)&v7[4] = a1[4];
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v7, v2);
  v4 = a1[6];
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __57__TUIEmojiSearchView_setShouldCreateButtonGlow_animated___block_invoke_4;
  v6[3] = &unk_1E24FC068;
  *(double *)&v6[4] = a1[4];
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v6, v4);
}

uint64_t __57__TUIEmojiSearchView_setShouldCreateButtonGlow_animated___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateGlowEffects");
}

uint64_t __57__TUIEmojiSearchView_setShouldCreateButtonGlow_animated___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[3];
  _OWORD v9[2];
  __int128 v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 472);
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v9[0] = *MEMORY[0x1E0C9BAA8];
  v6 = v9[0];
  v9[1] = v7;
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v5 = v10;
  objc_msgSend(v2, "setTransform:", v9);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  v8[0] = v6;
  v8[1] = v7;
  v8[2] = v5;
  return objc_msgSend(v3, "setTransform:", v8);
}

uint64_t __57__TUIEmojiSearchView_setShouldCreateButtonGlow_animated___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateGlowEffects");
}

void __32__TUIEmojiSearchView_addButtons__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void (**v4)(void);
  dispatch_time_t v5;
  _QWORD block[4];
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "createButtonCallback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(WeakRetained, "createButtonCallback");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    v5 = dispatch_time(0, 400000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__TUIEmojiSearchView_addButtons__block_invoke_2;
    block[3] = &unk_1E24FBCA0;
    objc_copyWeak(&v7, v1);
    dispatch_after(v5, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v7);
  }

}

void __32__TUIEmojiSearchView_addButtons__block_invoke_3(uint64_t a1)
{
  void *v1;
  void (**v2)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "createStickerFromPhotosButtonCallback");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "createStickerFromPhotosButtonCallback");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v2[2]();

  }
}

void __32__TUIEmojiSearchView_addButtons__block_invoke_4(uint64_t a1)
{
  void *v1;
  void (**v2)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentAvatarEditorButtonCallback");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "presentAvatarEditorButtonCallback");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v2[2]();

  }
}

void __32__TUIEmojiSearchView_addButtons__block_invoke_5(uint64_t a1)
{
  void *v1;
  void (**v2)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentAvatarEditorButtonCallback");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "presentAvatarEditorButtonCallback");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v2[2]();

  }
}

void __32__TUIEmojiSearchView_addButtons__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "searchTextField");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setText:", 0);

    WeakRetained = v3;
  }

}

+ (BOOL)gmsAvailability
{
  return +[TUIGenerativeModelsAvailability isAvailable](TUIGenerativeModelsAvailability, "isAvailable");
}

+ (BOOL)shouldShowGenmoji
{
  id v2;
  char v3;
  void *v4;

  v2 = a1;
  v3 = objc_msgSend(a1, "gmsAvailability");
  LOBYTE(v2) = objc_msgSend(v2, "shouldShowImages");
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInterfaceIdiom");

  return v3 & v2 & _os_feature_enabled_impl();
}

+ (BOOL)shouldShowImages
{
  uint64_t (*v2)(_QWORD);
  int v3;
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v2 = (uint64_t (*)(_QWORD))getMKBGetDeviceLockStateSymbolLoc_ptr;
  v19 = getMKBGetDeviceLockStateSymbolLoc_ptr;
  if (!getMKBGetDeviceLockStateSymbolLoc_ptr)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __getMKBGetDeviceLockStateSymbolLoc_block_invoke;
    v15[3] = &unk_1E24FBD38;
    v15[4] = &v16;
    __getMKBGetDeviceLockStateSymbolLoc_block_invoke((uint64_t)v15);
    v2 = (uint64_t (*)(_QWORD))v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (v2)
  {
    v3 = v2(0);
    v5 = v3 == 3 || v3 == 0;
    objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "canInsertAdaptiveImageGlyph");

    }
    else
    {
      v8 = 0;
    }

    objc_msgSend(MEMORY[0x1E0DC3950], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "memojiSettingEnabled");

    if (TUIRemoteEmojiSearchViewControllerEnabled())
    {
      objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_msgSend(v11, "canPasteImage") & v10 | v8) & v5;

    }
    else
    {
      LOBYTE(v12) = 0;
    }
    return v12;
  }
  else
  {
    dlerror();
    v14 = abort_report_np();
    return __getMKBGetDeviceLockStateSymbolLoc_block_invoke(v14);
  }
}

@end
