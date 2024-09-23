@implementation PaletteWeekdayHeaderView

- (PaletteWeekdayHeaderView)initWithFrame:(CGRect)a3
{
  PaletteWeekdayHeaderView *v3;
  uint64_t v4;
  NSMutableArray *weekdayLabels;
  UIView *v6;
  UIView *weekdayView;
  uint64_t v8;
  UIFont *weekdaysFont;
  unint64_t v10;
  uint64_t v11;
  WeekPaletteTappableDay *v12;
  UIFont *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PaletteWeekdayHeaderView;
  v3 = -[PaletteWeekdayHeaderView initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    weekdayLabels = v3->_weekdayLabels;
    v3->_weekdayLabels = (NSMutableArray *)v4;

    v6 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 24.0);
    weekdayView = v3->_weekdayView;
    v3->_weekdayView = v6;

    v8 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 11.0, UIFontWeightSemibold));
    weekdaysFont = v3->_weekdaysFont;
    v3->_weekdaysFont = (UIFont *)v8;

    v10 = HKDaysInAWeek;
    if (HKDaysInAWeek)
    {
      v11 = HKDaysInAWeek;
      do
      {
        v12 = objc_alloc_init(WeekPaletteTappableDay);
        v13 = v3->_weekdaysFont;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
        -[WeekPaletteTappableDay setFont:textColor:](v12, "setFont:textColor:", v13, v14);

        -[NSMutableArray addObject:](v3->_weekdayLabels, "addObject:", v12);
        -[UIView addSubview:](v3->_weekdayView, "addSubview:", v12);

        --v11;
      }
      while (v11);
    }
    -[PaletteWeekdayHeaderView addSubview:](v3, "addSubview:", v3->_weekdayView);
    v15 = objc_alloc_init((Class)NSDateFormatter);
    if (-[PaletteWeekdayHeaderView _shouldUseVeryShortWeekdays](v3, "_shouldUseVeryShortWeekdays"))
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "veryShortWeekdaySymbols"));
    else
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "shortWeekdaySymbols"));
    v17 = (void *)v16;
    v18 = HKFirstDayOfWeekForWeeklyGoalCalculations();
    if (v10)
    {
      v19 = v18;
      for (i = 0; i != v10; ++i)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v3->_weekdayLabels, "objectAtIndexedSubscript:", i));
        objc_msgSend(v21, "setIndex:", (v19 + i) % v10);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", (v19 + i - 1) % v10));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "weekDayLabel"));
        objc_msgSend(v23, "setText:", v22);

      }
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[PaletteWeekdayHeaderView highlightWeekdayLabelForDateAndSetDay:](v3, "highlightWeekdayLabelForDateAndSetDay:", v24);

  }
  return v3;
}

- (void)adjustWeekLabelsByOffset:(int64_t)a3
{
  NSMutableArray *i;
  void *v6;
  id v7;
  NSMutableArray *weekdayLabels;
  void *v9;
  NSMutableArray *v10;
  void *v11;

  for (i = self->_weekdayLabels; ; i = self->_weekdayLabels)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](i, "firstObject"));
    v7 = objc_msgSend(v6, "index");

    if (v7 == (id)2)
      break;
    weekdayLabels = self->_weekdayLabels;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](weekdayLabels, "lastObject"));
    -[NSMutableArray insertObject:atIndex:](weekdayLabels, "insertObject:atIndex:", v9, 0);

    -[NSMutableArray removeLastObject](self->_weekdayLabels, "removeLastObject");
  }
  if (a3 >= 1)
  {
    do
    {
      v10 = self->_weekdayLabels;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v10, "lastObject"));
      -[NSMutableArray insertObject:atIndex:](v10, "insertObject:atIndex:", v11, 0);

      -[NSMutableArray removeLastObject](self->_weekdayLabels, "removeLastObject");
      --a3;
    }
    while (a3);
  }
  -[PaletteWeekdayHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_shouldUseVeryShortWeekdays
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "languageCode"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ar")) ^ 1;

  return v4;
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PaletteWeekdayHeaderView;
  -[PaletteWeekdayHeaderView layoutSubviews](&v7, "layoutSubviews");
  v3 = HKDaysInAWeek;
  if (HKDaysInAWeek)
  {
    v4 = 0;
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_weekdayLabels, "objectAtIndexedSubscript:", v4));
      if (-[PaletteWeekdayHeaderView _shouldUseVeryShortWeekdays](self, "_shouldUseVeryShortWeekdays"))
        v6 = 20.0;
      else
        v6 = 40.0;
      -[PaletteWeekdayHeaderView centerXForElementAt:width:percent:](self, "centerXForElementAt:width:percent:", v4, v6, 0.0);
      objc_msgSend(v5, "setFrame:");

      ++v4;
    }
    while (v3 != v4);
  }
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
  if (!a3)
  {
    -[WeekPaletteTappableDay setCircleHidden:updateCircleColor:](self->_highlightedDay, "setCircleHidden:updateCircleColor:", 1, 0);
    -[WeekPaletteTappableDay setTextColorHighlighted:](self->_markedAsTodayDay, "setTextColorHighlighted:", 0);
  }
}

- (void)highlightWeekdayLabelForDateAndSetDay:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  WeekPaletteTappableDay *v13;
  WeekPaletteTappableDay *markedAsTodayDay;
  id v15;
  id v16;

  v4 = a3;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = objc_msgSend(v16, "component:fromDate:", 512, v4);
  v6 = HKDaysInAWeek;
  v7 = v6 - HKFirstDayOfWeekForWeeklyGoalCalculations();
  v8 = ((uint64_t)v5 + v7) % 7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v16, "setFirstWeekday:", HKFirstDayOfWeekForWeeklyGoalCalculations());
  v10 = objc_msgSend(v16, "isDate:equalToDate:toUnitGranularity:", v4, v9, 0x2000);
  v15 = objc_msgSend(v16, "component:fromDate:", 512, v9);
  v11 = objc_msgSend(v16, "isDate:inSameDayAsDate:", v4, v9);

  -[WeekPaletteTappableDay setCircleHidden:updateCircleColor:](self->_highlightedDay, "setCircleHidden:updateCircleColor:", 1, v11);
  -[WeekPaletteTappableDay setTextColorHighlighted:](self->_markedAsTodayDay, "setTextColorHighlighted:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_weekdayLabels, "objectAtIndexedSubscript:", v8));
  objc_msgSend(v12, "setCircleHidden:updateCircleColor:", 0, v11);
  objc_storeStrong((id *)&self->_highlightedDay, v12);
  if ((v11 & 1) == 0 && v10)
  {
    v13 = (WeekPaletteTappableDay *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_weekdayLabels, "objectAtIndexedSubscript:", ((uint64_t)v15 + v7) % 7));
    -[WeekPaletteTappableDay setTextColorHighlighted:](v13, "setTextColorHighlighted:", 1);
    markedAsTodayDay = self->_markedAsTodayDay;
    self->_markedAsTodayDay = v13;

  }
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markedAsTodayDay, 0);
  objc_storeStrong((id *)&self->_highlightedDay, 0);
  objc_storeStrong((id *)&self->_weekdayLabels, 0);
  objc_storeStrong((id *)&self->_weekdayView, 0);
  objc_storeStrong((id *)&self->_weekdaysFont, 0);
}

@end
