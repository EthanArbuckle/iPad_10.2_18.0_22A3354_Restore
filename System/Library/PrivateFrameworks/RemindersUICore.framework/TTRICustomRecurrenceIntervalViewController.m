@implementation TTRICustomRecurrenceIntervalViewController

- (TTRICustomRecurrenceIntervalViewController)initWithSelectedInterval:(int64_t)a3 frequency:(int64_t)a4 changeBlock:(id)a5
{
  id v8;
  TTRICustomRecurrenceIntervalViewController *v9;
  TTRICustomRecurrenceIntervalViewController *v10;
  void *v11;
  id changeBlock;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TTRICustomRecurrenceIntervalViewController;
  v9 = -[TTRICustomRecurrenceIntervalViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    v9->_frequency = a4;
    v9->_interval = a3;
    v11 = _Block_copy(v8);
    changeBlock = v10->_changeBlock;
    v10->_changeBlock = v11;

  }
  return v10;
}

- (void)loadView
{
  id v3;

  -[TTRICustomRecurrenceIntervalViewController pickerView](self, "pickerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[TTRICustomRecurrenceIntervalViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TTRICustomRecurrenceIntervalViewController;
  -[TTRICustomRecurrenceIntervalViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[TTRICustomRecurrenceIntervalViewController pickerView](self, "pickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setHostsLayoutEngine:", 0);

}

- (id)pickerView
{
  UIPickerView *pickerView;
  UIPickerView *v4;
  UIPickerView *v5;

  pickerView = self->_pickerView;
  if (!pickerView)
  {
    v4 = (UIPickerView *)objc_opt_new();
    v5 = self->_pickerView;
    self->_pickerView = v4;

    -[UIPickerView setDelegate:](self->_pickerView, "setDelegate:", self);
    -[UIPickerView setDataSource:](self->_pickerView, "setDataSource:", self);
    pickerView = self->_pickerView;
  }
  return pickerView;
}

- (void)setFrequency:(int64_t)a3
{
  if (self->_frequency != a3)
  {
    self->_frequency = a3;
    -[UIPickerView reloadComponent:](self->_pickerView, "reloadComponent:", 1);
  }
}

- (void)setInterval:(int64_t)a3
{
  if (self->_interval != a3)
  {
    self->_interval = a3;
    -[UIPickerView selectRow:inComponent:animated:](self->_pickerView, "selectRow:inComponent:animated:", a3 - 1, 0, 0);
  }
}

- (void)setMaximumInterval:(BOOL)a3
{
  int64_t v4;
  _BOOL8 maximumInterval;

  if (self->_maximumInterval != a3)
  {
    self->_maximumInterval = a3;
    v4 = -[TTRICustomRecurrenceIntervalViewController interval](self, "interval");
    -[UIPickerView reloadComponent:](self->_pickerView, "reloadComponent:", 0);
    if (-[TTRICustomRecurrenceIntervalViewController interval](self, "interval") <= self->_maximumInterval)
      maximumInterval = v4;
    else
      maximumInterval = self->_maximumInterval;
    -[TTRICustomRecurrenceIntervalViewController setInterval:](self, "setInterval:", maximumInterval);
  }
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 2;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  if (a4)
    return 1;
  if (-[TTRICustomRecurrenceIntervalViewController maximumInterval](self, "maximumInterval", a3))
    return -[TTRICustomRecurrenceIntervalViewController maximumInterval](self, "maximumInterval");
  return 999;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v7 = a3;
  v8 = v7;
  if (a5 == 1)
  {
    -[TTRICustomRecurrenceIntervalViewController _pickerViewFrequencyTitleForUnit:](self, "_pickerViewFrequencyTitleForUnit:", objc_msgSend(v7, "selectedRowInComponent:", 0) + 1);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a5)
    {
      v10 = 0;
      goto LABEL_7;
    }
    CUIKLocalizedStringForInteger();
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_7:

  return v10;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  uint64_t v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;

  v10 = a3;
  v7 = objc_msgSend(v10, "selectedRowInComponent:", 1);
  v8 = objc_msgSend(v10, "selectedRowInComponent:", 0) + 1;
  -[TTRICustomRecurrenceIntervalViewController changeBlock](self, "changeBlock");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v9[2](v9, v8, v7);

  if (!a5)
    objc_msgSend(v10, "reloadComponent:", 1);

}

- (id)pickerView:(id)a3 accessibilityLabelForComponent:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  if (a4 == 1)
  {
    RemindersUICoreBundleGet();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Unit"), CFSTR("Unit"), CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v11 = 0;
      goto LABEL_7;
    }
    -[TTRICustomRecurrenceIntervalViewController _pickerViewFrequencyTitleForUnit:](self, "_pickerViewFrequencyTitleForUnit:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    RemindersUICoreBundleGet();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Number of %@"), CFSTR("Number of %@"), CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:

  return v11;
}

- (id)_pickerViewFrequencyTitleForUnit:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  switch(self->_frequency)
  {
    case 0:
      v4 = (void *)MEMORY[0x1E0CB3940];
      RemindersUICoreBundleGet();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("CUSTOM_RECURRENCE_INTERVAL_LABEL_DAYS");
      v8 = CFSTR("Days");
      goto LABEL_7;
    case 1:
      v4 = (void *)MEMORY[0x1E0CB3940];
      RemindersUICoreBundleGet();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("CUSTOM_RECURRENCE_INTERVAL_LABEL_WEEKS");
      v8 = CFSTR("Weeks");
      goto LABEL_7;
    case 2:
      v4 = (void *)MEMORY[0x1E0CB3940];
      RemindersUICoreBundleGet();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("CUSTOM_RECURRENCE_INTERVAL_LABEL_MONTHS");
      v8 = CFSTR("Months");
      goto LABEL_7;
    case 3:
      v4 = (void *)MEMORY[0x1E0CB3940];
      RemindersUICoreBundleGet();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("CUSTOM_RECURRENCE_INTERVAL_LABEL_YEARS");
      v8 = CFSTR("Years");
      goto LABEL_7;
    case 4:
      v4 = (void *)MEMORY[0x1E0CB3940];
      RemindersUICoreBundleGet();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("CUSTOM_RECURRENCE_INTERVAL_LABEL_HOURS");
      v8 = CFSTR("Hours");
LABEL_7:
      objc_msgSend(v5, "localizedStringForKey:value:table:", v7, v8, CFSTR("PluralLocalizable"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringWithFormat:", v9, a3);
      a3 = objc_claimAutoreleasedReturnValue();

      break;
    default:
      return (id)a3;
  }
  return (id)a3;
}

- (int64_t)frequency
{
  return self->_frequency;
}

- (int64_t)interval
{
  return self->_interval;
}

- (BOOL)maximumInterval
{
  return self->_maximumInterval;
}

- (id)changeBlock
{
  return objc_getProperty(self, a2, 1000, 1);
}

- (void)setChangeBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1000);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeBlock, 0);
  objc_storeStrong((id *)&self->_pickerView, 0);
}

@end
