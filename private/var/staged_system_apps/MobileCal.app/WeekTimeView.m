@implementation WeekTimeView

+ (double)widthForOrientation:(int64_t)a3 inViewHierarchy:(id)a4
{
  double v4;

  +[EKDayTimeView timeWidthForOrientation:inViewHierarchy:](EKDayTimeView, "timeWidthForOrientation:inViewHierarchy:", a3, a4);
  return fmax(v4, 51.0);
}

- (WeekTimeView)initWithFrame:(CGRect)a3 targetSizeClass:(int64_t)a4 orientation:(int64_t)a5
{
  WeekTimeView *v7;
  WeekTimeView *v8;
  id v9;
  double y;
  double width;
  double height;
  EKDayTimeView *v13;
  EKDayTimeView *timeView;
  UIScrollView *v15;
  UIScrollView *timeScroller;
  UIScrollView *v17;
  double v18;
  double v19;
  UIView *v20;
  UIView *headerBackground;
  void *v22;
  UIView *v23;
  UIView *allDayBackgroundColorView;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  UIView *v28;
  UIView *topAllDaySeparatorView;
  void *v30;
  UIView *v31;
  UIView *bottomAllDaySeparatorView;
  void *v33;
  UILabel *v34;
  UILabel *allDayLabel;
  UILabel *v36;
  NSBundle *v37;
  void *v38;
  void *v39;
  UILabel *v40;
  void *v41;
  UILabel *v42;
  void *v43;
  UIView *v44;
  UIView *rightBorderView;
  void *v46;
  void *v47;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)WeekTimeView;
  v7 = -[WeekTimeView initWithFrame:](&v49, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_preferredMonthLabelBaselineOffsetFromTop = -1.0;
    -[WeekTimeView setOrientation:](v7, "setOrientation:", a5);
    v9 = objc_alloc((Class)EKDayTimeView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v13 = (EKDayTimeView *)objc_msgSend(v9, "initWithFrame:sizeClass:", a4, CGRectZero.origin.x, y, width, height);
    timeView = v8->_timeView;
    v8->_timeView = v13;

    -[EKDayTimeView setOpaque:](v8->_timeView, "setOpaque:", 0);
    -[EKDayTimeView setOrientation:](v8->_timeView, "setOrientation:", a5);
    -[EKDayTimeView setShowsRightBorder:](v8->_timeView, "setShowsRightBorder:", -[WeekTimeView _showRightBorder](v8, "_showRightBorder"));
    -[EKDayTimeView setShowsTimeMarkerExtension:](v8->_timeView, "setShowsTimeMarkerExtension:", 1);
    v15 = (UIScrollView *)objc_msgSend(objc_alloc((Class)UIScrollView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    timeScroller = v8->_timeScroller;
    v8->_timeScroller = v15;

    -[UIScrollView addSubview:](v8->_timeScroller, "addSubview:", v8->_timeView);
    v17 = v8->_timeScroller;
    -[EKDayTimeView bounds](v8->_timeView, "bounds");
    -[UIScrollView setContentSize:](v17, "setContentSize:", v18, v19);
    -[UIScrollView setScrollEnabled:](v8->_timeScroller, "setScrollEnabled:", 0);
    -[UIScrollView setDelegate:](v8->_timeScroller, "setDelegate:", v8);
    -[WeekTimeView addSubview:](v8, "addSubview:", v8->_timeScroller);
    v20 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    headerBackground = v8->_headerBackground;
    v8->_headerBackground = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("weekHeaderBGColor")));
    -[UIView setBackgroundColor:](v8->_headerBackground, "setBackgroundColor:", v22);

    -[WeekTimeView addSubview:](v8, "addSubview:", v8->_headerBackground);
    v23 = (UIView *)objc_alloc_init((Class)UIView);
    allDayBackgroundColorView = v8->_allDayBackgroundColorView;
    v8->_allDayBackgroundColorView = v23;

    v26 = CUIKAllDayBackgroundColor(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    -[UIView setBackgroundColor:](v8->_allDayBackgroundColorView, "setBackgroundColor:", v27);

    -[UIView setClipsToBounds:](v8->_allDayBackgroundColorView, "setClipsToBounds:", 1);
    -[WeekTimeView addSubview:](v8, "addSubview:", v8->_allDayBackgroundColorView);
    v28 = (UIView *)objc_alloc_init((Class)UIView);
    topAllDaySeparatorView = v8->_topAllDaySeparatorView;
    v8->_topAllDaySeparatorView = v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
    -[UIView setBackgroundColor:](v8->_topAllDaySeparatorView, "setBackgroundColor:", v30);

    -[WeekTimeView addSubview:](v8, "addSubview:", v8->_topAllDaySeparatorView);
    v31 = (UIView *)objc_alloc_init((Class)UIView);
    bottomAllDaySeparatorView = v8->_bottomAllDaySeparatorView;
    v8->_bottomAllDaySeparatorView = v31;

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
    -[UIView setBackgroundColor:](v8->_bottomAllDaySeparatorView, "setBackgroundColor:", v33);

    -[WeekTimeView addSubview:](v8, "addSubview:", v8->_bottomAllDaySeparatorView);
    v34 = (UILabel *)objc_alloc_init((Class)UILabel);
    allDayLabel = v8->_allDayLabel;
    v8->_allDayLabel = v34;

    v36 = v8->_allDayLabel;
    v37 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v8));
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("all-day"), &stru_1001B67C0, 0));
    -[UILabel setText:](v36, "setText:", v39);

    -[UILabel setAdjustsFontSizeToFitWidth:](v8->_allDayLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v8->_allDayLabel, "setMinimumScaleFactor:", 0.727272727);
    v40 = v8->_allDayLabel;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v40, "setTextColor:", v41);

    -[UILabel setTextAlignment:](v8->_allDayLabel, "setTextAlignment:", 2);
    v42 = v8->_allDayLabel;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[EKDayTimeView allDayLabelFont](EKDayTimeView, "allDayLabelFont"));
    -[UILabel setFont:](v42, "setFont:", v43);

    -[UILabel sizeToFit](v8->_allDayLabel, "sizeToFit");
    -[UIView addSubview:](v8->_allDayBackgroundColorView, "addSubview:", v8->_allDayLabel);
    if (-[WeekTimeView _showRightBorder](v8, "_showRightBorder"))
    {
      v44 = (UIView *)objc_alloc_init((Class)UIView);
      rightBorderView = v8->_rightBorderView;
      v8->_rightBorderView = v44;

      v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
      -[UIView setBackgroundColor:](v8->_rightBorderView, "setBackgroundColor:", v46);

      -[WeekTimeView addSubview:](v8, "addSubview:", v8->_rightBorderView);
    }
    -[WeekTimeView bringSubviewToFront:](v8, "bringSubviewToFront:", v8->_timeScroller);
    -[WeekTimeView bringSubviewToFront:](v8, "bringSubviewToFront:", v8->_headerBackground);
    -[WeekTimeView bringSubviewToFront:](v8, "bringSubviewToFront:", v8->_allDayBackgroundColorView);
    -[UIView bringSubviewToFront:](v8->_allDayBackgroundColorView, "bringSubviewToFront:", v8->_allDayLabel);
    -[WeekTimeView bringSubviewToFront:](v8, "bringSubviewToFront:", v8->_rightBorderView);
    -[WeekTimeView bringSubviewToFront:](v8, "bringSubviewToFront:", v8->_topAllDaySeparatorView);
    -[WeekTimeView bringSubviewToFront:](v8, "bringSubviewToFront:", v8->_bottomAllDaySeparatorView);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[WeekTimeView setBackgroundColor:](v8, "setBackgroundColor:", v47);

  }
  return v8;
}

- (void)setUseMultiDayStyle:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  self->_useMultiDayStyle = a3;
  if (a3)
  {
    v5 = CUIKAllDayBackgroundColor(self);
    v6 = objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("weekHeaderBGColor")));
  }
  v7 = (void *)v6;
  -[UIView setBackgroundColor:](self->_headerBackground, "setBackgroundColor:", v6);

  -[UIView setHidden:](self->_topAllDaySeparatorView, "setHidden:", v3);
}

- (void)setUseMaterialBackground:(BOOL)a3
{
  UIVisualEffectView *effectBackgroundView;
  UIVisualEffectView *v5;
  UIVisualEffectView *v6;
  void *v7;
  void *v8;
  void *v9;
  UIVisualEffectView *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  self->_useMaterialBackground = a3;
  effectBackgroundView = self->_effectBackgroundView;
  if (!a3 || effectBackgroundView)
  {
    -[UIVisualEffectView removeFromSuperview](effectBackgroundView, "removeFromSuperview");
    v10 = self->_effectBackgroundView;
    self->_effectBackgroundView = 0;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[WeekTimeView setBackgroundColor:](self, "setBackgroundColor:", v11);

    v13 = CUIKAllDayBackgroundColor(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[UIView setBackgroundColor:](self->_allDayBackgroundColorView, "setBackgroundColor:", v14);

    v15 = (id)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("weekHeaderBGColor")));
    -[UIView setBackgroundColor:](self->_headerBackground, "setBackgroundColor:", v15);
  }
  else
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 9));
    v5 = (UIVisualEffectView *)objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v15);
    v6 = self->_effectBackgroundView;
    self->_effectBackgroundView = v5;

    -[WeekTimeView bounds](self, "bounds");
    -[UIVisualEffectView setFrame:](self->_effectBackgroundView, "setFrame:");
    -[WeekTimeView addSubview:](self, "addSubview:", self->_effectBackgroundView);
    -[WeekTimeView sendSubviewToBack:](self, "sendSubviewToBack:", self->_effectBackgroundView);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[WeekTimeView setBackgroundColor:](self, "setBackgroundColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIView setBackgroundColor:](self->_allDayBackgroundColorView, "setBackgroundColor:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIView setBackgroundColor:](self->_headerBackground, "setBackgroundColor:", v9);

  }
}

- (BOOL)_showRightBorder
{
  return 0;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
  -[EKDayTimeView setOrientation:](self->_timeView, "setOrientation:");
  -[WeekTimeView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTimeMarkerExtensionColor:(id)a3
{
  -[EKDayTimeView setTimeMarkerExtensionColor:](self->_timeView, "setTimeMarkerExtensionColor:", a3);
}

- (UIColor)timeMarkerExtensionColor
{
  return (UIColor *)-[EKDayTimeView timeMarkerExtensionColor](self->_timeView, "timeMarkerExtensionColor");
}

- (void)setHeaderHeight:(double)a3
{
  if (self->_headerHeight != a3)
  {
    if (a3 <= 0.0)
      a3 = 0.0;
    self->_headerHeight = a3;
    -[WeekTimeView setNeedsLayout](self, "setNeedsLayout");
    -[WeekTimeView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setAllDayHighlighted:(BOOL)a3
{
  UILabel *allDayLabel;
  uint64_t v4;
  id v5;

  allDayLabel = self->_allDayLabel;
  if (a3)
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v5 = (id)v4;
  -[UILabel setTextColor:](allDayLabel, "setTextColor:", v4);

}

- (BOOL)allDayHighlighted
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel textColor](self->_allDayLabel, "textColor"));
  LOBYTE(self) = v3 == v4;

  return (char)self;
}

- (void)setShowsTimeMarker:(BOOL)a3
{
  -[EKDayTimeView setShowsTimeMarker:](self->_timeView, "setShowsTimeMarker:", a3);
}

- (BOOL)showsTimeMarker
{
  return -[EKDayTimeView showsTimeMarker](self->_timeView, "showsTimeMarker");
}

- (void)setDayTimeViewDelegate:(id)a3
{
  -[EKDayTimeView setDelegate:](self->_timeView, "setDelegate:", a3);
  -[EKDayTimeView setNeedsDisplay](self->_timeView, "setNeedsDisplay");
}

- (void)setHourHeightScale:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[EKDayTimeView setHourHeightScale:](self->_timeView, "setHourHeightScale:");
  -[UIScrollView contentSize](self->_timeScroller, "contentSize");
  v6 = v5;
  +[EKDayTimeView defaultHeightForSizeClass:orientation:withHourScale:](EKDayTimeView, "defaultHeightForSizeClass:orientation:withHourScale:", EKUIWidthSizeClassForViewHierarchy(self), self->_orientation, a3);
  -[UIScrollView setContentSize:](self->_timeScroller, "setContentSize:", v6, v7);
  -[WeekTimeView setNeedsLayout](self, "setNeedsLayout");
  -[WeekTimeView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)contentSizeCategoryChanged
{
  UILabel *allDayLabel;
  void *v4;
  void *v5;

  allDayLabel = self->_allDayLabel;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EKDayTimeView allDayLabelFont](EKDayTimeView, "allDayLabelFont"));
  -[UILabel setFont:](allDayLabel, "setFont:", v4);

  -[UILabel sizeToFit](self->_allDayLabel, "sizeToFit");
  -[WeekTimeView _updateMonthFont](self, "_updateMonthFont");
  -[WeekTimeView _updateWeekNumberFont](self, "_updateWeekNumberFont");
  -[WeekTimeView _updateOverlayMonthFont](self, "_updateOverlayMonthFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayTimeView timeMarker](self->_timeView, "timeMarker"));
  objc_msgSend(v5, "invalidateFonts");

  -[WeekTimeView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setAllDayAlpha:(double)a3
{
  -[UIView setAlpha:](self->_topAllDaySeparatorView, "setAlpha:");
  -[UILabel setAlpha:](self->_allDayLabel, "setAlpha:", a3);
}

- (double)allDayAlpha
{
  double result;

  -[UILabel alpha](self->_allDayLabel, "alpha");
  return result;
}

- (void)_updateMonthFont
{
  uint64_t v3;
  NSString *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  NSString *v12;
  NSString *v13;

  v12 = UIFontTextStyleTitle3;
  if (EKUICurrentWindowSizeParadigmForViewHierarchy(self, v3) == 4)
  {
    v4 = UIFontTextStyleHeadline;

    v5 = v4;
  }
  else
  {
    v5 = v12;
  }
  v13 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v6, 0.0));
  -[UILabel setFont:](self->_monthLabel, "setFont:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_monthLabel, "font"));
  objc_msgSend(v8, "pointSize");
  v10 = v9;

  if (v10 > 25.0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v6));
    -[UILabel setFont:](self->_monthLabel, "setFont:", v11);

  }
}

- (void)_updateWeekNumberFont
{
  void *v3;
  uint64_t v4;
  int v5;
  double v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeekTimeView traitCollection](self, "traitCollection"));
  v5 = EKUIUsesRoundedRectsInsteadOfCircles(v3, v4);

  v6 = 14.0;
  if (v5)
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 14.0, 16.0);
  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v6));
  -[UILabel setFont:](self->_weekNumberLabel, "setFont:", v7);

}

- (void)_updateOverlayMonthFont
{
  void *v3;
  uint64_t v4;
  int v5;
  double v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeekTimeView traitCollection](self, "traitCollection"));
  v5 = EKUIUsesRoundedRectsInsteadOfCircles(v3, v4);

  v6 = 10.0;
  if (v5)
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 10.0, 12.5);
  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v6));
  -[UILabel setFont:](self->_overlayMonthLabel, "setFont:", v7);

}

- (void)setMonthText:(id)a3 isCurrentMonth:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  UILabel *monthLabel;
  UILabel *v8;
  UILabel *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v4 = a4;
  v6 = a3;
  monthLabel = self->_monthLabel;
  v15 = v6;
  if (!monthLabel)
  {
    v8 = (UILabel *)objc_alloc_init((Class)UILabel);
    v9 = self->_monthLabel;
    self->_monthLabel = v8;

    -[UILabel setText:](self->_monthLabel, "setText:", CFSTR(" "));
    -[WeekTimeView _updateMonthFont](self, "_updateMonthFont");
    -[WeekTimeView addSubview:](self, "addSubview:", self->_monthLabel);
    -[WeekTimeView bringSubviewToFront:](self, "bringSubviewToFront:", self->_monthLabel);
    v6 = v15;
    monthLabel = self->_monthLabel;
  }
  v10 = -[UILabel setText:](monthLabel, "setText:", v6);
  if (v4)
  {
    v12 = CalendarAppTintColor(v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  }
  v14 = (void *)v13;
  -[UILabel setTextColor:](self->_monthLabel, "setTextColor:", v13);

  -[WeekTimeView setNeedsLayout](self, "setNeedsLayout");
}

- (id)monthText
{
  return -[UILabel text](self->_monthLabel, "text");
}

- (void)setMonthTextBaselineOffset:(double)a3
{
  self->_preferredMonthLabelBaselineOffsetFromTop = a3;
  -[WeekTimeView updateMonthLabel](self, "updateMonthLabel");
}

- (void)setWeekNumberText:(id)a3
{
  id v4;
  UILabel *weekNumberLabel;
  UILabel *v6;
  UILabel *v7;
  uint64_t v8;
  void *v9;
  UILabel *v10;
  id v11;

  v4 = a3;
  weekNumberLabel = self->_weekNumberLabel;
  if (v4)
  {
    v11 = v4;
    if (!weekNumberLabel)
    {
      v6 = objc_opt_new(UILabel);
      v7 = self->_weekNumberLabel;
      self->_weekNumberLabel = v6;

      v8 = WeekendTextColor();
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      -[UILabel setTextColor:](self->_weekNumberLabel, "setTextColor:", v9);

      -[WeekTimeView _updateWeekNumberFont](self, "_updateWeekNumberFont");
      -[WeekTimeView addSubview:](self, "addSubview:", self->_weekNumberLabel);
      weekNumberLabel = self->_weekNumberLabel;
    }
    -[UILabel setText:](weekNumberLabel, "setText:", v11);
    -[WeekTimeView setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_7;
  }
  if (weekNumberLabel)
  {
    v11 = 0;
    -[UILabel removeFromSuperview](weekNumberLabel, "removeFromSuperview");
    v10 = self->_weekNumberLabel;
    self->_weekNumberLabel = 0;

LABEL_7:
    v4 = v11;
  }

}

- (NSString)weekNumberText
{
  return -[UILabel text](self->_weekNumberLabel, "text");
}

- (void)setOverlayMonthText:(id)a3
{
  id v4;
  UILabel *overlayMonthLabel;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  id v10;

  v4 = a3;
  overlayMonthLabel = self->_overlayMonthLabel;
  v10 = v4;
  if (v4)
  {
    if (!overlayMonthLabel)
    {
      v6 = objc_opt_new(UILabel);
      v7 = self->_overlayMonthLabel;
      self->_overlayMonthLabel = v6;

      -[WeekTimeView _updateOverlayMonthFont](self, "_updateOverlayMonthFont");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      -[UILabel setTextColor:](self->_overlayMonthLabel, "setTextColor:", v8);

      -[WeekTimeView addSubview:](self, "addSubview:", self->_overlayMonthLabel);
      v4 = v10;
      overlayMonthLabel = self->_overlayMonthLabel;
    }
    -[UILabel setText:](overlayMonthLabel, "setText:", v4);
    -[WeekTimeView setNeedsLayout](self, "setNeedsLayout");
  }
  else if (overlayMonthLabel)
  {
    -[UILabel removeFromSuperview](overlayMonthLabel, "removeFromSuperview");
    v9 = self->_overlayMonthLabel;
    self->_overlayMonthLabel = 0;

  }
  -[WeekTimeView sizeToFit](self, "sizeToFit");

}

- (NSString)overlayMonthText
{
  return -[UILabel text](self->_overlayMonthLabel, "text");
}

- (double)allDayBackgroundColorOriginY
{
  double result;

  +[WeekAllDayView dayLabelHeightWithSizeClass:usesMultiDay:](WeekAllDayView, "dayLabelHeightWithSizeClass:usesMultiDay:", EKUIWidthSizeClassForViewHierarchy(self), -[WeekTimeView useMultiDayStyle](self, "useMultiDayStyle"));
  return result;
}

- (double)allDayLabelOriginY
{
  double v3;
  double v4;
  double v5;

  +[EKDayOccurrenceView minimumHeightForSizeClass:orientation:isAllDay:](EKDayOccurrenceView, "minimumHeightForSizeClass:orientation:isAllDay:", EKUIWidthSizeClassForViewHierarchy(self), self->_orientation, 1);
  v4 = v3;
  -[UILabel frame](self->_allDayLabel, "frame");
  return (v4 - v5) * 0.5;
}

- (void)updateMonthLabel
{
  UILabel *monthLabel;
  void *v4;
  double v5;
  double v6;
  CGFloat v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double MaxX;
  CGFloat Width;
  uint64_t v23;
  uint64_t v24;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  monthLabel = self->_monthLabel;
  if (monthLabel)
  {
    -[UILabel sizeToFit](monthLabel, "sizeToFit");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_monthLabel, "font"));
    objc_msgSend(v4, "pointSize");
    v6 = v5;

    while (v6 > 8.0)
    {
      -[UILabel frame](self->_monthLabel, "frame");
      v7 = CGRectGetWidth(v26) + 5.0;
      -[WeekTimeView bounds](self, "bounds");
      if (v7 <= CGRectGetWidth(v27))
        break;
      v6 = v6 + -1.0;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_monthLabel, "font"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fontDescriptor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v9, v6));
      -[UILabel setFont:](self->_monthLabel, "setFont:", v10);

      -[UILabel sizeToFit](self->_monthLabel, "sizeToFit");
    }
    v11 = -[UILabel frame](self->_monthLabel, "frame");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = 5.0;
    if (CalInterfaceIsLeftToRight(v11))
    {
      -[WeekTimeView bounds](self, "bounds");
      MaxX = CGRectGetMaxX(v28);
      v29.origin.x = v13;
      v29.origin.y = v15;
      v29.size.width = v17;
      v29.size.height = v19;
      Width = CGRectGetWidth(v29);
      v20 = CalRoundToScreenScale(v23, v24, MaxX - Width + -5.0);
    }
    -[WeekTimeView _yLocationForMonthLabel](self, "_yLocationForMonthLabel");
    -[UILabel setFrame:](self->_monthLabel, "setFrame:", CalRoundRectToScreenScale(v20, v25, v17, v19));
  }
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double headerHeight;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UILabel *weekNumberLabel;
  id v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double MaxX;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  int v37;
  UILabel *overlayMonthLabel;
  id v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat MaxY;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  id v74;
  double v75;
  CGFloat v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double Width;
  double v84;
  double v85;
  double v86;
  double v87;
  id v88;
  uint64_t v89;
  double v90;
  double v91;
  id v92;
  double v93;
  double v94;
  double v95;
  double v96;
  CGFloat v97;
  double MinX;
  double v99;
  double v100;
  CGRect recta;
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
  CGRect v116;
  CGRect v117;

  *(_QWORD *)&recta.origin.y = self;
  *(_QWORD *)&recta.size.width = WeekTimeView;
  -[CGFloat layoutSubviews]((objc_super *)&recta.origin.y, "layoutSubviews");
  -[WeekTimeView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIVisualEffectView setFrame:](self->_effectBackgroundView, "setFrame:");
  -[UIView setFrame:](self->_headerBackground, "setFrame:", 0.0, 0.0, v8, self->_headerHeight);
  -[EKDayTimeView sizeToFit](self->_timeView, "sizeToFit");
  headerHeight = self->_headerHeight;
  -[WeekTimeView bounds](self, "bounds");
  v13 = v12;
  recta.origin.x = v4;
  v102.origin.x = v4;
  v102.origin.y = v6;
  v102.size.width = v8;
  v102.size.height = v10;
  -[UIScrollView setFrame:](self->_timeScroller, "setFrame:", 0.0, headerHeight, v13, CGRectGetMaxY(v102) - self->_headerHeight);
  -[EKDayTimeView bounds](self->_timeView, "bounds");
  -[UIScrollView setContentSize:](self->_timeScroller, "setContentSize:", v14, v15);
  -[WeekTimeView bounds](self, "bounds");
  -[UIView setFrame:](self->_rightBorderView, "setFrame:", v16 + -1.0, 0.0, 1.0, self->_headerHeight);
  -[WeekTimeView updateMonthLabel](self, "updateMonthLabel");
  weekNumberLabel = self->_weekNumberLabel;
  if (weekNumberLabel)
  {
    -[UILabel sizeToFit](weekNumberLabel, "sizeToFit");
    v18 = -[UILabel frame](self->_weekNumberLabel, "frame");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v27 = 5.0;
    if (CalInterfaceIsLeftToRight(v18))
    {
      -[WeekTimeView bounds](self, "bounds");
      MaxX = CGRectGetMaxX(v103);
      v104.origin.x = v20;
      v104.origin.y = v22;
      v104.size.width = v24;
      v104.size.height = v26;
      v27 = MaxX - CGRectGetWidth(v104) + -5.0;
    }
    if (-[WeekTimeView useMultiDayStyle](self, "useMultiDayStyle"))
    {
      +[MultiDayWeekView centerYOffsetForTitleLabelWithSizeClass:](MultiDayWeekView, "centerYOffsetForTitleLabelWithSizeClass:", EKUIWidthSizeClassForViewHierarchy(self));
      v31 = v30 + v26 * -0.5;
    }
    else
    {
      +[WeekAllDayView baselineForWeekdayLabelsWithSizeClass:](WeekAllDayView, "baselineForWeekdayLabelsWithSizeClass:", EKUIWidthSizeClassForViewHierarchy(self));
      v33 = v32;
      -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_weekNumberLabel, "_firstLineBaselineOffsetFromBoundsTop");
      v31 = v33 - v34;
    }
    if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self, v29))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[WeekTimeView traitCollection](self, "traitCollection"));
      v37 = EKUIUsesRoundedRectsInsteadOfCircles(v35, v36);

      if (!v37)
        v31 = v31 + -3.5;
    }
    -[UILabel setFrame:](self->_weekNumberLabel, "setFrame:", CalRoundRectToScreenScale(v27, v31, v24, v26));
  }
  overlayMonthLabel = self->_overlayMonthLabel;
  if (overlayMonthLabel)
  {
    -[UILabel sizeToFit](overlayMonthLabel, "sizeToFit");
    v39 = -[UILabel frame](self->_overlayMonthLabel, "frame");
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;
    v48 = 5.0;
    if (CalInterfaceIsLeftToRight(v39))
    {
      -[WeekTimeView bounds](self, "bounds");
      v49 = CGRectGetMaxX(v105);
      v106.origin.x = v41;
      v106.origin.y = v43;
      v106.size.width = v45;
      v106.size.height = v47;
      v48 = v49 - CGRectGetWidth(v106) + -5.0;
    }
    -[UILabel frame](self->_monthLabel, "frame");
    MaxY = CGRectGetMaxY(v107);
    v53 = CalRoundToScreenScale(v51, v52, MaxY + -1.0);
    -[UILabel setFrame:](self->_overlayMonthLabel, "setFrame:", CalRoundRectToScreenScale(v48, v53, v45, v47));
  }
  -[WeekTimeView allDayBackgroundColorOriginY](self, "allDayBackgroundColorOriginY");
  v55 = v54;
  v56 = self->_headerHeight;
  -[WeekTimeView allDayBackgroundColorOriginY](self, "allDayBackgroundColorOriginY");
  -[UIView setFrame:](self->_allDayBackgroundColorView, "setFrame:", 0.0, v55, v8, v56 - v57);
  if (self->_useMaterialBackground)
  {
    -[UIView bounds](self->_allDayBackgroundColorView, "bounds");
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 2));
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    -[UIView bounds](self->_allDayBackgroundColorView, "bounds");
    objc_msgSend(v59, "setFrame:");
    v60 = objc_retainAutorelease(v58);
    objc_msgSend(v59, "setPath:", objc_msgSend(v60, "CGPath"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_allDayBackgroundColorView, "layer"));
    objc_msgSend(v61, "setMask:", v59);

    -[UIVisualEffectView bounds](self->_effectBackgroundView, "bounds");
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 2));
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    -[UIVisualEffectView bounds](self->_effectBackgroundView, "bounds");
    objc_msgSend(v63, "setFrame:");
    v64 = objc_retainAutorelease(v62);
    objc_msgSend(v63, "setPath:", objc_msgSend(v64, "CGPath"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](self->_effectBackgroundView, "layer"));
    objc_msgSend(v65, "setMask:", v63);

  }
  else
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_allDayBackgroundColorView, "layer"));
    objc_msgSend(v66, "setMask:", 0);

    v60 = (id)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](self->_effectBackgroundView, "layer"));
    objc_msgSend(v60, "setMask:", 0);
  }

  v68 = EKUISeparatorLineThickness(v67);
  -[WeekTimeView allDayBackgroundColorOriginY](self, "allDayBackgroundColorOriginY");
  -[UIView setFrame:](self->_topAllDaySeparatorView, "setFrame:", 0.0, v69, v8, v68);
  -[WeekTimeView allDayAlpha](self, "allDayAlpha");
  if (v70 <= 0.0)
  {
    -[WeekTimeView allDayBackgroundColorOriginY](self, "allDayBackgroundColorOriginY");
    v71 = v72;
  }
  else
  {
    -[UIView frame](self->_allDayBackgroundColorView, "frame");
    v71 = CGRectGetMaxY(v108) - v68;
  }
  v73 = 0.0;
  -[UIView setFrame:](self->_bottomAllDaySeparatorView, "setFrame:", 0.0, v71, v8, v68);
  v74 = -[EKDayTimeView frame](self->_timeView, "frame");
  v76 = v75;
  v78 = v77;
  v80 = v79;
  v82 = v81;
  if (CalInterfaceIsLeftToRight(v74))
  {
    v109.origin.x = recta.origin.x;
    v109.origin.y = v6;
    v109.size.width = v8;
    v109.size.height = v10;
    Width = CGRectGetWidth(v109);
    v110.origin.x = v76;
    v110.origin.y = v78;
    v110.size.width = v80;
    v110.size.height = v82;
    v73 = Width - CGRectGetWidth(v110);
  }
  -[EKDayTimeView setFrame:](self->_timeView, "setFrame:", v73, v78, v80, v82);
  -[UILabel frame](self->_allDayLabel, "frame");
  v85 = v84;
  v87 = v86;
  v88 = -[WeekTimeView allDayLabelOriginY](self, "allDayLabelOriginY");
  v91 = CalRoundToScreenScale(v88, v89, v90);
  v92 = +[EKDayTimeView timeInsetForSizeClass:orientation:](EKDayTimeView, "timeInsetForSizeClass:orientation:", EKUIWidthSizeClassForViewHierarchy(self), self->_orientation);
  v94 = v93;
  if (CalInterfaceIsLeftToRight(v92))
  {
    -[WeekTimeView frame](self, "frame");
    v96 = v95 - v85 - v94 + -1.0;
    if (v96 < 0.0)
    {
      v85 = v85 + v96;
      v96 = 0.0;
    }
  }
  else
  {
    v96 = v94 + 1.0;
    v111.origin.x = v94 + 1.0;
    v111.origin.y = v91;
    v111.size.width = v85;
    v111.size.height = v87;
    v97 = v94 + 1.0 + CGRectGetWidth(v111);
    -[WeekTimeView frame](self, "frame");
    if (v97 > CGRectGetWidth(v112))
    {
      v113.origin.x = v94 + 1.0;
      v113.origin.y = v91;
      v113.size.width = v85;
      v113.size.height = v87;
      MinX = CGRectGetMinX(v113);
      v114.origin.x = v94 + 1.0;
      v114.origin.y = v91;
      v114.size.width = v85;
      v114.size.height = v87;
      v99 = MinX + CGRectGetWidth(v114);
      -[WeekTimeView frame](self, "frame");
      v85 = v85 + v99 - CGRectGetWidth(v115);
      -[WeekTimeView frame](self, "frame");
      v100 = CGRectGetWidth(v116);
      v117.origin.x = v94 + 1.0;
      v117.origin.y = v91;
      v117.size.width = v85;
      v117.size.height = v87;
      v96 = v100 - CGRectGetWidth(v117) - v94 + -1.0;
    }
  }
  -[UILabel setFrame:](self->_allDayLabel, "setFrame:", v96, v91, v85, v87);
}

- (double)_yLocationForMonthLabel
{
  double result;
  double preferredMonthLabelBaselineOffsetFromTop;
  double v4;

  result = 0.0;
  if (!self->_overlayMonthLabel)
  {
    preferredMonthLabelBaselineOffsetFromTop = self->_preferredMonthLabelBaselineOffsetFromTop;
    result = 5.0;
    if (preferredMonthLabelBaselineOffsetFromTop > 0.0)
    {
      -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_monthLabel, "_firstLineBaselineOffsetFromBoundsTop", 5.0);
      return preferredMonthLabelBaselineOffsetFromTop - v4;
    }
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  UILabel *overlayMonthLabel;
  double v12;
  double v13;
  double v14;
  CGSize result;
  CGRect v16;

  height = a3.height;
  width = a3.width;
  v6 = CalRoundToScreenScale(self, a2, self->_headerHeight);
  v8 = EKUISeparatorLineThickness(v7);
  -[EKDayTimeView sizeThatFits:](self->_timeView, "sizeThatFits:", width, height);
  if (v9 >= 51.0)
    v10 = v9;
  else
    v10 = 51.0;
  overlayMonthLabel = self->_overlayMonthLabel;
  if (overlayMonthLabel)
  {
    -[UILabel sizeToFit](overlayMonthLabel, "sizeToFit");
    -[UILabel frame](self->_overlayMonthLabel, "frame");
    v12 = CGRectGetWidth(v16) + 10.0;
    if (v10 < v12)
      v10 = v12;
  }
  if (height >= v6 + v8)
    v13 = height;
  else
    v13 = v6 + v8;
  v14 = v10;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)updateMarkerPosition
{
  -[EKDayTimeView updateMarkerPosition](self->_timeView, "updateMarkerPosition");
}

- (UIScrollView)scrollView
{
  return self->_timeScroller;
}

- (BOOL)useMultiDayStyle
{
  return self->_useMultiDayStyle;
}

- (BOOL)useMaterialBackground
{
  return self->_useMaterialBackground;
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (EKDayTimeView)timeView
{
  return self->_timeView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerBackground, 0);
  objc_storeStrong((id *)&self->_bottomAllDaySeparatorView, 0);
  objc_storeStrong((id *)&self->_topAllDaySeparatorView, 0);
  objc_storeStrong((id *)&self->_allDayBackgroundColorView, 0);
  objc_storeStrong((id *)&self->_allDayLabel, 0);
  objc_storeStrong((id *)&self->_weekNumberLabel, 0);
  objc_storeStrong((id *)&self->_overlayMonthLabel, 0);
  objc_storeStrong((id *)&self->_monthLabel, 0);
  objc_storeStrong((id *)&self->_rightBorderView, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_timeScroller, 0);
  objc_storeStrong((id *)&self->_effectBackgroundView, 0);
}

@end
