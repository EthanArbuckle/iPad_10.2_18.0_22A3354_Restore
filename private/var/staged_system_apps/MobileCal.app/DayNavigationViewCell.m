@implementation DayNavigationViewCell

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (BOOL)circled
{
  return self->_circled;
}

- (DayNavigationViewCell)initWithFrame:(CGRect)a3
{
  DayNavigationViewCell *v3;
  DayNavigationViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DayNavigationViewCell;
  v3 = -[DayNavigationViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[DayNavigationViewCell _setUpInteraction](v3, "_setUpInteraction");
  return v4;
}

- (void)_setUpInteraction
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)UIPointerInteraction), "initWithDelegate:", self);
  -[DayNavigationViewCell addInteraction:](self, "addInteraction:", v3);

}

- (BOOL)isToday
{
  return self->_isToday;
}

- (void)setIsWeekend:(BOOL)a3
{
  self->_isWeekend = a3;
}

- (BOOL)isWeekend
{
  return self->_isWeekend;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setIsToday:(BOOL)a3
{
  self->_isToday = a3;
}

- (void)setCircled:(BOOL)a3
{
  self->_circled = a3;
}

- (CGRect)circleFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  NSRect v8;

  -[DayNavigationViewCell frame](self, "frame");
  v3 = NSStringFromRect(v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewCell date](self, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("frame: %@  date: %@"), v4, v5));

  return (NSString *)v6;
}

- (double)baselineOffsetFromTop
{
  return 0.0;
}

- (id)preferredPointerShape
{
  return 0;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  double x;
  double y;
  double width;
  double height;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  CGPoint v15;
  CGRect v16;
  CGRect v17;

  v6 = a4;
  -[DayNavigationViewCell contentFrame](self, "contentFrame");
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  if (CGRectIsEmpty(v16)
    || (objc_msgSend(v6, "location"),
        v15.x = v11,
        v15.y = v12,
        v17.origin.x = x,
        v17.origin.y = y,
        v17.size.width = width,
        v17.size.height = height,
        !CGRectContainsPoint(v17, v15)))
  {
    v13 = 0;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0, x, y, width, height));
  }

  return v13;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  -[DayNavigationViewCell setLabelElementsVisible:](self, "setLabelElementsVisible:", 0, a4, a5);
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000422A0;
  v5[3] = &unk_1001B25D0;
  v5[4] = self;
  objc_msgSend(a5, "addCompletion:", v5, a4);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  _BOOL8 v6;
  uint64_t ImageViewFromView;
  void *v8;
  id v9;
  double MidX;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  CGRect v22;
  CGRect v23;

  v5 = a4;
  v6 = -[DayNavigationViewCell labelElementsVisible](self, "labelElementsVisible");
  -[DayNavigationViewCell setLabelElementsVisible:](self, "setLabelElementsVisible:", 1);
  objc_msgSend(v5, "rect");
  ImageViewFromView = createImageViewFromView(self, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(ImageViewFromView);
  v9 = objc_alloc((Class)UIPreviewTarget);
  objc_msgSend(v5, "rect");
  MidX = CGRectGetMidX(v22);
  objc_msgSend(v5, "rect");
  v11 = objc_msgSend(v9, "initWithContainer:center:", self, MidX, CGRectGetMidY(v23));
  objc_msgSend(v5, "rect");
  v13 = v12;
  v15 = v14;

  objc_msgSend(v8, "setFrame:", CGPointZero.x, CGPointZero.y, v13, v15);
  v16 = objc_alloc_init((Class)UIPreviewParameters);
  v17 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:parameters:target:", v8, v16, v11);
  -[DayNavigationViewCell setLabelElementsVisible:](self, "setLabelElementsVisible:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerEffect effectWithPreview:](UIPointerEffect, "effectWithPreview:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewCell preferredPointerShape](self, "preferredPointerShape"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v18, v19));

  return v20;
}

+ (void)contentSizeCategoryChanged
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  qword_1001F3430 = 0xBFF0000000000000;
  v2 = (void *)qword_1001F60D8;
  qword_1001F60D8 = 0;

  v3 = (void *)qword_1001F60E0;
  qword_1001F60E0 = 0;

  v4 = (void *)qword_1001F60C0;
  qword_1001F60C0 = 0;

  v5 = (void *)qword_1001F60C8;
  qword_1001F60C8 = 0;

  v6 = (void *)qword_1001F60D0;
  qword_1001F60D0 = 0;

}

+ (double)_fontSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  unsigned int v8;
  double result;

  v2 = EKUICurrentWindowSize(0);
  if (v2 <= v3)
    v4 = v2;
  else
    v4 = v3;
  if (v2 < v3)
    v2 = v3;
  v5 = 23.0;
  if (v4 == 744.0 && v2 == 1133.0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localeIdentifier"));
    v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("ja_"));

    v5 = 17.0;
    if (!v8)
      v5 = 23.0;
  }
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 17.0, v5);
  return result;
}

+ (id)_normalFont
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "_fontSize");
  v2 = (void *)qword_1001F60D8;
  if (!qword_1001F60D8)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
    v4 = (void *)qword_1001F60D8;
    qword_1001F60D8 = v3;

    v2 = (void *)qword_1001F60D8;
  }
  return v2;
}

+ (id)_boldFont
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "_fontSize");
  v2 = (void *)qword_1001F60E0;
  if (!qword_1001F60E0)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:"));
    v4 = (void *)qword_1001F60E0;
    qword_1001F60E0 = v3;

    v2 = (void *)qword_1001F60E0;
  }
  return v2;
}

+ (id)_overlayFont
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 11.0, 17.0);
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
}

+ (double)circleDiameter
{
  double result;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  result = *(double *)&qword_1001F3430;
  if (*(double *)&qword_1001F3430 < 0.0)
  {
    v4 = objc_alloc_init((Class)NSDateComponents);
    objc_msgSend(v4, "setYear:", 2014);
    objc_msgSend(v4, "setMonth:", 12);
    objc_msgSend(v4, "setDay:", 25);
    objc_msgSend(v4, "setHour:", 12);
    objc_msgSend(v4, "setSecond:", 0);
    v5 = CUIKCalendar(objc_msgSend(v4, "setMinute:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateFromComponents:", v4));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "centerStringForDate:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_boldFont"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v9, NSFontAttributeName));

    objc_msgSend(v8, "sizeWithAttributes:", v10);
    *(float *)&v12 = v11 * v11 + v12 * v12;
    v13 = sqrtf(*(float *)&v12);
    objc_msgSend((id)objc_opt_class(a1), "defaultCircleDiameter");
    if (v14 < v13)
      v14 = v13;
    qword_1001F3430 = ceil(v14);

    return *(double *)&qword_1001F3430;
  }
  return result;
}

+ (double)defaultCircleDiameter
{
  return 28.0;
}

+ (double)yCenterForDayNumbers
{
  return 21.0;
}

+ (double)roundedRectHorizontalPadding
{
  return 5.0;
}

+ (double)roundedRectVerticalPadding
{
  return 2.0;
}

+ (double)roundedRectBottomSpacing
{
  return 5.0;
}

+ (double)interTextSpacing
{
  return 4.0;
}

+ (double)interTextSpacingCircled
{
  return 6.0;
}

+ (double)badgeDiameter
{
  return 14.0;
}

+ (double)roundedRectHeight
{
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  double v22;

  v3 = objc_msgSend(a1, "yCenterForDayNumbers");
  v6 = CalRoundToScreenScale(v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_normalFont"));
  v8 = objc_msgSend(v7, "lineHeight");
  v11 = CalRoundToScreenScale(v8, v9, v10) + 4.0;

  v14 = CalRoundToScreenScale(v12, v13, v6 + v11 * 0.5);
  v17 = CUIKGetOverlayCalendar(v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_overlayFont"));
    v20 = objc_msgSend(v19, "lineHeight");
    v14 = v14 + CalRoundToScreenScale(v20, v21, v22);

  }
  return v14 + 5.0;
}

+ (double)roundedRectBaselineOffset
{
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  uint64_t v9;
  double v10;
  double v11;
  id v12;
  double v13;
  uint64_t v14;
  double v15;

  v3 = objc_msgSend(a1, "yCenterForDayNumbers");
  v6 = CalRoundToScreenScale(v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_normalFont"));
  v8 = objc_msgSend(v7, "lineHeight");
  v11 = v6 + CalRoundToScreenScale(v8, v9, v10) * -0.5;
  objc_msgSend(a1, "_fontSize");
  v12 = +[TappableDayNumber firstLineBaselineOffsetForFontSize:](TappableDayNumber, "firstLineBaselineOffsetForFontSize:");
  v15 = CalRoundToScreenScale(v12, v14, v11 + v13);

  return v15;
}

+ (id)leftStringForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_generateFormatStringsIfNeeded");
  if (qword_1001F60C0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_leftDateFormatter"));
    objc_msgSend(v5, "setDateFormat:", qword_1001F60C0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v4));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)centerStringForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_generateFormatStringsIfNeeded");
  if (qword_1001F60C8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_centerDateFormatter"));
    objc_msgSend(v5, "setDateFormat:", qword_1001F60C8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v4));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)rightStringForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_generateFormatStringsIfNeeded");
  if (qword_1001F60D0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_rightDateFormatter"));
    objc_msgSend(v5, "setDateFormat:", qword_1001F60D0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v4));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (double)_widthOfSpace
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100042AD8;
  block[3] = &unk_1001B2DA0;
  block[4] = a1;
  if (qword_1001F60F0 != -1)
    dispatch_once(&qword_1001F60F0, block);
  return *(double *)&qword_1001F60E8;
}

+ (BOOL)_stringsIncludeSpacing
{
  return byte_1001F60F8;
}

+ (void)localeChanged
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_updateFormatter");
  v2 = (void *)qword_1001F60C0;
  qword_1001F60C0 = 0;

  v3 = (void *)qword_1001F60C8;
  qword_1001F60C8 = 0;

  v4 = (void *)qword_1001F60D0;
  qword_1001F60D0 = 0;

  qword_1001F3430 = 0xBFF0000000000000;
}

+ (_NSRange)_rangeForFirstSequenceOfDCharacters:(id)a3
{
  id v3;
  id v4;
  NSUInteger v5;
  uint64_t v6;
  id v7;
  _BYTE *v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = 0;
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3)
  {
    v7 = v4;
    if (v4)
    {
      v8 = objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
      v9 = 0;
      v5 = 0;
      v10 = 0;
      do
      {
        v11 = v8[v9] == 100;
        if (v8[v9] == 100)
        {
          if (!v5)
            v6 = v9;
          ++v5;
        }
        else if (v10)
        {
          break;
        }
        ++v9;
        v10 = v11;
      }
      while (v7 != (id)v9);
    }
  }

  v12 = v6;
  v13 = v5;
  result.length = v13;
  result.location = v12;
  return result;
}

+ (void)_generateFormatStringsIfNeeded
{
  void *v3;
  void *v4;
  unsigned int v5;
  __CFString *v6;
  id v7;
  uint64_t v8;
  id FormatAnd_d_FieldRangeFor_Ed;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  int IsRightToLeft;
  void *v22;
  void *v23;
  uint8_t v24[16];
  __int128 v25;

  if (!qword_1001F60C8)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localeIdentifier"));
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("en_US"));

    v25 = xmmword_1001A14A0;
    if (v5)
    {
      byte_1001F60F8 = 0;
      v6 = CFSTR("EEEd");
      v7 = objc_msgSend((id)objc_opt_class(a1), "_rangeForFirstSequenceOfDCharacters:", CFSTR("EEEd"));
      *(_QWORD *)&v25 = v7;
      *((_QWORD *)&v25 + 1) = v8;
    }
    else
    {
      byte_1001F60F8 = 1;
      FormatAnd_d_FieldRangeFor_Ed = GetFormatAnd_d_FieldRangeFor_Ed(v3, (uint64_t *)&v25);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(FormatAnd_d_FieldRangeFor_Ed);
      v7 = (id)v25;
    }
    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Scrubber cell: unable to generate date format, defaulting to US layout.", v24, 2u);
      }

      byte_1001F60F8 = 0;
      v6 = CFSTR("EEEd");
      v7 = objc_msgSend((id)objc_opt_class(a1), "_rangeForFirstSequenceOfDCharacters:", CFSTR("EEEd"));
      v12 = v11;
      *(_QWORD *)&v25 = v7;
      *((_QWORD *)&v25 + 1) = v11;
    }
    else
    {
      v12 = *((_QWORD *)&v25 + 1);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v6, "substringWithRange:", v7, v12));
    if ((_QWORD)v25)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringToIndex:](v6, "substringToIndex:"));
      v15 = v25;
    }
    else
    {
      v15 = 0;
      v14 = 0;
    }
    v16 = *((_QWORD *)&v25 + 1) + v15;
    if (v16 >= (unint64_t)-[__CFString length](v6, "length"))
      v17 = 0;
    else
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringFromIndex:](v6, "substringFromIndex:", v16));
    v18 = (void *)qword_1001F60C8;
    qword_1001F60C8 = (uint64_t)v13;
    v19 = v13;

    IsRightToLeft = CUIKLocaleIsRightToLeft(v20);
    if (IsRightToLeft)
      v22 = v17;
    else
      v22 = v14;
    if (IsRightToLeft)
      v23 = v14;
    else
      v23 = v17;
    objc_storeStrong((id *)&qword_1001F60C0, v22);
    objc_storeStrong((id *)&qword_1001F60D0, v23);

  }
}

+ (id)_findFormatForLocale:(id)a3 usingExampleDate:(id)a4
{
  id v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  id v27;
  NSAttributedStringKey v28;
  void *v29;

  v6 = a3;
  v27 = a4;
  objc_msgSend(a1, "_widthOfSpace");
  v8 = v7 * -3.0 + 80.0;
  v9 = objc_alloc_init((Class)NSDateFormatter);
  v10 = CUIKCalendar(objc_msgSend(v9, "setLocale:", v6));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v9, "setCalendar:", v11);

  v13 = CUIKCalendar(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timeZone"));
  objc_msgSend(v9, "setTimeZone:", v15);

  v16 = v8 + 1000.0;
  if (v8 + 1000.0 <= v8)
  {
    v20 = CFSTR("EEE d");
  }
  else
  {
    v17 = 0;
    v18 = CFSTR("EEE d");
    while (v17 < (uint64_t)objc_msgSend(&off_1001BC748, "count", v16))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1001BC748, "objectAtIndexedSubscript:", v17));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter dateFormatFromTemplate:options:locale:](NSDateFormatter, "dateFormatFromTemplate:options:locale:", v19, 0, v6));

      objc_msgSend(v9, "setDateFormat:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringFromDate:", v27));
      v28 = NSFontAttributeName;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_boldFont"));
      v29 = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
      objc_msgSend(v21, "sizeWithAttributes:", v23);
      v25 = v24;

      ++v17;
      v18 = v20;
      if (v25 <= v8)
        goto LABEL_8;
    }
    v20 = v18;
  }
LABEL_8:

  return v20;
}

+ (id)_leftDateFormatter
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)qword_1001F60A8;
  if (!qword_1001F60A8)
  {
    v4 = objc_alloc_init((Class)NSDateFormatter);
    v5 = (void *)qword_1001F60A8;
    qword_1001F60A8 = (uint64_t)v4;

    objc_msgSend(a1, "_updateFormatter");
    v3 = (void *)qword_1001F60A8;
  }
  return v3;
}

+ (id)_centerDateFormatter
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)qword_1001F60B0;
  if (!qword_1001F60B0)
  {
    v4 = objc_alloc_init((Class)NSDateFormatter);
    v5 = (void *)qword_1001F60B0;
    qword_1001F60B0 = (uint64_t)v4;

    objc_msgSend(a1, "_updateFormatter");
    v3 = (void *)qword_1001F60B0;
  }
  return v3;
}

+ (id)_rightDateFormatter
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)qword_1001F60B8;
  if (!qword_1001F60B8)
  {
    v4 = objc_alloc_init((Class)NSDateFormatter);
    v5 = (void *)qword_1001F60B8;
    qword_1001F60B8 = (uint64_t)v4;

    objc_msgSend(a1, "_updateFormatter");
    v3 = (void *)qword_1001F60B8;
  }
  return v3;
}

+ (void)_updateFormatter
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v2 = CUIKCalendar(v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = CUIKCalendar(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeZone"));

  objc_msgSend((id)qword_1001F60A8, "setLocale:", v7);
  objc_msgSend((id)qword_1001F60B0, "setLocale:", v7);
  objc_msgSend((id)qword_1001F60B8, "setLocale:", v7);
  objc_msgSend((id)qword_1001F60A8, "setCalendar:", v3);
  objc_msgSend((id)qword_1001F60B0, "setCalendar:", v3);
  objc_msgSend((id)qword_1001F60B8, "setCalendar:", v3);
  objc_msgSend((id)qword_1001F60A8, "setTimeZone:", v6);
  objc_msgSend((id)qword_1001F60B0, "setTimeZone:", v6);
  objc_msgSend((id)qword_1001F60B8, "setTimeZone:", v6);

}

+ (CGRect)badgeFrameFromDayNumberFrame:(CGRect)a3 isRightToLeft:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double MidY;
  double MidX;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend((id)objc_opt_class(a1), "badgeDiameter");
  v10 = v9 * 0.5;
  v11 = width * 0.5 + v9 * 0.5 + -3.0;
  v12 = sqrt(v11 * (v11 * 0.5));
  v13 = height * 0.5 - v10 + 1.0;
  v14 = v12;
  if (v12 > v13)
  {
    v15 = fabs(v11);
    v16 = sqrt(v11 * v11 - v13 * v13);
    if (v15 > fabs(v13))
      v14 = v16;
    else
      v14 = height * 0.5 - v10 + 1.0;
    v12 = height * 0.5 - v10 + 1.0;
  }
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MidY = CGRectGetMidY(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MidX = CGRectGetMidX(v25);
  v19 = -v14;
  if (!v4)
    v19 = v14;
  v20 = CalRoundRectToScreenScale(MidX + v19 - v10, MidY - v12 - v10, v10 + v10, v10 + v10);
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)labelElementsVisible
{
  return self->_labelElementsVisible;
}

- (void)setLabelElementsVisible:(BOOL)a3
{
  self->_labelElementsVisible = a3;
}

- (DayNavigationViewCellDelegate)delegate
{
  return (DayNavigationViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (double)overlayFontSize
{
  return self->_overlayFontSize;
}

- (void)setOverlayFontSize:(double)a3
{
  self->_overlayFontSize = a3;
}

- (CGSize)roundedRectSize
{
  double width;
  double height;
  CGSize result;

  width = self->_roundedRectSize.width;
  height = self->_roundedRectSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setRoundedRectSize:(CGSize)a3
{
  self->_roundedRectSize = a3;
}

- (BOOL)usesRoundedRectInsteadOfCircle
{
  return self->_usesRoundedRectInsteadOfCircle;
}

- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3
{
  self->_usesRoundedRectInsteadOfCircle = a3;
}

- (int64_t)badgeType
{
  return self->_badgeType;
}

- (void)setBadgeType:(int64_t)a3
{
  self->_badgeType = a3;
}

- (UIColor)badgeColor
{
  return self->_badgeColor;
}

- (void)setBadgeColor:(id)a3
{
  objc_storeStrong((id *)&self->_badgeColor, a3);
}

- (NSString)badgeLocale
{
  return self->_badgeLocale;
}

- (void)setBadgeLocale:(id)a3
{
  objc_storeStrong((id *)&self->_badgeLocale, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeLocale, 0);
  objc_storeStrong((id *)&self->_badgeColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_date, 0);
}

- (void)setCircled:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10002E49C((uint64_t)self);
  v4 = sub_1000438B8();
  sub_1000438B0(v4, v5, v6);
}

- (void)prepareForReuse
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10002E49C((uint64_t)self);
  v2 = sub_1000438B8();
  sub_1000438B0(v2, v3, v4);
}

- (void)pulseToday
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10002E49C((uint64_t)self);
  v2 = sub_1000438B8();
  sub_1000438B0(v2, v3, v4);
}

- (void)stopPulsing
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10002E49C((uint64_t)self);
  v2 = sub_1000438B8();
  sub_1000438B0(v2, v3, v4);
}

- (void)setDate:(id)a3 forceStringUpdate:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10002E49C((uint64_t)self);
  v4 = sub_1000438B8();
  sub_1000438B0(v4, v5, v6);
}

@end
