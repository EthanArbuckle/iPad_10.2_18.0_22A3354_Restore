@implementation LargeDayNavigationViewCell

- (LargeDayNavigationViewCell)initWithFrame:(CGRect)a3
{
  LargeDayNavigationViewCell *v3;
  LargeDayNavigationViewCell *v4;
  double v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;
  uint64_t v14;

  v13.receiver = self;
  v13.super_class = (Class)LargeDayNavigationViewCell;
  v3 = -[DayNavigationViewCell initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[LargeDayNavigationViewCell _createSubviews](v3, "_createSubviews");
    -[LargeDayNavigationViewCell setCircled:](v4, "setCircled:", 0);
    objc_initWeak(&location, v4);
    *(_QWORD *)&v5 = objc_opt_class(UITraitUserInterfaceStyle).n128_u64[0];
    v14 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1, v5));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000BFE9C;
    v10[3] = &unk_1001B2418;
    objc_copyWeak(&v11, &location);
    v8 = -[LargeDayNavigationViewCell registerForTraitChanges:withHandler:](v4, "registerForTraitChanges:withHandler:", v7, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)setDelegate:(id)a3
{
  id v4;
  unsigned int v5;
  UISpringLoadedInteraction **p_springLoadInteraction;
  UISpringLoadedInteraction *springLoadInteraction;
  void *v8;
  id v9;
  UISpringLoadedInteraction *v10;
  UISpringLoadedInteraction *v11;
  UISpringLoadedInteraction *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id from;
  id location;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)LargeDayNavigationViewCell;
  -[DayNavigationViewCell setDelegate:](&v21, "setDelegate:", v4);
  if (v4)
  {
    v5 = objc_msgSend(v4, "dayNavigationCellShouldEnableSpringLoading");
    p_springLoadInteraction = &self->_springLoadInteraction;
    springLoadInteraction = self->_springLoadInteraction;
    if (v5 == (springLoadInteraction != 0))
      goto LABEL_8;
    if (v5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewCell delegate](self, "delegate"));
      objc_initWeak(&location, v8);

      objc_initWeak(&from, self);
      v9 = objc_alloc((Class)UISpringLoadedInteraction);
      v13 = _NSConcreteStackBlock;
      v14 = 3221225472;
      v15 = sub_1000C008C;
      v16 = &unk_1001B4B88;
      objc_copyWeak(&v17, &location);
      objc_copyWeak(&v18, &from);
      v10 = (UISpringLoadedInteraction *)objc_msgSend(v9, "initWithActivationHandler:", &v13);
      v11 = *p_springLoadInteraction;
      *p_springLoadInteraction = v10;

      -[LargeDayNavigationViewCell addInteraction:](self, "addInteraction:", *p_springLoadInteraction, v13, v14, v15, v16);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      goto LABEL_8;
    }
  }
  else
  {
    p_springLoadInteraction = &self->_springLoadInteraction;
    springLoadInteraction = self->_springLoadInteraction;
  }
  if (springLoadInteraction)
  {
    -[LargeDayNavigationViewCell removeInteraction:](self, "removeInteraction:");
    v12 = *p_springLoadInteraction;
    *p_springLoadInteraction = 0;

  }
LABEL_8:

}

- (void)prepareForReuse
{
  -[LargeDayNavigationViewCell setCircled:](self, "setCircled:", 0);
  -[LargeDayNavigationViewCell setIsToday:](self, "setIsToday:", 0);
  -[LargeDayNavigationViewCell setIsWeekend:](self, "setIsWeekend:", 0);
  self->_hasOverlay = 0;
  self->_overlayShowsMonth = 0;
  -[LargeDayNavigationViewCell setBadgeType:](self, "setBadgeType:", 0);
}

- (CGRect)circleFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TappableDayNumber frame](self->_dayNumber, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)_createSubviews
{
  TappableDayNumber *v3;
  TappableDayNumber *dayNumber;
  void *v5;
  double v6;
  id v7;
  UIImageView *v8;
  UIImageView *dayBadge;

  if (!self->_dayNumber)
  {
    v3 = -[TappableDayNumber initWithSizeClass:]([TappableDayNumber alloc], "initWithSizeClass:", 2);
    dayNumber = self->_dayNumber;
    self->_dayNumber = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayNavigationViewCell backgroundColor](self, "backgroundColor"));
    -[TappableDayNumber setBackgroundColor:](self->_dayNumber, "setBackgroundColor:", v5);

    -[TappableDayNumber setIsToday:](self->_dayNumber, "setIsToday:", -[DayNavigationViewCell isToday](self, "isToday"));
    -[TappableDayNumber setUserInteractionEnabled:](self->_dayNumber, "setUserInteractionEnabled:", 0);
    *(_QWORD *)&v6 = objc_opt_class(self).n128_u64[0];
    objc_msgSend(v7, "_fontSize", v6);
    -[TappableDayNumber setFontSize:](self->_dayNumber, "setFontSize:");
    -[LargeDayNavigationViewCell addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, "touchDownOccurred:", 1);
    -[LargeDayNavigationViewCell addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, "touchUpOccurred:", 64);
    -[LargeDayNavigationViewCell addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, "touchCancelled:", 128);
    -[LargeDayNavigationViewCell addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, "touchCancelled:", 256);
    -[LargeDayNavigationViewCell addSubview:](self, "addSubview:", self->_dayNumber);
    -[LargeDayNavigationViewCell setNeedsLayout](self, "setNeedsLayout");
    v8 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    dayBadge = self->_dayBadge;
    self->_dayBadge = v8;

    -[UIImageView setClipsToBounds:](self->_dayBadge, "setClipsToBounds:", 1);
    -[UIImageView setHidden:](self->_dayBadge, "setHidden:", 1);
    -[LargeDayNavigationViewCell addSubview:](self, "addSubview:", self->_dayBadge);
  }
}

- (void)updateOverlay
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  UILabel *overlayLabel;
  UILabel *v7;
  UILabel *v8;
  double v9;
  id v10;
  void *v11;
  UILabel *v12;
  UIView *overlayUnderline;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  UIView *v23;
  UIView *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  UIView *v29;
  UIView *v30;
  id v31;

  v3 = CUIKGetOverlayCalendar(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  self->_hasOverlay = v4 != 0;

  overlayLabel = self->_overlayLabel;
  if (self->_hasOverlay)
  {
    if (!overlayLabel)
    {
      v7 = objc_opt_new(UILabel);
      v8 = self->_overlayLabel;
      self->_overlayLabel = v7;

      *(_QWORD *)&v9 = objc_opt_class(self).n128_u64[0];
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_overlayFont", v9));
      -[UILabel setFont:](self->_overlayLabel, "setFont:", v11);

      overlayLabel = (UILabel *)-[LargeDayNavigationViewCell addSubview:](self, "addSubview:", self->_overlayLabel);
    }
  }
  else if (overlayLabel)
  {
    -[UILabel removeFromSuperview](overlayLabel, "removeFromSuperview");
    -[UIView removeFromSuperview](self->_overlayUnderline, "removeFromSuperview");
    v12 = self->_overlayLabel;
    self->_overlayLabel = 0;

    overlayUnderline = self->_overlayUnderline;
    self->_overlayUnderline = 0;

  }
  if (self->_hasOverlay)
  {
    v14 = CUIKGetOverlayCalendar(overlayLabel, v5);
    v31 = (id)objc_claimAutoreleasedReturnValue(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewCell date](self, "date"));
    if (self->_overlayShowsMonth)
      v16 = objc_claimAutoreleasedReturnValue(+[CUIKDateStrings monthDayStringForDate:inCalendar:](CUIKDateStrings, "monthDayStringForDate:inCalendar:", v15, v31));
    else
      v16 = objc_claimAutoreleasedReturnValue(+[CUIKDateStrings overlayMediumStringForDate:inCalendar:](CUIKDateStrings, "overlayMediumStringForDate:inCalendar:", v15, v31));
    v17 = (void *)v16;
    -[UILabel setText:](self->_overlayLabel, "setText:", v16);

    if (-[DayNavigationViewCell isWeekend](self, "isWeekend"))
    {
      v18 = WeekendTextColor();
      v19 = objc_claimAutoreleasedReturnValue(v18);
    }
    else
    {
      v19 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    }
    v20 = (void *)v19;
    -[UILabel setTextColor:](self->_overlayLabel, "setTextColor:", v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "components:fromDate:", 24, v15));
    if (objc_msgSend(v21, "day") == (id)1)
    {
      v22 = 1.0;
      if (objc_msgSend(v21, "month") == (id)1)
      {
        if (objc_msgSend(v21, "isLeapMonth"))
          v22 = 1.0;
        else
          v22 = 1.5;
      }
      if (!self->_overlayUnderline)
      {
        v23 = objc_opt_new(UIView);
        v24 = self->_overlayUnderline;
        self->_overlayUnderline = v23;

        v27 = CalendarAppTintColor(v25, v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        -[UIView setBackgroundColor:](self->_overlayUnderline, "setBackgroundColor:", v28);

        -[LargeDayNavigationViewCell addSubview:](self, "addSubview:", self->_overlayUnderline);
      }
      self->_overlayUnderlineThickness = v22;
    }
    else
    {
      v29 = self->_overlayUnderline;
      if (v29)
      {
        -[UIView removeFromSuperview](v29, "removeFromSuperview");
        v30 = self->_overlayUnderline;
        self->_overlayUnderline = 0;

      }
    }

  }
}

+ (double)heightRequiredWithSizeClass:(int64_t)a3 usesMultiDayStyle:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  int v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double result;
  double v21;
  id v22;
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;

  v4 = a4;
  v7 = CUIKGetOverlayCalendar(a1, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  v10 = objc_msgSend(v9, "showWeekNumbers");

  v12 = EKUIUsesRoundedRectsInsteadOfCircles(0, v11);
  if (v4)
  {
    *(_QWORD *)&v13 = objc_opt_class(a1).n128_u64[0];
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_normalFont", v13));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_overlayFont"));
    objc_msgSend(v15, "pointSize");
    v18 = v17 + 32.0;
    if (!v8)
    {
LABEL_4:

      return v18;
    }
LABEL_3:
    objc_msgSend(v16, "pointSize");
    v18 = v18 + v19;
    goto LABEL_4;
  }
  if (a3 != 2)
  {
    *(_QWORD *)&v21 = objc_opt_class(a1).n128_u64[0];
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "_normalFont", v21));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_overlayFont"));
    if (v8)
      v23 = 1;
    else
      v23 = v10;
    objc_msgSend(v15, "pointSize");
    v18 = v24 + 32.0;
    if (v23 != 1)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (!v12)
  {
    +[LargeDayNavigationViewCell dayLabelBaseHeight](LargeDayNavigationViewCell, "dayLabelBaseHeight");
    v26 = v25;
    +[DayNavigationViewCell circleDiameter](LargeDayNavigationViewCell, "circleDiameter");
    if (v27 > v26)
    {
      +[DayNavigationViewCell circleDiameter](LargeDayNavigationViewCell, "circleDiameter");
      v29 = v28;
      +[LargeDayNavigationViewCell dayLabelYMargin](LargeDayNavigationViewCell, "dayLabelYMargin");
      v26 = v29 + v30;
    }
    v31 = +[LargeDayNavigationViewCell dayLabelYMargin](LargeDayNavigationViewCell, "dayLabelYMargin");
    v18 = v26 + v32;
    v34 = CUIKGetOverlayCalendar(v31, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

    if (v35)
      return v18 + 15.5;
    return v18;
  }
  +[DayNavigationViewCell roundedRectHeight](LargeDayNavigationViewCell, "roundedRectHeight");
  return result;
}

+ (double)dayLabelYMargin
{
  return 1.5;
}

+ (double)dayLabelBaseHeight
{
  return 38.0;
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
      v23[2] = sub_1000C08E8;
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
        v20 = sub_1000C0934;
        v21 = &unk_1001B2E30;
        v22 = v15;
        +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", &v18, 0.3);

      }
      else
      {
        ((void (*)(_QWORD *))v15[2])(v15);
      }

    }
    -[LargeDayNavigationViewCell setNeedsLayout](self, "setNeedsLayout", v17, v18, v19, v20, v21);
  }
}

- (void)setIsToday:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LargeDayNavigationViewCell;
  -[DayNavigationViewCell setIsToday:](&v4, "setIsToday:", a3);
  -[TappableDayNumber setIsToday:](self->_dayNumber, "setIsToday:", -[DayNavigationViewCell isToday](self, "isToday"));
  -[LargeDayNavigationViewCell _updateDisplayedStrings](self, "_updateDisplayedStrings");
  -[LargeDayNavigationViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setIsWeekend:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LargeDayNavigationViewCell;
  -[DayNavigationViewCell setIsWeekend:](&v10, "setIsWeekend:", a3);
  -[TappableDayNumber setIsWeekend:](self->_dayNumber, "setIsWeekend:", -[DayNavigationViewCell isWeekend](self, "isWeekend"));
  if (-[DayNavigationViewCell isWeekend](self, "isWeekend"))
  {
    v4 = WeekendTextColor();
    v5 = objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  }
  v6 = (void *)v5;
  -[UILabel setTextColor:](self->_leftLabel, "setTextColor:", v5);

  if (-[DayNavigationViewCell isWeekend](self, "isWeekend"))
  {
    v7 = WeekendTextColor();
    v8 = objc_claimAutoreleasedReturnValue(v7);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  }
  v9 = (void *)v8;
  -[UILabel setTextColor:](self->_rightLabel, "setTextColor:", v8);

  -[LargeDayNavigationViewCell _updateDisplayedStrings](self, "_updateDisplayedStrings");
  -[LargeDayNavigationViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setWeekendColor:(id)a3
{
  -[TappableDayNumber setWeekendColor:](self->_dayNumber, "setWeekendColor:", a3);
}

- (id)weekendColor
{
  return -[TappableDayNumber weekendColor](self->_dayNumber, "weekendColor");
}

- (void)setCircled:(BOOL)a3
{
  -[LargeDayNavigationViewCell setCircled:animated:](self, "setCircled:animated:", a3, 1);
}

- (void)setCircled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  if (-[DayNavigationViewCell circled](self, "circled") != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)LargeDayNavigationViewCell;
    -[DayNavigationViewCell setCircled:](&v7, "setCircled:", v5);
    -[TappableDayNumber setCircled:animated:](self->_dayNumber, "setCircled:animated:", v5, v4);
    -[LargeDayNavigationViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDate:(id)a3
{
  -[LargeDayNavigationViewCell setDate:forceStringUpdate:](self, "setDate:forceStringUpdate:", a3, 0);
}

- (void)setDate:(id)a3 forceStringUpdate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  unsigned int v8;
  double v9;
  id v10;
  NSString *v11;
  NSString *leftString;
  double v13;
  id v14;
  NSString *v15;
  NSString *centerString;
  double v17;
  id v18;
  NSString *v19;
  NSString *rightString;
  objc_super v21;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewCell date](self, "date"));
  v8 = objc_msgSend(v6, "isEqualToDate:", v7);

  if (!v8 || v4)
  {
    v21.receiver = self;
    v21.super_class = (Class)LargeDayNavigationViewCell;
    -[DayNavigationViewCell setDate:](&v21, "setDate:", v6);
    *(_QWORD *)&v9 = objc_opt_class(self).n128_u64[0];
    v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leftStringForDate:", v6, v9));
    leftString = self->_leftString;
    self->_leftString = v11;

    *(_QWORD *)&v13 = objc_opt_class(self).n128_u64[0];
    v15 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerStringForDate:", v6, v13));
    centerString = self->_centerString;
    self->_centerString = v15;

    *(_QWORD *)&v17 = objc_opt_class(self).n128_u64[0];
    v19 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "rightStringForDate:", v6, v17));
    rightString = self->_rightString;
    self->_rightString = v19;

    -[LargeDayNavigationViewCell setBadgeType:](self, "setBadgeType:", 0);
    -[LargeDayNavigationViewCell _updateDisplayedStrings](self, "_updateDisplayedStrings");
  }

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)LargeDayNavigationViewCell;
  -[LargeDayNavigationViewCell setBackgroundColor:](&v7, "setBackgroundColor:", v4);
  -[TappableDayNumber setBackgroundColor:](self->_dayNumber, "setBackgroundColor:", v4);
  -[UILabel setBackgroundColor:](self->_leftLabel, "setBackgroundColor:", v4);
  -[UILabel setBackgroundColor:](self->_rightLabel, "setBackgroundColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  if ((objc_msgSend(v4, "isEqual:", v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[UIImageView setBackgroundColor:](self->_dayBadge, "setBackgroundColor:", v6);

  }
  else
  {
    -[UIImageView setBackgroundColor:](self->_dayBadge, "setBackgroundColor:", v4);
  }

}

- (void)pulseToday
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  EKUITodayCirclePulseView *v22;
  EKUITodayCirclePulseView *pulseView;
  double v24;
  id v25;
  double v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  int v31;
  double v32;
  double v33;
  double v34;
  id v35;
  id v36;
  double v37;
  uint64_t v38;
  id v39;
  double v40;
  EKUITodayCirclePulseView *v41;
  _QWORD v42[5];
  CGRect v43;

  if (-[DayNavigationViewCell isToday](self, "isToday") && !self->_pulseView)
  {
    -[TappableDayNumber frame](self->_dayNumber, "frame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayNavigationViewCell superview](self, "superview"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "superview"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TappableDayNumber superview](self->_dayNumber, "superview"));
    objc_msgSend(v12, "convertRect:fromView:", v13, v4, v6, v8, v10);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    v22 = (EKUITodayCirclePulseView *)objc_msgSend(objc_alloc((Class)EKUITodayCirclePulseView), "initWithFrame:", v15, v17, v19, v21);
    pulseView = self->_pulseView;
    self->_pulseView = v22;

    if (-[LargeDayNavigationViewCell usesRoundedRectInsteadOfCircle](self, "usesRoundedRectInsteadOfCircle"))
    {
      -[EKUITodayCirclePulseView setCircleShouldFillFrame:](self->_pulseView, "setCircleShouldFillFrame:", 1);
      -[EKUITodayCirclePulseView setUsesRoundedRectInsteadOfCircle:](self->_pulseView, "setUsesRoundedRectInsteadOfCircle:", 1);
    }
    else
    {
      *(_QWORD *)&v24 = objc_opt_class(self).n128_u64[0];
      objc_msgSend(v25, "circleDiameter", v24);
      -[EKUITodayCirclePulseView setCircleDiameter:](self->_pulseView, "setCircleDiameter:");
    }
    -[EKUITodayCirclePulseView setString:](self->_pulseView, "setString:", self->_centerString);
    *(_QWORD *)&v26 = objc_opt_class(self).n128_u64[0];
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "_boldFont", v26));
    -[EKUITodayCirclePulseView setFont:](self->_pulseView, "setFont:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayNavigationViewCell traitCollection](self, "traitCollection"));
    v31 = EKUIUsesRoundedRectsInsteadOfCircles(v29, v30);

    if (v31)
    {
      -[TappableDayNumber numberFrame](self->_dayNumber, "numberFrame");
      -[EKUITodayCirclePulseView setTextYOffset:](self->_pulseView, "setTextYOffset:", CGRectGetMinY(v43));
    }
    else
    {
      -[EKUITodayCirclePulseView circleDiameter](self->_pulseView, "circleDiameter");
      v33 = v32;
      *(_QWORD *)&v34 = objc_opt_class(self).n128_u64[0];
      v36 = objc_msgSend(v35, "defaultCircleDiameter", v34);
      v39 = -[EKUITodayCirclePulseView setTextYOffset:](self->_pulseView, "setTextYOffset:", CalRoundToScreenScale(v36, v38, (v33 - v37) * 0.5) + 3.5);
      if (EKUIScaleFactor(v39) <= 1.0)
        v40 = 0.0;
      else
        v40 = 0.5;
      -[EKUITodayCirclePulseView setTextOffsetFromCircle:](self->_pulseView, "setTextOffsetFromCircle:", 0.0, v40);
    }
    -[EKUITodayCirclePulseView layoutIfNeeded](self->_pulseView, "layoutIfNeeded");
    objc_msgSend(v12, "addSubview:", self->_pulseView);
    -[TappableDayNumber setHidden:](self->_dayNumber, "setHidden:", 1);
    v41 = self->_pulseView;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000C0FD4;
    v42[3] = &unk_1001B2538;
    v42[4] = self;
    -[EKUITodayCirclePulseView pulse:](v41, "pulse:", v42);

  }
}

- (void)stopPulsing
{
  EKUITodayCirclePulseView *pulseView;
  EKUITodayCirclePulseView *v4;

  pulseView = self->_pulseView;
  if (pulseView)
  {
    -[EKUITodayCirclePulseView removeFromSuperview](pulseView, "removeFromSuperview");
    v4 = self->_pulseView;
    self->_pulseView = 0;

  }
}

- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3
{
  -[TappableDayNumber setUsesRoundedRectInsteadOfCircle:](self->_dayNumber, "setUsesRoundedRectInsteadOfCircle:", a3);
}

- (BOOL)usesRoundedRectInsteadOfCircle
{
  return -[TappableDayNumber usesRoundedRectInsteadOfCircle](self->_dayNumber, "usesRoundedRectInsteadOfCircle");
}

- (double)baselineOffsetFromTop
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  -[TappableDayNumber firstLineBaselineOffsetFromBoundsTop](self->_dayNumber, "firstLineBaselineOffsetFromBoundsTop");
  v4 = v3;
  -[TappableDayNumber frame](self->_dayNumber, "frame");
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TappableDayNumber superview](self->_dayNumber, "superview"));
  -[LargeDayNavigationViewCell convertPoint:fromView:](self, "convertPoint:fromView:", v9, v6, v8);
  v11 = v10;

  return v4 + v11;
}

- (CGRect)contentFrame
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  -[TappableDayNumber numberFrame](self->_dayNumber, "numberFrame");
  -[LargeDayNavigationViewCell convertRect:fromView:](self, "convertRect:fromView:", self->_dayNumber);
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  MinX = CGRectGetMinX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MinY = CGRectGetMinY(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  MaxX = CGRectGetMaxX(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  MaxY = CGRectGetMaxY(v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_leftLabel, "superview"));

  if (v11)
  {
    -[UILabel frame](self->_leftLabel, "frame");
    MinX = fmin(MinX, CGRectGetMinX(v21));
    -[UILabel frame](self->_leftLabel, "frame");
    MinY = fmin(MinY, CGRectGetMinY(v22));
    -[UILabel frame](self->_leftLabel, "frame");
    MaxX = fmax(MaxX, CGRectGetMaxX(v23));
    -[UILabel frame](self->_leftLabel, "frame");
    MaxY = fmax(MaxY, CGRectGetMaxY(v24));
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_rightLabel, "superview"));

  if (v12)
  {
    -[UILabel frame](self->_rightLabel, "frame");
    MinX = fmin(MinX, CGRectGetMinX(v25));
    -[UILabel frame](self->_rightLabel, "frame");
    MinY = fmin(MinY, CGRectGetMinY(v26));
    -[UILabel frame](self->_rightLabel, "frame");
    MaxX = fmax(MaxX, CGRectGetMaxX(v27));
    -[UILabel frame](self->_rightLabel, "frame");
    MaxY = fmax(MaxY, CGRectGetMaxY(v28));
  }
  v13 = MaxX - MinX;
  v14 = MaxY - MinY;
  v15 = MinX;
  v16 = MinY;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)setLabelElementsVisible:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)LargeDayNavigationViewCell;
  -[DayNavigationViewCell setLabelElementsVisible:](&v6, "setLabelElementsVisible:");
  v5 = !v3;
  -[TappableDayNumber setHidden:](self->_dayNumber, "setHidden:", v5);
  -[UILabel setHidden:](self->_leftLabel, "setHidden:", v5);
  -[UILabel setHidden:](self->_rightLabel, "setHidden:", v5);
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

  -[LargeDayNavigationViewCell contentFrame](self, "contentFrame");
  v2.n128_u64[0] = -5.0;
  v3.n128_u64[0] = -8.0;
  v4.n128_u64[0] = -5.0;
  UIRectInset(v5, v6, v7, v8, v2, v3, v4, -8.0);
  return +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:");
}

- (void)layoutSubviews
{
  unsigned int v3;
  TappableDayNumber *dayNumber;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  double v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat Height;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  id v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  id v40;
  double v41;
  double MidX;
  double Width;
  double v44;
  double v45;
  double MinY;
  double v47;
  double v48;
  unsigned int v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  id v56;
  id v57;
  double v58;
  id v59;
  id v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  uint64_t IsLeftToRight;
  uint64_t v68;
  double v69;
  double v70;
  id v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  CGFloat MinX;
  uint64_t v81;
  uint64_t v82;
  double v83;
  double v84;
  id v85;
  double v86;
  UILabel *overlayLabel;
  double v88;
  double v89;
  double v90;
  double MaxY;
  CGFloat v92;
  uint64_t v93;
  uint64_t v94;
  double v95;
  uint64_t v96;
  uint64_t v97;
  double v98;
  double v99;
  id v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  void *v105;
  double v106;
  double v107;
  double v108;
  double v109;
  id v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;

  v3 = -[LargeDayNavigationViewCell usesRoundedRectInsteadOfCircle](self, "usesRoundedRectInsteadOfCircle");
  dayNumber = self->_dayNumber;
  if (v3)
  {
    -[TappableDayNumber numberFrame](dayNumber, "numberFrame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    *(_QWORD *)&v13 = objc_opt_class(self).n128_u64[0];
    objc_msgSend(v14, "roundedRectHorizontalPadding", v13);
    v16 = v10 + v15 * 2.0;
    *(_QWORD *)&v17 = objc_opt_class(self).n128_u64[0];
    objc_msgSend(v18, "roundedRectVerticalPadding", v17);
    v20 = v12 + v19 * 2.0;
    -[LargeDayNavigationViewCell yCenterForDayNumbers](self, "yCenterForDayNumbers");
    v22 = v21;
    v111.origin.x = v6;
    v111.origin.y = v8;
    v111.size.width = v16;
    v111.size.height = v20;
    Height = CGRectGetHeight(v111);
    v26 = CalRoundToScreenScale(v24, v25, v22 + Height * -0.5);
  }
  else
  {
    -[TappableDayNumber frame](dayNumber, "frame");
    v6 = v27;
    v29 = v28;
    *(_QWORD *)&v30 = objc_opt_class(self).n128_u64[0];
    objc_msgSend(v31, "circleDiameter", v30);
    v20 = v32;
    -[LargeDayNavigationViewCell yCenterForDayNumbers](self, "yCenterForDayNumbers");
    v34 = v33;
    v112.origin.x = v6;
    v112.origin.y = v29;
    v112.size.width = v20;
    v112.size.height = v20;
    v35 = CGRectGetHeight(v112);
    v38 = CalRoundToScreenScale(v36, v37, v34 + v35 * -0.5);
    *(_QWORD *)&v39 = objc_opt_class(self).n128_u64[0];
    objc_msgSend(v40, "defaultCircleDiameter", v39);
    v26 = v38 + 1.0;
    if (v20 <= v41)
      v26 = v38;
    v16 = v20;
  }
  -[TappableDayNumber setFrame:](self->_dayNumber, "setFrame:", v6, v26, v16, v20);
  -[LargeDayNavigationViewCell _updateDisplayedStrings](self, "_updateDisplayedStrings");
  -[LargeDayNavigationViewCell bounds](self, "bounds");
  MidX = CGRectGetMidX(v113);
  -[UILabel frame](self->_leftLabel, "frame");
  Width = CGRectGetWidth(v114);
  -[TappableDayNumber contentFrame](self->_dayNumber, "contentFrame");
  v44 = Width + CGRectGetWidth(v115);
  -[UILabel frame](self->_rightLabel, "frame");
  v45 = CGRectGetWidth(v116);
  -[TappableDayNumber frame](self->_dayNumber, "frame");
  MinY = CGRectGetMinY(v117);
  -[TappableDayNumber firstLineBaselineOffsetFromBoundsTop](self->_dayNumber, "firstLineBaselineOffsetFromBoundsTop");
  v48 = v47;
  v49 = -[TappableDayNumber circled](self->_dayNumber, "circled");
  *(_QWORD *)&v51 = objc_opt_class(self).n128_u64[0];
  if (v49)
    objc_msgSend(v50, "interTextSpacingCircled", v51);
  else
    objc_msgSend(v50, "interTextSpacing", v51);
  v53 = v52;
  v54 = v44 + v45;
  *(_QWORD *)&v55 = objc_opt_class(self).n128_u64[0];
  v57 = objc_msgSend(v56, "_stringsIncludeSpacing", v55);
  if ((_DWORD)v57)
  {
    *(_QWORD *)&v58 = objc_opt_class(self).n128_u64[0];
    v60 = objc_msgSend(v59, "_widthOfSpace", v58);
    v53 = v53 - v61 + CalCeilToScreenScale(v60, 0.5);
  }
  v62 = MinY + v48;
  v63 = -0.0;
  if (self->_leftString)
    v64 = v53;
  else
    v64 = -0.0;
  v65 = v54 + v64;
  if (self->_rightString)
    v63 = v53;
  v66 = v65 + v63;
  IsLeftToRight = CalInterfaceIsLeftToRight(v57);
  if ((_DWORD)IsLeftToRight)
    v69 = 4.0;
  else
    v69 = -4.0;
  v70 = CalRoundToScreenScale(IsLeftToRight, v68, MidX + v66 * -0.5) + v69;
  if (self->_leftString)
  {
    -[UILabel frame](self->_leftLabel, "frame");
    v71 = -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_leftLabel, "_firstLineBaselineOffsetFromBoundsTop");
    -[UILabel setFrame:](self->_leftLabel, "setFrame:", CalRoundPointToScreenScale(v71, v70, v62 - v72));
    -[UILabel frame](self->_leftLabel, "frame");
    v70 = v70 + v53 + v73;
  }
  -[TappableDayNumber frame](self->_dayNumber, "frame");
  v75 = v74;
  v77 = v76;
  v79 = v78;
  -[TappableDayNumber contentFrame](self->_dayNumber, "contentFrame");
  MinX = CGRectGetMinX(v118);
  -[TappableDayNumber setFrame:](self->_dayNumber, "setFrame:", CalRoundToScreenScale(v81, v82, v70 - MinX), v75, v77, v79);
  -[TappableDayNumber contentFrame](self->_dayNumber, "contentFrame");
  if (self->_rightString)
  {
    v84 = v70 + v53 + v83;
    -[UILabel frame](self->_rightLabel, "frame");
    v85 = -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_rightLabel, "_firstLineBaselineOffsetFromBoundsTop");
    -[UILabel setFrame:](self->_rightLabel, "setFrame:", CalRoundPointToScreenScale(v85, v84, v62 - v86));
  }
  overlayLabel = self->_overlayLabel;
  if (overlayLabel)
  {
    -[UILabel sizeToFit](overlayLabel, "sizeToFit");
    -[UILabel frame](self->_overlayLabel, "frame");
    v88 = v119.size.width;
    v89 = v119.size.height;
    v90 = v69 + MidX + CGRectGetWidth(v119) * -0.5;
    -[TappableDayNumber frame](self->_dayNumber, "frame");
    MaxY = CGRectGetMaxY(v120);
    -[UILabel setFrame:](self->_overlayLabel, "setFrame:", CalRoundRectToScreenScale(v90, MaxY, v88, v89));
    if (self->_overlayUnderline)
    {
      v121.origin.x = v90;
      v121.origin.y = MaxY;
      v121.size.width = v88;
      v121.size.height = v89;
      v92 = CGRectGetMaxY(v121);
      v95 = CalRoundToScreenScale(v93, v94, v92 + 0.5);
      v98 = CalRoundToScreenScale(v96, v97, self->_overlayUnderlineThickness);
      -[UIView setFrame:](self->_overlayUnderline, "setFrame:", CalRoundRectToScreenScale(v90, v95, v88, v98));
    }
  }
  if (self->_badgeType)
  {
    *(_QWORD *)&v99 = objc_opt_class(self).n128_u64[0];
    objc_msgSend(v100, "badgeDiameter", v99);
    v102 = v101 * 0.5;
    *(_QWORD *)&v103 = objc_opt_class(self).n128_u64[0];
    v105 = v104;
    -[TappableDayNumber frame](self->_dayNumber, "frame", v103);
    objc_msgSend(v105, "badgeFrameFromDayNumberFrame:isRightToLeft:", self->_rightLabel != 0);
    -[UIImageView setFrame:](self->_dayBadge, "setFrame:", CalRoundRectToScreenScale(v106, v107, v108, v109));
    v110 = (id)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_dayBadge, "layer"));
    objc_msgSend(v110, "setCornerRadius:", v102);

  }
}

- (void)_updateDisplayedStrings
{
  UILabel *v3;
  UILabel *leftLabel;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  UILabel *v11;
  UILabel *rightLabel;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  id v20;
  void *v21;
  double v22;
  id v23;
  void *v24;

  -[TappableDayNumber setText:](self->_dayNumber, "setText:", self->_centerString);
  if (!self->_leftLabel && self->_leftString)
  {
    v3 = objc_opt_new(UILabel);
    leftLabel = self->_leftLabel;
    self->_leftLabel = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayNavigationViewCell backgroundColor](self, "backgroundColor"));
    -[UILabel setBackgroundColor:](self->_leftLabel, "setBackgroundColor:", v5);

    if (-[DayNavigationViewCell isWeekend](self, "isWeekend"))
    {
      v6 = WeekendTextColor();
      v7 = objc_claimAutoreleasedReturnValue(v6);
    }
    else
    {
      v7 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    }
    v8 = (void *)v7;
    -[UILabel setTextColor:](self->_leftLabel, "setTextColor:", v7);

    if (CUIKLocaleIsRightToLeft(v9))
      v10 = 2;
    else
      v10 = 0;
    -[UILabel setTextAlignment:](self->_leftLabel, "setTextAlignment:", v10);
    -[LargeDayNavigationViewCell addSubview:](self, "addSubview:", self->_leftLabel);
  }
  if (!self->_rightLabel && self->_rightString)
  {
    v11 = objc_opt_new(UILabel);
    rightLabel = self->_rightLabel;
    self->_rightLabel = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayNavigationViewCell backgroundColor](self, "backgroundColor"));
    -[UILabel setBackgroundColor:](self->_rightLabel, "setBackgroundColor:", v13);

    if (-[DayNavigationViewCell isWeekend](self, "isWeekend"))
    {
      v14 = WeekendTextColor();
      v15 = objc_claimAutoreleasedReturnValue(v14);
    }
    else
    {
      v15 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    }
    v16 = (void *)v15;
    -[UILabel setTextColor:](self->_rightLabel, "setTextColor:", v15);

    if (CUIKLocaleIsRightToLeft(v17))
      v18 = 2;
    else
      v18 = 0;
    -[UILabel setTextAlignment:](self->_rightLabel, "setTextAlignment:", v18);
    -[LargeDayNavigationViewCell addSubview:](self, "addSubview:", self->_rightLabel);
  }
  -[UILabel setText:](self->_leftLabel, "setText:", self->_leftString);
  *(_QWORD *)&v19 = objc_opt_class(self).n128_u64[0];
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_normalFont", v19));
  -[UILabel setFont:](self->_leftLabel, "setFont:", v21);

  -[UILabel sizeToFit](self->_leftLabel, "sizeToFit");
  -[UILabel setText:](self->_rightLabel, "setText:", self->_rightString);
  *(_QWORD *)&v22 = objc_opt_class(self).n128_u64[0];
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_normalFont", v22));
  -[UILabel setFont:](self->_rightLabel, "setFont:", v24);

  -[UILabel sizeToFit](self->_rightLabel, "sizeToFit");
  -[LargeDayNavigationViewCell updateOverlay](self, "updateOverlay");
}

- (double)yCenterForDayNumbers
{
  double v2;
  id v3;
  id v4;
  uint64_t v5;
  double v6;

  *(_QWORD *)&v2 = objc_opt_class(self).n128_u64[0];
  v4 = objc_msgSend(v3, "yCenterForDayNumbers", v2);
  return CalRoundToScreenScale(v4, v5, v6);
}

- (int64_t)badgeType
{
  return self->_badgeType;
}

- (void)setBadgeType:(int64_t)a3
{
  int64_t badgeType;

  badgeType = self->_badgeType;
  if (badgeType != a3)
  {
    self->_badgeType = a3;
    -[LargeDayNavigationViewCell _updateBadge](self, "_updateBadge");
    if (!badgeType)
      -[LargeDayNavigationViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)badgeColor
{
  UIColor *badgeColor;

  badgeColor = self->_badgeColor;
  if (badgeColor)
    return badgeColor;
  else
    return (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
}

- (void)setBadgeColor:(id)a3
{
  unint64_t v5;
  UIColor *badgeColor;
  unsigned __int8 v7;
  unint64_t v8;

  v5 = (unint64_t)a3;
  badgeColor = self->_badgeColor;
  if (v5 | (unint64_t)badgeColor)
  {
    v8 = v5;
    v7 = -[UIColor isEqual:](badgeColor, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_badgeColor, a3);
      -[LargeDayNavigationViewCell _updateBadge](self, "_updateBadge");
      v5 = v8;
    }
  }

}

- (id)badgeLocale
{
  return self->_badgeLocale;
}

- (void)setBadgeLocale:(id)a3
{
  unint64_t v5;
  NSString *badgeLocale;
  unsigned __int8 v7;
  unint64_t v8;

  v5 = (unint64_t)a3;
  badgeLocale = self->_badgeLocale;
  if (v5 | (unint64_t)badgeLocale)
  {
    v8 = v5;
    v7 = -[NSString isEqual:](badgeLocale, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_badgeLocale, a3);
      -[LargeDayNavigationViewCell _updateBadge](self, "_updateBadge");
      v5 = v8;
    }
  }

}

- (void)_updateBadge
{
  void *v3;
  void *v4;
  id v5;
  int64_t badgeType;
  double v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  id v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayNavigationViewCell badgeColor](self, "badgeColor"));

  if (!v3)
    goto LABEL_8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayNavigationViewCell traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  badgeType = self->_badgeType;
  if (badgeType == 3)
  {
    *(_QWORD *)&v14 = objc_opt_class(self).n128_u64[0];
    objc_msgSend(v15, "badgeDiameter", v14);
    v17 = v16;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayNavigationViewCell badgeColor](self, "badgeColor"));
    v18 = BadgeImageForAlternateWorkday(v11, v5, self->_badgeLocale, v17);
    v13 = objc_claimAutoreleasedReturnValue(v18);
  }
  else
  {
    if (badgeType != 1)
      goto LABEL_8;
    *(_QWORD *)&v7 = objc_opt_class(self).n128_u64[0];
    objc_msgSend(v8, "badgeDiameter", v7);
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayNavigationViewCell badgeColor](self, "badgeColor"));
    v12 = BadgeImageForHoliday(v11, v5, self->_badgeLocale, v10);
    v13 = objc_claimAutoreleasedReturnValue(v12);
  }
  v19 = (id)v13;

  if (v19)
  {
    -[UIImageView setImage:](self->_dayBadge, "setImage:", v19);
    -[UIImageView setHidden:](self->_dayBadge, "setHidden:", 0);

    return;
  }
LABEL_8:
  -[UIImageView setHidden:](self->_dayBadge, "setHidden:", 1);
}

- (void)touchDownOccurred:(id)a3
{
  -[TappableDayNumber setPressed:](self->_dayNumber, "setPressed:", 1);
}

- (void)touchUpOccurred:(id)a3
{
  void *v4;
  id v5;

  -[TappableDayNumber setPressed:](self->_dayNumber, "setPressed:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewCell delegate](self, "delegate"));

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[DayNavigationViewCell delegate](self, "delegate"));
    objc_msgSend(v5, "dayNavigationCellTouchUpOccurred:", self);

  }
}

- (void)touchCancelled:(id)a3
{
  -[TappableDayNumber setPressed:](self->_dayNumber, "setPressed:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeLocale, 0);
  objc_storeStrong((id *)&self->_badgeColor, 0);
  objc_storeStrong((id *)&self->_dayBadge, 0);
  objc_storeStrong((id *)&self->_springLoadInteraction, 0);
  objc_storeStrong((id *)&self->_pulseView, 0);
  objc_storeStrong((id *)&self->_rightString, 0);
  objc_storeStrong((id *)&self->_centerString, 0);
  objc_storeStrong((id *)&self->_leftString, 0);
  objc_storeStrong((id *)&self->_overlayUnderline, 0);
  objc_storeStrong((id *)&self->_overlayLabel, 0);
  objc_storeStrong((id *)&self->_rightLabel, 0);
  objc_storeStrong((id *)&self->_leftLabel, 0);
  objc_storeStrong((id *)&self->_dayNumber, 0);
}

@end
