@implementation NCNotificationSummaryContentView

- (NCNotificationSummaryContentView)initWithFrame:(CGRect)a3
{
  NCNotificationSummaryContentView *v3;
  NCNotificationSummaryContentView *v4;
  void *v5;
  uint64_t v6;
  NSString *preferredContentSizeCategory;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NCNotificationSummaryContentView;
  v3 = -[NCNotificationSummaryContentView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_adjustsFontForContentSizeCategory = 1;
    objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = objc_claimAutoreleasedReturnValue();
    preferredContentSizeCategory = v4->_preferredContentSizeCategory;
    v4->_preferredContentSizeCategory = (NSString *)v6;

  }
  return v4;
}

- (void)setSummaryLabelMaterialSecondary:(BOOL)a3
{
  UILabel *summaryLabel;
  uint64_t v5;
  id v6;

  if (self->_summaryLabelMaterialSecondary != a3)
  {
    self->_summaryLabelMaterialSecondary = a3;
    summaryLabel = self->_summaryLabel;
    if (summaryLabel)
    {
      v5 = -[NCNotificationSummaryContentView isSummaryLabelMaterialSecondary](self, "isSummaryLabelMaterialSecondary");
      -[NCNotificationSummaryContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[NCNotificationSummaryContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", summaryLabel, v5, v6, 0);

    }
  }
}

- (NSString)summaryTitle
{
  return -[UILabel text](self->_summaryTitleLabel, "text");
}

- (void)setSummaryTitle:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  UILabel *summaryTitleLabel;
  UILabel *v8;
  UILabel *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  id v13;

  v13 = a3;
  -[NCNotificationSummaryContentView summaryTitle](self, "summaryTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  v6 = v13;
  if ((v5 & 1) == 0)
  {
    summaryTitleLabel = self->_summaryTitleLabel;
    if (v13)
    {
      if (!summaryTitleLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v9 = self->_summaryTitleLabel;
        self->_summaryTitleLabel = v8;

        -[UILabel setLineBreakMode:](self->_summaryTitleLabel, "setLineBreakMode:", 4);
        -[NCNotificationSummaryContentView addSubview:](self, "addSubview:", self->_summaryTitleLabel);
        -[NCNotificationSummaryContentView _updateTextAttributesForSummaryTitleLabel](self, "_updateTextAttributesForSummaryTitleLabel");
        v10 = self->_summaryTitleLabel;
        -[NCNotificationSummaryContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationSummaryContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v10, 0, v11, 0);

        v6 = v13;
        summaryTitleLabel = self->_summaryTitleLabel;
      }
      -[UILabel setText:](summaryTitleLabel, "setText:", v6);
    }
    else
    {
      -[UILabel removeFromSuperview](summaryTitleLabel, "removeFromSuperview");
      v12 = self->_summaryTitleLabel;
      self->_summaryTitleLabel = 0;

    }
    -[NCNotificationSummaryContentView setNeedsLayout](self, "setNeedsLayout");
    v6 = v13;
  }

}

- (NSString)summary
{
  return -[UILabel text](self->_summaryLabel, "text");
}

- (void)setSummary:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  UILabel *summaryLabel;
  UILabel *v8;
  UILabel *v9;
  UILabel *v10;
  uint64_t v11;
  void *v12;
  UILabel *v13;
  id v14;

  v14 = a3;
  -[NCNotificationSummaryContentView summary](self, "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  v6 = v14;
  if ((v5 & 1) == 0)
  {
    summaryLabel = self->_summaryLabel;
    if (v14)
    {
      if (!summaryLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v9 = self->_summaryLabel;
        self->_summaryLabel = v8;

        -[UILabel setLineBreakMode:](self->_summaryLabel, "setLineBreakMode:", 4);
        -[NCNotificationSummaryContentView addSubview:](self, "addSubview:", self->_summaryLabel);
        -[NCNotificationSummaryContentView _updateTextAttributesForSummaryLabel](self, "_updateTextAttributesForSummaryLabel");
        v10 = self->_summaryLabel;
        v11 = -[NCNotificationSummaryContentView isSummaryLabelMaterialSecondary](self, "isSummaryLabelMaterialSecondary");
        -[NCNotificationSummaryContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationSummaryContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v10, v11, v12, 0);

        v6 = v14;
        summaryLabel = self->_summaryLabel;
      }
      -[UILabel setText:](summaryLabel, "setText:", v6);
    }
    else
    {
      -[UILabel removeFromSuperview](summaryLabel, "removeFromSuperview");
      v13 = self->_summaryLabel;
      self->_summaryLabel = 0;

    }
    -[NCNotificationSummaryContentView setNeedsLayout](self, "setNeedsLayout");
    v6 = v14;
  }

}

- (NSArray)summaryIconViews
{
  return self->_iconViews;
}

- (void)setSummaryIconViews:(id)a3
{
  id v5;
  void *v6;
  char v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  UIImageView *summaryIconSymbolImageView;
  UIImageView *v14;
  UIView *summaryIconSymbolBackgroundView;
  UIView *v16;
  uint64_t v17;
  UIView *summaryIconsContainerView;
  id v19;
  UIView *v20;
  UIView *v21;
  NSArray *iconViews;
  UIView *v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[NCNotificationSummaryContentView summaryIconViews](self, "summaryIconViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualArrays();

  if ((v7 & 1) == 0)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = self->_iconViews;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "removeFromSuperview");
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }

    summaryIconSymbolImageView = self->_summaryIconSymbolImageView;
    if (summaryIconSymbolImageView)
    {
      -[UIImageView removeFromSuperview](summaryIconSymbolImageView, "removeFromSuperview");
      v14 = self->_summaryIconSymbolImageView;
      self->_summaryIconSymbolImageView = 0;

    }
    summaryIconSymbolBackgroundView = self->_summaryIconSymbolBackgroundView;
    if (summaryIconSymbolBackgroundView)
    {
      -[UIView removeFromSuperview](summaryIconSymbolBackgroundView, "removeFromSuperview");
      v16 = self->_summaryIconSymbolBackgroundView;
      self->_summaryIconSymbolBackgroundView = 0;

    }
    objc_storeStrong((id *)&self->_iconViews, a3);
    v17 = objc_msgSend(v5, "count");
    summaryIconsContainerView = self->_summaryIconsContainerView;
    if (v17)
    {
      if (!summaryIconsContainerView)
      {
        v19 = objc_alloc(MEMORY[0x1E0DC3F10]);
        v20 = (UIView *)objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v21 = self->_summaryIconsContainerView;
        self->_summaryIconsContainerView = v20;

        -[NCNotificationSummaryContentView addSubview:](self, "addSubview:", self->_summaryIconsContainerView);
      }
      iconViews = self->_iconViews;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __56__NCNotificationSummaryContentView_setSummaryIconViews___block_invoke;
      v24[3] = &unk_1E8D1CF08;
      v24[4] = self;
      -[NSArray enumerateObjectsUsingBlock:](iconViews, "enumerateObjectsUsingBlock:", v24);
    }
    else
    {
      -[UIView removeFromSuperview](summaryIconsContainerView, "removeFromSuperview");
      v23 = self->_summaryIconsContainerView;
      self->_summaryIconsContainerView = 0;

    }
    -[NCNotificationSummaryContentView setNeedsLayout](self, "setNeedsLayout");
  }

}

void __56__NCNotificationSummaryContentView_setSummaryIconViews___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;

  v5 = a2;
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "count") >= 2
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "count") - 1 > a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_addShadowForIconView:", v5);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "addSubview:", v5);
  objc_msgSend(*(id *)(a1 + 32), "_updateVisualStylingProvidersForIconViewIfNecessary:", v5);

}

- (void)setIconViewLeading:(BOOL)a3
{
  self->_iconViewLeading = a3;
  -[NCNotificationSummaryContentView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSummaryTitleFontName:(id)a3
{
  objc_storeStrong((id *)&self->_summaryTitleFontName, a3);
  -[NCNotificationSummaryContentView _updateTextAttributesForSummaryTitleLabel](self, "_updateTextAttributesForSummaryTitleLabel");
  -[NCNotificationSummaryContentView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSummaryDate:(id)a3
{
  NSDate **p_summaryDate;
  void *v6;
  NSDate *v7;
  void *v8;
  BSUIDateLabel *v9;
  BSUIDateLabel *summaryDateLabel;
  BSUIDateLabel *v11;
  void *v12;
  id v13;

  p_summaryDate = &self->_summaryDate;
  v13 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    -[NCNotificationSummaryContentView _tearDownDateLabelIfNecessary](self, "_tearDownDateLabelIfNecessary");
    objc_storeStrong((id *)&self->_summaryDate, a3);
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D01918], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *p_summaryDate;
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "startLabelWithStartDate:endDate:timeZone:allDay:forStyle:", v7, 0, 0, objc_msgSend(v8, "isDateInToday:", v13) ^ 1, 0);
      v9 = (BSUIDateLabel *)objc_claimAutoreleasedReturnValue();
      summaryDateLabel = self->_summaryDateLabel;
      self->_summaryDateLabel = v9;

      -[BSUIDateLabel setDelegate:](self->_summaryDateLabel, "setDelegate:", self);
      -[NCNotificationSummaryContentView addSubview:](self, "addSubview:", self->_summaryDateLabel);
      -[NCNotificationSummaryContentView _updateTextAttributesForDateLabel](self, "_updateTextAttributesForDateLabel");
      v11 = self->_summaryDateLabel;
      -[NCNotificationSummaryContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationSummaryContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v11, 1, v12, 0);

    }
    -[NCNotificationSummaryContentView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setSummaryIconSymbolName:(id)a3
{
  id v4;
  UIImageView *summaryIconSymbolImageView;
  NSArray *iconViews;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSArray *v12;
  id v13;
  UIView *v14;
  UIView *summaryIconsContainerView;
  id v16;
  UIView *v17;
  UIView *summaryIconSymbolBackgroundView;
  UIView *v19;
  void *v20;
  UIView *v21;
  _BOOL4 v22;
  double v23;
  UIView *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  double v28;
  void *v29;
  void *v30;
  UIImageView *v31;
  UIImageView *v32;
  UIImageView *v33;
  void *v34;
  UIView *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString isEqualToString:](self->_summaryIconSymbolName, "isEqualToString:", v4))
  {
    -[UIImageView removeFromSuperview](self->_summaryIconSymbolImageView, "removeFromSuperview");
    summaryIconSymbolImageView = self->_summaryIconSymbolImageView;
    self->_summaryIconSymbolImageView = 0;

    if (v4)
    {
      iconViews = self->_iconViews;
      if (iconViews)
      {
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v7 = iconViews;
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v37 != v10)
                objc_enumerationMutation(v7);
              objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "removeFromSuperview", (_QWORD)v36);
            }
            v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
          }
          while (v9);
        }

        v12 = self->_iconViews;
        self->_iconViews = 0;

      }
      if (!self->_summaryIconsContainerView)
      {
        v13 = objc_alloc(MEMORY[0x1E0DC3F10]);
        v14 = (UIView *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        summaryIconsContainerView = self->_summaryIconsContainerView;
        self->_summaryIconsContainerView = v14;

        -[NCNotificationSummaryContentView addSubview:](self, "addSubview:", self->_summaryIconsContainerView);
      }
      if (!self->_summaryIconSymbolBackgroundView)
      {
        v16 = objc_alloc(MEMORY[0x1E0DC3F10]);
        -[NCNotificationSummaryContentView isIconViewLeading](self, "isIconViewLeading");
        -[NCNotificationSummaryContentView isIconViewLeading](self, "isIconViewLeading", (_QWORD)v36);
        BSRectWithSize();
        v17 = (UIView *)objc_msgSend(v16, "initWithFrame:");
        summaryIconSymbolBackgroundView = self->_summaryIconSymbolBackgroundView;
        self->_summaryIconSymbolBackgroundView = v17;

        v19 = self->_summaryIconSymbolBackgroundView;
        objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v19, "setBackgroundColor:", v20);

        v21 = self->_summaryIconSymbolBackgroundView;
        v22 = -[NCNotificationSummaryContentView isIconViewLeading](self, "isIconViewLeading");
        v23 = 20.0;
        if (v22)
          v23 = 19.0;
        -[UIView _setContinuousCornerRadius:](v21, "_setContinuousCornerRadius:", v23);
        -[UIView addSubview:](self->_summaryIconsContainerView, "addSubview:", self->_summaryIconSymbolBackgroundView);
        v24 = self->_summaryIconSymbolBackgroundView;
        -[NCNotificationSummaryContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationSummaryContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v24, 3, v25, 0);

      }
      v26 = (void *)MEMORY[0x1E0DC3888];
      v27 = -[NCNotificationSummaryContentView isIconViewLeading](self, "isIconViewLeading", (_QWORD)v36);
      v28 = 15.2;
      if (!v27)
        v28 = 16.0;
      objc_msgSend(v26, "configurationWithPointSize:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", v4, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v30);
      v32 = self->_summaryIconSymbolImageView;
      self->_summaryIconSymbolImageView = v31;

      v33 = self->_summaryIconSymbolImageView;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](v33, "setTintColor:", v34);

      -[UIImageView setContentMode:](self->_summaryIconSymbolImageView, "setContentMode:", 4);
      -[UIView addSubview:](self->_summaryIconsContainerView, "addSubview:", self->_summaryIconSymbolImageView);

    }
    else
    {
      -[UIView removeFromSuperview](self->_summaryIconSymbolBackgroundView, "removeFromSuperview");
      v35 = self->_summaryIconSymbolBackgroundView;
      self->_summaryIconSymbolBackgroundView = 0;

    }
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UILabel *summaryTitleLabel;
  UILabel *summaryLabel;
  void *v14;
  double v15;
  double v16;
  CGSize result;

  -[NCNotificationSummaryContentView _adjustedRectForLabelLayoutFromRect:](self, "_adjustedRectForLabelLayoutFromRect:", 0.0, 0.0, a3.width, a3.height);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  summaryTitleLabel = self->_summaryTitleLabel;
  if (summaryTitleLabel)
    -[UILabel unui_measuringHeightWithNumberOfLines:](summaryTitleLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationSummaryContentView _numberOfLinesForSummaryTitleTextInFrame:](self, "_numberOfLinesForSummaryTitleTextInFrame:", v4, v5, v6, v7));
  summaryLabel = self->_summaryLabel;
  if (summaryLabel)
    -[UILabel unui_measuringHeightWithNumberOfLines:](summaryLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationSummaryContentView _numberOfLinesForSummaryTextInFrame:](self, "_numberOfLinesForSummaryTextInFrame:", v8, v9, v10, v11));
  if (UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory))
    -[BSUIDateLabel unui_measuringHeightWithNumberOfLines:](self->_summaryDateLabel, "unui_measuringHeightWithNumberOfLines:", 1);
  if (self->_summaryIconsContainerView)
    -[NCNotificationSummaryContentView isIconViewLeading](self, "isIconViewLeading");
  -[NCNotificationSummaryContentView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayScale");
  UICeilToScale();

  UISizeRoundToScale();
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationSummaryContentView;
  -[NCNotificationSummaryContentView layoutSubviews](&v3, sel_layoutSubviews);
  -[NCNotificationSummaryContentView _layoutSummaryTitleLabel](self, "_layoutSummaryTitleLabel");
  -[NCNotificationSummaryContentView _layoutSummaryDateLabel](self, "_layoutSummaryDateLabel");
  -[NCNotificationSummaryContentView _layoutSummaryLabel](self, "_layoutSummaryLabel");
  -[NCNotificationSummaryContentView _layoutSummaryIconsView](self, "_layoutSummaryIconsView");
}

- (void)didMoveToWindow
{
  void *v3;

  -[NCNotificationSummaryContentView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[NCNotificationSummaryContentView adjustForContentSizeCategoryChange](self, "adjustForContentSizeCategoryChange");
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  NSString *v4;
  NSComparisonResult v5;

  -[NCNotificationSummaryContentView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  v5 = UIContentSizeCategoryCompareToCategory(v4, self->_preferredContentSizeCategory);
  if (v5)
  {
    objc_storeStrong((id *)&self->_preferredContentSizeCategory, v4);
    -[NCNotificationSummaryContentView _updateTextAttributes](self, "_updateTextAttributes");
    -[NCNotificationSummaryContentView setNeedsLayout](self, "setNeedsLayout");
  }

  return v5 != NSOrderedSame;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  MTVisualStylingProvider *strokeVisualStylingProvider;
  objc_super v5;

  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider)
    return strokeVisualStylingProvider;
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationSummaryContentView;
  -[NCNotificationSummaryContentView visualStylingProviderForCategory:](&v5, sel_visualStylingProviderForCategory_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1E8D5FDF0;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  MTVisualStylingProvider *v6;
  MTVisualStylingProvider *strokeVisualStylingProvider;
  MTVisualStylingProvider *v8;
  MTVisualStylingProvider *v9;
  MTVisualStylingProvider *v10;
  MTVisualStylingProvider *v11;

  v6 = (MTVisualStylingProvider *)a3;
  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider != v6)
  {
    v11 = v6;
    v8 = v6;
    v9 = self->_strokeVisualStylingProvider;
    self->_strokeVisualStylingProvider = v8;
    v10 = strokeVisualStylingProvider;

    -[NCNotificationSummaryContentView _visualStylingProviderDidChange:forCategory:outgoingProvider:](self, "_visualStylingProviderDidChange:forCategory:outgoingProvider:", self->_strokeVisualStylingProvider, a4, v10);
    v6 = v11;
  }

}

- (void)dateLabelDidChange:(id)a3
{
  -[BSUIDateLabel sizeToFit](self->_summaryDateLabel, "sizeToFit", a3);
  -[NCNotificationSummaryContentView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_layoutSummaryTitleLabel
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
  BOOL IsAccessibilityCategory;
  BSUIDateLabel *summaryDateLabel;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  _BOOL4 v28;
  int v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat rect;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  if (self->_summaryTitleLabel)
  {
    -[NCNotificationSummaryContentView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UILabel frame](self->_summaryTitleLabel, "frame");
    v34 = v6;
    v35 = v8;
    rect = v10;
    -[NCNotificationSummaryContentView _adjustedRectForLabelLayoutFromRect:](self, "_adjustedRectForLabelLayoutFromRect:", v4, v6, v8, v10);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    summaryDateLabel = self->_summaryDateLabel;
    v21 = 0.0;
    if (summaryDateLabel && !IsAccessibilityCategory)
    {
      -[BSUIDateLabel sizeThatFits:](summaryDateLabel, "sizeThatFits:", v16, v18);
      v21 = v22 + 10.0;
    }
    v37.origin.x = v12;
    v37.origin.y = v14;
    v37.size.width = v16;
    v37.size.height = v18;
    v23 = CGRectGetWidth(v37) - v21;
    -[UILabel unui_measuringHeightWithNumberOfLines:](self->_summaryTitleLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationSummaryContentView _numberOfLinesForSummaryTitleTextInFrame:](self, "_numberOfLinesForSummaryTitleTextInFrame:", v12, v14, v16, v18));
    v25 = v24;
    -[NCNotificationSummaryContentView _widthForIconsContainerView](self, "_widthForIconsContainerView");
    v27 = v26;
    v28 = -[NCNotificationSummaryContentView isIconViewLeading](self, "isIconViewLeading");
    v29 = -[NCNotificationSummaryContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    if (v28)
    {
      if (v29)
      {
        v38.origin.x = v4;
        v38.origin.y = v34;
        v38.size.width = v35;
        v38.size.height = rect;
        v30 = CGRectGetMaxX(v38) - v23 - v27 + -10.0;
      }
      else
      {
        v30 = v27 + 10.0;
      }
    }
    else if (v29)
    {
      v39.origin.x = v4;
      v39.origin.y = v34;
      v39.size.width = v35;
      v39.size.height = rect;
      v31 = CGRectGetMaxX(v39) - v23;
      -[NCNotificationSummaryContentView horizontalLeadingMargin](self, "horizontalLeadingMargin");
      v30 = v31 - v32;
    }
    else
    {
      -[NCNotificationSummaryContentView horizontalLeadingMargin](self, "horizontalLeadingMargin");
      v30 = v33;
    }
    -[UILabel unui_drawingHeightWithNumberOfLines:](self->_summaryTitleLabel, "unui_drawingHeightWithNumberOfLines:", -[NCNotificationSummaryContentView _numberOfLinesForSummaryTitleTextInFrame:](self, "_numberOfLinesForSummaryTitleTextInFrame:", v12, v14, v16, v18));
    v40.origin.y = 0.0;
    v40.origin.x = v30;
    v40.size.width = v23;
    v40.size.height = v25;
    CGRectGetWidth(v40);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    -[UILabel setFrame:](self->_summaryTitleLabel, "setFrame:");
  }
}

- (void)_layoutSummaryLabel
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
  double x;
  double y;
  double width;
  double height;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  int v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  BSUIDateLabel *summaryDateLabel;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  CGFloat rect;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  if (self->_summaryLabel)
  {
    -[NCNotificationSummaryContentView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UILabel frame](self->_summaryTitleLabel, "frame");
    v38 = v12;
    v39 = v11;
    v37 = v13;
    rect = v14;
    -[UILabel frame](self->_summaryLabel, "frame");
    -[NCNotificationSummaryContentView _adjustedRectForLabelLayoutFromRect:](self, "_adjustedRectForLabelLayoutFromRect:", v4, v6, v8, v10);
    x = v42.origin.x;
    y = v42.origin.y;
    width = v42.size.width;
    height = v42.size.height;
    v40 = CGRectGetWidth(v42);
    v34 = x;
    v35 = height;
    -[UILabel unui_measuringHeightWithNumberOfLines:](self->_summaryLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationSummaryContentView _numberOfLinesForSummaryTextInFrame:](self, "_numberOfLinesForSummaryTextInFrame:", x, y, width, height));
    v36 = v19;
    -[NCNotificationSummaryContentView _widthForIconsContainerView](self, "_widthForIconsContainerView");
    v21 = v20;
    v22 = -[NCNotificationSummaryContentView isIconViewLeading](self, "isIconViewLeading");
    v23 = -[NCNotificationSummaryContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    if (v22)
    {
      if (v23)
      {
        v43.origin.x = v4;
        v43.origin.y = v6;
        v43.size.width = v8;
        v43.size.height = v10;
        v24 = CGRectGetMaxX(v43) - v40 - v21 + -10.0;
      }
      else
      {
        v24 = v21 + 10.0;
      }
    }
    else if (v23)
    {
      v44.origin.x = v4;
      v44.origin.y = v6;
      v44.size.width = v8;
      v44.size.height = v10;
      v25 = CGRectGetMaxX(v44) - v40;
      -[NCNotificationSummaryContentView horizontalLeadingMargin](self, "horizontalLeadingMargin");
      v24 = v25 - v26;
    }
    else
    {
      -[NCNotificationSummaryContentView horizontalLeadingMargin](self, "horizontalLeadingMargin");
      v24 = v27;
    }
    if (UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory)
      && (summaryDateLabel = self->_summaryDateLabel) != 0)
    {
      -[BSUIDateLabel frame](summaryDateLabel, "frame");
    }
    else
    {
      v29 = v39;
      v30 = v38;
      v31 = v37;
      v32 = rect;
      if (!self->_summaryTitleLabel)
      {
        v33 = 0.0;
        goto LABEL_16;
      }
    }
    v33 = CGRectGetMaxY(*(CGRect *)&v29) + 1.0;
LABEL_16:
    -[UILabel unui_drawingHeightWithNumberOfLines:](self->_summaryLabel, "unui_drawingHeightWithNumberOfLines:", -[NCNotificationSummaryContentView _numberOfLinesForSummaryTextInFrame:](self, "_numberOfLinesForSummaryTextInFrame:", v34, y, width, v35));
    v45.origin.x = v39;
    v45.origin.y = v38;
    v45.size.width = v37;
    v45.size.height = rect;
    CGRectGetWidth(v45);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    -[UILabel setFrame:](self->_summaryLabel, "setFrame:", v24, v33, v40, v36);
  }
}

- (void)_layoutSummaryIconsView
{
  int v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  double v8;
  NSArray *iconViews;
  _BOOL4 v10;
  _BOOL4 v11;
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
  _QWORD v22[6];
  char v23;
  _QWORD v24[3];
  double v25;
  CGRect v26;

  if (-[NSArray count](self->_iconViews, "count") || self->_summaryIconSymbolImageView)
  {
    v3 = -[NCNotificationSummaryContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v25 = 0.0;
    v4 = 0.0;
    if (v3)
    {
      -[NCNotificationSummaryContentView _widthForIconsContainerView](self, "_widthForIconsContainerView", 0.0);
      v6 = v5;
      v7 = -[NCNotificationSummaryContentView isIconViewLeading](self, "isIconViewLeading");
      v8 = 40.0;
      if (v7)
        v8 = 38.0;
      v4 = v6 - v8;
    }
    v25 = v4;
    iconViews = self->_iconViews;
    if (iconViews)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __59__NCNotificationSummaryContentView__layoutSummaryIconsView__block_invoke;
      v22[3] = &unk_1E8D1F1A0;
      v22[4] = self;
      v22[5] = v24;
      v23 = v3;
      -[NSArray enumerateObjectsUsingBlock:](iconViews, "enumerateObjectsUsingBlock:", v22);
    }
    else if (self->_summaryIconSymbolImageView)
    {
      v10 = -[NCNotificationSummaryContentView isIconViewLeading](self, "isIconViewLeading");
      v11 = -[NCNotificationSummaryContentView isIconViewLeading](self, "isIconViewLeading");
      if (v10)
        v12 = 38.0;
      else
        v12 = 40.0;
      if (v11)
        v13 = 38.0;
      else
        v13 = 40.0;
      -[UIImageView setFrame:](self->_summaryIconSymbolImageView, "setFrame:", 0.0, 0.0, v12, v13);
      -[UIView setFrame:](self->_summaryIconSymbolBackgroundView, "setFrame:", 0.0, 0.0, v12, v13);
      -[UIView bringSubviewToFront:](self->_summaryIconsContainerView, "bringSubviewToFront:", self->_summaryIconSymbolImageView);
    }
    -[UIView frame](self->_summaryIconsContainerView, "frame");
    -[NCNotificationSummaryContentView bounds](self, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[NCNotificationSummaryContentView _widthForIconsContainerView](self, "_widthForIconsContainerView");
    if (-[NCNotificationSummaryContentView isIconViewLeading](self, "isIconViewLeading"))
    {
      if (v3)
        goto LABEL_21;
    }
    else if ((v3 & 1) == 0)
    {
LABEL_21:
      v26.origin.x = v15;
      v26.origin.y = v17;
      v26.size.width = v19;
      v26.size.height = v21;
      CGRectGetMaxX(v26);
    }
    -[NCNotificationSummaryContentView isIconViewLeading](self, "isIconViewLeading");
    UIRectCenteredYInRect();
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_summaryIconsContainerView, "setFrame:");
    _Block_object_dispose(v24, 8);
  }
}

double __59__NCNotificationSummaryContentView__layoutSummaryIconsView__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  id v5;
  double v6;
  double v7;
  int v8;
  int v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double result;

  v3 = *(void **)(a1 + 32);
  v4 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v5 = a2;
  if (objc_msgSend(v3, "isIconViewLeading"))
    v6 = 38.0;
  else
    v6 = 40.0;
  if (objc_msgSend(*(id *)(a1 + 32), "isIconViewLeading"))
    v7 = 38.0;
  else
    v7 = 40.0;
  objc_msgSend(v5, "setFrame:", v4, 0.0, v6, v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "sendSubviewToBack:", v5);

  v8 = *(unsigned __int8 *)(a1 + 48);
  v9 = objc_msgSend(*(id *)(a1 + 32), "isIconViewLeading");
  v10 = objc_msgSend(*(id *)(a1 + 32), "isIconViewLeading");
  if (v8)
  {
    v11 = 15.2;
    if (!v10)
      v11 = 16.0;
    v12 = 22.8;
    if (!v10)
      v12 = 24.0;
    if (!v9)
      v11 = v12;
    v13 = -v11;
  }
  else
  {
    if (v9)
    {
      v13 = 15.2;
      v14 = 16.0;
    }
    else
    {
      v13 = 22.8;
      v14 = 24.0;
    }
    if (!v10)
      v13 = v14;
  }
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = v13 + *(double *)(v15 + 24);
  *(double *)(v15 + 24) = result;
  return result;
}

- (void)_layoutSummaryDateLabel
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
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 IsAccessibilityCategory;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat rect;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  if (self->_summaryDateLabel)
  {
    -[NCNotificationSummaryContentView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UILabel frame](self->_summaryTitleLabel, "frame");
    v12 = v11;
    v23 = v13;
    v24 = v14;
    rect = v15;
    -[BSUIDateLabel frame](self->_summaryDateLabel, "frame");
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    -[NCNotificationSummaryContentView _adjustedRectForLabelLayoutFromRect:](self, "_adjustedRectForLabelLayoutFromRect:", v4, v6, v8, v10);
    v19 = v17;
    v20 = v18;
    if (!IsAccessibilityCategory)
    {
      -[UILabel sizeThatFits:](self->_summaryTitleLabel, "sizeThatFits:", v17, v18);
      v19 = v19 - v21 + -10.0;
    }
    -[BSUIDateLabel sizeThatFits:](self->_summaryDateLabel, "sizeThatFits:", v19, v20);
    -[NCNotificationSummaryContentView _widthForIconsContainerView](self, "_widthForIconsContainerView");
    v22 = -[NCNotificationSummaryContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    if (IsAccessibilityCategory)
    {
      if (v22)
      {
        v26.origin.x = v4;
        v26.origin.y = v6;
        v26.size.width = v8;
        v26.size.height = v10;
        CGRectGetMaxX(v26);
      }
    }
    else if ((v22 & 1) == 0)
    {
      v27.origin.x = v4;
      v27.origin.y = v6;
      v27.size.width = v8;
      v27.size.height = v10;
      CGRectGetWidth(v27);
    }
    v28.origin.x = v12;
    v28.origin.y = v23;
    v28.size.width = v24;
    v28.size.height = rect;
    CGRectGetMaxY(v28);
    UIRectIntegralWithScale();
    -[BSUIDateLabel setFrame:](self->_summaryDateLabel, "setFrame:");
  }
}

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  id v9;
  id v10;

  if (a3)
  {
    v9 = a5;
    v10 = a3;
    objc_msgSend(a6, "stopAutomaticallyUpdatingView:", v10);
    objc_msgSend(v9, "automaticallyUpdateView:withStyle:", v10, a4);

  }
}

- (void)_updateVisualStylingProvidersForIconViewIfNecessary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v4, "requiredVisualStyleCategories", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "integerValue");
          -[NCNotificationSummaryContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setVisualStylingProvider:forCategory:", v11, v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)_updateVisualStylingProvidersForIconViewsIfNecessary
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_iconViews;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[NCNotificationSummaryContentView _updateVisualStylingProvidersForIconViewIfNecessary:](self, "_updateVisualStylingProvidersForIconViewIfNecessary:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  UILabel *summaryLabel;
  id v8;
  id v9;

  if (a4 == 1)
  {
    summaryLabel = self->_summaryLabel;
    v8 = a5;
    v9 = a3;
    -[NCNotificationSummaryContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", summaryLabel, -[NCNotificationSummaryContentView isSummaryLabelMaterialSecondary](self, "isSummaryLabelMaterialSecondary"), v9, v8);
    -[NCNotificationSummaryContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_summaryTitleLabel, 0, v9, v8);
    -[NCNotificationSummaryContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_summaryDateLabel, 1, v9, v8);
    -[NCNotificationSummaryContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_summaryIconSymbolBackgroundView, 3, v9, v8);

    -[NCNotificationSummaryContentView _updateVisualStylingProvidersForIconViewsIfNecessary](self, "_updateVisualStylingProvidersForIconViewsIfNecessary");
  }
}

- (void)_updateTextAttributes
{
  -[NCNotificationSummaryContentView _updateTextAttributesForSummaryLabel](self, "_updateTextAttributesForSummaryLabel");
  -[NCNotificationSummaryContentView _updateTextAttributesForSummaryTitleLabel](self, "_updateTextAttributesForSummaryTitleLabel");
  -[NCNotificationSummaryContentView _updateTextAttributesForDateLabel](self, "_updateTextAttributesForDateLabel");
}

- (void)_updateTextAttributesForSummaryTitleLabel
{
  _BOOL4 IsAccessibilityCategory;
  id *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (self->_summaryTitleLabel)
  {
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    v4 = (id *)MEMORY[0x1E0DC4A88];
    if (!IsAccessibilityCategory)
      v4 = (id *)MEMORY[0x1E0DC4B10];
    v5 = *v4;
    -[NCNotificationSummaryContentView summaryTitleFontName](self, "summaryTitleFontName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0DC1350];
      v8 = (void *)MEMORY[0x1E0DC1358];
      -[NCNotificationSummaryContentView traitCollection](self, "traitCollection");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v5, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "pointSize");
      objc_msgSend(v7, "fontWithName:size:", v6);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v5 = (id)v9;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, v5, 0, *MEMORY[0x1E0DC1448]);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }

    -[UILabel setFont:](self->_summaryTitleLabel, "setFont:", v11);
    -[UILabel setNumberOfLines:](self->_summaryTitleLabel, "setNumberOfLines:", -[NCNotificationSummaryContentView _maximumNumberOfLinesForSummaryTitleText](self, "_maximumNumberOfLinesForSummaryTitleText"));
    -[NCNotificationSummaryContentView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)_updateTextAttributesForSummaryLabel
{
  _BOOL4 IsAccessibilityCategory;
  id *v4;
  UILabel *summaryLabel;
  id v6;
  void *v7;

  if (self->_summaryLabel)
  {
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    v4 = (id *)MEMORY[0x1E0DC4A88];
    if (!IsAccessibilityCategory)
      v4 = (id *)MEMORY[0x1E0DC4B10];
    summaryLabel = self->_summaryLabel;
    v6 = *v4;
    objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, v6, 0x8000, *MEMORY[0x1E0DC1440]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](summaryLabel, "setFont:", v7);
    -[UILabel setNumberOfLines:](self->_summaryLabel, "setNumberOfLines:", -[NCNotificationSummaryContentView _maximumNumberOfLinesForSummaryText](self, "_maximumNumberOfLinesForSummaryText"));
    -[NCNotificationSummaryContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTextAttributesForDateLabel
{
  BSUIDateLabel *summaryDateLabel;
  void *v4;

  summaryDateLabel = self->_summaryDateLabel;
  if (summaryDateLabel)
  {
    -[NCNotificationSummaryContentView _dateLabelPreferredFont](self, "_dateLabelPreferredFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIDateLabel setFont:](summaryDateLabel, "setFont:", v4);

    -[BSUIDateLabel setNumberOfLines:](self->_summaryDateLabel, "setNumberOfLines:", 1);
    -[BSUIDateLabel setLineBreakMode:](self->_summaryDateLabel, "setLineBreakMode:", 3);
    -[NCNotificationSummaryContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_dateLabelFont
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[BSUIDateLabel font](self->_summaryDateLabel, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[NCNotificationSummaryContentView _dateLabelPreferredFont](self, "_dateLabelPreferredFont");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)_dateLabelPreferredFont
{
  return (id)objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, *MEMORY[0x1E0DC4AB8], 0, *MEMORY[0x1E0DC1440]);
}

+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a4, *(_QWORD *)&a6, 0);
  else
    objc_msgSend(MEMORY[0x1E0DC1358], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a4, *(_QWORD *)&a6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0DC13C0];
  v14 = *MEMORY[0x1E0DC1458];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorByAddingAttributes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (unint64_t)_maximumNumberOfLinesForSummaryTitleText
{
  return !UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
}

- (unint64_t)_numberOfLinesForSummaryTitleTextInFrame:(CGRect)a3
{
  return -[UILabel unui_numberOfLinesInFrame:maximum:drawingContext:](self->_summaryTitleLabel, "unui_numberOfLinesInFrame:maximum:drawingContext:", -[NCNotificationSummaryContentView _maximumNumberOfLinesForSummaryTitleText](self, "_maximumNumberOfLinesForSummaryTitleText"), self->_drawingContext, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (unint64_t)_maximumNumberOfLinesForSummaryText
{
  if (UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory))
    return 0;
  else
    return 4;
}

- (unint64_t)_numberOfLinesForSummaryTextInFrame:(CGRect)a3
{
  return -[UILabel unui_numberOfLinesInFrame:maximum:drawingContext:](self->_summaryLabel, "unui_numberOfLinesInFrame:maximum:drawingContext:", -[NCNotificationSummaryContentView _maximumNumberOfLinesForSummaryText](self, "_maximumNumberOfLinesForSummaryText"), self->_drawingContext, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (double)_widthForIconsContainerView
{
  _BOOL4 v3;
  NSUInteger v4;
  double v5;
  double v6;
  _BOOL4 v7;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;

  v3 = -[NCNotificationSummaryContentView isIconViewLeading](self, "isIconViewLeading");
  v4 = -[NSArray count](self->_iconViews, "count");
  v5 = 0.0;
  if (v4 >= 2)
  {
    v6 = (double)(-[NSArray count](self->_iconViews, "count", 0.0) - 1);
    v7 = -[NCNotificationSummaryContentView isIconViewLeading](self, "isIconViewLeading");
    v8 = -[NCNotificationSummaryContentView isIconViewLeading](self, "isIconViewLeading");
    v9 = 15.2;
    if (!v8)
      v9 = 16.0;
    v10 = 22.8;
    if (!v8)
      v10 = 24.0;
    if (!v7)
      v9 = v10;
    v5 = v9 * v6;
  }
  v11 = 40.0;
  if (v3)
    v11 = 38.0;
  return v11 + v5;
}

- (CGRect)_adjustedRectForLabelLayoutFromRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
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
  CGRect v19;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = CGRectGetWidth(a3);
  -[NCNotificationSummaryContentView horizontalLeadingMargin](self, "horizontalLeadingMargin");
  v10 = v8 - v9;
  -[NCNotificationSummaryContentView horizontalTrailingMargin](self, "horizontalTrailingMargin");
  v12 = v10 - v11;
  -[NCNotificationSummaryContentView _widthForIconsContainerView](self, "_widthForIconsContainerView");
  v14 = v13;
  if (-[NSArray count](self->_iconViews, "count") || self->_summaryIconSymbolImageView)
    v12 = v12 - (v14 + 10.0);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v15 = CGRectGetHeight(v19);
  v16 = x;
  v17 = y;
  v18 = v12;
  result.size.height = v15;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)_recycleDateLabel
{
  id v3;

  -[BSUIDateLabel setDelegate:](self->_summaryDateLabel, "setDelegate:", 0);
  -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](self->_strokeVisualStylingProvider, "stopAutomaticallyUpdatingView:", self->_summaryDateLabel);
  objc_msgSend(MEMORY[0x1E0D01918], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recycleLabel:", self->_summaryDateLabel);

}

- (void)_tearDownDateLabelIfNecessary
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __65__NCNotificationSummaryContentView__tearDownDateLabelIfNecessary__block_invoke;
  v2[3] = &unk_1E8D1B568;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

void __65__NCNotificationSummaryContentView__tearDownDateLabelIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  if (v2)
  {
    objc_msgSend(v2, "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 32), "_recycleDateLabel");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 464);
    *(_QWORD *)(v3 + 464) = 0;

  }
}

- (int64_t)_dateFormatStyleForDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  unsigned int v6;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDateInToday:", v4);

  return v6;
}

- (void)_addShadowForIconView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 v8;
  double v9;
  _BOOL4 v10;
  double v11;
  char isKindOfClass;
  double v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "layer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setShadowColor:", CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E0C9D8E0]));
  LODWORD(v5) = 1049582633;
  objc_msgSend(v15, "setShadowOpacity:", v5);
  objc_msgSend(v15, "setShadowRadius:", 2.0);
  if (-[NCNotificationSummaryContentView isIconViewLeading](self, "isIconViewLeading"))
    v6 = 33.82;
  else
    v6 = 35.6;
  if (-[NCNotificationSummaryContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    v7 = v6 * -0.1;
  }
  else
  {
    v8 = -[NCNotificationSummaryContentView isIconViewLeading](self, "isIconViewLeading");
    v9 = 40.0;
    if (v8)
      v9 = 38.0;
    v7 = v9 + v6 * -0.9;
  }
  v10 = -[NCNotificationSummaryContentView isIconViewLeading](self, "isIconViewLeading");
  v11 = 40.0;
  if (v10)
    v11 = 38.0;
  objc_msgSend(v15, "setShadowOffset:", v7, (v11 - v6) * 0.5);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v13 = v6 * 0.5;
  else
    v13 = 9.0;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v6, v6, v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v15, "setShadowPath:", objc_msgSend(v14, "CGPath"));

}

- (BOOL)isIconViewLeading
{
  return self->_iconViewLeading;
}

- (NSString)summaryTitleFontName
{
  return self->_summaryTitleFontName;
}

- (NSDate)summaryDate
{
  return self->_summaryDate;
}

- (NSString)summaryIconSymbolName
{
  return self->_summaryIconSymbolName;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (double)horizontalLeadingMargin
{
  return self->_horizontalLeadingMargin;
}

- (void)setHorizontalLeadingMargin:(double)a3
{
  self->_horizontalLeadingMargin = a3;
}

- (double)horizontalTrailingMargin
{
  return self->_horizontalTrailingMargin;
}

- (void)setHorizontalTrailingMargin:(double)a3
{
  self->_horizontalTrailingMargin = a3;
}

- (BOOL)isSummaryLabelMaterialSecondary
{
  return self->_summaryLabelMaterialSecondary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_summaryIconSymbolName, 0);
  objc_storeStrong((id *)&self->_summaryDate, 0);
  objc_storeStrong((id *)&self->_summaryTitleFontName, 0);
  objc_storeStrong((id *)&self->_drawingContext, 0);
  objc_storeStrong((id *)&self->_strokeVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_summaryDateLabel, 0);
  objc_storeStrong((id *)&self->_summaryIconSymbolBackgroundView, 0);
  objc_storeStrong((id *)&self->_summaryIconSymbolImageView, 0);
  objc_storeStrong((id *)&self->_iconViews, 0);
  objc_storeStrong((id *)&self->_summaryIconsContainerView, 0);
  objc_storeStrong((id *)&self->_summaryLabel, 0);
  objc_storeStrong((id *)&self->_summaryTitleLabel, 0);
}

@end
