@implementation MultiDayNavigationViewCell

- (MultiDayNavigationViewCell)initWithFrame:(CGRect)a3
{
  MultiDayNavigationViewCell *v3;
  MultiDayNavigationViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MultiDayNavigationViewCell;
  v3 = -[DayNavigationViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MultiDayNavigationViewCell _createSubviews](v3, "_createSubviews");
  return v4;
}

- (void)_createSubviews
{
  id v3;
  UIView *v4;
  UIView *cardBackgroundView;
  void *v6;
  UILabel *v7;
  UILabel *dayOfWeekLabel;
  void *v9;
  double v10;
  id v11;
  void *v12;

  v3 = objc_alloc((Class)UIView);
  -[MultiDayNavigationViewCell bounds](self, "bounds");
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  cardBackgroundView = self->_cardBackgroundView;
  self->_cardBackgroundView = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[UIView setBackgroundColor:](self->_cardBackgroundView, "setBackgroundColor:", v6);

  -[MultiDayNavigationViewCell addSubview:](self, "addSubview:", self->_cardBackgroundView);
  v7 = objc_opt_new(UILabel);
  dayOfWeekLabel = self->_dayOfWeekLabel;
  self->_dayOfWeekLabel = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](self->_dayOfWeekLabel, "setBackgroundColor:", v9);

  *(_QWORD *)&v10 = objc_opt_class(self).n128_u64[0];
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_dayOfWeekLabelFont", v10));
  -[UILabel setFont:](self->_dayOfWeekLabel, "setFont:", v12);

  -[UILabel setTextAlignment:](self->_dayOfWeekLabel, "setTextAlignment:", 1);
  -[MultiDayNavigationViewCell addSubview:](self, "addSubview:", self->_dayOfWeekLabel);
}

+ (id)_dayOfWeekLabelFont
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 15.0, 20.0);
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
}

+ (id)_overlayFont
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 15.0, 16.0);
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
}

- (void)layoutSubviews
{
  int IsRightToLeft;
  UILabel *overlayLabel;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat MaxY;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  CGRect v35;

  -[MultiDayNavigationViewCell bounds](self, "bounds");
  IsRightToLeft = CUIKLocaleIsRightToLeft(-[UIView setFrame:](self->_cardBackgroundView, "setFrame:"));
  -[UILabel sizeToFit](self->_dayOfWeekLabel, "sizeToFit");
  overlayLabel = self->_overlayLabel;
  if (overlayLabel)
    -[UILabel sizeToFit](overlayLabel, "sizeToFit");
  -[MultiDayNavigationViewCell bounds](self, "bounds");
  v6 = v5;
  -[UILabel bounds](self->_dayOfWeekLabel, "bounds");
  v8 = (v6 - v7) * 0.5;
  -[MultiDayNavigationViewCell frame](self, "frame");
  v10 = v9;
  -[UILabel frame](self->_dayOfWeekLabel, "frame");
  v12 = v10 - v11 + -6.0;
  -[UILabel frame](self->_overlayLabel, "frame");
  v14 = (v12 - v13) * 0.5;
  -[UILabel bounds](self->_dayOfWeekLabel, "bounds");
  v16 = v15;
  -[UILabel bounds](self->_dayOfWeekLabel, "bounds");
  -[UILabel setFrame:](self->_dayOfWeekLabel, "setFrame:", v14, v8, v16);
  if (self->_overlayLabel)
  {
    -[MultiDayNavigationViewCell bounds](self, "bounds");
    v18 = v17;
    -[UILabel bounds](self->_overlayLabel, "bounds");
    v20 = (v18 - v19) * 0.5;
    if (IsRightToLeft)
    {
      -[UILabel frame](self->_overlayLabel, "frame");
      v22 = v14 - (v21 + 6.0);
    }
    else
    {
      -[UILabel frame](self->_dayOfWeekLabel, "frame");
      v22 = v14 + v23 + 6.0;
    }
    -[UILabel bounds](self->_overlayLabel, "bounds");
    v25 = v24;
    -[UILabel bounds](self->_overlayLabel, "bounds");
    v27 = v26;
    -[UILabel setFrame:](self->_overlayLabel, "setFrame:", v22, v20, v25);
    if (self->_overlayUnderline)
    {
      v35.origin.x = v22;
      v35.origin.y = v20;
      v35.size.width = v25;
      v35.size.height = v27;
      MaxY = CGRectGetMaxY(v35);
      v31 = CalRoundToScreenScale(v29, v30, MaxY + 0.5);
      v34 = CalRoundToScreenScale(v32, v33, self->_overlayUnderlineThickness);
      -[UIView setFrame:](self->_overlayUnderline, "setFrame:", CalRoundRectToScreenScale(v22, v31, v25, v34));
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UILabel sizeThatFits:](self->_dayOfWeekLabel, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setShouldShowOverlay:(BOOL)a3
{
  self->_shouldShowOverlay = a3;
  -[MultiDayNavigationViewCell updateOverlay](self, "updateOverlay");
}

- (void)prepareForReuse
{
  -[MultiDayNavigationViewCell setIsToday:](self, "setIsToday:", 0);
  -[MultiDayNavigationViewCell setIsWeekend:](self, "setIsWeekend:", 0);
  self->_hasOverlay = 0;
  self->_overlayShowsMonth = 0;
}

- (void)updateOverlay
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  BOOL *p_hasOverlay;
  UILabel *v8;
  UILabel *v9;
  UILabel *overlayLabel;
  double v11;
  id v12;
  void *v13;
  UILabel *v14;
  UIView *overlayUnderline;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  UIView *v25;
  UIView *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  UIView *v31;
  UIView *v32;
  id v33;

  v3 = -[MultiDayNavigationViewCell shouldShowOverlay](self, "shouldShowOverlay");
  if (v3)
  {
    v5 = CUIKGetOverlayCalendar(v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    p_hasOverlay = &self->_hasOverlay;
    self->_hasOverlay = v6 != 0;

    if (self->_hasOverlay)
    {
      if (!self->_overlayLabel)
      {
        v9 = objc_opt_new(UILabel);
        overlayLabel = self->_overlayLabel;
        self->_overlayLabel = v9;

        *(_QWORD *)&v11 = objc_opt_class(self).n128_u64[0];
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_overlayFont", v11));
        -[UILabel setFont:](self->_overlayLabel, "setFont:", v13);

        v8 = (UILabel *)-[MultiDayNavigationViewCell addSubview:](self, "addSubview:", self->_overlayLabel);
      }
      goto LABEL_8;
    }
  }
  else
  {
    p_hasOverlay = &self->_hasOverlay;
    self->_hasOverlay = 0;
  }
  v8 = self->_overlayLabel;
  if (v8)
  {
    -[UILabel removeFromSuperview](v8, "removeFromSuperview");
    -[UIView removeFromSuperview](self->_overlayUnderline, "removeFromSuperview");
    v14 = self->_overlayLabel;
    self->_overlayLabel = 0;

    overlayUnderline = self->_overlayUnderline;
    self->_overlayUnderline = 0;

  }
LABEL_8:
  if (*p_hasOverlay)
  {
    v16 = CUIKGetOverlayCalendar(v8, v4);
    v33 = (id)objc_claimAutoreleasedReturnValue(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewCell date](self, "date"));
    if (self->_overlayShowsMonth)
      v18 = objc_claimAutoreleasedReturnValue(+[CUIKDateStrings monthDayStringForDate:inCalendar:](CUIKDateStrings, "monthDayStringForDate:inCalendar:", v17, v33));
    else
      v18 = objc_claimAutoreleasedReturnValue(+[CUIKDateStrings overlayMediumStringForDate:inCalendar:](CUIKDateStrings, "overlayMediumStringForDate:inCalendar:", v17, v33));
    v19 = (void *)v18;
    -[UILabel setText:](self->_overlayLabel, "setText:", v18);

    if (-[DayNavigationViewCell isWeekend](self, "isWeekend"))
    {
      v20 = WeekendTextColor();
      v21 = objc_claimAutoreleasedReturnValue(v20);
    }
    else
    {
      v21 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    }
    v22 = (void *)v21;
    -[UILabel setTextColor:](self->_overlayLabel, "setTextColor:", v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "components:fromDate:", 24, v17));
    if (objc_msgSend(v23, "day") == (id)1)
    {
      v24 = 1.0;
      if (objc_msgSend(v23, "month") == (id)1)
      {
        if (objc_msgSend(v23, "isLeapMonth"))
          v24 = 1.0;
        else
          v24 = 1.5;
      }
      if (!self->_overlayUnderline)
      {
        v25 = objc_opt_new(UIView);
        v26 = self->_overlayUnderline;
        self->_overlayUnderline = v25;

        v29 = CalendarAppTintColor(v27, v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        -[UIView setBackgroundColor:](self->_overlayUnderline, "setBackgroundColor:", v30);

        -[MultiDayNavigationViewCell addSubview:](self, "addSubview:", self->_overlayUnderline);
      }
      self->_overlayUnderlineThickness = v24;
    }
    else
    {
      v31 = self->_overlayUnderline;
      if (v31)
      {
        -[UIView removeFromSuperview](v31, "removeFromSuperview");
        v32 = self->_overlayUnderline;
        self->_overlayUnderline = 0;

      }
    }

  }
}

- (void)setOverlayShowsMonth:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  _QWORD *v15;
  void *v16;
  id v17;
  void **v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;

  if (self->_overlayShowsMonth != a3)
  {
    self->_overlayShowsMonth = a3;
    if (self->_overlayLabel)
    {
      v6 = a4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewCell date](self, "date"));
      v9 = CUIKGetOverlayCalendar(v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      if (a3)
        v11 = objc_claimAutoreleasedReturnValue(+[CUIKDateStrings monthDayStringForDate:inCalendar:](CUIKDateStrings, "monthDayStringForDate:inCalendar:", v7, v10));
      else
        v11 = objc_claimAutoreleasedReturnValue(+[CUIKDateStrings overlayMediumStringForDate:inCalendar:](CUIKDateStrings, "overlayMediumStringForDate:inCalendar:", v7, v10));
      v17 = (id)v11;

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_overlayLabel, "text"));
      v13 = objc_msgSend(v17, "isEqualToString:", v12);

      if ((v13 & 1) != 0)
      {

        return;
      }
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000BC4F0;
      v23[3] = &unk_1001B26A0;
      v23[4] = self;
      v14 = v17;
      v24 = v14;
      v15 = objc_retainBlock(v23);
      v16 = v15;
      if (v6)
      {
        v18 = _NSConcreteStackBlock;
        v19 = 3221225472;
        v20 = sub_1000BC53C;
        v21 = &unk_1001B2E30;
        v22 = v15;
        +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", &v18, 0.3);

      }
      else
      {
        ((void (*)(_QWORD *))v15[2])(v15);
      }

    }
    -[MultiDayNavigationViewCell setNeedsLayout](self, "setNeedsLayout", v17, v18, v19, v20, v21);
  }
}

- (void)setIsToday:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MultiDayNavigationViewCell;
  -[DayNavigationViewCell setIsToday:](&v4, "setIsToday:", a3);
  -[MultiDayNavigationViewCell _updateDisplayedStrings](self, "_updateDisplayedStrings");
}

- (void)setIsWeekend:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MultiDayNavigationViewCell;
  -[DayNavigationViewCell setIsWeekend:](&v4, "setIsWeekend:", a3);
  -[MultiDayNavigationViewCell _updateDisplayedStrings](self, "_updateDisplayedStrings");
}

- (void)setDate:(id)a3
{
  -[MultiDayNavigationViewCell setDate:forceStringUpdate:](self, "setDate:forceStringUpdate:", a3, 0);
}

- (void)setDate:(id)a3 forceStringUpdate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  unsigned int v8;
  NSString *v9;
  NSString *dayOfWeekString;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewCell date](self, "date"));
  v8 = objc_msgSend(v6, "isEqualToDate:", v7);

  if (!v8 || v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)MultiDayNavigationViewCell;
    -[DayNavigationViewCell setDate:](&v11, "setDate:", v6);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(-[MultiDayNavigationViewCell dayOfWeekStringForDate:](self, "dayOfWeekStringForDate:", v6));
    dayOfWeekString = self->_dayOfWeekString;
    self->_dayOfWeekString = v9;

    -[MultiDayNavigationViewCell _updateDisplayedStrings](self, "_updateDisplayedStrings");
  }

}

- (id)dayOfWeekStringForDate:(id)a3
{
  return (id)CUIKAbbreviatedEmDashDayStringForDate(a3, 0);
}

- (double)baselineOffsetFromTop
{
  double result;

  -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_dayOfWeekLabel, "_firstLineBaselineOffsetFromBoundsTop");
  return result;
}

- (CGRect)contentFrame
{
  int IsRightToLeft;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double MinX;
  double MaxX;
  double MaxY;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double MinY;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect result;

  IsRightToLeft = CUIKLocaleIsRightToLeft(self);
  -[UILabel frame](self->_dayOfWeekLabel, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UILabel frame](self->_overlayLabel, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v28 = v18;
  v30.origin.x = v5;
  v30.origin.y = v7;
  v30.size.width = v9;
  v30.size.height = v11;
  MinX = CGRectGetMinX(v30);
  v31.origin.x = v5;
  v31.origin.y = v7;
  v31.size.width = v9;
  v31.size.height = v11;
  MinY = CGRectGetMinY(v31);
  v26 = v17;
  v27 = v13;
  v32.origin.x = v13;
  v32.origin.y = v15;
  v32.size.width = v17;
  v32.size.height = v28;
  MaxX = CGRectGetMaxX(v32);
  v33.origin.x = v5;
  v33.origin.y = v7;
  v33.size.width = v9;
  v33.size.height = v11;
  MaxY = CGRectGetMaxY(v33);
  if (IsRightToLeft)
  {
    v34.size.width = v26;
    v34.origin.x = v27;
    v34.origin.y = v15;
    v34.size.height = v28;
    MinX = CGRectGetMinX(v34);
    v35.origin.x = v5;
    v35.origin.y = v7;
    v35.size.width = v9;
    v35.size.height = v11;
    MaxX = CGRectGetMaxX(v35);
  }
  v22 = MaxX - MinX;
  v23 = MinY;
  v24 = MaxY - MinY;
  v25 = MinX;
  result.size.height = v24;
  result.size.width = v22;
  result.origin.y = v23;
  result.origin.x = v25;
  return result;
}

- (void)setLabelElementsVisible:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MultiDayNavigationViewCell;
  -[DayNavigationViewCell setLabelElementsVisible:](&v6, "setLabelElementsVisible:");
  v5 = !v3;
  -[UILabel setHidden:](self->_dayOfWeekLabel, "setHidden:", v5);
  -[UILabel setHidden:](self->_overlayLabel, "setHidden:", v5);
}

- (id)preferredPointerShape
{
  __n128 v2;
  __n128 v3;
  __n128 v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[MultiDayNavigationViewCell contentFrame](self, "contentFrame");
  v2.n128_u64[0] = -5.0;
  v3.n128_u64[0] = -8.0;
  v4.n128_u64[0] = -5.0;
  UIRectInset(v5, v6, v7, v8, v2, v3, v4, -8.0);
  return +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:");
}

- (void)_updateDisplayedStrings
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  -[UILabel setText:](self->_dayOfWeekLabel, "setText:", self->_dayOfWeekString);
  if (-[DayNavigationViewCell isToday](self, "isToday"))
  {
    v3 = TodayTimelineColor();
    v4 = objc_claimAutoreleasedReturnValue(v3);
  }
  else if (-[DayNavigationViewCell isWeekend](self, "isWeekend"))
  {
    v5 = WeekendTextColor();
    v4 = objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  }
  v6 = (void *)v4;
  -[UILabel setTextColor:](self->_dayOfWeekLabel, "setTextColor:", v4);

  -[MultiDayNavigationViewCell updateOverlay](self, "updateOverlay");
  -[MultiDayNavigationViewCell setNeedsLayout](self, "setNeedsLayout");
}

+ (double)heightRequiredWithSizeClass:(int64_t)a3
{
  double v3;
  id v4;
  void *v5;
  double v6;
  double v7;

  *(_QWORD *)&v3 = objc_opt_class(a1).n128_u64[0];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_normalFont", v3));
  objc_msgSend(v5, "pointSize");
  v7 = v6 + 20.0;

  return v7;
}

- (BOOL)shouldShowOverlay
{
  return self->_shouldShowOverlay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayOfWeekString, 0);
  objc_storeStrong((id *)&self->_overlayUnderline, 0);
  objc_storeStrong((id *)&self->_overlayLabel, 0);
  objc_storeStrong((id *)&self->_dayOfWeekLabel, 0);
  objc_storeStrong((id *)&self->_cardBackgroundView, 0);
}

@end
