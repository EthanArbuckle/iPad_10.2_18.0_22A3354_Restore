@implementation PINView

- (void)showError:(id)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  UILabel *errorTitleLabel;
  double v8;
  double v9;
  double v10;
  double v11;
  UILabel *v12;
  UILabel *v13;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id location;

  v4 = a4;
  v6 = a3;
  errorTitleLabel = self->_errorTitleLabel;
  if (!errorTitleLabel)
  {
    -[UILabel frame](self->_titleLabel, "frame");
    v12 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v8, v9, v10, v11);
    v13 = self->_errorTitleLabel;
    self->_errorTitleLabel = v12;

    v14 = self->_errorTitleLabel;
    -[UILabel font](self->_titleLabel, "font");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v14, "setFont:", v15);

    -[UILabel setOpaque:](self->_errorTitleLabel, "setOpaque:", 0);
    -[UILabel setBackgroundColor:](self->_errorTitleLabel, "setBackgroundColor:", 0);
    -[UILabel setTextAlignment:](self->_errorTitleLabel, "setTextAlignment:", 1);
    v16 = self->_errorTitleLabel;
    -[UILabel textColor](self->_titleLabel, "textColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v16, "setTextColor:", v17);

    -[UILabel accessibilitySetIdentification:](self->_errorTitleLabel, "accessibilitySetIdentification:", CFSTR("errorTitleLabel"));
    -[UILabel setNumberOfLines:](self->_errorTitleLabel, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontSizeToFitWidth:](self->_errorTitleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[PINView addSubview:](self, "addSubview:", self->_errorTitleLabel);
    -[UILabel setAlpha:](self->_errorTitleLabel, "setAlpha:", 0.0);
    errorTitleLabel = self->_errorTitleLabel;
  }
  -[UILabel setText:](errorTitleLabel, "setText:", v6);
  -[PINView setStringValue:](self, "setStringValue:", &stru_1E4A69238);
  if (!self->_error)
  {
    self->_error = 1;
    objc_initWeak(&location, self);
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __29__PINView_showError_animate___block_invoke;
    v23 = &unk_1E4A679F8;
    objc_copyWeak(&v24, &location);
    v18 = MEMORY[0x1A8594D10](&v20);
    v19 = (void *)v18;
    if (v4)
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v18, 0.3, v20, v21, v22, v23);
    else
      (*(void (**)(uint64_t))(v18 + 16))(v18);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

}

void __29__PINView_showError_animate___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[52], "setAlpha:", 0.0);
  objc_msgSend(WeakRetained[53], "setAlpha:", 1.0);

}

- (void)hideError
{
  if (self->_error)
  {
    self->_error = 0;
    -[UILabel setAlpha:](self->_titleLabel, "setAlpha:", 1.0);
    -[UILabel setAlpha:](self->_errorTitleLabel, "setAlpha:", 0.0);
  }
}

- (void)setTitle:(id)a3 font:(id)a4
{
  UILabel *titleLabel;
  id v7;

  titleLabel = self->_titleLabel;
  v7 = a4;
  -[UILabel setText:](titleLabel, "setText:", a3);
  -[UILabel setFont:](self->_titleLabel, "setFont:", v7);

}

- (double)getCurrentTitleFontSize
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[UILabel _actualScaleFactor](self->_titleLabel, "_actualScaleFactor");
  v4 = v3;
  -[UILabel font](self->_titleLabel, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pointSize");
  v7 = v4 * v6;

  return v7;
}

- (id)stringValue
{
  return 0;
}

- (BOOL)becomeFirstResponder
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)notifyDelegatePINChanged
{
  PSPINEntryViewDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  void *v8;
  id v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      -[PINView stringValue](self, "stringValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pinView:pinValueChanged:", self, v8);

    }
  }
}

- (void)notifyDelegatePINEntered
{
  PSPINEntryViewDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  void *v8;
  id v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      -[PINView stringValue](self, "stringValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pinView:pinEntered:", self, v8);

    }
  }
}

- (void)setPINPolicyString:(id)a3 visible:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  UILabel *pinPolicyLabel;
  id v8;
  UILabel *v9;
  UILabel *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  double v15;
  id v16;

  v4 = a4;
  v6 = a3;
  pinPolicyLabel = self->_pinPolicyLabel;
  v16 = v6;
  if (!pinPolicyLabel)
  {
    v8 = objc_alloc(MEMORY[0x1E0CEA700]);
    v9 = (UILabel *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v10 = self->_pinPolicyLabel;
    self->_pinPolicyLabel = v9;

    v11 = self->_pinPolicyLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v12);

    -[UILabel setOpaque:](self->_pinPolicyLabel, "setOpaque:", 0);
    -[UILabel setNumberOfLines:](self->_pinPolicyLabel, "setNumberOfLines:", 0);
    -[UILabel setBackgroundColor:](self->_pinPolicyLabel, "setBackgroundColor:", 0);
    -[UILabel setTextAlignment:](self->_pinPolicyLabel, "setTextAlignment:", 1);
    v13 = self->_pinPolicyLabel;
    -[UILabel textColor](self->_titleLabel, "textColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v13, "setTextColor:", v14);

    -[UILabel setAdjustsFontSizeToFitWidth:](self->_pinPolicyLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[PINView addSubview:](self, "addSubview:", self->_pinPolicyLabel);
    v6 = v16;
    pinPolicyLabel = self->_pinPolicyLabel;
  }
  -[UILabel setText:](pinPolicyLabel, "setText:", v6);
  v15 = 0.0;
  if (v4)
    v15 = 1.0;
  -[UILabel setAlpha:](self->_pinPolicyLabel, "setAlpha:", v15);
  -[PINView setNeedsLayout](self, "setNeedsLayout");

}

- (void)showFailedAttempts:(int64_t)a3
{
  FailureBarView *failureView;
  FailureBarView *v6;
  FailureBarView *v7;
  FailureBarView *v8;
  UILabel *pinPolicyLabel;

  failureView = self->_failureView;
  if (!failureView)
  {
    v6 = [FailureBarView alloc];
    -[PINView frame](self, "frame");
    v7 = -[FailureBarView initWithFrame:](v6, "initWithFrame:");
    v8 = self->_failureView;
    self->_failureView = v7;

    failureView = self->_failureView;
  }
  -[PINView addSubview:](self, "addSubview:", failureView);
  -[FailureBarView setFailureCount:](self->_failureView, "setFailureCount:", a3);
  pinPolicyLabel = self->_pinPolicyLabel;
  if (pinPolicyLabel)
    -[UILabel setHidden:](pinPolicyLabel, "setHidden:", 1);
  -[PINView setNeedsLayout](self, "setNeedsLayout");
}

- (void)hideFailedAttempts
{
  UILabel *pinPolicyLabel;

  -[FailureBarView removeFromSuperview](self->_failureView, "removeFromSuperview");
  pinPolicyLabel = self->_pinPolicyLabel;
  if (pinPolicyLabel)
    -[UILabel setHidden:](pinPolicyLabel, "setHidden:", 0);
  -[PINView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  double v25;
  objc_super v26;
  CGRect v27;

  v26.receiver = self;
  v26.super_class = (Class)PINView;
  -[PINView layoutSubviews](&v26, sel_layoutSubviews);
  -[PINView passcodeOptionsHandler](self, "passcodeOptionsHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PINView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[PINView optionsButton](self, "optionsButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CEA5E8];
    -[UIButton titleLabel](self->_optionsButton, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "font");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fontDescriptor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PINView getCurrentTitleFontSize](self, "getCurrentTitleFontSize");
    objc_msgSend(v13, "fontWithDescriptor:size:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFont:", v17);

    objc_msgSend(v12, "sizeToFit");
    objc_msgSend(v12, "frame");
    v20 = v19;
    v22 = v21;
    -[PINView bounds](self, "bounds");
    if (v20 >= v23 + -30.0)
      v20 = v23 + -30.0;
    v24 = (v9 - v20) * 0.5;
    v25 = floorf(v24);
    v27.origin.x = v5;
    v27.origin.y = v7;
    v27.size.width = v9;
    v27.size.height = v11;
    -[UIButton setFrame:](self->_optionsButton, "setFrame:", v25, CGRectGetMaxY(v27) - v22 + -10.0, v20, v22);

  }
}

- (UIButton)optionsButton
{
  UIButton *optionsButton;
  PINOptionsButton *v4;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  void *v8;

  optionsButton = self->_optionsButton;
  if (!optionsButton)
  {
    v4 = objc_alloc_init(PINOptionsButton);
    v5 = self->_optionsButton;
    self->_optionsButton = &v4->super;

    v6 = self->_optionsButton;
    -[PINView optionsButtonTitle](self, "optionsButtonTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[UIButton setTitle:forState:](v6, "setTitle:forState:", v7, 0);
    }
    else
    {
      PS_LocalizedStringForPINEntry(CFSTR("PASSCODE_OPTIONS"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitle:forState:](v6, "setTitle:forState:", v8, 0);

    }
    -[UIButton addTarget:action:forControlEvents:](self->_optionsButton, "addTarget:action:forControlEvents:", self, sel_optionsButtonTapped, 64);
    -[PINView addSubview:](self, "addSubview:", self->_optionsButton);
    -[PINView setNeedsLayout](self, "setNeedsLayout");
    optionsButton = self->_optionsButton;
  }
  return optionsButton;
}

- (void)setOptionsButtonTitle:(id)a3
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *optionsButtonTitle;
  UIButton *optionsButton;
  NSString *v10;
  void *v11;
  NSString *v12;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_optionsButtonTitle != v4)
  {
    v12 = v4;
    v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v12;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v12, "copy");
      optionsButtonTitle = self->_optionsButtonTitle;
      self->_optionsButtonTitle = v7;

      optionsButton = self->_optionsButton;
      v10 = self->_optionsButtonTitle;
      if (v10)
      {
        -[UIButton setTitle:forState:](self->_optionsButton, "setTitle:forState:", v10, 0);
      }
      else
      {
        PS_LocalizedStringForPINEntry(CFSTR("PASSCODE_OPTIONS"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton setTitle:forState:](optionsButton, "setTitle:forState:", v11, 0);

      }
      -[PINView setNeedsLayout](self, "setNeedsLayout");
      v5 = v12;
    }
  }

}

- (void)setPasscodeOptionsHandler:(id)a3
{
  void *v4;
  id passcodeOptionsHandler;

  if (self->_passcodeOptionsHandler != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    passcodeOptionsHandler = self->_passcodeOptionsHandler;
    self->_passcodeOptionsHandler = v4;

    -[PINView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)optionsButtonTapped
{
  void (**passcodeOptionsHandler)(id, UIButton *);

  passcodeOptionsHandler = (void (**)(id, UIButton *))self->_passcodeOptionsHandler;
  if (passcodeOptionsHandler)
    passcodeOptionsHandler[2](self->_passcodeOptionsHandler, self->_optionsButton);
}

- (void)setShowsOptionsButton:(BOOL)a3
{
  _BOOL4 v3;
  UIButton *v4;
  UIButton *v5;

  v3 = a3;
  if (a3)
  {
    -[PINView optionsButton](self, "optionsButton");
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_optionsButton;
  }
  v5 = v4;
  -[UIButton setHidden:](v4, "setHidden:", !v3);

}

- (void)layoutTopLabel:(id)a3 withMaxY:(double)a4
{
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v18 = a3;
  -[PINView bounds](self, "bounds");
  v6 = a4 + -22.0;
  objc_msgSend(v18, "sizeThatFits:", v7 + -30.0, a4 + -22.0);
  if (v8 <= a4 + -22.0)
    v6 = v8;
  PSRoundToPixel(a4 - v6);
  UIRectCenteredXInRect();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  UIRectIntegralWithScale();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);
}

- (void)layoutBottomSubview:(id)a3 withLabel:(id)a4 withMinY:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIButton *optionsButton;
  double MaxY;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  id v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v37 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(v8, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fontDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pointSize");
  v14 = v13;

  -[PINView getCurrentTitleFontSize](self, "getCurrentTitleFontSize");
  if (v14 < v15)
    v15 = v14;
  objc_msgSend(v9, "fontWithDescriptor:size:", v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v16);

  -[PINView bounds](self, "bounds");
  v17 = v38.size.width + -30.0;
  v18 = CGRectGetMaxY(v38) + -10.0 - a5;
  objc_msgSend(v37, "sizeThatFits:", v17, v18);
  if (v20 <= v18)
    v21 = v20;
  else
    v21 = v18;
  if (v20 <= v18)
    v17 = v19;
  -[PINView _layoutBottomSubview:withMinY:withSize:](self, "_layoutBottomSubview:withMinY:withSize:", v37, a5, v17, v21);
  optionsButton = self->_optionsButton;
  if (optionsButton)
  {
    if ((-[UIButton isHidden](optionsButton, "isHidden") & 1) == 0)
    {
      objc_msgSend(v37, "frame");
      MaxY = CGRectGetMaxY(v39);
      -[UIButton frame](self->_optionsButton, "frame");
      if (MaxY > CGRectGetMinY(v40) + -10.0)
      {
        -[UIButton titleLabel](self->_optionsButton, "titleLabel");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "text");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (double)(unint64_t)objc_msgSend(v25, "length");
        objc_msgSend(v8, "text");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v26 / (double)(unint64_t)objc_msgSend(v27, "length");

        if (v28 > 0.0 && v28 < 1.0)
        {
          -[UIButton frame](self->_optionsButton, "frame");
          v31 = v30;
          v33 = v32;
          v34 = PSRoundToPixel((v18 + -10.0) * v28 / (v28 + 1.0));
          -[PINView frame](self, "frame");
          v35 = CGRectGetMaxY(v41);
          v36 = PSRoundToPixel(v35 - v34 + -10.0);
          -[UIButton setFrame:](self->_optionsButton, "setFrame:", v31, v36, v33, v34);
          v42.origin.x = v31;
          v42.origin.y = v36;
          v42.size.width = v33;
          v42.size.height = v34;
          -[PINView _layoutBottomSubview:withMinY:withSize:](self, "_layoutBottomSubview:withMinY:withSize:", v37, a5, v17, CGRectGetMinY(v42) + -10.0 - a5);
        }
      }
    }
  }

}

- (void)_layoutBottomSubview:(id)a3 withMinY:(double)a4 withSize:(CGSize)a5
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v16 = a3;
  -[PINView bounds](self, "bounds");
  PSRoundToPixel(a4);
  UIRectCenteredXInRect();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  UIRectIntegralWithScale();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
}

- (PSPINEntryViewDelegate)delegate
{
  return (PSPINEntryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)passcodeOptionsHandler
{
  return self->_passcodeOptionsHandler;
}

- (void)setOptionsButton:(id)a3
{
  objc_storeStrong((id *)&self->_optionsButton, a3);
}

- (NSString)optionsButtonTitle
{
  return self->_optionsButtonTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsButtonTitle, 0);
  objc_storeStrong((id *)&self->_optionsButton, 0);
  objc_storeStrong(&self->_passcodeOptionsHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pinPolicyLabel, 0);
  objc_storeStrong((id *)&self->_failureView, 0);
  objc_storeStrong((id *)&self->_errorTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
