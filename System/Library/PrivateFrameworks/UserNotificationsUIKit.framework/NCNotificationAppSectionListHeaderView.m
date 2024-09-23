@implementation NCNotificationAppSectionListHeaderView

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  void *v4;
  char v5;
  UILabel *titleLabel;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[UILabel text](self->_titleLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v10);

  if ((v5 & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (!titleLabel)
    {
      v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      v8 = self->_titleLabel;
      self->_titleLabel = v7;

      -[NCNotificationAppSectionListHeaderView addSubview:](self, "addSubview:", self->_titleLabel);
      titleLabel = self->_titleLabel;
    }
    -[UILabel setText:](titleLabel, "setText:", v10);
    -[NCNotificationAppSectionListHeaderView _updateTextAttributesForTitleTextLabel](self, "_updateTextAttributesForTitleTextLabel");
    -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_titleLabel, 0, v9, 0);
    -[NCNotificationAppSectionListHeaderView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setIcons:(id)a3
{
  void *v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  UIImage **p_darkIcon;
  void *v11;
  UIImage *lightIcon;
  UIImageView *iconImageView;
  UIImageView *v14;
  UIImageView *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v3)
      v6 = 0;
    else
      v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong((id *)&self->_lightIcon, v6);
  if (v5)

  if ((unint64_t)objc_msgSend(v17, "count") <= 1)
  {

    v8 = 0;
    v9 = 0;
    v7 = 1;
  }
  else
  {
    v7 = 1;
    objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      if (v8 == v5)
        v9 = 0;
      else
        v9 = v8;
    }
    else
    {
      v9 = 0;
    }
  }
  p_darkIcon = &self->_darkIcon;
  objc_storeStrong((id *)&self->_darkIcon, v9);
  if ((v7 & 1) == 0)

  -[NCNotificationAppSectionListHeaderView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "userInterfaceStyle") != 2 || (lightIcon = *p_darkIcon) == 0)
    lightIcon = self->_lightIcon;
  objc_storeStrong((id *)&self->_icon, lightIcon);

  iconImageView = self->_iconImageView;
  if (!iconImageView)
  {
    v14 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    v15 = self->_iconImageView;
    self->_iconImageView = v14;

    -[UIImageView setContentMode:](self->_iconImageView, "setContentMode:", 1);
    -[NCNotificationAppSectionListHeaderView addSubview:](self, "addSubview:", self->_iconImageView);
    iconImageView = self->_iconImageView;
  }
  -[UIImageView setImage:](iconImageView, "setImage:", self->_icon);
  -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListBaseContentView _updateVisualStylingOfImageView:ifSymbolImageWithStyle:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfImageView:ifSymbolImageWithStyle:visualStylingProvider:outgoingProvider:", self->_iconImageView, 0, v16, v16);
  -[NCNotificationAppSectionListHeaderView setNeedsLayout](self, "setNeedsLayout");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  UILabel *titleLabel;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;
  CGRect v14;
  CGRect v15;

  height = a3.height;
  width = a3.width;
  -[NCNotificationAppSectionListHeaderOptionsButton frame](self->_optionsButton, "frame");
  v6 = CGRectGetWidth(v14);
  titleLabel = self->_titleLabel;
  if (titleLabel)
    -[UILabel unui_measuringHeightWithNumberOfLines:](titleLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationAppSectionListHeaderView _numberOfLinesForTitleTextInFrame:](self, "_numberOfLinesForTitleTextInFrame:", 0.0, 0.0, width + -22.0 + -6.0 - v6 + -8.0 + -10.0, height));
  -[NCNotificationAppSectionListHeaderOptionsButton frame](self->_optionsButton, "frame");
  CGRectGetHeight(v15);
  -[NCNotificationAppSectionListHeaderView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  UICeilToScale();
  v10 = v9;

  v11 = width;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationAppSectionListHeaderView;
  -[NCNotificationAppSectionListHeaderView layoutSubviews](&v3, sel_layoutSubviews);
  -[NCNotificationAppSectionListHeaderView _configureOptionsButtonIfNecessary](self, "_configureOptionsButtonIfNecessary");
  -[NCNotificationAppSectionListHeaderView _layoutIconImageView](self, "_layoutIconImageView");
  -[NCNotificationAppSectionListHeaderView _layoutOptionsButton](self, "_layoutOptionsButton");
  -[NCNotificationAppSectionListHeaderView _layoutTitleLabel](self, "_layoutTitleLabel");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  int64_t v5;
  UIImage *lightIcon;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NCNotificationAppSectionListHeaderView;
  -[NCNotificationAppSectionListHeaderView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, a3);
  -[NCNotificationAppSectionListHeaderView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  if (self->_userInterfaceStyle != v5)
  {
    self->_userInterfaceStyle = v5;
    if (v5 != 2 || (lightIcon = self->_darkIcon) == 0)
      lightIcon = self->_lightIcon;
    objc_storeStrong((id *)&self->_icon, lightIcon);
    -[UIImageView setImage:](self->_iconImageView, "setImage:", self->_icon);
    -[NCNotificationAppSectionListHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  NCNotificationAppSectionListHeaderOptionsButton *optionsButton;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationAppSectionListHeaderView;
  -[NCNotificationListBaseContentView adjustForContentSizeCategoryChange](&v5, sel_adjustForContentSizeCategoryChange);
  -[NCNotificationAppSectionListHeaderOptionsButton removeFromSuperview](self->_optionsButton, "removeFromSuperview");
  optionsButton = self->_optionsButton;
  self->_optionsButton = 0;

  -[NCNotificationAppSectionListHeaderView _configureOptionsButtonIfNecessary](self, "_configureOptionsButtonIfNecessary");
  -[NCNotificationAppSectionListHeaderView setNeedsLayout](self, "setNeedsLayout");
  return 1;
}

- (void)_layoutIconImageView
{
  UIImageView *iconImageView;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGRect v12;

  iconImageView = self->_iconImageView;
  if (iconImageView)
  {
    -[UIImageView frame](iconImageView, "frame");
    -[NCNotificationAppSectionListHeaderView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    if (-[NCNotificationAppSectionListHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      v12.origin.x = v5;
      v12.origin.y = v7;
      v12.size.width = v9;
      v12.size.height = v11;
      CGRectGetMaxX(v12);
    }
    -[NCNotificationAppSectionListHeaderView bounds](self, "bounds");
    UIRectCenteredYInRectScale();
    UIRectIntegralWithScale();
    -[UIImageView setFrame:](self->_iconImageView, "setFrame:");
  }
}

- (void)_layoutTitleLabel
{
  UILabel *titleLabel;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double Height;
  int v14;
  uint64_t v15;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel frame](titleLabel, "frame");
    -[NCNotificationAppSectionListHeaderView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[NCNotificationAppSectionListHeaderOptionsButton frame](self->_optionsButton, "frame");
    v12 = v9 - (CGRectGetWidth(v27) + 28.0 + 8.0 + 10.0);
    v28.origin.x = v5;
    v28.origin.y = v7;
    v28.size.width = v9;
    v28.size.height = v11;
    Height = CGRectGetHeight(v28);
    -[UILabel unui_measuringHeightWithNumberOfLines:](self->_titleLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationAppSectionListHeaderView _numberOfLinesForTitleTextInFrame:](self, "_numberOfLinesForTitleTextInFrame:", 0.0, 0.0, v12, Height));
    v14 = -[NCNotificationAppSectionListHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    -[UIImageView frame](self->_iconImageView, "frame");
    if (v14)
      CGRectGetMinX(*(CGRect *)&v15);
    else
      CGRectGetMaxX(*(CGRect *)&v15);
    UIRectCenteredYInRectScale();
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    -[UILabel unui_drawingHeightWithNumberOfLines:](self->_titleLabel, "unui_drawingHeightWithNumberOfLines:", -[NCNotificationAppSectionListHeaderView _numberOfLinesForTitleTextInFrame:](self, "_numberOfLinesForTitleTextInFrame:", 0.0, 0.0, v12, Height, 0));
    v29.origin.x = v20;
    v29.origin.y = v22;
    v29.size.width = v24;
    v29.size.height = v26;
    CGRectGetWidth(v29);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    UIRectIntegralWithScale();
    -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  }
}

- (void)_layoutOptionsButton
{
  NCNotificationAppSectionListHeaderOptionsButton *optionsButton;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGRect v13;

  optionsButton = self->_optionsButton;
  if (optionsButton)
  {
    -[NCNotificationAppSectionListHeaderOptionsButton frame](optionsButton, "frame");
    -[NCNotificationAppSectionListHeaderView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[NCNotificationAppSectionListHeaderOptionsButton sizeThatFits:](self->_optionsButton, "sizeThatFits:", v8, v10);
    -[NCNotificationAppSectionListHeaderOptionsButton _setContinuousCornerRadius:](self->_optionsButton, "_setContinuousCornerRadius:", v12 * 0.5);
    if ((-[NCNotificationAppSectionListHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") & 1) == 0)
    {
      v13.origin.x = v5;
      v13.origin.y = v7;
      v13.size.width = v9;
      v13.size.height = v11;
      CGRectGetMaxX(v13);
    }
    -[NCNotificationAppSectionListHeaderView bounds](self, "bounds");
    UIRectCenteredYInRectScale();
    UIRectIntegralWithScale();
    -[NCNotificationAppSectionListHeaderOptionsButton setFrame:](self->_optionsButton, "setFrame:");
  }
}

- (void)_configureOptionsButtonIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  NCNotificationAppSectionListHeaderOptionsButton *v6;
  NCNotificationAppSectionListHeaderOptionsButton *optionsButton;
  NCNotificationAppSectionListHeaderOptionsButton *v8;
  void *v9;
  void *v10;
  id v11;

  if (!self->_optionsButton)
  {
    v3 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configurationWithFont:scale:", v4, 2);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("ellipsis"), v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[NCNotificationAppSectionListHeaderOptionsButton systemButtonWithImage:target:action:](NCNotificationAppSectionListHeaderOptionsButton, "systemButtonWithImage:target:action:", v5, self, sel_didTapOptionsButton_);
    v6 = (NCNotificationAppSectionListHeaderOptionsButton *)objc_claimAutoreleasedReturnValue();
    optionsButton = self->_optionsButton;
    self->_optionsButton = v6;

    v8 = self->_optionsButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationAppSectionListHeaderOptionsButton setTintColor:](v8, "setTintColor:", v9);

    -[NCNotificationAppSectionListHeaderOptionsButton setAlpha:](self->_optionsButton, "setAlpha:", 1.0);
    -[NCNotificationAppSectionListHeaderOptionsButton _setTouchInsets:](self->_optionsButton, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_optionsButton, 1, v10, 0);
    -[NCNotificationAppSectionListHeaderView addSubview:](self, "addSubview:", self->_optionsButton);

  }
}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  UIImageView *iconImageView;
  id v8;
  id v9;

  iconImageView = self->_iconImageView;
  v8 = a5;
  v9 = a3;
  -[NCNotificationListBaseContentView _updateVisualStylingOfImageView:ifSymbolImageWithStyle:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfImageView:ifSymbolImageWithStyle:visualStylingProvider:outgoingProvider:", iconImageView, 0, v9, v8);
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_titleLabel, 0, v9, v8);
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_optionsButton, 1, v9, v8);

}

- (unint64_t)_maximumNumberOfLinesForTitleText
{
  NSString *v2;
  unint64_t v3;

  -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v2))
    v3 = 0;
  else
    v3 = 2;

  return v3;
}

- (unint64_t)_numberOfLinesForTitleTextInFrame:(CGRect)a3
{
  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", self->_titleLabel, -[NCNotificationAppSectionListHeaderView _maximumNumberOfLinesForTitleText](self, "_maximumNumberOfLinesForTitleText"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_updateTextAttributes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationAppSectionListHeaderView;
  -[NCNotificationListBaseContentView _updateTextAttributes](&v3, sel__updateTextAttributes);
  -[NCNotificationAppSectionListHeaderView _updateTextAttributesForTitleTextLabel](self, "_updateTextAttributesForTitleTextLabel");
}

- (void)_updateTextAttributesForTitleTextLabel
{
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  id *v5;
  id v6;

  if (self->_titleLabel)
  {
    -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);
    v5 = (id *)MEMORY[0x1E0DC4A88];
    if (!IsAccessibilityCategory)
      v5 = (id *)MEMORY[0x1E0DC4B60];
    v6 = *v5;

    -[NCNotificationListBaseContentView _updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:](self, "_updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:", self->_titleLabel, v6, 0, -[NCNotificationAppSectionListHeaderView _maximumNumberOfLinesForTitleText](self, "_maximumNumberOfLinesForTitleText"), *MEMORY[0x1E0DC1448]);
    -[NCNotificationAppSectionListHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)didTapOptionsButton:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationAppSectionListHeaderView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appSectionListHeaderView:didRequestPresentingOptionsMenuFromView:", self, v4);

}

- (NCNotificationAppSectionListHeaderViewDelegate)delegate
{
  return (NCNotificationAppSectionListHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)icons
{
  return self->_icons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icons, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_optionsButton, 0);
  objc_storeStrong((id *)&self->_darkIcon, 0);
  objc_storeStrong((id *)&self->_lightIcon, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
