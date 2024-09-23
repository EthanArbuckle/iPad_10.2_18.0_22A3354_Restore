@implementation CompactMonthWeekTodayCircle

- (CompactMonthWeekTodayCircle)initWithCalendarDate:(id)a3
{
  id v5;
  CompactMonthWeekTodayCircle *v6;
  CompactMonthWeekTodayCircle *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSString *dayString;
  uint64_t v12;
  uint64_t v13;
  UIColor *nonTodayCircleColor;
  UILabel *v15;
  UILabel *dayLabel;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CompactMonthWeekTodayCircle;
  v6 = -[CompactMonthWeekTodayCircle init](&v22, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_calendarDate, a3);
    v8 = objc_msgSend(v5, "day");
    v7->_day = (unint64_t)v8;
    v9 = CUIKLocalizedStringForInteger(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    dayString = v7->_dayString;
    v7->_dayString = (NSString *)v10;

    v7->_drawCircle = 1;
    v7->_useTodayColors = 1;
    v7->_showOverlay = 0;
    v7->_fontSize = 18.0;
    v7->_overlayFontSize = 10.0;
    v12 = CalendarAppCircleNonTodayBGColor();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    nonTodayCircleColor = v7->_nonTodayCircleColor;
    v7->_nonTodayCircleColor = (UIColor *)v13;

    v15 = (UILabel *)objc_alloc_init((Class)UILabel);
    dayLabel = v7->_dayLabel;
    v7->_dayLabel = v15;

    -[CompactMonthWeekTodayCircle fontSize](v7, "fontSize");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekTodayCircle _dayNumberFontForSize:](v7, "_dayNumberFontForSize:"));
    -[UILabel setFont:](v7->_dayLabel, "setFont:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v7->_dayLabel, "setBackgroundColor:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](v7->_dayLabel, "setTextColor:", v19);

    -[UILabel setText:](v7->_dayLabel, "setText:", v7->_dayString);
    -[UILabel sizeToFit](v7->_dayLabel, "sizeToFit");
    -[CompactMonthWeekTodayCircle addSubview:](v7, "addSubview:", v7->_dayLabel);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[CompactMonthWeekTodayCircle setBackgroundColor:](v7, "setBackgroundColor:", v20);

    -[CompactMonthWeekTodayCircle setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
  }

  return v7;
}

+ (double)circleDiameter
{
  return 40.0;
}

+ (double)circleDiameterCompressed
{
  return 30.0;
}

+ (double)circleDiameterWithOverlayLarge
{
  return 41.0;
}

+ (double)roundedRectHeightWithOverlay:(BOOL)a3 fontSize:(double)a4 overlayFontSize:(double)a5
{
  double v5;
  double v6;

  v5 = a4 / 36.0;
  v6 = 51.0;
  if (a3)
    v6 = 70.0;
  return CalRoundToScreenScale(a1, a2, v6 * v5);
}

+ (CGSize)roundedRectSizeForNumberString:(id)a3 overlayString:(id)a4 fontSize:(double)a5 overlayFontSize:(double)a6
{
  id v10;
  id v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  NSAttributedStringKey v32;
  void *v33;
  NSAttributedStringKey v34;
  void *v35;
  CGSize result;

  v10 = a4;
  v11 = a3;
  v13 = CalRoundToScreenScale(v11, v12, a5 / 36.0 * 51.0);
  v34 = NSFontAttributeName;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dayNumberFontForSize:", a5));
  v35 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
  objc_msgSend(v11, "sizeWithAttributes:", v15);
  v17 = v16;

  v20 = CalRoundToScreenScale(v18, v19, v17) + 10.0;
  if (v20 >= v13)
    v13 = v20;
  if (v10)
  {
    v32 = NSFontAttributeName;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dayOverlayFontForSize:", a6));
    v33 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    objc_msgSend(v10, "sizeWithAttributes:", v22);
    v24 = v23;

    v27 = CalRoundToScreenScale(v25, v26, v24) + 10.0;
    if (v27 >= v13)
      v13 = v27;
  }
  objc_msgSend(a1, "roundedRectHeightWithOverlay:fontSize:overlayFontSize:", v10 != 0, a5, a6);
  v29 = v28;

  v30 = v13;
  v31 = v29;
  result.height = v31;
  result.width = v30;
  return result;
}

- (id)dayNumberString
{
  return self->_dayString;
}

- (id)overlayString
{
  return -[UILabel text](self->_overlayLabel, "text");
}

- (CGRect)dayNumberFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UILabel frame](self->_dayLabel, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

+ (double)topOffset
{
  return 7.0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  void *v5;
  void *v6;
  NSString *dayString;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  double v20;
  id v21;
  _BOOL4 compressed;
  void *v23;
  double v24;
  double v25;
  id v26;
  CGSize result;

  if (-[CompactMonthWeekTodayCircle usesRoundedRectInsteadOfCircle](self, "usesRoundedRectInsteadOfCircle", a3.width, a3.height))
  {
    *(_QWORD *)&v4 = objc_opt_class(self).n128_u64[0];
    v6 = v5;
    dayString = self->_dayString;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_overlayLabel, "text", v4));
    -[CompactMonthWeekTodayCircle fontSize](self, "fontSize");
    v10 = v9;
    -[CompactMonthWeekTodayCircle overlayFontSize](self, "overlayFontSize");
    objc_msgSend(v6, "roundedRectSizeForNumberString:overlayString:fontSize:overlayFontSize:", dayString, v8, v10, v11);
    v13 = v12;
    v15 = v14;

    v16 = v13;
    v17 = v15;
  }
  else
  {
    if (self->_showOverlay)
    {
      if (-[NSString length](self->_dayString, "length") <= 1
        && (v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_overlayLabel, "text")),
            v19 = objc_msgSend(v18, "length"),
            v18,
            (unint64_t)v19 < 3))
      {
        *(_QWORD *)&v25 = objc_opt_class(self).n128_u64[0];
        objc_msgSend(v26, "circleDiameterWithOverlay", v25);
      }
      else
      {
        *(_QWORD *)&v20 = objc_opt_class(self).n128_u64[0];
        objc_msgSend(v21, "circleDiameterWithOverlayLarge", v20);
      }
    }
    else
    {
      compressed = self->_compressed;
      *(_QWORD *)&v24 = objc_opt_class(self).n128_u64[0];
      if (compressed)
        objc_msgSend(v23, "circleDiameterCompressed", v24);
      else
        objc_msgSend(v23, "circleDiameter", v24);
    }
    v17 = v16;
  }
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)setUseTodayColors:(BOOL)a3
{
  void *v4;

  if (self->_useTodayColors != a3)
  {
    self->_useTodayColors = a3;
    -[CompactMonthWeekTodayCircle fontSize](self, "fontSize");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekTodayCircle _dayNumberFontForSize:](self, "_dayNumberFontForSize:"));
    -[UILabel setFont:](self->_dayLabel, "setFont:", v4);

    -[CompactMonthWeekTodayCircle _updateTextColor](self, "_updateTextColor");
    -[CompactMonthWeekTodayCircle setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setFontOverride:(id)a3
{
  UIFont *v5;
  void *v6;
  UIFont *v7;

  v5 = (UIFont *)a3;
  if (self->_fontOverride != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_fontOverride, a3);
    -[CompactMonthWeekTodayCircle fontSize](self, "fontSize");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekTodayCircle _dayNumberFontForSize:](self, "_dayNumberFontForSize:"));
    -[UILabel setFont:](self->_dayLabel, "setFont:", v6);

    -[CompactMonthWeekTodayCircle setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v7;
  }

}

- (void)setDrawCircle:(BOOL)a3
{
  if (self->_drawCircle != a3)
  {
    self->_drawCircle = a3;
    -[CompactMonthWeekTodayCircle _updateTextColor](self, "_updateTextColor");
    -[CompactMonthWeekTodayCircle setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setShowOverlay:(BOOL)a3
{
  UILabel *v4;
  UILabel *overlayLabel;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  UILabel *v16;

  if (self->_showOverlay != a3)
  {
    self->_showOverlay = a3;
    if (a3)
    {
      v4 = (UILabel *)objc_alloc_init((Class)UILabel);
      overlayLabel = self->_overlayLabel;
      self->_overlayLabel = v4;

      *(_QWORD *)&v6 = objc_opt_class(self).n128_u64[0];
      v8 = v7;
      -[CompactMonthWeekTodayCircle overlayFontSize](self, "overlayFontSize", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dayOverlayFontForSize:"));
      -[UILabel setFont:](self->_overlayLabel, "setFont:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[UILabel setBackgroundColor:](self->_overlayLabel, "setBackgroundColor:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_calendarDate, "date"));
      v13 = CUIKGetOverlayCalendar(v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKDateStrings overlayShortStringForDate:inCalendar:](CUIKDateStrings, "overlayShortStringForDate:inCalendar:", v11, v14));
      -[UILabel setText:](self->_overlayLabel, "setText:", v15);

      -[UILabel sizeToFit](self->_overlayLabel, "sizeToFit");
      -[CompactMonthWeekTodayCircle addSubview:](self, "addSubview:", self->_overlayLabel);
      -[CompactMonthWeekTodayCircle _updateTextColor](self, "_updateTextColor");
    }
    else
    {
      -[UILabel removeFromSuperview](self->_overlayLabel, "removeFromSuperview");
      v16 = self->_overlayLabel;
      self->_overlayLabel = 0;

    }
    -[CompactMonthWeekTodayCircle setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)updateOverlay
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (self->_showOverlay)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_calendarDate, "date"));
    v5 = CUIKGetOverlayCalendar(v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKDateStrings overlayShortStringForDate:inCalendar:](CUIKDateStrings, "overlayShortStringForDate:inCalendar:", v3, v6));
    -[UILabel setText:](self->_overlayLabel, "setText:", v7);

    -[UILabel sizeToFit](self->_overlayLabel, "sizeToFit");
    -[CompactMonthWeekTodayCircle setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setNonTodayColor:(id)a3
{
  objc_storeStrong((id *)&self->_nonTodayColor, a3);
  -[CompactMonthWeekTodayCircle _updateTextColor](self, "_updateTextColor");
}

- (void)setFontSize:(double)a3
{
  void *v4;

  if (vabdd_f64(self->_fontSize, a3) >= 2.22044605e-16)
  {
    self->_fontSize = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekTodayCircle _dayNumberFontForSize:](self, "_dayNumberFontForSize:"));
    -[UILabel setFont:](self->_dayLabel, "setFont:", v4);

    -[UILabel sizeToFit](self->_dayLabel, "sizeToFit");
  }
}

- (void)setOverlayFontSize:(double)a3
{
  id v5;
  void *v6;

  if (vabdd_f64(self->_overlayFontSize, a3) >= 2.22044605e-16)
  {
    self->_overlayFontSize = a3;
    objc_opt_class(self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dayOverlayFontForSize:", a3));
    -[UILabel setFont:](self->_overlayLabel, "setFont:", v6);

    -[UILabel sizeToFit](self->_overlayLabel, "sizeToFit");
  }
}

- (void)_updateTextColor
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  if (self->_drawCircle)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekTodayCircle nonTodayColor](self, "nonTodayColor"));

    if (!v3)
    {
      if (-[CompactMonthWeekTodayCircle useTodayColors](self, "useTodayColors"))
      {
        v9 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      }
      else
      {
        v10 = CalendarAppCircleTextColor();
        v9 = objc_claimAutoreleasedReturnValue(v10);
      }
      goto LABEL_7;
    }
  }
  v4 = -[CompactMonthWeekTodayCircle useTodayColors](self, "useTodayColors");
  if ((v4 & 1) != 0
    || (v4 = objc_claimAutoreleasedReturnValue(-[CompactMonthWeekTodayCircle nonTodayColor](self, "nonTodayColor"))) == 0)
  {
    v8 = CalendarAppTintColor(v4, v5);
    v9 = objc_claimAutoreleasedReturnValue(v8);
LABEL_7:
    v7 = (id)v9;
    goto LABEL_8;
  }
  v6 = (void *)v4;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekTodayCircle nonTodayColor](self, "nonTodayColor"));

  v7 = v11;
LABEL_8:
  v12 = v7;
  -[UILabel setTextColor:](self->_dayLabel, "setTextColor:", v7);
  -[UILabel setTextColor:](self->_overlayLabel, "setTextColor:", v12);

}

- (id)_dayNumberFontForSize:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekTodayCircle fontOverride](self, "fontOverride"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekTodayCircle fontOverride](self, "fontOverride"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fontDescriptor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v7, a3));

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", a3, UIFontWeightBold));
  }
  return v8;
}

+ (id)dayNumberFontForSize:(double)a3
{
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", a3, UIFontWeightBold);
}

+ (id)dayOverlayFontForSize:(double)a3
{
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", a3, UIFontWeightBold);
}

+ (double)roundedRectDayNumberBaselineOffsetWithOverlay:(BOOL)a3 fontSize:(double)a4 overlayFontSize:(double)a5
{
  _BOOL8 v7;
  void *v9;
  double v10;
  double v11;
  CGFloat Height;
  uint64_t v13;
  uint64_t v14;
  double v15;
  void *v16;
  id v17;
  double v18;
  uint64_t v19;
  CGRect v21;
  CGRect v22;

  v7 = a3;
  if (qword_1001F62A0 != -1)
    dispatch_once(&qword_1001F62A0, &stru_1001B46A8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dayNumberFontForSize:", a4));
  objc_msgSend((id)qword_1001F6290, "setFont:", v9);

  objc_msgSend((id)qword_1001F6290, "sizeToFit");
  objc_msgSend(a1, "roundedRectHeightWithOverlay:fontSize:overlayFontSize:", v7, a4, a5);
  v11 = v10 * 0.5;
  objc_msgSend((id)qword_1001F6290, "frame");
  Height = CGRectGetHeight(v21);
  v15 = CalRoundToScreenScale(v13, v14, v11 + Height * -0.5) + -0.5;
  if (v7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dayOverlayFontForSize:", a5));
    objc_msgSend((id)qword_1001F6298, "setFont:", v16);

    objc_msgSend((id)qword_1001F6298, "sizeToFit");
    objc_msgSend((id)qword_1001F6298, "frame");
    v15 = v15 - ((CGRectGetHeight(v22) + -3.5) * 0.5 + 1.5);
  }
  v17 = objc_msgSend((id)qword_1001F6290, "_firstLineBaselineOffsetFromBoundsTop");
  return CalRoundToScreenScale(v17, v19, v15 + v18);
}

- (void)layoutSubviews
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
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double Width;
  double v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  double MidY;
  double v26;
  CGFloat Height;
  uint64_t v28;
  uint64_t v29;
  double v30;
  UILabel *overlayLabel;
  CGFloat x;
  CGFloat y;
  double v34;
  double v35;
  double MidX;
  double v37;
  CGFloat MaxY;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat rect;
  objc_super v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v44.receiver = self;
  v44.super_class = (Class)CompactMonthWeekTodayCircle;
  -[CompactMonthWeekTodayCircle layoutSubviews](&v44, "layoutSubviews");
  -[CompactMonthWeekTodayCircle bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  rect = v7;
  v10 = v9;
  -[UILabel frame](self->_dayLabel, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v45.origin.x = v4;
  v45.origin.y = v6;
  v45.size.width = v8;
  v45.size.height = v10;
  Width = CGRectGetWidth(v45);
  v46.origin.x = v12;
  v46.origin.y = v14;
  v46.size.width = v16;
  v46.size.height = v18;
  v20 = (Width - CGRectGetWidth(v46)) * 0.5;
  -[CompactMonthWeekTodayCircle fontSize](self, "fontSize");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekTodayCircle _dayNumberFontForSize:](self, "_dayNumberFontForSize:"));
  v22 = v20 + CalOffsetToCenterNumberWithFont(self->_dayString, v21);
  v41 = v4;
  v42 = v10;
  v47.origin.x = v4;
  v23 = v6;
  v47.origin.y = v6;
  v47.size.width = rect;
  v47.size.height = v10;
  v24 = v18;
  MidY = CGRectGetMidY(v47);
  v48.origin.x = v22;
  v48.origin.y = v14;
  v26 = v16;
  v48.size.width = v16;
  v48.size.height = v18;
  Height = CGRectGetHeight(v48);
  v30 = CalRoundToScreenScale(v28, v29, MidY + Height * -0.5) + -0.5;
  overlayLabel = self->_overlayLabel;
  if (overlayLabel)
  {
    -[UILabel frame](overlayLabel, "frame");
    x = v49.origin.x;
    y = v49.origin.y;
    v40 = v26;
    v34 = v49.size.width;
    v35 = v49.size.height;
    v30 = v30 - ((CGRectGetHeight(v49) + -3.5) * 0.5 + 1.5);
    v50.origin.x = v41;
    v50.size.height = v42;
    v50.origin.y = v23;
    v50.size.width = rect;
    MidX = CGRectGetMidX(v50);
    v51.origin.x = x;
    v51.origin.y = y;
    v51.size.width = v34;
    v51.size.height = v35;
    v37 = MidX - CGRectGetWidth(v51) * 0.5;
    v52.origin.x = v22;
    v52.origin.y = v30;
    v52.size.width = v40;
    v52.size.height = v24;
    MaxY = CGRectGetMaxY(v52);
    -[UILabel setFrame:](self->_overlayLabel, "setFrame:", CalRoundRectToScreenScale(v37, MaxY + -3.5, v34, v35));
    v39 = v40;
  }
  else
  {
    v39 = v26;
  }
  -[UILabel setFrame:](self->_dayLabel, "setFrame:", CalRoundRectToScreenScale(v22, v30, v39, v24));

}

- (id)backgroundColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

- (void)drawRect:(CGRect)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  CGContext *CurrentContext;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL8 v18;
  CGFloat v19;
  id v20;
  CGRect v21;
  CGRect v22;

  if (-[CompactMonthWeekTodayCircle drawCircle](self, "drawCircle", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    v4 = -[CompactMonthWeekTodayCircle useTodayColors](self, "useTodayColors");
    if (v4)
    {
      v6 = CalendarAppTintColor(v4, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekTodayCircle nonTodayCircleColor](self, "nonTodayCircleColor"));
    }
    v8 = v7;
    objc_msgSend(v7, "setFill");

    CurrentContext = UIGraphicsGetCurrentContext();
    -[CompactMonthWeekTodayCircle bounds](self, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = -[CompactMonthWeekTodayCircle usesRoundedRectInsteadOfCircle](self, "usesRoundedRectInsteadOfCircle");
    if (v18)
    {
      v20 = (id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v11, v13, v15, v17, EKUILargeTextRoundedRectCornerRadius));
      objc_msgSend(v20, "fill");

    }
    else
    {
      v19 = 1.0 / EKUIScaleFactor(v18);
      v21.origin.x = v11;
      v21.origin.y = v13;
      v21.size.width = v15;
      v21.size.height = v17;
      v22 = CGRectInset(v21, v19, v19);
      CGContextFillEllipseInRect(CurrentContext, v22);
    }
  }
}

- (BOOL)compressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (BOOL)drawCircle
{
  return self->_drawCircle;
}

- (BOOL)useTodayColors
{
  return self->_useTodayColors;
}

- (BOOL)showOverlay
{
  return self->_showOverlay;
}

- (UIColor)nonTodayColor
{
  return self->_nonTodayColor;
}

- (UIColor)nonTodayCircleColor
{
  return self->_nonTodayCircleColor;
}

- (void)setNonTodayCircleColor:(id)a3
{
  objc_storeStrong((id *)&self->_nonTodayCircleColor, a3);
}

- (UIFont)fontOverride
{
  return self->_fontOverride;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (double)overlayFontSize
{
  return self->_overlayFontSize;
}

- (BOOL)usesRoundedRectInsteadOfCircle
{
  return self->_usesRoundedRectInsteadOfCircle;
}

- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3
{
  self->_usesRoundedRectInsteadOfCircle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontOverride, 0);
  objc_storeStrong((id *)&self->_nonTodayCircleColor, 0);
  objc_storeStrong((id *)&self->_nonTodayColor, 0);
  objc_storeStrong((id *)&self->_overlayLabel, 0);
  objc_storeStrong((id *)&self->_dayLabel, 0);
  objc_storeStrong((id *)&self->_dayString, 0);
  objc_storeStrong((id *)&self->_calendarDate, 0);
}

@end
