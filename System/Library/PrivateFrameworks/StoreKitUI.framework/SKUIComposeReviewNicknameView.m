@implementation SKUIComposeReviewNicknameView

- (SKUIComposeReviewNicknameView)initWithFrame:(CGRect)a3
{
  SKUIComposeReviewNicknameView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKUIComposeReviewNicknameView;
  v3 = -[SKUIComposeReviewNicknameView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIComposeReviewNicknameView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[SKUIComposeReviewNicknameView _setupView](v3, "_setupView");
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
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
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SKUIComposeReviewNicknameView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    -[SKUIComposeReviewNicknameView titleView](self, "titleView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIFontLimitedPreferredFontForTextStyle(15, 7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

    -[SKUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIFontLimitedPreferredFontForTextStyle(3, 7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v11);

    -[SKUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIFontLimitedPreferredFontForTextStyle(1, 7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v13);

    -[SKUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIFontLimitedPreferredFontForTextStyle(11, 7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v15);

  }
  -[SKUIComposeReviewNicknameView traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v17)
  {
    -[SKUIComposeReviewNicknameView sampleCardGradientView](self, "sampleCardGradientView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "colorWithAlphaComponent:", 0.0);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[0] = objc_msgSend(v21, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "colorWithAlphaComponent:", 0.0);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[1] = objc_msgSend(v23, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[2] = objc_msgSend(v24, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[3] = objc_msgSend(v25, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setColors:", v26);

  }
}

- (void)_setupView
{
  -[SKUIComposeReviewNicknameView _setupTitle](self, "_setupTitle");
  -[SKUIComposeReviewNicknameView _setupSampleCardView](self, "_setupSampleCardView");
  -[SKUIComposeReviewNicknameView _setupTextField](self, "_setupTextField");
  -[SKUIComposeReviewNicknameView _setupInfo](self, "_setupInfo");
}

- (void)_setupTitle
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v3 = (void *)objc_opt_new();
  -[SKUIComposeReviewNicknameView setTitleView:](self, "setTitleView:", v3);

  -[SKUIComposeReviewNicknameView titleView](self, "titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIFontLimitedPreferredFontForTextStyle(15, 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  -[SKUIComposeReviewNicknameView titleView](self, "titleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 2);

  -[SKUIComposeReviewNicknameView titleView](self, "titleView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SKUIComposeReviewNicknameView titleView](self, "titleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView addSubview:](self, "addSubview:", v8);

  -[SKUIComposeReviewNicknameView titleView](self, "titleView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstBaselineAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, 61.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[SKUIComposeReviewNicknameView titleView](self, "titleView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView leadingAnchor](self, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 20.0);
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[SKUIComposeReviewNicknameView titleView](self, "titleView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView trailingAnchor](self, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 20.0);
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("NICKNAME_VIEW_TITLE"), &stru_1E73A9FB0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView titleView](self, "titleView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setText:", v24);

  -[SKUIComposeReviewNicknameView titleView](self, "titleView");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTextAlignment:", 1);

}

- (void)_setupSampleCardView
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
  void *v13;
  void *v14;
  SKUIGradientView *v15;
  SKUIGradientView *v16;
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
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[5];

  v51[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[SKUIComposeReviewNicknameView setSampleCardView:](self, "setSampleCardView:", v3);

  -[SKUIComposeReviewNicknameView sampleCardView](self, "sampleCardView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SKUIComposeReviewNicknameView sampleCardView](self, "sampleCardView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView addSubview:](self, "addSubview:", v5);

  -[SKUIComposeReviewNicknameView sampleCardView](self, "sampleCardView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView titleView](self, "titleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 24.0, 30.0);
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  -[SKUIComposeReviewNicknameView sampleCardView](self, "sampleCardView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView centerXAnchor](self, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  v15 = [SKUIGradientView alloc];
  v16 = -[SKUIGradientView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SKUIComposeReviewNicknameView setSampleCardGradientView:](self, "setSampleCardGradientView:", v16);

  -[SKUIComposeReviewNicknameView sampleCardGradientView](self, "sampleCardGradientView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SKUIComposeReviewNicknameView sampleCardView](self, "sampleCardView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView sampleCardGradientView](self, "sampleCardGradientView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

  -[SKUIComposeReviewNicknameView sampleCardGradientView](self, "sampleCardGradientView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView sampleCardView](self, "sampleCardView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

  -[SKUIComposeReviewNicknameView sampleCardGradientView](self, "sampleCardGradientView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView sampleCardView](self, "sampleCardView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setActive:", 1);

  -[SKUIComposeReviewNicknameView sampleCardGradientView](self, "sampleCardGradientView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView sampleCardView](self, "sampleCardView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setActive:", 1);

  -[SKUIComposeReviewNicknameView sampleCardGradientView](self, "sampleCardGradientView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView sampleCardView](self, "sampleCardView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setActive:", 1);

  -[SKUIComposeReviewNicknameView sampleCardGradientView](self, "sampleCardGradientView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "colorWithAlphaComponent:", 0.0);
  v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v51[0] = objc_msgSend(v43, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "colorWithAlphaComponent:", 0.0);
  v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v51[1] = objc_msgSend(v45, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v51[2] = objc_msgSend(v46, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v51[3] = objc_msgSend(v47, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setColors:", v48);

  -[SKUIComposeReviewNicknameView sampleCardGradientView](self, "sampleCardGradientView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "layer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setLocations:", &unk_1E749BAE8);

}

- (void)_setupTextField
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
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
  double v24;
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
  double v46;
  void *v47;
  void *v48;
  double v49;
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
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  void *v85;
  void *v86;
  id v87;

  v3 = (void *)objc_opt_new();
  -[SKUIComposeReviewNicknameView setNicknameBackgroundView:](self, "setNicknameBackgroundView:", v3);

  -[SKUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 8.0);
  v8 = v7;
  -[SKUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", v8);

  -[SKUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView addSubview:](self, "addSubview:", v11);

  -[SKUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView sampleCardView](self, "sampleCardView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 20.0);
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[SKUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView leadingAnchor](self, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 20.0);
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

  -[SKUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView trailingAnchor](self, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 20.0);
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  v26 = (void *)objc_opt_new();
  -[SKUIComposeReviewNicknameView setNicknamePlaceholderLabel:](self, "setNicknamePlaceholderLabel:", v26);

  -[SKUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SKUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubview:", v29);

  -[SKUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIFontLimitedPreferredFontForTextStyle(3, 7);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFont:", v31);

  -[SKUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 20.0);
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

  -[SKUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 18.0);
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setActive:", 1);

  -[SKUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 18.0);
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v45, -v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setActive:", 1);

  -[SKUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v49) = 1148846080;
  objc_msgSend(v48, "setContentHuggingPriority:forAxis:", 0, v49);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("NICKNAME_VIEW_PLACEHOLDER"), &stru_1E73A9FB0, 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setText:", v51);

  v53 = (void *)objc_opt_new();
  -[SKUIComposeReviewNicknameView setNicknameTextfield:](self, "setNicknameTextfield:", v53);

  -[SKUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SKUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addSubview:", v56);

  -[SKUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "firstBaselineAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "firstBaselineAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setActive:", 1);

  -[SKUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "topAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "topAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setActive:", 1);

  -[SKUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "leadingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "trailingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 20.0);
  objc_msgSend(v68, "constraintEqualToAnchor:constant:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setActive:", 1);

  -[SKUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "trailingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "trailingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 16.0);
  objc_msgSend(v73, "constraintEqualToAnchor:constant:", v75, -v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setActive:", 1);

  -[SKUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "bottomAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "bottomAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setActive:", 1);

  -[SKUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v84) = 1132068864;
  objc_msgSend(v83, "setContentCompressionResistancePriority:forAxis:", 0, v84);

  -[SKUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setClearButtonMode:", 1);

  -[SKUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
  v87 = (id)objc_claimAutoreleasedReturnValue();
  SKUIFontLimitedPreferredFontForTextStyle(1, 7);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setFont:", v86);

}

- (void)_setupInfo
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v3 = (void *)objc_opt_new();
  -[SKUIComposeReviewNicknameView setNicknameInfoLabel:](self, "setNicknameInfoLabel:", v3);

  -[SKUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SKUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView addSubview:](self, "addSubview:", v5);

  -[SKUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIFontLimitedPreferredFontForTextStyle(11, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  -[SKUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v9);

  -[SKUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView leadingAnchor](self, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 40.0);
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[SKUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView trailingAnchor](self, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 40.0);
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, -v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[SKUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstBaselineAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 24.0);
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[SKUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView bottomAnchor](self, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD8028], "PPMScaledValueUsingValue:", 20.0);
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, -v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActive:", 1);

  -[SKUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setNumberOfLines:", 3);

  -[SKUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setTextAlignment:", 1);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("NICKNAME_VIEW_MESSAGE"), &stru_1E73A9FB0, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setText:", v31);

}

- (UITextField)nicknameTextfield
{
  return self->_nicknameTextfield;
}

- (void)setNicknameTextfield:(id)a3
{
  objc_storeStrong((id *)&self->_nicknameTextfield, a3);
}

- (UILabel)nicknameInfoLabel
{
  return self->_nicknameInfoLabel;
}

- (void)setNicknameInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nicknameInfoLabel, a3);
}

- (UILabel)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (UILabel)nicknamePlaceholderLabel
{
  return self->_nicknamePlaceholderLabel;
}

- (void)setNicknamePlaceholderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nicknamePlaceholderLabel, a3);
}

- (SKUIComposeReviewSampleCardView)sampleCardView
{
  return self->_sampleCardView;
}

- (void)setSampleCardView:(id)a3
{
  objc_storeStrong((id *)&self->_sampleCardView, a3);
}

- (SKUIGradientView)sampleCardGradientView
{
  return self->_sampleCardGradientView;
}

- (void)setSampleCardGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_sampleCardGradientView, a3);
}

- (UIView)nicknameBackgroundView
{
  return self->_nicknameBackgroundView;
}

- (void)setNicknameBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_nicknameBackgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nicknameBackgroundView, 0);
  objc_storeStrong((id *)&self->_sampleCardGradientView, 0);
  objc_storeStrong((id *)&self->_sampleCardView, 0);
  objc_storeStrong((id *)&self->_nicknamePlaceholderLabel, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_nicknameInfoLabel, 0);
  objc_storeStrong((id *)&self->_nicknameTextfield, 0);
}

@end
