@implementation VSSetupView

- (VSSetupView)initWithCoder:(id)a3
{
  VSSetupView *v3;
  VSSetupView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSSetupView;
  v3 = -[VSSetupView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    commonInit_6(v3);
  return v4;
}

- (VSSetupView)initWithFrame:(CGRect)a3
{
  VSSetupView *v3;
  VSSetupView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSSetupView;
  v3 = -[VSSetupView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    commonInit_6(v3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  VSRequireMainThread();
  v3.receiver = self;
  v3.super_class = (Class)VSSetupView;
  -[VSSetupView dealloc](&v3, sel_dealloc);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSSetupView;
  -[VSSetupView didUpdateFocusInContext:withAnimationCoordinator:](&v13, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  -[VSSetupView skipButton](self, "skipButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "previouslyFocusedItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSetupView skipButton](self, "skipButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
  {
    objc_msgSend(v8, "setMarqueeRunning:", 0);
    objc_msgSend(v8, "setMarqueeEnabled:", 0);
    objc_msgSend(v8, "setLineBreakMode:", 5);
  }
  else
  {
    objc_msgSend(v6, "nextFocusedItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSetupView skipButton](self, "skipButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 == v12)
    {
      objc_msgSend(v8, "setMarqueeEnabled:", 1);
      objc_msgSend(v8, "setMarqueeRunning:", 1);
    }
  }

}

- (void)setShouldOverrideSkipButtonStyle:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
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
  id v17;

  v3 = a3;
  self->_shouldOverrideSkipButtonStyle = a3;
  -[VSSetupView defaultSkipButtonSpacing](self, "defaultSkipButtonSpacing");
  v6 = v5;
  -[VSSetupView defaultSkipButtonFont](self, "defaultSkipButtonFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v3)
  {
    -[VSSetupView setSkipButtonFont:](self, "setSkipButtonFont:", v7);

    -[VSSetupView skipButton](self, "skipButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "widthAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSetupView beginButton](self, "beginButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "widthAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    goto LABEL_5;
  }
  objc_msgSend(v7, "fontWithSize:", 29.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSetupView setSkipButtonFont:](self, "setSkipButtonFont:", v9);
  v6 = v6 * 2.75;
  -[VSSetupView stackView](self, "stackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSetupView skipButton](self, "skipButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCustomSpacing:afterView:", v11, 0.0);

  -[VSSetupView appsButton](self, "appsButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v12, "isHidden");

  if ((_DWORD)v11)
  {
    -[VSSetupView stackView](self, "stackView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSetupView appsButton](self, "appsButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCustomSpacing:afterView:", v14, 0.0);
LABEL_5:

  }
  -[VSSetupView stackView](self, "stackView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[VSSetupView beginButton](self, "beginButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCustomSpacing:afterView:", v16, v6);

}

- (void)setSkipButtonTitle:(id)a3
{
  void *v4;
  id v5;

  objc_storeStrong((id *)&self->_skipButtonTitle, a3);
  -[VSSetupView skipButton](self, "skipButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeToFit");

  -[VSSetupView skipButton](self, "skipButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsUpdateConstraints");

}

- (void)_beginButtonPressed:(id)a3
{
  id v4;

  -[VSSetupView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginSetup:", self);

}

- (void)_skipButtonPressed:(id)a3
{
  id v4;

  -[VSSetupView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "skipSetup:", self);

}

- (void)_appsButtonPressed:(id)a3
{
  id v4;

  -[VSSetupView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "showApps:", self);

}

- (VSSetupViewDelegate)delegate
{
  return (VSSetupViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_storeStrong((id *)&self->_appName, a3);
}

- (NSString)appAgeRatingBadge
{
  return self->_appAgeRatingBadge;
}

- (void)setAppAgeRatingBadge:(id)a3
{
  objc_storeStrong((id *)&self->_appAgeRatingBadge, a3);
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
  objc_storeStrong((id *)&self->_footnote, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (BOOL)shouldShowAppsButton
{
  return self->_shouldShowAppsButton;
}

- (void)setShouldShowAppsButton:(BOOL)a3
{
  self->_shouldShowAppsButton = a3;
}

- (BOOL)shouldShowAboutButton
{
  return self->_shouldShowAboutButton;
}

- (void)setShouldShowAboutButton:(BOOL)a3
{
  self->_shouldShowAboutButton = a3;
}

- (BOOL)shouldOverrideSkipButtonStyle
{
  return self->_shouldOverrideSkipButtonStyle;
}

- (NSString)beginButtonTitle
{
  return self->_beginButtonTitle;
}

- (void)setBeginButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (NSString)skipButtonTitle
{
  return self->_skipButtonTitle;
}

- (NSString)appsButtonTitle
{
  return self->_appsButtonTitle;
}

- (void)setAppsButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (UIView)tvProviderPrivacyButtonContainer
{
  return self->_tvProviderPrivacyButtonContainer;
}

- (UIView)tvAppPrivacyButtonContainer
{
  return self->_tvAppPrivacyButtonContainer;
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (VSFontCenter)fontCenter
{
  return self->_fontCenter;
}

- (void)setFontCenter:(id)a3
{
  objc_storeStrong((id *)&self->_fontCenter, a3);
}

- (UIFont)defaultSkipButtonFont
{
  return self->_defaultSkipButtonFont;
}

- (void)setDefaultSkipButtonFont:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSkipButtonFont, a3);
}

- (UIFont)skipButtonFont
{
  return self->_skipButtonFont;
}

- (void)setSkipButtonFont:(id)a3
{
  objc_storeStrong((id *)&self->_skipButtonFont, a3);
}

- (double)defaultSkipButtonSpacing
{
  return self->_defaultSkipButtonSpacing;
}

- (void)setDefaultSkipButtonSpacing:(double)a3
{
  self->_defaultSkipButtonSpacing = a3;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UIButton)beginButton
{
  return self->_beginButton;
}

- (void)setBeginButton:(id)a3
{
  objc_storeStrong((id *)&self->_beginButton, a3);
}

- (UIButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
  objc_storeStrong((id *)&self->_skipButton, a3);
}

- (UIButton)appsButton
{
  return self->_appsButton;
}

- (void)setAppsButton:(id)a3
{
  objc_storeStrong((id *)&self->_appsButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsButton, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_beginButton, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_skipButtonFont, 0);
  objc_storeStrong((id *)&self->_defaultSkipButtonFont, 0);
  objc_storeStrong((id *)&self->_fontCenter, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_tvAppPrivacyButtonContainer, 0);
  objc_storeStrong((id *)&self->_tvProviderPrivacyButtonContainer, 0);
  objc_storeStrong((id *)&self->_appsButtonTitle, 0);
  objc_storeStrong((id *)&self->_skipButtonTitle, 0);
  objc_storeStrong((id *)&self->_beginButtonTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_appAgeRatingBadge, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
