@implementation NCNotificationListSectionRevealHintView

- (NCNotificationListSectionRevealHintView)initWithFrame:(CGRect)a3
{
  NCNotificationListSectionRevealHintView *v3;
  NCNotificationListSectionRevealHintView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationListSectionRevealHintView;
  v3 = -[NCNotificationListSectionRevealHintView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NCNotificationListSectionRevealHintView setRevealPercentage:](v3, "setRevealPercentage:", 1.0);
    -[NCNotificationListSectionRevealHintView setHintingAlpha:](v4, "setHintingAlpha:", 0.0);
  }
  return v4;
}

- (void)setRevealPercentage:(double)a3
{
  if (self->_revealPercentage != a3)
  {
    self->_revealPercentage = a3;
    -[NCNotificationListSectionRevealHintView _updateAlpha](self, "_updateAlpha");
    -[NCNotificationListSectionRevealHintView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setForceRevealed:(BOOL)a3
{
  double v4;

  v4 = 0.0;
  if (a3)
    v4 = 1.0;
  -[NCNotificationListSectionRevealHintView setHintingAlpha:](self, "setHintingAlpha:", v4);
  -[NCNotificationListSectionRevealHintView _updateAlpha](self, "_updateAlpha");
}

+ (double)minimumViewHeight
{
  void *v2;
  double result;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 100.0);
  _NCMainScreenScale();
  UICeilToScale();

  _NCMainScreenScale();
  UICeilToScale();
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[NCNotificationListSectionRevealHintView _configureRevealHintTitleIfNecessary](self, "_configureRevealHintTitleIfNecessary");
  -[NCNotificationListSectionRevealHintView _layoutRevealHintTitle](self, "_layoutRevealHintTitle");
  -[SBUILegibilityLabel sizeThatFits:](self->_revealHintTitle, "sizeThatFits:", width, height);
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListSectionRevealHintView;
  -[NCNotificationListSectionRevealHintView layoutSubviews](&v3, sel_layoutSubviews);
  -[NCNotificationListSectionRevealHintView _configureRevealHintTitleIfNecessary](self, "_configureRevealHintTitleIfNecessary");
  -[NCNotificationListSectionRevealHintView _layoutRevealHintTitle](self, "_layoutRevealHintTitle");
}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  void *v5;
  _UILegibilitySettings *v6;

  v6 = (_UILegibilitySettings *)a3;
  if (self->_legibilitySettings != v6)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[NCNotificationListSectionRevealHintView revealHintTitle](self, "revealHintTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLegibilitySettings:", v6);

  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
    self->_adjustsFontForContentSizeCategory = a3;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  _BOOL4 adjustsFontForContentSizeCategory;
  SBUILegibilityLabel *revealHintTitle;

  adjustsFontForContentSizeCategory = self->_adjustsFontForContentSizeCategory;
  if (self->_adjustsFontForContentSizeCategory)
  {
    -[SBUILegibilityLabel removeFromSuperview](self->_revealHintTitle, "removeFromSuperview");
    revealHintTitle = self->_revealHintTitle;
    self->_revealHintTitle = 0;

    -[NCNotificationListSectionRevealHintView setNeedsLayout](self, "setNeedsLayout");
  }
  return adjustsFontForContentSizeCategory;
}

- (void)_configureRevealHintTitleIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SBUILegibilityLabel *v7;
  SBUILegibilityLabel *revealHintTitle;
  SBUILegibilityLabel *v9;

  if (!self->_revealHintTitle)
  {
    +[NCNotificationListLegibilityLabelCache sharedInstance](NCNotificationListLegibilityLabelCache, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NCUserNotificationsUIKitFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NO_NOTIFICATION_HISTORY"), &stru_1E8D21F60, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListSectionRevealHintView _labelFont](self, "_labelFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "legibilityLabelForTitle:forSuperview:font:", v5, self, v6);
    v7 = (SBUILegibilityLabel *)objc_claimAutoreleasedReturnValue();
    revealHintTitle = self->_revealHintTitle;
    self->_revealHintTitle = v7;

    v9 = self->_revealHintTitle;
    -[NCNotificationListSectionRevealHintView _alphaValueBasedOnRevealPercentage](self, "_alphaValueBasedOnRevealPercentage");
    -[SBUILegibilityLabel setAlpha:](v9, "setAlpha:");
    -[SBUILegibilityLabel setLegibilitySettings:](self->_revealHintTitle, "setLegibilitySettings:", self->_legibilitySettings);
    -[NCNotificationListSectionRevealHintView addSubview:](self, "addSubview:", self->_revealHintTitle);
  }
}

- (void)_layoutRevealHintTitle
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

  -[NCNotificationListSectionRevealHintView _configureRevealHintTitleIfNecessary](self, "_configureRevealHintTitleIfNecessary");
  -[NCNotificationListSectionRevealHintView bounds](self, "bounds");
  -[SBUILegibilityLabel sizeThatFits:](self->_revealHintTitle, "sizeThatFits:", v3, v4);
  UIRectCenteredXInRect();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NCNotificationListSectionRevealHintView revealPercentage](self, "revealPercentage");
  -[NCNotificationListSectionRevealHintView _hintTitleDisplacementForRevealPercentage:](self, "_hintTitleDisplacementForRevealPercentage:");
  -[SBUILegibilityLabel setFrame:](self->_revealHintTitle, "setFrame:", v6, v11 + 0.0, v8, v10);
}

- (double)_hintTitleDisplacementForRevealPercentage:(double)a3
{
  return a3 * 0.0;
}

- (id)_labelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "bsui_preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0DC4A88], 1);
}

- (double)_alphaValueBasedOnRevealPercentage
{
  return self->_revealPercentage;
}

- (void)_updateAlpha
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[NCNotificationListSectionRevealHintView _alphaValueBasedOnRevealPercentage](self, "_alphaValueBasedOnRevealPercentage");
  v4 = v3;
  -[NCNotificationListSectionRevealHintView hintingAlpha](self, "hintingAlpha");
  v6 = v4 + v5;
  -[NCNotificationListSectionRevealHintView revealHintTitle](self, "revealHintTitle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (double)revealPercentage
{
  return self->_revealPercentage;
}

- (BOOL)isForceRevealed
{
  return self->_forceRevealed;
}

- (SBUILegibilityLabel)revealHintTitle
{
  return self->_revealHintTitle;
}

- (void)setRevealHintTitle:(id)a3
{
  objc_storeStrong((id *)&self->_revealHintTitle, a3);
}

- (double)hintingAlpha
{
  return self->_hintingAlpha;
}

- (void)setHintingAlpha:(double)a3
{
  self->_hintingAlpha = a3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_revealHintTitle, 0);
}

@end
