@implementation UIDateLabel

+ (id)defaultFont
{
  return (id)objc_msgSend(off_1E167A828, "systemFontOfSize:", 14.0);
}

- (void)drawRect:(CGRect)a3
{
  -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIDateLabel drawTextInRect:](self, "drawTextInRect:");
}

- (NSString)_dateString
{
  uint64_t v3;
  void *v4;
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
  void *v20;

  if (self->_forceTimeOnly
    || (-[UIDateLabel timeInterval](self, "timeInterval"), v6 = v5, -[UIDateLabel _today](self, "_today"), v6 >= v7)
    && (-[UIDateLabel timeInterval](self, "timeInterval"), v9 = v8,
                                                           -[UIDateLabel _tomorrow](self, "_tomorrow"),
                                                           v9 < v10))
  {
    objc_msgSend((id)objc_opt_class(), "_timeOnlyDateFormatter");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIDateLabel timeInterval](self, "timeInterval");
    v12 = v11;
    -[UIDateLabel _tomorrow](self, "_tomorrow");
    if (v12 >= v13)
    {
LABEL_10:
      objc_msgSend((id)objc_opt_class(), "_dateFormatter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    -[UIDateLabel timeInterval](self, "timeInterval");
    v15 = v14;
    -[UIDateLabel _yesterday](self, "_yesterday");
    if (v15 >= v16)
    {
      objc_msgSend((id)objc_opt_class(), "_relativeDateFormatter");
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIDateLabel timeInterval](self, "timeInterval");
      v18 = v17;
      -[UIDateLabel _weekdayFormatCutoff](self, "_weekdayFormatCutoff");
      if (v18 < v19)
        goto LABEL_10;
      objc_msgSend((id)objc_opt_class(), "_weekdayDateFormatter");
      v3 = objc_claimAutoreleasedReturnValue();
    }
  }
  v4 = (void *)v3;
  if (!v3)
    goto LABEL_10;
LABEL_11:
  objc_msgSend(v4, "stringFromDate:", self->_date);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v20;
}

- (NSString)timeDesignator
{
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;

  if (-[UIDateLabel use24HourTime](self, "use24HourTime"))
    goto LABEL_2;
  if (!self->_forceTimeOnly)
  {
    -[UIDateLabel timeInterval](self, "timeInterval");
    v9 = v8;
    -[UIDateLabel _tomorrow](self, "_tomorrow");
    if (v9 < v10)
    {
      -[UIDateLabel timeInterval](self, "timeInterval");
      v12 = v11;
      -[UIDateLabel _noon](self, "_noon");
      if (v12 >= v13)
      {
        objc_msgSend((id)objc_opt_class(), "pmString");
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      -[UIDateLabel timeInterval](self, "timeInterval");
      v15 = v14;
      -[UIDateLabel _today](self, "_today");
      if (v15 >= v16)
      {
        objc_msgSend((id)objc_opt_class(), "amString");
        v17 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v3 = (__CFString *)v17;
        return (NSString *)v3;
      }
    }
LABEL_2:
    v3 = &stru_1E16EDF20;
    return (NSString *)v3;
  }
  -[UIDateLabel _calendar](self, "_calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 32, self->_date);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "hour");
  v7 = (void *)objc_opt_class();
  if (v6 < 12)
    objc_msgSend(v7, "amString");
  else
    objc_msgSend(v7, "pmString");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (double)timeInterval
{
  void *v2;
  double v3;
  double v4;

  -[UIDateLabel date](self, "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = v3;

  return v4;
}

- (NSDate)date
{
  return self->_date;
}

- (double)_tomorrow
{
  NSDate *tomorrow;
  NSDate *v4;
  NSDate *v5;
  double result;

  tomorrow = self->_tomorrow;
  if (!tomorrow)
  {
    -[UIDateLabel _dateWithDayDiffFromToday:](self, "_dateWithDayDiffFromToday:", 1);
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_tomorrow;
    self->_tomorrow = v4;

    tomorrow = self->_tomorrow;
  }
  -[NSDate timeIntervalSinceReferenceDate](tomorrow, "timeIntervalSinceReferenceDate");
  return result;
}

- (BOOL)use24HourTime
{
  if (qword_1ECD7B448 != -1)
    dispatch_once(&qword_1ECD7B448, &__block_literal_global_113_2);
  return _MergedGlobals_7_15;
}

- (double)_noon
{
  NSDate *noon;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSDate *v8;
  NSDate *v9;
  double result;

  noon = self->_noon;
  if (!noon)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDateLabel _calendar](self, "_calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:", 30, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setHour:", 12);
    -[UIDateLabel _calendar](self, "_calendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromComponents:", v6);
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v9 = self->_noon;
    self->_noon = v8;

    noon = self->_noon;
  }
  -[NSDate timeIntervalSinceReferenceDate](noon, "timeIntervalSinceReferenceDate");
  return result;
}

- (id)_dateWithDayDiffFromToday:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v5, "setDay:", a3);
  -[UIDateLabel _calendar](self, "_calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDateLabel _todayDate](self, "_todayDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v5, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_calendar
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSCalendar *v7;
  NSCalendar *calendar;

  if (!self->_calendar)
    goto LABEL_3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar calendarIdentifier](self->_calendar, "calendarIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v7 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
    calendar = self->_calendar;
    self->_calendar = v7;

  }
  return self->_calendar;
}

- (double)_today
{
  void *v2;
  double v3;
  double v4;

  -[UIDateLabel _todayDate](self, "_todayDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = v3;

  return v4;
}

- (id)_todayDate
{
  NSDate *today;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSDate *v8;
  NSDate *v9;

  today = self->_today;
  if (!today)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDateLabel _calendar](self, "_calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:", 30, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIDateLabel _calendar](self, "_calendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromComponents:", v6);
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v9 = self->_today;
    self->_today = v8;

    today = self->_today;
  }
  return today;
}

+ (id)_dateFormatter
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  if (qword_1ECD7B448 != -1)
    dispatch_once(&qword_1ECD7B448, &__block_literal_global_113_2);
  v2 = (void *)qword_1ECD7B418;
  if (!qword_1ECD7B418)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLocale:", v4);

    objc_msgSend(v3, "setDateStyle:", 1);
    objc_msgSend(v3, "setTimeStyle:", 0);
    v5 = (void *)qword_1ECD7B418;
    qword_1ECD7B418 = (uint64_t)v3;

    v2 = (void *)qword_1ECD7B418;
  }
  return v2;
}

- (double)_yesterday
{
  NSDate *yesterday;
  NSDate *v4;
  NSDate *v5;
  double result;

  yesterday = self->_yesterday;
  if (!yesterday)
  {
    -[UIDateLabel _dateWithDayDiffFromToday:](self, "_dateWithDayDiffFromToday:", -1);
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_yesterday;
    self->_yesterday = v4;

    yesterday = self->_yesterday;
  }
  -[NSDate timeIntervalSinceReferenceDate](yesterday, "timeIntervalSinceReferenceDate");
  return result;
}

- (double)_weekdayFormatCutoff
{
  NSDate *weekdayFormatCutoff;
  NSDate *v4;
  NSDate *v5;
  double result;

  weekdayFormatCutoff = self->_weekdayFormatCutoff;
  if (!weekdayFormatCutoff)
  {
    -[UIDateLabel _dateWithDayDiffFromToday:](self, "_dateWithDayDiffFromToday:", -6);
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_weekdayFormatCutoff;
    self->_weekdayFormatCutoff = v4;

    weekdayFormatCutoff = self->_weekdayFormatCutoff;
  }
  -[NSDate timeIntervalSinceReferenceDate](weekdayFormatCutoff, "timeIntervalSinceReferenceDate");
  return result;
}

+ (id)amString
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (qword_1ECD7B448 != -1)
    dispatch_once(&qword_1ECD7B448, &__block_literal_global_113_2);
  v3 = (void *)qword_1ECD7B438;
  if (!qword_1ECD7B438)
  {
    objc_msgSend(a1, "_dateFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "AMSymbol");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)qword_1ECD7B438;
    qword_1ECD7B438 = v5;

    v3 = (void *)qword_1ECD7B438;
  }
  return v3;
}

+ (id)_timeOnlyDateFormatter
{
  void *v2;
  id v3;
  void *v4;

  if (qword_1ECD7B448 != -1)
    dispatch_once(&qword_1ECD7B448, &__block_literal_global_113_2);
  v2 = (void *)qword_1ECD7B420;
  if (!qword_1ECD7B420)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v3, "setLocalizedDateFormatFromTemplate:", CFSTR("Jmm"));
    v4 = (void *)qword_1ECD7B420;
    qword_1ECD7B420 = (uint64_t)v3;

    v2 = (void *)qword_1ECD7B420;
  }
  return v2;
}

- (void)setTimeInterval:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIDateLabel setDate:](self, "setDate:", v4);

}

- (void)setDate:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_date, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_date, a3);
    -[UIDateLabel invalidate](self, "invalidate");
  }

}

- (UIDateLabel)initWithFrame:(CGRect)a3
{
  UIDateLabel *v3;
  UIDateLabel *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)UIDateLabel;
  v3 = -[UILabel initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_paddingFromTimeToDesignator = 2.0;
    -[UIDateLabel setShouldRecomputeText:](v3, "setShouldRecomputeText:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_invalidate, 0x1E1761B60, UIApp);
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_invalidate, 0x1E1761BA0, UIApp);
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_invalidate, 0x1E1761BC0, UIApp);
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.141176471, 0.439215686, 0.847058824, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4, "setTextColor:", v6);

    -[UILabel setLineBreakMode:](v4, "setLineBreakMode:", 2);
    v11[0] = objc_opt_class();
    v11[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[UIView registerForTraitChanges:withHandler:](v4, "registerForTraitChanges:withHandler:", v7, &__block_literal_global_658);

  }
  return v4;
}

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double paddingFromTimeToDesignator;
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
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  void *v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  objc_super v53;
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v57[3] = *MEMORY[0x1E0C80C00];
  -[UIDateLabel _recomputeTextIfNecessary](self, "_recomputeTextIfNecessary");
  -[UIDateLabel timeDesignator](self, "timeDesignator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIDateLabel timeDesignatorAppearsBeforeTime](self, "timeDesignatorAppearsBeforeTime");
  v10 = objc_msgSend(v8, "length");
  if (v10)
    v9 ^= objc_msgSend(v8, "_isNaturallyRTL");
  -[UIDateLabel timeDesignatorFont](self, "timeDesignatorFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel textSize](self, "textSize");
  if (v10)
  {
    v13 = v12;
    -[UIDateLabel timeDesignatorSize](self, "timeDesignatorSize");
    paddingFromTimeToDesignator = self->_paddingFromTimeToDesignator;
    v15 = width - v13 - paddingFromTimeToDesignator;
    v17 = v16 + paddingFromTimeToDesignator;
    if (v15 >= v17)
      v18 = v17;
    else
      v18 = width - v13 - paddingFromTimeToDesignator;
    v19 = x + v13 + paddingFromTimeToDesignator;
    v20 = v18 - paddingFromTimeToDesignator;
    if (v17 >= v15)
      v20 = v18;
    v21 = x + v18;
    v22 = paddingFromTimeToDesignator + v21;
    if (v15 >= v17)
    {
      v23 = v21;
    }
    else
    {
      v17 = v15;
      v23 = v22;
    }
    if (v9)
      v24 = v17;
    else
      v24 = v20;
    if (v9)
      v25 = x;
    else
      v25 = v19;
    if (v9)
      v26 = v23;
    else
      v26 = x;
    -[UIView _currentScreenScale](self, "_currentScreenScale");
    v28 = UIRectRoundToScale(v25, y, v24, height, v27);
    v30 = v29;
    -[UIView _currentScreenScale](self, "_currentScreenScale");
    v32 = UIRectRoundToScale(v26, y, v13, height, v31);
  }
  else
  {
    v30 = width;
    v28 = x;
    v35 = height;
    v34 = width;
    v33 = y;
    v32 = x;
  }
  v53.receiver = self;
  v53.super_class = (Class)UIDateLabel;
  -[UILabel drawTextInRect:](&v53, sel_drawTextInRect_, v32, v33, v34, v35);
  if (v10)
  {
    -[UILabel _drawingRectForBounds:](self, "_drawingRectForBounds:", x, y, width, height);
    v37 = v36;
    v39 = v38;
    -[UIDateLabel _stringDrawingContext](self, "_stringDrawingContext");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_alloc_init((Class)off_1E1679BC0);
    objc_msgSend(v40, "setLineBreakMode:", 2);
    -[UILabel shadowColor](self, "shadowColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled") && v41)
    {
      -[UILabel shadowOffset](self, "shadowOffset");
      v43 = *(_QWORD *)off_1E1678D90;
      v44 = *(_QWORD *)off_1E1678D98;
      v45 = *(_QWORD *)off_1E1678F98;
      if (v46 == 0.0 && v42 == 0.0)
      {
        v47 = v11;
      }
      else
      {
        v56[0] = *(_QWORD *)off_1E1678D90;
        v56[1] = v44;
        v47 = v11;
        v57[0] = v11;
        v57[1] = v41;
        v56[2] = v45;
        v57[2] = v40;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 3);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "drawWithRect:options:attributes:context:", 65, v48, v52, v28, v37, v30, v39);

      }
    }
    else
    {
      v47 = v11;
      v43 = *(_QWORD *)off_1E1678D90;
      v44 = *(_QWORD *)off_1E1678D98;
      v45 = *(_QWORD *)off_1E1678F98;
    }
    -[UILabel currentTextColor](self, "currentTextColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "set");

    v55[0] = v47;
    v54[0] = v43;
    v54[1] = v44;
    -[UILabel currentTextColor](self, "currentTextColor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v54[2] = v45;
    v55[1] = v50;
    v55[2] = v40;
    v11 = v47;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "drawWithRect:options:attributes:context:", 65, v51, v52, v28, v37, v30, v39);
  }

}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIDateLabel _recomputeTextIfNecessary](self, "_recomputeTextIfNecessary");
  v14.receiver = self;
  v14.super_class = (Class)UIDateLabel;
  -[UILabel _intrinsicSizeWithinSize:](&v14, sel__intrinsicSizeWithinSize_, width, height);
  v7 = v6;
  v9 = v8;
  -[UIDateLabel timeDesignatorSize](self, "timeDesignatorSize");
  if (v10 != 0.0)
    v7 = v7 + v10 + self->_paddingFromTimeToDesignator;
  v12 = ceil(v7);
  if (v9 >= v11)
    v11 = v9;
  v13 = ceil(v11);
  result.height = v13;
  result.width = v12;
  return result;
}

- (id)text
{
  objc_super v4;

  -[UIDateLabel _recomputeTextIfNecessary](self, "_recomputeTextIfNecessary");
  v4.receiver = self;
  v4.super_class = (Class)UIDateLabel;
  -[UILabel text](&v4, sel_text);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_recomputeTextIfNecessary
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  if (-[UIDateLabel shouldRecomputeText](self, "shouldRecomputeText"))
  {
    -[UIDateLabel _dateString](self, "_dateString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self, "setText:", v3);
    v4 = -[UIDateLabel boldForAllLocales](self, "boldForAllLocales");
    v9.receiver = self;
    v9.super_class = (Class)UIDateLabel;
    -[UILabel font](&v9, sel_font);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (((v4 ^ ((objc_msgSend(v5, "traits") & 2) == 0)) & 1) == 0)
    {
      objc_msgSend(v5, "familyName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        v7 = 2;
      else
        v7 = 0;
      objc_msgSend(v5, "pointSize");
      objc_msgSend(off_1E167A828, "fontWithFamilyName:traits:size:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[UILabel setFont:](self, "setFont:", v8);
    }
    -[UIDateLabel setShouldRecomputeText:](self, "setShouldRecomputeText:", 0);
    -[UIDateLabel _didUpdateDate](self, "_didUpdateDate");

  }
}

- (BOOL)shouldRecomputeText
{
  return self->_shouldRecomputeText;
}

- (CGSize)timeDesignatorSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  _QWORD v17[2];
  CGSize result;

  v17[1] = *MEMORY[0x1E0C80C00];
  -[UIDateLabel timeDesignator](self, "timeDesignator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "pmString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIDateLabel timeDesignatorFont](self, "timeDesignatorFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)off_1E1678D90;
    v17[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_class();
    if (v3 == v4)
      objc_msgSend(v7, "pmString");
    else
      objc_msgSend(v7, "amString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDateLabel _stringDrawingContext](self, "_stringDrawingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 65, v6, v11, 3.40282347e38, 3.40282347e38);
    v8 = v12;
    v9 = v13;

  }
  else
  {
    v8 = *MEMORY[0x1E0C9D820];
    v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v14 = v8;
  v15 = v9;
  result.height = v15;
  result.width = v14;
  return result;
}

- (id)font
{
  id v3;
  objc_super v5;

  v3 = -[UIDateLabel text](self, "text");
  v5.receiver = self;
  v5.super_class = (Class)UIDateLabel;
  -[UILabel font](&v5, sel_font);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)invalidate
{
  NSCalendar *calendar;
  NSDate *yesterday;
  NSDate *today;
  NSDate *noon;
  NSDate *tomorrow;
  NSDate *weekdayFormatCutoff;

  calendar = self->_calendar;
  self->_calendar = 0;

  yesterday = self->_yesterday;
  self->_yesterday = 0;

  today = self->_today;
  self->_today = 0;

  noon = self->_noon;
  self->_noon = 0;

  tomorrow = self->_tomorrow;
  self->_tomorrow = 0;

  weekdayFormatCutoff = self->_weekdayFormatCutoff;
  self->_weekdayFormatCutoff = 0;

  -[UIDateLabel setShouldRecomputeText:](self, "setShouldRecomputeText:", 1);
  -[UILabel setNeedsDisplay](self, "setNeedsDisplay");
  -[UILabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setShouldRecomputeText:(BOOL)a3
{
  self->_shouldRecomputeText = a3;
}

- (BOOL)boldForAllLocales
{
  return self->_boldForAllLocales;
}

- (id)_stringDrawingContext
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIDateLabel;
  -[UILabel _stringDrawingContext](&v4, sel__stringDrawingContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCachesLayout:", 0);
  return v2;
}

- (BOOL)timeDesignatorAppearsBeforeTime
{
  if (qword_1ECD7B448 != -1)
    dispatch_once(&qword_1ECD7B448, &__block_literal_global_113_2);
  return byte_1ECD7B411;
}

+ (id)pmString
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (qword_1ECD7B448 != -1)
    dispatch_once(&qword_1ECD7B448, &__block_literal_global_113_2);
  v3 = (void *)qword_1ECD7B440;
  if (!qword_1ECD7B440)
  {
    objc_msgSend(a1, "_dateFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PMSymbol");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)qword_1ECD7B440;
    qword_1ECD7B440 = v5;

    v3 = (void *)qword_1ECD7B440;
  }
  return v3;
}

uint64_t __29__UIDateLabel_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShouldRecomputeText:", 1);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 0x1E1761B60;
  v6[1] = 0x1E1761BA0;
  v6[2] = 0x1E1761BC0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)UIDateLabel;
  -[UILabel dealloc](&v5, sel_dealloc);
}

- (void)setForceTimeOnly:(BOOL)a3
{
  if (self->_forceTimeOnly != a3)
  {
    self->_forceTimeOnly = a3;
    -[UIDateLabel setShouldRecomputeText:](self, "setShouldRecomputeText:", 1);
    -[UILabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setBoldForAllLocales:(BOOL)a3
{
  if (self->_boldForAllLocales != a3)
  {
    self->_boldForAllLocales = a3;
    -[UIDateLabel setShouldRecomputeText:](self, "setShouldRecomputeText:", 1);
    -[UILabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

+ (id)_relativeDateFormatter
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  if (qword_1ECD7B448 != -1)
    dispatch_once(&qword_1ECD7B448, &__block_literal_global_113_2);
  v2 = (void *)qword_1ECD7B428;
  if (!qword_1ECD7B428)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLocale:", v4);

    objc_msgSend(v3, "setDateStyle:", 1);
    objc_msgSend(v3, "setTimeStyle:", 0);
    objc_msgSend(v3, "setDoesRelativeDateFormatting:", 1);
    v5 = (void *)qword_1ECD7B428;
    qword_1ECD7B428 = (uint64_t)v3;

    v2 = (void *)qword_1ECD7B428;
  }
  return v2;
}

+ (id)_weekdayDateFormatter
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if (qword_1ECD7B448 != -1)
    dispatch_once(&qword_1ECD7B448, &__block_literal_global_113_2);
  v2 = (void *)qword_1ECD7B430;
  if (!qword_1ECD7B430)
  {
    v3 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateFormatFromTemplate:options:locale:", CFSTR("cccc"), 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v6, "setDateFormat:", v5);
    v7 = (void *)qword_1ECD7B430;
    qword_1ECD7B430 = (uint64_t)v6;

    v2 = (void *)qword_1ECD7B430;
  }
  return v2;
}

- (BOOL)forceTimeOnly
{
  return self->_forceTimeOnly;
}

- (double)paddingFromTimeToDesignator
{
  return self->_paddingFromTimeToDesignator;
}

- (void)setPaddingFromTimeToDesignator:(double)a3
{
  self->_paddingFromTimeToDesignator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_weekdayFormatCutoff, 0);
  objc_storeStrong((id *)&self->_tomorrow, 0);
  objc_storeStrong((id *)&self->_noon, 0);
  objc_storeStrong((id *)&self->_today, 0);
  objc_storeStrong((id *)&self->_yesterday, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
