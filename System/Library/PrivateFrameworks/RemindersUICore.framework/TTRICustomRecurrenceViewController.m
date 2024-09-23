@implementation TTRICustomRecurrenceViewController

- (TTRICustomRecurrenceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  TTRICustomRecurrenceViewController *v4;
  TTRICustomRecurrenceViewController *v5;
  uint64_t v6;
  NSDate *startDate;
  uint64_t v8;
  NSTimeZone *timeZone;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TTRICustomRecurrenceViewController;
  v4 = -[TTRICustomRecurrenceViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, a3, a4);
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
    -[TTRICustomRecurrenceViewController setTitle:](v5, "setTitle:", v11);

  }
  return v5;
}

- (TTRICustomRecurrenceViewController)initWithStartDate:(id)a3 timeZone:(id)a4 clearBackground:(BOOL)a5
{
  id v9;
  id v10;
  TTRICustomRecurrenceViewController *v11;
  TTRICustomRecurrenceViewController *v12;

  v9 = a3;
  v10 = a4;
  v11 = -[TTRICustomRecurrenceViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startDate, a3);
    objc_storeStrong((id *)&v12->_timeZone, a4);
    v12->_useClearBackground = a5;
    -[TTRICustomRecurrenceViewController _createChoosersAndControls](v12, "_createChoosersAndControls");
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
  -[TTRICustomRecurrenceViewController setTableView:](self, "setTableView:", v4);

  -[TTRICustomRecurrenceViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[TTRICustomRecurrenceViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDataSource:", self);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lineHeight");
  v9 = v8;
  -[TTRICustomRecurrenceViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEstimatedRowHeight:", v9);

  if (self->_useClearBackground)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRICustomRecurrenceViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v11);

  }
  -[TTRICustomRecurrenceViewController tableView](self, "tableView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[TTRICustomRecurrenceViewController setView:](self, "setView:", v13);

}

- (CGSize)calculatePreferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
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
  id v13;
  UIPickerView *v14;
  UIPickerView *frequencyPickerView;
  TTRICustomRecurrenceIntervalViewController *v16;
  TTRICustomRecurrenceIntervalViewController *v17;
  TTRICustomRecurrenceIntervalViewController *intervalPickerViewController;
  TTRICustomRecurrenceTableViewCell *v19;
  UITableViewCell *v20;
  UITableViewCell *frequencySummaryCell;
  void *v22;
  void *v23;
  void *v24;
  TTRICustomRecurrenceTableViewCell *v25;
  UITableViewCell *intervalSummaryCell;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void *v33;
  id v34;
  id location;

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
  v13 = objc_alloc(MEMORY[0x1E0DC3AE0]);
  v14 = (UIPickerView *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  frequencyPickerView = self->_frequencyPickerView;
  self->_frequencyPickerView = v14;

  -[UIPickerView setDelegate:](self->_frequencyPickerView, "setDelegate:", self);
  -[UIPickerView setDataSource:](self->_frequencyPickerView, "setDataSource:", self);
  -[UIPickerView setTranslatesAutoresizingMaskIntoConstraints:](self->_frequencyPickerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_initWeak(&location, self);
  v16 = [TTRICustomRecurrenceIntervalViewController alloc];
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __64__TTRICustomRecurrenceViewController__createChoosersAndControls__block_invoke;
  v33 = &unk_1E6783EE0;
  objc_copyWeak(&v34, &location);
  v17 = -[TTRICustomRecurrenceIntervalViewController initWithSelectedInterval:frequency:changeBlock:](v16, "initWithSelectedInterval:frequency:changeBlock:", 1, 0, &v30);
  intervalPickerViewController = self->_intervalPickerViewController;
  self->_intervalPickerViewController = v17;

  v19 = [TTRICustomRecurrenceTableViewCell alloc];
  v20 = -[TTRICustomRecurrenceTableViewCell initWithStyle:reuseIdentifier:](v19, "initWithStyle:reuseIdentifier:", 1, 0, v30, v31, v32, v33);
  frequencySummaryCell = self->_frequencySummaryCell;
  self->_frequencySummaryCell = v20;

  RemindersUICoreBundleGet();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Frequency"), CFSTR("Frequency"), CFSTR("Localizable"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell textLabel](self->_frequencySummaryCell, "textLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setText:", v23);

  v25 = -[TTRICustomRecurrenceTableViewCell initWithStyle:reuseIdentifier:]([TTRICustomRecurrenceTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
  intervalSummaryCell = self->_intervalSummaryCell;
  self->_intervalSummaryCell = &v25->super;

  if (self->_useClearBackground)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIRecurrenceMonthlyChooserController setBackgroundColor:](self->_monthlyChooser, "setBackgroundColor:", v27);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIRecurrenceChooserController setBackgroundColor:](self->_yearlyChooser, "setBackgroundColor:", v28);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIRecurrenceChooserController setBackgroundColor:](self->_yearlyOrdinalChooser, "setBackgroundColor:", v29);

  }
  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

void __64__TTRICustomRecurrenceViewController__createChoosersAndControls__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[122] != a2)
  {
    WeakRetained[122] = a2;
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_frequencyPickerViewUpdated");
    WeakRetained = v4;
  }

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TTRICustomRecurrenceViewController;
  -[TTRICustomRecurrenceViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[TTRICustomRecurrenceViewController _updateSummaryLabel](self, "_updateSummaryLabel");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  objc_super v7;

  v3 = a3;
  if ((-[TTRICustomRecurrenceViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0
    || -[TTRICustomRecurrenceViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    -[TTRICustomRecurrenceViewController completionBlock](self, "completionBlock");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[TTRICustomRecurrenceViewController recurrenceRule](self, "recurrenceRule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)TTRICustomRecurrenceViewController;
  -[TTRICustomRecurrenceViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
}

- (void)setProhibitsHourlyRecurrence:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_prohibitsHourlyRecurrence != a3)
  {
    self->_prohibitsHourlyRecurrence = a3;
    -[TTRICustomRecurrenceViewController cachedAvailableRecurrenceFrequencies](self, "cachedAvailableRecurrenceFrequencies");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[TTRICustomRecurrenceViewController setCachedAvailableRecurrenceFrequencies:](self, "setCachedAvailableRecurrenceFrequencies:", 0);
      -[TTRICustomRecurrenceViewController frequencyPickerView](self, "frequencyPickerView");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reloadAllComponents");

    }
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[TTRICustomRecurrenceViewController _numberOfRowsForSection:](self, "_numberOfRowsForSection:", a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  int64_t v6;
  TTRICustomRecurrenceTableViewCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int64_t cachedFrequency;
  void *v39;
  int64_t cachedInterval;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;

  v5 = a4;
  v6 = -[TTRICustomRecurrenceViewController _tagForIndexPath:](self, "_tagForIndexPath:", v5);
  switch(v6)
  {
    case 0:
    case 2:
    case 4:
    case 5:
      v7 = -[TTRICustomRecurrenceTableViewCell initWithStyle:reuseIdentifier:]([TTRICustomRecurrenceTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
      -[TTRICustomRecurrenceTableViewCell setSelectionStyle:](v7, "setSelectionStyle:", 0);
      goto LABEL_4;
    case 1:
      v7 = self->_frequencySummaryCell;
LABEL_7:
      -[TTRICustomRecurrenceViewController _stringForFrequency:](self, "_stringForFrequency:", self->_cachedFrequency);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TTRICustomRecurrenceTableViewCell detailTextLabel](v7, "detailTextLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3:
      v7 = self->_intervalSummaryCell;
LABEL_9:
      -[TTRICustomRecurrenceViewController _stringForFrequency:interval:](self, "_stringForFrequency:interval:", self->_cachedFrequency, self->_cachedInterval);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TTRICustomRecurrenceTableViewCell detailTextLabel](v7, "detailTextLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setText:", v19);

      -[TTRICustomRecurrenceViewController _localizedEveryStringForFrequency:interval:](self, "_localizedEveryStringForFrequency:interval:", self->_cachedFrequency, self->_cachedInterval);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TTRICustomRecurrenceTableViewCell textLabel](v7, "textLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v21 = v18;
      objc_msgSend(v18, "setText:", v17);

      goto LABEL_14;
    case 6:
      -[TTRICustomRecurrenceViewController yearlyOrdinalChooser](self, "yearlyOrdinalChooser");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 7:
      -[TTRICustomRecurrenceViewController currentChooser](self, "currentChooser");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v17 = v22;
      objc_msgSend(v22, "cellForRow:", objc_msgSend(v5, "row"));
      v7 = (TTRICustomRecurrenceTableViewCell *)objc_claimAutoreleasedReturnValue();
LABEL_14:

      break;
    default:
      v7 = 0;
LABEL_4:
      switch(v6)
      {
        case 1:
          goto LABEL_7;
        case 2:
          -[TTRICustomRecurrenceTableViewCell contentView](v7, "contentView");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addSubview:", self->_frequencyPickerView);

          -[TTRICustomRecurrenceTableViewCell contentView](v7, "contentView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)MEMORY[0x1E0CB3718];
          _NSDictionaryOfVariableBindings(CFSTR("_frequencyPickerView"), self->_frequencyPickerView, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_frequencyPickerView]|"), 0, 0, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addConstraints:", v12);

          -[TTRICustomRecurrenceTableViewCell contentView](v7, "contentView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)MEMORY[0x1E0CB3718];
          _NSDictionaryOfVariableBindings(CFSTR("_frequencyPickerView"), self->_frequencyPickerView, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_frequencyPickerView]|"), 0, 0, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addConstraints:", v16);

          -[UIPickerView selectRow:inComponent:animated:](self->_frequencyPickerView, "selectRow:inComponent:animated:", -[TTRICustomRecurrenceViewController _pickerRowForRecurrenceFrequency:](self, "_pickerRowForRecurrenceFrequency:", self->_cachedFrequency), 0, 0);
          break;
        case 3:
          goto LABEL_9;
        case 4:
          -[TTRICustomRecurrenceViewController intervalPickerViewController](self, "intervalPickerViewController");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "view");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[TTRICustomRecurrenceTableViewCell contentView](v7, "contentView");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addSubview:", v28);

          -[TTRICustomRecurrenceTableViewCell contentView](v7, "contentView");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)MEMORY[0x1E0CB3718];
          _NSDictionaryOfVariableBindings(CFSTR("pickerView"), v28, 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[pickerView]|"), 0, 0, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addConstraints:", v33);

          -[TTRICustomRecurrenceTableViewCell contentView](v7, "contentView");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)MEMORY[0x1E0CB3718];
          _NSDictionaryOfVariableBindings(CFSTR("pickerView"), v28, 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[pickerView]|"), 0, 0, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addConstraints:", v37);

          cachedFrequency = self->_cachedFrequency;
          -[TTRICustomRecurrenceViewController intervalPickerViewController](self, "intervalPickerViewController");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setFrequency:", cachedFrequency);

          cachedInterval = self->_cachedInterval;
          -[TTRICustomRecurrenceViewController intervalPickerViewController](self, "intervalPickerViewController");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setInterval:", cachedInterval);

          if (-[TTRICustomRecurrenceViewController prohibitsYearlyRecurrenceInterval](self, "prohibitsYearlyRecurrenceInterval")&& self->_cachedFrequency == 3)
          {
            -[TTRICustomRecurrenceViewController intervalPickerViewController](self, "intervalPickerViewController");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = v42;
            v44 = 1;
          }
          else
          {
            -[TTRICustomRecurrenceViewController intervalPickerViewController](self, "intervalPickerViewController");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = v42;
            v44 = 0;
          }
          objc_msgSend(v42, "setMaximumInterval:", v44);

          break;
        case 5:
          RemindersUICoreBundleGet();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Days of Week"), CFSTR("Days of Week"), CFSTR("Localizable"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[TTRICustomRecurrenceTableViewCell textLabel](v7, "textLabel");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setText:", v25);

          -[TTRICustomRecurrenceTableViewCell setAccessoryView:](v7, "setAccessoryView:", self->_yearOrdinalSwitch);
          break;
        default:
          goto LABEL_15;
      }
      break;
  }
LABEL_15:

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  unint64_t v3;

  v3 = self->_cachedFrequency - 1;
  if (v3 > 2)
    return 1;
  else
    return qword_1B490F1A0[v3];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double v4;
  id v7;
  id v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;

  v7 = a3;
  v8 = a4;
  switch(-[TTRICustomRecurrenceViewController _tagForIndexPath:](self, "_tagForIndexPath:", v8))
  {
    case 0:
    case 1:
    case 3:
    case 5:
      objc_msgSend(v7, "rowHeight");
      v4 = v9;
      break;
    case 2:
      -[TTRICustomRecurrenceViewController frequencyPickerView](self, "frequencyPickerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
      v4 = v11;
      goto LABEL_8;
    case 4:
      -[TTRICustomRecurrenceViewController intervalPickerViewController](self, "intervalPickerViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
      v4 = v13;

      goto LABEL_8;
    case 6:
      -[TTRICustomRecurrenceViewController yearlyOrdinalChooser](self, "yearlyOrdinalChooser");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 7:
      -[TTRICustomRecurrenceViewController currentChooser](self, "currentChooser");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v10 = v14;
      objc_msgSend(v14, "heightForRow:", objc_msgSend(v8, "row"));
      v4 = v15;
LABEL_8:

      break;
    default:
      break;
  }

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
  int64_t v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v8, 1);
  v6 = -[TTRICustomRecurrenceViewController _tagForIndexPath:](self, "_tagForIndexPath:", v8);
  if (v6 == 1 || v6 == 3)
  {
    -[TTRICustomRecurrenceViewController _toggleInlineSpinnerForTag:](self, "_toggleInlineSpinnerForTag:", v6);
  }
  else if (v6 == 7)
  {
    -[TTRICustomRecurrenceViewController currentChooser](self, "currentChooser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rowTapped:", objc_msgSend(v8, "row"));

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
    -[TTRICustomRecurrenceViewController recurrenceSummaryString](self, "recurrenceSummaryString", a3, v4, v5);
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
    && (-[TTRICustomRecurrenceViewController currentChooser](self, "currentChooser"),
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

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[TTRICustomRecurrenceViewController _availableRecurrenceFrequencies](self, "_availableRecurrenceFrequencies", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  return -[TTRICustomRecurrenceViewController _stringForFrequency:](self, "_stringForFrequency:", -[TTRICustomRecurrenceViewController _recurrenceFrequencyForPickerRow:](self, "_recurrenceFrequencyForPickerRow:", a4));
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  int64_t v6;

  v6 = -[TTRICustomRecurrenceViewController _recurrenceFrequencyForPickerRow:](self, "_recurrenceFrequencyForPickerRow:", a4);
  if (self->_cachedFrequency != v6)
  {
    self->_cachedFrequency = v6;
    -[TTRICustomRecurrenceViewController _frequencyPickerViewUpdated](self, "_frequencyPickerViewUpdated");
    -[TTRICustomRecurrenceViewController _updateIntervalPicker](self, "_updateIntervalPicker");
  }
}

- (id)pickerView:(id)a3 accessibilityLabelForComponent:(int64_t)a4
{
  void *v4;
  void *v5;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    RemindersUICoreBundleGet();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Frequency Option"), CFSTR("Frequency Option"), CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (int64_t)_pickerRowForRecurrenceFrequency:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[TTRICustomRecurrenceViewController _availableRecurrenceFrequencies](self, "_availableRecurrenceFrequencies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return v6;
}

- (int64_t)_recurrenceFrequencyForPickerRow:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[TTRICustomRecurrenceViewController _availableRecurrenceFrequencies](self, "_availableRecurrenceFrequencies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (id)_availableRecurrenceFrequencies
{
  void *v3;
  void *v4;

  -[TTRICustomRecurrenceViewController cachedAvailableRecurrenceFrequencies](self, "cachedAvailableRecurrenceFrequencies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
    if (!-[TTRICustomRecurrenceViewController prohibitsHourlyRecurrence](self, "prohibitsHourlyRecurrence"))
      objc_msgSend(v4, "addObject:", &unk_1E67F4370);
    objc_msgSend(v4, "addObject:", &unk_1E67F4388);
    objc_msgSend(v4, "addObject:", &unk_1E67F43A0);
    objc_msgSend(v4, "addObject:", &unk_1E67F43B8);
    objc_msgSend(v4, "addObject:", &unk_1E67F43D0);
    -[TTRICustomRecurrenceViewController setCachedAvailableRecurrenceFrequencies:](self, "setCachedAvailableRecurrenceFrequencies:", v4);

  }
  return -[TTRICustomRecurrenceViewController cachedAvailableRecurrenceFrequencies](self, "cachedAvailableRecurrenceFrequencies");
}

- (void)recurrenceChooserUpdated:(id)a3
{
  -[TTRICustomRecurrenceViewController _updateRecurrenceRule](self, "_updateRecurrenceRule", a3);
  -[TTRICustomRecurrenceViewController _collapseAllPickers](self, "_collapseAllPickers");
}

- (void)recurrenceChooserWantsReload:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__TTRICustomRecurrenceViewController_recurrenceChooserWantsReload___block_invoke;
  v3[3] = &unk_1E6783C20;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
}

void __67__TTRICustomRecurrenceViewController_recurrenceChooserWantsReload___block_invoke(uint64_t a1)
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
  v4[2] = __71__TTRICustomRecurrenceViewController_recurrenceChooser_wantsRowReload___block_invoke;
  v4[3] = &unk_1E6783C70;
  v4[4] = self;
  v4[5] = a4;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v4);
}

void __71__TTRICustomRecurrenceViewController_recurrenceChooser_wantsRowReload___block_invoke(uint64_t a1)
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

- (void)_updateRecurrenceRule
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
  -[TTRICustomRecurrenceViewController currentChooser](self, "currentChooser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    cachedFrequency = objc_msgSend(v5, "frequency");
    objc_msgSend(v6, "updateRecurrenceRuleBuilder:", v11);
  }
  objc_msgSend(v11, "setFrequency:", cachedFrequency);
  objc_msgSend(v11, "setInterval:", cachedInterval);
  -[TTRICustomRecurrenceViewController yearlyChooser](self, "yearlyChooser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != v7)
    goto LABEL_6;
  -[TTRICustomRecurrenceViewController yearOrdinalSwitch](self, "yearOrdinalSwitch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isOn");

  if (v9)
  {
    -[TTRICustomRecurrenceViewController yearlyOrdinalChooser](self, "yearlyOrdinalChooser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateRecurrenceRuleBuilder:", v11);
LABEL_6:

  }
  objc_msgSend(v11, "recurrenceRuleWithFirstDayOfTheWeek:", -[REMRecurrenceRule firstDayOfTheWeek](self->_cachedRecurrenceRule, "firstDayOfTheWeek"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRICustomRecurrenceViewController setRecurrenceRule:shouldUpdatePickers:](self, "setRecurrenceRule:shouldUpdatePickers:", v10, 0);

}

- (id)recurrenceRule
{
  REMRecurrenceRule *cachedRecurrenceRule;

  cachedRecurrenceRule = self->_cachedRecurrenceRule;
  if (!cachedRecurrenceRule)
  {
    -[TTRICustomRecurrenceViewController _updateRecurrenceRule](self, "_updateRecurrenceRule");
    cachedRecurrenceRule = self->_cachedRecurrenceRule;
  }
  return cachedRecurrenceRule;
}

- (void)setRecurrenceRule:(id)a3
{
  -[TTRICustomRecurrenceViewController setRecurrenceRule:shouldUpdatePickers:](self, "setRecurrenceRule:shouldUpdatePickers:", a3, 1);
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
      -[TTRICustomRecurrenceViewController _updateSummaryLabel](self, "_updateSummaryLabel");
      v7 = v8;
    }
    if (v4)
    {
      -[TTRICustomRecurrenceViewController _refreshCacheAndPickers](self, "_refreshCacheAndPickers");
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
  -[TTRICustomRecurrenceViewController _updateCustomPickerView](self, "_updateCustomPickerView");
  if (-[REMRecurrenceRule frequency](self->_cachedRecurrenceRule, "frequency") == 3)
  {
    -[TTRICustomRecurrenceViewController yearOrdinalSwitch](self, "yearOrdinalSwitch");
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

  -[TTRICustomRecurrenceViewController monthlyChooser](self, "monthlyChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "prohibitsMultipleDaysInMonthlyRecurrence");

  return v3;
}

- (void)setProhibitsMultipleDaysInMonthlyRecurrence:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TTRICustomRecurrenceViewController monthlyChooser](self, "monthlyChooser");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProhibitsMultipleDaysInMonthlyRecurrence:", v3);

}

- (BOOL)prohibitsMultipleMonthsInYearlyRecurrence
{
  void *v2;
  char v3;

  -[TTRICustomRecurrenceViewController yearlyChooser](self, "yearlyChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "prohibitsMultipleMonthsInYearlyRecurrence");

  return v3;
}

- (void)setProhibitsMultipleMonthsInYearlyRecurrence:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TTRICustomRecurrenceViewController yearlyChooser](self, "yearlyChooser");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProhibitsMultipleMonthsInYearlyRecurrence:", v3);

}

- (void)_updateSummaryLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = (void *)MEMORY[0x1E0D845D8];
  -[TTRICustomRecurrenceViewController recurrenceRule](self, "recurrenceRule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRICustomRecurrenceViewController startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "naturalLanguageDescriptionForRecurrenceRule:withStartDate:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRICustomRecurrenceViewController setRecurrenceSummaryString:](self, "setRecurrenceSummaryString:", v6);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__TTRICustomRecurrenceViewController__updateSummaryLabel__block_invoke;
  v7[3] = &unk_1E6783C20;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v7);
}

void __57__TTRICustomRecurrenceViewController__updateSummaryLabel__block_invoke(uint64_t a1)
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

  -[TTRICustomRecurrenceViewController currentChooser](self, "currentChooser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "frequency");

  -[TTRICustomRecurrenceViewController _chooserForFrequency:](self, "_chooserForFrequency:", self->_cachedFrequency);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRICustomRecurrenceViewController setCurrentChooser:](self, "setCurrentChooser:", v5);

  -[TTRICustomRecurrenceViewController currentChooser](self, "currentChooser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "frequency");

  -[TTRICustomRecurrenceViewController currentChooser](self, "currentChooser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateFromRecurrenceRule:", self->_cachedRecurrenceRule);

  -[TTRICustomRecurrenceViewController _updateTableSectionsFromFrequency:toFrequency:](self, "_updateTableSectionsFromFrequency:toFrequency:", v4, v7);
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
  void *v15;
  char v16;
  _QWORD v17[5];

  -[TTRICustomRecurrenceViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginUpdates");

  if (a3 == 3 || a4 != 3)
  {
    if (a3 == 3 && a4 != 3)
    {
      -[TTRICustomRecurrenceViewController tableView](self, "tableView");
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
    -[TTRICustomRecurrenceViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertSections:withRowAnimation:", v9, 6);

  }
  v10 = a4 != 0;
  if (!a3 && a4)
  {
    -[TTRICustomRecurrenceViewController tableView](self, "tableView");
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
    -[TTRICustomRecurrenceViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deleteSections:withRowAnimation:", v12, 6);
    goto LABEL_13;
  }
  v16 = !v10;
  if (a3 == a4)
    v16 = 1;
  if ((v16 & 1) == 0)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __84__TTRICustomRecurrenceViewController__updateTableSectionsFromFrequency_toFrequency___block_invoke;
    v17[3] = &unk_1E6783C20;
    v17[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v17);
  }
LABEL_14:
  -[TTRICustomRecurrenceViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endUpdates");

  -[TTRICustomRecurrenceViewController calculatePreferredContentSize](self, "calculatePreferredContentSize");
  -[TTRICustomRecurrenceViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

void __84__TTRICustomRecurrenceViewController__updateTableSectionsFromFrequency_toFrequency___block_invoke(uint64_t a1)
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
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_showingFrequencyPicker)
    v4 = 2;
  else
    v4 = 1;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRICustomRecurrenceViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v7, 5);

}

- (void)_frequencyPickerViewUpdated
{
  -[TTRICustomRecurrenceViewController _updateCustomPickerView](self, "_updateCustomPickerView");
  -[TTRICustomRecurrenceViewController _updateRecurrenceRule](self, "_updateRecurrenceRule");
  -[TTRICustomRecurrenceViewController _updateFrequencyRows](self, "_updateFrequencyRows");
}

- (void)_updateIntervalPicker
{
  int64_t cachedFrequency;
  void *v4;
  int64_t cachedInterval;
  id v6;

  cachedFrequency = self->_cachedFrequency;
  -[TTRICustomRecurrenceViewController intervalPickerViewController](self, "intervalPickerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFrequency:", cachedFrequency);

  cachedInterval = self->_cachedInterval;
  -[TTRICustomRecurrenceViewController intervalPickerViewController](self, "intervalPickerViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInterval:", cachedInterval);

}

- (id)_chooserForFrequency:(int64_t)a3
{
  void *v3;

  switch(a3)
  {
    case 3:
      -[TTRICustomRecurrenceViewController yearlyChooser](self, "yearlyChooser");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[TTRICustomRecurrenceViewController monthlyChooser](self, "monthlyChooser");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[TTRICustomRecurrenceViewController weeklyChooser](self, "weeklyChooser");
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
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB36B0];
  v5 = a3;
  objc_msgSend(v4, "indexPathForRow:inSection:", 1, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isOn");

  -[TTRICustomRecurrenceViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertRowsAtIndexPaths:withRowAnimation:", v9, 6);

    -[TTRICustomRecurrenceViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scrollToRowAtIndexPath:atScrollPosition:animated:", v6, 3, 1);
  }
  else
  {
    v11 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteRowsAtIndexPaths:withRowAnimation:", v10, 6);

  }
  -[TTRICustomRecurrenceViewController _collapseAllPickers](self, "_collapseAllPickers");
  -[TTRICustomRecurrenceViewController _updateRecurrenceRule](self, "_updateRecurrenceRule");
  -[TTRICustomRecurrenceViewController calculatePreferredContentSize](self, "calculatePreferredContentSize");
  -[TTRICustomRecurrenceViewController setPreferredContentSize:](self, "setPreferredContentSize:");

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
      v7 = CFSTR("%d days (every)");
      goto LABEL_8;
    case 1:
      RemindersUICoreBundleGet();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("%d weeks (every)");
      goto LABEL_8;
    case 2:
      RemindersUICoreBundleGet();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("%d months (every)");
      goto LABEL_8;
    case 3:
      RemindersUICoreBundleGet();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("%d years (every)");
      goto LABEL_8;
    case 4:
      RemindersUICoreBundleGet();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("%d hours (every)");
LABEL_8:
      objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E67C7538, CFSTR("PluralLocalizable"));
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

- (int64_t)_tagForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  v6 = objc_msgSend(v4, "section");

  if (v6 == 2)
  {
    if (self->_cachedFrequency == 3)
    {
      if (v5)
        return 6;
      else
        return 5;
    }
    return 0;
  }
  if (v6 == 1)
    return 7;
  if (v6)
    return 0;
  if (!v5)
    return 1;
  if (v5 == 2)
  {
    if (self->_showingIntervalPicker)
      return 4;
  }
  else if (v5 == 1 && self->_showingFrequencyPicker)
  {
    return 2;
  }
  return 3;
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
      -[TTRICustomRecurrenceViewController yearOrdinalSwitch](self, "yearOrdinalSwitch");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isOn"))
        v3 = 2;
      else
        v3 = 1;

      return v3;
    }
    return 0;
  }
  if (a3 == 1)
  {
    -[TTRICustomRecurrenceViewController currentChooser](self, "currentChooser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfRows");

    return v5;
  }
  if (a3)
    return 0;
  return self->_showingIntervalPicker + (unint64_t)self->_showingFrequencyPicker + 2;
}

- (void)_toggleInlineSpinnerForTag:(int64_t)a3
{
  void *v5;
  void *v6;

  -[TTRICustomRecurrenceViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginUpdates");

  if (a3 == 3)
  {
    -[TTRICustomRecurrenceViewController _setShowingIntervalPicker:](self, "_setShowingIntervalPicker:", !self->_showingIntervalPicker);
  }
  else if (a3 == 1)
  {
    -[TTRICustomRecurrenceViewController _setShowingFrequencyPicker:](self, "_setShowingFrequencyPicker:", !self->_showingFrequencyPicker);
  }
  -[TTRICustomRecurrenceViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endUpdates");

  -[TTRICustomRecurrenceViewController calculatePreferredContentSize](self, "calculatePreferredContentSize");
  -[TTRICustomRecurrenceViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)_collapseAllPickers
{
  -[TTRICustomRecurrenceViewController _setShowingFrequencyPicker:](self, "_setShowingFrequencyPicker:", 0);
  -[TTRICustomRecurrenceViewController _setShowingIntervalPicker:](self, "_setShowingIntervalPicker:", 0);
}

- (void)_setShowingFrequencyPicker:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL4 showingFrequencyPicker;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (self->_showingFrequencyPicker == a3)
    return;
  v3 = a3;
  self->_showingFrequencyPicker = a3;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  showingFrequencyPicker = self->_showingFrequencyPicker;
  -[TTRICustomRecurrenceViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!showingFrequencyPicker)
  {
    v11 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteRowsAtIndexPaths:withRowAnimation:", v8, 6);

    if (v3)
      goto LABEL_4;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGrayTextColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertRowsAtIndexPaths:withRowAnimation:", v8, 6);

  -[TTRICustomRecurrenceViewController _setShowingIntervalPicker:](self, "_setShowingIntervalPicker:", 0);
  if (!v3)
    goto LABEL_6;
LABEL_4:
  -[TTRICustomRecurrenceViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  -[UITableViewCell detailTextLabel](self->_frequencySummaryCell, "detailTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v9);

  if (v3)
  {

    v9 = v8;
  }

  -[TTRICustomRecurrenceViewController calculatePreferredContentSize](self, "calculatePreferredContentSize");
  -[TTRICustomRecurrenceViewController setPreferredContentSize:](self, "setPreferredContentSize:");

}

- (void)_setShowingIntervalPicker:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL4 showingIntervalPicker;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (self->_showingIntervalPicker == a3)
    return;
  v3 = a3;
  self->_showingIntervalPicker = a3;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  showingIntervalPicker = self->_showingIntervalPicker;
  -[TTRICustomRecurrenceViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!showingIntervalPicker)
  {
    v11 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteRowsAtIndexPaths:withRowAnimation:", v8, 6);

    if (v3)
      goto LABEL_4;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGrayTextColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertRowsAtIndexPaths:withRowAnimation:", v8, 6);

  -[TTRICustomRecurrenceViewController _setShowingFrequencyPicker:](self, "_setShowingFrequencyPicker:", 0);
  if (!v3)
    goto LABEL_6;
LABEL_4:
  -[TTRICustomRecurrenceViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  -[UITableViewCell detailTextLabel](self->_intervalSummaryCell, "detailTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v9);

  if (v3)
  {

    v9 = v8;
  }

  -[TTRICustomRecurrenceViewController calculatePreferredContentSize](self, "calculatePreferredContentSize");
  -[TTRICustomRecurrenceViewController setPreferredContentSize:](self, "setPreferredContentSize:");

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
  return objc_getProperty(self, a2, 1024, 1);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1024);
}

- (UITableView)tableView
{
  return (UITableView *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setTableView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
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
  return (TTRIRecurrenceWeekdayChooserController *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setWeeklyChooser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (TTRIRecurrenceMonthlyChooserController)monthlyChooser
{
  return (TTRIRecurrenceMonthlyChooserController *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setMonthlyChooser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1056);
}

- (TTRIRecurrenceMonthChooserController)yearlyChooser
{
  return (TTRIRecurrenceMonthChooserController *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setYearlyChooser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (TTRIRecurrenceOrdinalChooserController)yearlyOrdinalChooser
{
  return (TTRIRecurrenceOrdinalChooserController *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setYearlyOrdinalChooser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1080);
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- (UIPickerView)frequencyPickerView
{
  return (UIPickerView *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setFrequencyPickerView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1096);
}

- (TTRICustomRecurrenceIntervalViewController)intervalPickerViewController
{
  return (TTRICustomRecurrenceIntervalViewController *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setIntervalPickerViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (UISwitch)yearOrdinalSwitch
{
  return (UISwitch *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setYearOrdinalSwitch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1112);
}

- (NSString)recurrenceSummaryString
{
  return (NSString *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setRecurrenceSummaryString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1120);
}

- (NSArray)cachedAvailableRecurrenceFrequencies
{
  return (NSArray *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setCachedAvailableRecurrenceFrequencies:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAvailableRecurrenceFrequencies, 0);
  objc_storeStrong((id *)&self->_recurrenceSummaryString, 0);
  objc_storeStrong((id *)&self->_yearOrdinalSwitch, 0);
  objc_storeStrong((id *)&self->_intervalPickerViewController, 0);
  objc_storeStrong((id *)&self->_frequencyPickerView, 0);
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
