@implementation CompactMonthWeekDayNumber

+ (id)dayNumberFontForSize:(double)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)qword_1001F6320;
  if (!qword_1001F6320 || vabdd_f64(*(double *)&qword_1001F6318, a3) >= 2.22044605e-16)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", a3, UIFontWeightSemibold));
    v6 = (void *)qword_1001F6320;
    qword_1001F6320 = v5;

    qword_1001F6318 = *(_QWORD *)&a3;
    v4 = (void *)qword_1001F6320;
  }
  return v4;
}

- (BOOL)_calendarDateIsOnWeekend
{
  void *v3;
  unsigned int v4;
  id v5;
  NSCalendar *calendar;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  v4 = objc_msgSend(v3, "overrideLocaleWeekends");

  if (v4)
  {
    v5 = -[EKCalendarDate dayOfWeek](self->_calendarDate, "dayOfWeek");
    return v5 == (id)7 || v5 == (id)1;
  }
  else
  {
    calendar = self->_calendar;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_calendarDate, "date"));
    LOBYTE(calendar) = -[NSCalendar isDateInWeekend:](calendar, "isDateInWeekend:", v9);

    return (char)calendar;
  }
}

- (void)setCalendarDate:(id)a3
{
  void *v5;
  EKCalendarDate *v6;

  v6 = (EKCalendarDate *)a3;
  if (self->_calendarDate != v6)
  {
    objc_storeStrong((id *)&self->_calendarDate, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](v6, "date"));
    -[CompactMonthWeekDayOverlay setDate:](self->_overlay, "setDate:", v5);

    -[CompactMonthWeekDayNumber updateDayNumber](self, "updateDayNumber");
  }

}

- (CompactMonthWeekDayNumber)init
{
  CompactMonthWeekDayNumber *v2;
  CALayer *v3;
  CALayer *layer;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CompactMonthWeekDayNumber;
  v2 = -[CompactMonthWeekDayNumber init](&v7, "init");
  if (v2)
  {
    v3 = (CALayer *)objc_alloc_init((Class)CALayer);
    layer = v2->_layer;
    v2->_layer = v3;

    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    -[CALayer setBackgroundColor:](v2->_layer, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayBadgeLocale, 0);
  objc_storeStrong((id *)&self->_dayBadgeColor, 0);
  objc_storeStrong((id *)&self->_dayTypeBadge, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_attachedTodayCircle, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_calendarDate, 0);
  objc_destroyWeak((id *)&self->_weekView);
  objc_storeStrong((id *)&self->_layer, 0);
}

- (void)updateDayNumber
{
  EKCalendarDate *calendarDate;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  -[CALayer setHidden:](self->_layer, "setHidden:", self->_calendarDate == 0);
  calendarDate = self->_calendarDate;
  if (calendarDate)
  {
    v4 = CUIKLocalizedStringForInteger(-[EKCalendarDate day](calendarDate, "day"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if (-[CompactMonthWeekDayNumber _calendarDateIsOnWeekend](self, "_calendarDateIsOnWeekend"))
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber _weekendImageForDayNumberString:](self, "_weekendImageForDayNumberString:", v5));
    else
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber _weekdayImageForDayNumberString:](self, "_weekdayImageForDayNumberString:", v5));
    v7 = objc_retainAutorelease(v6);
    -[CALayer setContents:](self->_layer, "setContents:", objc_msgSend(v7, "CGImage"));
    -[CALayer frame](self->_layer, "frame");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v7, "size");
    -[CALayer setFrame:](self->_layer, "setFrame:", v9, v11, v12, v13);
    v14 = (void *)objc_opt_class(self);
    -[CompactMonthWeekDayNumber fontSize](self, "fontSize");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dayNumberFontForSize:"));
    self->_offsetX = CalOffsetToCenterNumberWithFont(v5, v15);

  }
  +[CATransaction commit](CATransaction, "commit");
}

+ (id)_generateImageWithString:(id)a3 color:(id)a4 fontSize:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double width;
  UIImage *ImageFromCurrentImageContext;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[2];
  CGSize v22;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dayNumberFontForSize:", a5));
  v20[0] = NSFontAttributeName;
  v20[1] = NSForegroundColorAttributeName;
  v21[0] = v10;
  v21[1] = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));

  v12 = objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 0, v11, 0, CGSizeZero.width, CGSizeZero.height);
  v14 = v13;
  v22.width = CalCeilToScreenScale(v12, v15);
  width = v22.width;
  v22.height = v14;
  UIGraphicsBeginImageContextWithOptions(v22, 0, 0.0);
  objc_msgSend(v9, "drawInRect:withAttributes:", v11, 0.0, 0.0, width, v14);

  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v18 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v18;
}

- (id)_weekdayImageForDayNumberString:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (qword_1001F6300 != -1)
    dispatch_once(&qword_1001F6300, &stru_1001B49F8);
  -[CompactMonthWeekDayNumber fontSize](self, "fontSize");
  v6 = v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weekView);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "traitCollection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("-%.2f:%tu"), v6, objc_msgSend(v8, "userInterfaceStyle")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001F62F8, "objectForKey:", v9));
  if (!v10)
  {
    v11 = objc_loadWeakRetained((id *)&self->_weekView);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "traitCollection"));
    +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v14 = (void *)objc_opt_class(self);
    -[CompactMonthWeekDayNumber fontSize](self, "fontSize");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_generateImageWithString:color:fontSize:", v4, v13));
    objc_msgSend((id)qword_1001F62F8, "setObject:forKey:", v10, v9);

  }
  return v10;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (CALayer)layer
{
  return self->_layer;
}

- (CompactMonthWeekDayNumber)initWithWeekView:(id)a3 andCalendar:(id)a4
{
  id v6;
  id v7;
  CompactMonthWeekDayNumber *v8;
  CompactMonthWeekDayNumber *v9;
  CALayer *v10;
  CALayer *layer;
  id v12;
  void *v13;
  CALayer *v14;
  CALayer *dayTypeBadge;
  double v16;
  id v17;
  double v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CompactMonthWeekDayNumber;
  v8 = -[CompactMonthWeekDayNumber init](&v20, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_weekView, v6);
    v10 = (CALayer *)objc_alloc_init((Class)CALayer);
    layer = v9->_layer;
    v9->_layer = v10;

    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    -[CALayer setBackgroundColor:](v9->_layer, "setBackgroundColor:", objc_msgSend(v12, "CGColor"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
    objc_msgSend(v13, "addSublayer:", v9->_layer);

    objc_storeStrong((id *)&v9->_calendar, a4);
    v14 = objc_opt_new(CALayer);
    dayTypeBadge = v9->_dayTypeBadge;
    v9->_dayTypeBadge = v14;

    *(_QWORD *)&v16 = objc_opt_class(v6).n128_u64[0];
    objc_msgSend(v17, "dayTypeBadgeDiameter:", objc_msgSend(v6, "compressedVerticalMode", v16));
    -[CALayer setCornerRadius:](v9->_dayTypeBadge, "setCornerRadius:", v18 * 0.5);
    *(_OWORD *)&v9->_fontSize = xmmword_1001A1780;
  }

  return v9;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  CALayer *layer;
  void *v7;
  unsigned int v8;
  NSString *v9;
  void *v10;
  double offsetX;
  void *v12;
  void *v13;
  objc_super v15;
  CGRect v16;

  v15.receiver = self;
  v15.super_class = (Class)CompactMonthWeekDayNumber;
  v3 = -[CompactMonthWeekDayNumber description](&v15, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber calendarDate](self, "calendarDate"));
  layer = self->_layer;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber layer](self, "layer"));
  v8 = objc_msgSend(v7, "isHidden");
  -[CALayer frame](self->_layer, "frame");
  v9 = NSStringFromCGRect(v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  offsetX = self->_offsetX;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber overlay](self, "overlay"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@;\n\tcalendarDate: [%@]\n\tlayer: [%@]\n\tlayerHidden: [%d]\n\tlayer.frame: [%@]\n\toffsetX: [%f]\n\toverlayHidden: [%d]"),
                    v4,
                    v5,
                    layer,
                    v8,
                    v10,
                    *(_QWORD *)&offsetX,
                    objc_msgSend(v12, "isHidden")));

  return v13;
}

- (void)updateOverlay
{
  uint64_t v3;
  uint64_t v4;
  CompactMonthWeekDayOverlay *overlay;
  BOOL v6;
  BOOL v7;
  id v8;
  CompactMonthWeekDayOverlay *v9;
  CompactMonthWeekDayOverlay *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  CompactMonthWeekDayOverlay *v16;
  void *v17;
  void *v18;
  CompactMonthWeekDayOverlay *v19;
  CompactMonthWeekView **p_weekView;
  id v21;

  v3 = CUIKGetOverlayCalendar(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  overlay = self->_overlay;
  if (overlay)
    v6 = 1;
  else
    v6 = v4 == 0;
  v21 = (id)v4;
  if (!v6)
  {
    v9 = objc_opt_new(CompactMonthWeekDayOverlay);
    v10 = self->_overlay;
    self->_overlay = v9;

    -[CompactMonthWeekDayNumber overlayFontSize](self, "overlayFontSize");
    -[CompactMonthWeekDayOverlay setFontSize:](self->_overlay, "setFontSize:");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber calendarDate](self, "calendarDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "date"));
    -[CompactMonthWeekDayOverlay setDate:](self->_overlay, "setDate:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber attachedTodayCircle](self, "attachedTodayCircle"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_weekView);
    v15 = WeakRetained;
    v16 = self->_overlay;
    if (v13)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber attachedTodayCircle](self, "attachedTodayCircle"));
      objc_msgSend(v15, "insertSubview:belowSubview:", v16, v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber attachedTodayCircle](self, "attachedTodayCircle"));
      objc_msgSend(v18, "setShowOverlay:", 1);

      -[CompactMonthWeekDayOverlay setHidden:](self->_overlay, "setHidden:", 1);
    }
    else
    {
      objc_msgSend(WeakRetained, "addSubview:", self->_overlay);

    }
    p_weekView = &self->_weekView;
    goto LABEL_16;
  }
  if (overlay)
    v7 = v4 == 0;
  else
    v7 = 0;
  if (v7)
  {
    -[CompactMonthWeekDayOverlay removeFromSuperview](overlay, "removeFromSuperview");
    v19 = self->_overlay;
    self->_overlay = 0;

    p_weekView = &self->_weekView;
LABEL_16:
    v8 = objc_loadWeakRetained((id *)p_weekView);
    objc_msgSend(v8, "setNeedsLayout");
    goto LABEL_17;
  }
  -[CompactMonthWeekDayNumber overlayFontSize](self, "overlayFontSize");
  -[CompactMonthWeekDayOverlay setFontSize:](self->_overlay, "setFontSize:");
  -[CompactMonthWeekDayOverlay update](self->_overlay, "update");
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber attachedTodayCircle](self, "attachedTodayCircle"));
  objc_msgSend(v8, "updateOverlay");
LABEL_17:

}

- (void)hideOverlayAndNumber:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber overlay](self, "overlay"));
  objc_msgSend(v5, "setHidden:", v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber layer](self, "layer"));
  objc_msgSend(v6, "setHidden:", v3);

}

- (double)offsetX
{
  return self->_offsetX;
}

+ (double)baselineOffsetFromTopOfLayerForFontSize:(double)a3
{
  double result;
  id v5;
  void *v6;
  uint64_t v7;

  result = *(double *)&qword_1001F62D8;
  if (*(double *)&qword_1001F62D8 == 0.0 || vabdd_f64(*(double *)&qword_1001F62E0, a3) >= 2.22044605e-16)
  {
    objc_opt_class(a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_standardLabelForFontSize:", a3));
    objc_msgSend(v6, "sizeToFit");
    objc_msgSend(v6, "_firstLineBaselineOffsetFromBoundsTop");
    qword_1001F62D8 = v7;
    qword_1001F62E0 = *(_QWORD *)&a3;

    return *(double *)&qword_1001F62D8;
  }
  return result;
}

+ (double)heightOfFrameForFontSize:(double)a3
{
  double result;
  id v5;
  void *v6;
  uint64_t v7;

  result = *(double *)&qword_1001F62E8;
  if (*(double *)&qword_1001F62E8 == 0.0 || vabdd_f64(*(double *)&qword_1001F62F0, a3) >= 2.22044605e-16)
  {
    objc_opt_class(a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_standardLabelForFontSize:", a3));
    objc_msgSend(v6, "sizeToFit");
    objc_msgSend(v6, "frame");
    qword_1001F62E8 = v7;
    qword_1001F62F0 = *(_QWORD *)&a3;

    return *(double *)&qword_1001F62E8;
  }
  return result;
}

- (BOOL)representsActualDate
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber calendarDate](self, "calendarDate"));
  v3 = v2 != 0;

  return v3;
}

+ (id)_standardLabelForFontSize:(double)a3
{
  id v5;
  id v6;
  void *v7;

  v5 = objc_alloc_init((Class)UILabel);
  objc_opt_class(a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dayNumberFontForSize:", a3));
  objc_msgSend(v5, "setFont:", v7);

  objc_msgSend(v5, "setText:", CFSTR("0"));
  return v5;
}

- (id)_weekendImageForDayNumberString:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;

  v4 = a3;
  if (qword_1001F6310 != -1)
    dispatch_once(&qword_1001F6310, &stru_1001B4A18);
  -[CompactMonthWeekDayNumber fontSize](self, "fontSize");
  v6 = v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weekView);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "traitCollection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("-%.2f:%tu"), v6, objc_msgSend(v8, "userInterfaceStyle")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001F6308, "objectForKey:", v9));
  if (!v10)
  {
    v11 = objc_loadWeakRetained((id *)&self->_weekView);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "traitCollection"));
    +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v12);

    v13 = WeekendTextColor();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_QWORD *)&v15 = objc_opt_class(self).n128_u64[0];
    v17 = v16;
    -[CompactMonthWeekDayNumber fontSize](self, "fontSize", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_generateImageWithString:color:fontSize:", v4, v14));
    objc_msgSend((id)qword_1001F6308, "setObject:forKey:", v10, v9);

  }
  return v10;
}

- (EKCalendarDate)calendarDate
{
  return self->_calendarDate;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (CompactMonthWeekTodayCircle)attachedTodayCircle
{
  return self->_attachedTodayCircle;
}

- (void)setAttachedTodayCircle:(id)a3
{
  objc_storeStrong((id *)&self->_attachedTodayCircle, a3);
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (CompactMonthWeekDayOverlay)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_overlay, a3);
}

- (CALayer)dayTypeBadge
{
  return self->_dayTypeBadge;
}

- (void)setDayTypeBadge:(id)a3
{
  objc_storeStrong((id *)&self->_dayTypeBadge, a3);
}

- (int64_t)dayBadgeType
{
  return self->_dayBadgeType;
}

- (void)setDayBadgeType:(int64_t)a3
{
  self->_dayBadgeType = a3;
}

- (UIColor)dayBadgeColor
{
  return self->_dayBadgeColor;
}

- (void)setDayBadgeColor:(id)a3
{
  objc_storeStrong((id *)&self->_dayBadgeColor, a3);
}

- (NSString)dayBadgeLocale
{
  return self->_dayBadgeLocale;
}

- (void)setDayBadgeLocale:(id)a3
{
  objc_storeStrong((id *)&self->_dayBadgeLocale, a3);
}

- (double)overlayFontSize
{
  return self->_overlayFontSize;
}

- (void)setOverlayFontSize:(double)a3
{
  self->_overlayFontSize = a3;
}

@end
