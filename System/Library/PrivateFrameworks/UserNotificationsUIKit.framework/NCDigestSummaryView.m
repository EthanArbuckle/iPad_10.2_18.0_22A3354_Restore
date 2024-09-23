@implementation NCDigestSummaryView

- (void)updateContent
{
  -[NCDigestFeaturedNotificationsContainerDisplaying updateContent](self->_featuredNotificationsContainerView, "updateContent");
  -[NCDigestSummaryView _configureSummaryContentView:withSummaryContentProvider:](self, "_configureSummaryContentView:withSummaryContentProvider:", self->_communicationsSummaryContentView, self->_communicationsSummaryContentProvider);
  -[NCDigestSummaryView _configureSummaryContentView:withSummaryContentProvider:](self, "_configureSummaryContentView:withSummaryContentProvider:", self->_appsSummaryContentView, self->_appsSummaryContentProvider);
  -[NCDigestSummaryView setNeedsLayout](self, "setNeedsLayout");
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

    -[NCDigestSummaryView _tearDownTimeStampLabel](self, "_tearDownTimeStampLabel");
    -[NCDigestSummaryView setNeedsLayout](self, "setNeedsLayout");
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

    -[NCDigestSummaryView _tearDownTimeStampLabel](self, "_tearDownTimeStampLabel");
    -[NCDigestSummaryView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setDateFormatStyle:(int64_t)a3
{
  if (self->_dateFormatStyle != a3)
  {
    self->_dateFormatStyle = a3;
    -[NCDigestSummaryView _tearDownTimeStampLabel](self, "_tearDownTimeStampLabel");
    -[NCDigestSummaryView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)heading
{
  return -[UILabel text](self->_headingLabel, "text");
}

- (void)setHeading:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  UILabel *headingLabel;
  UILabel *v8;
  UILabel *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  id v13;

  v13 = a3;
  -[NCDigestSummaryView heading](self, "heading");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  v6 = v13;
  if ((v5 & 1) == 0)
  {
    headingLabel = self->_headingLabel;
    if (v13)
    {
      if (!headingLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v9 = self->_headingLabel;
        self->_headingLabel = v8;

        -[UILabel setLineBreakMode:](self->_headingLabel, "setLineBreakMode:", 4);
        -[NCDigestSummaryView addSubview:](self, "addSubview:", self->_headingLabel);
        -[NCDigestSummaryView _updateTextAttributesForHeadingLabel](self, "_updateTextAttributesForHeadingLabel");
        v10 = self->_headingLabel;
        -[NCDigestSummaryView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCDigestSummaryView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v10, 0, v11, 0);

        v6 = v13;
        headingLabel = self->_headingLabel;
      }
      -[UILabel setText:](headingLabel, "setText:", v6);
    }
    else
    {
      -[UILabel removeFromSuperview](headingLabel, "removeFromSuperview");
      v12 = self->_headingLabel;
      self->_headingLabel = 0;

    }
    -[NCDigestSummaryView setNeedsLayout](self, "setNeedsLayout");
    v6 = v13;
  }

}

- (NSString)subheading
{
  return -[UILabel text](self->_subheadingLabel, "text");
}

- (void)setSubheading:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  UILabel *subheadingLabel;
  UILabel *v8;
  UILabel *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  id v13;

  v13 = a3;
  -[NCDigestSummaryView subheading](self, "subheading");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  v6 = v13;
  if ((v5 & 1) == 0)
  {
    subheadingLabel = self->_subheadingLabel;
    if (v13)
    {
      if (!subheadingLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v9 = self->_subheadingLabel;
        self->_subheadingLabel = v8;

        -[UILabel setLineBreakMode:](self->_subheadingLabel, "setLineBreakMode:", 4);
        -[NCDigestSummaryView addSubview:](self, "addSubview:", self->_subheadingLabel);
        -[NCDigestSummaryView _updateTextAttributesForSubheadingLabel](self, "_updateTextAttributesForSubheadingLabel");
        v10 = self->_subheadingLabel;
        -[NCDigestSummaryView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCDigestSummaryView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v10, 0, v11, 0);

        v6 = v13;
        subheadingLabel = self->_subheadingLabel;
      }
      -[UILabel setText:](subheadingLabel, "setText:", v6);
    }
    else
    {
      -[UILabel removeFromSuperview](subheadingLabel, "removeFromSuperview");
      v12 = self->_subheadingLabel;
      self->_subheadingLabel = 0;

    }
    -[NCDigestSummaryView setNeedsLayout](self, "setNeedsLayout");
    v6 = v13;
  }

}

- (void)setCount:(unint64_t)count
{
  UILabel *countLabel;
  UIView *v5;
  UIView *countBackgroundView;
  void *v7;
  UIView *v8;
  void *v9;
  UILabel *v10;
  UILabel *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  UIView *v17;
  id v18;

  if (self->_count != count)
  {
    self->_count = count;
    countLabel = self->_countLabel;
    if (count)
    {
      if (!countLabel)
      {
        v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        countBackgroundView = self->_countBackgroundView;
        self->_countBackgroundView = v5;

        -[UIView layer](self->_countBackgroundView, "layer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setCornerCurve:", *MEMORY[0x1E0CD2A60]);

        -[NCDigestSummaryView addSubview:](self, "addSubview:", self->_countBackgroundView);
        v8 = self->_countBackgroundView;
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

        -[UIView setAlpha:](self->_countBackgroundView, "setAlpha:", 0.25);
        v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v11 = self->_countLabel;
        self->_countLabel = v10;

        -[UILabel setTextAlignment:](self->_countLabel, "setTextAlignment:", 1);
        v12 = self->_countLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        -[NCDigestSummaryView addSubview:](self, "addSubview:", self->_countLabel);
        -[NCDigestSummaryView _updateTextAttributesForCountLabel](self, "_updateTextAttributesForCountLabel");
        countLabel = self->_countLabel;
        count = self->_count;
      }
      v14 = (void *)MEMORY[0x1E0CB37F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", count);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringFromNumber:numberStyle:", v18, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](countLabel, "setText:", v15);

    }
    else if (countLabel)
    {
      -[UILabel removeFromSuperview](self->_countLabel, "removeFromSuperview");
      v16 = self->_countLabel;
      self->_countLabel = 0;

      -[UIView removeFromSuperview](self->_countBackgroundView, "removeFromSuperview");
      v17 = self->_countBackgroundView;
      self->_countBackgroundView = 0;

      -[NCDigestSummaryView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setPresentFeaturedNotificationsInline:(BOOL)a3
{
  NCDigestFeaturedNotificationsContainerDisplaying *featuredNotificationsContainerView;
  id v5;

  if (self->_presentFeaturedNotificationsInline != a3)
  {
    self->_presentFeaturedNotificationsInline = a3;
    -[NCDigestSummaryView featuredNotificationContentProviders](self, "featuredNotificationContentProviders");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[NCDigestFeaturedNotificationsContainerDisplaying removeFromSuperview](self->_featuredNotificationsContainerView, "removeFromSuperview");
    featuredNotificationsContainerView = self->_featuredNotificationsContainerView;
    self->_featuredNotificationsContainerView = 0;

    -[NCDigestSummaryView setFeaturedNotificationContentProviders:](self, "setFeaturedNotificationContentProviders:", v5);
  }
}

- (NSArray)featuredNotificationContentProviders
{
  return (NSArray *)-[NCDigestFeaturedNotificationsContainerDisplaying featuredNotificationContentProviders](self->_featuredNotificationsContainerView, "featuredNotificationContentProviders");
}

- (void)setFeaturedNotificationContentProviders:(id)a3
{
  void *v4;
  char v5;
  uint64_t v6;
  NCDigestFeaturedNotificationsContainerDisplaying *featuredNotificationsContainerView;
  _BOOL4 v8;
  __objc2_class **v9;
  id v10;
  NCDigestFeaturedNotificationsContainerDisplaying *v11;
  NCDigestFeaturedNotificationsContainerDisplaying *v12;
  NCDigestFeaturedNotificationsContainerDisplaying *v13;
  id v14;

  v14 = a3;
  -[NCDigestSummaryView featuredNotificationContentProviders](self, "featuredNotificationContentProviders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualArrays();

  if ((v5 & 1) != 0)
  {
    -[NCDigestFeaturedNotificationsContainerDisplaying updateContent](self->_featuredNotificationsContainerView, "updateContent");
  }
  else
  {
    v6 = objc_msgSend(v14, "count");
    featuredNotificationsContainerView = self->_featuredNotificationsContainerView;
    if (v6)
    {
      if (!featuredNotificationsContainerView)
      {
        v8 = -[NCDigestSummaryView presentFeaturedNotificationsInline](self, "presentFeaturedNotificationsInline");
        v9 = off_1E8D19CA0;
        if (!v8)
          v9 = off_1E8D19CB0;
        v10 = objc_alloc(*v9);
        v11 = (NCDigestFeaturedNotificationsContainerDisplaying *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v12 = self->_featuredNotificationsContainerView;
        self->_featuredNotificationsContainerView = v11;

        -[NCDigestFeaturedNotificationsContainerDisplaying setMaterialGroupNameBase:](self->_featuredNotificationsContainerView, "setMaterialGroupNameBase:", self->_materialGroupNameBase);
        -[NCDigestFeaturedNotificationsContainerDisplaying setVisualStylingProvider:forCategory:](self->_featuredNotificationsContainerView, "setVisualStylingProvider:forCategory:", self->_strokeVisualStylingProvider, 1);
        -[NCDigestSummaryView addSubview:](self, "addSubview:", self->_featuredNotificationsContainerView);
        featuredNotificationsContainerView = self->_featuredNotificationsContainerView;
      }
      -[NCDigestFeaturedNotificationsContainerDisplaying setFeaturedNotificationContentProviders:](featuredNotificationsContainerView, "setFeaturedNotificationContentProviders:", v14);
    }
    else
    {
      -[NCDigestFeaturedNotificationsContainerDisplaying removeFromSuperview](featuredNotificationsContainerView, "removeFromSuperview");
      v13 = self->_featuredNotificationsContainerView;
      self->_featuredNotificationsContainerView = 0;

    }
    -[NCDigestSummaryView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setCommunicationsSummaryContentProvider:(id)a3
{
  void *v4;
  char v5;
  NCNotificationSummaryContentView *communicationsSummaryContentView;
  void *communicationsSummaryContentProvider;
  NCNotificationSummaryContentView *v8;
  NCNotificationSummaryContentView *v9;
  NCNotificationSummaryContentProviding *v10;
  id v11;

  v11 = a3;
  -[NCDigestSummaryView communicationsSummaryContentProvider](self, "communicationsSummaryContentProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) != 0)
  {
    -[NCDigestSummaryView _configureSummaryContentView:withSummaryContentProvider:](self, "_configureSummaryContentView:withSummaryContentProvider:", self->_communicationsSummaryContentView, v11);
  }
  else
  {
    communicationsSummaryContentView = self->_communicationsSummaryContentView;
    if (v11)
    {
      if (communicationsSummaryContentView)
      {
        -[NCDigestSummaryView _configureSummaryContentView:withSummaryContentProvider:](self, "_configureSummaryContentView:withSummaryContentProvider:");
      }
      else
      {
        v8 = -[NCDigestSummaryView _newSummaryContentViewForSummaryContentProvider:](self, "_newSummaryContentViewForSummaryContentProvider:", v11);
        v9 = self->_communicationsSummaryContentView;
        self->_communicationsSummaryContentView = v8;

        -[NCNotificationSummaryContentView setHorizontalLeadingMargin:](self->_communicationsSummaryContentView, "setHorizontalLeadingMargin:", 0.0);
        -[NCDigestSummaryView addSubview:](self, "addSubview:", self->_communicationsSummaryContentView);
      }
      v10 = (NCNotificationSummaryContentProviding *)v11;
      communicationsSummaryContentProvider = self->_communicationsSummaryContentProvider;
      self->_communicationsSummaryContentProvider = v10;
    }
    else
    {
      -[NCNotificationSummaryContentView removeFromSuperview](communicationsSummaryContentView, "removeFromSuperview");
      communicationsSummaryContentProvider = self->_communicationsSummaryContentView;
      self->_communicationsSummaryContentView = 0;
    }

    -[NCDigestSummaryView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setAppsSummaryContentProvider:(id)a3
{
  void *v4;
  char v5;
  NCNotificationSummaryContentView *appsSummaryContentView;
  void *appsSummaryContentProvider;
  NCNotificationSummaryContentView *v8;
  NCNotificationSummaryContentView *v9;
  NCNotificationSummaryContentProviding *v10;
  id v11;

  v11 = a3;
  -[NCDigestSummaryView appsSummaryContentProvider](self, "appsSummaryContentProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) != 0)
  {
    -[NCDigestSummaryView _configureSummaryContentView:withSummaryContentProvider:](self, "_configureSummaryContentView:withSummaryContentProvider:", self->_appsSummaryContentView, v11);
  }
  else
  {
    appsSummaryContentView = self->_appsSummaryContentView;
    if (v11)
    {
      if (appsSummaryContentView)
      {
        -[NCDigestSummaryView _configureSummaryContentView:withSummaryContentProvider:](self, "_configureSummaryContentView:withSummaryContentProvider:");
      }
      else
      {
        v8 = -[NCDigestSummaryView _newSummaryContentViewForSummaryContentProvider:](self, "_newSummaryContentViewForSummaryContentProvider:", v11);
        v9 = self->_appsSummaryContentView;
        self->_appsSummaryContentView = v8;

        -[NCNotificationSummaryContentView setHorizontalLeadingMargin:](self->_appsSummaryContentView, "setHorizontalLeadingMargin:", 0.0);
        -[NCNotificationSummaryContentView setHorizontalTrailingMargin:](self->_appsSummaryContentView, "setHorizontalTrailingMargin:", 0.0);
        -[NCNotificationSummaryContentView setVisualStylingProvider:forCategory:](self->_appsSummaryContentView, "setVisualStylingProvider:forCategory:", self->_strokeVisualStylingProvider, 1);
        -[NCNotificationSummaryContentView setSummaryLabelMaterialSecondary:](self->_appsSummaryContentView, "setSummaryLabelMaterialSecondary:", 1);
        -[NCDigestSummaryView addSubview:](self, "addSubview:", self->_appsSummaryContentView);
      }
      v10 = (NCNotificationSummaryContentProviding *)v11;
      appsSummaryContentProvider = self->_appsSummaryContentProvider;
      self->_appsSummaryContentProvider = v10;
    }
    else
    {
      -[NCNotificationSummaryContentView removeFromSuperview](appsSummaryContentView, "removeFromSuperview");
      appsSummaryContentProvider = self->_appsSummaryContentView;
      self->_appsSummaryContentView = 0;
    }

    -[NCDigestSummaryView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setClearControlView:(id)a3
{
  UIView *v5;
  UIView *clearControlView;
  UIView *v7;

  v5 = (UIView *)a3;
  clearControlView = self->_clearControlView;
  if (clearControlView != v5)
  {
    v7 = v5;
    if (clearControlView)
      -[UIView removeFromSuperview](clearControlView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_clearControlView, a3);
    if (v7)
      -[NCDigestSummaryView addSubview:](self, "addSubview:", v7);
    -[NCDigestSummaryView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  UILabel *subheadingLabel;
  NCNotificationSummaryContentView *communicationsSummaryContentView;
  _BOOL4 v17;
  NCDigestFeaturedNotificationsContainerDisplaying *featuredNotificationsContainerView;
  double v19;
  NCNotificationSummaryContentView *appsSummaryContentView;
  double v21;
  double v22;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[NCDigestSummaryView _layoutBoundsForTitleLabelInBounds:](self, "_layoutBoundsForTitleLabelInBounds:", 0.0, 0.0, a3.width, a3.height);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  if (self->_timeStampLabel)
  {
    -[NCDigestSummaryView _timeStampLabelFont](self, "_timeStampLabelFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lineHeight");

  }
  -[UILabel unui_measuringHeightWithNumberOfLines:](self->_headingLabel, "unui_measuringHeightWithNumberOfLines:", -[NCDigestSummaryView _numberOfLinesForHeadingLabelInRect:](self, "_numberOfLinesForHeadingLabelInRect:", v7, v9, v11, v13));
  subheadingLabel = self->_subheadingLabel;
  if (subheadingLabel)
    -[UILabel unui_measuringHeightWithNumberOfLines:](subheadingLabel, "unui_measuringHeightWithNumberOfLines:", -[NCDigestSummaryView _numberOfLinesForSubheadingLabelInRect:](self, "_numberOfLinesForSubheadingLabelInRect:", v7, v9, v11, v13));
  communicationsSummaryContentView = self->_communicationsSummaryContentView;
  if (communicationsSummaryContentView)
    -[NCNotificationSummaryContentView sizeThatFits:](communicationsSummaryContentView, "sizeThatFits:", width + -36.0, height);
  v17 = -[NCDigestSummaryView presentFeaturedNotificationsInline](self, "presentFeaturedNotificationsInline");
  featuredNotificationsContainerView = self->_featuredNotificationsContainerView;
  if (featuredNotificationsContainerView)
  {
    v19 = width + -36.0 + 24.0;
    if (!v17)
      v19 = width + -36.0;
    -[NCDigestFeaturedNotificationsContainerDisplaying sizeThatFits:](featuredNotificationsContainerView, "sizeThatFits:", v19, height);
  }
  appsSummaryContentView = self->_appsSummaryContentView;
  if (appsSummaryContentView)
    -[NCNotificationSummaryContentView sizeThatFits:](appsSummaryContentView, "sizeThatFits:", width + -36.0, height);
  UISizeRoundToScale();
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  UILabel *countLabel;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  UIView *clearControlView;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  CGFloat Width;
  double v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  UILabel *subheadingLabel;
  double v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double height;
  NCNotificationSummaryContentView *communicationsSummaryContentView;
  NCDigestFeaturedNotificationsContainerDisplaying *featuredNotificationsContainerView;
  _BOOL4 v73;
  double v74;
  NCNotificationSummaryContentView *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  NCDigestFeaturedNotificationsContainerDisplaying *v80;
  NCNotificationSummaryContentView *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double rect;
  double rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  CGFloat v91;
  CGFloat v92;
  objc_super v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;

  v93.receiver = self;
  v93.super_class = (Class)NCDigestSummaryView;
  -[NCDigestSummaryView layoutSubviews](&v93, sel_layoutSubviews);
  -[NCDigestSummaryView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[NCDigestSummaryView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if ((v11 & 1) == 0)
  {
    v94.origin.x = v4;
    v94.origin.y = v6;
    v94.size.width = v8;
    v94.size.height = v10;
    CGRectGetWidth(v94);
  }
  countLabel = self->_countLabel;
  if (countLabel)
  {
    -[UILabel sizeThatFits:](countLabel, "sizeThatFits:", v8, v10);
    if ((v11 & 1) == 0)
    {
      v95.origin.x = v4;
      v95.origin.y = v6;
      v95.size.width = v8;
      v95.size.height = v10;
      CGRectGetWidth(v95);
    }
    UIRectIntegralWithScale();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[UIView setFrame:](self->_countBackgroundView, "setFrame:");
    -[UIView layer](self->_countBackgroundView, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v96.origin.x = v14;
    v96.origin.y = v16;
    v96.size.width = v18;
    v96.size.height = v20;
    objc_msgSend(v21, "setCornerRadius:", CGRectGetHeight(v96) * 0.5);

    -[UILabel setFrame:](self->_countLabel, "setFrame:", v14, v16, v18, v20);
  }
  clearControlView = self->_clearControlView;
  if (clearControlView)
  {
    v23 = 0.0;
    if (!self->_countLabel)
      v23 = 1.0;
    -[UIView setAlpha:](clearControlView, "setAlpha:", v23);
    -[UIView sizeThatFits:](self->_clearControlView, "sizeThatFits:", v8, v10);
    if ((v11 & 1) == 0)
    {
      v97.origin.x = v4;
      v97.origin.y = v6;
      v97.size.width = v8;
      v97.size.height = v10;
      CGRectGetWidth(v97);
    }
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_clearControlView, "setFrame:");
  }
  -[NCDigestSummaryView _layoutBoundsForTitleLabelInBounds:](self, "_layoutBoundsForTitleLabelInBounds:", v4, v6, v8, v10);
  v25 = v24;
  v26 = v6;
  v28 = v27;
  v29 = v8;
  v31 = v30;
  v32 = v10;
  v34 = v33;
  v91 = v26;
  v92 = v4;
  rect_16 = v32;
  rect_24 = v29;
  if ((v11 & 1) != 0)
  {
    v98.origin.x = v4;
    v98.origin.y = v26;
    v98.size.width = v29;
    v98.size.height = v32;
    CGRectGetMaxX(v98);
    v99.origin.x = v25;
    v99.origin.y = v28;
    v99.size.width = v31;
    v99.size.height = v34;
    CGRectGetWidth(v99);
  }
  rect = v25;
  v100.origin.x = v25;
  v100.origin.y = v28;
  v100.size.width = v31;
  v100.size.height = v34;
  CGRectGetWidth(v100);
  -[NCDigestSummaryView _timeStampLabelFont](self, "_timeStampLabelFont");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "lineHeight");
  -[NCDigestSummaryView traitCollection](self, "traitCollection");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "displayScale");
  UICeilToScale();
  rect_8 = 18.0;
  UIRectIntegralWithScale();

  -[NCDigestSummaryView _configureTimeStampLabelIfNecessary](self, "_configureTimeStampLabelIfNecessary");
  UIRectIntegralWithScale();
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;
  -[BSUIDateLabel setFrame:](self->_timeStampLabel, "setFrame:");
  -[UILabel frame](self->_headingLabel, "frame");
  v45 = 18.0;
  if (v11)
  {
    v101.origin.y = v91;
    v101.origin.x = v92;
    v101.size.height = rect_16;
    v101.size.width = rect_24;
    v46 = CGRectGetMaxX(v101) + -18.0;
    v102.origin.x = rect;
    v102.origin.y = v28;
    v102.size.width = v31;
    v102.size.height = v34;
    v45 = v46 - CGRectGetWidth(v102);
  }
  if (self->_timeStampLabel)
  {
    v103.origin.x = v38;
    v103.origin.y = v40;
    v103.size.width = v42;
    v103.size.height = v44;
    rect_8 = CGRectGetMaxY(v103) + 2.0;
  }
  v104.origin.x = rect;
  v104.origin.y = v28;
  v104.size.width = v31;
  v104.size.height = v34;
  Width = CGRectGetWidth(v104);
  -[UILabel unui_measuringHeightWithNumberOfLines:](self->_headingLabel, "unui_measuringHeightWithNumberOfLines:", -[NCDigestSummaryView _numberOfLinesForHeadingLabelInRect:](self, "_numberOfLinesForHeadingLabelInRect:", rect, v28, v31, v34));
  v49 = v48;
  v86 = v34;
  -[UILabel unui_drawingHeightWithNumberOfLines:](self->_headingLabel, "unui_drawingHeightWithNumberOfLines:", -[NCDigestSummaryView _numberOfLinesForHeadingLabelInRect:](self, "_numberOfLinesForHeadingLabelInRect:", rect, v28, v31, v34));
  v105.origin.x = v45;
  v105.origin.y = rect_8;
  v105.size.width = Width;
  v105.size.height = v49;
  CGRectGetWidth(v105);
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v57 = v56;
  -[UILabel setFrame:](self->_headingLabel, "setFrame:", 0);
  subheadingLabel = self->_subheadingLabel;
  if (subheadingLabel)
  {
    -[UILabel frame](subheadingLabel, "frame");
    v59 = 18.0;
    if (v11)
    {
      v106.origin.y = v91;
      v106.origin.x = v92;
      v106.size.height = rect_16;
      v106.size.width = rect_24;
      v60 = CGRectGetMaxX(v106) + -18.0;
      v107.origin.x = rect;
      v107.origin.y = v28;
      v107.size.width = v31;
      v107.size.height = v86;
      v59 = v60 - CGRectGetWidth(v107);
    }
    v108.origin.x = v57;
    v108.origin.y = v51;
    v108.size.width = v53;
    v108.size.height = v55;
    v61 = CGRectGetMaxY(v108) + 1.0;
    v109.origin.x = rect;
    v109.origin.y = v28;
    v109.size.width = v31;
    v109.size.height = v86;
    v62 = CGRectGetWidth(v109);
    -[UILabel unui_measuringHeightWithNumberOfLines:](self->_subheadingLabel, "unui_measuringHeightWithNumberOfLines:", -[NCDigestSummaryView _numberOfLinesForSubheadingLabelInRect:](self, "_numberOfLinesForSubheadingLabelInRect:", rect, v28, v31, v86));
    v64 = v63;
    -[UILabel unui_drawingHeightWithNumberOfLines:](self->_subheadingLabel, "unui_drawingHeightWithNumberOfLines:", -[NCDigestSummaryView _numberOfLinesForSubheadingLabelInRect:](self, "_numberOfLinesForSubheadingLabelInRect:", rect, v28, v31, v86));
    v110.origin.x = v59;
    v110.origin.y = v61;
    v110.size.width = v62;
    v110.size.height = v64;
    CGRectGetWidth(v110);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    v57 = v65;
    v51 = v66;
    v53 = v67;
    v55 = v68;
    -[UILabel setFrame:](self->_subheadingLabel, "setFrame:", 0);
  }
  v111.origin.y = v91;
  v111.origin.x = v92;
  v111.size.height = rect_16;
  v111.size.width = rect_24;
  v112 = CGRectInset(v111, 18.0, 0.0);
  v69 = v112.size.width;
  height = v112.size.height;
  communicationsSummaryContentView = self->_communicationsSummaryContentView;
  if (communicationsSummaryContentView)
  {
    -[NCNotificationSummaryContentView sizeThatFits:](communicationsSummaryContentView, "sizeThatFits:", v112.size.width, v112.size.height);
    v113.origin.x = v57;
    v113.origin.y = v51;
    v113.size.width = v53;
    v113.size.height = v55;
    CGRectGetMaxY(v113);
    UIRectIntegralWithScale();
    -[NCNotificationSummaryContentView setFrame:](self->_communicationsSummaryContentView, "setFrame:");
  }
  featuredNotificationsContainerView = self->_featuredNotificationsContainerView;
  if (featuredNotificationsContainerView)
  {
    -[NCDigestFeaturedNotificationsContainerDisplaying frame](featuredNotificationsContainerView, "frame", v112.origin.x, v112.origin.y);
    v73 = -[NCDigestSummaryView presentFeaturedNotificationsInline](self, "presentFeaturedNotificationsInline");
    v74 = v69 + 24.0;
    if (!v73)
      v74 = v69;
    -[NCDigestFeaturedNotificationsContainerDisplaying sizeThatFits:](self->_featuredNotificationsContainerView, "sizeThatFits:", v74, height);
    v75 = self->_communicationsSummaryContentView;
    v76 = v57;
    v77 = v51;
    v78 = v53;
    v79 = v55;
    if (v75)
      -[NCNotificationSummaryContentView frame](v75, "frame", v57, v51, v53, v55);
    CGRectGetMaxY(*(CGRect *)&v76);
    -[NCDigestSummaryView presentFeaturedNotificationsInline](self, "presentFeaturedNotificationsInline");
    UIRectIntegralWithScale();
    -[NCDigestFeaturedNotificationsContainerDisplaying setFrame:](self->_featuredNotificationsContainerView, "setFrame:");
  }
  if (self->_appsSummaryContentView)
  {
    v80 = self->_featuredNotificationsContainerView;
    if (v80)
    {
      -[NCDigestFeaturedNotificationsContainerDisplaying frame](v80, "frame", v112.origin.x, v112.origin.y);
      CGRectGetMaxY(v114);
    }
    else
    {
      v81 = self->_communicationsSummaryContentView;
      if (v81)
      {
        -[NCNotificationSummaryContentView frame](v81, "frame", v112.origin.x, v112.origin.y);
        v57 = v82;
        v51 = v83;
        v53 = v84;
        v55 = v85;
      }
      v115.origin.x = v57;
      v115.origin.y = v51;
      v115.size.width = v53;
      v115.size.height = v55;
      CGRectGetMaxY(v115);
    }
    -[NCNotificationSummaryContentView sizeThatFits:](self->_appsSummaryContentView, "sizeThatFits:", v69, height);
    UIRectIntegralWithScale();
    -[NCNotificationSummaryContentView setFrame:](self->_appsSummaryContentView, "setFrame:");
  }
}

- (void)didMoveToWindow
{
  void *v3;

  -[NCDigestSummaryView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[NCDigestSummaryView adjustForContentSizeCategoryChange](self, "adjustForContentSizeCategoryChange");
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  NSString *v4;
  NSComparisonResult v5;

  -[NCDigestSummaryView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  v5 = UIContentSizeCategoryCompareToCategory(v4, self->_preferredContentSizeCategory);
  if (v5)
  {
    objc_storeStrong((id *)&self->_preferredContentSizeCategory, v4);
    -[NCDigestFeaturedNotificationsContainerDisplaying adjustForContentSizeCategoryChange](self->_featuredNotificationsContainerView, "adjustForContentSizeCategoryChange");
    -[NCNotificationSummaryContentView adjustForContentSizeCategoryChange](self->_communicationsSummaryContentView, "adjustForContentSizeCategoryChange");
    -[NCNotificationSummaryContentView adjustForContentSizeCategoryChange](self->_appsSummaryContentView, "adjustForContentSizeCategoryChange");
    -[NCDigestSummaryView _updateTextAttributes](self, "_updateTextAttributes");
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
  v5.super_class = (Class)NCDigestSummaryView;
  -[NCDigestSummaryView visualStylingProviderForCategory:](&v5, sel_visualStylingProviderForCategory_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1E8D5FD90;
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

    -[NCDigestSummaryView _visualStylingProviderDidChange:forCategory:outgoingProvider:](self, "_visualStylingProviderDidChange:forCategory:outgoingProvider:", self->_strokeVisualStylingProvider, a4, v10);
    -[NCDigestFeaturedNotificationsContainerDisplaying setVisualStylingProvider:forCategory:](self->_featuredNotificationsContainerView, "setVisualStylingProvider:forCategory:", self->_strokeVisualStylingProvider, a4);
    -[NCNotificationSummaryContentView setVisualStylingProvider:forCategory:](self->_appsSummaryContentView, "setVisualStylingProvider:forCategory:", self->_strokeVisualStylingProvider, a4);

    v6 = v11;
  }

}

- (void)setMaterialGroupNameBase:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
  v5 = a3;
  -[NCDigestFeaturedNotificationsContainerDisplaying setMaterialGroupNameBase:](self->_featuredNotificationsContainerView, "setMaterialGroupNameBase:", v5);

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

- (id)_timeStampLabelFont
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[BSUIDateLabel font](self->_timeStampLabel, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[NCDigestSummaryView _timeStampLabelPreferredFont](self, "_timeStampLabelPreferredFont");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)_timeStampLabelPreferredFont
{
  return (id)objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, *MEMORY[0x1E0DC4AB8], 0, *MEMORY[0x1E0DC1428]);
}

- (id)_fontProvider
{
  BSUIFontProvider *v3;
  BSUIFontProvider *fontProvider;

  if (!self->_fontProvider)
  {
    if (-[NCDigestSummaryView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))
      objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
    else
      objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
    v3 = (BSUIFontProvider *)objc_claimAutoreleasedReturnValue();
    fontProvider = self->_fontProvider;
    self->_fontProvider = v3;

  }
  return self->_fontProvider;
}

- (void)_setFontProvider:(id)a3
{
  id v5;

  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fontProvider, a3);
    -[NCDigestSummaryView _updateTextAttributes](self, "_updateTextAttributes");
  }

}

- (void)_updateTextAttributesForDateLabel
{
  BSUIDateLabel *timeStampLabel;
  void *v4;

  timeStampLabel = self->_timeStampLabel;
  if (timeStampLabel)
  {
    -[NCDigestSummaryView _timeStampLabelPreferredFont](self, "_timeStampLabelPreferredFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIDateLabel setFont:](timeStampLabel, "setFont:", v4);

    -[BSUIDateLabel setNumberOfLines:](self->_timeStampLabel, "setNumberOfLines:", 1);
    -[BSUIDateLabel setLineBreakMode:](self->_timeStampLabel, "setLineBreakMode:", 3);
    -[NCDigestSummaryView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTextAttributesForHeadingLabel
{
  UILabel *headingLabel;
  void *v4;

  headingLabel = self->_headingLabel;
  if (headingLabel)
  {
    objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, *MEMORY[0x1E0DC4B58], 0, *MEMORY[0x1E0DC1448]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](headingLabel, "setFont:", v4);

    -[UILabel setNumberOfLines:](self->_headingLabel, "setNumberOfLines:", 0);
    -[NCDigestSummaryView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (unint64_t)_numberOfLinesForHeadingLabelInRect:(CGRect)a3
{
  return -[UILabel unui_numberOfLinesInFrame:maximum:drawingContext:](self->_headingLabel, "unui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_updateTextAttributesForSubheadingLabel
{
  UILabel *subheadingLabel;
  void *v4;

  subheadingLabel = self->_subheadingLabel;
  if (subheadingLabel)
  {
    objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, *MEMORY[0x1E0DC4AB8], 0, *MEMORY[0x1E0DC1440]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](subheadingLabel, "setFont:", v4);

    -[UILabel setNumberOfLines:](self->_subheadingLabel, "setNumberOfLines:", 0);
    -[NCDigestSummaryView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (unint64_t)_numberOfLinesForSubheadingLabelInRect:(CGRect)a3
{
  return -[UILabel unui_numberOfLinesInFrame:maximum:drawingContext:](self->_subheadingLabel, "unui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_updateTextAttributesForCountLabel
{
  _BOOL4 IsAccessibilityCategory;
  id *v4;
  UILabel *countLabel;
  id v6;
  void *v7;

  if (self->_countLabel)
  {
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    v4 = (id *)MEMORY[0x1E0DC4A88];
    if (!IsAccessibilityCategory)
      v4 = (id *)MEMORY[0x1E0DC4B10];
    countLabel = self->_countLabel;
    v6 = *v4;
    objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, v6, 0, *MEMORY[0x1E0DC1448]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](countLabel, "setFont:", v7);
    -[NCDigestSummaryView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTextAttributes
{
  -[NCDigestSummaryView _updateTextAttributesForDateLabel](self, "_updateTextAttributesForDateLabel");
  -[NCDigestSummaryView _updateTextAttributesForHeadingLabel](self, "_updateTextAttributesForHeadingLabel");
  -[NCDigestSummaryView _updateTextAttributesForSubheadingLabel](self, "_updateTextAttributesForSubheadingLabel");
  -[NCDigestSummaryView _updateTextAttributesForCountLabel](self, "_updateTextAttributesForCountLabel");
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

- (void)_updateVisualStylingProvidersForViewIfNecessary:(id)a3
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
          -[NCDigestSummaryView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", v10);
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

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  BSUIDateLabel *timeStampLabel;
  id v8;
  id v9;

  if (a4 == 1)
  {
    timeStampLabel = self->_timeStampLabel;
    v8 = a5;
    v9 = a3;
    -[NCDigestSummaryView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", timeStampLabel, 1, v9, v8);
    -[NCDigestSummaryView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_headingLabel, 0, v9, v8);
    -[NCDigestSummaryView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_subheadingLabel, 0, v9, v8);

  }
}

- (void)_configureTimeStampLabelIfNecessary
{
  if (!self->_timeStampLabel)
  {
    if (self->_date)
      -[NCDigestSummaryView _configureTimeStampLabel](self, "_configureTimeStampLabel");
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
  -[NCDigestSummaryView addSubview:](self, "addSubview:", self->_timeStampLabel);
  -[NCDigestSummaryView _updateTextAttributesForDateLabel](self, "_updateTextAttributesForDateLabel");
  v6 = self->_timeStampLabel;
  -[NCDigestSummaryView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NCDigestSummaryView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v6, 1, v7, 0);

}

- (void)_recycleTimeStampLabel
{
  BSUIDateLabel *timeStampLabel;
  void *v4;
  id v5;

  -[BSUIDateLabel setDelegate:](self->_timeStampLabel, "setDelegate:", 0);
  timeStampLabel = self->_timeStampLabel;
  -[NCDigestSummaryView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCDigestSummaryView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", timeStampLabel, 1, 0, v4);

  objc_msgSend(MEMORY[0x1E0D01918], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recycleLabel:", self->_timeStampLabel);

}

- (void)_tearDownTimeStampLabel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__NCDigestSummaryView__tearDownTimeStampLabel__block_invoke;
  v2[3] = &unk_1E8D1B568;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

void __46__NCDigestSummaryView__tearDownTimeStampLabel__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  if (v2)
  {
    objc_msgSend(v2, "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 32), "_recycleTimeStampLabel");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 416);
    *(_QWORD *)(v3 + 416) = 0;

  }
}

- (CGRect)_layoutBoundsForTitleLabelInBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIView *countBackgroundView;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  countBackgroundView = self->_countBackgroundView;
  if (countBackgroundView || (countBackgroundView = self->_clearControlView) != 0)
  {
    -[UIView frame](countBackgroundView, "frame");
    v8 = CGRectGetWidth(v14);
  }
  else
  {
    v8 = 40.0;
  }
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v9 = CGRectGetWidth(v15) + -36.0 - v8 + -4.0;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v10 = CGRectGetHeight(v16);
  v11 = 0.0;
  v12 = 0.0;
  v13 = v9;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)_newSummaryContentViewForSummaryContentProvider:(id)a3
{
  id v4;
  NCNotificationSummaryContentView *v5;
  NCNotificationSummaryContentView *v6;

  v4 = a3;
  v5 = [NCNotificationSummaryContentView alloc];
  v6 = -[NCNotificationSummaryContentView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[NCDigestSummaryView _configureSummaryContentView:withSummaryContentProvider:](self, "_configureSummaryContentView:withSummaryContentProvider:", v6, v4);

  return v6;
}

- (void)_configureSummaryContentView:(id)a3 withSummaryContentProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(v6, "summaryTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSummaryTitle:", v8);

    objc_msgSend(v6, "summary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSummary:", v9);

    objc_msgSend(v6, "summaryIconViews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSummaryIconViews:", v10);

    objc_msgSend(v7, "setIconViewLeading:", objc_msgSend(v6, "isIconViewLeading"));
    objc_msgSend(v6, "summaryTitleFontName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSummaryTitleFontName:", v11);

    objc_msgSend(v6, "summaryDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setSummaryDate:", v12);
    -[NCDigestSummaryView setNeedsLayout](self, "setNeedsLayout");
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

- (unint64_t)count
{
  return self->_count;
}

- (BOOL)presentFeaturedNotificationsInline
{
  return self->_presentFeaturedNotificationsInline;
}

- (NCNotificationSummaryContentProviding)communicationsSummaryContentProvider
{
  return self->_communicationsSummaryContentProvider;
}

- (NCNotificationSummaryContentProviding)appsSummaryContentProvider
{
  return self->_appsSummaryContentProvider;
}

- (UIView)clearControlView
{
  return self->_clearControlView;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_clearControlView, 0);
  objc_storeStrong((id *)&self->_appsSummaryContentProvider, 0);
  objc_storeStrong((id *)&self->_communicationsSummaryContentProvider, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_drawingContext, 0);
  objc_storeStrong((id *)&self->_appsSummaryContentView, 0);
  objc_storeStrong((id *)&self->_communicationsSummaryContentView, 0);
  objc_storeStrong((id *)&self->_featuredNotificationsContainerView, 0);
  objc_storeStrong((id *)&self->_strokeVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_fontProvider, 0);
  objc_storeStrong((id *)&self->_countBackgroundView, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong((id *)&self->_subheadingLabel, 0);
  objc_storeStrong((id *)&self->_headingLabel, 0);
  objc_storeStrong((id *)&self->_timeStampLabel, 0);
}

@end
