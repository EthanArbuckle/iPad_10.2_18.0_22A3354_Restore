@implementation NCNotificationListHeaderTitleView

- (void)setTitle:(id)a3
{
  void *v5;
  NCNotificationListHeaderTitleView *v6;
  char v7;
  id v8;

  v8 = a3;
  -[SBUILegibilityLabel string](self->_titleLabel, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUILegibilityLabel superview](self->_titleLabel, "superview");
  v6 = (NCNotificationListHeaderTitleView *)objc_claimAutoreleasedReturnValue();
  if (v6 != self)
  {

LABEL_4:
    objc_storeStrong((id *)&self->_title, a3);
    -[NCNotificationListHeaderTitleView _invalidateTitleLabel](self, "_invalidateTitleLabel");
    goto LABEL_5;
  }
  v7 = BSEqualStrings();

  if ((v7 & 1) == 0)
    goto LABEL_4;
LABEL_5:

}

- (void)setPrimary:(BOOL)a3
{
  if (self->_primary != a3)
  {
    self->_primary = a3;
    -[NCNotificationListHeaderTitleView _invalidateTitleLabel](self, "_invalidateTitleLabel");
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListHeaderTitleView;
  -[NCNotificationListHeaderTitleView layoutSubviews](&v3, sel_layoutSubviews);
  -[NCNotificationListHeaderTitleView _configureTitleLabelIfNecessary](self, "_configureTitleLabelIfNecessary");
  -[NCNotificationListHeaderTitleView _layoutTitleLabel](self, "_layoutTitleLabel");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[NCNotificationListHeaderTitleView _configureTitleLabelIfNecessary](self, "_configureTitleLabelIfNecessary");
  -[SBUILegibilityLabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, height);
  v7 = fmin(v6, height);
  v9 = fmin(v8, width);
  result.height = v7;
  result.width = v9;
  return result;
}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_legibilitySettings) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBUILegibilityLabel setLegibilitySettings:](self->_titleLabel, "setLegibilitySettings:", v5);
  }

}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    if (a3)
      -[NCNotificationListHeaderTitleView adjustForContentSizeCategoryChange](self, "adjustForContentSizeCategoryChange");
  }
}

- (NSString)preferredContentSizeCategory
{
  NSString **p_preferredContentSizeCategory;
  NSString *preferredContentSizeCategory;

  p_preferredContentSizeCategory = &self->_preferredContentSizeCategory;
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  if (!preferredContentSizeCategory)
  {
    objc_storeStrong((id *)p_preferredContentSizeCategory, (id)*MEMORY[0x1E0DC4938]);
    preferredContentSizeCategory = *p_preferredContentSizeCategory;
  }
  return preferredContentSizeCategory;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;
  BSUIFontProvider *fontProvider;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NCNotificationListHeaderTitleView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory")
    && (-[NCNotificationListHeaderTitleView preferredContentSizeCategory](self, "preferredContentSizeCategory"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "isEqualToString:", v5),
        v5,
        (v6 & 1) == 0))
  {
    fontProvider = self->_fontProvider;
    self->_fontProvider = 0;

    -[NCNotificationListHeaderTitleView setPreferredContentSizeCategory:](self, "setPreferredContentSizeCategory:", v4);
    -[NCNotificationListHeaderTitleView _invalidateTitleLabel](self, "_invalidateTitleLabel");
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  SBUILegibilityLabel *titleLabel;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NCNotificationListHeaderTitleView;
  v4 = a3;
  -[NCNotificationListHeaderTitleView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[NCNotificationListHeaderTitleView traitCollection](self, "traitCollection", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "legibilityWeight");
  v7 = objc_msgSend(v4, "legibilityWeight");

  if (v6 != v7)
  {
    titleLabel = self->_titleLabel;
    if (titleLabel)
    {
      -[NCNotificationListHeaderTitleView _labelFont](self, "_labelFont");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBUILegibilityLabel setFont:](titleLabel, "setFont:", v9);

    }
    -[NCNotificationListHeaderTitleView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BSUIFontProvider)_fontProvider
{
  BSUIFontProvider *v3;
  BSUIFontProvider *fontProvider;

  if (!self->_fontProvider)
  {
    if (-[NCNotificationListHeaderTitleView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))
    {
      objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
    }
    v3 = (BSUIFontProvider *)objc_claimAutoreleasedReturnValue();
    fontProvider = self->_fontProvider;
    self->_fontProvider = v3;

  }
  return self->_fontProvider;
}

- (id)_labelFont
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;

  -[NCNotificationListHeaderTitleView _fontProvider](self, "_fontProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_primary)
    v5 = (_QWORD *)MEMORY[0x1E0DC4B50];
  else
    v5 = (_QWORD *)MEMORY[0x1E0DC4B58];
  objc_msgSend(v3, "preferredFontForTextStyle:hiFontStyle:", *v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_invalidateTitleLabel
{
  NCNotificationListHeaderTitleView *v3;
  SBUILegibilityLabel *titleLabel;

  -[SBUILegibilityLabel superview](self->_titleLabel, "superview");
  v3 = (NCNotificationListHeaderTitleView *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    -[SBUILegibilityLabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
  titleLabel = self->_titleLabel;
  self->_titleLabel = 0;

  -[NCNotificationListHeaderTitleView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_configureTitleLabelIfNecessary
{
  void *v3;
  void *v4;
  SBUILegibilityLabel *v5;
  SBUILegibilityLabel *titleLabel;
  double v7;
  NCNotificationListHeaderTitleView *v8;
  id v9;

  if (!self->_titleLabel && self->_title)
  {
    -[NCNotificationListHeaderTitleView _labelFont](self, "_labelFont");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    +[NCNotificationListLegibilityLabelCache sharedInstance](NCNotificationListLegibilityLabelCache, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListHeaderTitleView title](self, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "legibilityLabelForTitle:forSuperview:font:", v4, self, v9);
    v5 = (SBUILegibilityLabel *)objc_claimAutoreleasedReturnValue();
    titleLabel = self->_titleLabel;
    self->_titleLabel = v5;

    -[SBUILegibilityLabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
    -[SBUILegibilityLabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 4);
    LODWORD(v7) = 1036831949;
    -[SBUILegibilityLabel setHyphenationFactor:](self->_titleLabel, "setHyphenationFactor:", v7);
    -[SBUILegibilityLabel setOptions:](self->_titleLabel, "setOptions:", 2);
    -[SBUILegibilityLabel superview](self->_titleLabel, "superview");
    v8 = (NCNotificationListHeaderTitleView *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[SBUILegibilityLabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
    -[SBUILegibilityLabel setLegibilitySettings:](self->_titleLabel, "setLegibilitySettings:", self->_legibilitySettings);
    -[NCNotificationListHeaderTitleView addSubview:](self, "addSubview:", self->_titleLabel);

  }
}

- (void)_layoutTitleLabel
{
  SBUILegibilityLabel *titleLabel;

  titleLabel = self->_titleLabel;
  -[NCNotificationListHeaderTitleView bounds](self, "bounds");
  -[SBUILegibilityLabel setFrame:](titleLabel, "setFrame:");
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isPrimary
{
  return self->_primary;
}

- (SBUILegibilityLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
}

- (void)_setFontProvider:(id)a3
{
  objc_storeStrong((id *)&self->_fontProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontProvider, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
}

@end
