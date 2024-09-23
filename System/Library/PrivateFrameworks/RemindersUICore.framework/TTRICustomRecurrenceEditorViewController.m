@implementation TTRICustomRecurrenceEditorViewController

- (TTRICustomRecurrenceEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  TTRICustomRecurrenceEditorViewController *v4;
  TTRICustomRecurrenceEditorViewController *v5;
  uint64_t v6;
  NSDate *startDate;
  uint64_t v8;
  NSTimeZone *timeZone;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TTRICustomRecurrenceEditorViewController;
  v4 = -[TTRICustomRecurrenceEditorViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_cachedFrequency = 0;
    v4->_cachedInterval = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v8 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v8;

    RemindersUICoreBundleGet();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CUSTOM_RECURRENCE_LABEL"), CFSTR("Custom"), CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRICustomRecurrenceEditorViewController setTitle:](v5, "setTitle:", v11);

  }
  return v5;
}

- (TTRICustomRecurrenceEditorViewController)initWithStartDate:(id)a3 timeZone:(id)a4 clearBackground:(BOOL)a5
{
  id v9;
  id v10;
  TTRICustomRecurrenceEditorViewController *v11;
  TTRICustomRecurrenceEditorViewController *v12;

  v9 = a3;
  v10 = a4;
  v11 = -[TTRICustomRecurrenceEditorViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startDate, a3);
    objc_storeStrong((id *)&v12->_timeZone, a4);
    v12->_useClearBackground = a5;
    -[TTRICustomRecurrenceEditorViewController _createChoosersAndControls](v12, "_createChoosersAndControls");
  }

  return v12;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[TTRICustomRecurrenceEditorViewController setTableView:](self, "setTableView:", v4);

  -[TTRICustomRecurrenceEditorViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[TTRICustomRecurrenceEditorViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDataSource:", self);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lineHeight");
  v9 = v8;
  -[TTRICustomRecurrenceEditorViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEstimatedRowHeight:", v9);

  if (self->_useClearBackground)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRICustomRecurrenceEditorViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v11);

  }
  -[TTRICustomRecurrenceEditorViewController tableView](self, "tableView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[TTRICustomRecurrenceEditorViewController setView:](self, "setView:", v13);

}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  _QWORD v5[5];
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)TTRICustomRecurrenceEditorViewController;
  -[TTRICustomRecurrenceEditorViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[TTRICustomRecurrenceEditorViewController resetBackgroundColor](self, "resetBackgroundColor");
  v7[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__TTRICustomRecurrenceEditorViewController_viewDidLoad__block_invoke;
  v5[3] = &unk_1E6783BF8;
  v5[4] = self;
  v4 = (id)-[TTRICustomRecurrenceEditorViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v5);

}

uint64_t __55__TTRICustomRecurrenceEditorViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetBackgroundColor");
}

- (void)queuePreferredContentSizeRefresh
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__TTRICustomRecurrenceEditorViewController_queuePreferredContentSizeRefresh__block_invoke;
  block[3] = &unk_1E6783C20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __76__TTRICustomRecurrenceEditorViewController_queuePreferredContentSizeRefresh__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "calculatePreferredContentSize");
  return objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:");
}

- (CGSize)calculatePreferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[TTRICustomRecurrenceEditorViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentSize");
  v4 = v3;

  v5 = 320.0;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)resetBackgroundColor
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (-[TTRICustomRecurrenceEditorViewController isPresentedInsidePopover](self, "isPresentedInsidePopover")&& (-[TTRICustomRecurrenceEditorViewController traitCollection](self, "traitCollection"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v4 = objc_msgSend(v3, "userInterfaceStyle"), v3, v4 < 2))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (id)v5;
  -[TTRICustomRecurrenceEditorViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)_createChoosersAndControls
{
  TTRIRecurrenceWeekdayChooserController *v3;
  TTRIRecurrenceWeekdayChooserController *weeklyChooser;
  TTRIRecurrenceMonthlyChooserController *v5;
  TTRIRecurrenceMonthlyChooserController *monthlyChooser;
  TTRIRecurrenceMonthChooserController *v7;
  TTRIRecurrenceMonthChooserController *yearlyChooser;
  TTRIRecurrenceOrdinalChooserController *v9;
  TTRIRecurrenceOrdinalChooserController *yearlyOrdinalChooser;
  UISwitch *v11;
  UISwitch *yearOrdinalSwitch;
  TTRICustomRecurrenceEditorTableViewCell *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  TTRICustomRecurrenceEditorTableViewCell *v18;
  TTRICustomRecurrenceEditorTableViewCell *frequencySummaryCell;
  TTRICustomRecurrenceEditorTableViewCell *v20;
  void *v21;
  void *v22;
  TTRICustomRecurrenceEditorTableViewCell *v23;
  void *v24;
  TTRICustomRecurrenceEditorTableViewCell *v25;
  void *v26;
  TTRICustomRecurrenceEditorIntervalChooserTableViewCell *v27;
  TTRICustomRecurrenceEditorIntervalChooserTableViewCell *intervalSummaryCell;
  void *v29;
  void *v30;
  id v31;

  v3 = -[TTRIRecurrenceWeekdayChooserController initWithDate:]([TTRIRecurrenceWeekdayChooserController alloc], "initWithDate:", self->_startDate);
  weeklyChooser = self->_weeklyChooser;
  self->_weeklyChooser = v3;

  -[TTRIRecurrenceChooserController setDelegate:](self->_weeklyChooser, "setDelegate:", self);
  v5 = -[TTRIRecurrenceMonthlyChooserController initWithDate:]([TTRIRecurrenceMonthlyChooserController alloc], "initWithDate:", self->_startDate);
  monthlyChooser = self->_monthlyChooser;
  self->_monthlyChooser = v5;

  -[TTRIRecurrenceMonthlyChooserController setDelegate:](self->_monthlyChooser, "setDelegate:", self);
  v7 = -[TTRIRecurrenceMonthChooserController initWithDate:]([TTRIRecurrenceMonthChooserController alloc], "initWithDate:", self->_startDate);
  yearlyChooser = self->_yearlyChooser;
  self->_yearlyChooser = v7;

  -[TTRIRecurrenceChooserController setDelegate:](self->_yearlyChooser, "setDelegate:", self);
  v9 = -[TTRIRecurrenceOrdinalChooserController initWithDate:]([TTRIRecurrenceOrdinalChooserController alloc], "initWithDate:", self->_startDate);
  yearlyOrdinalChooser = self->_yearlyOrdinalChooser;
  self->_yearlyOrdinalChooser = v9;

  -[TTRIRecurrenceChooserController setDelegate:](self->_yearlyOrdinalChooser, "setDelegate:", self);
  v11 = (UISwitch *)objc_opt_new();
  yearOrdinalSwitch = self->_yearOrdinalSwitch;
  self->_yearOrdinalSwitch = v11;

  -[UISwitch addTarget:action:forControlEvents:](self->_yearOrdinalSwitch, "addTarget:action:forControlEvents:", self, sel__yearOrdinalSwitchChanged_, 4096);
  v13 = [TTRICustomRecurrenceEditorTableViewCell alloc];
  v14 = *MEMORY[0x1E0C9D648];
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v18 = -[TTRICustomRecurrenceEditorTableViewCell initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E0C9D648], v15, v16, v17);
  frequencySummaryCell = self->_frequencySummaryCell;
  self->_frequencySummaryCell = v18;

  v20 = self->_frequencySummaryCell;
  RemindersUICoreBundleGet();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Frequency"), CFSTR("Frequency"), CFSTR("Localizable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIPopupMenuTableViewCell setTitle:](v20, "setTitle:", v22);

  v23 = self->_frequencySummaryCell;
  -[TTRICustomRecurrenceEditorViewController frequencyTypeMenu](self, "frequencyTypeMenu");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIPopupMenuTableViewCell setPopupMenu:](v23, "setPopupMenu:", v24);

  v25 = self->_frequencySummaryCell;
  -[TTRICustomRecurrenceEditorViewController _stringForFrequency:](self, "_stringForFrequency:", self->_cachedFrequency);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIPopupMenuTableViewCell setAccessoryTitle:](v25, "setAccessoryTitle:", v26);

  v27 = -[TTRICustomRecurrenceEditorIntervalChooserTableViewCell initWithFrame:]([TTRICustomRecurrenceEditorIntervalChooserTableViewCell alloc], "initWithFrame:", v14, v15, v16, v17);
  intervalSummaryCell = self->_intervalSummaryCell;
  self->_intervalSummaryCell = v27;

  -[TTRICustomRecurrenceEditorIntervalChooserTableViewCell setIntervalValue:](self->_intervalSummaryCell, "setIntervalValue:", 1);
  -[TTRICustomRecurrenceEditorIntervalChooserTableViewCell setDelegate:](self->_intervalSummaryCell, "setDelegate:", self);
  if (self->_useClearBackground)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIRecurrenceMonthlyChooserController setBackgroundColor:](self->_monthlyChooser, "setBackgroundColor:", v29);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIRecurrenceChooserController setBackgroundColor:](self->_yearlyChooser, "setBackgroundColor:", v30);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    -[TTRIRecurrenceChooserController setBackgroundColor:](self->_yearlyOrdinalChooser, "setBackgroundColor:", v31);

  }
}

- (void)intervalChooserDidUpdateValue:(int64_t)a3
{
  self->_cachedInterval = a3;
  -[TTRICustomRecurrenceEditorViewController _frequencyUpdated](self, "_frequencyUpdated");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TTRICustomRecurrenceEditorViewController;
  -[TTRICustomRecurrenceEditorViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[TTRICustomRecurrenceEditorViewController queuePreferredContentSizeRefresh](self, "queuePreferredContentSizeRefresh");
  -[TTRICustomRecurrenceEditorViewController presentationController](self, "presentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

}

- (void)setProhibitsHourlyRecurrence:(BOOL)a3
{
  void *v4;

  if (self->_prohibitsHourlyRecurrence != a3)
  {
    self->_prohibitsHourlyRecurrence = a3;
    -[TTRICustomRecurrenceEditorViewController cachedAvailableRecurrenceFrequencies](self, "cachedAvailableRecurrenceFrequencies");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[TTRICustomRecurrenceEditorViewController setCachedAvailableRecurrenceFrequencies:](self, "setCachedAvailableRecurrenceFrequencies:", 0);
      -[TTRICustomRecurrenceEditorViewController _frequencyUpdated](self, "_frequencyUpdated");
    }
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[TTRICustomRecurrenceEditorViewController _numberOfRowsForSection:](self, "_numberOfRowsForSection:", a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  int64_t v6;
  TTRICustomRecurrenceEditorTableViewCell *v7;
  TTRICustomRecurrenceEditorIntervalChooserTableViewCell *v8;
  TTRICustomRecurrenceEditorTableViewCell *frequencySummaryCell;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TTRICustomRecurrenceEditorIntervalChooserTableViewCell *intervalSummaryCell;
  void *v17;
  TTRICustomRecurrenceEditorIntervalChooserTableViewCell *v18;

  v5 = a4;
  v6 = -[TTRICustomRecurrenceEditorViewController _tagForIndexPath:](self, "_tagForIndexPath:", v5);
  switch(v6)
  {
    case 0:
    case 3:
      v7 = [TTRICustomRecurrenceEditorTableViewCell alloc];
      v8 = -[TTRICustomRecurrenceEditorTableViewCell initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[TTRICustomRecurrenceEditorIntervalChooserTableViewCell setSelectionStyle:](v8, "setSelectionStyle:", 0);
      goto LABEL_4;
    case 1:
      v8 = self->_frequencySummaryCell;
      goto LABEL_9;
    case 2:
      v8 = self->_intervalSummaryCell;
      goto LABEL_15;
    case 4:
      -[TTRICustomRecurrenceEditorViewController yearlyOrdinalChooser](self, "yearlyOrdinalChooser");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 5:
      -[TTRICustomRecurrenceEditorViewController currentChooser](self, "currentChooser");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v10 = v11;
      objc_msgSend(v11, "cellForRow:", objc_msgSend(v5, "row"));
      v8 = (TTRICustomRecurrenceEditorIntervalChooserTableViewCell *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    default:
      v8 = 0;
LABEL_4:
      if (v6 == 3)
      {
        RemindersUICoreBundleGet();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Days of Week"), CFSTR("Days of Week"), CFSTR("Localizable"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        REMDynamicCast();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "titleLabel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setText:", v13);

        -[TTRICustomRecurrenceEditorIntervalChooserTableViewCell setAccessoryView:](v8, "setAccessoryView:", self->_yearOrdinalSwitch);
      }
      else
      {
        if (v6 == 2)
        {
LABEL_15:
          intervalSummaryCell = self->_intervalSummaryCell;
          -[TTRICustomRecurrenceEditorViewController _stringForFrequency:interval:](self, "_stringForFrequency:interval:", self->_cachedFrequency, self->_cachedInterval);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[TTRIPopupMenuTableViewCell setAccessoryTitle:](intervalSummaryCell, "setAccessoryTitle:", v17);

          v18 = self->_intervalSummaryCell;
          -[TTRICustomRecurrenceEditorViewController _localizedEveryStringForFrequency:interval:](self, "_localizedEveryStringForFrequency:interval:", self->_cachedFrequency, self->_cachedInterval);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[TTRIPopupMenuTableViewCell setTitle:](v18, "setTitle:", v10);
        }
        else
        {
          if (v6 != 1)
            goto LABEL_17;
LABEL_9:
          frequencySummaryCell = self->_frequencySummaryCell;
          -[TTRICustomRecurrenceEditorViewController _stringForFrequency:](self, "_stringForFrequency:", self->_cachedFrequency);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[TTRIPopupMenuTableViewCell setAccessoryTitle:](frequencySummaryCell, "setAccessoryTitle:", v10);
        }
LABEL_16:

      }
LABEL_17:

      return v8;
  }
}

- (void)didSelectFrequencyType:(int64_t)a3
{
  if (self->_cachedFrequency != a3)
  {
    self->_cachedFrequency = a3;
    -[TTRICustomRecurrenceEditorViewController _frequencyUpdated](self, "_frequencyUpdated");
  }
}

- (void)didSelectIntervalType:(int64_t)a3
{
  if (self->_cachedInterval != a3)
  {
    self->_cachedInterval = a3;
    -[TTRICustomRecurrenceEditorViewController _frequencyUpdated](self, "_frequencyUpdated");
  }
}

- (id)frequencyTypeMenu
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  _QWORD v15[4];
  id v16[2];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id location;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[TTRICustomRecurrenceEditorViewController _availableRecurrenceFrequencies](self, "_availableRecurrenceFrequencies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7), "intValue");
        -[TTRICustomRecurrenceEditorViewController _stringForFrequency:](self, "_stringForFrequency:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0DC3428];
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __61__TTRICustomRecurrenceEditorViewController_frequencyTypeMenu__block_invoke;
        v15[3] = &unk_1E6783C48;
        objc_copyWeak(v16, &location);
        v16[1] = (id)v8;
        objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v9, 0, 0, v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setState:", self->_cachedFrequency == v8);
        objc_msgSend(v3, "addObject:", v11);

        objc_destroyWeak(v16);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&location);

  return v12;
}

void __61__TTRICustomRecurrenceEditorViewController_frequencyTypeMenu__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "didSelectFrequencyType:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  unint64_t v3;

  v3 = self->_cachedFrequency - 1;
  if (v3 > 2)
    return 1;
  else
    return qword_1B490F080[v3];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double v4;
  id v7;
  id v8;
  unint64_t v9;
  double v10;
  void *v11;
  void *v12;
  double v13;

  v7 = a3;
  v8 = a4;
  v9 = -[TTRICustomRecurrenceEditorViewController _tagForIndexPath:](self, "_tagForIndexPath:", v8);
  if (v9 >= 4)
  {
    if (v9 == 5)
    {
      -[TTRICustomRecurrenceEditorViewController currentChooser](self, "currentChooser");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v9 != 4)
        goto LABEL_8;
      -[TTRICustomRecurrenceEditorViewController yearlyOrdinalChooser](self, "yearlyOrdinalChooser");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    objc_msgSend(v11, "heightForRow:", objc_msgSend(v8, "row"));
    v4 = v13;

    goto LABEL_8;
  }
  objc_msgSend(v7, "rowHeight");
  v4 = v10;
LABEL_8:

  return v4;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  objc_msgSend(a3, "cellForRowAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "selectionStyle"))
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v7, 1);
  if (-[TTRICustomRecurrenceEditorViewController _tagForIndexPath:](self, "_tagForIndexPath:", v7) == 5)
  {
    -[TTRICustomRecurrenceEditorViewController currentChooser](self, "currentChooser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rowTapped:", objc_msgSend(v7, "row"));

  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a4)
  {
    v6 = 0;
  }
  else
  {
    -[TTRICustomRecurrenceEditorViewController recurrenceSummaryString](self, "recurrenceSummaryString", a3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (self->_useClearBackground
    || objc_msgSend(v9, "section") == 1
    && (-[TTRICustomRecurrenceEditorViewController currentChooser](self, "currentChooser"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "drawBackgroundForRow:", objc_msgSend(v10, "row")),
        v14,
        (v15 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backgroundView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v12);

  }
}

- (id)_availableRecurrenceFrequencies
{
  void *v3;
  void *v4;

  -[TTRICustomRecurrenceEditorViewController cachedAvailableRecurrenceFrequencies](self, "cachedAvailableRecurrenceFrequencies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
    if (!-[TTRICustomRecurrenceEditorViewController prohibitsHourlyRecurrence](self, "prohibitsHourlyRecurrence"))
      objc_msgSend(v4, "addObject:", &unk_1E67F4178);
    objc_msgSend(v4, "addObject:", &unk_1E67F4190);
    objc_msgSend(v4, "addObject:", &unk_1E67F41A8);
    objc_msgSend(v4, "addObject:", &unk_1E67F41C0);
    objc_msgSend(v4, "addObject:", &unk_1E67F41D8);
    -[TTRICustomRecurrenceEditorViewController setCachedAvailableRecurrenceFrequencies:](self, "setCachedAvailableRecurrenceFrequencies:", v4);

  }
  return -[TTRICustomRecurrenceEditorViewController cachedAvailableRecurrenceFrequencies](self, "cachedAvailableRecurrenceFrequencies");
}

- (void)recurrenceChooserWantsReload:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__TTRICustomRecurrenceEditorViewController_recurrenceChooserWantsReload___block_invoke;
  v3[3] = &unk_1E6783C20;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
}

void __73__TTRICustomRecurrenceEditorViewController_recurrenceChooserWantsReload___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSections:withRowAnimation:", v1, 0);

}

- (void)recurrenceChooser:(id)a3 wantsRowReload:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__TTRICustomRecurrenceEditorViewController_recurrenceChooser_wantsRowReload___block_invoke;
  v4[3] = &unk_1E6783C70;
  v4[4] = self;
  v4[5] = a4;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v4);
}

void __77__TTRICustomRecurrenceEditorViewController_recurrenceChooser_wantsRowReload___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", *(_QWORD *)(a1 + 40), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadRowsAtIndexPaths:withRowAnimation:", v4, 0);

}

- (void)presentationControllerWillDismiss:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  -[TTRICustomRecurrenceEditorViewController completionBlock](self, "completionBlock", a3);
  v5 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  -[TTRICustomRecurrenceEditorViewController recurrenceRule](self, "recurrenceRule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (void)_updateRecurrenceRule
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  -[TTRICustomRecurrenceEditorViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__TTRICustomRecurrenceEditorViewController__updateRecurrenceRule__block_invoke;
  v5[3] = &unk_1E6783C20;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__TTRICustomRecurrenceEditorViewController__updateRecurrenceRule__block_invoke_2;
  v4[3] = &unk_1E6783C98;
  objc_msgSend(v3, "performBatchUpdates:completion:", v5, v4);

}

uint64_t __65__TTRICustomRecurrenceEditorViewController__updateRecurrenceRule__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateRecurrenceRuleWithoutBatching");
}

uint64_t __65__TTRICustomRecurrenceEditorViewController__updateRecurrenceRule__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queuePreferredContentSizeRefresh");
}

- (void)_updateRecurrenceRuleWithoutBatching
{
  int64_t cachedFrequency;
  int64_t cachedInterval;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  cachedFrequency = self->_cachedFrequency;
  cachedInterval = self->_cachedInterval;
  v11 = (id)objc_opt_new();
  -[TTRICustomRecurrenceEditorViewController currentChooser](self, "currentChooser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    cachedFrequency = objc_msgSend(v5, "frequency");
    objc_msgSend(v6, "updateRecurrenceRuleBuilder:", v11);
  }
  objc_msgSend(v11, "setFrequency:", cachedFrequency);
  objc_msgSend(v11, "setInterval:", cachedInterval);
  -[TTRICustomRecurrenceEditorViewController yearlyChooser](self, "yearlyChooser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != v7)
    goto LABEL_6;
  -[TTRICustomRecurrenceEditorViewController yearOrdinalSwitch](self, "yearOrdinalSwitch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isOn");

  if (v9)
  {
    -[TTRICustomRecurrenceEditorViewController yearlyOrdinalChooser](self, "yearlyOrdinalChooser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateRecurrenceRuleBuilder:", v11);
LABEL_6:

  }
  objc_msgSend(v11, "recurrenceRuleWithFirstDayOfTheWeek:", -[REMRecurrenceRule firstDayOfTheWeek](self->_cachedRecurrenceRule, "firstDayOfTheWeek"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRICustomRecurrenceEditorViewController setRecurrenceRule:shouldUpdatePickers:](self, "setRecurrenceRule:shouldUpdatePickers:", v10, 0);

}

- (id)recurrenceRule
{
  REMRecurrenceRule *cachedRecurrenceRule;

  cachedRecurrenceRule = self->_cachedRecurrenceRule;
  if (!cachedRecurrenceRule)
  {
    -[TTRICustomRecurrenceEditorViewController _updateRecurrenceRule](self, "_updateRecurrenceRule");
    cachedRecurrenceRule = self->_cachedRecurrenceRule;
  }
  return cachedRecurrenceRule;
}

- (void)setRecurrenceRule:(id)a3
{
  -[TTRICustomRecurrenceEditorViewController setRecurrenceRule:shouldUpdatePickers:](self, "setRecurrenceRule:shouldUpdatePickers:", a3, 1);
}

- (void)setRecurrenceRule:(id)a3 shouldUpdatePickers:(BOOL)a4
{
  _BOOL4 v4;
  REMRecurrenceRule *v7;
  REMRecurrenceRule *v8;

  v4 = a4;
  v7 = (REMRecurrenceRule *)a3;
  if (self->_cachedRecurrenceRule != v7)
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_cachedRecurrenceRule, a3);
    v7 = v8;
    if (v8)
    {
      -[TTRICustomRecurrenceEditorViewController _updateSummaryLabel](self, "_updateSummaryLabel");
      v7 = v8;
    }
    if (v4)
    {
      -[TTRICustomRecurrenceEditorViewController _refreshCacheAndPickers](self, "_refreshCacheAndPickers");
      v7 = v8;
    }
  }

}

- (void)_refreshCacheAndPickers
{
  uint64_t v3;
  id v4;

  self->_cachedInterval = -[REMRecurrenceRule interval](self->_cachedRecurrenceRule, "interval");
  self->_cachedFrequency = -[REMRecurrenceRule frequency](self->_cachedRecurrenceRule, "frequency");
  v3 = objc_msgSend((id)objc_opt_class(), "isRecurrenceRuleOrdinal:", self->_cachedRecurrenceRule);
  -[TTRICustomRecurrenceEditorViewController _frequencyUpdated](self, "_frequencyUpdated");
  if (-[REMRecurrenceRule frequency](self->_cachedRecurrenceRule, "frequency") == 3)
  {
    -[TTRICustomRecurrenceEditorViewController yearOrdinalSwitch](self, "yearOrdinalSwitch");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOn:", v3);

  }
}

+ (BOOL)isRecurrenceRuleOrdinal:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "setPositions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 1;
  }
  else if (objc_msgSend(v3, "frequency") == 2 || objc_msgSend(v3, "frequency") == 3)
  {
    objc_msgSend(v3, "daysOfTheWeek");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "count") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)prohibitsMultipleDaysInMonthlyRecurrence
{
  void *v2;
  char v3;

  -[TTRICustomRecurrenceEditorViewController monthlyChooser](self, "monthlyChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "prohibitsMultipleDaysInMonthlyRecurrence");

  return v3;
}

- (void)setProhibitsMultipleDaysInMonthlyRecurrence:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TTRICustomRecurrenceEditorViewController monthlyChooser](self, "monthlyChooser");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProhibitsMultipleDaysInMonthlyRecurrence:", v3);

}

- (BOOL)prohibitsMultipleMonthsInYearlyRecurrence
{
  void *v2;
  char v3;

  -[TTRICustomRecurrenceEditorViewController yearlyChooser](self, "yearlyChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "prohibitsMultipleMonthsInYearlyRecurrence");

  return v3;
}

- (void)setProhibitsMultipleMonthsInYearlyRecurrence:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TTRICustomRecurrenceEditorViewController yearlyChooser](self, "yearlyChooser");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProhibitsMultipleMonthsInYearlyRecurrence:", v3);

}

- (void)_updateSummaryLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  v3 = (void *)MEMORY[0x1E0D845D8];
  -[TTRICustomRecurrenceEditorViewController recurrenceRule](self, "recurrenceRule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRICustomRecurrenceEditorViewController startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "naturalLanguageDescriptionForRecurrenceRule:withStartDate:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRICustomRecurrenceEditorViewController setRecurrenceSummaryString:](self, "setRecurrenceSummaryString:", v6);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__TTRICustomRecurrenceEditorViewController__updateSummaryLabel__block_invoke;
  block[3] = &unk_1E6783C20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __63__TTRICustomRecurrenceEditorViewController__updateSummaryLabel__block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __63__TTRICustomRecurrenceEditorViewController__updateSummaryLabel__block_invoke_2;
  v2[3] = &unk_1E6783C20;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

void __63__TTRICustomRecurrenceEditorViewController__updateSummaryLabel__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSections:withRowAnimation:", v1, 5);

}

- (void)_updateCustomPickerView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[TTRICustomRecurrenceEditorViewController currentChooser](self, "currentChooser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "frequency");

  -[TTRICustomRecurrenceEditorViewController _chooserForFrequency:](self, "_chooserForFrequency:", self->_cachedFrequency);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRICustomRecurrenceEditorViewController setCurrentChooser:](self, "setCurrentChooser:", v5);

  -[TTRICustomRecurrenceEditorViewController currentChooser](self, "currentChooser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "frequency");

  -[TTRICustomRecurrenceEditorViewController currentChooser](self, "currentChooser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateFromRecurrenceRule:", self->_cachedRecurrenceRule);

  -[TTRICustomRecurrenceEditorViewController _updateTableSectionsFromFrequency:toFrequency:](self, "_updateTableSectionsFromFrequency:toFrequency:", v4, v7);
}

- (void)_updateTableSectionsFromFrequency:(int64_t)a3 toFrequency:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  _QWORD v17[5];

  -[TTRICustomRecurrenceEditorViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginUpdates");

  if (a3 == 3 || a4 != 3)
  {
    if (a3 == 3 && a4 != 3)
    {
      -[TTRICustomRecurrenceEditorViewController tableView](self, "tableView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "deleteSections:withRowAnimation:", v14, 6);

      v10 = a4 != 0;
      goto LABEL_10;
    }
  }
  else
  {
    -[TTRICustomRecurrenceEditorViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertSections:withRowAnimation:", v9, 6);

  }
  v10 = a4 != 0;
  if (!a3 && a4)
  {
    -[TTRICustomRecurrenceEditorViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertSections:withRowAnimation:", v12, 6);
LABEL_13:

    goto LABEL_14;
  }
LABEL_10:
  if (a3 && !a4)
  {
    -[TTRICustomRecurrenceEditorViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deleteSections:withRowAnimation:", v12, 6);
    goto LABEL_13;
  }
  v15 = !v10;
  if (a3 == a4)
    v15 = 1;
  if ((v15 & 1) == 0)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __90__TTRICustomRecurrenceEditorViewController__updateTableSectionsFromFrequency_toFrequency___block_invoke;
    v17[3] = &unk_1E6783C20;
    v17[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v17);
  }
LABEL_14:
  -[TTRICustomRecurrenceEditorViewController tableView](self, "tableView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "endUpdates");

}

void __90__TTRICustomRecurrenceEditorViewController__updateTableSectionsFromFrequency_toFrequency___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSections:withRowAnimation:", v1, 0);

}

- (void)_updateFrequencyRows
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRICustomRecurrenceEditorViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadRowsAtIndexPaths:withRowAnimation:", v6, 5);

}

- (void)_frequencyUpdated
{
  TTRICustomRecurrenceEditorTableViewCell *frequencySummaryCell;
  void *v4;
  TTRICustomRecurrenceEditorTableViewCell *v5;
  void *v6;

  -[TTRICustomRecurrenceEditorViewController _updateCustomPickerView](self, "_updateCustomPickerView");
  -[TTRICustomRecurrenceEditorViewController _updateRecurrenceRule](self, "_updateRecurrenceRule");
  -[TTRICustomRecurrenceEditorViewController _updateFrequencyRows](self, "_updateFrequencyRows");
  frequencySummaryCell = self->_frequencySummaryCell;
  -[TTRICustomRecurrenceEditorViewController frequencyTypeMenu](self, "frequencyTypeMenu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIPopupMenuTableViewCell setPopupMenu:](frequencySummaryCell, "setPopupMenu:", v4);

  v5 = self->_frequencySummaryCell;
  -[TTRICustomRecurrenceEditorViewController _stringForFrequency:](self, "_stringForFrequency:", self->_cachedFrequency);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIPopupMenuTableViewCell setAccessoryTitle:](v5, "setAccessoryTitle:", v6);

  -[TTRICustomRecurrenceEditorIntervalChooserTableViewCell setIntervalValue:](self->_intervalSummaryCell, "setIntervalValue:", self->_cachedInterval);
  -[TTRICustomRecurrenceEditorViewController queuePreferredContentSizeRefresh](self, "queuePreferredContentSizeRefresh");
}

- (id)_chooserForFrequency:(int64_t)a3
{
  void *v3;

  switch(a3)
  {
    case 3:
      -[TTRICustomRecurrenceEditorViewController yearlyChooser](self, "yearlyChooser");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[TTRICustomRecurrenceEditorViewController monthlyChooser](self, "monthlyChooser");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[TTRICustomRecurrenceEditorViewController weeklyChooser](self, "weeklyChooser");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (void)_yearOrdinalSwitchChanged:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[7];
  _QWORD v9[4];
  id v10;
  TTRICustomRecurrenceEditorViewController *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[3];
  char v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy_;
  v16[4] = __Block_byref_object_dispose_;
  v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  -[TTRICustomRecurrenceEditorViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__TTRICustomRecurrenceEditorViewController__yearOrdinalSwitchChanged___block_invoke;
  v9[3] = &unk_1E6783CC0;
  v12 = v16;
  v7 = v4;
  v13 = v14;
  v10 = v7;
  v11 = self;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __70__TTRICustomRecurrenceEditorViewController__yearOrdinalSwitchChanged___block_invoke_2;
  v8[3] = &unk_1E6783CE8;
  v8[5] = v16;
  v8[6] = v14;
  v8[4] = self;
  objc_msgSend(v5, "performBatchUpdates:completion:", v9, v8);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);

}

uint64_t __70__TTRICustomRecurrenceEditorViewController__yearOrdinalSwitchChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 1, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isOn"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertRowsAtIndexPaths:withRowAnimation:", v6, 6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deleteRowsAtIndexPaths:withRowAnimation:", v6, 6);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_updateRecurrenceRuleWithoutBatching");
}

uint64_t __70__TTRICustomRecurrenceEditorViewController__yearOrdinalSwitchChanged___block_invoke_2(uint64_t a1)
{
  void *v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scrollToRowAtIndexPath:atScrollPosition:animated:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 3, 1);

  }
  return objc_msgSend(*(id *)(a1 + 32), "queuePreferredContentSizeRefresh");
}

- (id)_stringForFrequency:(int64_t)a3
{
  void *v3;
  void *v4;

  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      CUIKStringForRepeatType();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      RemindersUICoreBundleGet();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Hourly"), CFSTR("Hourly"), CFSTR("Localizable"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v3;
  }
  return v3;
}

- (id)_stringForFrequency:(int64_t)a3 interval:(int64_t)a4
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  switch(a3)
  {
    case 0:
      RemindersUICoreBundleGet();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("days (every)");
      goto LABEL_8;
    case 1:
      RemindersUICoreBundleGet();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("weeks (every)");
      goto LABEL_8;
    case 2:
      RemindersUICoreBundleGet();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("months (every)");
      goto LABEL_8;
    case 3:
      RemindersUICoreBundleGet();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("years (every)");
      goto LABEL_8;
    case 4:
      RemindersUICoreBundleGet();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("hours (every)");
LABEL_8:
      objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E67C7538, CFSTR("PluralLocalizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v8 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)_tagForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  v6 = objc_msgSend(v4, "section");

  if (v6 == 2)
  {
    if (self->_cachedFrequency == 3)
    {
      if (v5)
        return 4;
      else
        return self->_cachedFrequency;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v7 = 1;
    if (v5)
      v7 = 2;
    if (v6)
      v7 = 0;
    if (v6 == 1)
      return 5;
    else
      return v7;
  }
}

- (int64_t)_numberOfRowsForSection:(int64_t)a3
{
  int64_t v3;
  void *v4;
  int64_t v5;
  void *v7;

  if (a3 == 2)
  {
    if (self->_cachedFrequency == 3)
    {
      -[TTRICustomRecurrenceEditorViewController yearOrdinalSwitch](self, "yearOrdinalSwitch");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isOn"))
        v3 = 2;
      else
        v3 = 1;

    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (a3 == 1)
    {
      -[TTRICustomRecurrenceEditorViewController currentChooser](self, "currentChooser");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "numberOfRows");

      return v5;
    }
    if (a3)
      return 0;
    else
      return 2;
  }
  return v3;
}

- (id)_localizedEveryStringForFrequency:(int64_t)a3 interval:(int64_t)a4
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  switch(a3)
  {
    case 0:
      RemindersUICoreBundleGet();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("Every-everyDay");
      goto LABEL_8;
    case 1:
      RemindersUICoreBundleGet();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("Every-everyWeek");
      goto LABEL_8;
    case 2:
      RemindersUICoreBundleGet();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("Every-everyMonth");
      goto LABEL_8;
    case 3:
      RemindersUICoreBundleGet();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("Every-everyYear");
      goto LABEL_8;
    case 4:
      RemindersUICoreBundleGet();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("Every-everyHour");
LABEL_8:
      objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("Every"), CFSTR("PluralLocalizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v8 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)prohibitsYearlyRecurrenceInterval
{
  return self->_prohibitsYearlyRecurrenceInterval;
}

- (void)setProhibitsYearlyRecurrenceInterval:(BOOL)a3
{
  self->_prohibitsYearlyRecurrenceInterval = a3;
}

- (BOOL)prohibitsHourlyRecurrence
{
  return self->_prohibitsHourlyRecurrence;
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 1016, 1);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1016);
}

- (UITableView)tableView
{
  return (UITableView *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setTableView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (TTRIRecurrenceChooserController)currentChooser
{
  return (TTRIRecurrenceChooserController *)objc_loadWeakRetained((id *)&self->_currentChooser);
}

- (void)setCurrentChooser:(id)a3
{
  objc_storeWeak((id *)&self->_currentChooser, a3);
}

- (TTRIRecurrenceWeekdayChooserController)weeklyChooser
{
  return (TTRIRecurrenceWeekdayChooserController *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setWeeklyChooser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (TTRIRecurrenceMonthlyChooserController)monthlyChooser
{
  return (TTRIRecurrenceMonthlyChooserController *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setMonthlyChooser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (TTRIRecurrenceMonthChooserController)yearlyChooser
{
  return (TTRIRecurrenceMonthChooserController *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setYearlyChooser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1056);
}

- (TTRIRecurrenceOrdinalChooserController)yearlyOrdinalChooser
{
  return (TTRIRecurrenceOrdinalChooserController *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setYearlyOrdinalChooser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1080);
}

- (UISwitch)yearOrdinalSwitch
{
  return (UISwitch *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setYearOrdinalSwitch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- (NSString)recurrenceSummaryString
{
  return (NSString *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setRecurrenceSummaryString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1096);
}

- (NSArray)cachedAvailableRecurrenceFrequencies
{
  return (NSArray *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setCachedAvailableRecurrenceFrequencies:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAvailableRecurrenceFrequencies, 0);
  objc_storeStrong((id *)&self->_recurrenceSummaryString, 0);
  objc_storeStrong((id *)&self->_yearOrdinalSwitch, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_yearlyOrdinalChooser, 0);
  objc_storeStrong((id *)&self->_yearlyChooser, 0);
  objc_storeStrong((id *)&self->_monthlyChooser, 0);
  objc_storeStrong((id *)&self->_weeklyChooser, 0);
  objc_destroyWeak((id *)&self->_currentChooser);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_intervalSummaryCell, 0);
  objc_storeStrong((id *)&self->_frequencySummaryCell, 0);
  objc_storeStrong((id *)&self->_cachedRecurrenceRule, 0);
}

@end
