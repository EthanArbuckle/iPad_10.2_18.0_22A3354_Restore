@implementation TFBetaAppLaunchScreenView

- (TFBetaAppLaunchScreenView)initWithFrame:(CGRect)a3
{
  TFBetaAppLaunchScreenView *v3;
  TFBetaAppLaunchScreenViewSpecification *v4;
  void *v5;
  uint64_t v6;
  TFBetaAppLaunchScreenViewSpecification *specification;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  UIScrollView *scrollView;
  void *v15;
  uint64_t v16;
  UILabel *titleLabel;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  uint64_t v22;
  UILabel *subtitleLabel;
  UILabel *v24;
  void *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  void *v29;
  TFAppLockupView *v30;
  TFAppLockupView *lockupView;
  uint64_t v32;
  UILabel *bodyTitleLabel;
  UILabel *v34;
  void *v35;
  UILabel *v36;
  void *v37;
  uint64_t v38;
  UILabel *bodyTextLabel;
  UILabel *v40;
  void *v41;
  UILabel *v42;
  void *v43;
  TFDeviceInstructionView *v44;
  TFDeviceInstructionView *instructionView;
  void *v46;
  uint64_t v47;
  UIVisualEffectView *buttonBackgroundEffectView;
  uint64_t v49;
  UIButton *primaryButton;
  UIButton *v51;
  void *v52;
  void *v53;
  UIButton *v54;
  void *v55;
  uint64_t v56;
  UIButton *secondaryButton;
  UIButton *v58;
  void *v59;
  objc_super v61;

  v61.receiver = self;
  v61.super_class = (Class)TFBetaAppLaunchScreenView;
  v3 = -[TFBetaAppLaunchScreenView initWithFrame:](&v61, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [TFBetaAppLaunchScreenViewSpecification alloc];
    -[TFBetaAppLaunchScreenView traitCollection](v3, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TFBetaAppLaunchScreenViewSpecification initWithTraitCollection:](v4, "initWithTraitCollection:", v5);
    specification = v3->_specification;
    v3->_specification = (TFBetaAppLaunchScreenViewSpecification *)v6;

    v8 = objc_alloc(MEMORY[0x24BDF6D50]);
    v9 = *MEMORY[0x24BDBF090];
    v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v12 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x24BDBF090], v10, v11, v12);
    scrollView = v3->_scrollView;
    v3->_scrollView = (UIScrollView *)v13;

    -[TFBetaAppLaunchScreenViewSpecification backgroundColor](v3->_specification, "backgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView setBackgroundColor:](v3->_scrollView, "setBackgroundColor:", v15);

    -[UIScrollView setContentInsetAdjustmentBehavior:](v3->_scrollView, "setContentInsetAdjustmentBehavior:", 2);
    -[UIScrollView setShowsVerticalScrollIndicator:](v3->_scrollView, "setShowsVerticalScrollIndicator:", 0);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v3->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[TFBetaAppLaunchScreenView addSubview:](v3, "addSubview:", v3->_scrollView);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v9, v10, v11, v12);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v16;

    v18 = v3->_titleLabel;
    -[TFBetaAppLaunchScreenViewSpecification titleFont](v3->_specification, "titleFont");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v18, "setFont:", v19);

    v20 = v3->_titleLabel;
    -[TFBetaAppLaunchScreenViewSpecification textColor](v3->_specification, "textColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v20, "setTextColor:", v21);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 1);
    -[UIScrollView addSubview:](v3->_scrollView, "addSubview:", v3->_titleLabel);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v9, v10, v11, v12);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v22;

    v24 = v3->_subtitleLabel;
    -[TFBetaAppLaunchScreenView specification](v3, "specification");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "subtitleFont");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v24, "setFont:", v26);

    v27 = v3->_subtitleLabel;
    -[TFBetaAppLaunchScreenView specification](v3, "specification");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "textColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v27, "setTextColor:", v29);

    -[UILabel setTextAlignment:](v3->_subtitleLabel, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_subtitleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setNumberOfLines:](v3->_subtitleLabel, "setNumberOfLines:", 5);
    -[UIScrollView addSubview:](v3->_scrollView, "addSubview:", v3->_subtitleLabel);
    v30 = -[TFAppLockupView initWithFrame:]([TFAppLockupView alloc], "initWithFrame:", v9, v10, v11, v12);
    lockupView = v3->_lockupView;
    v3->_lockupView = v30;

    -[UIScrollView addSubview:](v3->_scrollView, "addSubview:", v3->_lockupView);
    v32 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v9, v10, v11, v12);
    bodyTitleLabel = v3->_bodyTitleLabel;
    v3->_bodyTitleLabel = (UILabel *)v32;

    v34 = v3->_bodyTitleLabel;
    -[TFBetaAppLaunchScreenViewSpecification bodyTitleFont](v3->_specification, "bodyTitleFont");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v34, "setFont:", v35);

    v36 = v3->_bodyTitleLabel;
    -[TFBetaAppLaunchScreenViewSpecification textColor](v3->_specification, "textColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v36, "setTextColor:", v37);

    -[UIScrollView addSubview:](v3->_scrollView, "addSubview:", v3->_bodyTitleLabel);
    v38 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v9, v10, v11, v12);
    bodyTextLabel = v3->_bodyTextLabel;
    v3->_bodyTextLabel = (UILabel *)v38;

    v40 = v3->_bodyTextLabel;
    -[TFBetaAppLaunchScreenViewSpecification bodyTextFont](v3->_specification, "bodyTextFont");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v40, "setFont:", v41);

    v42 = v3->_bodyTextLabel;
    -[TFBetaAppLaunchScreenViewSpecification textColor](v3->_specification, "textColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v42, "setTextColor:", v43);

    -[UILabel setNumberOfLines:](v3->_bodyTextLabel, "setNumberOfLines:", 0);
    -[UIScrollView addSubview:](v3->_scrollView, "addSubview:", v3->_bodyTextLabel);
    v44 = -[TFDeviceInstructionView initWithFrame:]([TFDeviceInstructionView alloc], "initWithFrame:", v9, v10, v11, v12);
    instructionView = v3->_instructionView;
    v3->_instructionView = v44;

    -[UIScrollView addSubview:](v3->_scrollView, "addSubview:", v3->_instructionView);
    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 4);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", v46);
    buttonBackgroundEffectView = v3->_buttonBackgroundEffectView;
    v3->_buttonBackgroundEffectView = (UIVisualEffectView *)v47;

    -[TFBetaAppLaunchScreenView addSubview:](v3, "addSubview:", v3->_buttonBackgroundEffectView);
    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
    v49 = objc_claimAutoreleasedReturnValue();
    primaryButton = v3->_primaryButton;
    v3->_primaryButton = (UIButton *)v49;

    v51 = v3->_primaryButton;
    -[TFBetaAppLaunchScreenViewSpecification buttonTintColor](v3->_specification, "buttonTintColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v51, "setBackgroundColor:", v52);

    -[UIButton layer](v3->_primaryButton, "layer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFBetaAppLaunchScreenViewSpecification primaryButtonCornerRadius](v3->_specification, "primaryButtonCornerRadius");
    objc_msgSend(v53, "setCornerRadius:");

    v54 = v3->_primaryButton;
    -[TFBetaAppLaunchScreenViewSpecification overButtonTintTextColor](v3->_specification, "overButtonTintTextColor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v54, "setTitleColor:forState:", v55, 0);

    -[TFBetaAppLaunchScreenView addSubview:](v3, "addSubview:", v3->_primaryButton);
    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
    v56 = objc_claimAutoreleasedReturnValue();
    secondaryButton = v3->_secondaryButton;
    v3->_secondaryButton = (UIButton *)v56;

    v58 = v3->_secondaryButton;
    -[TFBetaAppLaunchScreenViewSpecification buttonTintColor](v3->_specification, "buttonTintColor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v58, "setTitleColor:forState:", v59, 0);

    -[TFBetaAppLaunchScreenView addSubview:](v3, "addSubview:", v3->_secondaryButton);
  }
  return v3;
}

- (void)snapshotCurrentView
{
  void *v3;
  void *v4;
  id v5;

  -[TFBetaAppLaunchScreenView snapshotViewAfterScreenUpdates:](self, "snapshotViewAfterScreenUpdates:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFBetaAppLaunchScreenView setSnapshot:](self, "setSnapshot:", v3);

  -[TFBetaAppLaunchScreenView snapshot](self, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFBetaAppLaunchScreenView bounds](self, "bounds");
  objc_msgSend(v4, "setFrame:");

  -[TFBetaAppLaunchScreenView snapshot](self, "snapshot");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TFBetaAppLaunchScreenView addSubview:](self, "addSubview:", v5);

}

- (void)cleanupSnapshot
{
  void *v3;

  -[TFBetaAppLaunchScreenView snapshot](self, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[TFBetaAppLaunchScreenView setSnapshot:](self, "setSnapshot:", 0);
}

- (void)prepareForState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;

  -[TFBetaAppLaunchScreenView setHidden:](self, "setHidden:", a3 == 0);
  -[TFBetaAppLaunchScreenView lockupView](self, "lockupView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", a3 != 1);

  -[TFBetaAppLaunchScreenView bodyTitleLabel](self, "bodyTitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", a3 != 1);

  -[TFBetaAppLaunchScreenView bodyTextLabel](self, "bodyTextLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", a3 != 1);

  v8 = a3 != 2;
  -[TFBetaAppLaunchScreenView subtitleLabel](self, "subtitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", v8);

  -[TFBetaAppLaunchScreenView instructionView](self, "instructionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v8);

  -[TFBetaAppLaunchScreenView secondaryButton](self, "secondaryButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", v8);

  -[TFBetaAppLaunchScreenView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TFBetaAppLaunchScreenView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[TFBetaAppLaunchScreenView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSubtitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TFBetaAppLaunchScreenView subtitleLabel](self, "subtitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[TFBetaAppLaunchScreenView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setLockup:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  -[TFBetaAppLaunchScreenView lockupView](self, "lockupView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  objc_msgSend(v21, "subtitles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  objc_msgSend(v21, "subtitles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 < 2)
  {
    v14 = objc_msgSend(v9, "count");

    if (v14 != 1)
    {
      v11 = 0;
      v13 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v21, "subtitles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "subtitles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  -[TFBetaAppLaunchScreenView lockupView](self, "lockupView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "primarySubtitleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v11);

  -[TFBetaAppLaunchScreenView lockupView](self, "lockupView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "secondarySubtitleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v13);

  -[TFBetaAppLaunchScreenView lockupView](self, "lockupView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "iconView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setImage:", 0);

  -[TFBetaAppLaunchScreenView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBodyTitle:(id)a3 bodyText:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (objc_class *)MEMORY[0x24BDD1688];
  v7 = a4;
  v8 = a3;
  v11 = (id)objc_msgSend([v6 alloc], "initWithString:", v7);

  objc_msgSend(v11, "tf_addLanguageAwareness:", 0);
  -[TFBetaAppLaunchScreenView bodyTitleLabel](self, "bodyTitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  -[TFBetaAppLaunchScreenView bodyTextLabel](self, "bodyTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttributedText:", v11);

  -[TFBetaAppLaunchScreenView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDeviceImage:(id)a3 withOrientation:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[TFBetaAppLaunchScreenView instructionView](self, "instructionView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayDeviceImage:inOrientation:", v6, a4);

}

- (void)setDeviceImageVisibility:(BOOL)a3
{
  double v3;
  void *v4;
  id v5;

  if (a3)
    v3 = 1.0;
  else
    v3 = 0.0;
  -[TFBetaAppLaunchScreenView instructionView](self, "instructionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

}

- (void)setDeviceImageOrientation:(int64_t)a3
{
  id v4;

  -[TFBetaAppLaunchScreenView instructionView](self, "instructionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateCurrentDeviceImageToOrientation:", a3);

}

- (void)setPrimaryButtonTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  -[TFBetaAppLaunchScreenView primaryButton](self, "primaryButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", v9, 0);

  -[TFBetaAppLaunchScreenView primaryButton](self, "primaryButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeTarget:action:forControlEvents:", 0, 0, 64);

  -[TFBetaAppLaunchScreenView primaryButton](self, "primaryButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addTarget:action:forControlEvents:", v8, a5, 64);

  -[TFBetaAppLaunchScreenView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSecondaryButtonTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  -[TFBetaAppLaunchScreenView secondaryButton](self, "secondaryButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", v9, 0);

  -[TFBetaAppLaunchScreenView secondaryButton](self, "secondaryButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeTarget:action:forControlEvents:", 0, 0, 64);

  -[TFBetaAppLaunchScreenView secondaryButton](self, "secondaryButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addTarget:action:forControlEvents:", v8, a5, 64);

  -[TFBetaAppLaunchScreenView setNeedsLayout](self, "setNeedsLayout");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TFBetaAppLaunchScreenView;
  -[TFBetaAppLaunchScreenView traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[TFBetaAppLaunchScreenView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFBetaAppLaunchScreenView _prepareForDisplayWithTraitCollection:](self, "_prepareForDisplayWithTraitCollection:", v4);

  -[TFBetaAppLaunchScreenView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TFBetaAppLaunchScreenView;
  -[TFBetaAppLaunchScreenView layoutSubviews](&v6, sel_layoutSubviews);
  -[TFBetaAppLaunchScreenView specification](self, "specification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFBetaAppLaunchScreenView _layoutButtonModuleWithLayoutMetrics:](self, "_layoutButtonModuleWithLayoutMetrics:", v3);

  -[TFBetaAppLaunchScreenView specification](self, "specification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFBetaAppLaunchScreenView buttonBackgroundEffectView](self, "buttonBackgroundEffectView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFBetaAppLaunchScreenView _layoutScrollViewWithLayoutMetrics:accomodatingPinnedBottomView:](self, "_layoutScrollViewWithLayoutMetrics:accomodatingPinnedBottomView:", v4, v5);

}

- (void)_prepareForDisplayWithTraitCollection:(id)a3
{
  TFBetaAppLaunchScreenViewSpecification *v4;
  void *v5;
  TFBetaAppLaunchScreenViewSpecification *v6;
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
  id v18;

  v4 = [TFBetaAppLaunchScreenViewSpecification alloc];
  -[TFBetaAppLaunchScreenView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TFBetaAppLaunchScreenViewSpecification initWithTraitCollection:](v4, "initWithTraitCollection:", v5);
  -[TFBetaAppLaunchScreenView setSpecification:](self, "setSpecification:", v6);

  -[TFBetaAppLaunchScreenView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFBetaAppLaunchScreenView specification](self, "specification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "titleFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v9);

  -[TFBetaAppLaunchScreenView subtitleLabel](self, "subtitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFBetaAppLaunchScreenView specification](self, "specification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "subtitleFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v12);

  -[TFBetaAppLaunchScreenView bodyTitleLabel](self, "bodyTitleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFBetaAppLaunchScreenView specification](self, "specification");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bodyTitleFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v15);

  -[TFBetaAppLaunchScreenView bodyTextLabel](self, "bodyTextLabel");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[TFBetaAppLaunchScreenView specification](self, "specification");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bodyTextFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v17);

}

- (void)_layoutButtonModuleWithLayoutMetrics:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  double v23;
  double v24;
  double MinX;
  double v26;
  double MaxY;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double Width;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  id v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v4 = a3;
  -[TFBetaAppLaunchScreenView safeAreaInsets](self, "safeAreaInsets");
  -[TFBetaAppLaunchScreenView specification](self, "specification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttonModuleContentLayoutInsets");
  UIEdgeInsetsMax();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[TFBetaAppLaunchScreenView bounds](self, "bounds");
  v15 = v9 + v14;
  v17 = v7 + v16;
  v19 = v18 - (v9 + v13);
  v21 = v20 - (v7 + v11);
  -[TFBetaAppLaunchScreenView secondaryButton](self, "secondaryButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sizeThatFits:", v19, v21);
  v24 = v23;

  v46.origin.x = v15;
  v46.origin.y = v17;
  v46.size.width = v19;
  v46.size.height = v21;
  MinX = CGRectGetMinX(v46);
  v47.origin.x = v15;
  v47.origin.y = v17;
  v47.size.width = v19;
  v47.size.height = v21;
  v26 = MinX + (CGRectGetWidth(v47) - v24) * 0.5;
  v48.origin.x = v15;
  v48.origin.y = v17;
  v48.size.width = v19;
  v48.size.height = v21;
  MaxY = CGRectGetMaxY(v48);
  objc_msgSend(v4, "buttonHeight");
  v29 = MaxY - v28;
  -[TFBetaAppLaunchScreenView secondaryButton](self, "secondaryButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttonHeight");
  objc_msgSend(v30, "setFrame:", v26, v29, v24, v31);

  v49.origin.x = v15;
  v49.origin.y = v17;
  v49.size.width = v19;
  v49.size.height = v21;
  v32 = CGRectGetMinX(v49);
  objc_msgSend(v4, "interButtonPadding");
  v34 = v29 - v33;
  objc_msgSend(v4, "buttonHeight");
  v36 = v34 - v35;
  v50.origin.x = v15;
  v50.origin.y = v17;
  v50.size.width = v19;
  v50.size.height = v21;
  Width = CGRectGetWidth(v50);
  -[TFBetaAppLaunchScreenView primaryButton](self, "primaryButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttonHeight");
  objc_msgSend(v38, "setFrame:", v32, v36, Width, v39);

  objc_msgSend(v4, "buttonBackgroundTopEdgeToPrimaryButtonTopEdge");
  v41 = v40;

  v42 = v36 - v41;
  -[TFBetaAppLaunchScreenView bounds](self, "bounds");
  v43 = CGRectGetWidth(v51);
  -[TFBetaAppLaunchScreenView bounds](self, "bounds");
  v44 = CGRectGetHeight(v52) - v42;
  -[TFBetaAppLaunchScreenView buttonBackgroundEffectView](self, "buttonBackgroundEffectView");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setFrame:", 0.0, v42, v43, v44);

}

- (void)_layoutScrollViewWithLayoutMetrics:(id)a3 accomodatingPinnedBottomView:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double MinX;
  double Width;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double MaxY;
  uint64_t v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  double v58;
  void *v59;
  char v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  char v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  char v81;
  void *v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  char v94;
  double v95;
  double v96;
  void *v97;
  CGFloat v98;
  CGFloat v99;
  void *v100;
  void *v101;
  void *v102;
  double v103;
  void *v104;
  double Height;
  void *v106;
  double v107;
  void *v108;
  id v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;

  v109 = a3;
  v6 = a4;
  -[TFBetaAppLaunchScreenView scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFBetaAppLaunchScreenView bounds](self, "bounds");
  objc_msgSend(v7, "setFrame:");

  -[TFBetaAppLaunchScreenView safeAreaInsets](self, "safeAreaInsets");
  objc_msgSend(v109, "scrollViewContentLayoutInsets");
  UIEdgeInsetsMax();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[TFBetaAppLaunchScreenView scrollView](self, "scrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v11 + v17;
  v20 = v9 + v19;
  v22 = v21 - (v11 + v15);
  v24 = v23 - (v9 + v13);

  v110.origin.x = v18;
  v110.origin.y = v20;
  v110.size.width = v22;
  v110.size.height = v24;
  MinX = CGRectGetMinX(v110);
  v111.origin.x = v18;
  v111.origin.y = v20;
  v111.size.width = v22;
  v111.size.height = v24;
  Width = CGRectGetWidth(v111);
  objc_msgSend(v109, "viewTopMarginAdditionalPaddingAsFractionOfTotalHeight");
  v28 = v27;
  v112.origin.x = v18;
  v112.origin.y = v20;
  v112.size.width = v22;
  v112.size.height = v24;
  v29 = v28 * CGRectGetHeight(v112);
  -[TFBetaAppLaunchScreenView titleLabel](self, "titleLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sizeThatFits:", v22, v24);
  v32 = v31;

  v113.origin.x = v18;
  v113.origin.y = v20;
  v113.size.width = v22;
  v113.size.height = v24;
  v33 = v29 + CGRectGetMinY(v113);
  objc_msgSend(v109, "viewTopMarginToTitleLabelFirstBaseline");
  v35 = v33 + v34;
  -[TFBetaAppLaunchScreenView titleLabel](self, "titleLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "_firstBaselineOffsetFromTop");
  v38 = v35 - v37;

  -[TFBetaAppLaunchScreenView titleLabel](self, "titleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFrame:", MinX, v38, Width, v32);

  -[TFBetaAppLaunchScreenView titleLabel](self, "titleLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "frame");
  MaxY = CGRectGetMaxY(v114);
  -[TFBetaAppLaunchScreenView titleLabel](self, "titleLabel");
  v42 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v42, "_baselineOffsetFromBottom");
  v44 = MaxY - v43;

  -[TFBetaAppLaunchScreenView subtitleLabel](self, "subtitleLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v42) = objc_msgSend(v45, "isHidden");

  if ((v42 & 1) == 0)
  {
    -[TFBetaAppLaunchScreenView subtitleLabel](self, "subtitleLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "sizeThatFits:", v22, v24);
    v48 = v47;

    objc_msgSend(v109, "titleLabelLastBaselineToSubtitleLabelFirstBaseline");
    v50 = v44 + v49;
    -[TFBetaAppLaunchScreenView subtitleLabel](self, "subtitleLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "_firstBaselineOffsetFromTop");
    v53 = v50 - v52;

    -[TFBetaAppLaunchScreenView subtitleLabel](self, "subtitleLabel");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setFrame:", MinX, v53, Width, v48);

    -[TFBetaAppLaunchScreenView subtitleLabel](self, "subtitleLabel");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "frame");
    v56 = CGRectGetMaxY(v115);
    -[TFBetaAppLaunchScreenView subtitleLabel](self, "subtitleLabel");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "_baselineOffsetFromBottom");
    v44 = v56 - v58;

  }
  -[TFBetaAppLaunchScreenView lockupView](self, "lockupView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "isHidden");

  if ((v60 & 1) == 0)
  {
    -[TFBetaAppLaunchScreenView lockupView](self, "lockupView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "sizeThatFits:", v22, v24);
    v63 = v62;

    objc_msgSend(v109, "bottommostLabelLastBaselineToLockupTopEdge");
    v65 = v44 + v64;
    -[TFBetaAppLaunchScreenView lockupView](self, "lockupView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setFrame:", MinX, v65, Width, v63);

  }
  -[TFBetaAppLaunchScreenView bodyTitleLabel](self, "bodyTitleLabel");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "isHidden");

  if ((v68 & 1) == 0)
  {
    -[TFBetaAppLaunchScreenView bodyTitleLabel](self, "bodyTitleLabel");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "sizeThatFits:", v22, v24);
    v71 = v70;

    -[TFBetaAppLaunchScreenView lockupView](self, "lockupView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "frame");
    v73 = CGRectGetMaxY(v116);
    objc_msgSend(v109, "lockupBottomEdgeToBodyTitleLabelFirstBaseline");
    v75 = v73 + v74;
    -[TFBetaAppLaunchScreenView bodyTitleLabel](self, "bodyTitleLabel");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "_firstBaselineOffsetFromTop");
    v78 = v75 - v77;

    -[TFBetaAppLaunchScreenView bodyTitleLabel](self, "bodyTitleLabel");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setFrame:", MinX, v78, Width, v71);

  }
  -[TFBetaAppLaunchScreenView bodyTextLabel](self, "bodyTextLabel");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v80, "isHidden");

  if ((v81 & 1) == 0)
  {
    -[TFBetaAppLaunchScreenView bodyTextLabel](self, "bodyTextLabel");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "sizeThatFits:", v22, v24);
    v84 = v83;

    -[TFBetaAppLaunchScreenView bodyTitleLabel](self, "bodyTitleLabel");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "frame");
    v86 = CGRectGetMaxY(v117);
    objc_msgSend(v109, "bodyTitleLabelLastBaselineToBodyTextLabelFirstBaseline");
    v88 = v86 + v87;
    -[TFBetaAppLaunchScreenView bodyTextLabel](self, "bodyTextLabel");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "_firstBaselineOffsetFromTop");
    v91 = v88 - v90;

    -[TFBetaAppLaunchScreenView bodyTextLabel](self, "bodyTextLabel");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "setFrame:", MinX, v91, Width, v84);

  }
  -[TFBetaAppLaunchScreenView instructionView](self, "instructionView");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = objc_msgSend(v93, "isHidden");

  if ((v94 & 1) == 0)
  {
    objc_msgSend(v109, "bottommostLabelLastBaselineToImageTopEdge");
    v96 = v44 + v95;
    -[TFBetaAppLaunchScreenView scrollView](self, "scrollView");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "bounds");
    v98 = CGRectGetMaxY(v118) - v96;
    objc_msgSend(v6, "frame");
    v99 = v98 - CGRectGetHeight(v119);

    -[TFBetaAppLaunchScreenView instructionView](self, "instructionView");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "setFrame:", MinX, v96, Width, v99);

  }
  -[TFBetaAppLaunchScreenView instructionView](self, "instructionView");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v101, "isHidden") & 1) != 0)
    -[TFBetaAppLaunchScreenView bodyTextLabel](self, "bodyTextLabel");
  else
    -[TFBetaAppLaunchScreenView instructionView](self, "instructionView");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "frame");
  v103 = CGRectGetMaxY(v120);

  objc_msgSend(v6, "frame");
  if (v103 >= CGRectGetMinY(v121))
  {
    objc_msgSend(v6, "frame");
    Height = v103 + CGRectGetHeight(v123);
  }
  else
  {
    -[TFBetaAppLaunchScreenView scrollView](self, "scrollView");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "frame");
    Height = CGRectGetHeight(v122);

  }
  -[TFBetaAppLaunchScreenView scrollView](self, "scrollView");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "frame");
  v107 = CGRectGetWidth(v124);

  -[TFBetaAppLaunchScreenView scrollView](self, "scrollView");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setContentSize:", v107, Height);

}

- (TFAppLockupView)lockupView
{
  return self->_lockupView;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UILabel)bodyTitleLabel
{
  return self->_bodyTitleLabel;
}

- (UILabel)bodyTextLabel
{
  return self->_bodyTextLabel;
}

- (TFDeviceInstructionView)instructionView
{
  return self->_instructionView;
}

- (UIButton)primaryButton
{
  return self->_primaryButton;
}

- (UIButton)secondaryButton
{
  return self->_secondaryButton;
}

- (UIVisualEffectView)buttonBackgroundEffectView
{
  return self->_buttonBackgroundEffectView;
}

- (UIView)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
}

- (TFBetaAppLaunchScreenViewSpecification)specification
{
  return self->_specification;
}

- (void)setSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_specification, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specification, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_buttonBackgroundEffectView, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_instructionView, 0);
  objc_storeStrong((id *)&self->_bodyTextLabel, 0);
  objc_storeStrong((id *)&self->_bodyTitleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
}

@end
