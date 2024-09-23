@implementation CompactYearMonthView

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  if (qword_1001F63B8 != -1)
    dispatch_once(&qword_1001F63B8, &stru_1001B4D08);
  objc_msgSend((id)qword_1001F63B0, "valueForSize:", EKUICurrentWindowSize(self));
  v5 = v4;
  v6 = EKUICurrentWindowSize(self);
  v7 = EKUIWindowSizeParadigmForWindowSize(v6);
  if (v7 == 0x400000)
  {
    *(double *)&v5 = 110.0;
  }
  else if (v7 == 0x1000000)
  {
    *(double *)&v5 = 122.0;
  }
  v8 = EKUIInterfaceOrientationForViewHierarchy(self);
  objc_opt_class(self);
  v10 = v9;
  v11 = EKUICurrentWindowSize(self);
  objc_msgSend(v10, "heightForInterfaceOrientation:windowSize:heightSizeClass:", v8, EKUIHeightSizeClassForViewHierarchy(self), v11, v12);
  v14 = v13;
  v15 = *(double *)&v5;
  result.height = v14;
  result.width = v15;
  return result;
}

+ (double)heightForInterfaceOrientation:(int64_t)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5
{
  double width;
  uint64_t v6;
  double result;

  width = a4.width;
  if (qword_1001F63C8 != -1)
    dispatch_once(&qword_1001F63C8, &stru_1001B4D28);
  v6 = EKUIWindowSizeParadigmForWindowSize(width);
  if (v6 > 0xFFFFFF)
  {
    switch(v6)
    {
      case 0x1000000:
        return 161.0;
      case 0x4000000:
        return 150.0;
      case 0x10000000:
        return 165.0;
    }
  }
  else
  {
    switch(v6)
    {
      case 0x20000:
        return 138.0;
      case 0x40000:
        return 147.0;
      case 0x400000:
        return 148.0;
    }
  }
  objc_msgSend((id)qword_1001F63C0, "valueForSize:", width);
  return result;
}

- (CGRect)frameForGridOfDays:(BOOL)a3
{
  _BOOL4 v3;
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
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect result;

  v3 = a3;
  -[CompactYearMonthView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CompactYearMonthView daysYAdjustTop](self, "daysYAdjustTop");
  v12 = v11;
  -[CompactYearMonthView yInset](self, "yInset");
  v14 = v8 + v12 + v13 + -1.5;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CompactYearMonthView calendar](self, "calendar"));
  v16 = objc_msgSend(v15, "copy");

  objc_msgSend(v16, "setFirstWeekday:", CUIKOneIndexedWeekStart(v17));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CompactYearMonthView calendarDate](self, "calendarDate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "date"));
  objc_msgSend(v16, "rangeOfUnit:inUnit:forDate:", 4096, 8, v19);
  v21 = v20;

  -[CompactYearMonthView ySpacing](self, "ySpacing");
  v23 = v22 * (double)v21;
  if (v3)
  {
    -[CompactYearMonthView _gridOfDaysYAdjustment](self, "_gridOfDaysYAdjustment");
    v14 = v14 + v24;
    -[CompactYearMonthView _gridOfDaysHeightAdjustment](self, "_gridOfDaysHeightAdjustment");
    v23 = v23 + v25;
  }

  v26 = v6;
  v27 = v14;
  v28 = v10;
  v29 = v23;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (double)_gridOfDaysYAdjustment
{
  void *v3;
  double result;

  if (qword_1001F63D8 != -1)
    dispatch_once(&qword_1001F63D8, &stru_1001B4D48);
  v3 = (void *)qword_1001F63D0;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  return result;
}

- (double)_gridOfDaysHeightAdjustment
{
  void *v3;
  double result;

  if (qword_1001F63E8 != -1)
    dispatch_once(&qword_1001F63E8, &stru_1001B4D68);
  v3 = (void *)qword_1001F63E0;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  return result;
}

- (double)xInset
{
  void *v3;
  double result;

  if (qword_1001F63F8 != -1)
    dispatch_once(&qword_1001F63F8, &stru_1001B4D88);
  v3 = (void *)qword_1001F63F0;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  return result;
}

- (double)yInset
{
  return 0.0;
}

- (double)headerXAdjust
{
  return -3.0;
}

- (double)headerFontMaxSize
{
  char v2;
  double result;

  v2 = EKUICurrentWindowSizeParadigmForViewHierarchy(self, a2);
  result = 17.0;
  if ((v2 & 6) == 0)
    return 20.0;
  return result;
}

- (double)headerFontMinSize
{
  return 11.0;
}

- (id)headerFont
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)qword_1001F6400;
  if (!qword_1001F6400)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleTitle3, 32770, 0));
    -[CompactYearMonthView headerFontMaxSize](self, "headerFontMaxSize");
    v5 = objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v4));
    v6 = (void *)qword_1001F6400;
    qword_1001F6400 = v5;

    v3 = (void *)qword_1001F6400;
  }
  return v3;
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

  if (!qword_1001F6408)
    goto LABEL_5;
  -[CompactYearMonthView dayTextSize](self, "dayTextSize");
  v4 = v3 - *(double *)&qword_1001F4CD0;
  if (v4 < 0.0)
    v4 = -v4;
  if (v4 > 0.0001)
  {
LABEL_5:
    -[CompactYearMonthView dayTextSize](self, "dayTextSize");
    qword_1001F4CD0 = v5;
    -[CompactYearMonthView dayTextSize](self, "dayTextSize");
    v6 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
    v7 = (void *)qword_1001F6408;
    qword_1001F6408 = v6;

  }
  return (id)qword_1001F6408;
}

- (id)todayNumberFont
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (!qword_1001F6410)
    goto LABEL_5;
  -[CompactYearMonthView todayTextSize](self, "todayTextSize");
  v4 = v3 - *(double *)&qword_1001F4CD8;
  if (v4 < 0.0)
    v4 = -v4;
  if (v4 > 0.0001)
  {
LABEL_5:
    -[CompactYearMonthView todayTextSize](self, "todayTextSize");
    qword_1001F4CD8 = v5;
    -[CompactYearMonthView todayTextSize](self, "todayTextSize");
    v6 = objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:"));
    v7 = (void *)qword_1001F6410;
    qword_1001F6410 = v6;

  }
  return (id)qword_1001F6410;
}

- (double)dayTextSize
{
  void *v3;
  double result;

  if (qword_1001F6420 != -1)
    dispatch_once(&qword_1001F6420, &stru_1001B4DA8);
  v3 = (void *)qword_1001F6418;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  return result;
}

- (double)todayTextSize
{
  void *v3;
  double result;

  if (qword_1001F6430 != -1)
    dispatch_once(&qword_1001F6430, &stru_1001B4DC8);
  v3 = (void *)qword_1001F6428;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  return result;
}

- (double)circleSize
{
  void *v3;
  double result;

  if (qword_1001F6440 != -1)
    dispatch_once(&qword_1001F6440, &stru_1001B4DE8);
  v3 = (void *)qword_1001F6438;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  return result;
}

- (double)circleSizeForDoubleDigit
{
  double result;

  -[CompactYearMonthView circleSize](self, "circleSize");
  return result;
}

- (double)daysXAdjustLeft
{
  return -5.0;
}

- (double)daysYAdjustTop
{
  void *v4;
  double v5;

  if (qword_1001F6450 != -1)
    dispatch_once(&qword_1001F6450, &stru_1001B4E08);
  if (EKUICurrentWindowSizeParadigmForViewHierarchy(self, a2) == 0x20000)
    return 32.0;
  v4 = (void *)qword_1001F6448;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v4, "valueForSize:");
  return v5 + 3.0;
}

- (double)xSpacing
{
  void *v3;
  double result;

  if (qword_1001F6460 != -1)
    dispatch_once(&qword_1001F6460, &stru_1001B4E28);
  v3 = (void *)qword_1001F6458;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  return result;
}

- (double)ySpacing
{
  void *v3;
  double result;

  if (qword_1001F6470 != -1)
    dispatch_once(&qword_1001F6470, &stru_1001B4E48);
  v3 = (void *)qword_1001F6468;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  return result;
}

- (double)dayNumberKerning
{
  void *v3;
  double result;

  if (qword_1001F6480 != -1)
    dispatch_once(&qword_1001F6480, &stru_1001B4E68);
  v3 = (void *)qword_1001F6478;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  return result;
}

- (double)todayNumberKerning
{
  void *v3;
  double result;

  if (qword_1001F6490 != -1)
    dispatch_once(&qword_1001F6490, &stru_1001B4E88);
  v3 = (void *)qword_1001F6488;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  return result;
}

- (BOOL)showWeekDayInitials
{
  return 0;
}

- (id)weekDayInitialsFont
{
  return 0;
}

- (double)weekDayInitialsAdjustLeft
{
  return 0.0;
}

- (double)weekDayInitialsAdjustTop
{
  return 0.0;
}

- (double)circleFrameYAdjustment
{
  void *v3;
  double result;

  if (qword_1001F64A0 != -1)
    dispatch_once(&qword_1001F64A0, &stru_1001B4EA8);
  v3 = (void *)qword_1001F6498;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  return result;
}

- (BOOL)shouldAddPreciseInteractivity
{
  return 0;
}

@end
