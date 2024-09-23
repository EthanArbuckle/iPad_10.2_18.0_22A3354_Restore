@implementation PKMonthDayCollectionViewController

- (PKMonthDayCollectionViewController)initWithDayDelegate:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  id v8;
  PKMonthDayCollectionViewController *v9;
  id v10;
  uint64_t v11;
  NSCalendar *calendar;
  NSNumberFormatter *v13;
  NSNumberFormatter *dayFormatter;
  NSNumberFormatter *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  v18.receiver = self;
  v18.super_class = (Class)PKMonthDayCollectionViewController;
  v9 = -[PKMonthDayCollectionViewController initWithCollectionViewLayout:](&v18, sel_initWithCollectionViewLayout_, v8);

  if (v9)
  {
    objc_storeWeak((id *)&v9->_dayDelegate, v6);
    v9->_minimumDayNumber = 0;
    v9->_maximumDayNumber = 31;
    objc_storeStrong((id *)&v9->_timeZone, a4);
    v10 = objc_alloc(MEMORY[0x1E0C99D48]);
    v11 = objc_msgSend(v10, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    calendar = v9->_calendar;
    v9->_calendar = (NSCalendar *)v11;

    -[NSCalendar setTimeZone:](v9->_calendar, "setTimeZone:", v9->_timeZone);
    v13 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    dayFormatter = v9->_dayFormatter;
    v9->_dayFormatter = v13;

    v15 = v9->_dayFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter setLocale:](v15, "setLocale:", v16);

  }
  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKMonthDayCollectionViewController;
  -[PKMonthDayCollectionViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[PKMonthDayCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsMultipleSelection:", 1);
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("reuseIdentifier"));
  objc_msgSend(v3, "setAlwaysBounceVertical:", 0);
  objc_msgSend(v3, "setBounces:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (id)selectedDate
{
  void *v3;
  unint64_t v4;
  int64_t dayNumber;
  void *v6;
  void *v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar rangeOfUnit:inUnit:forDate:](self->_calendar, "rangeOfUnit:inUnit:forDate:", 16, 8, v3);
  if (self->_dayNumber >= v4)
    dayNumber = v4;
  else
    dayNumber = self->_dayNumber;
  -[NSCalendar dateBySettingUnit:value:ofDate:options:](self->_calendar, "dateBySettingUnit:value:ofDate:options:", 16, dayNumber, v3, 1024);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSCalendar isDate:equalToDate:toUnitGranularity:](self->_calendar, "isDate:equalToDate:toUnitGranularity:", v3, v6, 8))
  {
    -[NSCalendar dateByAddingUnit:value:toDate:options:](self->_calendar, "dateByAddingUnit:value:toDate:options:", 8, 1, v3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar rangeOfUnit:inUnit:forDate:](self->_calendar, "rangeOfUnit:inUnit:forDate:", 16, 8, v7);
    if (self->_dayNumber >= v8)
      v9 = v8;
    else
      v9 = self->_dayNumber;
    -[NSCalendar dateBySettingUnit:value:ofDate:options:](self->_calendar, "dateBySettingUnit:value:ofDate:options:", 16, v9, v3, 1024);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }

  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  PKFloatRoundToPixel();
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)setDayNumber:(int64_t)a3
{
  int64_t minimumDayNumber;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  if (a3)
  {
    minimumDayNumber = self->_minimumDayNumber;
    if (minimumDayNumber <= a3)
      minimumDayNumber = a3;
  }
  else
  {
    minimumDayNumber = 0;
  }
  self->_dayNumber = minimumDayNumber;
  -[PKMonthDayCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__PKMonthDayCollectionViewController_setDayNumber___block_invoke;
  v12[3] = &unk_1E3E74DE0;
  v13 = v5;
  v11 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);

  -[PKMonthDayCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMonthDayCollectionViewController _indexPathForDayNumber:](self, "_indexPathForDayNumber:", self->_dayNumber);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectItemAtIndexPath:animated:scrollPosition:", v8, 0, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_dayDelegate);
  -[PKMonthDayCollectionViewController selectedDate](self, "selectedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "monthDaySelectionViewController:didSelectDate:day:", self, v10, self->_dayNumber);

}

uint64_t __51__PKMonthDayCollectionViewController_setDayNumber___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deselectItemAtIndexPath:animated:", a2, 0);
}

- (void)setMinimumDayNumber:(int64_t)a3
{
  int64_t dayNumber;
  id v6;

  self->_minimumDayNumber = a3;
  dayNumber = self->_dayNumber;
  if (dayNumber >= 1 && dayNumber < a3)
    -[PKMonthDayCollectionViewController setDayNumber:](self, "setDayNumber:");
  -[PKMonthDayCollectionViewController collectionView](self, "collectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

}

- (id)_indexPathForDayNumber:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  BOOL v6;
  int64_t v7;
  void *v8;

  v6 = a3 < 1;
  v7 = a3 - 1;
  if (v6)
  {
    v8 = 0;
  }
  else if (self->_maximumDayNumber >= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7, 0, v3, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 35;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  NSNumberFormatter *dayFormatter;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("reuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  if (v8 < self->_maximumDayNumber)
    v9 = v8 + 1;
  else
    v9 = 0;
  if (v9 < 1)
  {
    v12 = 0;
  }
  else
  {
    dayFormatter = self->_dayFormatter;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter stringFromNumber:](dayFormatter, "stringFromNumber:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "setDayNumber:withTitle:", v9, v12);
  objc_msgSend(v7, "setEnabled:", v9 >= self->_minimumDayNumber);
  objc_msgSend(v7, "setSelected:", v9 == self->_dayNumber);

  return v7;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(a3, "bounds");
  v6 = v5 / 7.0;
  v7 = v5 / 7.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  int64_t v5;

  v5 = objc_msgSend(a4, "row", a3);
  return v5 + 1 >= self->_minimumDayNumber && v5 < self->_maximumDayNumber;
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  return objc_msgSend(a4, "row", a3) + 1 != self->_dayNumber;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  self->_dayNumber = objc_msgSend(v7, "row") + 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dayDelegate);
  -[PKMonthDayCollectionViewController selectedDate](self, "selectedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "monthDaySelectionViewController:didSelectDate:day:", self, v9, self->_dayNumber);

  objc_msgSend(v6, "indexPathsForSelectedItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__PKMonthDayCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v13[3] = &unk_1E3E74E08;
  v14 = v7;
  v15 = v6;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

}

void __78__PKMonthDayCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "deselectItemAtIndexPath:animated:", v3, 0);

}

- (int64_t)dayNumber
{
  return self->_dayNumber;
}

- (int64_t)minimumDayNumber
{
  return self->_minimumDayNumber;
}

- (int64_t)maximumDayNumber
{
  return self->_maximumDayNumber;
}

- (void)setMaximumDayNumber:(int64_t)a3
{
  self->_maximumDayNumber = a3;
}

- (PKMonthDayCollectionViewControllerDelegate)dayDelegate
{
  return (PKMonthDayCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_dayDelegate);
}

- (void)setDayDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dayDelegate, a3);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_destroyWeak((id *)&self->_dayDelegate);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_dayFormatter, 0);
}

@end
