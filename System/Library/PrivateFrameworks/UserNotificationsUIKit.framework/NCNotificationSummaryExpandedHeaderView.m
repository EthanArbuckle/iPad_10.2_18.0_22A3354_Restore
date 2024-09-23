@implementation NCNotificationSummaryExpandedHeaderView

- (NCNotificationSummaryExpandedHeaderView)initWithFrame:(CGRect)a3
{
  NCNotificationSummaryExpandedHeaderView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationSummaryExpandedHeaderView;
  result = -[NCNotificationListBaseContentView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_onboarding = 0;
    result->_animateCollapseButtonLayout = 0;
  }
  return result;
}

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

      -[NCNotificationSummaryExpandedHeaderView addSubview:](self, "addSubview:", self->_titleLabel);
      -[NCNotificationSummaryExpandedHeaderView _updateTextAttributesForTitleTextLabel](self, "_updateTextAttributesForTitleTextLabel");
      -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_titleLabel, 0, v9, 0);

      titleLabel = self->_titleLabel;
    }
    -[UILabel setText:](titleLabel, "setText:", v10);
    -[NCNotificationSummaryExpandedHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)subtitle
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (void)setSubtitle:(id)a3
{
  void *v4;
  char v5;
  UILabel *subtitleLabel;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[UILabel text](self->_subtitleLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v10);

  if ((v5 & 1) == 0)
  {
    subtitleLabel = self->_subtitleLabel;
    if (!subtitleLabel)
    {
      v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      v8 = self->_subtitleLabel;
      self->_subtitleLabel = v7;

      -[NCNotificationSummaryExpandedHeaderView addSubview:](self, "addSubview:", self->_subtitleLabel);
      -[NCNotificationSummaryExpandedHeaderView _updateTextAttributesForSubtitleTextLabel](self, "_updateTextAttributesForSubtitleTextLabel");
      -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_subtitleLabel, 0, v9, 0);

      subtitleLabel = self->_subtitleLabel;
    }
    -[UILabel setText:](subtitleLabel, "setText:", v10);
    -[NCNotificationSummaryExpandedHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setDate:(id)a3
{
  NSDate *v4;
  NSDate *date;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSDate *)objc_msgSend(v6, "copy");
    date = self->_date;
    self->_date = v4;

    -[NCNotificationSummaryExpandedHeaderView _tearDownTimeStampLabel](self, "_tearDownTimeStampLabel");
    -[NCNotificationSummaryExpandedHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTimeZone:(id)a3
{
  NSTimeZone *v4;
  NSTimeZone *timeZone;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSTimeZone *)objc_msgSend(v6, "copy");
    timeZone = self->_timeZone;
    self->_timeZone = v4;

    -[NCNotificationSummaryExpandedHeaderView _tearDownTimeStampLabel](self, "_tearDownTimeStampLabel");
    -[NCNotificationSummaryExpandedHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setDateFormatStyle:(int64_t)a3
{
  if (self->_dateFormatStyle != a3)
  {
    self->_dateFormatStyle = a3;
    -[NCNotificationSummaryExpandedHeaderView _tearDownTimeStampLabel](self, "_tearDownTimeStampLabel");
    -[NCNotificationSummaryExpandedHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOnboarding:(BOOL)a3
{
  UIButton *onboardingAcceptButton;
  UIButton *onboardingRejectButton;

  if (self->_onboarding != a3)
  {
    self->_onboarding = a3;
    if (!a3)
    {
      -[UIButton removeFromSuperview](self->_onboardingAcceptButton, "removeFromSuperview");
      onboardingAcceptButton = self->_onboardingAcceptButton;
      self->_onboardingAcceptButton = 0;

      -[UIButton removeFromSuperview](self->_onboardingRejectButton, "removeFromSuperview");
      onboardingRejectButton = self->_onboardingRejectButton;
      self->_onboardingRejectButton = 0;

    }
    -[NCNotificationSummaryExpandedHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  BSUIDateLabel *timeStampLabel;
  void *v7;
  double v8;
  UILabel *titleLabel;
  UILabel *subtitleLabel;
  double v11;
  double v12;
  NSString *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  timeStampLabel = self->_timeStampLabel;
  if (timeStampLabel)
  {
    -[BSUIDateLabel font](timeStampLabel, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lineHeight");

  }
  v8 = width + -6.0;
  titleLabel = self->_titleLabel;
  if (titleLabel)
    -[UILabel unui_measuringHeightWithNumberOfLines:](titleLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationSummaryExpandedHeaderView _numberOfLinesForTitleTextInFrame:](self, "_numberOfLinesForTitleTextInFrame:", 0.0, 0.0, v8, height));
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
    -[UILabel unui_measuringHeightWithNumberOfLines:](subtitleLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationSummaryExpandedHeaderView _numberOfLinesForSubtitleTextInFrame:](self, "_numberOfLinesForSubtitleTextInFrame:", 0.0, 0.0, v8, height));
  if (-[NCNotificationSummaryExpandedHeaderView isOnboarding](self, "isOnboarding"))
  {
    -[NCNotificationSummaryExpandedHeaderView _allowedWidthForButtonInRect:](self, "_allowedWidthForButtonInRect:", 0.0, 0.0, width, height);
    v12 = v11;
    -[UIButton sizeThatFits:](self->_onboardingAcceptButton, "sizeThatFits:");
    -[UIButton sizeThatFits:](self->_onboardingRejectButton, "sizeThatFits:", v12, height);
    -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    UIContentSizeCategoryIsAccessibilityCategory(v13);

  }
  -[NCNotificationSummaryExpandedHeaderView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayScale");
  UICeilToScale();
  v16 = v15;

  v17 = width;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationSummaryExpandedHeaderView;
  -[NCNotificationSummaryExpandedHeaderView layoutSubviews](&v3, sel_layoutSubviews);
  -[NCNotificationSummaryExpandedHeaderView _configureTimeStampLabelIfNecessary](self, "_configureTimeStampLabelIfNecessary");
  -[NCNotificationSummaryExpandedHeaderView _configureDividerViewIfNecessary](self, "_configureDividerViewIfNecessary");
  -[NCNotificationSummaryExpandedHeaderView _configureOnboardingButtonsIfNecessary](self, "_configureOnboardingButtonsIfNecessary");
  -[NCNotificationSummaryExpandedHeaderView _configureControlsViewIfNecessary](self, "_configureControlsViewIfNecessary");
  -[NCNotificationSummaryExpandedHeaderView _layoutTimeStampLabel](self, "_layoutTimeStampLabel");
  -[NCNotificationSummaryExpandedHeaderView _layoutControlsView](self, "_layoutControlsView");
  -[NCNotificationSummaryExpandedHeaderView _layoutTitleLabel](self, "_layoutTitleLabel");
  -[NCNotificationSummaryExpandedHeaderView _layoutSubtitleLabel](self, "_layoutSubtitleLabel");
  -[NCNotificationSummaryExpandedHeaderView _layoutOnboardingButtons](self, "_layoutOnboardingButtons");
  -[NCNotificationSummaryExpandedHeaderView _layoutDividerView](self, "_layoutDividerView");
}

- (void)_configureDividerViewIfNecessary
{
  id v3;
  UIView *v4;
  UIView *dividerView;
  UIView *v6;
  void *v7;
  UIView *v8;
  void *v9;

  if (self->_onboarding && !self->_dividerView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    dividerView = self->_dividerView;
    self->_dividerView = v4;

    v6 = self->_dividerView;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    v8 = self->_dividerView;
    -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v8, 3, v9, 0);

    -[NCNotificationSummaryExpandedHeaderView addSubview:](self, "addSubview:", self->_dividerView);
  }
}

- (void)_configureOnboardingButtonsIfNecessary
{
  void *v3;
  void *v4;
  UIButton *v5;
  UIButton *onboardingAcceptButton;
  void *v7;
  void *v8;
  UIButton *v9;
  UIButton *onboardingRejectButton;

  if (self->_onboarding)
  {
    if (self->_onboardingAcceptButton)
      goto LABEL_4;
    NCUserNotificationsUIKitFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_SUMMARY_ONBOARDING_SUGGESTION_BUTTON_TITLE_ACCEPT"), &stru_1E8D21F60, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[NCNotificationSummaryExpandedHeaderView _newOnboardingButtonWithTitle:](self, "_newOnboardingButtonWithTitle:", v4);
    onboardingAcceptButton = self->_onboardingAcceptButton;
    self->_onboardingAcceptButton = v5;

    -[UIButton addTarget:action:forControlEvents:](self->_onboardingAcceptButton, "addTarget:action:forControlEvents:", self, sel__summaryOnboardingAccepted_, 64);
    if (self->_onboarding)
    {
LABEL_4:
      if (!self->_onboardingRejectButton)
      {
        NCUserNotificationsUIKitFrameworkBundle();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_SUMMARY_ONBOARDING_SUGGESTION_BUTTON_TITLE_REJECT"), &stru_1E8D21F60, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[NCNotificationSummaryExpandedHeaderView _newOnboardingButtonWithTitle:](self, "_newOnboardingButtonWithTitle:", v8);
        onboardingRejectButton = self->_onboardingRejectButton;
        self->_onboardingRejectButton = v9;

        -[UIButton addTarget:action:forControlEvents:](self->_onboardingRejectButton, "addTarget:action:forControlEvents:", self, sel__summaryOnboardingRejected_, 64);
      }
    }
  }
}

- (id)_newOnboardingButtonWithTitle:(id)a3
{
  id v4;
  NCNotificationSummaryOnboardingButton *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(NCNotificationSummaryOnboardingButton);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationSummaryOnboardingButton setTitleColor:forState:](v5, "setTitleColor:forState:", v6, 0);

  -[NCNotificationSummaryOnboardingButton setTitle:forState:](v5, "setTitle:forState:", v4, 0);
  -[NCNotificationSummaryExpandedHeaderView _updateTextAttributesForButtonLabel:](self, "_updateTextAttributesForButtonLabel:", v5);
  -[NCNotificationSummaryOnboardingButton titleLabel](v5, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 1);

  -[NCNotificationSummaryExpandedHeaderView addSubview:](self, "addSubview:", v5);
  return v5;
}

- (void)_configureControlsViewIfNecessary
{
  _QWORD v2[5];

  if (!self->_controlsView)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __76__NCNotificationSummaryExpandedHeaderView__configureControlsViewIfNecessary__block_invoke;
    v2[3] = &unk_1E8D1B568;
    v2[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
  }
}

void __76__NCNotificationSummaryExpandedHeaderView__configureControlsViewIfNecessary__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v2 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 512);
  *(_QWORD *)(v4 + 512) = v3;

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "materialGroupNameBaseForNotificationSummaryExpandedHeaderView:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B60]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationWithFont:scale:", v8, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("chevron.down"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3C0]), "initWithMaterialRecipe:", 1);
  objc_msgSend(v11, "setGlyph:", v10);
  objc_msgSend(v11, "setMaterialGroupNameBase:", v6);
  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("notification-summary-collapse-control"));
  objc_msgSend(v11, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__handleCollapseControlPrimaryAction_, 0x2000);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "addSubview:", v11);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 496);
  *(_QWORD *)(v12 + 496) = v11;
  v14 = v11;

  NCUserNotificationsUIKitFrameworkBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_CLEAR_ALL"), &stru_1E8D21F60, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[NCToggleControl dismissControlWithMaterialRecipe:clearAllText:](NCToggleControl, "dismissControlWithMaterialRecipe:clearAllText:", 1, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v17, "setMaterialGroupNameBase:", v6);
  objc_msgSend(v17, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v17, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__handleClearControlTouchUpInside_, 64);
  objc_msgSend(v17, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__handleClearControlPrimaryAction_, 0x2000);
  objc_msgSend(v17, "addTarget:forPreviewInteractionPresentedContentWithAction:", *(_QWORD *)(a1 + 32), sel__handleClearAll_);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "addSubview:", v17);
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 504);
  *(_QWORD *)(v18 + 504) = v17;

}

- (void)_handleClearControlTouchUpInside:(id)a3
{
  void *v4;

  -[NCNotificationSummaryExpandedHeaderView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationSummaryExpandedHeaderView:didTransitionToClearState:", self, -[NCToggleControl isExpanded](self->_clearControl, "isExpanded") ^ 1);

  self->_animateCollapseButtonLayout = 1;
  -[NCNotificationSummaryExpandedHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_handleClearControlPrimaryAction:(id)a3
{
  id v4;

  -[NCNotificationSummaryExpandedHeaderView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationSummaryExpandedHeaderViewRequestsClearingSummary:", self);

}

- (void)_handleCollapseControlPrimaryAction:(id)a3
{
  int v4;
  double v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  CGAffineTransform v9;
  CGAffineTransform v10;

  self->_animateCollapseButtonLayout = 0;
  -[NCNotificationSummaryExpandedHeaderView setNeedsLayout](self, "setNeedsLayout", a3);
  memset(&v10, 0, sizeof(v10));
  v4 = -[NCNotificationSummaryExpandedHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v5 = 1.57;
  if (v4)
    v5 = -1.57;
  CGAffineTransformMakeRotation(&v10, v5);
  v8[0] = MEMORY[0x1E0C809B0];
  v9 = v10;
  v8[1] = 3221225472;
  v8[2] = __79__NCNotificationSummaryExpandedHeaderView__handleCollapseControlPrimaryAction___block_invoke;
  v8[3] = &unk_1E8D1CD98;
  v8[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__NCNotificationSummaryExpandedHeaderView__handleCollapseControlPrimaryAction___block_invoke_2;
  v7[3] = &unk_1E8D1B8A8;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v8, v7, 200.0, 25.0);
  -[NCNotificationSummaryExpandedHeaderView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationSummaryExpandedHeaderViewRequestsCollapsingSummary:", self);

}

uint64_t __79__NCNotificationSummaryExpandedHeaderView__handleCollapseControlPrimaryAction___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 496);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __79__NCNotificationSummaryExpandedHeaderView__handleCollapseControlPrimaryAction___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 496);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setExpanded:", 0);
}

- (void)_handleClearAll:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "notificationSummaryExpandedHeaderViewRequestsClearAll:", self);
  -[NCToggleControl dismissModalFullScreenIfNeeded](self->_clearControl, "dismissModalFullScreenIfNeeded");

}

- (void)_layoutTimeStampLabel
{
  BSUIDateLabel *timeStampLabel;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  CGRect v14;

  timeStampLabel = self->_timeStampLabel;
  if (timeStampLabel)
  {
    -[BSUIDateLabel frame](timeStampLabel, "frame");
    -[NCNotificationSummaryExpandedHeaderView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[NCNotificationSummaryExpandedHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v14.origin.x = v5;
    v14.origin.y = v7;
    v14.size.width = v9;
    v14.size.height = v11;
    CGRectGetWidth(v14);
    -[BSUIDateLabel font](self->_timeStampLabel, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lineHeight");
    -[NCNotificationSummaryExpandedHeaderView traitCollection](self, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayScale");
    UICeilToScale();

    UIRectIntegralWithScale();
    -[BSUIDateLabel setFrame:](self->_timeStampLabel, "setFrame:");
  }
}

- (void)_layoutControlsView
{
  UIView *controlsView;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  _QWORD v23[9];
  CGRect v24;

  controlsView = self->_controlsView;
  if (controlsView)
  {
    -[UIView frame](controlsView, "frame");
    -[NCNotificationSummaryExpandedHeaderView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[NCToggleControl sizeThatFits:](self->_clearControl, "sizeThatFits:", v8, v10);
    -[NCNotificationSummaryExpandedHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    UIRectIntegralWithScale();
    -[NCToggleControl setFrame:](self->_clearControl, "setFrame:");
    -[NCToggleControl layoutIfNeeded](self->_clearControl, "layoutIfNeeded");
    v12 = -[NCNotificationSummaryExpandedHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    -[PLGlyphControl _backgroundMaterialView](self->_clearControl, "_backgroundMaterialView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    if ((v12 & 1) != 0)
      CGRectGetMaxX(*(CGRect *)&v14);
    else
      CGRectGetMinX(*(CGRect *)&v14);

    -[NCNotificationSummaryExpandedHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    UIRectIntegralWithScale();
    if (self->_animateCollapseButtonLayout)
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __62__NCNotificationSummaryExpandedHeaderView__layoutControlsView__block_invoke;
      v23[3] = &unk_1E8D1BD70;
      v23[4] = self;
      v23[5] = v18;
      v23[6] = v19;
      v23[7] = v20;
      v23[8] = v21;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __62__NCNotificationSummaryExpandedHeaderView__layoutControlsView__block_invoke_2;
      v22[3] = &unk_1E8D1B8A8;
      v22[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v23, v22, 200.0, 25.0);
    }
    else
    {
      -[PLGlyphControl setFrame:](self->_collapseControl, "setFrame:");
    }
    if ((-[NCNotificationSummaryExpandedHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") & 1) == 0)
    {
      v24.origin.x = v5;
      v24.origin.y = v7;
      v24.size.width = v9;
      v24.size.height = v11;
      CGRectGetMaxX(v24);
    }
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_controlsView, "setFrame:");
  }
}

uint64_t __62__NCNotificationSummaryExpandedHeaderView__layoutControlsView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __62__NCNotificationSummaryExpandedHeaderView__layoutControlsView__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 520) = 0;
  return result;
}

- (void)_layoutTitleLabel
{
  UILabel *titleLabel;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  BSUIDateLabel *timeStampLabel;
  double v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel frame](titleLabel, "frame");
    -[NCNotificationSummaryExpandedHeaderView bounds](self, "bounds");
    x = v15.origin.x;
    y = v15.origin.y;
    width = v15.size.width;
    height = v15.size.height;
    v8 = v15.size.width + -6.0;
    v9 = CGRectGetHeight(v15);
    -[UILabel unui_measuringHeightWithNumberOfLines:](self->_titleLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationSummaryExpandedHeaderView _numberOfLinesForTitleTextInFrame:](self, "_numberOfLinesForTitleTextInFrame:", 0.0, 0.0, v8, v9));
    v11 = v10;
    v12 = 6.0;
    if (-[NCNotificationSummaryExpandedHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      v16.origin.x = x;
      v16.origin.y = y;
      v16.size.width = width;
      v16.size.height = height;
      v12 = CGRectGetMaxX(v16) + -6.0 - v8;
    }
    timeStampLabel = self->_timeStampLabel;
    if (timeStampLabel)
    {
      -[BSUIDateLabel frame](timeStampLabel, "frame");
      v14 = CGRectGetMaxY(v17) + 2.0;
    }
    else
    {
      v14 = 55.0;
    }
    -[UILabel unui_drawingHeightWithNumberOfLines:](self->_titleLabel, "unui_drawingHeightWithNumberOfLines:", -[NCNotificationSummaryExpandedHeaderView _numberOfLinesForTitleTextInFrame:](self, "_numberOfLinesForTitleTextInFrame:", 0.0, 0.0, v8, v9));
    v18.origin.x = v12;
    v18.origin.y = v14;
    v18.size.width = v8;
    v18.size.height = v11;
    CGRectGetWidth(v18);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    UIRectIntegralWithScale();
    -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  }
}

- (void)_layoutSubtitleLabel
{
  UILabel *subtitleLabel;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  void *titleLabel;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
  {
    -[UILabel frame](subtitleLabel, "frame");
    -[NCNotificationSummaryExpandedHeaderView bounds](self, "bounds");
    x = v16.origin.x;
    y = v16.origin.y;
    width = v16.size.width;
    height = v16.size.height;
    v8 = v16.size.width + -6.0;
    v9 = CGRectGetHeight(v16);
    -[UILabel unui_measuringHeightWithNumberOfLines:](self->_subtitleLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationSummaryExpandedHeaderView _numberOfLinesForSubtitleTextInFrame:](self, "_numberOfLinesForSubtitleTextInFrame:", 0.0, 0.0, v8, v9));
    v11 = v10;
    v12 = 6.0;
    if (-[NCNotificationSummaryExpandedHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      v17.origin.x = x;
      v17.origin.y = y;
      v17.size.width = width;
      v17.size.height = height;
      v12 = CGRectGetMaxX(v17) + -6.0 - v8;
    }
    titleLabel = self->_titleLabel;
    if (titleLabel)
    {
      v14 = 5.0;
    }
    else
    {
      titleLabel = self->_timeStampLabel;
      if (!titleLabel)
      {
        v15 = 55.0;
        goto LABEL_10;
      }
      v14 = 2.0;
    }
    objc_msgSend(titleLabel, "frame");
    v15 = CGRectGetMaxY(v18) + v14;
LABEL_10:
    -[UILabel unui_drawingHeightWithNumberOfLines:](self->_subtitleLabel, "unui_drawingHeightWithNumberOfLines:", -[NCNotificationSummaryExpandedHeaderView _numberOfLinesForSubtitleTextInFrame:](self, "_numberOfLinesForSubtitleTextInFrame:", 0.0, 0.0, v8, v9));
    v19.origin.x = v12;
    v19.origin.y = v15;
    v19.size.width = v8;
    v19.size.height = v11;
    CGRectGetWidth(v19);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    UIRectIntegralWithScale();
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:");
  }
}

- (void)_layoutOnboardingButtons
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double Height;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *subtitleLabel;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  NSString *v28;
  _BOOL4 IsAccessibilityCategory;
  UIButton *onboardingAcceptButton;
  double v31;
  double v32;
  double v33;
  CGRect v34;
  CGRect v35;

  if (self->_onboarding)
  {
    -[NCNotificationSummaryExpandedHeaderView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[NCNotificationSummaryExpandedHeaderView _allowedWidthForButtonInRect:](self, "_allowedWidthForButtonInRect:");
    v12 = v11;
    v34.origin.x = v4;
    v34.origin.y = v6;
    v34.size.width = v8;
    v34.size.height = v10;
    Height = CGRectGetHeight(v34);
    -[UIButton sizeThatFits:](self->_onboardingAcceptButton, "sizeThatFits:", v12, Height);
    v15 = v14;
    -[UIButton sizeThatFits:](self->_onboardingRejectButton, "sizeThatFits:", v12, Height);
    if (v15 >= v16)
      v17 = v15;
    else
      v17 = v16;
    v18 = v17 + 10.0;
    subtitleLabel = self->_subtitleLabel;
    if (subtitleLabel || (subtitleLabel = self->_titleLabel) != 0 || (subtitleLabel = self->_timeStampLabel) != 0)
    {
      objc_msgSend(subtitleLabel, "frame");
      CGRectGetMaxY(v35);
    }
    UIRectIntegralWithScale();
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
    v28 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v28);

    if (IsAccessibilityCategory)
    {
      -[UIButton setFrame:](self->_onboardingRejectButton, "setFrame:", v21, v23, v25, v27);
      onboardingAcceptButton = self->_onboardingAcceptButton;
      v31 = v18 + v23 + 10.0;
      v32 = v21;
    }
    else
    {
      v33 = v12 + 6.0 + 10.0;
      if (-[NCNotificationSummaryExpandedHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      {
        -[UIButton setFrame:](self->_onboardingAcceptButton, "setFrame:", v21, v23, v25, v27);
        onboardingAcceptButton = self->_onboardingRejectButton;
      }
      else
      {
        -[UIButton setFrame:](self->_onboardingRejectButton, "setFrame:", v21, v23, v25, v27);
        onboardingAcceptButton = self->_onboardingAcceptButton;
      }
      v32 = v33;
      v31 = v23;
    }
    -[UIButton setFrame:](onboardingAcceptButton, "setFrame:", v32, v31, v25, v27);
  }
}

- (void)_layoutDividerView
{
  UIView *dividerView;
  double MaxY;
  double v5;
  void *onboardingAcceptButton;
  CGRect v7;
  CGRect v8;

  dividerView = self->_dividerView;
  if (dividerView)
  {
    -[UIView frame](dividerView, "frame");
    if (self->_onboarding)
    {
      onboardingAcceptButton = self->_onboardingAcceptButton;
    }
    else
    {
      onboardingAcceptButton = self->_subtitleLabel;
      if (!onboardingAcceptButton)
      {
        onboardingAcceptButton = self->_titleLabel;
        if (!onboardingAcceptButton)
        {
          onboardingAcceptButton = self->_timeStampLabel;
          if (!onboardingAcceptButton)
            goto LABEL_9;
        }
      }
    }
    objc_msgSend(onboardingAcceptButton, "frame");
    MaxY = CGRectGetMaxY(v7);
    v5 = 15.0;
LABEL_9:
    -[NCNotificationSummaryExpandedHeaderView bounds](self, "bounds", MaxY, v5);
    CGRectGetWidth(v8);
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_dividerView, "setFrame:");
  }
}

- (void)resetClearButtonStateAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];

  v3 = a3;
  if (-[NCToggleControl isExpanded](self->_clearControl, "isExpanded"))
  {
    self->_animateCollapseButtonLayout = 1;
    -[NCNotificationSummaryExpandedHeaderView setNeedsLayout](self, "setNeedsLayout");
    if (v3)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __73__NCNotificationSummaryExpandedHeaderView_resetClearButtonStateAnimated___block_invoke;
      v5[3] = &unk_1E8D1B568;
      v5[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v5, 0, 200.0, 25.0);
    }
    else
    {
      -[NCToggleControl setExpanded:](self->_clearControl, "setExpanded:", 0);
    }
  }
}

uint64_t __73__NCNotificationSummaryExpandedHeaderView_resetClearButtonStateAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setExpanded:", 0);
}

- (BOOL)dismissModalFullScreenIfNeeded
{
  return -[NCToggleControl dismissModalFullScreenIfNeeded](self->_clearControl, "dismissModalFullScreenIfNeeded");
}

- (BOOL)shouldReceiveTouchAtPointInWindowSpace:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  BOOL v6;
  CGPoint v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  -[UIView frame](self->_controlsView, "frame");
  -[NCNotificationSummaryExpandedHeaderView convertRect:toView:](self, "convertRect:toView:", 0);
  v8.x = x;
  v8.y = y;
  v6 = CGRectContainsPoint(v9, v8);
  return -[NCToggleControl isExpanded](self->_clearControl, "isExpanded") && v6;
}

- (id)containerViewForToggleControlClickInteractionPresentedContent:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationSummaryExpandedHeaderView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerViewForClickInteractionPresentedContentForNotificationSummaryExpandedHeaderView:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)toggleControlDidBeginClickInteraction:(id)a3
{
  id v4;

  -[NCNotificationSummaryExpandedHeaderView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationSummaryExpandedHeaderViewDidBeginClickInteraction:", self);

}

- (void)toggleControlDidPresentClickInteractionPresentedContent:(id)a3
{
  id v4;

  -[NCNotificationSummaryExpandedHeaderView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationSummaryExpandedHeaderViewDidPresentClickInteractionPresentedContent:", self);

}

- (void)toggleControlDidDismssClickInteractionPresentedContent:(id)a3
{
  id v4;

  -[NCNotificationSummaryExpandedHeaderView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationSummaryExpandedHeaderViewDidDismssClickInteractionPresentedContent:", self);

}

- (BOOL)adjustForContentSizeCategoryChange
{
  UIView *controlsView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationSummaryExpandedHeaderView;
  -[NCNotificationListBaseContentView adjustForContentSizeCategoryChange](&v5, sel_adjustForContentSizeCategoryChange);
  -[UIView removeFromSuperview](self->_controlsView, "removeFromSuperview");
  controlsView = self->_controlsView;
  self->_controlsView = 0;

  -[NCNotificationSummaryExpandedHeaderView setNeedsLayout](self, "setNeedsLayout");
  return 1;
}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  UILabel *titleLabel;
  id v8;
  id v9;

  titleLabel = self->_titleLabel;
  v8 = a5;
  v9 = a3;
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", titleLabel, 0, v9, v8);
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_timeStampLabel, 0, v9, v8);
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_dividerView, 3, v9, v8);
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_subtitleLabel, 0, v9, v8);

}

- (double)_allowedWidthForButtonInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSString *v7;
  _BOOL4 IsAccessibilityCategory;
  double v9;
  double v10;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v9 = CGRectGetWidth(v12) + -12.0;
  if (IsAccessibilityCategory)
    v10 = v9;
  else
    v10 = (v9 + -10.0) * 0.5;

  return v10;
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
  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", self->_titleLabel, -[NCNotificationSummaryExpandedHeaderView _maximumNumberOfLinesForTitleText](self, "_maximumNumberOfLinesForTitleText"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (unint64_t)_numberOfLinesForSubtitleTextInFrame:(CGRect)a3
{
  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", self->_subtitleLabel, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_updateTextAttributes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationSummaryExpandedHeaderView;
  -[NCNotificationListBaseContentView _updateTextAttributes](&v3, sel__updateTextAttributes);
  -[NCNotificationSummaryExpandedHeaderView _updateTextAttributesForDateLabel](self, "_updateTextAttributesForDateLabel");
  -[NCNotificationSummaryExpandedHeaderView _updateTextAttributesForTitleTextLabel](self, "_updateTextAttributesForTitleTextLabel");
  -[NCNotificationSummaryExpandedHeaderView _updateTextAttributesForSubtitleTextLabel](self, "_updateTextAttributesForSubtitleTextLabel");
  -[NCNotificationSummaryExpandedHeaderView _updateTextAttributesForButtonLabel:](self, "_updateTextAttributesForButtonLabel:", self->_onboardingAcceptButton);
  -[NCNotificationSummaryExpandedHeaderView _updateTextAttributesForButtonLabel:](self, "_updateTextAttributesForButtonLabel:", self->_onboardingRejectButton);
}

- (void)_updateTextAttributesForDateLabel
{
  BSUIDateLabel *timeStampLabel;

  timeStampLabel = self->_timeStampLabel;
  if (timeStampLabel)
  {
    -[NCNotificationListBaseContentView _updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:](self, "_updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:", timeStampLabel, *MEMORY[0x1E0DC4AB8], 0, 1, *MEMORY[0x1E0DC1428]);
    -[BSUIDateLabel setNumberOfLines:](self->_timeStampLabel, "setNumberOfLines:", 1);
    -[BSUIDateLabel setLineBreakMode:](self->_timeStampLabel, "setLineBreakMode:", 3);
    -[NCNotificationSummaryExpandedHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTextAttributesForTitleTextLabel
{
  UILabel *titleLabel;

  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[NCNotificationListBaseContentView _updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:](self, "_updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:", titleLabel, *MEMORY[0x1E0DC4B50], 0, -[NCNotificationSummaryExpandedHeaderView _maximumNumberOfLinesForTitleText](self, "_maximumNumberOfLinesForTitleText"), *MEMORY[0x1E0DC1448]);
    -[NCNotificationSummaryExpandedHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTextAttributesForSubtitleTextLabel
{
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  id *v5;
  id v6;

  if (self->_subtitleLabel)
  {
    -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);
    v5 = (id *)MEMORY[0x1E0DC4A88];
    if (!IsAccessibilityCategory)
      v5 = (id *)MEMORY[0x1E0DC4AB8];
    v6 = *v5;

    -[NCNotificationListBaseContentView _updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:](self, "_updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:", self->_subtitleLabel, v6, 0, 0, *MEMORY[0x1E0DC1440]);
    -[NCNotificationSummaryExpandedHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTextAttributesForButtonLabel:(id)a3
{
  id v4;
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;
  id *v7;
  id v8;
  id v9;

  if (a3)
  {
    v4 = a3;
    -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);
    v7 = (id *)MEMORY[0x1E0DC4A88];
    if (!IsAccessibilityCategory)
      v7 = (id *)MEMORY[0x1E0DC4B10];
    v8 = *v7;

    objc_msgSend(v4, "titleLabel");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[NCNotificationListBaseContentView _updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:](self, "_updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:", v9, v8, 0, 0, *MEMORY[0x1E0DC1440]);
    -[NCNotificationSummaryExpandedHeaderView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)_configureTimeStampLabelIfNecessary
{
  if (!self->_timeStampLabel)
  {
    if (self->_date)
      -[NCNotificationSummaryExpandedHeaderView _configureTimeStampLabel](self, "_configureTimeStampLabel");
  }
}

- (void)_configureTimeStampLabel
{
  void *v3;
  BSUIDateLabel *v4;
  BSUIDateLabel *timeStampLabel;
  BSUIDateLabel *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D01918], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startLabelWithStartDate:endDate:timeZone:allDay:forStyle:", self->_date, 0, self->_timeZone, 0, self->_dateFormatStyle);
  v4 = (BSUIDateLabel *)objc_claimAutoreleasedReturnValue();
  timeStampLabel = self->_timeStampLabel;
  self->_timeStampLabel = v4;

  -[BSUIDateLabel setDelegate:](self->_timeStampLabel, "setDelegate:", self);
  -[NCNotificationSummaryExpandedHeaderView addSubview:](self, "addSubview:", self->_timeStampLabel);
  -[NCNotificationSummaryExpandedHeaderView _updateTextAttributesForDateLabel](self, "_updateTextAttributesForDateLabel");
  v6 = self->_timeStampLabel;
  -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v6, 0, v7, 0);

}

- (void)_recycleTimeStampLabel
{
  BSUIDateLabel *timeStampLabel;
  void *v4;
  id v5;

  -[BSUIDateLabel setDelegate:](self->_timeStampLabel, "setDelegate:", 0);
  timeStampLabel = self->_timeStampLabel;
  -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", timeStampLabel, 0, 0, v4);

  objc_msgSend(MEMORY[0x1E0D01918], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recycleLabel:", self->_timeStampLabel);

}

- (void)_tearDownTimeStampLabel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __66__NCNotificationSummaryExpandedHeaderView__tearDownTimeStampLabel__block_invoke;
  v2[3] = &unk_1E8D1B568;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

void __66__NCNotificationSummaryExpandedHeaderView__tearDownTimeStampLabel__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 448);
  if (v2)
  {
    objc_msgSend(v2, "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 32), "_recycleTimeStampLabel");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 448);
    *(_QWORD *)(v3 + 448) = 0;

  }
}

- (void)_summaryOnboardingAccepted:(id)a3
{
  void *v4;
  id v5;

  -[NCNotificationSummaryExpandedHeaderView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "notificationSummaryExpandedHeaderView:acceptedSummaryOnboarding:", self, 1);
    v4 = v5;
  }

}

- (void)_summaryOnboardingRejected:(id)a3
{
  void *v4;
  id v5;

  -[NCNotificationSummaryExpandedHeaderView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "notificationSummaryExpandedHeaderView:acceptedSummaryOnboarding:", self, 0);
    v4 = v5;
  }

}

- (NSDate)date
{
  return self->_date;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (int64_t)dateFormatStyle
{
  return self->_dateFormatStyle;
}

- (NCNotificationListCoalescingControlsHandlerDelegate)handlerDelegate
{
  return (NCNotificationListCoalescingControlsHandlerDelegate *)objc_loadWeakRetained((id *)&self->_handlerDelegate);
}

- (void)setHandlerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_handlerDelegate, a3);
}

- (NCNotificationSummaryExpandedHeaderViewDelegate)delegate
{
  return (NCNotificationSummaryExpandedHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isOnboarding
{
  return self->_onboarding;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_handlerDelegate);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_controlsView, 0);
  objc_storeStrong((id *)&self->_clearControl, 0);
  objc_storeStrong((id *)&self->_collapseControl, 0);
  objc_storeStrong((id *)&self->_onboardingRejectButton, 0);
  objc_storeStrong((id *)&self->_onboardingAcceptButton, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_timeStampLabel, 0);
}

@end
