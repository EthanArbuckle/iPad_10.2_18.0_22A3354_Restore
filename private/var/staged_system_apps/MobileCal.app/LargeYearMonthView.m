@implementation LargeYearMonthView

- (double)viewWidthForSizing
{
  double v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  double v8;

  v3 = AnchoredValueCurrentWindowWidth(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearMonthView window](self, "window"));
  objc_opt_class(MobileCalWindow);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearMonthView window](self, "window"));
    objc_msgSend(v7, "mainContentSize");
    v3 = v8;

  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[LargeYearMonthView xSpacing](self, "xSpacing", a3.width, a3.height);
  v5 = v4 * (double)(uint64_t)-[LargeYearMonthView daysInWeek](self, "daysInWeek") + 2.0;
  v6 = EKUIInterfaceOrientationForViewHierarchy(self);
  objc_opt_class(self);
  v8 = v7;
  v9 = EKUICurrentWindowSize(self);
  objc_msgSend(v8, "heightForInterfaceOrientation:windowSize:heightSizeClass:", v6, EKUIHeightSizeClassForViewHierarchy(self), v9, v10);
  v12 = v11;
  v13 = v5;
  result.height = v12;
  result.width = v13;
  return result;
}

+ (double)heightForInterfaceOrientation:(int64_t)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5
{
  CGFloat height;
  double width;
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  __n128 v10;
  uint64_t v11;
  double v12;
  double result;

  height = a4.height;
  width = a4.width;
  v7 = EKUIWindowSizeParadigmForWindowSize(a4.width);
  v11 = v7;
  if (v7 > 0x1FFFFFF)
  {
    if (v7 == 0x2000000 || v7 == 0x20000000)
    {
      v12 = 150.0;
      return CalRoundToScreenScale(v7, v8, v12);
    }
  }
  else if (v7 == 0x80000 || v7 == 0x800000)
  {
    v12 = 142.0;
    return CalRoundToScreenScale(v7, v8, v12);
  }
  v9.n128_f64[0] = width;
  v10.n128_f64[0] = height;
  v7 = EKUIWindowInterfaceParadigmForWindowSize(0, v8, v9, v10);
  if (v7 == 8)
  {
    v12 = 106.33;
    return CalRoundToScreenScale(v7, v8, v12);
  }
  if (v11 == 0x2000)
    return 300.0;
  if (qword_1001F66E0 != -1)
    dispatch_once(&qword_1001F66E0, &stru_1001B5C10);
  objc_msgSend((id)qword_1001F66D8, "valueForSize:", width);
  return result;
}

- (double)xInset
{
  return 1.0;
}

- (double)yInset
{
  return 0.0;
}

- (double)headerXAdjust
{
  uint64_t v3;
  double result;

  if (EKUICurrentWindowInterfaceParadigm(self, a2) == 8)
    return CalRoundToScreenScale(8, v3, 1.67);
  if (qword_1001F66F0 != -1)
    dispatch_once(&qword_1001F66F0, &stru_1001B5C30);
  objc_msgSend((id)qword_1001F66E8, "valueForSize:", AnchoredValueCurrentWindowWidth(self));
  return result;
}

- (double)headerFontMaxSize
{
  char v3;
  uint64_t v4;
  double v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  double result;

  v3 = EKUICurrentWindowInterfaceParadigm(self, a2);
  v5 = 16.0;
  if ((v3 & 0xC) != 0)
    return v5;
  v6 = EKUICurrentWindowSizeParadigmForViewHierarchy(self, v4);
  v5 = 17.0;
  if ((v6 & 6) != 0)
    return v5;
  v8 = EKUICurrentWindowSizeParadigmForViewHierarchy(self, v7);
  v5 = 20.0;
  result = 30.0;
  if (v8 != 0x2000)
    return v5;
  return result;
}

- (double)headerFontMinSize
{
  return 17.0;
}

- (id)headerFont
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010CF40;
  block[3] = &unk_1001B2538;
  block[4] = self;
  if (qword_1001F6700 != -1)
    dispatch_once(&qword_1001F6700, block);
  return (id)qword_1001F66F8;
}

- (double)headerFontKerning
{
  return 0.0;
}

- (id)dayNumberFont
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (!qword_1001F6708)
    goto LABEL_5;
  -[LargeYearMonthView dayTextSize](self, "dayTextSize");
  v4 = v3 - *(double *)&qword_1001F5768;
  if (v4 < 0.0)
    v4 = -v4;
  if (v4 > 0.0001)
  {
LABEL_5:
    -[LargeYearMonthView dayTextSize](self, "dayTextSize");
    qword_1001F5768 = v5;
    -[LargeYearMonthView dayTextSize](self, "dayTextSize");
    v6 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
    v7 = (void *)qword_1001F6708;
    qword_1001F6708 = v6;

  }
  return (id)qword_1001F6708;
}

- (id)todayNumberFont
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (!qword_1001F6710)
    goto LABEL_5;
  -[LargeYearMonthView todayTextSize](self, "todayTextSize");
  v4 = v3 - *(double *)&qword_1001F5770;
  if (v4 < 0.0)
    v4 = -v4;
  if (v4 > 0.0001)
  {
LABEL_5:
    -[LargeYearMonthView todayTextSize](self, "todayTextSize");
    qword_1001F5770 = v5;
    -[LargeYearMonthView todayTextSize](self, "todayTextSize");
    v6 = objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:"));
    v7 = (void *)qword_1001F6710;
    qword_1001F6710 = v6;

  }
  return (id)qword_1001F6710;
}

- (BOOL)_useNewPhonePlusMetricsForSizeParadigm:(unint64_t)a3
{
  int64x2_t v3;

  v3 = vdupq_n_s64(a3);
  return vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_1001A1A90), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_1001A1AA0)))) & 1 | (a3 == 0x20000000);
}

- (double)dayTextSize
{
  uint64_t v3;
  unsigned __int8 v4;
  uint64_t v5;
  double result;
  uint64_t v7;
  void *v8;
  double v9;

  v3 = EKUICurrentWindowSizeParadigmForViewHierarchy(self, a2);
  v4 = -[LargeYearMonthView _useNewPhonePlusMetricsForSizeParadigm:](self, "_useNewPhonePlusMetricsForSizeParadigm:", v3);
  result = 9.0;
  if ((v4 & 1) == 0)
  {
    v7 = EKUICurrentWindowInterfaceParadigm(self, v5);
    result = 8.0;
    if (v7 != 8)
    {
      result = 17.0;
      if (v3 != 0x2000)
      {
        if (qword_1001F6720 != -1)
          dispatch_once(&qword_1001F6720, &stru_1001B5C50);
        v8 = (void *)qword_1001F6718;
        -[LargeYearMonthView viewWidthForSizing](self, "viewWidthForSizing");
        objc_msgSend(v8, "valueForSize:");
        return fmin(v9, 19.5);
      }
    }
  }
  return result;
}

- (double)todayTextSize
{
  uint64_t v3;
  unsigned __int8 v4;
  uint64_t v5;
  double result;
  uint64_t v7;
  void *v8;
  double v9;

  v3 = EKUICurrentWindowSizeParadigmForViewHierarchy(self, a2);
  v4 = -[LargeYearMonthView _useNewPhonePlusMetricsForSizeParadigm:](self, "_useNewPhonePlusMetricsForSizeParadigm:", v3);
  result = 9.0;
  if ((v4 & 1) == 0)
  {
    if (EKUICurrentWindowInterfaceParadigm(self, v5) == 8)
    {
      return CalRoundToScreenScale(8, v7, 7.33333333);
    }
    else
    {
      result = 17.0;
      if (v3 != 0x2000)
      {
        if (qword_1001F6730 != -1)
          dispatch_once(&qword_1001F6730, &stru_1001B5C70);
        v8 = (void *)qword_1001F6728;
        -[LargeYearMonthView viewWidthForSizing](self, "viewWidthForSizing");
        objc_msgSend(v8, "valueForSize:");
        return fmin(v9, 19.5);
      }
    }
  }
  return result;
}

- (double)todayNumberKerning
{
  return 0.0;
}

- (double)circleSize
{
  uint64_t v3;
  double result;
  uint64_t v5;
  void *v6;
  double v7;

  if (EKUICurrentWindowInterfaceParadigm(self, a2) == 8)
    return CalRoundToScreenScale(8, v3, 14.0);
  v5 = EKUICurrentWindowSizeParadigmForViewHierarchy(self, v3);
  result = 28.0;
  if (v5 != 0x2000)
  {
    if (qword_1001F6740 != -1)
      dispatch_once(&qword_1001F6740, &stru_1001B5C90);
    v6 = (void *)qword_1001F6738;
    -[LargeYearMonthView viewWidthForSizing](self, "viewWidthForSizing");
    objc_msgSend(v6, "valueForSize:");
    return fmin(v7, 34.5);
  }
  return result;
}

- (double)todayTextYAdjustment
{
  uint64_t v3;
  double result;
  objc_super v5;

  if (EKUICurrentWindowInterfaceParadigm(self, a2) == 8)
    return CalRoundToScreenScale(8, v3, 1.0);
  v5.receiver = self;
  v5.super_class = (Class)LargeYearMonthView;
  -[LargeYearMonthView todayTextYAdjustment](&v5, "todayTextYAdjustment");
  return result;
}

- (double)circleFrameYAdjustment
{
  uint64_t v3;
  uint64_t v4;
  double result;
  uint64_t v6;
  uint64_t v7;
  double v8;
  void *v9;

  v3 = EKUICurrentWindowSizeParadigmForViewHierarchy(self, a2);
  if (-[LargeYearMonthView _useNewPhonePlusMetricsForSizeParadigm:](self, "_useNewPhonePlusMetricsForSizeParadigm:", v3))
  {
    return 3.0;
  }
  v6 = EKUICurrentWindowInterfaceParadigm(self, v4);
  if (v6 == 8)
  {
    v8 = 2.0;
    return CalRoundToScreenScale(v6, v7, v8);
  }
  if (v3 == 0x2000)
  {
    v8 = -1.0;
    return CalRoundToScreenScale(v6, v7, v8);
  }
  if (qword_1001F6750 != -1)
    dispatch_once(&qword_1001F6750, &stru_1001B5CB0);
  v9 = (void *)qword_1001F6748;
  -[LargeYearMonthView viewWidthForSizing](self, "viewWidthForSizing");
  objc_msgSend(v9, "valueForSize:");
  return result;
}

- (double)circleSizeForDoubleDigit
{
  double result;

  -[LargeYearMonthView circleSize](self, "circleSize");
  return result;
}

- (double)daysXAdjustLeft
{
  return 0.0;
}

- (double)daysYAdjustTop
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double result;
  void *v8;

  v3 = EKUICurrentWindowSizeParadigmForViewHierarchy(self, a2);
  v4 = -[LargeYearMonthView _useNewPhonePlusMetricsForSizeParadigm:](self, "_useNewPhonePlusMetricsForSizeParadigm:", v3);
  if ((_DWORD)v4)
  {
    v6 = 23.5;
    return CalRoundToScreenScale(v4, v5, v6);
  }
  v4 = EKUICurrentWindowInterfaceParadigm(self, v5);
  if (v4 == 8)
  {
    v6 = 18.67;
    return CalRoundToScreenScale(v4, v5, v6);
  }
  if (v3 == 0x2000)
    return 75.0;
  if (qword_1001F6760 != -1)
    dispatch_once(&qword_1001F6760, &stru_1001B5CD0);
  v8 = (void *)qword_1001F6758;
  -[LargeYearMonthView viewWidthForSizing](self, "viewWidthForSizing");
  objc_msgSend(v8, "valueForSize:");
  return result;
}

- (double)xSpacing
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double result;
  void *v8;
  double v9;

  v3 = EKUICurrentWindowSizeParadigmForViewHierarchy(self, a2);
  v4 = -[LargeYearMonthView _useNewPhonePlusMetricsForSizeParadigm:](self, "_useNewPhonePlusMetricsForSizeParadigm:", v3);
  if ((_DWORD)v4)
  {
    v6 = 15.0;
    return CalRoundToScreenScale(v4, v5, v6);
  }
  v4 = EKUICurrentWindowInterfaceParadigm(self, v5);
  if (v4 == 8)
  {
    v6 = 14.0;
    return CalRoundToScreenScale(v4, v5, v6);
  }
  result = 31.0;
  if (v3 != 0x2000)
  {
    if (qword_1001F6770 != -1)
      dispatch_once(&qword_1001F6770, &stru_1001B5CF0);
    v8 = (void *)qword_1001F6768;
    -[LargeYearMonthView viewWidthForSizing](self, "viewWidthForSizing");
    objc_msgSend(v8, "valueForSize:");
    return fmin(v9, 31.0);
  }
  return result;
}

- (double)ySpacing
{
  uint64_t v3;
  double result;
  void *v5;

  if (EKUICurrentWindowInterfaceParadigm(self, a2) == 8)
    return CalRoundToScreenScale(8, v3, 14.33);
  if (EKUICurrentWindowSizeParadigmForViewHierarchy(self, v3) == 0x2000)
    return 30.0;
  if (qword_1001F6780 != -1)
    dispatch_once(&qword_1001F6780, &stru_1001B5D10);
  v5 = (void *)qword_1001F6778;
  -[LargeYearMonthView viewWidthForSizing](self, "viewWidthForSizing");
  objc_msgSend(v5, "valueForSize:");
  return result;
}

- (BOOL)showWeekDayInitials
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localeIdentifier"));
  v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("ar"));

  if ((v5 & 1) != 0)
    return 0;
  else
    return EKUICurrentHeightSizeClassIsRegular(self);
}

- (id)weekDayInitialsFont
{
  void *v3;

  if (qword_1001F6790 != -1)
    dispatch_once(&qword_1001F6790, &stru_1001B5D30);
  v3 = (void *)qword_1001F6788;
  -[LargeYearMonthView viewWidthForSizing](self, "viewWidthForSizing");
  objc_msgSend(v3, "valueForSize:");
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
}

- (double)weekDayInitialsAdjustLeft
{
  double result;

  -[LargeYearMonthView daysXAdjustLeft](self, "daysXAdjustLeft");
  return result;
}

- (double)weekDayInitialsAdjustTop
{
  uint64_t v3;
  double result;
  void *v5;

  if (EKUICurrentWindowInterfaceParadigm(self, a2) == 8)
    return CalRoundToScreenScale(8, v3, 0.0);
  if (EKUICurrentWindowSizeParadigmForViewHierarchy(self, v3) == 0x2000)
    return 50.0;
  if (qword_1001F67A0 != -1)
    dispatch_once(&qword_1001F67A0, &stru_1001B5D50);
  v5 = (void *)qword_1001F6798;
  -[LargeYearMonthView viewWidthForSizing](self, "viewWidthForSizing");
  objc_msgSend(v5, "valueForSize:");
  return result;
}

- (BOOL)shouldAddPreciseInteractivity
{
  return 0;
}

@end
