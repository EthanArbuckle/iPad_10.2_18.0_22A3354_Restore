@implementation TappableDayNumber

- (id)_pressColor
{
  uint64_t v2;
  void *v3;
  void *v4;

  if (self->_isToday)
  {
    v2 = CalendarAppTintColor(self, a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorWithAlphaComponent:", 0.1));

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.1));
  }
  return v4;
}

- (void)_loadCircleIfNeeded
{
  DayCircleView *v3;
  DayCircleView *circle;
  double v5;
  void *v6;
  void *pressCircle;

  if (!self->_circle)
  {
    v3 = objc_opt_new(DayCircleView);
    circle = self->_circle;
    self->_circle = v3;

    v5 = 1.0;
    if (!self->_circled)
      v5 = 0.0;
    -[DayCircleView setAlpha:](self->_circle, "setAlpha:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TappableDayNumber _backgroundColor](self, "_backgroundColor"));
    -[DayCircleView setBackgroundColor:](self->_circle, "setBackgroundColor:", v6);

    -[DayCircleView setUsesRoundedRectInsteadOfCircle:](self->_circle, "setUsesRoundedRectInsteadOfCircle:", -[TappableDayNumber usesRoundedRectInsteadOfCircle](self, "usesRoundedRectInsteadOfCircle"));
    -[TappableDayNumber _updateCircleColor](self, "_updateCircleColor");
    pressCircle = self->_pressCircle;
    if (!pressCircle)
      pressCircle = self->_number;
    -[TappableDayNumber insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_circle, pressCircle);
    -[TappableDayNumber _loadCircledNumberIfNeeded](self, "_loadCircledNumberIfNeeded");
    -[TappableDayNumber _loadCircledOverlayIfNeeded](self, "_loadCircledOverlayIfNeeded");
  }
}

- (void)_updateSubviewAlpha
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = 0.0;
  if (self->_circled)
    v4 = 0.0;
  else
    v4 = 1.0;
  -[UILabel setAlpha:](self->_number, "setAlpha:", v4);
  if (self->_circled)
    v5 = 0.0;
  else
    v5 = 1.0;
  -[UILabel setAlpha:](self->_overlay, "setAlpha:", v5);
  if (self->_circled)
    v6 = 0.0;
  else
    v6 = 1.0;
  -[UIView setAlpha:](self->_underline, "setAlpha:", v6);
  if (self->_circled)
    v7 = 1.0;
  else
    v7 = 0.0;
  -[DayCircleView setAlpha:](self->_circle, "setAlpha:", v7);
  if (self->_circled)
    v8 = 1.0;
  else
    v8 = 0.0;
  -[UILabel setAlpha:](self->_numberCircled, "setAlpha:", v8);
  if (self->_circled)
    v9 = 1.0;
  else
    v9 = 0.0;
  -[UILabel setAlpha:](self->_overlayCircled, "setAlpha:", v9);
  if (!self->_circled)
  {
    if (self->_pressed)
      v3 = 1.0;
    else
      v3 = 0.0;
  }
  -[DayCircleView setAlpha:](self->_pressCircle, "setAlpha:", v3);
}

- (void)_loadCircledNumberIfNeeded
{
  id v3;
  UILabel *v4;
  UILabel *numberCircled;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;

  if (!self->_numberCircled)
  {
    v3 = objc_alloc((Class)UILabel);
    -[UILabel frame](self->_number, "frame");
    v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:");
    numberCircled = self->_numberCircled;
    self->_numberCircled = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TappableDayNumber _circledFont](self, "_circledFont"));
    -[UILabel setFont:](self->_numberCircled, "setFont:", v6);

    -[UILabel setTextAlignment:](self->_numberCircled, "setTextAlignment:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_numberCircled, "setBackgroundColor:", v7);

    if (self->_isToday)
    {
      v8 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    }
    else
    {
      v9 = CalendarAppCircleTextColor();
      v8 = objc_claimAutoreleasedReturnValue(v9);
    }
    v10 = (void *)v8;
    -[UILabel setTextColor:](self->_numberCircled, "setTextColor:", v8);

    v11 = 1.0;
    if (!self->_circled && !self->_pressed)
      v11 = 0.0;
    -[UILabel setAlpha:](self->_numberCircled, "setAlpha:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_number, "text"));
    -[UILabel setText:](self->_numberCircled, "setText:", v12);

    -[TappableDayNumber addSubview:](self, "addSubview:", self->_numberCircled);
  }
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TappableDayNumber;
  -[TappableDayNumber tintColorDidChange](&v3, "tintColorDidChange");
  -[TappableDayNumber _updateCircleColor](self, "_updateCircleColor");
}

- (void)_updateCircleColor
{
  int *v2;

  if (self->_isToday)
    v2 = &OBJC_IVAR___TappableDayNumber__todayCircleColor;
  else
    v2 = &OBJC_IVAR___TappableDayNumber__defaultCircleColor;
  -[DayCircleView setColor:](self->_circle, "setColor:", *(Class *)((char *)&self->super.super.super.super.isa + *v2));
}

- (void)setNeedsDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TappableDayNumber;
  -[TappableDayNumber setNeedsDisplay](&v3, "setNeedsDisplay");
  -[DayCircleView setNeedsDisplay](self->_circle, "setNeedsDisplay");
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TappableDayNumber;
  v4 = a3;
  -[TappableDayNumber setBackgroundColor:](&v5, "setBackgroundColor:", v4);
  -[DayCircleView setBackgroundColor:](self->_circle, "setBackgroundColor:", v4, v5.receiver, v5.super_class);
  -[DayCircleView setBackgroundColor:](self->_pressCircle, "setBackgroundColor:", v4);

}

- (void)setUnderlineThickness:(double)a3
{
  UIView *underline;

  if (self->_underlineThickness != a3)
  {
    self->_underlineThickness = a3;
    if (a3 <= 0.0)
    {
      -[UIView removeFromSuperview](self->_underline, "removeFromSuperview");
      underline = self->_underline;
      self->_underline = 0;

    }
    else
    {
      -[TappableDayNumber _loadUnderlineIfNeeded](self, "_loadUnderlineIfNeeded");
      -[TappableDayNumber _updateSubviewAlpha](self, "_updateSubviewAlpha");
      -[TappableDayNumber setNeedsLayout](self, "setNeedsLayout");
      self->_needsToForceLayout = 1;
    }
    -[TappableDayNumber setNeedsLayout](self, "setNeedsLayout");
    self->_needsToForceLayout = 1;
  }
}

- (void)setText:(id)a3
{
  UILabel *number;
  id v5;

  number = self->_number;
  v5 = a3;
  -[UILabel setText:](number, "setText:", v5);
  -[UILabel setText:](self->_numberCircled, "setText:", v5);

  -[TappableDayNumber setNeedsLayout](self, "setNeedsLayout");
  self->_needsToForceLayout = 1;
}

- (void)setIsToday:(BOOL)a3
{
  void *v4;

  if (self->_isToday != a3)
  {
    self->_isToday = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TappableDayNumber _pressColor](self, "_pressColor"));
    -[DayCircleView setColor:](self->_pressCircle, "setColor:", v4);

    -[TappableDayNumber _updateCircleColor](self, "_updateCircleColor");
    -[TappableDayNumber _updateTextColor](self, "_updateTextColor");
  }
}

- (TappableDayNumber)initWithSizeClass:(int64_t)a3
{
  TappableDayNumber *v4;
  uint64_t v5;
  TappableDayNumber *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  UIColor *todayCircleColor;
  uint64_t v11;
  uint64_t v12;
  UIColor *defaultCircleColor;
  uint64_t v14;
  uint64_t v15;
  UIColor *circledDefaultDayNumberColor;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TappableDayNumber;
  v4 = -[TappableDayNumber initWithFrame:](&v18, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v4;
  if (v4)
  {
    v7 = 18.0;
    if (a3 == 2)
      v7 = 17.0;
    v4->_fontSize = v7;
    v4->_overlayFontSize = 10.0;
    v8 = CalendarAppTintColor(v4, v5);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    todayCircleColor = v6->_todayCircleColor;
    v6->_todayCircleColor = (UIColor *)v9;

    v11 = CalendarAppCircleNonTodayBGColor();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    defaultCircleColor = v6->_defaultCircleColor;
    v6->_defaultCircleColor = (UIColor *)v12;

    v14 = CalendarAppCircleTextColor();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    circledDefaultDayNumberColor = v6->_circledDefaultDayNumberColor;
    v6->_circledDefaultDayNumberColor = (UIColor *)v15;

    -[TappableDayNumber _createSubviews](v6, "_createSubviews");
  }
  return v6;
}

- (void)setIsWeekend:(BOOL)a3
{
  if (self->_isWeekend != a3)
  {
    self->_isWeekend = a3;
    -[TappableDayNumber _updateTextColor](self, "_updateTextColor");
  }
}

- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_usesRoundedRectInsteadOfCircle != a3)
  {
    v3 = a3;
    self->_usesRoundedRectInsteadOfCircle = a3;
    -[DayCircleView setUsesRoundedRectInsteadOfCircle:](self->_circle, "setUsesRoundedRectInsteadOfCircle:");
    -[DayCircleView setUsesRoundedRectInsteadOfCircle:](self->_pressCircle, "setUsesRoundedRectInsteadOfCircle:", v3);
  }
}

- (void)setOverlayFontSize:(double)a3
{
  void *v4;
  id v5;

  if (vabdd_f64(self->_overlayFontSize, a3) >= 2.22044605e-16)
  {
    self->_overlayFontSize = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TappableDayNumber _overlayFont](self, "_overlayFont"));
    -[UILabel setFont:](self->_overlay, "setFont:", v4);

    v5 = (id)objc_claimAutoreleasedReturnValue(-[TappableDayNumber _circledOverlayFont](self, "_circledOverlayFont"));
    -[UILabel setFont:](self->_overlayCircled, "setFont:", v5);

  }
}

- (void)setFontSize:(double)a3
{
  void *v4;
  id v5;

  if (vabdd_f64(self->_fontSize, a3) >= 2.22044605e-16)
  {
    self->_fontSize = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TappableDayNumber _normalFont](self, "_normalFont"));
    -[UILabel setFont:](self->_number, "setFont:", v4);

    v5 = (id)objc_claimAutoreleasedReturnValue(-[TappableDayNumber _circledFont](self, "_circledFont"));
    -[UILabel setFont:](self->_numberCircled, "setFont:", v5);

  }
}

+ (id)overlayFontForSize:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (qword_1001F6198 != -1)
    dispatch_once(&qword_1001F6198, &stru_1001B3278);
  v4 = (void *)qword_1001F6190;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleBody, 0, 3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v7, a3));
    v8 = (void *)qword_1001F6190;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v9);

  }
  return v6;
}

+ (id)normalFontForSize:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (qword_1001F6188 != -1)
    dispatch_once(&qword_1001F6188, &stru_1001B3258);
  v4 = (void *)qword_1001F6180;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleBody, 0, 3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v7, a3));
    v8 = (void *)qword_1001F6180;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v9);

  }
  return v6;
}

- (BOOL)usesRoundedRectInsteadOfCircle
{
  return self->_usesRoundedRectInsteadOfCircle;
}

- (void)_createSubviews
{
  UILabel *v3;
  UILabel *number;
  void *v5;
  void *v6;
  void *v7;

  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  number = self->_number;
  self->_number = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TappableDayNumber _normalFont](self, "_normalFont"));
  -[UILabel setFont:](self->_number, "setFont:", v5);

  -[UILabel setTextAlignment:](self->_number, "setTextAlignment:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_number, "setTextColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](self->_number, "setBackgroundColor:", v7);

  -[TappableDayNumber addSubview:](self, "addSubview:", self->_number);
}

- (id)_normalFont
{
  void *v3;

  v3 = (void *)objc_opt_class(self);
  -[TappableDayNumber fontSize](self, "fontSize");
  return objc_msgSend(v3, "normalFontForSize:");
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)_updateTextColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TappableDayNumber _textColor](self, "_textColor"));
  -[UILabel setTextColor:](self->_number, "setTextColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TappableDayNumber _textColor](self, "_textColor"));
  -[UILabel setTextColor:](self->_overlay, "setTextColor:", v4);

  if (self->_isToday)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](self->_numberCircled, "setTextColor:", v5);

    v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](self->_overlayCircled, "setTextColor:", v6);

  }
  else
  {
    -[UILabel setTextColor:](self->_numberCircled, "setTextColor:", self->_circledDefaultDayNumberColor);
    -[UILabel setTextColor:](self->_overlayCircled, "setTextColor:", self->_circledDefaultDayNumberColor);
  }
}

- (id)_textColor
{
  uint64_t v2;
  UIColor *v3;
  UIColor *weekendColor;
  uint64_t v6;

  if (self->_isToday)
  {
    v2 = CalendarAppTintColor(self, a2);
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue(v2);
  }
  else if (self->_isWeekend)
  {
    weekendColor = self->_weekendColor;
    if (weekendColor)
    {
      v3 = weekendColor;
    }
    else
    {
      v6 = WeekendTextColor();
      v3 = (UIColor *)objc_claimAutoreleasedReturnValue(v6);
    }
  }
  else
  {
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  }
  return v3;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  CGFloat v14;
  uint64_t v15;
  uint64_t v16;
  CGFloat v17;
  double v18;
  id v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  uint64_t v28;
  uint64_t v29;
  CGFloat v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  CGFloat MaxY;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  _BOOL8 v47;
  uint64_t v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  double MinY;
  double v68;
  double v69;
  id v70;
  double v71;
  uint64_t v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  CGFloat v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  CGFloat v82;
  uint64_t v83;
  uint64_t v84;
  CGFloat v85;
  double v86;
  double v87;
  CGFloat v88;
  double v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  CGRect recta;
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

  self->_needsToForceLayout = 0;
  *(_QWORD *)&recta.origin.y = self;
  *(_QWORD *)&recta.size.width = TappableDayNumber;
  -[CGFloat layoutSubviews]((objc_super *)&recta.origin.y, "layoutSubviews");
  -[TappableDayNumber bounds](self, "bounds");
  x = v95.origin.x;
  y = v95.origin.y;
  width = v95.size.width;
  height = v95.size.height;
  MidX = CGRectGetMidX(v95);
  v96.origin.x = x;
  v88 = y;
  v96.origin.y = y;
  v90 = width;
  v91 = height;
  v96.size.width = width;
  v96.size.height = height;
  MidY = CGRectGetMidY(v96);
  v9 = CGRectNull.origin.y;
  -[TappableDayNumber _cachedSizeForLabel:](self, "_cachedSizeForLabel:", self->_number);
  v11 = v10;
  v13 = v12;
  v97.origin.x = CGRectNull.origin.x;
  v97.origin.y = v9;
  v97.size.width = v11;
  v97.size.height = v13;
  v14 = CGRectGetWidth(v97);
  v98.origin.x = CalRoundToScreenScale(v15, v16, MidX - v14 * 0.5);
  v17 = v98.origin.x;
  v98.origin.y = v9;
  v92 = v11;
  v98.size.width = v11;
  v98.size.height = v13;
  v89 = MidY;
  v18 = MidY - CGRectGetHeight(v98) * 0.5;
  v19 = objc_msgSend((id)objc_opt_class(self), "_yOffsetForNumber");
  v22 = CalRoundToScreenScale(v19, v21, v18 + v20);
  v93 = v9;
  if (self->_overlay)
  {
    v86 = x;
    -[TappableDayNumber _cachedSizeForLabel:](self, "_cachedSizeForLabel:");
    v24 = v23;
    v26 = v25;
    v99.origin.x = CGRectNull.origin.x;
    v99.origin.y = v9;
    v99.size.width = v24;
    v99.size.height = v26;
    v27 = CGRectGetHeight(v99);
    v22 = v22 - CalRoundToScreenScale(v28, v29, (v27 + -2.0) * 0.5 + 1.0);
    v100.origin.x = CGRectNull.origin.x;
    v100.origin.y = v9;
    v100.size.width = v24;
    v100.size.height = v26;
    v30 = CGRectGetWidth(v100);
    v87 = MidX;
    v33 = CalRoundToScreenScale(v31, v32, MidX - v30 * 0.5);
    v85 = v17;
    v101.origin.x = v17;
    v101.origin.y = v22;
    v101.size.width = v92;
    v101.size.height = v13;
    MaxY = CGRectGetMaxY(v101);
    -[UILabel setFrame:](self->_overlay, "setFrame:", v33, CalRoundToScreenScale(v35, v36, MaxY + -2.0), v24, v26);
    v37 = v92;
    if (self->_underline)
    {
      -[UILabel frame](self->_overlay, "frame");
      v38 = v102.origin.x;
      v39 = v102.size.width;
      v40 = CGRectGetMaxY(v102);
      v43 = CalRoundToScreenScale(v41, v42, v40 + 1.5);
      -[UIView setFrame:](self->_underline, "setFrame:", v38, v43, v39, CalRoundToScreenScale(v44, v45, self->_underlineThickness));
    }
    x = v86;
    MidX = v87;
    v46 = v85;
  }
  else
  {
    v37 = v92;
    v46 = v17;
  }
  -[UILabel setFrame:](self->_number, "setFrame:", v46, v22, v37, v13, *(_QWORD *)&v85);
  if (self->_circled)
  {
    v47 = -[TappableDayNumber usesRoundedRectInsteadOfCircle](self, "usesRoundedRectInsteadOfCircle");
    if (v47)
    {
      v49 = v93;
      v51 = v90;
      v50 = v91;
    }
    else
    {
      v103.origin.x = x;
      v103.origin.y = v88;
      v103.size.width = v90;
      v103.size.height = v91;
      v52 = CGRectGetWidth(v103);
      v104.origin.x = x;
      v104.origin.y = v88;
      v104.size.width = v90;
      v104.size.height = v91;
      v50 = fmin(v52, CGRectGetHeight(v104));
      v51 = v50;
      v49 = v93;
    }
    v53 = CalRoundToScreenScale(v47, v48, MidX - v51 * 0.5);
    -[DayCircleView setFrame:](self->_circle, "setFrame:", v53, CalRoundToScreenScale(v54, v55, v89 - v50 * 0.5), v51, v50);
    -[UILabel sizeToFit](self->_number, "sizeToFit");
    -[UILabel sizeToFit](self->_numberCircled, "sizeToFit");
    -[TappableDayNumber _cachedSizeForLabel:](self, "_cachedSizeForLabel:", self->_numberCircled);
    v57 = v56;
    v59 = v58;
    v105.origin.x = CGRectNull.origin.x;
    v105.origin.y = v49;
    v105.size.width = v57;
    v105.size.height = v59;
    v60 = MidX - CGRectGetWidth(v105) * 0.5;
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_numberCircled, "text"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_numberCircled, "font"));
    v63 = CalOffsetToCenterNumberWithFont(v61, v62);
    v66 = CalRoundToScreenScale(v64, v65, v60 + v63 + 0.0);

    -[UILabel frame](self->_number, "frame");
    MinY = CGRectGetMinY(v106);
    -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_number, "_firstLineBaselineOffsetFromBoundsTop");
    v69 = MinY + v68;
    v70 = -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_numberCircled, "_firstLineBaselineOffsetFromBoundsTop");
    v73 = CalRoundToScreenScale(v70, v72, v69 - v71);
    -[UILabel setFrame:](self->_numberCircled, "setFrame:", v66, v73, v57, v59);
    if (self->_overlayCircled)
    {
      -[TappableDayNumber _cachedSizeForLabel:](self, "_cachedSizeForLabel:");
      v75 = v74;
      v77 = v76;
      v107.origin.y = v93;
      v107.origin.x = CGRectNull.origin.x;
      v107.size.width = v75;
      v107.size.height = v77;
      v78 = CGRectGetWidth(v107);
      v81 = CalRoundToScreenScale(v79, v80, MidX + v78 * -0.5);
      v108.origin.x = v66;
      v108.origin.y = v73;
      v108.size.width = v57;
      v108.size.height = v59;
      v82 = CGRectGetMaxY(v108);
      -[UILabel setFrame:](self->_overlayCircled, "setFrame:", v81, CalRoundToScreenScale(v83, v84, v82 + -3.0), v75, v77);
    }
  }
}

- (CGSize)_cachedSizeForLabel:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  NSValue *v15;
  double v16;
  CGFloat width;
  double v18;
  CGFloat height;
  double v20;
  double v21;
  CGSize result;

  v3 = a3;
  if (qword_1001F6178 != -1)
    dispatch_once(&qword_1001F6178, &stru_1001B3238);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "font"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v6 = (void *)v5;
  if (v4 && v5)
  {
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001F6170, "objectForKey:", v4));
    if (!v7)
    {
      v7 = objc_opt_new(NSMutableDictionary);
      objc_msgSend((id)qword_1001F6170, "setObject:forKey:", v7, v4);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v6));
    if (!v8)
    {
      v9 = objc_msgSend(v3, "intrinsicContentSize");
      v11 = v10;
      v13 = CalCeilToScreenScale(v9, v12);
      v15 = +[NSValue valueWithSize:](NSValue, "valueWithSize:", v13, CalCeilToScreenScale(v14, v11));
      v8 = (void *)objc_claimAutoreleasedReturnValue(v15);
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v8, v6);
    }
    objc_msgSend(v8, "sizeValue");
    width = v16;
    height = v18;

  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }

  v20 = width;
  v21 = height;
  result.height = v21;
  result.width = v20;
  return result;
}

+ (double)_yOffsetForNumber
{
  return -1.0 / EKUIScaleFactor(a1, a2);
}

- (void)setCircled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD v7[5];

  if (self->_circled != a3)
  {
    v4 = a4;
    if (a3)
      -[TappableDayNumber _loadCircleIfNeeded](self, "_loadCircleIfNeeded");
    self->_circled = a3;
    if (v4)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10005F100;
      v7[3] = &unk_1001B2538;
      v7[4] = self;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327680, v7, 0, 0.2, 0.0);
    }
    else
    {
      -[TappableDayNumber _updateSubviewAlpha](self, "_updateSubviewAlpha");
    }
    -[DayCircleView setNeedsDisplay](self->_circle, "setNeedsDisplay");
    -[TappableDayNumber setNeedsLayout](self, "setNeedsLayout");
    self->_needsToForceLayout = 1;
  }
}

- (void)_loadCircledOverlayIfNeeded
{
  id v3;
  UILabel *v4;
  UILabel *overlayCircled;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;

  if (!self->_overlayCircled && self->_overlay)
  {
    v3 = objc_alloc((Class)UILabel);
    -[UILabel frame](self->_overlay, "frame");
    v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:");
    overlayCircled = self->_overlayCircled;
    self->_overlayCircled = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TappableDayNumber _circledOverlayFont](self, "_circledOverlayFont"));
    -[UILabel setFont:](self->_overlayCircled, "setFont:", v6);

    -[UILabel setTextAlignment:](self->_overlayCircled, "setTextAlignment:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_overlayCircled, "setBackgroundColor:", v7);

    if (self->_isToday)
    {
      v8 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    }
    else
    {
      v9 = CalendarAppCircleTextColor();
      v8 = objc_claimAutoreleasedReturnValue(v9);
    }
    v10 = (void *)v8;
    -[UILabel setTextColor:](self->_overlayCircled, "setTextColor:", v8);

    v11 = 1.0;
    if (!self->_circled && !self->_pressed)
      v11 = 0.0;
    -[UILabel setAlpha:](self->_overlayCircled, "setAlpha:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_overlay, "text"));
    -[UILabel setText:](self->_overlayCircled, "setText:", v12);

    -[TappableDayNumber addSubview:](self, "addSubview:", self->_overlayCircled);
  }
}

- (id)_circledFont
{
  void *v3;

  v3 = (void *)objc_opt_class(self);
  -[TappableDayNumber fontSize](self, "fontSize");
  return objc_msgSend(v3, "circledFontForSize:");
}

+ (id)circledFontForSize:(double)a3
{
  return +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", a3);
}

- (UIColor)circledDefaultDayNumberColor
{
  return self->_circledDefaultDayNumberColor;
}

- (void)setCircledDefaultDayNumberColor:(id)a3
{
  objc_storeStrong((id *)&self->_circledDefaultDayNumberColor, a3);
  -[TappableDayNumber _updateTextColor](self, "_updateTextColor");
}

- (UIColor)todayCircleColor
{
  return self->_todayCircleColor;
}

- (void)setTodayCircleColor:(id)a3
{
  objc_storeStrong((id *)&self->_todayCircleColor, a3);
  -[TappableDayNumber _updateCircleColor](self, "_updateCircleColor");
}

- (UIColor)defaultCircleColor
{
  return self->_defaultCircleColor;
}

- (void)setDefaultCircleColor:(id)a3
{
  objc_storeStrong((id *)&self->_defaultCircleColor, a3);
  -[TappableDayNumber _updateCircleColor](self, "_updateCircleColor");
}

- (void)_forceLayoutIfNeeded
{
  if (self->_needsToForceLayout)
    -[TappableDayNumber layoutSubviews](self, "layoutSubviews");
  else
    -[TappableDayNumber layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)_loadPressIfNeeded
{
  DayCircleView *v3;
  DayCircleView *v4;
  DayCircleView *pressCircle;
  void *v6;
  void *v7;
  double v8;

  if (!self->_pressCircle)
  {
    v3 = [DayCircleView alloc];
    -[TappableDayNumber bounds](self, "bounds");
    v4 = -[DayCircleView initWithFrame:](v3, "initWithFrame:");
    pressCircle = self->_pressCircle;
    self->_pressCircle = v4;

    -[DayCircleView setAutoresizingMask:](self->_pressCircle, "setAutoresizingMask:", 18);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TappableDayNumber _pressColor](self, "_pressColor"));
    -[DayCircleView setColor:](self->_pressCircle, "setColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TappableDayNumber backgroundColor](self, "backgroundColor"));
    -[DayCircleView setBackgroundColor:](self->_pressCircle, "setBackgroundColor:", v7);

    v8 = 1.0;
    if (!self->_pressed)
      v8 = 0.0;
    -[DayCircleView setAlpha:](self->_pressCircle, "setAlpha:", v8);
    -[DayCircleView setUsesRoundedRectInsteadOfCircle:](self->_pressCircle, "setUsesRoundedRectInsteadOfCircle:", -[TappableDayNumber usesRoundedRectInsteadOfCircle](self, "usesRoundedRectInsteadOfCircle"));
    -[TappableDayNumber insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_pressCircle, self->_number);
    -[TappableDayNumber _loadCircledNumberIfNeeded](self, "_loadCircledNumberIfNeeded");
  }
}

- (void)_loadOverlayIfNeeded
{
  UILabel *v3;
  UILabel *overlay;
  void *v5;
  void *v6;
  void *v7;

  if (!self->_overlay)
  {
    v3 = (UILabel *)objc_alloc_init((Class)UILabel);
    overlay = self->_overlay;
    self->_overlay = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TappableDayNumber _overlayFont](self, "_overlayFont"));
    -[UILabel setFont:](self->_overlay, "setFont:", v5);

    -[UILabel setTextAlignment:](self->_overlay, "setTextAlignment:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](self->_overlay, "setTextColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_overlay, "setBackgroundColor:", v7);

    -[TappableDayNumber addSubview:](self, "addSubview:", self->_overlay);
  }
}

- (void)_loadUnderlineIfNeeded
{
  UIView *v3;
  UIView *underline;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (!self->_underline)
  {
    v3 = objc_opt_new(UIView);
    underline = self->_underline;
    self->_underline = v3;

    v7 = CalendarAppTintColor(v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[UIView setBackgroundColor:](self->_underline, "setBackgroundColor:", v8);

    -[TappableDayNumber addSubview:](self, "addSubview:", self->_underline);
  }
}

- (NSString)text
{
  return -[UILabel text](self->_number, "text");
}

- (void)setOverlayText:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  UILabel *overlayCircled;
  UILabel *overlay;
  id v10;

  v10 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_overlay, "text"));
  if (v4 == v10)
  {

LABEL_10:
    v7 = v10;
    goto LABEL_11;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_overlay, "text"));
  v6 = objc_msgSend(v10, "isEqualToString:", v5);

  v7 = v10;
  if ((v6 & 1) == 0)
  {
    if (v10)
    {
      -[TappableDayNumber _loadOverlayIfNeeded](self, "_loadOverlayIfNeeded");
      if (self->_circled)
        -[TappableDayNumber _loadCircledOverlayIfNeeded](self, "_loadCircledOverlayIfNeeded");
      -[UILabel setText:](self->_overlay, "setText:", v10);
      -[UILabel setText:](self->_overlayCircled, "setText:", v10);
      -[TappableDayNumber _updateTextColor](self, "_updateTextColor");
    }
    else
    {
      -[UILabel removeFromSuperview](self->_overlayCircled, "removeFromSuperview");
      overlayCircled = self->_overlayCircled;
      self->_overlayCircled = 0;

      -[UILabel removeFromSuperview](self->_overlay, "removeFromSuperview");
      overlay = self->_overlay;
      self->_overlay = 0;

    }
    -[TappableDayNumber setNeedsLayout](self, "setNeedsLayout");
    self->_needsToForceLayout = 1;
    goto LABEL_10;
  }
LABEL_11:

}

- (NSString)overlayText
{
  return -[UILabel text](self->_overlay, "text");
}

- (void)setWeekendColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_weekendColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_weekendColor, a3);
    -[TappableDayNumber _updateTextColor](self, "_updateTextColor");
  }

}

- (void)setCircled:(BOOL)a3
{
  -[TappableDayNumber setCircled:animated:](self, "setCircled:animated:", a3, 1);
}

- (void)setPressed:(BOOL)a3
{
  -[TappableDayNumber setPressed:animated:](self, "setPressed:animated:", a3, 1);
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v6[5];

  if (self->_pressed != a3)
  {
    if (a3)
    {
      -[TappableDayNumber _loadPressIfNeeded](self, "_loadPressIfNeeded", a3, a4);
      self->_pressed = a3;
    }
    else
    {
      self->_pressed = 0;
      if (a4)
      {
        v6[0] = _NSConcreteStackBlock;
        v6[1] = 3221225472;
        v6[2] = sub_10005F1E4;
        v6[3] = &unk_1001B2538;
        v6[4] = self;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327680, v6, 0, 0.5, 0.0);
LABEL_7:
        -[TappableDayNumber setNeedsLayout](self, "setNeedsLayout");
        self->_needsToForceLayout = 1;
        return;
      }
    }
    -[TappableDayNumber _updateSubviewAlpha](self, "_updateSubviewAlpha");
    goto LABEL_7;
  }
}

- (CGRect)contentFrame
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat x;
  double v9;
  CGFloat y;
  double v11;
  CGFloat width;
  double v13;
  CGFloat height;
  UILabel *overlay;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  UIView *underline;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;
  CGRect v33;
  CGRect v34;

  -[TappableDayNumber _forceLayoutIfNeeded](self, "_forceLayoutIfNeeded");
  if (self->_circled)
  {
    -[DayCircleView frame](self->_circle, "frame");
LABEL_7:
    x = v3;
    y = v4;
    width = v5;
    height = v6;
    goto LABEL_8;
  }
  -[UILabel frame](self->_number, "frame");
  x = v7;
  y = v9;
  width = v11;
  height = v13;
  overlay = self->_overlay;
  if (overlay)
  {
    -[UILabel frame](overlay, "frame");
    v33.origin.x = v16;
    v33.origin.y = v17;
    v33.size.width = v18;
    v33.size.height = v19;
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v30 = CGRectUnion(v29, v33);
    x = v30.origin.x;
    y = v30.origin.y;
    width = v30.size.width;
    height = v30.size.height;
  }
  underline = self->_underline;
  if (underline)
  {
    -[UIView frame](underline, "frame");
    v34.origin.x = v21;
    v34.origin.y = v22;
    v34.size.width = v23;
    v34.size.height = v24;
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    *(CGRect *)&v3 = CGRectUnion(v31, v34);
    goto LABEL_7;
  }
LABEL_8:
  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)numberFrame
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat x;
  double v9;
  CGFloat y;
  double v11;
  CGFloat width;
  double v13;
  CGFloat height;
  UILabel *overlay;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  UIView *underline;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;
  CGRect v33;
  CGRect v34;

  -[TappableDayNumber _forceLayoutIfNeeded](self, "_forceLayoutIfNeeded");
  if (self->_circled)
  {
    -[UILabel frame](self->_numberCircled, "frame");
LABEL_7:
    x = v3;
    y = v4;
    width = v5;
    height = v6;
    goto LABEL_8;
  }
  -[UILabel frame](self->_number, "frame");
  x = v7;
  y = v9;
  width = v11;
  height = v13;
  overlay = self->_overlay;
  if (overlay)
  {
    -[UILabel frame](overlay, "frame");
    v33.origin.x = v16;
    v33.origin.y = v17;
    v33.size.width = v18;
    v33.size.height = v19;
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v30 = CGRectUnion(v29, v33);
    x = v30.origin.x;
    y = v30.origin.y;
    width = v30.size.width;
    height = v30.size.height;
  }
  underline = self->_underline;
  if (underline)
  {
    -[UIView frame](underline, "frame");
    v34.origin.x = v21;
    v34.origin.y = v22;
    v34.size.width = v23;
    v34.size.height = v24;
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    *(CGRect *)&v3 = CGRectUnion(v31, v34);
    goto LABEL_7;
  }
LABEL_8:
  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)primaryNumberFrame
{
  int *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[TappableDayNumber _forceLayoutIfNeeded](self, "_forceLayoutIfNeeded");
  if (self->_circled)
    v3 = &OBJC_IVAR___TappableDayNumber__numberCircled;
  else
    v3 = &OBJC_IVAR___TappableDayNumber__number;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v3), "frame");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (double)firstLineBaselineOffsetFromBoundsTop
{
  void *v3;
  double MinY;
  double v5;
  double v6;
  CGRect v8;
  CGRect v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_number, "text"));

  if (!v3)
    return 0.0;
  -[TappableDayNumber _forceLayoutIfNeeded](self, "_forceLayoutIfNeeded");
  -[UILabel frame](self->_number, "frame");
  MinY = CGRectGetMinY(v8);
  -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_number, "_firstLineBaselineOffsetFromBoundsTop");
  v6 = MinY + v5;
  -[TappableDayNumber bounds](self, "bounds");
  return v6 - CGRectGetMinY(v9);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UILabel sizeThatFits:](self->_number, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UILabel)titleLabel
{
  unsigned int v3;
  int *v4;

  v3 = -[TappableDayNumber circled](self, "circled");
  v4 = &OBJC_IVAR___TappableDayNumber__number;
  if (v3)
    v4 = &OBJC_IVAR___TappableDayNumber__numberCircled;
  return (UILabel *)*(id *)((char *)&self->super.super.super.super.isa + *v4);
}

- (id)_overlayFont
{
  void *v3;

  v3 = (void *)objc_opt_class(self);
  -[TappableDayNumber overlayFontSize](self, "overlayFontSize");
  return objc_msgSend(v3, "overlayFontForSize:");
}

+ (double)firstLineBaselineOffsetForFontSize:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;

  if (qword_1001F61A8 != -1)
    dispatch_once(&qword_1001F61A8, &stru_1001B3298);
  if (vabdd_f64(*(double *)&qword_1001F61B0, a3) >= 2.22044605e-16)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "normalFontForSize:", a3));
    objc_msgSend((id)qword_1001F61A0, "setFont:", v5);

    qword_1001F61B0 = *(_QWORD *)&a3;
    objc_msgSend((id)qword_1001F61A0, "sizeToFit");
  }
  objc_msgSend(a1, "_yOffsetForNumber");
  v7 = v6;
  objc_msgSend((id)qword_1001F61A0, "_firstLineBaselineOffsetFromBoundsTop");
  return v7 + v8;
}

- (double)underlineThickness
{
  return self->_underlineThickness;
}

- (UIColor)weekendColor
{
  return self->_weekendColor;
}

- (BOOL)isToday
{
  return self->_isToday;
}

- (BOOL)isWeekend
{
  return self->_isWeekend;
}

- (BOOL)circled
{
  return self->_circled;
}

- (BOOL)pressed
{
  return self->_pressed;
}

- (double)circleDiameter
{
  return self->_circleDiameter;
}

- (void)setCircleDiameter:(double)a3
{
  self->_circleDiameter = a3;
}

- (double)overlayFontSize
{
  return self->_overlayFontSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekendColor, 0);
  objc_storeStrong((id *)&self->_circledDefaultDayNumberColor, 0);
  objc_storeStrong((id *)&self->_defaultCircleColor, 0);
  objc_storeStrong((id *)&self->_todayCircleColor, 0);
  objc_storeStrong((id *)&self->_underline, 0);
  objc_storeStrong((id *)&self->_pressCircle, 0);
  objc_storeStrong((id *)&self->_circle, 0);
  objc_storeStrong((id *)&self->_overlayCircled, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_numberCircled, 0);
  objc_storeStrong((id *)&self->_number, 0);
}

@end
