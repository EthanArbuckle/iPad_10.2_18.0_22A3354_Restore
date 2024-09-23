@implementation LargeTextLargeYearMonthView

+ (unint64_t)numberOfMonthsPerRowForWindowSize:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;

  height = a3.height;
  width = a3.width;
  v6 = EKUIWindowInterfaceParadigmForWindowSize(0, a2, (__n128)a3, *(__n128 *)&a3.height);
  if (vabdd_f64(*(double *)&qword_1001F67A8, width) >= 2.22044605e-16 || qword_1001F5778 != v6)
  {
    v8 = v6;
    if (v6 == 8)
      v9 = 3;
    else
      v9 = 2;
    qword_1001F67B0 = v9;
    v10 = +[LargeYearViewController defaultMonthsPerRowForWindowSize:](LargeYearViewController, "defaultMonthsPerRowForWindowSize:", width, height);
    if (v10 > v9)
    {
      v11 = v10;
      while (1)
      {
        objc_msgSend(a1, "_headerFontSizeForNumberOfMonthsPerRow:windowSize:", v11, width, height);
        v13 = v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
        objc_msgSend(v14, "pointSize");
        v16 = v15;

        if (v13 >= v16)
          break;
        if (--v11 <= v9)
          goto LABEL_14;
      }
      qword_1001F67B0 = v11;
    }
LABEL_14:
    qword_1001F67A8 = *(_QWORD *)&width;
    qword_1001F5778 = v8;
  }
  return qword_1001F67B0;
}

+ (double)leftMarginForWindowSize:(CGSize)a3
{
  double result;

  _objc_msgSend(a1, "_leftMarginForNumberOfMonthsPerRow:windowSize:", objc_msgSend(a1, "numberOfMonthsPerRowForWindowSize:"), a3.width, a3.height);
  return result;
}

+ (double)rightMarginForWindowSize:(CGSize)a3
{
  double result;

  _objc_msgSend(a1, "_rightMarginForNumberOfMonthsPerRow:windowSize:", objc_msgSend(a1, "numberOfMonthsPerRowForWindowSize:"), a3.width, a3.height);
  return result;
}

- (CGSize)_availableSpace
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeTextLargeYearMonthView window](self, "window"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LargeTextLargeYearMonthView window](self, "window"));
    objc_msgSend(v4, "mainContentSize");
    v6 = v5;
    v8 = v7;

    v9 = v6;
    v10 = v8;
  }
  else
  {
    v9 = EKUICurrentWindowSize(self);
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[LargeTextLargeYearMonthView xSpacing](self, "xSpacing", a3.width, a3.height);
  v5 = v4 * 7.0;
  v6 = EKUIInterfaceOrientationForViewHierarchy(self);
  *(_QWORD *)&v7 = objc_opt_class(self).n128_u64[0];
  v9 = v8;
  -[LargeTextLargeYearMonthView _availableSpace](self, "_availableSpace", v7);
  objc_msgSend(v9, "heightForInterfaceOrientation:windowSize:heightSizeClass:", v6, EKUIHeightSizeClassForViewHierarchy(self), v10, v11);
  v13 = v12;
  v14 = v5;
  result.height = v13;
  result.width = v14;
  return result;
}

+ (double)heightForInterfaceOrientation:(int64_t)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5
{
  CGFloat width;
  double result;

  width = a4.width;
  if (vabdd_f64(*(double *)&qword_1001F67B8, a4.width) < 2.22044605e-16)
    return *(double *)&qword_1001F67C0;
  objc_msgSend(a1, "_heightForNumberOfMonthsPerRow:windowSize:heightSizeClass:", objc_msgSend(a1, "numberOfMonthsPerRowForWindowSize:", a3, a4.width, a4.height), a5, a4.width, a4.height);
  qword_1001F67C0 = *(_QWORD *)&result;
  qword_1001F67B8 = *(_QWORD *)&width;
  return result;
}

+ (double)_heightForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5
{
  double height;
  double width;
  double v9;
  double v10;
  double v11;

  height = a4.height;
  width = a4.width;
  objc_msgSend(a1, "_daysYAdjustTopForNumberOfMonthsPerRow:windowSize:heightSizeClass:", a3, a5);
  v10 = v9;
  objc_msgSend(a1, "_ySpacingForNumberOfMonthsPerRow:windowSize:", a3, width, height);
  return v10 + v11 * 6.0;
}

- (double)xInset
{
  return 0.0;
}

- (double)yInset
{
  return 0.0;
}

- (double)headerXAdjust
{
  return 0.0;
}

+ (double)_headerFontSizeForWindowSize:(CGSize)a3
{
  double result;

  objc_msgSend(a1, "_headerFontSizeForNumberOfMonthsPerRow:windowSize:", objc_msgSend(a1, "numberOfMonthsPerRowForWindowSize:"), a3.width, a3.height);
  return result;
}

+ (double)_headerFontSizeForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4
{
  double v4;

  objc_msgSend(a1, "_dayTextSizeForNumberOfMonthsPerRow:windowSize:", a3, a4.width, a4.height);
  return round(28.0 / 13.0 * v4);
}

- (double)headerFontMaxSize
{
  double v3;
  void *v4;
  void *v5;
  double result;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = v4;
  -[LargeTextLargeYearMonthView _availableSpace](self, "_availableSpace", v3);
  _objc_msgSend(v5, "_headerFontSizeForWindowSize:");
  return result;
}

- (double)headerFontMinSize
{
  double v3;
  void *v4;
  void *v5;
  double result;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = v4;
  -[LargeTextLargeYearMonthView _availableSpace](self, "_availableSpace", v3);
  _objc_msgSend(v5, "_headerFontSizeForWindowSize:");
  return result;
}

- (id)headerFont
{
  double v3;
  void *v4;
  void *v5;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = v4;
  -[LargeTextLargeYearMonthView _availableSpace](self, "_availableSpace", v3);
  return _objc_msgSend(v5, "_headerFontForWindowSize:");
}

+ (id)_headerFontForWindowSize:(CGSize)a3
{
  return objc_msgSend(a1, "_headerFontForNumberOfMonthsPerRow:windowSize:", objc_msgSend(a1, "numberOfMonthsPerRowForWindowSize:"), a3.width, a3.height);
}

+ (id)_headerFontForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4
{
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "_headerFontSizeForNumberOfMonthsPerRow:windowSize:", a3, a4.width, a4.height);
  v5 = (void *)qword_1001F67C8;
  if (!qword_1001F67C8 || vabdd_f64(v4, *(double *)&qword_1001F5780) >= 2.22044605e-16)
  {
    qword_1001F5780 = *(_QWORD *)&v4;
    v6 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
    v7 = (void *)qword_1001F67C8;
    qword_1001F67C8 = v6;

    v5 = (void *)qword_1001F67C8;
  }
  return v5;
}

- (double)headerFontKerning
{
  return 0.0;
}

- (id)dayNumberFont
{
  double v3;
  void *v4;
  void *v5;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = v4;
  -[LargeTextLargeYearMonthView _availableSpace](self, "_availableSpace", v3);
  return _objc_msgSend(v5, "_dayNumberFontForWindowSize:");
}

+ (id)_dayNumberFontForWindowSize:(CGSize)a3
{
  return _objc_msgSend(a1, "_dayNumberFontForNumberOfMonthsPerRow:windowSize:", objc_msgSend(a1, "numberOfMonthsPerRowForWindowSize:"), a3.width, a3.height);
}

+ (id)_dayNumberFontForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4
{
  double v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a1, "_dayTextSizeForNumberOfMonthsPerRow:windowSize:", a3, a4.width, a4.height);
  v5 = (void *)qword_1001F67D0;
  if (!qword_1001F67D0)
    goto LABEL_5;
  v6 = v4 - *(double *)&qword_1001F5788;
  if (v4 - *(double *)&qword_1001F5788 < 0.0)
    v6 = -v6;
  if (v6 > 0.0001)
  {
LABEL_5:
    qword_1001F5788 = *(_QWORD *)&v4;
    v7 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
    v8 = (void *)qword_1001F67D0;
    qword_1001F67D0 = v7;

    v5 = (void *)qword_1001F67D0;
  }
  return v5;
}

- (id)todayNumberFont
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (!qword_1001F67D8)
    goto LABEL_5;
  -[LargeTextLargeYearMonthView todayTextSize](self, "todayTextSize");
  v4 = v3 - *(double *)&qword_1001F5790;
  if (v4 < 0.0)
    v4 = -v4;
  if (v4 > 0.0001)
  {
LABEL_5:
    -[LargeTextLargeYearMonthView todayTextSize](self, "todayTextSize");
    qword_1001F5790 = v5;
    -[LargeTextLargeYearMonthView todayTextSize](self, "todayTextSize");
    v6 = objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:"));
    v7 = (void *)qword_1001F67D8;
    qword_1001F67D8 = v6;

  }
  return (id)qword_1001F67D8;
}

- (double)dayTextSize
{
  double v3;
  void *v4;
  void *v5;
  double result;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = v4;
  -[LargeTextLargeYearMonthView _availableSpace](self, "_availableSpace", v3);
  objc_msgSend(v5, "_dayTextSizeForWindowSize:");
  return result;
}

+ (double)_dayTextSizeForWindowSize:(CGSize)a3
{
  double result;

  objc_msgSend(a1, "_dayTextSizeForNumberOfMonthsPerRow:windowSize:", objc_msgSend(a1, "numberOfMonthsPerRowForWindowSize:"), a3.width, a3.height);
  return result;
}

+ (double)_dayTextSizeForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4
{
  double v4;

  objc_msgSend(a1, "_ySpacingForNumberOfMonthsPerRow:windowSize:", a3, a4.width, a4.height);
  return round(13.0 / 21.0 * v4);
}

- (double)todayNumberKerning
{
  return 0.0;
}

- (double)circleSize
{
  double v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  uint64_t v8;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = v4;
  -[LargeTextLargeYearMonthView _availableSpace](self, "_availableSpace", v3);
  v6 = objc_msgSend(v5, "_dayTextSizeForWindowSize:");
  return CalRoundToScreenScale(v6, v8, 18.0 / 13.0 * v7);
}

- (double)circleSizeForDoubleDigit
{
  double result;

  -[LargeTextLargeYearMonthView circleSize](self, "circleSize");
  return result;
}

- (BOOL)computeCircleFrameWithoutAdjustments
{
  return 1;
}

- (double)daysXAdjustLeft
{
  return 0.0;
}

- (double)daysYAdjustTop
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  id v8;
  double v9;

  -[LargeTextLargeYearMonthView _availableSpace](self, "_availableSpace");
  v4 = v3;
  v6 = v5;
  v7 = EKUIHeightSizeClassForViewHierarchy(self);
  objc_opt_class(self);
  objc_msgSend(v8, "_daysYAdjustTopForWindowSize:heightSizeClass:", v7, v4, v6);
  return v9 + 3.0;
}

+ (double)_daysYAdjustTopForWindowSize:(CGSize)a3 heightSizeClass:(int64_t)a4
{
  double result;

  objc_msgSend(a1, "_daysYAdjustTopForNumberOfMonthsPerRow:windowSize:heightSizeClass:", objc_msgSend(a1, "numberOfMonthsPerRowForWindowSize:"), a4, a3.width, a3.height);
  return result;
}

+ (double)_daysYAdjustTopForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5
{
  double height;
  double width;
  void *v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  void *v15;
  double v16;

  height = a4.height;
  width = a4.width;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_headerFontForNumberOfMonthsPerRow:windowSize:"));
  objc_msgSend(v10, "_bodyLeading");
  v12 = v11;

  v13 = objc_msgSend(a1, "_showWeekDayInitialsForHeightSizeClass:", a5);
  if ((_DWORD)v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_weekDayInitialsFontForNumberOfMonthsPerRow:windowSize:", a3, width, height));
    objc_msgSend(v15, "_bodyLeading");
    v12 = v12 + v16;

  }
  return CalRoundToScreenScale(v13, v14, v12);
}

- (double)xSpacing
{
  double v3;
  void *v4;
  void *v5;
  double result;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = v4;
  -[LargeTextLargeYearMonthView _availableSpace](self, "_availableSpace", v3);
  _objc_msgSend(v5, "_xSpacingForWindowSize:");
  return result;
}

+ (double)_xSpacingForWindowSize:(CGSize)a3
{
  double result;

  objc_msgSend(a1, "_xSpacingForNumberOfMonthsPerRow:windowSize:", objc_msgSend(a1, "numberOfMonthsPerRowForWindowSize:"), a3.width, a3.height);
  return result;
}

+ (double)_xSpacingForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4
{
  double width;
  uint64_t v6;
  __n128 v7;
  double result;

  width = a4.width;
  if (EKUIWindowInterfaceParadigmForWindowSize(0, a2, (__n128)a4, *(__n128 *)&a4.height) == 8)
    width = EKUIWidthForWindowSizeParadigm(1024, v6);
  v7.n128_f64[0] = width / (double)((8 * a3) | 1);
  CalFloorToScreenScale(v7);
  return result;
}

- (double)ySpacing
{
  double v3;
  void *v4;
  void *v5;
  double result;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = v4;
  -[LargeTextLargeYearMonthView _availableSpace](self, "_availableSpace", v3);
  _objc_msgSend(v5, "_ySpacingForWindowSize:");
  return result;
}

+ (double)_ySpacingForWindowSize:(CGSize)a3
{
  double result;

  objc_msgSend(a1, "_ySpacingForNumberOfMonthsPerRow:windowSize:", objc_msgSend(a1, "numberOfMonthsPerRowForWindowSize:"), a3.width, a3.height);
  return result;
}

+ (double)_ySpacingForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4
{
  double v4;

  objc_msgSend(a1, "_xSpacingForNumberOfMonthsPerRow:windowSize:", a3, a4.width, a4.height);
  return v4 + 1.0;
}

- (BOOL)showWeekDayInitials
{
  id v3;

  objc_opt_class(self);
  return objc_msgSend(v3, "_showWeekDayInitialsForHeightSizeClass:", EKUIHeightSizeClassForViewHierarchy(self));
}

+ (BOOL)_showWeekDayInitialsForHeightSizeClass:(int64_t)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localeIdentifier"));
  v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("ar"));

  if ((v6 & 1) != 0)
    return 0;
  EKUIMultiwindowAssert(a3 != 0, CFSTR("Unspecified size class."));
  return a3 == 2;
}

- (id)weekDayInitialsFont
{
  double v3;
  void *v4;
  void *v5;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = v4;
  -[LargeTextLargeYearMonthView _availableSpace](self, "_availableSpace", v3);
  return _objc_msgSend(v5, "_weekDayInitialsFontForWindowSize:");
}

+ (id)_weekDayInitialsFontForWindowSize:(CGSize)a3
{
  return objc_msgSend(a1, "_weekDayInitialsFontForNumberOfMonthsPerRow:windowSize:", objc_msgSend(a1, "numberOfMonthsPerRowForWindowSize:"), a3.width, a3.height);
}

+ (id)_weekDayInitialsFontForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4
{
  return _objc_msgSend(a1, "_dayNumberFontForNumberOfMonthsPerRow:windowSize:", a3, a4.width, a4.height);
}

- (double)weekDayInitialsAdjustLeft
{
  return 0.0;
}

- (double)weekDayInitialsAdjustTop
{
  void *v2;
  id v3;
  uint64_t v4;
  double v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LargeTextLargeYearMonthView headerFont](self, "headerFont"));
  v3 = objc_msgSend(v2, "_bodyLeading");
  v6 = CalRoundToScreenScale(v3, v4, v5) + 3.0;

  return v6;
}

- (CGSize)roundedRectSizeForDayNumberString:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  NSAttributedStringKey v20;
  void *v21;
  CGSize result;

  v19.receiver = self;
  v19.super_class = (Class)LargeTextLargeYearMonthView;
  v4 = a3;
  -[LargeTextLargeYearMonthView roundedRectSizeForDayNumberString:](&v19, "roundedRectSizeForDayNumberString:", v4);
  v6 = v5;
  v8 = v7;
  v20 = NSFontAttributeName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LargeTextLargeYearMonthView dayNumberFont](self, "dayNumberFont"));
  v21 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  objc_msgSend(v4, "sizeWithAttributes:", v10);
  v12 = v11;

  v13 = -[LargeTextLargeYearMonthView dayTextSize](self, "dayTextSize");
  v16 = CalRoundToScreenScale(v13, v15, v12 + 2.0 / 13.0 * v14 * 2.0);

  if (v6 >= v16)
    v17 = v6;
  else
    v17 = v16;
  v18 = v8;
  result.height = v18;
  result.width = v17;
  return result;
}

- (BOOL)shouldAddPreciseInteractivity
{
  return 0;
}

@end
