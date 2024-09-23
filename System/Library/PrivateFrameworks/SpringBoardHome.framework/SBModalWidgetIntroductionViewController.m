@implementation SBModalWidgetIntroductionViewController

- (void)appendDismissCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *dismissCompletions;
  id v10;

  v4 = a3;
  v10 = v4;
  if (!self->_dismissCompletions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    dismissCompletions = self->_dismissCompletions;
    self->_dismissCompletions = v8;

    v4 = v10;
    if (!v10)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    -[SBModalWidgetIntroductionViewController dismissCompletions](self, "dismissCompletions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v10, "copy");
    v7 = _Block_copy(v6);
    objc_msgSend(v5, "addObject:", v7);

    v4 = v10;
  }
LABEL_4:

}

- (void)setHomeScreenPreview:(id)a3
{
  objc_storeStrong((id *)&self->_homescreenPreview, a3);
  -[SBModalWidgetIntroductionViewController loadPreviewSnapshot](self, "loadPreviewSnapshot");
}

- (void)addContinueButton
{
  UIButton *v3;
  UIButton *continueButton;
  UIButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIButton *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *continueButtonTopAnchorConstraint;
  void *v19;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  if (!self->_continueButton)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
    continueButton = self->_continueButton;
    self->_continueButton = v3;

    -[UIButton _setContinuousCornerRadius:](self->_continueButton, "_setContinuousCornerRadius:", 14.0);
    -[UIButton setClipsToBounds:](self->_continueButton, "setClipsToBounds:", 1);
    v5 = self->_continueButton;
    SBHBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MODAL_WIDGET_DISCOVERABILITY_CONTINUE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v5, "setTitle:forState:", v7, 0);

    -[UIButton titleLabel](self->_continueButton, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 18.0, *MEMORY[0x1E0DC1448]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

    -[UIButton titleLabel](self->_continueButton, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 1);

    v11 = self->_continueButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v11, "setTitleColor:forState:", v12, 0);

    -[UIButton setAccessibilityIdentifier:](self->_continueButton, "setAccessibilityIdentifier:", CFSTR("SBWidgetIntroductionButton-Continue"));
    -[SBModalWidgetIntroductionViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", self->_continueButton);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_continueButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton topAnchor](self->_continueButton, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBModalWidgetIntroductionViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, 0.0);
    v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    continueButtonTopAnchorConstraint = self->_continueButtonTopAnchorConstraint;
    self->_continueButtonTopAnchorConstraint = v17;

    v31 = (void *)MEMORY[0x1E0CB3718];
    -[UIButton centerXAnchor](self->_continueButton, "centerXAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBModalWidgetIntroductionViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "centerXAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = self->_continueButtonTopAnchorConstraint;
    v33[0] = v21;
    v33[1] = v22;
    -[UIButton widthAnchor](self->_continueButton, "widthAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToConstant:", 300.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v24;
    -[UIButton heightAnchor](self->_continueButton, "heightAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToConstant:", 54.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "activateConstraints:", v27);

    -[UIButton addTarget:action:forControlEvents:](self->_continueButton, "addTarget:action:forControlEvents:", self, sel_continueButtonTapped_, 64);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v28);
    objc_msgSend(v29, "setUserInteractionEnabled:", 0);
    -[UIButton insertSubview:atIndex:](self->_continueButton, "insertSubview:atIndex:", v29, 0);
    objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v30 = SBHPinViewWithinView(self->_continueButton, v29);

  }
}

- (void)loadPreviewSnapshot
{
  UIView *v3;
  UIView *homescreenPreviewContainer;
  UIView *v5;
  void *v6;
  void *v7;
  UIView *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  UIImageView *v15;
  UIImageView *homescreenPreviewSnapshot;
  id v17;
  UIView *v18;
  UIView *onboardingWidgetPreviewsContainer;
  UIView *v20;
  void *v21;
  id v22;
  void *v23;
  UIView *v24;
  UIView *onboardingStaticWidgetPreview;
  void *v26;
  uint64_t v27;
  void *v28;
  UIView *v29;
  UIView *onboardingFallingWidgetPreviewMiddle;
  void *v31;
  void *v32;
  uint64_t v33;
  UIView *v34;
  UIView *onboardingFallingWidgetPreviewBottom;
  unint64_t v36;
  void *v37;
  void *v38;
  id *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;

  if (!self->_homescreenPreviewContainer)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    homescreenPreviewContainer = self->_homescreenPreviewContainer;
    self->_homescreenPreviewContainer = v3;

    v5 = self->_homescreenPreviewContainer;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[UIView _setContinuousCornerRadius:](self->_homescreenPreviewContainer, "_setContinuousCornerRadius:", 40.0);
    -[UIView setClipsToBounds:](self->_homescreenPreviewContainer, "setClipsToBounds:", 1);
    -[SBModalWidgetIntroductionViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_homescreenPreviewContainer);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_homescreenPreviewContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = self->_homescreenPreviewContainer;
    -[SBModalWidgetIntroductionViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = SBHPinViewWithinView(v8, v9);

  }
  -[SBModalWidgetIntroductionViewController homescreenPreview](self, "homescreenPreview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && !self->_homescreenPreviewSnapshot)
  {
    v12 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[SBModalWidgetIntroductionViewController homescreenPreview](self, "homescreenPreview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "snapshot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (UIImageView *)objc_msgSend(v12, "initWithImage:", v14);
    homescreenPreviewSnapshot = self->_homescreenPreviewSnapshot;
    self->_homescreenPreviewSnapshot = v15;

    -[UIImageView _setContinuousCornerRadius:](self->_homescreenPreviewSnapshot, "_setContinuousCornerRadius:", 40.0);
    -[UIImageView setClipsToBounds:](self->_homescreenPreviewSnapshot, "setClipsToBounds:", 1);
    -[UIView addSubview:](self->_homescreenPreviewContainer, "addSubview:", self->_homescreenPreviewSnapshot);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_homescreenPreviewSnapshot, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = SBHPinViewWithinView(self->_homescreenPreviewSnapshot, self->_homescreenPreviewContainer);
  }
  if (!self->_onboardingWidgetPreviewsContainer)
  {
    v18 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    onboardingWidgetPreviewsContainer = self->_onboardingWidgetPreviewsContainer;
    self->_onboardingWidgetPreviewsContainer = v18;

    v20 = self->_onboardingWidgetPreviewsContainer;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v20, "setBackgroundColor:", v21);

    -[UIView _setContinuousCornerRadius:](self->_onboardingWidgetPreviewsContainer, "_setContinuousCornerRadius:", 40.0);
    -[UIView addSubview:](self->_homescreenPreviewContainer, "addSubview:", self->_onboardingWidgetPreviewsContainer);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_onboardingWidgetPreviewsContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v22 = SBHPinViewWithinView(self->_onboardingWidgetPreviewsContainer, self->_homescreenPreviewContainer);
    -[SBModalWidgetIntroductionViewController onboardingStaticWidgetPreviews](self, "onboardingStaticWidgetPreviews");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (UIView *)objc_claimAutoreleasedReturnValue();
    onboardingStaticWidgetPreview = self->_onboardingStaticWidgetPreview;
    self->_onboardingStaticWidgetPreview = v24;

    -[UIView addSubview:](self->_onboardingWidgetPreviewsContainer, "addSubview:", self->_onboardingStaticWidgetPreview);
    -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviews](self, "onboardingFallingWidgetPreviews");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");

    if (v27)
    {
      if (v27 == 1)
      {
        -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviews](self, "onboardingFallingWidgetPreviews");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        v33 = 0;
        goto LABEL_12;
      }
      if (v27 == 2)
      {
        -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviews](self, "onboardingFallingWidgetPreviews");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
        v29 = (UIView *)objc_claimAutoreleasedReturnValue();
        onboardingFallingWidgetPreviewMiddle = self->_onboardingFallingWidgetPreviewMiddle;
        self->_onboardingFallingWidgetPreviewMiddle = v29;

        -[UIView insertSubview:atIndex:](self->_onboardingWidgetPreviewsContainer, "insertSubview:atIndex:", self->_onboardingFallingWidgetPreviewMiddle, 0);
        -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviews](self, "onboardingFallingWidgetPreviews");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        v33 = 1;
LABEL_12:
        objc_msgSend(v31, "objectAtIndexedSubscript:", v33);
        v34 = (UIView *)objc_claimAutoreleasedReturnValue();
        onboardingFallingWidgetPreviewBottom = self->_onboardingFallingWidgetPreviewBottom;
        self->_onboardingFallingWidgetPreviewBottom = v34;

        -[UIView insertSubview:atIndex:](self->_onboardingWidgetPreviewsContainer, "insertSubview:atIndex:", self->_onboardingFallingWidgetPreviewBottom, 0);
        goto LABEL_18;
      }
      v36 = 0;
      while (1)
      {
        -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviews](self, "onboardingFallingWidgetPreviews");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectAtIndexedSubscript:", v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36 > 2)
          break;
        v39 = (id *)((char *)&self->super.super.super.isa + *off_1E8D8BB50[v36]);
        objc_storeStrong(v39, v38);
        -[UIView insertSubview:atIndex:](self->_onboardingWidgetPreviewsContainer, "insertSubview:atIndex:", *v39, 0);

        if (v27 == ++v36)
          goto LABEL_18;
      }

    }
  }
LABEL_18:
  -[SBModalWidgetIntroductionViewController backgroundDescriptionView](self, "backgroundDescriptionView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[SBModalWidgetIntroductionViewController view](self, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBModalWidgetIntroductionViewController backgroundDescriptionView](self, "backgroundDescriptionView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "sendSubviewToBack:", v42);

  }
  -[SBModalWidgetIntroductionViewController continueButton](self, "continueButton");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    -[SBModalWidgetIntroductionViewController view](self, "view");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBModalWidgetIntroductionViewController continueButton](self, "continueButton");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "bringSubviewToFront:", v45);

  }
  -[SBModalWidgetIntroductionViewController view](self, "view");
  v46 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "layoutIfNeeded");

}

- (void)loadView
{
  SBModalWidgetIntroductionBackgroundDescriptionView *v3;
  void *v4;
  SBModalWidgetIntroductionBackgroundDescriptionView *v5;
  SBModalWidgetIntroductionBackgroundDescriptionView *backgroundDescriptionView;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBModalWidgetIntroductionViewController;
  -[SBModalWidgetIntroductionViewController loadView](&v8, sel_loadView);
  v3 = [SBModalWidgetIntroductionBackgroundDescriptionView alloc];
  -[SBModalWidgetIntroductionViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[SBModalWidgetIntroductionBackgroundDescriptionView initWithFrame:withOwner:](v3, "initWithFrame:withOwner:", self);
  backgroundDescriptionView = self->_backgroundDescriptionView;
  self->_backgroundDescriptionView = v5;

  -[SBModalWidgetIntroductionViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_backgroundDescriptionView);

  -[SBModalWidgetIntroductionViewController loadPreviewSnapshot](self, "loadPreviewSnapshot");
  -[SBModalWidgetIntroductionViewController addContinueButton](self, "addContinueButton");
}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
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
  double v35;
  double v36;
  double v37;
  double v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)SBModalWidgetIntroductionViewController;
  -[SBModalWidgetIntroductionViewController viewDidLayoutSubviews](&v39, sel_viewDidLayoutSubviews);
  -[SBModalWidgetIntroductionViewController onboardingStaticWidgetCenterPoint](self, "onboardingStaticWidgetCenterPoint");
  v35 = v4;
  v36 = v3;
  -[SBModalWidgetIntroductionViewController onboardingStaticWidgetBounds](self, "onboardingStaticWidgetBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBModalWidgetIntroductionViewController onboardingFallingWidgetCenterPoint](self, "onboardingFallingWidgetCenterPoint");
  v37 = v14;
  v38 = v13;
  -[SBModalWidgetIntroductionViewController onboardingFallingWidgetBounds](self, "onboardingFallingWidgetBounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[SBModalWidgetIntroductionViewController onboardingStaticWidgetPreview](self, "onboardingStaticWidgetPreview");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[SBModalWidgetIntroductionViewController onboardingStaticWidgetPreview](self, "onboardingStaticWidgetPreview");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBounds:", v6, v8, v10, v12);

    -[SBModalWidgetIntroductionViewController onboardingStaticWidgetPreview](self, "onboardingStaticWidgetPreview");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setCenter:", v36, v35);

  }
  -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewTop](self, "onboardingFallingWidgetPreviewTop");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewTop](self, "onboardingFallingWidgetPreviewTop");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBounds:", v16, v18, v20, v22);

    -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewTop](self, "onboardingFallingWidgetPreviewTop");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setCenter:", v38, v37);

  }
  -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewMiddle](self, "onboardingFallingWidgetPreviewMiddle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewMiddle](self, "onboardingFallingWidgetPreviewMiddle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBounds:", v16, v18, v20, v22);

    -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewMiddle](self, "onboardingFallingWidgetPreviewMiddle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCenter:", v38, v37);

  }
  -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewBottom](self, "onboardingFallingWidgetPreviewBottom");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewBottom](self, "onboardingFallingWidgetPreviewBottom");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setBounds:", v16, v18, v20, v22);

    -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewBottom](self, "onboardingFallingWidgetPreviewBottom");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setCenter:", v38, v37);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBModalWidgetIntroductionViewController;
  -[SBModalWidgetIntroductionViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SBModalWidgetIntroductionViewController cleanUpForViewControllerDismissal](self, "cleanUpForViewControllerDismissal");
}

- (void)setupSublayerDisplayPreviewTransformForView:(id)a3 withTransform:(CATransform3D *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CATransform3D v29;

  v5 = (void *)MEMORY[0x1E0CD2710];
  v6 = a3;
  objc_msgSend(v5, "animationWithKeyPath:", CFSTR("sublayerTransform"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeTranslation(&v29, 0.0, 0.0, 0.0);
  objc_msgSend(v8, "valueWithCATransform3D:", &v29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFromValue:", v9);

  v10 = *(_OWORD *)&a4->m33;
  v25 = *(_OWORD *)&a4->m31;
  v26 = v10;
  v11 = *(_OWORD *)&a4->m43;
  v27 = *(_OWORD *)&a4->m41;
  v28 = v11;
  v12 = *(_OWORD *)&a4->m13;
  v21 = *(_OWORD *)&a4->m11;
  v22 = v12;
  v13 = *(_OWORD *)&a4->m23;
  v23 = *(_OWORD *)&a4->m21;
  v24 = v13;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToValue:", v14);

  objc_msgSend(v6, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_OWORD *)&a4->m33;
  v25 = *(_OWORD *)&a4->m31;
  v26 = v16;
  v17 = *(_OWORD *)&a4->m43;
  v27 = *(_OWORD *)&a4->m41;
  v28 = v17;
  v18 = *(_OWORD *)&a4->m13;
  v21 = *(_OWORD *)&a4->m11;
  v22 = v18;
  v19 = *(_OWORD *)&a4->m23;
  v23 = *(_OWORD *)&a4->m21;
  v24 = v19;
  objc_msgSend(v15, "setSublayerTransform:", &v21);

  objc_msgSend(v6, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "addAnimation:forKey:", v7, CFSTR("sublayerTransform"));
}

- (void)setupSublayerDismissPreviewTransformForView:(id)a3 withTransform:(CATransform3D *)a4
{
  void *v5;
  id v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  v5 = (void *)MEMORY[0x1E0CD2710];
  v6 = a3;
  objc_msgSend(v5, "animationWithKeyPath:", CFSTR("sublayerTransform"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)&a4->m33;
  v28 = *(_OWORD *)&a4->m31;
  v29 = v8;
  v9 = *(_OWORD *)&a4->m43;
  v30 = *(_OWORD *)&a4->m41;
  v31 = v9;
  v10 = *(_OWORD *)&a4->m13;
  v24 = *(_OWORD *)&a4->m11;
  v25 = v10;
  v11 = *(_OWORD *)&a4->m23;
  v26 = *(_OWORD *)&a4->m21;
  v27 = v11;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFromValue:", v12);

  v23 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v28 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v22 = v28;
  v29 = v23;
  v21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v30 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v20 = v30;
  v31 = v21;
  v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v24 = *MEMORY[0x1E0CD2610];
  v18 = v24;
  v25 = v19;
  v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v26 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v16 = v26;
  v27 = v17;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToValue:", v13);

  objc_msgSend(v6, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v22;
  v29 = v23;
  v30 = v20;
  v31 = v21;
  v24 = v18;
  v25 = v19;
  v26 = v16;
  v27 = v17;
  objc_msgSend(v14, "setSublayerTransform:", &v24);

  objc_msgSend(v6, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addAnimation:forKey:", v7, CFSTR("sublayerTransform"));
}

- (void)cleanUpForViewControllerDismissal
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[SBModalWidgetIntroductionViewController dismissCompletions](self, "dismissCompletions");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[SBModalWidgetIntroductionViewController dismissCompletions](self, "dismissCompletions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      -[SBModalWidgetIntroductionViewController dismissCompletions](self, "dismissCompletions", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++) + 16))();
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v9);
      }

    }
  }
  -[SBModalWidgetIntroductionViewController dismissCompletions](self, "dismissCompletions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  -[SBModalWidgetIntroductionViewController setDismissCompletions:](self, "setDismissCompletions:", 0);
}

- (void)displayPreviewAndButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGFloat v7;
  CGFloat m34;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  CGFloat v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  CGFloat v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _QWORD v46[5];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  CGFloat v54;
  CATransform3D v55;
  CATransform3D v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  CGFloat m33;

  -[SBModalWidgetIntroductionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBModalWidgetIntroductionViewController backgroundDescriptionView](self, "backgroundDescriptionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendSubviewToBack:", v4);

  -[SBModalWidgetIntroductionViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBModalWidgetIntroductionViewController continueButton](self, "continueButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bringSubviewToFront:", v6);

  v39 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  *(_OWORD *)&v55.m21 = v41;
  *(_OWORD *)&v55.m23 = v39;
  v37 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&v55.m31 = v37;
  v7 = *(double *)(MEMORY[0x1E0CD2610] + 80);
  v33 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v35 = *MEMORY[0x1E0CD2610];
  *(_OWORD *)&v55.m11 = *MEMORY[0x1E0CD2610];
  *(_OWORD *)&v55.m13 = v33;
  v55.m33 = v7;
  v55.m34 = -0.00105263158;
  v29 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  *(_OWORD *)&v55.m41 = v31;
  *(_OWORD *)&v55.m43 = v29;
  CATransform3DTranslate(&v56, &v55, 0.0, 300.0, 0.0);
  v61 = *(_OWORD *)&v56.m21;
  v62 = *(_OWORD *)&v56.m23;
  v63 = *(_OWORD *)&v56.m31;
  m33 = v56.m33;
  v59 = *(_OWORD *)&v56.m11;
  v60 = *(_OWORD *)&v56.m13;
  v57 = *(_OWORD *)&v56.m41;
  v58 = *(_OWORD *)&v56.m43;
  v55 = v56;
  CATransform3DRotate(&v56, &v55, 0.698131701, 1.0, 0.0, 0.0);
  v61 = *(_OWORD *)&v56.m21;
  v62 = *(_OWORD *)&v56.m23;
  v63 = *(_OWORD *)&v56.m31;
  m33 = v56.m33;
  v59 = *(_OWORD *)&v56.m11;
  v60 = *(_OWORD *)&v56.m13;
  m34 = v56.m34;
  v57 = *(_OWORD *)&v56.m41;
  v58 = *(_OWORD *)&v56.m43;
  v9 = *(_OWORD *)&v56.m23;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m21 = *(_OWORD *)&v56.m21;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m23 = v9;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m31 = v63;
  self->_homeScreenPreviewSublayerTransform.m33 = m33;
  v10 = v60;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m11 = v59;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m13 = v10;
  self->_homeScreenPreviewSublayerTransform.m34 = m34;
  v11 = v58;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m41 = v57;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m43 = v11;
  -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewTop](self, "onboardingFallingWidgetPreviewTop");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    *(_OWORD *)&v55.m21 = v41;
    *(_OWORD *)&v55.m23 = v39;
    *(_OWORD *)&v55.m31 = v37;
    *(_OWORD *)&v55.m11 = v35;
    *(_OWORD *)&v55.m13 = v33;
    v55.m33 = v7;
    v55.m34 = -0.00125;
    *(_OWORD *)&v55.m41 = v31;
    *(_OWORD *)&v55.m43 = v29;
    CATransform3DTranslate(&v56, &v55, 10.0, -200.0, 0.0);
    v55 = v56;
    CATransform3DRotate(&v56, &v55, 0.523598776, -0.800000012, -0.800000012, 0.800000012);
    v55 = v56;
    CATransform3DScale(&v56, &v55, 1.14999998, 1.14999998, 1.0);
    v51 = *(_OWORD *)&v56.m21;
    v52 = *(_OWORD *)&v56.m23;
    v53 = *(_OWORD *)&v56.m31;
    v54 = v56.m33;
    v49 = *(_OWORD *)&v56.m11;
    v50 = *(_OWORD *)&v56.m13;
    v13 = v56.m34;
    v47 = *(_OWORD *)&v56.m41;
    v48 = *(_OWORD *)&v56.m43;
    v14 = *(_OWORD *)&v56.m23;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m21 = *(_OWORD *)&v56.m21;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m23 = v14;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m31 = v53;
    self->_onboardingFallingWidgetPreviewSublayerTransformTop.m33 = v54;
    v15 = v50;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m11 = v49;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m13 = v15;
    self->_onboardingFallingWidgetPreviewSublayerTransformTop.m34 = v13;
    v16 = v48;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m41 = v47;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m43 = v16;
  }
  -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewMiddle](self, "onboardingFallingWidgetPreviewMiddle", v29, v31, v33, v35, v37, v39, v41);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    *(_OWORD *)&v55.m21 = v42;
    *(_OWORD *)&v55.m23 = v40;
    *(_OWORD *)&v55.m31 = v38;
    *(_OWORD *)&v55.m11 = v36;
    *(_OWORD *)&v55.m13 = v34;
    v55.m33 = v7;
    v55.m34 = -0.00125;
    *(_OWORD *)&v55.m41 = v32;
    *(_OWORD *)&v55.m43 = v30;
    CATransform3DTranslate(&v56, &v55, -10.0, -80.0, 0.0);
    v55 = v56;
    CATransform3DRotate(&v56, &v55, 0.523598776, -1.0, -0.800000012, 0.0);
    v55 = v56;
    CATransform3DScale(&v56, &v55, 1.10000002, 1.10000002, 1.0);
    v51 = *(_OWORD *)&v56.m21;
    v52 = *(_OWORD *)&v56.m23;
    v53 = *(_OWORD *)&v56.m31;
    v54 = v56.m33;
    v49 = *(_OWORD *)&v56.m11;
    v50 = *(_OWORD *)&v56.m13;
    v18 = v56.m34;
    v47 = *(_OWORD *)&v56.m41;
    v48 = *(_OWORD *)&v56.m43;
    v19 = *(_OWORD *)&v56.m23;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m21 = *(_OWORD *)&v56.m21;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m23 = v19;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m31 = v53;
    self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m33 = v54;
    v20 = v50;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m11 = v49;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m13 = v20;
    self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m34 = v18;
    v21 = v48;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m41 = v47;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m43 = v21;
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 1.0);
  v22 = (void *)MEMORY[0x1E0CD28B0];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAnimationTimingFunction:", v23);

  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __66__SBModalWidgetIntroductionViewController_displayPreviewAndButton__block_invoke;
  v46[3] = &unk_1E8D84C50;
  v46[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 1, v46, 0, 1.0, 0.0);
  -[SBModalWidgetIntroductionViewController homescreenPreviewContainer](self, "homescreenPreviewContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBModalWidgetIntroductionViewController homeScreenPreviewSublayerTransform](self, "homeScreenPreviewSublayerTransform");
  -[SBModalWidgetIntroductionViewController setupSublayerDisplayPreviewTransformForView:withTransform:](self, "setupSublayerDisplayPreviewTransformForView:withTransform:", v24, v45);

  -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewTop](self, "onboardingFallingWidgetPreviewTop");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewTop](self, "onboardingFallingWidgetPreviewTop");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewSublayerTransformTop](self, "onboardingFallingWidgetPreviewSublayerTransformTop");
    -[SBModalWidgetIntroductionViewController setupSublayerDisplayPreviewTransformForView:withTransform:](self, "setupSublayerDisplayPreviewTransformForView:withTransform:", v26, v44);

  }
  -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewMiddle](self, "onboardingFallingWidgetPreviewMiddle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewMiddle](self, "onboardingFallingWidgetPreviewMiddle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewSublayerTransformMiddle](self, "onboardingFallingWidgetPreviewSublayerTransformMiddle");
    -[SBModalWidgetIntroductionViewController setupSublayerDisplayPreviewTransformForView:withTransform:](self, "setupSublayerDisplayPreviewTransformForView:withTransform:", v28, v43);

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

void __66__SBModalWidgetIntroductionViewController_displayPreviewAndButton__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "continueButtonTopAnchorConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConstant:", -150.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)dismissPreviewAndButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BYTE v16[128];
  _BYTE v17[128];
  _QWORD v18[5];
  _QWORD v19[5];

  -[SBModalWidgetIntroductionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBModalWidgetIntroductionViewController backgroundDescriptionView](self, "backgroundDescriptionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendSubviewToBack:", v4);

  -[SBModalWidgetIntroductionViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBModalWidgetIntroductionViewController continueButton](self, "continueButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bringSubviewToFront:", v6);

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 1.0);
  v7 = (void *)MEMORY[0x1E0CD28B0];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAnimationTimingFunction:", v8);

  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__SBModalWidgetIntroductionViewController_dismissPreviewAndButton__block_invoke;
  v19[3] = &unk_1E8D84C50;
  v19[4] = self;
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v19);
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __66__SBModalWidgetIntroductionViewController_dismissPreviewAndButton__block_invoke_2;
  v18[3] = &unk_1E8D84C50;
  v18[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 1, v18, 0, 1.0, 0.0);
  -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewMiddle](self, "onboardingFallingWidgetPreviewMiddle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewMiddle](self, "onboardingFallingWidgetPreviewMiddle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewSublayerTransformMiddle](self, "onboardingFallingWidgetPreviewSublayerTransformMiddle");
    -[SBModalWidgetIntroductionViewController setupSublayerDismissPreviewTransformForView:withTransform:](self, "setupSublayerDismissPreviewTransformForView:withTransform:", v11, v17);

  }
  -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewTop](self, "onboardingFallingWidgetPreviewTop");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewTop](self, "onboardingFallingWidgetPreviewTop");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBModalWidgetIntroductionViewController onboardingFallingWidgetPreviewSublayerTransformTop](self, "onboardingFallingWidgetPreviewSublayerTransformTop");
    -[SBModalWidgetIntroductionViewController setupSublayerDismissPreviewTransformForView:withTransform:](self, "setupSublayerDismissPreviewTransformForView:withTransform:", v13, v16);

  }
  -[SBModalWidgetIntroductionViewController homescreenPreviewContainer](self, "homescreenPreviewContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBModalWidgetIntroductionViewController homeScreenPreviewSublayerTransform](self, "homeScreenPreviewSublayerTransform");
  -[SBModalWidgetIntroductionViewController setupSublayerDismissPreviewTransformForView:withTransform:](self, "setupSublayerDismissPreviewTransformForView:withTransform:", v14, &v15);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

uint64_t __66__SBModalWidgetIntroductionViewController_dismissPreviewAndButton__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 0, 0);

  return objc_msgSend(*(id *)(a1 + 32), "cleanUpForViewControllerDismissal");
}

void __66__SBModalWidgetIntroductionViewController_dismissPreviewAndButton__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "continueButtonTopAnchorConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConstant:", 150.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (NSArray)onboardingFallingWidgetPreviews
{
  return self->_onboardingFallingWidgetPreviews;
}

- (void)setOnboardingFallingWidgetPreviews:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingFallingWidgetPreviews, a3);
}

- (CGPoint)onboardingFallingWidgetCenterPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_onboardingFallingWidgetCenterPoint.x;
  y = self->_onboardingFallingWidgetCenterPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOnboardingFallingWidgetCenterPoint:(CGPoint)a3
{
  self->_onboardingFallingWidgetCenterPoint = a3;
}

- (CGRect)onboardingFallingWidgetBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_onboardingFallingWidgetBounds.origin.x;
  y = self->_onboardingFallingWidgetBounds.origin.y;
  width = self->_onboardingFallingWidgetBounds.size.width;
  height = self->_onboardingFallingWidgetBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOnboardingFallingWidgetBounds:(CGRect)a3
{
  self->_onboardingFallingWidgetBounds = a3;
}

- (NSArray)onboardingStaticWidgetPreviews
{
  return self->_onboardingStaticWidgetPreviews;
}

- (void)setOnboardingStaticWidgetPreviews:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingStaticWidgetPreviews, a3);
}

- (CGPoint)onboardingStaticWidgetCenterPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_onboardingStaticWidgetCenterPoint.x;
  y = self->_onboardingStaticWidgetCenterPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOnboardingStaticWidgetCenterPoint:(CGPoint)a3
{
  self->_onboardingStaticWidgetCenterPoint = a3;
}

- (CGRect)onboardingStaticWidgetBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_onboardingStaticWidgetBounds.origin.x;
  y = self->_onboardingStaticWidgetBounds.origin.y;
  width = self->_onboardingStaticWidgetBounds.size.width;
  height = self->_onboardingStaticWidgetBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOnboardingStaticWidgetBounds:(CGRect)a3
{
  self->_onboardingStaticWidgetBounds = a3;
}

- (NSMutableArray)dismissCompletions
{
  return self->_dismissCompletions;
}

- (void)setDismissCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_dismissCompletions, a3);
}

- (SBModalWidgetIntroductionBackgroundDescriptionView)backgroundDescriptionView
{
  return self->_backgroundDescriptionView;
}

- (void)setBackgroundDescriptionView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundDescriptionView, a3);
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (NSLayoutConstraint)continueButtonTopAnchorConstraint
{
  return self->_continueButtonTopAnchorConstraint;
}

- (void)setContinueButtonTopAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_continueButtonTopAnchorConstraint, a3);
}

- (UIView)homescreenPreviewContainer
{
  return self->_homescreenPreviewContainer;
}

- (void)setHomescreenPreviewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_homescreenPreviewContainer, a3);
}

- (UIImageView)homescreenPreviewSnapshot
{
  return self->_homescreenPreviewSnapshot;
}

- (void)setHomescreenPreviewSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_homescreenPreviewSnapshot, a3);
}

- (UIView)onboardingWidgetPreviewsContainer
{
  return self->_onboardingWidgetPreviewsContainer;
}

- (void)setOnboardingWidgetPreviewsContainer:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingWidgetPreviewsContainer, a3);
}

- (UIView)onboardingStaticWidgetPreview
{
  return self->_onboardingStaticWidgetPreview;
}

- (void)setOnboardingStaticWidgetPreview:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingStaticWidgetPreview, a3);
}

- (UIView)onboardingFallingWidgetPreviewTop
{
  return self->_onboardingFallingWidgetPreviewTop;
}

- (void)setOnboardingFallingWidgetPreviewTop:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingFallingWidgetPreviewTop, a3);
}

- (UIView)onboardingFallingWidgetPreviewMiddle
{
  return self->_onboardingFallingWidgetPreviewMiddle;
}

- (void)setOnboardingFallingWidgetPreviewMiddle:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingFallingWidgetPreviewMiddle, a3);
}

- (UIView)onboardingFallingWidgetPreviewBottom
{
  return self->_onboardingFallingWidgetPreviewBottom;
}

- (void)setOnboardingFallingWidgetPreviewBottom:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingFallingWidgetPreviewBottom, a3);
}

- (SBModalWidgetIntroductionHomeScreenPreview)homescreenPreview
{
  return self->_homescreenPreview;
}

- (void)setHomescreenPreview:(id)a3
{
  objc_storeStrong((id *)&self->_homescreenPreview, a3);
}

- (CATransform3D)homeScreenPreviewSublayerTransform
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[9].m42;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[9].m34;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self[10].m12;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[9].m44;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self[9].m22;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[9].m14;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self[9].m32;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[9].m24;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setHomeScreenPreviewSublayerTransform:(CATransform3D *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&a3->m23;
  v5 = *(_OWORD *)&a3->m11;
  v4 = *(_OWORD *)&a3->m13;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m23 = v3;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m11 = v5;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m13 = v4;
  v6 = *(_OWORD *)&a3->m43;
  v8 = *(_OWORD *)&a3->m31;
  v7 = *(_OWORD *)&a3->m33;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m43 = v6;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m31 = v8;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m33 = v7;
}

- (CATransform3D)onboardingFallingWidgetPreviewSublayerTransformTop
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[10].m42;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[10].m34;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self[11].m12;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[10].m44;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self[10].m22;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[10].m14;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self[10].m32;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[10].m24;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setOnboardingFallingWidgetPreviewSublayerTransformTop:(CATransform3D *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&a3->m23;
  v5 = *(_OWORD *)&a3->m11;
  v4 = *(_OWORD *)&a3->m13;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m23 = v3;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m11 = v5;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m13 = v4;
  v6 = *(_OWORD *)&a3->m43;
  v8 = *(_OWORD *)&a3->m31;
  v7 = *(_OWORD *)&a3->m33;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m43 = v6;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m31 = v8;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m33 = v7;
}

- (CATransform3D)onboardingFallingWidgetPreviewSublayerTransformMiddle
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[11].m42;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[11].m34;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self[12].m12;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[11].m44;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self[11].m22;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[11].m14;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self[11].m32;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[11].m24;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setOnboardingFallingWidgetPreviewSublayerTransformMiddle:(CATransform3D *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&a3->m23;
  v5 = *(_OWORD *)&a3->m11;
  v4 = *(_OWORD *)&a3->m13;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m23 = v3;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m11 = v5;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m13 = v4;
  v6 = *(_OWORD *)&a3->m43;
  v8 = *(_OWORD *)&a3->m31;
  v7 = *(_OWORD *)&a3->m33;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m43 = v6;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m31 = v8;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m33 = v7;
}

- (CATransform3D)onboardingFallingWidgetPreviewSublayerTransformBottom
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[12].m42;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[12].m34;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self[13].m12;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[12].m44;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self[12].m22;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[12].m14;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self[12].m32;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[12].m24;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setOnboardingFallingWidgetPreviewSublayerTransformBottom:(CATransform3D *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&a3->m23;
  v5 = *(_OWORD *)&a3->m11;
  v4 = *(_OWORD *)&a3->m13;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformBottom.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformBottom.m23 = v3;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformBottom.m11 = v5;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformBottom.m13 = v4;
  v6 = *(_OWORD *)&a3->m43;
  v8 = *(_OWORD *)&a3->m31;
  v7 = *(_OWORD *)&a3->m33;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformBottom.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformBottom.m43 = v6;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformBottom.m31 = v8;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformBottom.m33 = v7;
}

- (CATransform3D)appliedSublayerTransform
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[13].m42;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[13].m34;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self[14].m12;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[13].m44;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self[13].m22;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[13].m14;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self[13].m32;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[13].m24;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setAppliedSublayerTransform:(CATransform3D *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&a3->m23;
  v5 = *(_OWORD *)&a3->m11;
  v4 = *(_OWORD *)&a3->m13;
  *(_OWORD *)&self->_appliedSublayerTransform.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_appliedSublayerTransform.m23 = v3;
  *(_OWORD *)&self->_appliedSublayerTransform.m11 = v5;
  *(_OWORD *)&self->_appliedSublayerTransform.m13 = v4;
  v6 = *(_OWORD *)&a3->m43;
  v8 = *(_OWORD *)&a3->m31;
  v7 = *(_OWORD *)&a3->m33;
  *(_OWORD *)&self->_appliedSublayerTransform.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_appliedSublayerTransform.m43 = v6;
  *(_OWORD *)&self->_appliedSublayerTransform.m31 = v8;
  *(_OWORD *)&self->_appliedSublayerTransform.m33 = v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homescreenPreview, 0);
  objc_storeStrong((id *)&self->_onboardingFallingWidgetPreviewBottom, 0);
  objc_storeStrong((id *)&self->_onboardingFallingWidgetPreviewMiddle, 0);
  objc_storeStrong((id *)&self->_onboardingFallingWidgetPreviewTop, 0);
  objc_storeStrong((id *)&self->_onboardingStaticWidgetPreview, 0);
  objc_storeStrong((id *)&self->_onboardingWidgetPreviewsContainer, 0);
  objc_storeStrong((id *)&self->_homescreenPreviewSnapshot, 0);
  objc_storeStrong((id *)&self->_homescreenPreviewContainer, 0);
  objc_storeStrong((id *)&self->_continueButtonTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_backgroundDescriptionView, 0);
  objc_storeStrong((id *)&self->_dismissCompletions, 0);
  objc_storeStrong((id *)&self->_onboardingStaticWidgetPreviews, 0);
  objc_storeStrong((id *)&self->_onboardingFallingWidgetPreviews, 0);
}

@end
