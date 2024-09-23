@implementation NCNotificationManagementView

- (NCNotificationManagementView)initWithIcon:(id)a3 title:(id)a4 subtitle:(id)a5 sectionSettings:(id)a6 criticalAlert:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NCNotificationManagementView *v16;
  NCNotificationManagementView *v17;
  void *v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)NCNotificationManagementView;
  v16 = -[NCNotificationManagementView init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_isCriticalAlert = a7;
    -[NCNotificationManagementView _configureIconIfNeccessary:](v16, "_configureIconIfNeccessary:", v12);
    -[NCNotificationManagementView _configureTitleIfNeccessary:](v17, "_configureTitleIfNeccessary:", v13);
    -[NCNotificationManagementView _configureSubtitleIfNeccessary:](v17, "_configureSubtitleIfNeccessary:", v14);
    -[NCNotificationManagementView _configureDeliveryButtonIfNeccessary:](v17, "_configureDeliveryButtonIfNeccessary:", v15);
    -[NCNotificationManagementView _configureExplanationIfNeccessary:](v17, "_configureExplanationIfNeccessary:", v15);
    -[NCNotificationManagementView _configureOnOffToggleButtonIfNeccessary:](v17, "_configureOnOffToggleButtonIfNeccessary:", v15);
    -[NCNotificationManagementView layer](v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAllowsGroupBlending:", 0);

  }
  return v17;
}

- (void)_configureIconIfNeccessary:(id)a3
{
  objc_class *v4;
  id v5;
  UIImageView *v6;
  UIImageView *icon;

  if (!self->_icon)
  {
    v4 = (objc_class *)MEMORY[0x1E0DC3890];
    v5 = a3;
    v6 = (UIImageView *)objc_msgSend([v4 alloc], "initWithImage:", v5);

    icon = self->_icon;
    self->_icon = v6;

    -[NCNotificationManagementView addSubview:](self, "addSubview:", self->_icon);
  }
}

- (void)_configureTitleIfNeccessary:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  UILabel *v8;
  UILabel *titleLabel;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  double v13;
  double v14;
  double v15;
  id v16;

  if (!self->_titleLabel)
  {
    v4 = (void *)MEMORY[0x1E0DC1358];
    v5 = *MEMORY[0x1E0DC4B48];
    v6 = a3;
    objc_msgSend(v4, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v5, 2, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B58], 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v8;

    -[UILabel setText:](self->_titleLabel, "setText:", v6);
    v10 = self->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v16, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v12 = self->_titleLabel;
    objc_msgSend(v7, "pointSize");
    v14 = v13;
    objc_msgSend(v16, "pointSize");
    -[UILabel setMinimumScaleFactor:](v12, "setMinimumScaleFactor:", v14 / v15);
    -[NCNotificationManagementView addSubview:](self, "addSubview:", self->_titleLabel);

  }
}

- (void)_configureSubtitleIfNeccessary:(id)a3
{
  objc_class *v4;
  id v5;
  UILabel *v6;
  UILabel *subtitleLabel;
  UILabel *v8;
  void *v9;

  if (!self->_subtitleLabel)
  {
    v4 = (objc_class *)MEMORY[0x1E0DC3990];
    v5 = a3;
    v6 = (UILabel *)objc_alloc_init(v4);
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v6;

    -[UILabel setText:](self->_subtitleLabel, "setText:", v5);
    v8 = self->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8, "setFont:", v9);

    -[NCNotificationManagementView addSubview:](self, "addSubview:", self->_subtitleLabel);
  }
}

- (void)_configureTopSeparatorIfNeccessary
{
  UIView *v3;
  UIView *topSeparator;

  if (!self->_topSeparator)
  {
    v3 = -[NCNotificationManagementView _newSeparatorView](self, "_newSeparatorView");
    topSeparator = self->_topSeparator;
    self->_topSeparator = v3;

    -[NCNotificationManagementView addSubview:](self, "addSubview:", self->_topSeparator);
    -[NCNotificationManagementView _updateTopSeparatorVisualStyling](self, "_updateTopSeparatorVisualStyling");
  }
}

- (void)_configureDeliveryButtonIfNeccessary:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  NCNotificationManagementBlueButton *v10;
  NCNotificationManagementBlueButton *deliveryButton;
  id v12;

  v4 = a3;
  if (!self->_deliveryButton && !self->_isCriticalAlert)
  {
    v12 = v4;
    v5 = objc_msgSend(v4, "isDeliveredQuietly");
    NCUserNotificationsUIKitFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      v8 = CFSTR("NOTIFICATION_MANAGEMENT_DELIVER_PROMINENTLY");
    else
      v8 = CFSTR("NOTIFICATION_MANAGEMENT_DELIVER_QUIETLY");
    objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E8D21F60, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[NCNotificationManagementBlueButton buttonWithTitle:](NCNotificationManagementBlueButton, "buttonWithTitle:", v9);
    v10 = (NCNotificationManagementBlueButton *)objc_claimAutoreleasedReturnValue();
    deliveryButton = self->_deliveryButton;
    self->_deliveryButton = v10;

    -[NCNotificationManagementView addSubview:](self, "addSubview:", self->_deliveryButton);
    v4 = v12;
  }

}

- (void)_configureOnOffToggleButtonIfNeccessary:(id)a3
{
  id v4;
  char v5;
  void *v6;
  const __CFString *v7;
  char v8;
  void *v9;
  NCNotificationManagementBlueButton *v10;
  NCNotificationManagementBlueButton *onOffToggleButton;
  id v12;

  v4 = a3;
  if (!self->_onOffToggleButton)
  {
    v12 = v4;
    if (self->_isCriticalAlert)
    {
      v5 = objc_msgSend(v4, "criticalAlertsEnabled");
      NCUserNotificationsUIKitFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v5 & 1) != 0)
        v7 = CFSTR("NOTIFICATION_MANAGEMENT_TURN_OFF_CRITICAL_ALERTS");
      else
        v7 = CFSTR("NOTIFICATION_MANAGEMENT_TURN_ON_CRITICAL_ALERTS");
    }
    else
    {
      v8 = objc_msgSend(v4, "notificationsEnabled");
      NCUserNotificationsUIKitFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 & 1) != 0)
        v7 = CFSTR("NOTIFICATION_MANAGEMENT_TURN_OFF_DEFAULT");
      else
        v7 = CFSTR("NOTIFICATION_MANAGEMENT_TURN_ON_DEFAULT");
    }
    objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1E8D21F60, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[NCNotificationManagementBlueButton buttonWithTitle:](NCNotificationManagementBlueButton, "buttonWithTitle:", v9);
    v10 = (NCNotificationManagementBlueButton *)objc_claimAutoreleasedReturnValue();
    onOffToggleButton = self->_onOffToggleButton;
    self->_onOffToggleButton = v10;

    -[NCNotificationManagementView addSubview:](self, "addSubview:", self->_onOffToggleButton);
    v4 = v12;
  }

}

- (void)_updateExplanationVisualStyling
{
  UILabel *explanation;
  void *v3;
  id v4;

  explanation = self->_explanation;
  if (explanation)
  {
    -[NCNotificationManagementView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_visualStylingForStyle:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel mt_replaceVisualStyling:](explanation, "mt_replaceVisualStyling:", v3);

  }
}

- (void)_configureExplanationIfNeccessary:(id)a3
{
  id v4;
  UILabel *v5;
  UILabel *explanation;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  if (!self->_explanation)
  {
    v18 = v4;
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    explanation = self->_explanation;
    self->_explanation = v5;

    if (self->_isCriticalAlert)
    {
      objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "deviceClass");

      if (v8 == 2)
      {
        NCUserNotificationsUIKitFrameworkBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("NOTIFICATION_MANAGEMENT_CRITICAL_EXPLANATION_IPAD");
LABEL_12:
        objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1E8D21F60, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[UILabel setText:](self->_explanation, "setText:", v15);
        -[UILabel setContentMode:](self->_explanation, "setContentMode:", 4);
        -[UILabel setTextAlignment:](self->_explanation, "setTextAlignment:", 1);
        objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0DC4AB8], 8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[UILabel setFont:](self->_explanation, "setFont:", v17);
        -[UILabel setNumberOfLines:](self->_explanation, "setNumberOfLines:", 0);
        -[NCNotificationManagementView _updateExplanationVisualStyling](self, "_updateExplanationVisualStyling");
        -[NCNotificationManagementView addSubview:](self, "addSubview:", self->_explanation);

        v4 = v18;
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "deviceClass");

      NCUserNotificationsUIKitFrameworkBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == 1)
        v11 = CFSTR("NOTIFICATION_MANAGEMENT_CRITICAL_EXPLANATION_IPOD");
      else
        v11 = CFSTR("NOTIFICATION_MANAGEMENT_CRITICAL_EXPLANATION_IPHONE");
    }
    else
    {
      v12 = objc_msgSend(v18, "isDeliveredQuietly");
      NCUserNotificationsUIKitFrameworkBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        v11 = CFSTR("NOTIFICATION_MANAGEMENT_PROMINENT_EXPLANATION");
      else
        v11 = CFSTR("NOTIFICATION_MANAGEMENT_QUIET_EXPLANATION");
    }
    v9 = v10;
    goto LABEL_12;
  }
LABEL_13:

}

- (double)_separatorHeight
{
  return 1.0 / _NCMainScreenScale();
}

- (void)_updateTopSeparatorVisualStyling
{
  UIView *topSeparator;
  void *v3;
  id v4;

  topSeparator = self->_topSeparator;
  if (topSeparator)
  {
    -[NCNotificationManagementView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_visualStylingForStyle:", 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView mt_replaceVisualStyling:](topSeparator, "mt_replaceVisualStyling:", v3);

  }
}

- (id)_newSeparatorView
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v2, "setUserInteractionEnabled:", 0);
  objc_msgSend(v2, "setAutoresizingMask:", 2);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return v2;
}

- (CGSize)_titleSizeForPlatterWidth:(double)a3
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  v3 = a3 + -32.0 + -40.0 + -16.0;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v3, 1.79769313e308);
  _NCMainScreenScale();
  UISizeRoundToScale();
  if (v4 >= v3)
    v4 = v3;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_explanationSizeForPlatterWidth:(double)a3
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  v3 = a3 + -32.0;
  -[UILabel sizeThatFits:](self->_explanation, "sizeThatFits:", a3 + -32.0, 1.79769313e308);
  _NCMainScreenScale();
  UISizeRoundToScale();
  v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  double Width;
  unsigned int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  void *v14;
  UILabel *titleLabel;
  void *v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  UILabel *subtitleLabel;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  NCNotificationManagementBlueButton *deliveryButton;
  NCNotificationManagementBlueButton *onOffToggleButton;
  UILabel *explanation;
  double v34;
  CGFloat v35;
  CGFloat v36;
  objc_super v37;
  objc_super v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v38.receiver = self;
  v38.super_class = (Class)NCNotificationManagementView;
  -[NCNotificationManagementView layoutSubviews](&v38, sel_layoutSubviews);
  -[NCNotificationManagementView _configureTopSeparatorIfNeccessary](self, "_configureTopSeparatorIfNeccessary");
  -[NCNotificationManagementView bounds](self, "bounds");
  Width = CGRectGetWidth(v39);
  v37.receiver = self;
  v37.super_class = (Class)NCNotificationManagementView;
  v4 = -[NCNotificationManagementView _shouldReverseLayoutDirection](&v37, sel__shouldReverseLayoutDirection);
  _NCMainScreenScale();
  UIRectIntegralWithScale();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIImageView setFrame:](self->_icon, "setFrame:");
  v35 = v8;
  v36 = v6;
  if ((v4 & 1) != 0)
  {
    -[UILabel frame](self->_titleLabel, "frame");
    v13 = CGRectGetWidth(v40);
  }
  -[UILabel font](self->_titleLabel, "font", v13, Width + -16.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lineHeight");

  -[NCNotificationManagementView _titleSizeForPlatterWidth:](self, "_titleSizeForPlatterWidth:", Width);
  titleLabel = self->_titleLabel;
  _NCMainScreenScale();
  UIRectIntegralWithScale();
  -[UILabel setFrame:](titleLabel, "setFrame:");
  -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_titleLabel, "_firstLineBaselineOffsetFromBoundsTop");
  -[UILabel font](self->_subtitleLabel, "font");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_scaledValueForValue:", 24.0);

  v17 = NCRectWithSize();
  v19 = v18;
  v34 = Width;
  v21 = v20;
  v23 = v22;
  -[UILabel setBounds:](self->_subtitleLabel, "setBounds:");
  -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_subtitleLabel, "_firstLineBaselineOffsetFromBoundsTop");
  if (v4)
  {
    v41.origin.x = v17;
    v41.origin.y = v19;
    v41.size.width = v21;
    v41.size.height = v23;
    CGRectGetWidth(v41);
  }
  v42.origin.y = v35;
  v42.origin.x = v36;
  v42.size.height = v12;
  v42.size.width = v10;
  CGRectGetMaxY(v42);
  subtitleLabel = self->_subtitleLabel;
  _NCMainScreenScale();
  UIRectIntegralWithScale();
  -[UILabel setFrame:](subtitleLabel, "setFrame:");
  -[UILabel font](self->_subtitleLabel, "font");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_scaledValueForValue:", 8.0);

  _NCMainScreenScale();
  UIPointRoundToScale();
  v27 = v26;
  v29 = v28;
  -[NCNotificationManagementView _separatorHeight](self, "_separatorHeight");
  -[UIView setFrame:](self->_topSeparator, "setFrame:", v27, v29, v34, v30);
  -[NCNotificationManagementView _separatorHeight](self, "_separatorHeight");
  deliveryButton = self->_deliveryButton;
  if (deliveryButton)
  {
    _NCMainScreenScale();
    UIRectIntegralWithScale();
    -[NCNotificationManagementBlueButton setFrame:](deliveryButton, "setFrame:");
  }
  onOffToggleButton = self->_onOffToggleButton;
  _NCMainScreenScale();
  UIRectIntegralWithScale();
  -[NCNotificationManagementBlueButton setFrame:](onOffToggleButton, "setFrame:");
  -[NCNotificationManagementView _explanationSizeForPlatterWidth:](self, "_explanationSizeForPlatterWidth:", v34);
  explanation = self->_explanation;
  _NCMainScreenScale();
  UIRectIntegralWithScale();
  -[UILabel setFrame:](explanation, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  width = a3.width;
  -[NCNotificationManagementView _configureTopSeparatorIfNeccessary](self, "_configureTopSeparatorIfNeccessary", a3.width, a3.height);
  -[NCNotificationManagementView _titleSizeForPlatterWidth:](self, "_titleSizeForPlatterWidth:", width);
  if (v5 <= 44.0)
    v6 = 60.0;
  else
    v6 = v5 + 16.0;
  -[UILabel font](self->_subtitleLabel, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_scaledValueForValue:", 32.0);
  v9 = v6 + v8;

  -[NCNotificationManagementView _separatorHeight](self, "_separatorHeight");
  v11 = v9 + v10 + 8.0;
  if (self->_deliveryButton)
    v11 = v11 + 58.0;
  v12 = v11 + 82.0;
  -[NCNotificationManagementView _explanationSizeForPlatterWidth:](self, "_explanationSizeForPlatterWidth:", width);
  v14 = v13 + v12 + 16.0;
  v15 = width;
  result.height = v14;
  result.width = v15;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationManagementView;
  -[NCNotificationManagementView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[NSMutableDictionary removeAllObjects](self->_categoriesToProviders, "removeAllObjects");
  -[NCNotificationManagementView _updateTopSeparatorVisualStyling](self, "_updateTopSeparatorVisualStyling");
  -[NCNotificationManagementView _updateExplanationVisualStyling](self, "_updateExplanationVisualStyling");
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  NSMutableDictionary *v5;
  NSMutableDictionary *categoriesToProviders;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (!self->_categoriesToProviders)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    categoriesToProviders = self->_categoriesToProviders;
    self->_categoriesToProviders = v5;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_categoriesToProviders, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = (void *)MEMORY[0x1E0D474B8];
    -[NCNotificationManagementView traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 53, a3, objc_msgSend(v10, "userInterfaceStyle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[NSMutableDictionary setObject:forKey:](self->_categoriesToProviders, "setObject:forKey:", v8, v7);
  }

  return v8;
}

- (NCNotificationManagementBlueButton)deliveryButton
{
  return self->_deliveryButton;
}

- (NCNotificationManagementBlueButton)onOffToggleButton
{
  return self->_onOffToggleButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoriesToProviders, 0);
  objc_storeStrong((id *)&self->_bottomSeparator, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_deliveryButton, 0);
  objc_storeStrong((id *)&self->_onOffToggleButton, 0);
  objc_storeStrong((id *)&self->_topSeparator, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
