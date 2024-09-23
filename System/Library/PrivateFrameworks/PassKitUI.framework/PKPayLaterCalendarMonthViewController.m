@implementation PKPayLaterCalendarMonthViewController

- (PKPayLaterCalendarMonthViewController)initWithInstallmentsMonthPresenter:(id)a3 installmentPresenter:(id)a4 paymentIntentController:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKHorizontalScrollingChildLayout *v12;
  PKPayLaterCalendarMonthViewController *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSCalendar *calendar;
  PKDashboardTitleHeaderView *v18;
  uint64_t v19;
  PKDashboardTitleHeaderView *sampleHeaderView;
  NSDateFormatter *v21;
  NSDateFormatter *weekdayFormatter;
  NSDateFormatter *v23;
  void *v24;
  NSDateFormatter *v25;
  NSDateFormatter *dayFormatter;
  NSDateFormatter *v27;
  void *v28;
  NSDateFormatter *v29;
  NSDateFormatter *monthYearFormatter;
  NSDateFormatter *v31;
  void *v32;
  objc_super v34;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc_init(PKHorizontalScrollingChildLayout);
  v34.receiver = self;
  v34.super_class = (Class)PKPayLaterCalendarMonthViewController;
  v13 = -[PKPayLaterCalendarMonthViewController initWithCollectionViewLayout:](&v34, sel_initWithCollectionViewLayout_, v12);
  if (v13)
  {
    -[PKHorizontalScrollingChildLayout setDataSource:](v12, "setDataSource:", v13);
    objc_storeStrong((id *)&v13->_installmentsMonthPresenter, a3);
    objc_storeStrong((id *)&v13->_installmentPresenter, a4);
    objc_storeStrong((id *)&v13->_paymentIntentController, a5);
    objc_storeStrong((id *)&v13->_layout, v12);
    v14 = PKIsLowEndDevice();
    v13->_isLowEndDevice = v14;
    -[PKHorizontalScrollingChildLayout setIsLowEndDevice:](v13->_layout, "setIsLowEndDevice:", v14);
    v15 = *MEMORY[0x1E0C996C8];
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v16 = objc_claimAutoreleasedReturnValue();
    calendar = v13->_calendar;
    v13->_calendar = (NSCalendar *)v16;

    v18 = [PKDashboardTitleHeaderView alloc];
    v19 = -[PKDashboardTitleHeaderView initWithFrame:](v18, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sampleHeaderView = v13->_sampleHeaderView;
    v13->_sampleHeaderView = (PKDashboardTitleHeaderView *)v19;

    v21 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    weekdayFormatter = v13->_weekdayFormatter;
    v13->_weekdayFormatter = v21;

    v23 = v13->_weekdayFormatter;
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](v23, "setCalendar:", v24);

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v13->_weekdayFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("EEEEE"));
    -[NSDateFormatter setCalendar:](v13->_weekdayFormatter, "setCalendar:", v13->_calendar);
    v25 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dayFormatter = v13->_dayFormatter;
    v13->_dayFormatter = v25;

    v27 = v13->_dayFormatter;
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v15);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](v27, "setCalendar:", v28);

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v13->_dayFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("d"));
    -[NSDateFormatter setCalendar:](v13->_dayFormatter, "setCalendar:", v13->_calendar);
    v29 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    monthYearFormatter = v13->_monthYearFormatter;
    v13->_monthYearFormatter = v29;

    v31 = v13->_monthYearFormatter;
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v15);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](v31, "setCalendar:", v32);

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v13->_monthYearFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM yyyy"));
    -[NSDateFormatter setCalendar:](v13->_monthYearFormatter, "setCalendar:", v13->_calendar);
  }

  return v13;
}

- (id)footer
{
  return 0;
}

- (void)setData:(id)a3 swap:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[PKPayLaterCalendarMonthViewController setInstallmentsMonth:swap:](self, "setInstallmentsMonth:swap:", v6, v4);

}

- (id)data
{
  return self->_installmentsMonth;
}

- (void)setVisible:(BOOL)a3
{
  if (self->_visible != a3)
  {
    self->_visible = a3;
    -[PKHorizontalScrollingChildLayout setVisible:](self->_layout, "setVisible:");
  }
}

- (void)setAlphaTransition:(double)a3
{
  float v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double alphaTransition;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_alphaTransition != a3)
  {
    self->_alphaTransition = a3;
    -[PKHorizontalScrollingChildLayout setAlphaTransition:](self->_layout, "setAlphaTransition:");
    v4 = 0.0;
    v5 = 0.0;
    if (!self->_isLowEndDevice && self->_visible)
    {
      alphaTransition = self->_alphaTransition;
      v5 = 20.0;
      if (alphaTransition < 0.2)
        v4 = (alphaTransition / -0.2 + 1.0) * 0.15;
    }
    -[PKPayLaterCalendarMonthViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v6, "indexPathsForVisibleItems", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "section");
          objc_msgSend(v6, "cellForItemAtIndexPath:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v13)
          {

            goto LABEL_13;
          }
          objc_msgSend(v14, "layer");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v17 = v4;
          objc_msgSend(v16, "setShadowOpacity:", v17);
          objc_msgSend(v16, "setShadowRadius:", v5);
          objc_msgSend(v16, "setMasksToBounds:", 0);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (void)setContentInsetAdjustmentBehavior:(int64_t)a3
{
  self->_contentInsetAdjustmentBehavior = a3;
}

- (double)alphaForIndexPath:(id)a3 visible:(BOOL)a4 transition:(double)a5
{
  double result;
  uint64_t v7;

  result = 0.0;
  if (a4)
  {
    v7 = objc_msgSend(a3, "section", 0.0);
    result = 1.0;
    if (v7 > 0)
      return a5;
  }
  return result;
}

- (double)lineSpacingForSection:(int64_t)a3
{
  return 0.0;
}

- (unsigned)horizontalAlignmentForSection:(int64_t)a3
{
  return 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PKPayLaterCalendarMonthViewController scrollingDelegate](self, "scrollingDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "horizontalScrollingChildViewController:scrollViewDidScroll:", self, v6);

}

- (void)setInstallmentsMonth:(id)a3 swap:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  PKPayLaterInstallmentsMonth *installmentsMonth;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  PKDashboardPayLaterInstallmentsMonthItem *v14;
  PKPayLaterInstallmentsMonthPresenter *installmentsMonthPresenter;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;

  v4 = a4;
  v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    installmentsMonth = self->_installmentsMonth;
    -[PKPayLaterCalendarMonthViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (installmentsMonth)
    {
      v10 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __67__PKPayLaterCalendarMonthViewController_setInstallmentsMonth_swap___block_invoke;
      v24[3] = &unk_1E3E61400;
      v24[4] = self;
      v11 = v7;
      v25 = v11;
      v26 = v9;
      v19 = v10;
      v20 = 3221225472;
      v21 = __67__PKPayLaterCalendarMonthViewController_setInstallmentsMonth_swap___block_invoke_2;
      v22 = &unk_1E3E62288;
      v12 = v26;
      v23 = v12;
      objc_msgSend(v12, "performBatchUpdates:completion:", v24, &v19);
      -[PKPayLaterCalendarMonthViewController indexPathForCalendar](self, "indexPathForCalendar", v19, v20, v21, v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PKDashboardPayLaterInstallmentsMonthItem initWithDataSource:appearance:installmentsMonth:]([PKDashboardPayLaterInstallmentsMonthItem alloc], "initWithDataSource:appearance:installmentsMonth:", self, self, v11);
      installmentsMonthPresenter = self->_installmentsMonthPresenter;
      objc_msgSend(v12, "cellForItemAtIndexPath:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        -[PKPayLaterInstallmentsMonthPresenter swapInstallmentsMonthInCell:forItem:inCollectionView:atIndexPath:](installmentsMonthPresenter, "swapInstallmentsMonthInCell:forItem:inCollectionView:atIndexPath:", v16, v14, v12, v13);
      else
        -[PKPayLaterInstallmentsMonthPresenter updateCell:forItem:inCollectionView:atIndexPath:](installmentsMonthPresenter, "updateCell:forItem:inCollectionView:atIndexPath:", v16, v14, v12, v13);

      objc_msgSend(v12, "supplementaryViewForElementKind:atIndexPath:", *MEMORY[0x1E0DC48A8], v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterCalendarMonthViewController _configureHeaderView:inSection:](self, "_configureHeaderView:inSection:", v18, 0);

    }
    else
    {
      objc_storeStrong((id *)&self->_installmentsMonth, a3);
      objc_msgSend(v9, "reloadData");
      objc_msgSend(v9, "collectionViewLayout");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "invalidateLayout");

    }
  }

}

void __67__PKPayLaterCalendarMonthViewController_setInstallmentsMonth_swap___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1048), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 1, 2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSections:", v3);

}

void __67__PKPayLaterCalendarMonthViewController_setInstallmentsMonth_swap___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collectionViewLayout");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidateLayout");

}

- (id)indexPathForCalendar
{
  if (_MergedGlobals_1_11 != -1)
    dispatch_once(&_MergedGlobals_1_11, &__block_literal_global_92);
  return (id)qword_1EE4C8488;
}

void __61__PKPayLaterCalendarMonthViewController_indexPathForCalendar__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1EE4C8488;
  qword_1EE4C8488 = v0;

}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)PKPayLaterCalendarMonthViewController;
  -[PKPayLaterCalendarMonthViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[PKPayLaterCalendarMonthViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKPayLaterInstallmentsMonthPresenter collectionViewCellClasses](self->_installmentsMonthPresenter, "collectionViewCellClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);

  -[PKPayLaterInstallmentPresenter collectionViewCellClasses](self->_installmentPresenter, "collectionViewCellClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v6);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11), (_QWORD)v16), *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v9);
  }

  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("cell"));
  v12 = objc_opt_class();
  v13 = *MEMORY[0x1E0DC48A8];
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v12, *MEMORY[0x1E0DC48A8], CFSTR("kMonthTitleIdentifier"));
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), v13, CFSTR("kInstallmentsTitleIdentifier"));
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), v13, CFSTR("kCompletedInstallmentsTitleIdentifier"));
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v3, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v3, "setBounces:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v14);

  objc_msgSend(v3, "setClipsToBounds:", 0);
  objc_msgSend(v3, "setContentInset:", self->_contentInset.top, self->_contentInset.left, self->_contentInset.bottom, self->_contentInset.right);
  objc_msgSend(v3, "setContentInsetAdjustmentBehavior:", self->_contentInsetAdjustmentBehavior);
  -[PKPayLaterCalendarMonthViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setClipsToBounds:", 0);

  objc_msgSend(v3, "setClipsToBounds:", 0);
}

- (unint64_t)numberOfWeeks
{
  NSCalendar *calendar;
  void *v3;
  unint64_t v4;
  unint64_t v5;

  calendar = self->_calendar;
  -[PKPayLaterInstallmentsMonth startDate](self->_installmentsMonth, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar rangeOfUnit:inUnit:forDate:](calendar, "rangeOfUnit:inUnit:forDate:", 4096, 8, v3);
  v5 = v4;

  return v5;
}

- (unint64_t)numberOfDaysInWeek
{
  return 7;
}

- (id)calendarMonthStartDate
{
  void *v2;
  void *v3;

  -[PKPayLaterInstallmentsMonth startDate](self->_installmentsMonth, "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKStartOfWeek();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)calendar
{
  return self->_calendar;
}

- (BOOL)shouldShowDate:(id)a3
{
  PKPayLaterInstallmentsMonth *installmentsMonth;
  id v5;
  void *v6;
  void *v7;
  char IsBetweenDates;

  installmentsMonth = self->_installmentsMonth;
  v5 = a3;
  -[PKPayLaterInstallmentsMonth startDate](installmentsMonth, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterInstallmentsMonth endDate](self->_installmentsMonth, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IsBetweenDates = PKDateIsBetweenDates();

  return IsBetweenDates;
}

- (BOOL)canSelectDate:(id)a3
{
  return 0;
}

- (BOOL)isDateSelected:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[PKPayLaterCalendarMonthViewController shouldShowDate:](self, "shouldShowDate:", v4))
    v5 = objc_msgSend(v4, "isToday");
  else
    v5 = 0;

  return v5;
}

- (id)stringForWeekday:(id)a3
{
  if (!a3)
    return 0;
  -[NSDateFormatter stringFromDate:](self->_weekdayFormatter, "stringFromDate:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stringForDay:(id)a3
{
  if (!a3)
    return 0;
  -[NSDateFormatter stringFromDate:](self->_dayFormatter, "stringFromDate:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)decorationViewForDayView:(id)a3 date:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  __int16 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v5 = a4;
  -[PKPayLaterInstallmentsMonth installmentsDueInDate:](self->_installmentsMonth, "installmentsDueInDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count")
    && -[PKPayLaterCalendarMonthViewController shouldShowDate:](self, "shouldShowDate:", v5))
  {
    if ((objc_msgSend(v6, "pk_containsObjectPassingTest:", &__block_literal_global_36) & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D67018], "totalDueForInstallments:fallbackAmount:", v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9
      && (objc_msgSend(v9, "amount"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "pk_isPositiveNumber"),
          v11,
          (v12 & 1) != 0))
    {
      objc_msgSend(v10, "currency");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PKMutableNumberFormatterForCurrencyCode();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setMaximumFractionDigits:", 0);
      v15 = objc_msgSend(v14, "maximumFractionDigits");
      objc_msgSend(MEMORY[0x1E0CB35A0], "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 0, v15, 0, 0, 0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "amount");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "decimalNumberByRoundingAccordingToBehavior:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_alloc_init(MEMORY[0x1E0DC3990]);
      objc_msgSend(v7, "setTextColor:", v8);
      PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AB8], (NSString *)*MEMORY[0x1E0DC4930]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFont:", v19);

      objc_msgSend(v14, "stringFromNumber:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", v20);
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0DC3888];
      PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AB8], (NSString *)*MEMORY[0x1E0DC48D8]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "configurationWithFont:scale:", v22, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = objc_alloc(MEMORY[0x1E0DC3890]);
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PKPayLaterGreenColor();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "imageWithTintColor:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "imageWithRenderingMode:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v23, "initWithImage:", v20);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

BOOL __71__PKPayLaterCalendarMonthViewController_decorationViewForDayView_date___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "status") == 4;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  if (self->_installmentsMonth)
    return 3;
  else
    return 0;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (a4 == 2)
  {
    -[PKPayLaterInstallmentsMonth paidInstallments](self->_installmentsMonth, "paidInstallments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v9 = v8;
    v7 = objc_msgSend(v8, "count");

    goto LABEL_7;
  }
  if (a4 == 1)
  {
    -[PKPayLaterInstallmentsMonth activeInstallments](self->_installmentsMonth, "activeInstallments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v7 = a4 == 0;
LABEL_7:

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  PKDashboardPayLaterInstallmentsMonthItem *v11;
  void *v12;
  void *v13;
  void *v14;
  double alphaTransition;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 visible;
  void *v21;
  double v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  v9 = objc_msgSend(v7, "section");
  v10 = -[PKPayLaterCalendarMonthViewController collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v6, v9);
  if (v9 == 2)
  {
    -[PKPayLaterInstallmentsMonth paidInstallments](self->_installmentsMonth, "paidInstallments");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (v9 == 1)
  {
    -[PKPayLaterInstallmentsMonth activeInstallments](self->_installmentsMonth, "activeInstallments");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v18 = v17;
    objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[PKPayLaterCalendarMonthViewController _installmentItemForInstallment:](self, "_installmentItemForInstallment:", v16);
      v11 = (PKDashboardPayLaterInstallmentsMonthItem *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterInstallmentPresenter cellForItem:inCollectionView:atIndexPath:](self->_installmentPresenter, "cellForItem:inCollectionView:atIndexPath:", v11, v6, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  if (v9)
  {
    v16 = 0;
    goto LABEL_14;
  }
  v11 = -[PKDashboardPayLaterInstallmentsMonthItem initWithDataSource:appearance:installmentsMonth:]([PKDashboardPayLaterInstallmentsMonthItem alloc], "initWithDataSource:appearance:installmentsMonth:", self, self, self->_installmentsMonth);
  -[PKPayLaterInstallmentsMonthPresenter cellForItem:inCollectionView:atIndexPath:](self->_installmentsMonthPresenter, "cellForItem:inCollectionView:atIndexPath:", v11, v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (self->_isLowEndDevice)
  {
    objc_msgSend(v12, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    visible = self->_visible;
    objc_msgSend(v12, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v21;
    if (visible)
    {
      alphaTransition = self->_alphaTransition;
      if (alphaTransition < 0.2)
      {
        v22 = (alphaTransition / -0.2 + 1.0) * 0.15;
        *(float *)&v22 = v22;
        objc_msgSend(v21, "setShadowOpacity:", v22);
        objc_msgSend(v14, "setShadowRadius:", 20.0);
        objc_msgSend(v14, "setMasksToBounds:", 0);
        goto LABEL_7;
      }
    }
  }
  LODWORD(alphaTransition) = 0;
  objc_msgSend(v14, "setShadowOpacity:", alphaTransition);
  objc_msgSend(v14, "setShadowRadius:", 0.0);
LABEL_7:

  v16 = 0;
LABEL_12:

LABEL_15:
  -[PKPayLaterCalendarMonthViewController _applyMaskToCell:section:firstInSection:lastInSection:](self, "_applyMaskToCell:section:firstInSection:lastInSection:", v13, v9, v8 == 0, v10 == v8 + 1);

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PKPayLaterInstallmentPresenter *installmentPresenter;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "section");
  if (v7 == 2)
  {
    -[PKPayLaterInstallmentsMonth paidInstallments](self->_installmentsMonth, "paidInstallments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v7 != 1)
      goto LABEL_7;
    -[PKPayLaterInstallmentsMonth activeInstallments](self->_installmentsMonth, "activeInstallments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PKPayLaterCalendarMonthViewController _installmentItemForInstallment:](self, "_installmentItemForInstallment:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    installmentPresenter = self->_installmentPresenter;
    -[PKPayLaterCalendarMonthViewController parentViewController](self, "parentViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "navigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterInstallmentPresenter didSelectItem:inCollectionView:atIndexPath:navigationController:canPresent:](installmentPresenter, "didSelectItem:inCollectionView:atIndexPath:navigationController:canPresent:", v11, v15, v6, v14, 0);

  }
LABEL_7:

}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const __CFString *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "section");
  v12 = objc_msgSend(v10, "section");
  if (!v12)
  {
    v14 = CFSTR("kMonthTitleIdentifier");
LABEL_7:
    v15 = v8;
    v13 = v9;
    goto LABEL_8;
  }
  if (v12 == 2)
  {
    v14 = CFSTR("kCompletedInstallmentsTitleIdentifier");
    goto LABEL_7;
  }
  if (v12 != 1)
  {
    v16 = 0;
    goto LABEL_10;
  }
  v13 = (id)*MEMORY[0x1E0DC48A8];
  v14 = CFSTR("kInstallmentsTitleIdentifier");
  v15 = v8;
LABEL_8:
  objc_msgSend(v15, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v13, v14, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  -[PKPayLaterCalendarMonthViewController _configureHeaderView:inSection:](self, "_configureHeaderView:inSection:", v16, v11);

  return v16;
}

- (id)_installmentItemForInstallment:(id)a3
{
  PKPayLaterInstallmentsMonth *installmentsMonth;
  id v5;
  void *v6;
  void *v7;
  PKDashboardFinancingPlanInstallmentItem *v8;
  PKDashboardFinancingPlanInstallmentItem *v9;

  installmentsMonth = self->_installmentsMonth;
  v5 = a3;
  objc_msgSend(v5, "installmentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterInstallmentsMonth financingPlanForInstallmentIdentifier:](installmentsMonth, "financingPlanForInstallmentIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [PKDashboardFinancingPlanInstallmentItem alloc];
  v9 = -[PKDashboardFinancingPlanInstallmentItem initWithFinancingPlan:relevantInstallment:paymentIntentController:pageTag:](v8, "initWithFinancingPlan:relevantInstallment:paymentIntentController:pageTag:", v7, v5, self->_paymentIntentController, *MEMORY[0x1E0D68F68]);

  return v9;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  uint64_t v11;
  PKDashboardPayLaterInstallmentsMonthItem *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  v7 = a3;
  v8 = a5;
  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v11 = objc_msgSend(v8, "section");
  switch(v11)
  {
    case 2:
      -[PKPayLaterInstallmentsMonth paidInstallments](self->_installmentsMonth, "paidInstallments");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[PKPayLaterInstallmentsMonth activeInstallments](self->_installmentsMonth, "activeInstallments");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0:
      v12 = -[PKDashboardPayLaterInstallmentsMonthItem initWithDataSource:appearance:installmentsMonth:]([PKDashboardPayLaterInstallmentsMonthItem alloc], "initWithDataSource:appearance:installmentsMonth:", self, self, self->_installmentsMonth);
      -[PKPayLaterInstallmentsMonthPresenter sizeForItem:inCollectionView:atIndexPath:](self->_installmentsMonthPresenter, "sizeForItem:inCollectionView:atIndexPath:", v12, v7, v8);
      v9 = v13;
      v10 = v14;
LABEL_9:

      goto LABEL_10;
    default:
      goto LABEL_10;
  }
  v16 = v15;
  objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
  v12 = (PKDashboardPayLaterInstallmentsMonthItem *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PKPayLaterCalendarMonthViewController _installmentItemForInstallment:](self, "_installmentItemForInstallment:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterInstallmentPresenter sizeForItem:inCollectionView:atIndexPath:](self->_installmentPresenter, "sizeForItem:inCollectionView:atIndexPath:", v17, v7, v8);
    v9 = v18;
    v10 = v19;

    goto LABEL_9;
  }
LABEL_10:

  v20 = v9;
  v21 = v10;
  result.height = v21;
  result.width = v20;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  v7 = *MEMORY[0x1E0DC49E8];
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v8 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v9 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (objc_msgSend(a3, "numberOfItemsInSection:", a5, a4) && (unint64_t)a5 <= 2)
  {
    v8 = dbl_19DF162A0[a5];
    v9 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
  }
  v10 = v7;
  v11 = v6;
  v12 = v8;
  v13 = v9;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7;
  PKDashboardTitleHeaderView *sampleHeaderView;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v7 = a3;
  if (-[PKPayLaterCalendarMonthViewController _hasHeaderForSection:](self, "_hasHeaderForSection:", a5))
  {
    -[PKPayLaterCalendarMonthViewController _configureHeaderView:inSection:](self, "_configureHeaderView:inSection:", self->_sampleHeaderView, a5);
    sampleHeaderView = self->_sampleHeaderView;
    objc_msgSend(v7, "bounds");
    -[PKDashboardTitleHeaderView sizeThatFits:](sampleHeaderView, "sizeThatFits:", v9, 3.40282347e38);
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v11 = *MEMORY[0x1E0C9D820];
    v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  double v5;
  double v6;
  CGSize result;

  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)_hasHeaderForSection:(int64_t)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 1;
  if (a3 != 2)
    return 0;
  -[PKPayLaterInstallmentsMonth paidInstallments](self->_installmentsMonth, "paidInstallments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)_configureHeaderView:(id)a3 inSection:(int64_t)a4
{
  NSDateFormatter *monthYearFormatter;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "setUseCompactTopInset:", 1);
  if (a4 == 2)
  {
    PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uppercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v10);

    objc_msgSend(v11, "setHorizontalInset:", 24.0);
    objc_msgSend(v11, "setTitleStyle:", 2);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitleColor:", v8);
    goto LABEL_5;
  }
  if (!a4)
  {
    monthYearFormatter = self->_monthYearFormatter;
    -[PKPayLaterInstallmentsMonth startDate](self->_installmentsMonth, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter stringFromDate:](monthYearFormatter, "stringFromDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setTitleStyle:", 1);
    objc_msgSend(v11, "setTitle:", v8);
    objc_msgSend(v11, "setActionTitle:", 0);
    objc_msgSend(v11, "setHorizontalInset:", 24.0);
LABEL_5:

  }
}

- (void)_applyMaskToCell:(id)a3 section:(int64_t)a4 firstInSection:(BOOL)a5 lastInSection:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v6 = a6;
  v7 = a5;
  v9 = a3;
  if (a4)
  {
    v10 = 3;
    if (!v7 || !v6)
      v10 = 1;
    v11 = 2;
    if (!v6)
      v11 = 0;
    if (v7)
      v12 = v10;
    else
      v12 = v11;
    v13 = v9;
    objc_msgSend(v9, "setMaskType:", v12);
    objc_msgSend(v13, "setShowsBottomSeparator:", !v6);
    v9 = v13;
  }

}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsett.top;
  left = self->_contentInsett.left;
  bottom = self->_contentInsett.bottom;
  right = self->_contentInsett.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)alphaTransition
{
  return self->_alphaTransition;
}

- (BOOL)visible
{
  return self->_visible;
}

- (PKHorizontalScrollingChildViewControllerDelegate)scrollingDelegate
{
  return (PKHorizontalScrollingChildViewControllerDelegate *)objc_loadWeakRetained((id *)&self->scrollingDelegate);
}

- (void)setScrollingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->scrollingDelegate, a3);
}

- (UIGestureRecognizer)gestureRecognizerRequiredToFail
{
  return self->gestureRecognizerRequiredToFail;
}

- (void)setGestureRecognizerRequiredToFail:(id)a3
{
  objc_storeStrong((id *)&self->gestureRecognizerRequiredToFail, a3);
}

- (int64_t)contentInsetAdjustmentBehavior
{
  return self->_contentInsetAdjustmentBehavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->gestureRecognizerRequiredToFail, 0);
  objc_destroyWeak((id *)&self->scrollingDelegate);
  objc_storeStrong((id *)&self->_sampleHeaderView, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_monthYearFormatter, 0);
  objc_storeStrong((id *)&self->_dayFormatter, 0);
  objc_storeStrong((id *)&self->_weekdayFormatter, 0);
  objc_storeStrong((id *)&self->_installmentsMonth, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_installmentPresenter, 0);
  objc_storeStrong((id *)&self->_installmentsMonthPresenter, 0);
}

@end
